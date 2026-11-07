package com.android.apksig.internal.apk.p001v2;

import com.android.apksig.ApkVerifier;
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
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public abstract class V2SchemeVerifier {
    private V2SchemeVerifier() {
    }

    /* JADX WARN: Code duplicated, block: B:226:0x0115 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:234:0x0107 A[SYNTHETIC] */
    private static void parseSigner(ByteBuffer byteBuffer, CertificateFactory certificateFactory, ApkSigningBlockUtils.Result.SignerInfo signerInfo, Set<ContentDigestAlgorithm> set, Map<Integer, String> map, Set<Integer> set2, int i, int i2) throws Asn1EncodingException, NoSuchAlgorithmException, InvalidKeyException, ApkFormatException {
        byte[] encoded;
        byte[] bArr;
        byte[] bArr2;
        ByteBuffer lengthPrefixedSlice = ApkSigningBlockUtils.getLengthPrefixedSlice(byteBuffer);
        byte[] bArr3 = new byte[lengthPrefixedSlice.remaining()];
        lengthPrefixedSlice.get(bArr3);
        lengthPrefixedSlice.flip();
        signerInfo.signedData = bArr3;
        ByteBuffer lengthPrefixedSlice2 = ApkSigningBlockUtils.getLengthPrefixedSlice(byteBuffer);
        byte[] lengthPrefixedByteArray = ApkSigningBlockUtils.readLengthPrefixedByteArray(byteBuffer);
        ArrayList arrayList = new ArrayList(1);
        int i3 = 0;
        while (lengthPrefixedSlice2.hasRemaining()) {
            i3++;
            try {
                ByteBuffer lengthPrefixedSlice3 = ApkSigningBlockUtils.getLengthPrefixedSlice(lengthPrefixedSlice2);
                int i4 = lengthPrefixedSlice3.getInt();
                byte[] lengthPrefixedByteArray2 = ApkSigningBlockUtils.readLengthPrefixedByteArray(lengthPrefixedSlice3);
                signerInfo.signatures.add(new ApkSigningBlockUtils.Result.SignerInfo.Signature(i4, lengthPrefixedByteArray2));
                SignatureAlgorithm signatureAlgorithmFindById = SignatureAlgorithm.findById(i4);
                if (signatureAlgorithmFindById == null) {
                    signerInfo.addWarning(ApkVerifier.Issue.V2_SIG_UNKNOWN_SIG_ALGORITHM, Integer.valueOf(i4));
                } else {
                    arrayList.add(new ApkSigningBlockUtils.SupportedSignature(signatureAlgorithmFindById, lengthPrefixedByteArray2));
                }
            } catch (ApkFormatException | BufferUnderflowException e) {
                signerInfo.addError(ApkVerifier.Issue.V2_SIG_MALFORMED_SIGNATURE, Integer.valueOf(i3));
                return;
            }
        }
        if (signerInfo.signatures.isEmpty()) {
            signerInfo.addError(ApkVerifier.Issue.V2_SIG_NO_SIGNATURES, new Object[0]);
            return;
        }
        try {
            Iterator it = ApkSigningBlockUtils.getSignaturesToVerify(arrayList, i, i2).iterator();
            while (it.hasNext()) {
                ApkSigningBlockUtils.SupportedSignature supportedSignature = (ApkSigningBlockUtils.SupportedSignature) it.next();
                SignatureAlgorithm signatureAlgorithm = supportedSignature.algorithm;
                String first = signatureAlgorithm.getJcaSignatureAlgorithmAndParams().getFirst();
                AlgorithmParameterSpec second = signatureAlgorithm.getJcaSignatureAlgorithmAndParams().getSecond();
                try {
                    Iterator it2 = it;
                    PublicKey publicKeyGeneratePublic = KeyFactory.getInstance(signatureAlgorithm.getJcaKeyAlgorithm()).generatePublic(new X509EncodedKeySpec(lengthPrefixedByteArray));
                    try {
                        Signature signature = Signature.getInstance(first);
                        signature.initVerify(publicKeyGeneratePublic);
                        if (second != null) {
                            try {
                                signature.setParameter(second);
                                bArr = bArr3;
                                try {
                                    lengthPrefixedSlice.position(0);
                                    signature.update(lengthPrefixedSlice);
                                    bArr2 = supportedSignature.signature;
                                    if (!signature.verify(bArr2)) {
                                        signerInfo.addError(ApkVerifier.Issue.V2_SIG_DID_NOT_VERIFY, signatureAlgorithm);
                                        return;
                                    }
                                    try {
                                        ByteBuffer byteBuffer2 = lengthPrefixedSlice2;
                                        signerInfo.verifiedSignatures.put(signatureAlgorithm, bArr2);
                                        try {
                                            set.add(signatureAlgorithm.getContentDigestAlgorithm());
                                            it = it2;
                                            bArr3 = bArr;
                                            lengthPrefixedSlice2 = byteBuffer2;
                                        } catch (InvalidAlgorithmParameterException e2) {
                                            e = e2;
                                        } catch (InvalidKeyException e3) {
                                            e = e3;
                                        } catch (SignatureException e4) {
                                            e = e4;
                                        }
                                    } catch (InvalidAlgorithmParameterException e5) {
                                        e = e5;
                                    } catch (InvalidKeyException e6) {
                                        e = e6;
                                    } catch (SignatureException e7) {
                                        e = e7;
                                    }
                                } catch (InvalidAlgorithmParameterException | InvalidKeyException | SignatureException e8) {
                                    e = e8;
                                }
                            } catch (InvalidAlgorithmParameterException e9) {
                                e = e9;
                            } catch (InvalidKeyException e10) {
                                e = e10;
                            } catch (SignatureException e11) {
                                e = e11;
                            }
                        } else {
                            bArr = bArr3;
                            lengthPrefixedSlice.position(0);
                            signature.update(lengthPrefixedSlice);
                            bArr2 = supportedSignature.signature;
                            if (!signature.verify(bArr2)) {
                                signerInfo.addError(ApkVerifier.Issue.V2_SIG_DID_NOT_VERIFY, signatureAlgorithm);
                                return;
                            }
                            ByteBuffer byteBuffer3 = lengthPrefixedSlice2;
                            signerInfo.verifiedSignatures.put(signatureAlgorithm, bArr2);
                            set.add(signatureAlgorithm.getContentDigestAlgorithm());
                            it = it2;
                            bArr3 = bArr;
                            lengthPrefixedSlice2 = byteBuffer3;
                        }
                    } catch (InvalidAlgorithmParameterException | InvalidKeyException | SignatureException e12) {
                        e = e12;
                    }
                    signerInfo.addError(ApkVerifier.Issue.V2_SIG_VERIFY_EXCEPTION, signatureAlgorithm, e);
                    return;
                } catch (Exception e13) {
                    signerInfo.addError(ApkVerifier.Issue.V2_SIG_MALFORMED_PUBLIC_KEY, e13);
                    return;
                }
            }
            lengthPrefixedSlice.position(0);
            ByteBuffer lengthPrefixedSlice4 = ApkSigningBlockUtils.getLengthPrefixedSlice(lengthPrefixedSlice);
            ByteBuffer lengthPrefixedSlice5 = ApkSigningBlockUtils.getLengthPrefixedSlice(lengthPrefixedSlice);
            ByteBuffer lengthPrefixedSlice6 = ApkSigningBlockUtils.getLengthPrefixedSlice(lengthPrefixedSlice);
            int i5 = -1;
            while (lengthPrefixedSlice5.hasRemaining()) {
                i5++;
                byte[] lengthPrefixedByteArray3 = ApkSigningBlockUtils.readLengthPrefixedByteArray(lengthPrefixedSlice5);
                try {
                    signerInfo.certs.add(new GuaranteedEncodedFormX509Certificate(X509CertificateUtils.generateCertificate(lengthPrefixedByteArray3, certificateFactory), lengthPrefixedByteArray3));
                } catch (CertificateException e14) {
                    signerInfo.addError(ApkVerifier.Issue.V2_SIG_MALFORMED_CERTIFICATE, Integer.valueOf(i5), Integer.valueOf(i5 + 1), e14);
                    return;
                }
            }
            if (signerInfo.certs.isEmpty()) {
                signerInfo.addError(ApkVerifier.Issue.V2_SIG_NO_CERTIFICATES, new Object[0]);
                return;
            }
            X509Certificate x509Certificate = signerInfo.certs.get(0);
            try {
                encoded = ApkSigningBlockUtils.encodePublicKey(x509Certificate.getPublicKey());
            } catch (InvalidKeyException e15) {
                System.out.println("Caught an exception encoding the public key: " + e15);
                e15.printStackTrace();
                encoded = x509Certificate.getPublicKey().getEncoded();
            }
            if (!Arrays.equals(lengthPrefixedByteArray, encoded)) {
                signerInfo.addError(ApkVerifier.Issue.V2_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD, ApkSigningBlockUtils.toHex(encoded), ApkSigningBlockUtils.toHex(lengthPrefixedByteArray));
                return;
            }
            int i6 = 0;
            while (lengthPrefixedSlice4.hasRemaining()) {
                i6++;
                try {
                    ByteBuffer lengthPrefixedSlice7 = ApkSigningBlockUtils.getLengthPrefixedSlice(lengthPrefixedSlice4);
                    X509Certificate x509Certificate2 = x509Certificate;
                    try {
                        ByteBuffer byteBuffer4 = lengthPrefixedSlice4;
                        try {
                            signerInfo.contentDigests.add(new ApkSigningBlockUtils.Result.SignerInfo.ContentDigest(lengthPrefixedSlice7.getInt(), ApkSigningBlockUtils.readLengthPrefixedByteArray(lengthPrefixedSlice7)));
                            x509Certificate = x509Certificate2;
                            lengthPrefixedSlice4 = byteBuffer4;
                        } catch (ApkFormatException e16) {
                            signerInfo.addError(ApkVerifier.Issue.V2_SIG_MALFORMED_DIGEST, Integer.valueOf(i6));
                            return;
                        } catch (BufferUnderflowException e17) {
                            signerInfo.addError(ApkVerifier.Issue.V2_SIG_MALFORMED_DIGEST, Integer.valueOf(i6));
                            return;
                        }
                    } catch (ApkFormatException | BufferUnderflowException e18) {
                    }
                } catch (ApkFormatException | BufferUnderflowException e19) {
                }
            }
            ArrayList arrayList2 = new ArrayList(signerInfo.signatures.size());
            Iterator<ApkSigningBlockUtils.Result.SignerInfo.Signature> it3 = signerInfo.signatures.iterator();
            while (it3.hasNext()) {
                arrayList2.add(Integer.valueOf(it3.next().getAlgorithmId()));
            }
            ArrayList arrayList3 = new ArrayList(signerInfo.contentDigests.size());
            for (Iterator<ApkSigningBlockUtils.Result.SignerInfo.ContentDigest> it4 = signerInfo.contentDigests.iterator(); it4.hasNext(); it4 = it4) {
                arrayList3.add(Integer.valueOf(it4.next().getSignatureAlgorithmId()));
            }
            if (!arrayList2.equals(arrayList3)) {
                signerInfo.addError(ApkVerifier.Issue.V2_SIG_SIG_ALG_MISMATCH_BETWEEN_SIGNATURES_AND_DIGESTS_RECORDS, arrayList2, arrayList3);
                return;
            }
            Set<Integer> setKeySet = map.keySet();
            HashSet hashSet = new HashSet(1);
            int i7 = 0;
            while (lengthPrefixedSlice6.hasRemaining()) {
                int i8 = i7 + 1;
                try {
                    ByteBuffer lengthPrefixedSlice8 = ApkSigningBlockUtils.getLengthPrefixedSlice(lengthPrefixedSlice6);
                    int i9 = lengthPrefixedSlice8.getInt();
                    byte[] byteArray = ByteBufferUtils.toByteArray(lengthPrefixedSlice8);
                    ArrayList arrayList4 = arrayList3;
                    try {
                        byte[] bArr4 = encoded;
                        byte[] bArr5 = lengthPrefixedByteArray;
                        try {
                            signerInfo.additionalAttributes.add(new ApkSigningBlockUtils.Result.SignerInfo.AdditionalAttribute(i9, byteArray));
                            switch (i9) {
                                case V2SchemeConstants.STRIPPING_PROTECTION_ATTR_ID /* -1091571699 */:
                                    int i10 = ByteBuffer.wrap(byteArray).order(ByteOrder.LITTLE_ENDIAN).getInt();
                                    if (setKeySet.contains(Integer.valueOf(i10))) {
                                        try {
                                            hashSet.add(Integer.valueOf(i10));
                                        } catch (ApkFormatException | BufferUnderflowException e20) {
                                            signerInfo.addError(ApkVerifier.Issue.V2_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE, Integer.valueOf(i8));
                                            return;
                                        }
                                    } else {
                                        ApkVerifier.Issue issue = ApkVerifier.Issue.V2_SIG_UNKNOWN_APK_SIG_SCHEME_ID;
                                        Object[] objArr = new Object[2];
                                        objArr[0] = Integer.valueOf(signerInfo.index);
                                        objArr[1] = Integer.valueOf(i10);
                                        signerInfo.addWarning(issue, objArr);
                                    }
                                    i7 = i8;
                                    lengthPrefixedByteArray = bArr5;
                                    arrayList3 = arrayList4;
                                    encoded = bArr4;
                                    arrayList = arrayList;
                                    break;
                                default:
                                    try {
                                        signerInfo.addWarning(ApkVerifier.Issue.V2_SIG_UNKNOWN_ADDITIONAL_ATTRIBUTE, Integer.valueOf(i9));
                                        i7 = i8;
                                        lengthPrefixedByteArray = bArr5;
                                        arrayList3 = arrayList4;
                                        encoded = bArr4;
                                        arrayList = arrayList;
                                    } catch (ApkFormatException e21) {
                                        signerInfo.addError(ApkVerifier.Issue.V2_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE, Integer.valueOf(i8));
                                        return;
                                    } catch (BufferUnderflowException e22) {
                                        signerInfo.addError(ApkVerifier.Issue.V2_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE, Integer.valueOf(i8));
                                        return;
                                    }
                                    break;
                            }
                        } catch (ApkFormatException | BufferUnderflowException e23) {
                        }
                    } catch (ApkFormatException | BufferUnderflowException e24) {
                    }
                } catch (ApkFormatException | BufferUnderflowException e25) {
                }
                return;
            }
            Iterator it5 = hashSet.iterator();
            while (it5.hasNext()) {
                int iIntValue = ((Integer) it5.next()).intValue();
                if (!set2.contains(Integer.valueOf(iIntValue))) {
                    signerInfo.addError(ApkVerifier.Issue.V2_SIG_MISSING_APK_SIG_REFERENCED, Integer.valueOf(signerInfo.index), map.get(Integer.valueOf(iIntValue)));
                }
                hashSet = hashSet;
                i7 = i7;
            }
        } catch (ApkSigningBlockUtils.NoSupportedSignaturesException e26) {
            signerInfo.addError(ApkVerifier.Issue.V2_SIG_NO_SUPPORTED_SIGNATURES, e26);
        }
    }

    public static void parseSigners(ByteBuffer byteBuffer, Set<ContentDigestAlgorithm> set, Map<Integer, String> map, Set<Integer> set2, int i, int i2, ApkSigningBlockUtils.Result result) throws NoSuchAlgorithmException {
        try {
            ByteBuffer lengthPrefixedSlice = ApkSigningBlockUtils.getLengthPrefixedSlice(byteBuffer);
            if (!lengthPrefixedSlice.hasRemaining()) {
                result.addError(ApkVerifier.Issue.V2_SIG_NO_SIGNERS, new Object[0]);
                return;
            }
            try {
                CertificateFactory certificateFactory = CertificateFactory.getInstance("X.509");
                int i3 = 0;
                while (lengthPrefixedSlice.hasRemaining()) {
                    int i4 = i3;
                    int i5 = i3 + 1;
                    ApkSigningBlockUtils.Result.SignerInfo signerInfo = new ApkSigningBlockUtils.Result.SignerInfo();
                    signerInfo.index = i4;
                    result.signers.add(signerInfo);
                    try {
                        parseSigner(ApkSigningBlockUtils.getLengthPrefixedSlice(lengthPrefixedSlice), certificateFactory, signerInfo, set, map, set2, i, i2);
                        i3 = i5;
                    } catch (ApkFormatException | BufferUnderflowException e) {
                        signerInfo.addError(ApkVerifier.Issue.V2_SIG_MALFORMED_SIGNER, new Object[0]);
                        return;
                    }
                }
            } catch (CertificateException e2) {
                throw new RuntimeException("Failed to obtain X.509 CertificateFactory", e2);
            }
        } catch (ApkFormatException e3) {
            result.addError(ApkVerifier.Issue.V2_SIG_MALFORMED_SIGNERS, new Object[0]);
        }
    }

    public static ApkSigningBlockUtils.Result verify(RunnablesExecutor runnablesExecutor, DataSource dataSource, ApkUtils.ZipSections zipSections, Map<Integer, String> map, Set<Integer> set, int i, int i2) throws ApkSigningBlockUtils.SignatureNotFoundException, NoSuchAlgorithmException, IOException, ApkFormatException {
        ApkSigningBlockUtils.Result result = new ApkSigningBlockUtils.Result(2);
        SignatureInfo signatureInfoFindSignature = ApkSigningBlockUtils.findSignature(dataSource, zipSections, 1896449818, result);
        verify(runnablesExecutor, dataSource.slice(0L, signatureInfoFindSignature.apkSigningBlockOffset), signatureInfoFindSignature.signatureBlock, dataSource.slice(signatureInfoFindSignature.centralDirOffset, signatureInfoFindSignature.eocdOffset - signatureInfoFindSignature.centralDirOffset), signatureInfoFindSignature.eocd, map, set, i, i2, result);
        return result;
    }

    private static void verify(RunnablesExecutor runnablesExecutor, DataSource dataSource, ByteBuffer byteBuffer, DataSource dataSource2, ByteBuffer byteBuffer2, Map<Integer, String> map, Set<Integer> set, int i, int i2, ApkSigningBlockUtils.Result result) throws NoSuchAlgorithmException, IOException {
        HashSet hashSet = new HashSet(1);
        parseSigners(byteBuffer, hashSet, map, set, i, i2, result);
        if (result.containsErrors()) {
            return;
        }
        ApkSigningBlockUtils.verifyIntegrity(runnablesExecutor, dataSource, dataSource2, byteBuffer2, hashSet, result);
        if (result.containsErrors()) {
            return;
        }
        result.verified = true;
    }
}
