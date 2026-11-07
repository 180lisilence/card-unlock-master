package com.android.apksig.internal.apk.p002v3;

import com.android.apksig.ApkVerifier;
import com.android.apksig.SigningCertificateLineage;
import com.android.apksig.apk.ApkFormatException;
import com.android.apksig.apk.ApkUtils;
import com.android.apksig.internal.apk.ApkSigningBlockUtils;
import com.android.apksig.internal.apk.ContentDigestAlgorithm;
import com.android.apksig.internal.apk.SignatureAlgorithm;
import com.android.apksig.internal.apk.SignatureInfo;
import com.android.apksig.internal.asn1.Asn1EncodingException;
import com.android.apksig.internal.util.ByteBufferUtils;
import com.android.apksig.internal.util.GuaranteedEncodedFormX509Certificate;
import com.android.apksig.internal.util.X509CertificateUtils;
import com.android.apksig.util.DataSource;
import com.android.apksig.util.RunnablesExecutor;
import java.io.IOException;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.Signature;
import java.security.SignatureException;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.OptionalInt;
import java.util.Set;
import java.util.TreeMap;

/* JADX INFO: loaded from: classes.dex */
public class V3SchemeVerifier {
    private final DataSource mApk;
    private ByteBuffer mApkSignatureSchemeV3Block;
    private final int mBlockId;
    private final Set<ContentDigestAlgorithm> mContentDigestsToVerify;
    private final RunnablesExecutor mExecutor;
    private final boolean mFullVerification;
    private final int mMaxSdkVersion;
    private final int mMinSdkVersion;
    private final OptionalInt mOptionalRotationMinSdkVersion;
    private final ApkSigningBlockUtils.Result mResult;
    private final ApkUtils.ZipSections mZipSections;

    public static class Builder {
        private DataSource mApk;
        private ByteBuffer mApkSignatureSchemeV3Block;
        private Set<ContentDigestAlgorithm> mContentDigestsToVerify;
        private int mMaxSdkVersion;
        private int mMinSdkVersion;
        private ApkSigningBlockUtils.Result mResult;
        private ApkUtils.ZipSections mZipSections;
        private RunnablesExecutor mExecutor = RunnablesExecutor.SINGLE_THREADED;
        private int mBlockId = -262969152;
        private boolean mFullVerification = true;
        private OptionalInt mOptionalRotationMinSdkVersion = OptionalInt.empty();

        public Builder(DataSource dataSource, ApkUtils.ZipSections zipSections, int i, int i2) {
            this.mApk = dataSource;
            this.mZipSections = zipSections;
            this.mMinSdkVersion = i;
            this.mMaxSdkVersion = i2;
        }

        public Builder(ByteBuffer byteBuffer) {
            this.mApkSignatureSchemeV3Block = byteBuffer;
        }

        public V3SchemeVerifier build() {
            int i;
            switch (this.mBlockId) {
                case -262969152:
                    i = 3;
                    this.mMinSdkVersion = Math.max(this.mMinSdkVersion, 28);
                    break;
                case 462663009:
                    i = 31;
                    this.mMinSdkVersion = this.mMaxSdkVersion;
                    break;
                default:
                    throw new IllegalArgumentException(String.format("Unsupported APK Signature Scheme V3 block ID: 0x%08x", Integer.valueOf(this.mBlockId)));
            }
            if (this.mResult == null) {
                this.mResult = new ApkSigningBlockUtils.Result(i);
            }
            if (this.mContentDigestsToVerify == null) {
                this.mContentDigestsToVerify = new HashSet(1);
            }
            V3SchemeVerifier v3SchemeVerifier = new V3SchemeVerifier(this.mExecutor, this.mApk, this.mZipSections, this.mContentDigestsToVerify, this.mResult, this.mMinSdkVersion, this.mMaxSdkVersion, this.mBlockId, this.mOptionalRotationMinSdkVersion, this.mFullVerification);
            ByteBuffer byteBuffer = this.mApkSignatureSchemeV3Block;
            if (byteBuffer != null) {
                v3SchemeVerifier.mApkSignatureSchemeV3Block = byteBuffer;
            }
            return v3SchemeVerifier;
        }

        public Builder setBlockId(int i) {
            this.mBlockId = i;
            return this;
        }

