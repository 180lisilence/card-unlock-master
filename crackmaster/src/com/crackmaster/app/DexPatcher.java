package com.crackmaster.app;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.Adler32;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * DEX 字节码补丁器 —— 无需 smali/baksmali，直接对 dex 结构做手术。
 *
 * 原理（针对 com.license.verify2.LicenseVerify）：
 *   把 isValid / verifyInternal / isExpired 三个方法的 code_item 指令区
 *   覆写为两句话：
 *       const/4 v0, 0x1   (12 10)
 *       return v0         (0f 00)
 *   并清零 tries_size 与 debug_info_off，剩余指令槽填 nop（保持 insns_size 与 4 字节对齐不变），
 *   最后重算 dex 的 SHA-1 签名和 Adler32 校验和。
 *
 * 效果：任何卡密都判定通过、授权永久有效，GateGuard 门卫循环与
 * VerifyActivity 的 isValid() 检查同时失效，点击应用直达原启动页。
 */
public final class DexPatcher {

    /** 默认目标类（可通过 setTargetClass 改）。 */
    public static String targetClass = "Lcom/license/verify2/LicenseVerify;";
    /** 默认修补的方法名（可通过 setPatchMethods 定制）。 */
    public static String[] patchMethods = {"isValid", "verifyInternal", "isExpired"};

    private static final Charset UTF8 = Charset.forName("UTF-8");

    public static class Result {
        public boolean foundClass;
        public final List<String> patchedMethods = new ArrayList<String>();
        public int noCodeMethods;

        public String summary() {
            return "foundClass=" + foundClass + ", patched=" + patchedMethods + ", noCode=" + noCodeMethods;
        }
    }

    private DexPatcher() {}

    public static void setTargetClass(String desc) { targetClass = desc; }

    public static void setPatchMethods(String[] methods) { patchMethods = methods; }

    // ---------------- 小端读写 ----------------
    private static int u16(byte[] b, int o) { return (b[o] & 0xff) | ((b[o + 1] & 0xff) << 8); }
    private static long u32(byte[] b, int o) {
        return (b[o] & 0xffL) | ((b[o + 1] & 0xffL) << 8) | ((b[o + 2] & 0xffL) << 16) | ((b[o + 3] & 0xffL) << 24);
    }
    private static void p16(byte[] b, int o, int v) { b[o] = (byte) v; b[o + 1] = (byte) (v >> 8); }
    private static void p32(byte[] b, int o, long v) {
        b[o] = (byte) v; b[o + 1] = (byte) (v >> 8); b[o + 2] = (byte) (v >> 16); b[o + 3] = (byte) (v >> 24);
    }

    private static int readUleb128(byte[] b, int[] pos) {
        int result = 0, shift = 0;
        int i = pos[0];
        while (true) {
            int c = b[i++] & 0xff;
            result |= (c & 0x7f) << shift;
            if ((c & 0x80) == 0) break;
            shift += 7;
            if (shift > 28) throw new IllegalStateException("uleb128 过长");
        }
        pos[0] = i;
        return result;
    }

    private static String stringAt(byte[] dex, int strIdx) {
        long idsOff = u32(dex, 0x3C);
        long itemOff = u32(dex, (int) (idsOff + (long) strIdx * 4));
        int[] pos = new int[]{(int) itemOff};
        readUleb128(dex, pos); // utf16 长度，跳过
        int s = pos[0], e = s;
        while (e < dex.length && dex[e] != 0) e++;
        return new String(dex, s, e - s, UTF8);
    }

    private static String typeAt(byte[] dex, int typeIdx) {
        long off = u32(dex, 0x44) + (long) typeIdx * 4;
        return stringAt(dex, (int) u32(dex, (int) off));
    }

    private static String methodNameAt(byte[] dex, int methodIdx) {
        long off = u32(dex, 0x5C) + (long) methodIdx * 8;
        int nameIdx = (int) u32(dex, (int) off + 4);
        return stringAt(dex, nameIdx);
    }

