package com.crackmaster.app;

import com.licenseinjector.app.core.ZipRewriter;

import java.io.File;

/**
 * 破解引擎：patch 验证 dex → 重打包 → 重签名。
 * 与卡密注入器（Injector.inject）走同一套 ZipRewriter + apksig 链路，方向相反。
 */
public final class CrackEngine {

    /** 日志接口（兼容 DexPatcher.Log，可直接透传）。 */
    public interface Log extends DexPatcher.Log { }

    private CrackEngine() {}

    public static class CrackResult {
        public File outputApk;
        public java.util.List<String> patchedDexes = new java.util.ArrayList<String>();
        public java.util.List<String> patchedMethods = new java.util.ArrayList<String>();
    }

    /**
     * @param srcApk  被锁 APK
     * @param outApk  输出破解后 APK（调用方保证可写）
     * @param keystore PKCS12 字节
     * @param ksPass  密钥库口令
     */
    public static CrackResult crack(File srcApk, File outApk, byte[] keystore, String ksPass, Log log) throws Exception {
        if (outApk.exists() && !outApk.delete()) throw new IllegalStateException("无法删除已存在的输出文件");

        CrackResult result = new CrackResult();
        result.outputApk = outApk;

        // 1. 分析
        ApkAnalyzer.Report report = ApkAnalyzer.scan(srcApk);
        log.log("分析完成: " + srcApk.getName() + " (" + report.apkSize + " 字节)");
        log.log("  dex 列表: " + report.allDexes);
        log.log("  含卡密模块的 dex: " + report.licenseDexes);
        log.log("  manifest 含验证页: " + report.hasGateInManifest);
        log.log("  注入配置 license_cfg.txt: key=" + (report.cfgKey == null ? "(无)" : report.cfgKey)
                + ", target=" + (report.cfgTarget == null ? "(无)" : report.cfgTarget));

        if (report.licenseDexes.isEmpty()) {
            throw new IllegalStateException("未检测到卡密验证模块（com.license.verify2），该 APK 可能未被此工具注入过");
        }

        // 2. patch 每个含验证模块的 dex
        ZipRewriter zr = new ZipRewriter(srcApk);
        try {
            zr.removeOldSignatures();
            for (String dexName : report.licenseDexes) {
                byte[] data = ApkAnalyzer.readEntry(srcApk, dexName);
                DexPatcher.Result pr = DexPatcher.patch(data, log);
                zr.replace(dexName, data);
                result.patchedDexes.add(dexName);
                result.patchedMethods.addAll(pr.patchedMethods);
                log.log("已打补丁: " + dexName + " → " + pr.patchedMethods);
            }
            File unsigned = new File(outApk.getAbsolutePath() + ".unsigned");
            log.log("重打包中 ...");
            try {
                zr.writeTo(unsigned);
            } catch (Throwable t) {
                if (t instanceof Exception) throw (Exception) t;
                throw new RuntimeException(t);
            }

            // 3. 签名
            log.log("签名中 (v1+v2+v3) ...");
            Signer.sign(unsigned, outApk, keystore, ksPass);
            if (!unsigned.delete()) unsigned.deleteOnExit();
        } finally {
            zr.close();
        }

        log.log("破解完成: " + outApk.getAbsolutePath() + " (" + outApk.length() + " 字节)");
        return result;
    }
}
