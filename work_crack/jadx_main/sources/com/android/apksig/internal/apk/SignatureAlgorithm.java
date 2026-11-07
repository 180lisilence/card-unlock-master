package com.android.apksig.internal.apk;

import com.android.apksig.internal.util.Pair;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.MGF1ParameterSpec;
import java.security.spec.PSSParameterSpec;

/* JADX INFO: loaded from: classes.dex */
public enum SignatureAlgorithm {
    RSA_PSS_WITH_SHA256(257, ContentDigestAlgorithm.CHUNKED_SHA256, "RSA", Pair.m0of("SHA256withRSA/PSS", new PSSParameterSpec("SHA-256", "MGF1", MGF1ParameterSpec.SHA256, 32, 1)), 24, 23),
    RSA_PSS_WITH_SHA512(AndroidBinXmlParser.Chunk.RES_XML_TYPE_START_ELEMENT, ContentDigestAlgorithm.CHUNKED_SHA512, "RSA", Pair.m0of("SHA512withRSA/PSS", new PSSParameterSpec("SHA-512", "MGF1", MGF1ParameterSpec.SHA512, 64, 1)), 24, 23),
    RSA_PKCS1_V1_5_WITH_SHA256(AndroidBinXmlParser.Chunk.RES_XML_TYPE_END_ELEMENT, ContentDigestAlgorithm.CHUNKED_SHA256, "RSA", Pair.m0of("SHA256withRSA", null), 24, 1),
    RSA_PKCS1_V1_5_WITH_SHA512(260, ContentDigestAlgorithm.CHUNKED_SHA512, "RSA", Pair.m0of("SHA512withRSA", null), 24, 1),
    ECDSA_WITH_SHA256(513, ContentDigestAlgorithm.CHUNKED_SHA256, "EC", Pair.m0of("SHA256withECDSA", null), 24, 11),
    ECDSA_WITH_SHA512(514, ContentDigestAlgorithm.CHUNKED_SHA512, "EC", Pair.m0of("SHA512withECDSA", null), 24, 11),
    DSA_WITH_SHA256(769, ContentDigestAlgorithm.CHUNKED_SHA256, "DSA", Pair.m0of("SHA256withDSA", null), 24, 1),
    DETDSA_WITH_SHA256(769, ContentDigestAlgorithm.CHUNKED_SHA256, "DSA", Pair.m0of("SHA256withDetDSA", null), 24, 1),
    VERITY_RSA_PKCS1_V1_5_WITH_SHA256(1057, ContentDigestAlgorithm.VERITY_CHUNKED_SHA256, "RSA", Pair.m0of("SHA256withRSA", null), 28, 1),
    VERITY_ECDSA_WITH_SHA256(1059, ContentDigestAlgorithm.VERITY_CHUNKED_SHA256, "EC", Pair.m0of("SHA256withECDSA", null), 28, 11),
    VERITY_DSA_WITH_SHA256(1061, ContentDigestAlgorithm.VERITY_CHUNKED_SHA256, "DSA", Pair.m0of("SHA256withDSA", null), 28, 1);

    private final ContentDigestAlgorithm mContentDigestAlgorithm;
    private final int mId;
    private final String mJcaKeyAlgorithm;
    private final int mJcaSigAlgMinSdkVersion;
    private final Pair<String, ? extends AlgorithmParameterSpec> mJcaSignatureAlgAndParams;
    private final int mMinSdkVersion;

    SignatureAlgorithm(int i, ContentDigestAlgorithm contentDigestAlgorithm, String str, Pair pair, int i2, int i3) {
        this.mId = i;
        this.mContentDigestAlgorithm = contentDigestAlgorithm;
        this.mJcaKeyAlgorithm = str;
        this.mJcaSignatureAlgAndParams = pair;
        this.mMinSdkVersion = i2;
        this.mJcaSigAlgMinSdkVersion = i3;
    }

    public static SignatureAlgorithm findById(int i) {
        for (SignatureAlgorithm signatureAlgorithm : values()) {
            if (signatureAlgorithm.getId() == i) {
                return signatureAlgorithm;
            }
        }
        return null;
    }

    public ContentDigestAlgorithm getContentDigestAlgorithm() {
        return this.mContentDigestAlgorithm;
    }

    public int getId() {
        return this.mId;
    }

    public String getJcaKeyAlgorithm() {
        return this.mJcaKeyAlgorithm;
    }

    public int getJcaSigAlgMinSdkVersion() {
        return this.mJcaSigAlgMinSdkVersion;
    }

    public Pair<String, ? extends AlgorithmParameterSpec> getJcaSignatureAlgorithmAndParams() {
        return this.mJcaSignatureAlgAndParams;
    }

    public int getMinSdkVersion() {
        return this.mMinSdkVersion;
    }
}