    // ---------------- 补丁核心 ----------------

    /**
     * 覆写一个 code_item：const/4 v0, 0x1 ; return v0，其余槽位填 nop。
     *
     * <p><b>关键：绝不能缩短 insns_size。</b>dex 的 data 区中所有 code_item 按偏移顺序排列并要求
     * 4 字节对齐，dexdump / ART 校验器会顺序遍历推导每个 code_item 的边界。一旦把
     * insns_size 从 22 改成 2，后续 code_item 就失去对齐，校验立即失败：
     * <pre>Failure to verify dex file: outs_size (4206d) &gt; registers_size (33d)</pre>
     * 因此保持 insns_size 原值，用 nop(0x0000) 填满剩余槽位，既保证对齐又让首条return 生效。
     */
    private static void patchCodeItem(byte[] dex, int codeOff) {
        int insnsSize = (int) u32(dex, codeOff + 12);
        p16(dex, codeOff + 6, 0);        // tries_size = 0（丢弃 try 表，异常路径已不可达）
        p32(dex, codeOff + 8, 0);        // debug_info_off = 0
        // insns_size 保持原值 —— 不改动，保证 code_item 长度与 4 字节对齐不变
        p16(dex, codeOff + 16, 0x1012);  // const/4 v0, #int 1
        p16(dex, codeOff + 18, 0x000F);  // return v0
        for (int i = 2; i < insnsSize; i++) {
            p16(dex, codeOff + 16 + i * 2, 0x0000); // nop
        }
    }