        public Builder setContentDigestsToVerify(Set<ContentDigestAlgorithm> set) {
            this.mContentDigestsToVerify = set;
            return this;
        }

        public Builder setFullVerification(boolean z) {
            this.mFullVerification = z;
            return this;
        }

        public Builder setResult(ApkSigningBlockUtils.Result result) {
            this.mResult = result;
            return this;
        }

        public Builder setRotationMinSdkVersion(int i) {
            this.mOptionalRotationMinSdkVersion = OptionalInt.of(i);
            return this;
        }

        public Builder setRunnablesExecutor(RunnablesExecutor runnablesExecutor) {
            this.mExecutor = runnablesExecutor;
            return this;
        }
    }

    private V3SchemeVerifier(RunnablesExecutor runnablesExecutor, DataSource dataSource, ApkUtils.ZipSections zipSections, Set<ContentDigestAlgorithm> set, ApkSigningBlockUtils.Result result, int i, int i2, int i3, OptionalInt optionalInt, boolean z) {
        this.mExecutor = runnablesExecutor;
        this.mApk = dataSource;
        this.mZipSections = zipSections;
        this.mContentDigestsToVerify = set;
        this.mResult = result;
        this.mMinSdkVersion = i;
        this.mMaxSdkVersion = i2;
        this.mBlockId = i3;
        this.mOptionalRotationMinSdkVersion = optionalInt;
        this.mFullVerification = z;
    }

