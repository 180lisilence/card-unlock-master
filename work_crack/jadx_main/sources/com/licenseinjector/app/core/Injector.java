package com.licenseinjector.app.core;

import com.android.apksig.ApkSigner;
import com.android.apksig.apk.ApkUtils;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/* JADX INFO: loaded from: classes3.dex */
public final class Injector {
    private static final String CFG_ENTRY = "assets/license_cfg.txt";
    public static final String GATE_ACTIVITY = "com.license.verify2.VerifyActivity";
    private static final String KS_PASS = "license123";

    public interface Log {
        void log(String str);
    }

    private Injector() {
    }

    public static void inject(File file, File file2, byte[] bArr, String str, byte[] bArr2, Log log) throws Exception {
        AxmLEditor axmLEditor = new AxmLEditor(readEntry(file, ApkUtils.ANDROID_MANIFEST_ZIP_ENTRY_NAME));
        if (axmLEditor.hasComponent(GATE_ACTIVITY)) {
            throw new Exception("该 APK 已含卡密模块，请用未植入过的原始 APK");
        }
        byte[] bArrInjectLauncher = axmLEditor.injectLauncher(GATE_ACTIVITY, null);
        String str2 = axmLEditor.resolvedEntry;
        if (log != null) {
            log.log("原启动页: " + axmLEditor.discoveredLauncher);
            log.log("注入点: " + str2);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("key=").append(str == null ? "" : str).append('\n');
        sb.append("target=").append(str2 != null ? str2 : "").append('\n');
        ZipRewriter zipRewriter = new ZipRewriter(file);
        File file3 = new File(file2.getAbsolutePath() + ".unsigned");
        try {
            String strNextDexName = nextDexName(zipRewriter.names());
            if (log != null) {
                log.log("注入载荷: " + strNextDexName + " (" + bArr.length + " 字节)");
            }
            zipRewriter.removeOldSignatures();
            zipRewriter.replace(ApkUtils.ANDROID_MANIFEST_ZIP_ENTRY_NAME, bArrInjectLauncher);
            zipRewriter.add(strNextDexName, bArr);
            zipRewriter.add(CFG_ENTRY, sb.toString().getBytes("UTF-8"));
            if (log != null) {
                log.log("重打包中 ...");
            }
            zipRewriter.writeTo(file3);
            zipRewriter.close();
            if (log != null) {
                log.log("签名中 (v1+v2+v3) ...");
            }
            sign(file3, file2, bArr2);
            file3.delete();
            if (log != null) {
                log.log("完成: " + file2.getName());
            }
        } catch (Throwable th) {
            zipRewriter.close();
            throw th;
        }
    }

    static String nextDexName(List<String> list) {
        int iMax = 1;
        for (String str : list) {
            if (str.startsWith("classes") && str.endsWith(".dex")) {
                String strSubstring = str.substring(7, str.length() - 4);
                if (strSubstring.isEmpty()) {
                    iMax = Math.max(iMax, 1);
                } else {
                    try {
                        iMax = Math.max(iMax, Integer.parseInt(strSubstring));
                    } catch (NumberFormatException e) {
                    }
                }
            }
        }
        return iMax == 1 ? "classes2.dex" : "classes" + (iMax + 1) + ".dex";
    }

    static byte[] readEntry(File file, String str) throws Exception {
        ZipFile zipFile = new ZipFile(file);
        try {
            ZipEntry entry = zipFile.getEntry(str);
            if (entry == null) {
                throw new IllegalStateException("目标 APK 缺少 " + str);
            }
            InputStream inputStream = zipFile.getInputStream(entry);
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            byte[] bArr = new byte[8192];
            while (true) {
                int i = inputStream.read(bArr);
                if (i <= 0) {
                    inputStream.close();
                    byte[] byteArray = byteArrayOutputStream.toByteArray();
                    zipFile.close();
                    return byteArray;
                }
                byteArrayOutputStream.write(bArr, 0, i);
            }
        } catch (Throwable th) {
            zipFile.close();
            throw th;
        }
    }

    static void sign(File file, File file2, byte[] bArr) throws Exception {
        KeyStore keyStore = KeyStore.getInstance("PKCS12");
        keyStore.load(new ByteArrayInputStream(bArr), KS_PASS.toCharArray());
        String strNextElement = keyStore.aliases().nextElement();
        PrivateKey privateKey = (PrivateKey) keyStore.getKey(strNextElement, KS_PASS.toCharArray());
        X509Certificate x509Certificate = (X509Certificate) keyStore.getCertificate(strNextElement);
        ArrayList arrayList = new ArrayList();
        arrayList.add(x509Certificate);
        ApkSigner.SignerConfig signerConfigBuild = new ApkSigner.SignerConfig.Builder("LICENSE", privateKey, arrayList).build();
        ArrayList arrayList2 = new ArrayList();
        arrayList2.add(signerConfigBuild);
        new ApkSigner.Builder(arrayList2).setInputApk(file).setOutputApk(file2).setV1SigningEnabled(true).setV2SigningEnabled(true).setV3SigningEnabled(true).setMinSdkVersion(24).setOtherSignersSignaturesPreserved(false).setDebuggableApkPermitted(true).build().sign();
    }
}
