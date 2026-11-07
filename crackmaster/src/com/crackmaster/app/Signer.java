package com.crackmaster.app;

import com.android.apksig.ApkSigner;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;

/**
 * APK 签名器 —— 调用 com.android.apksig（随 App 打包编译进 dex），
 * 签名参数与卡密注入器 Injector.sign 完全一致（v1+v2+v3）。
 */
public final class Signer {

    private Signer() {}

    /**
     * @param pkcs12 PKCS12 密钥库字节（assets 内嵌）
     * @param pass   密钥库口令
     */
    public static void sign(File in, File out, byte[] pkcs12, String pass) throws Exception {
        KeyStore ks = KeyStore.getInstance("PKCS12");
        ks.load(new ByteArrayInputStream(pkcs12), pass.toCharArray());
        String alias = ks.aliases().nextElement();
        PrivateKey privateKey = (PrivateKey) ks.getKey(alias, pass.toCharArray());
        X509Certificate cert = (X509Certificate) ks.getCertificate(alias);
        List<X509Certificate> certs = new ArrayList<X509Certificate>();
        certs.add(cert);

        ApkSigner.SignerConfig signerConfig =
                new ApkSigner.SignerConfig.Builder("CRACKMASTER", privateKey, certs).build();
        List<ApkSigner.SignerConfig> signers = new ArrayList<ApkSigner.SignerConfig>();
        signers.add(signerConfig);

        new ApkSigner.Builder(signers)
                .setInputApk(in)
                .setOutputApk(out)
                .setV1SigningEnabled(true)
                .setV2SigningEnabled(true)
                .setV3SigningEnabled(true)
                .setMinSdkVersion(24)
                .setOtherSignersSignaturesPreserved(false)
                .setDebuggableApkPermitted(true)
                .build()
                .sign();
    }
}