    /* JADX WARN: Code duplicated, block: B:244:0x012e A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:272:0x0120 A[SYNTHETIC] */
    private void parseSigner(ByteBuffer byteBuffer, CertificateFactory certificateFactory, ApkSigningBlockUtils.Result.SignerInfo signerInfo) throws Asn1EncodingException, NoSuchAlgorithmException, InvalidKeyException, ApkFormatException {
        byte[] encoded;
        int i;
        byte[] bArr;
        ByteBuffer lengthPrefixedSlice = ApkSigningBlockUtils.getLengthPrefixedSlice(byteBuffer);
        byte[] bArr2 = new byte[lengthPrefixedSlice.remaining()];
        lengthPrefixedSlice.get(bArr2);
        lengthPrefixedSlice.flip();
        signerInfo.signedData = bArr2;
        int i2 = byteBuffer.getInt();
        int i3 = byteBuffer.getInt();
        signerInfo.minSdkVersion = i2;
        signerInfo.maxSdkVersion = i3;
        if (i2 < 0 || i2 > i3) {
            signerInfo.addError(ApkVerifier.Issue.V3_SIG_INVALID_SDK_VERSIONS, Integer.valueOf(i2), Integer.valueOf(i3));
        }
        ByteBuffer lengthPrefixedSlice2 = ApkSigningBlockUtils.getLengthPrefixedSlice(byteBuffer);
        byte[] lengthPrefixedByteArray = ApkSigningBlockUtils.readLengthPrefixedByteArray(byteBuffer);
        ArrayList arrayList = new ArrayList(1);
        int i4 = 0;
        while (lengthPrefixedSlice2.hasRemaining()) {
            i4++;
            try {
                ByteBuffer lengthPrefixedSlice3 = ApkSigningBlockUtils.getLengthPrefixedSlice(lengthPrefixedSlice2);
                int i5 = lengthPrefixedSlice3.getInt();
                byte[] lengthPrefixedByteArray2 = ApkSigningBlockUtils.readLengthPrefixedByteArray(lengthPrefixedSlice3);
                signerInfo.signatures.add(new ApkSigningBlockUtils.Result.SignerInfo.Signature(i5, lengthPrefixedByteArray2));
                SignatureAlgorithm signatureAlgorithmFindById = SignatureAlgorithm.findById(i5);
                if (signatureAlgorithmFindById == null) {
                    signerInfo.addWarning(ApkVerifier.Issue.V3_SIG_UNKNOWN_SIG_ALGORITHM, Integer.valueOf(i5));
                } else {
                    arrayList.add(new ApkSigningBlockUtils.SupportedSignature(signatureAlgorithmFindById, lengthPrefixedByteArray2));
                }
            } catch (ApkFormatException | BufferUnderflowException e) {
                signerInfo.addError(ApkVerifier.Issue.V3_SIG_MALFORMED_SIGNATURE, Integer.valueOf(i4));
                return;
            }
        }
        if (signerInfo.signatures.isEmpty()) {
            signerInfo.addError(ApkVerifier.Issue.V3_SIG_NO_SIGNATURES, new Object[0]);
            return;
        }
        try {
            Iterator it = ApkSigningBlockUtils.getSignaturesToVerify(arrayList, signerInfo.minSdkVersion, signerInfo.maxSdkVersion).iterator();
            while (it.hasNext()) {
                ApkSigningBlockUtils.SupportedSignature supportedSignature = (ApkSigningBlockUtils.SupportedSignature) it.next();
                SignatureAlgorithm signatureAlgorithm = supportedSignature.algorithm;
                String first = signatureAlgorithm.getJcaSignatureAlgorithmAndParams().getFirst();
                AlgorithmParameterSpec second = signatureAlgorithm.getJcaSignatureAlgorithmAndParams().getSecond();
                Iterator it2 = it;
                try {
                    byte[] bArr3 = bArr2;
                    try {
                        PublicKey publicKeyGeneratePublic = KeyFactory.getInstance(signatureAlgorithm.getJcaKeyAlgorithm()).generatePublic(new X509EncodedKeySpec(lengthPrefixedByteArray));
                        try {
                            Signature signature = Signature.getInstance(first);
                            signature.initVerify(publicKeyGeneratePublic);
                            if (second != null) {
                                try {
                                    signature.setParameter(second);
                                    try {
                                        lengthPrefixedSlice.position(0);
                                        signature.update(lengthPrefixedSlice);
                                        bArr = supportedSignature.signature;
                                        if (!signature.verify(bArr)) {
                                            signerInfo.addError(ApkVerifier.Issue.V3_SIG_DID_NOT_VERIFY, signatureAlgorithm);
                                            return;
                                        }
                                        try {
                                            ByteBuffer byteBuffer2 = lengthPrefixedSlice2;
                                            signerInfo.verifiedSignatures.put(signatureAlgorithm, bArr);
                                            this.mContentDigestsToVerify.add(signatureAlgorithm.getContentDigestAlgorithm());
                                            it = it2;
                                            bArr2 = bArr3;
                                            lengthPrefixedSlice2 = byteBuffer2;
                                        } catch (InvalidAlgorithmParameterException e2) {
                                            e = e2;
                                        } catch (InvalidKeyException e3) {
                                            e = e3;
                                        } catch (SignatureException e4) {
                                            e = e4;
                                        }
                                    } catch (InvalidAlgorithmParameterException | InvalidKeyException | SignatureException e5) {
                                        e = e5;
                                    }
                                } catch (InvalidAlgorithmParameterException | InvalidKeyException | SignatureException e6) {
                                    e = e6;
                                }
                            } else {
                                lengthPrefixedSlice.position(0);
                                signature.update(lengthPrefixedSlice);
                                bArr = supportedSignature.signature;
                                if (!signature.verify(bArr)) {
                                    signerInfo.addError(ApkVerifier.Issue.V3_SIG_DID_NOT_VERIFY, signatureAlgorithm);
                                    return;
                                }
                                ByteBuffer byteBuffer3 = lengthPrefixedSlice2;
                                signerInfo.verifiedSignatures.put(signatureAlgorithm, bArr);
                                this.mContentDigestsToVerify.add(signatureAlgorithm.getContentDigestAlgorithm());
                                it = it2;
                                bArr2 = bArr3;
                                lengthPrefixedSlice2 = byteBuffer3;
                            }
                        } catch (InvalidAlgorithmParameterException | InvalidKeyException | SignatureException e7) {
                            e = e7;
                        }
                        signerInfo.addError(ApkVerifier.Issue.V3_SIG_VERIFY_EXCEPTION, signatureAlgorithm, e);
                        return;
                    } catch (Exception e8) {
                        e = e8;
                        signerInfo.addError(ApkVerifier.Issue.V3_SIG_MALFORMED_PUBLIC_KEY, e);
                        return;
                    }
                } catch (Exception e9) {
                    e = e9;
                }
            }
            lengthPrefixedSlice.position(0);
            ByteBuffer lengthPrefixedSlice4 = ApkSigningBlockUtils.getLengthPrefixedSlice(lengthPrefixedSlice);
            ByteBuffer lengthPrefixedSlice5 = ApkSigningBlockUtils.getLengthPrefixedSlice(lengthPrefixedSlice);
            int i6 = lengthPrefixedSlice.getInt();
            if (i6 != i2) {
                signerInfo.addError(ApkVerifier.Issue.V3_MIN_SDK_VERSION_MISMATCH_BETWEEN_SIGNER_AND_SIGNED_DATA_RECORD, Integer.valueOf(i2), Integer.valueOf(i6));
            }
            int i7 = lengthPrefixedSlice.getInt();
            if (i7 != i3) {
                signerInfo.addError(ApkVerifier.Issue.V3_MAX_SDK_VERSION_MISMATCH_BETWEEN_SIGNER_AND_SIGNED_DATA_RECORD, Integer.valueOf(i3), Integer.valueOf(i7));
            }
            ByteBuffer lengthPrefixedSlice6 = ApkSigningBlockUtils.getLengthPrefixedSlice(lengthPrefixedSlice);
            int i8 = -1;
            while (lengthPrefixedSlice5.hasRemaining()) {
                i8++;
                ByteBuffer byteBuffer4 = lengthPrefixedSlice;
                byte[] lengthPrefixedByteArray3 = ApkSigningBlockUtils.readLengthPrefixedByteArray(lengthPrefixedSlice5);
                int i9 = i2;
                try {
                    signerInfo.certs.add(new GuaranteedEncodedFormX509Certificate(X509CertificateUtils.generateCertificate(lengthPrefixedByteArray3, certificateFactory), lengthPrefixedByteArray3));
                    lengthPrefixedSlice = byteBuffer4;
                    i2 = i9;
                } catch (CertificateException e10) {
                    signerInfo.addError(ApkVerifier.Issue.V3_SIG_MALFORMED_CERTIFICATE, Integer.valueOf(i8), Integer.valueOf(i8 + 1), e10);
                    return;
                }
            }
            if (signerInfo.certs.isEmpty()) {
                signerInfo.addError(ApkVerifier.Issue.V3_SIG_NO_CERTIFICATES, new Object[0]);
                return;
            }
            X509Certificate x509Certificate = signerInfo.certs.get(0);
            try {
                encoded = ApkSigningBlockUtils.encodePublicKey(x509Certificate.getPublicKey());
            } catch (InvalidKeyException e11) {
                System.out.println("Caught an exception encoding the public key: " + e11);
                e11.printStackTrace();
                encoded = x509Certificate.getPublicKey().getEncoded();
            }
            if (!Arrays.equals(lengthPrefixedByteArray, encoded)) {
                signerInfo.addError(ApkVerifier.Issue.V3_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD, ApkSigningBlockUtils.toHex(encoded), ApkSigningBlockUtils.toHex(lengthPrefixedByteArray));
                return;
            }
            int i10 = 0;
            while (lengthPrefixedSlice4.hasRemaining()) {
                i10++;
                try {
                    ByteBuffer lengthPrefixedSlice7 = ApkSigningBlockUtils.getLengthPrefixedSlice(lengthPrefixedSlice4);
                    X509Certificate x509Certificate2 = x509Certificate;
                    try {
                        ByteBuffer byteBuffer5 = lengthPrefixedSlice4;
                        try {
                            signerInfo.contentDigests.add(new ApkSigningBlockUtils.Result.SignerInfo.ContentDigest(lengthPrefixedSlice7.getInt(), ApkSigningBlockUtils.readLengthPrefixedByteArray(lengthPrefixedSlice7)));
                            x509Certificate = x509Certificate2;
                            lengthPrefixedSlice4 = byteBuffer5;
                        } catch (ApkFormatException e12) {
                            signerInfo.addError(ApkVerifier.Issue.V3_SIG_MALFORMED_DIGEST, Integer.valueOf(i10));
                            return;
                        } catch (BufferUnderflowException e13) {
                            signerInfo.addError(ApkVerifier.Issue.V3_SIG_MALFORMED_DIGEST, Integer.valueOf(i10));
                            return;
                        }
                    } catch (ApkFormatException | BufferUnderflowException e14) {
                    }
                } catch (ApkFormatException | BufferUnderflowException e15) {
                }
            }
            List arrayList2 = new ArrayList(signerInfo.signatures.size());
            Iterator<ApkSigningBlockUtils.Result.SignerInfo.Signature> it3 = signerInfo.signatures.iterator();
            while (it3.hasNext()) {
                arrayList2.add(Integer.valueOf(it3.next().getAlgorithmId()));
            }
            ArrayList arrayList3 = new ArrayList(signerInfo.contentDigests.size());
            for (Iterator<ApkSigningBlockUtils.Result.SignerInfo.ContentDigest> it4 = signerInfo.contentDigests.iterator(); it4.hasNext(); it4 = it4) {
                arrayList3.add(Integer.valueOf(it4.next().getSignatureAlgorithmId()));
            }
            if (!arrayList2.equals(arrayList3)) {
                signerInfo.addError(ApkVerifier.Issue.V3_SIG_SIG_ALG_MISMATCH_BETWEEN_SIGNATURES_AND_DIGESTS_RECORDS, arrayList2, arrayList3);
                return;
            }
            int i11 = 0;
            boolean z = false;
            while (lengthPrefixedSlice6.hasRemaining()) {
                int i12 = i11 + 1;
                try {
                    ByteBuffer lengthPrefixedSlice8 = ApkSigningBlockUtils.getLengthPrefixedSlice(lengthPrefixedSlice6);
                    int i13 = lengthPrefixedSlice8.getInt();
                    byte[] byteArray = ByteBufferUtils.toByteArray(lengthPrefixedSlice8);
                    List list = arrayList2;
                    try {
                        ArrayList arrayList4 = arrayList3;
                        byte[] bArr4 = encoded;
                        try {
                            signerInfo.additionalAttributes.add(new ApkSigningBlockUtils.Result.SignerInfo.AdditionalAttribute(i13, byteArray));
                            if (i13 == 1000370060) {
                                try {
                                    signerInfo.signingCertificateLineage = SigningCertificateLineage.readFromV3AttributeValue(byteArray);
                                    i = i10;
                                    try {
                                        try {
                                            if (signerInfo.signingCertificateLineage.size() != signerInfo.signingCertificateLineage.getSubLineage(signerInfo.certs.get(0)).size()) {
                                                signerInfo.addError(ApkVerifier.Issue.V3_SIG_POR_CERT_MISMATCH, new Object[0]);
                                            }
                                        } catch (ApkFormatException e16) {
                                            signerInfo.addError(ApkVerifier.Issue.V3_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE, Integer.valueOf(i12));
                                            return;
                                        } catch (BufferUnderflowException e17) {
                                            signerInfo.addError(ApkVerifier.Issue.V3_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE, Integer.valueOf(i12));
                                            return;
                                        }
                                    } catch (IllegalArgumentException e18) {
                                        e = e18;
                                        signerInfo.addError(ApkVerifier.Issue.V3_SIG_POR_CERT_MISMATCH, new Object[0]);
                                    } catch (SecurityException e19) {
                                        e = e19;
                                        signerInfo.addError(ApkVerifier.Issue.V3_SIG_POR_DID_NOT_VERIFY, new Object[0]);
                                    } catch (Exception e20) {
                                        e = e20;
                                        signerInfo.addError(ApkVerifier.Issue.V3_SIG_MALFORMED_LINEAGE, new Object[0]);
                                    }
                                } catch (IllegalArgumentException e21) {
                                    e = e21;
                                    i = i10;
                                } catch (SecurityException e22) {
                                    e = e22;
                                    i = i10;
                                } catch (Exception e23) {
                                    e = e23;
                                    i = i10;
                                }
                            } else {
                                i = i10;
                                if (i13 == 1436519170) {
                                    z = true;
                                    if (this.mMaxSdkVersion >= 33 && this.mFullVerification) {
                                        int i14 = ByteBuffer.wrap(byteArray).order(ByteOrder.LITTLE_ENDIAN).getInt();
                                        if (this.mOptionalRotationMinSdkVersion.isPresent()) {
                                            int asInt = this.mOptionalRotationMinSdkVersion.getAsInt();
                                            if (i14 != asInt) {
                                                signerInfo.addError(ApkVerifier.Issue.V31_ROTATION_MIN_SDK_MISMATCH, Integer.valueOf(i14), Integer.valueOf(asInt));
                                            }
                                        } else {
                                            signerInfo.addError(ApkVerifier.Issue.V31_BLOCK_MISSING, Integer.valueOf(i14));
                                        }
                                    }
                                } else if (i13 != -1029262406) {
                                    signerInfo.addWarning(ApkVerifier.Issue.V3_SIG_UNKNOWN_ADDITIONAL_ATTRIBUTE, Integer.valueOf(i13));
                                } else if (this.mBlockId != 462663009) {
                                    signerInfo.addWarning(ApkVerifier.Issue.V31_ROTATION_TARGETS_DEV_RELEASE_ATTR_ON_V3_SIGNER, new Object[0]);
                                }
                            }
                            i11 = i12;
                            encoded = bArr4;
                            i10 = i;
                            arrayList2 = list;
                            arrayList3 = arrayList4;
                        } catch (ApkFormatException | BufferUnderflowException e24) {
                        }
                    } catch (ApkFormatException | BufferUnderflowException e25) {
                    }
                } catch (ApkFormatException | BufferUnderflowException e26) {
                }
            }
            if (this.mFullVerification && this.mOptionalRotationMinSdkVersion.isPresent() && !z) {
                signerInfo.addWarning(ApkVerifier.Issue.V31_ROTATION_MIN_SDK_ATTR_MISSING, Integer.valueOf(this.mOptionalRotationMinSdkVersion.getAsInt()));
            }
        } catch (ApkSigningBlockUtils.NoSupportedSignaturesException e27) {
            signerInfo.addError(ApkVerifier.Issue.V3_SIG_NO_SUPPORTED_SIGNATURES, new Object[0]);
        }
    }