    /**
     * 对 dex 字节数组执行修补（原地修改）。
     *
     * @param dex    dex 文件字节
     * @param log    可空日志
     * @return 修补结果
     */
    public static Result patch(byte[] dex, Log log) throws IOException {
        Result r = new Result();
        if (dex == null || dex.length < 0x70 || dex[0] != 'd' || dex[1] != 'e' || dex[2] != 'x') {
            throw new IOException("不是有效的 dex 文件");
        }
        int classDefsSize = (int) u32(dex, 0x60);
        int classDefsOff = (int) u32(dex, 0x64);

        for (int ci = 0; ci < classDefsSize; ci++) {
            int cdOff = classDefsOff + ci * 32;
            int classIdx = (int) u32(dex, cdOff);
            if (!targetClass.equals(typeAt(dex, classIdx))) continue;
            r.foundClass = true;
            int classDataOff = (int) u32(dex, cdOff + 24);
            if (classDataOff == 0) break;

            // class_data_item: [static_fields_size][instance_fields_size][direct_methods_size][virtual_methods_size]
            // 随后是 static/instance encoded_field 数组，最后是 encoded_method 数组
            int[] pos = new int[]{classDataOff};
            int sfCount = readUleb128(dex, pos);
            int infCount = readUleb128(dex, pos);
            int directCount = readUleb128(dex, pos);
            int virtualCount = readUleb128(dex, pos);
            for (int i = 0; i < sfCount; i++) { readUleb128(dex, pos); readUleb128(dex, pos); }
            for (int i = 0; i < infCount; i++) { readUleb128(dex, pos); readUleb128(dex, pos); }

            // direct methods
            int methodIdx = 0;
            for (int i = 0; i < directCount; i++) {
                methodIdx += readUleb128(dex, pos);
                readUleb128(dex, pos); // access_flags
                int codeOff = readUleb128(dex, pos);
                handleMethod(dex, methodIdx, codeOff, r, log);
            }
            // virtual methods
            methodIdx = 0;
            for (int i = 0; i < virtualCount; i++) {
                methodIdx += readUleb128(dex, pos);
                readUleb128(dex, pos);
                int codeOff = readUleb128(dex, pos);
                handleMethod(dex, methodIdx, codeOff, r, log);
            }
            break; // 目标类唯一
        }

        if (!r.foundClass) {
            if (log != null) log.log("  [dex] 未找到目标类 " + targetClass + "，跳过");
            return r;
        }
        if (r.patchedMethods.isEmpty()) {
            throw new IOException("找到目标类但未匹配到可修补方法: " + java.util.Arrays.toString(patchMethods));
        }

        // 重算 dex 签名与校验和
        byte[] sig;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            md.update(dex, 0x20, dex.length - 0x20);
            sig = md.digest();
        } catch (Exception e) {
            throw new IOException("SHA-1 重算失败: " + e);
        }
        System.arraycopy(sig, 0, dex, 0x0C, 20);
        Adler32 ad = new Adler32();
        ad.update(dex, 0x0C, dex.length - 0x0C);
        p32(dex, 0x08, (int) ad.getValue());
        if (log != null) log.log("  [dex] 签名/校验和已重算，修补方法: " + r.patchedMethods);
        return r;
    }

    private static void handleMethod(byte[] dex, int methodIdx, int codeOff, Result r, Log log) throws IOException {
        if (codeOff == 0) { r.noCodeMethods++; return; }
        String name = methodNameAt(dex, methodIdx);
        boolean match = false;
        for (String m : patchMethods) if (m.equals(name)) { match = true; break; }
        if (!match) return;
        if (codeOff + 20 > dex.length) throw new IOException("code_item 越界: " + name);
        int insnsSize = (int) u32(dex, codeOff + 12);
        if (insnsSize < 2 || codeOff + 16 + insnsSize * 2 > dex.length) {
            throw new IOException("code_item 指令区异常: " + name + " insns_size=" + insnsSize);
        }
        patchCodeItem(dex, codeOff);
        r.patchedMethods.add(name);
    }

    // ---------------- 便捷：从 APK 中找出含验证模块的 dex ----------------

    private static final byte[] NEEDLE = "Lcom/license/verify2/LicenseVerify;".getBytes(UTF8);

    /** 在字节数组中查找子串。 */
    public static int indexOf(byte[] hay, byte[] needle, int from) {
        outer:
        for (int i = from; i <= hay.length - needle.length; i++) {
            for (int j = 0; j < needle.length; j++) if (hay[i + j] != needle[j]) continue outer;
            return i;
        }
        return -1;
    }

    /** 扫描 APK 内所有 classes*.dex，返回包含目标类的 dex 条目名列表。 */
    public static List<String> findLicenseDexes(File apk) throws IOException {
        List<String> out = new ArrayList<String>();
        ZipFile zf = new ZipFile(apk);
        try {
            java.util.Enumeration<? extends ZipEntry> en = zf.entries();
            while (en.hasMoreElements()) {
                ZipEntry e = en.nextElement();
                String n = e.getName();
                if (e.isDirectory()) continue;
                if (!(n.startsWith("classes") && n.endsWith(".dex"))) continue;
                byte[] data = readAll(zf, e);
                if (indexOf(data, NEEDLE, 0) >= 0) out.add(n);
            }
        } finally {
            zf.close();
        }
        return out;
    }

    /** 读取 zip 条目全部字节。 */
    public static byte[] readAll(ZipFile zf, ZipEntry e) throws IOException {
        java.io.InputStream in = zf.getInputStream(e);
        try {
            ByteArrayOutputStream bos = new ByteArrayOutputStream((int) e.getSize() + 1024);
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) > 0) bos.write(buf, 0, n);
            return bos.toByteArray();
        } finally {
            in.close();
        }
    }

    /** 读文件全部字节。 */
    public static byte[] readFile(File f) throws IOException {
        RandomAccessFile raf = new RandomAccessFile(f, "r");
        try {
            byte[] b = new byte[(int) raf.length()];
            raf.readFully(b);
            return b;
        } finally {
            raf.close();
        }
    }

    public interface Log { void log(String s); }
}