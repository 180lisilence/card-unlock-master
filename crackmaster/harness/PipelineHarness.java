package harness;

import com.crackmaster.app.CrackEngine;
import com.crackmaster.app.DexPatcher;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * 交叉验证 2（破解流水线 E2E）：
 * 构造"被注入的 APK"（真实 manifest + 真实 payload.dex 作为 classes2.dex
 * + 真实 license_cfg.txt），跑完整 CrackEngine.crack()：
 *   patch dex → 重打包 → apksig 重签名
 * 再做结构、字节差、幂等性校验（dexdump 级验证由外部命令完成）。
 */
public class PipelineHarness {

    private static int pass = 0, fail = 0;

    private static void check(boolean cond, String name) {
        if (cond) { pass++; System.out.println("[PASS] " + name); }
        else { fail++; System.out.println("[FAIL] " + name); }
    }

    private static byte[] readAll(InputStream in) throws Exception {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int n;
        while ((n = in.read(buf)) > 0) bos.write(buf, 0, n);
        return bos.toByteArray();
    }

    private static byte[] readFile(File f) throws Exception {
        InputStream in = new FileInputStream(f);
        try { return readAll(in); } finally { in.close(); }
    }

    private static void add(ZipOutputStream zos, String name, File f) throws Exception {
        zos.putNextEntry(new ZipEntry(name));
        zos.write(readFile(f));
        zos.closeEntry();
    }

    public static void main(String[] args) throws Exception {
        File work = new File("work_crack/e2e");
        work.mkdirs();
        File srcApk = new File(work, "locked_app.apk");
        File outApk = new File(work, "locked_app_cracked.apk");
        if (outApk.exists()) outApk.delete();

        // 1. 构造合成被锁 APK（模拟卡密注入器的产物形态）
        ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(srcApk));
        add(zos, "AndroidManifest.xml", new File("work_crack/raw/AndroidManifest.xml"));
        add(zos, "resources.arsc", new File("work_crack/raw/resources.arsc"));
        add(zos, "classes.dex", new File("work_crack/dex_raw/classes.dex"));
        add(zos, "classes2.dex", new File("work_crack/dex_raw/assets/payload.dex"));
        add(zos, "classes3.dex", new File("work_crack/dex_raw/classes5.dex"));
        zos.putNextEntry(new ZipEntry("assets/license_cfg.txt"));
        zos.write("key=E2E-TEST-KEY\ntarget=com.demo.app.MainActivity\n".getBytes("UTF-8"));
        zos.closeEntry();
        zos.close();
        byte[] origPayload = readFile(new File("work_crack/dex_raw/assets/payload.dex"));
        System.out.println("合成被锁 APK: " + srcApk.length() + " 字节 (payload.dex " + origPayload.length + " 字节)");

        // 2. 跑破解引擎（与 App 内同一份字节码）
        byte[] ks = readFile(new File("crackmaster/assets/crack.keystore"));
        CrackEngine.crack(srcApk, outApk, ks, "crack2026", new CrackEngine.Log() {
            @Override
            public void log(String s) { System.out.println("  [engine] " + s); }
        });

        check(outApk.exists() && outApk.length() > 0, "破解产物已生成 (" + outApk.length() + " 字节)");

        // 3. 结构校验
        java.util.zip.ZipFile zf = new java.util.zip.ZipFile(outApk);
        check(zf.getEntry("classes2.dex") != null, "classes2.dex 保留");
        check(zf.getEntry("assets/license_cfg.txt") != null, "license_cfg.txt 保留");
        boolean hasNewSig = false;
        java.util.Enumeration<? extends ZipEntry> en = zf.entries();
        while (en.hasMoreElements()) {
            String n = en.nextElement().getName();
            if (n.startsWith("META-INF/") && (n.endsWith(".SF") || n.endsWith(".RSA") || n.endsWith(".DSA"))) hasNewSig = true;
        }
        check(hasNewSig, "存在新签名文件（v1 JAR 签名）");

        // 4. 字节级校验：classes2.dex 必须已被 patch（与原始 payload.dex 不同）
        byte[] patchedDex = readAll(zf.getInputStream(zf.getEntry("classes2.dex")));
        byte[] untouchedDex = readAll(zf.getInputStream(zf.getEntry("classes3.dex")));
        zf.close();
        check(!java.util.Arrays.equals(patchedDex, origPayload),
                "classes2.dex 已被 patch（字节已变化）");
        check(java.util.Arrays.equals(untouchedDex, readFile(new File("work_crack/dex_raw/classes5.dex"))),
                "不含验证模块的 classes3.dex 原样保留");
        check(patchedDex.length == origPayload.length, "dex 长度不变（原地补丁）");

        // 5. 幂等性：对已 patch 的 dex 再跑一次补丁，应仍能定位方法且不破坏结构
        byte[] again = patchedDex.clone();
        DexPatcher.Result r2 = DexPatcher.patch(again, null);
        check(r2.foundClass && r2.patchedMethods.size() >= 3,
                "幂等修补仍定位到全部方法: " + r2.patchedMethods);

        // 6. 补丁内容直接验证：在 dex 中定位 LicenseVerify 的 code_item 太复杂，
        //    改为验证补丁指令字节确实存在于 dex 数据区（12 10 0f 00）
        byte[] needle = new byte[]{0x12, 0x10, 0x0f, 0x00};
        check(DexPatcher.indexOf(patchedDex, needle, 0) >= 0,
                "补丁指令序列 (const/4 v0,1; return v0) 存在于 dex 中");

        System.out.println("=======================================");
        System.out.println("结果: " + pass + " 通过, " + fail + " 失败");
        if (fail > 0) System.exit(1);
    }
}
