package com.crackmaster.app;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * 被锁 APK 分析器：识别卡密模块位置、提取注入时写入的配置。
 */
public final class ApkAnalyzer {

    private static final Charset UTF8 = Charset.forName("UTF-8");
    private static final byte[] CLASS_NEEDLE = "Lcom/license/verify2/LicenseVerify;".getBytes(UTF8);
    private static final byte[] GATE_NEEDLE = toUtf16le("com.license.verify2.VerifyActivity");

    public static class Report {
        public List<String> licenseDexes = new ArrayList<String>();
        public List<String> allDexes = new ArrayList<String>();
        public String cfgKey;        // assets/license_cfg.txt 里的共享密钥
        public String cfgTarget;     // 原启动页
        public boolean hasGateInManifest;
        public long apkSize;
        public String manifestRaw;

        /** 从二进制 manifest 解析出的真实包名（卸载原版时用）。 */
        public String pkgName;
        /** 应用名（application 的 android:label，字符串型才有字面值）。 */
        public String appLabel;
        public String versionName;
        public int versionCode;

        public boolean isLocked() { return !licenseDexes.isEmpty() || hasGateInManifest; }
    }

    private ApkAnalyzer() {}

    private static byte[] toUtf16le(String s) {
        char[] c = s.toCharArray();
        byte[] b = new byte[c.length * 2];
        for (int i = 0; i < c.length; i++) {
            b[i * 2] = (byte) c[i];
            b[i * 2 + 1] = (byte) (c[i] >> 8);
        }
        return b;
    }

    private static byte[] readAll(ZipFile zf, ZipEntry e) throws IOException {
        InputStream in = zf.getInputStream(e);
        try {
            ByteArrayOutputStream bos = new ByteArrayOutputStream((int) Math.max(e.getSize(), 1024));
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) > 0) bos.write(buf, 0, n);
            return bos.toByteArray();
        } finally {
            in.close();
        }
    }

    private static String parseCfg(String cfg, String key) {
        if (cfg == null) return null;
        for (String line : cfg.split("\n")) {
            int i = line.indexOf('=');
            if (i <= 0) continue;
            if (key.equals(line.substring(0, i).trim())) return line.substring(i + 1).trim();
        }
        return null;
    }

    public static Report scan(File apk) throws IOException {
        Report r = new Report();
        r.apkSize = apk.length();
        ZipFile zf = new ZipFile(apk);
        try {
            java.util.Enumeration<? extends ZipEntry> en = zf.entries();
            while (en.hasMoreElements()) {
                ZipEntry e = en.nextElement();
                if (e.isDirectory()) continue;
                String n = e.getName();
                if (n.startsWith("classes") && n.endsWith(".dex")) {
                    byte[] data = readAll(zf, e);
                    r.allDexes.add(n + " (" + data.length + "B)");
                    if (DexPatcher.indexOf(data, CLASS_NEEDLE, 0) >= 0) r.licenseDexes.add(n);
                } else if ("assets/license_cfg.txt".equals(n)) {
                    String cfg = new String(readAll(zf, e), UTF8);
                    r.cfgKey = parseCfg(cfg, "key");
                    r.cfgTarget = parseCfg(cfg, "target");
                } else if ("AndroidManifest.xml".equals(n)) {
                    byte[] mf = readAll(zf, e);
                    r.manifestRaw = "AXML " + mf.length + "B";
                    r.hasGateInManifest = DexPatcher.indexOf(mf, GATE_NEEDLE, 0) >= 0;
                    // 解析真实包名/应用名，供卸载原版使用
                    AxmlReader.Manifest parsed = AxmlReader.parse(mf);
                    if (parsed != null) {
                        r.pkgName = parsed.packageName;
                        r.versionName = parsed.versionName;
                        r.versionCode = parsed.versionCode;
                        for (AxmlReader.Element el : parsed.elements) {
                            if (!"application".equals(el.name)) continue;
                            String lb = el.attrs.get("label");
                            if (lb == null) lb = el.attrs.get("android:label");
                            if (lb != null) { r.appLabel = lb; break; }
                        }
                    }
                }
            }
        } finally {
            zf.close();
        }
        return r;
    }

    /** 从 APK 中读取一个条目。 */
    public static byte[] readEntry(File apk, String entry) throws IOException {
        ZipFile zf = new ZipFile(apk);
        try {
            ZipEntry e = zf.getEntry(entry);
            if (e == null) throw new IOException("APK 内不存在条目: " + entry);
            return readAll(zf, e);
        } finally {
            zf.close();
        }
    }
}