    public static void parseSigners(ByteBuffer byteBuffer, Set<ContentDigestAlgorithm> set, ApkSigningBlockUtils.Result result) throws NoSuchAlgorithmException {
        try {
            new Builder(byteBuffer).setResult(result).setContentDigestsToVerify(set).setFullVerification(false).build().parseSigners();
        } catch (ApkSigningBlockUtils.SignatureNotFoundException | IOException e) {
            throw new IllegalStateException("An exception was encountered when attempting to parse the signers from the provided APK Signature Scheme v3 block", e);
        }
    }

    public static ApkSigningBlockUtils.Result verify(RunnablesExecutor runnablesExecutor, DataSource dataSource, ApkUtils.ZipSections zipSections, int i, int i2) throws ApkSigningBlockUtils.SignatureNotFoundException, NoSuchAlgorithmException, IOException {
        return new Builder(dataSource, zipSections, i, i2).setRunnablesExecutor(runnablesExecutor).setBlockId(-262969152).build().verify();
    }

    public ApkSigningBlockUtils.Result parseSigners() throws ApkSigningBlockUtils.SignatureNotFoundException, NoSuchAlgorithmException, IOException {
        try {
            if (this.mApkSignatureSchemeV3Block == null) {
                this.mApkSignatureSchemeV3Block = ApkSigningBlockUtils.findSignature(this.mApk, this.mZipSections, this.mBlockId, this.mResult).signatureBlock;
            }
            ByteBuffer lengthPrefixedSlice = ApkSigningBlockUtils.getLengthPrefixedSlice(this.mApkSignatureSchemeV3Block);
            if (!lengthPrefixedSlice.hasRemaining()) {
                this.mResult.addError(ApkVerifier.Issue.V3_SIG_NO_SIGNERS, new Object[0]);
                return this.mResult;
            }
            try {
                CertificateFactory certificateFactory = CertificateFactory.getInstance("X.509");
                int i = 0;
                while (lengthPrefixedSlice.hasRemaining()) {
                    int i2 = i;
                    i++;
                    ApkSigningBlockUtils.Result.SignerInfo signerInfo = new ApkSigningBlockUtils.Result.SignerInfo();
                    signerInfo.index = i2;
                    this.mResult.signers.add(signerInfo);
                    try {
                        parseSigner(ApkSigningBlockUtils.getLengthPrefixedSlice(lengthPrefixedSlice), certificateFactory, signerInfo);
                    } catch (ApkFormatException | BufferUnderflowException e) {
                        signerInfo.addError(ApkVerifier.Issue.V3_SIG_MALFORMED_SIGNER, new Object[0]);
                        return this.mResult;
                    }
                }
                return this.mResult;
            } catch (CertificateException e2) {
                throw new RuntimeException("Failed to obtain X.509 CertificateFactory", e2);
            }
        } catch (ApkFormatException e3) {
            this.mResult.addError(ApkVerifier.Issue.V3_SIG_MALFORMED_SIGNERS, new Object[0]);
            return this.mResult;
        }
    }

    /* JADX WARN: Code duplicated, block: B:41:0x00ff  */
    public ApkSigningBlockUtils.Result verify() throws ApkSigningBlockUtils.SignatureNotFoundException, NoSuchAlgorithmException, IOException {
        ApkUtils.ZipSections zipSections;
        int i;
        DataSource dataSource = this.mApk;
        if (dataSource == null || (zipSections = this.mZipSections) == null) {
            throw new IllegalStateException("A non-null apk and zip sections must be specified to verify an APK's v3 signatures");
        }
        SignatureInfo signatureInfoFindSignature = ApkSigningBlockUtils.findSignature(dataSource, zipSections, this.mBlockId, this.mResult);
        this.mApkSignatureSchemeV3Block = signatureInfoFindSignature.signatureBlock;
        DataSource dataSourceSlice = this.mApk.slice(0L, signatureInfoFindSignature.apkSigningBlockOffset);
        DataSource dataSourceSlice2 = this.mApk.slice(signatureInfoFindSignature.centralDirOffset, signatureInfoFindSignature.eocdOffset - signatureInfoFindSignature.centralDirOffset);
        ByteBuffer byteBuffer = signatureInfoFindSignature.eocd;
        parseSigners();
        if (this.mResult.containsErrors()) {
            return this.mResult;
        }
        ApkSigningBlockUtils.verifyIntegrity(this.mExecutor, dataSourceSlice, dataSourceSlice2, byteBuffer, this.mContentDigestsToVerify, this.mResult);
        TreeMap treeMap = new TreeMap();
        for (ApkSigningBlockUtils.Result.SignerInfo signerInfo : this.mResult.signers) {
            treeMap.put(Integer.valueOf(signerInfo.minSdkVersion), signerInfo);
        }
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        ArrayList arrayList = new ArrayList(this.mResult.signers.size());
        Iterator it = treeMap.values().iterator();
        while (true) {
            if (it.hasNext()) {
                ApkSigningBlockUtils.Result.SignerInfo signerInfo2 = (ApkSigningBlockUtils.Result.SignerInfo) it.next();
                int i5 = signerInfo2.minSdkVersion;
                int i6 = signerInfo2.maxSdkVersion;
                if (i2 == 0) {
                    i2 = i5;
                } else if (i5 != i3 + 1) {
                    this.mResult.addError(ApkVerifier.Issue.V3_INCONSISTENT_SDK_VERSIONS, new Object[0]);
                }
                i3 = i6;
                if (signerInfo2.signingCertificateLineage != null) {
                    int size = signerInfo2.signingCertificateLineage.size();
                    if (size < i4) {
                        this.mResult.addError(ApkVerifier.Issue.V3_INCONSISTENT_LINEAGES, new Object[0]);
                        i = i2;
                        break;
                    }
                    arrayList.add(signerInfo2.signingCertificateLineage);
                    i4 = size;
                }
                i2 = i2;
                signatureInfoFindSignature = signatureInfoFindSignature;
            }
            i = i2;
            break;
        }
        if (i > this.mMinSdkVersion) {
            this.mResult.addError(ApkVerifier.Issue.V3_MISSING_SDK_VERSIONS, Integer.valueOf(i), Integer.valueOf(i3));
        } else if (i3 < (this.mOptionalRotationMinSdkVersion.isPresent() ? this.mOptionalRotationMinSdkVersion.getAsInt() - 1 : this.mMaxSdkVersion)) {
            this.mResult.addError(ApkVerifier.Issue.V3_MISSING_SDK_VERSIONS, Integer.valueOf(i), Integer.valueOf(i3));
        }
        try {
            this.mResult.signingCertificateLineage = SigningCertificateLineage.consolidateLineages(arrayList);
        } catch (IllegalArgumentException e) {
            this.mResult.addError(ApkVerifier.Issue.V3_INCONSISTENT_LINEAGES, new Object[0]);
        }
        if (!this.mResult.containsErrors()) {
            this.mResult.verified = true;
        }
        return this.mResult;
    }
}
