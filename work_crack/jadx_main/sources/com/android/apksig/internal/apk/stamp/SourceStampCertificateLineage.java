package com.android.apksig.internal.apk.stamp;

import com.android.apksig.apk.ApkFormatException;
import com.android.apksig.internal.apk.ApkSigningBlockUtilsLite;
import com.android.apksig.internal.apk.SignatureAlgorithm;
import com.android.apksig.internal.util.GuaranteedEncodedFormX509Certificate;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.Signature;
import java.security.SignatureException;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.security.spec.AlgorithmParameterSpec;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class SourceStampCertificateLineage {
    private static final int CURRENT_VERSION = 1;
    private static final int FIRST_VERSION = 1;

    public static class SigningCertificateNode {
        public int flags;
        public final SignatureAlgorithm parentSigAlgorithm;
        public SignatureAlgorithm sigAlgorithm;
        public final byte[] signature;
        public final X509Certificate signingCert;

        public SigningCertificateNode(X509Certificate x509Certificate, SignatureAlgorithm signatureAlgorithm, SignatureAlgorithm signatureAlgorithm2, byte[] bArr, int i) {
            this.signingCert = x509Certificate;
            this.parentSigAlgorithm = signatureAlgorithm;
            this.sigAlgorithm = signatureAlgorithm2;
            this.signature = bArr;
            this.flags = i;
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof SigningCertificateNode)) {
                return false;
            }
            SigningCertificateNode signingCertificateNode = (SigningCertificateNode) obj;
            return this.signingCert.equals(signingCertificateNode.signingCert) && this.parentSigAlgorithm == signingCertificateNode.parentSigAlgorithm && this.sigAlgorithm == signingCertificateNode.sigAlgorithm && Arrays.equals(this.signature, signingCertificateNode.signature) && this.flags == signingCertificateNode.flags;
        }

        public int hashCode() {
            int i = 1 * 31;
            X509Certificate x509Certificate = this.signingCert;
            int iHashCode = (i + (x509Certificate == null ? 0 : x509Certificate.hashCode())) * 31;
            SignatureAlgorithm signatureAlgorithm = this.parentSigAlgorithm;
            int iHashCode2 = (iHashCode + (signatureAlgorithm == null ? 0 : signatureAlgorithm.hashCode())) * 31;
            SignatureAlgorithm signatureAlgorithm2 = this.sigAlgorithm;
            return ((((iHashCode2 + (signatureAlgorithm2 != null ? signatureAlgorithm2.hashCode() : 0)) * 31) + Arrays.hashCode(this.signature)) * 31) + this.flags;
        }
    }

    public static List<SigningCertificateNode> readSigningCertificateLineage(ByteBuffer byteBuffer) throws IOException {
        CertificateException certificateException;
        Throwable th;
        Throwable th2;
        ArrayList arrayList = new ArrayList();
        int i = 0;
        if (byteBuffer == null || !byteBuffer.hasRemaining()) {
            return null;
        }
        ApkSigningBlockUtilsLite.checkByteOrderLittleEndian(byteBuffer);
        try {
            CertificateFactory certificateFactory = CertificateFactory.getInstance("X.509");
            GuaranteedEncodedFormX509Certificate guaranteedEncodedFormX509Certificate = null;
            int i2 = 0;
            try {
                int i3 = byteBuffer.getInt();
                try {
                    if (i3 != 1) {
                        throw new IllegalArgumentException("Encoded SigningCertificateLineage has a version different than any of which we are aware");
                    }
                    HashSet hashSet = new HashSet();
                    while (byteBuffer.hasRemaining()) {
                        try {
                            i++;
                            ByteBuffer lengthPrefixedSlice = ApkSigningBlockUtilsLite.getLengthPrefixedSlice(byteBuffer);
                            ByteBuffer lengthPrefixedSlice2 = ApkSigningBlockUtilsLite.getLengthPrefixedSlice(lengthPrefixedSlice);
                            int i4 = lengthPrefixedSlice.getInt();
                            int i5 = lengthPrefixedSlice.getInt();
                            SignatureAlgorithm signatureAlgorithmFindById = SignatureAlgorithm.findById(i2);
                            byte[] lengthPrefixedByteArray = ApkSigningBlockUtilsLite.readLengthPrefixedByteArray(lengthPrefixedSlice);
                            if (guaranteedEncodedFormX509Certificate != null) {
                                try {
                                    String first = signatureAlgorithmFindById.getJcaSignatureAlgorithmAndParams().getFirst();
                                    AlgorithmParameterSpec second = signatureAlgorithmFindById.getJcaSignatureAlgorithmAndParams().getSecond();
                                    PublicKey publicKey = guaranteedEncodedFormX509Certificate.getPublicKey();
                                    Signature signature = Signature.getInstance(first);
                                    signature.initVerify(publicKey);
                                    if (second != null) {
                                        signature.setParameter(second);
                                    }
                                    signature.update(lengthPrefixedSlice2);
                                    if (!signature.verify(lengthPrefixedByteArray)) {
                                        throw new SecurityException("Unable to verify signature of certificate #" + i + " using " + first + " when verifying SourceStampCertificateLineage object");
                                    }
                                } catch (ApkFormatException e) {
                                    e = e;
                                    th2 = e;
                                } catch (BufferUnderflowException e2) {
                                    e = e2;
                                    th2 = e;
                                } catch (InvalidAlgorithmParameterException e3) {
                                    th = e3;
                                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                } catch (InvalidKeyException e4) {
                                    th = e4;
                                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                } catch (NoSuchAlgorithmException e5) {
                                    th = e5;
                                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                } catch (SignatureException e6) {
                                    th = e6;
                                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                } catch (CertificateException e7) {
                                    certificateException = e7;
                                    throw new SecurityException("Failed to decode certificate #" + i + " when parsing SourceStampCertificateLineage object", certificateException);
                                }
                            }
                            lengthPrefixedSlice2.rewind();
                            byte[] lengthPrefixedByteArray2 = ApkSigningBlockUtilsLite.readLengthPrefixedByteArray(lengthPrefixedSlice2);
                            int i6 = lengthPrefixedSlice2.getInt();
                            if (guaranteedEncodedFormX509Certificate == null || i2 == i6) {
                                try {
                                    guaranteedEncodedFormX509Certificate = new GuaranteedEncodedFormX509Certificate((X509Certificate) certificateFactory.generateCertificate(new ByteArrayInputStream(lengthPrefixedByteArray2)), lengthPrefixedByteArray2);
                                    if (hashSet.contains(guaranteedEncodedFormX509Certificate)) {
                                        throw new SecurityException("Encountered duplicate entries in SigningCertificateLineage at certificate #" + i + ".  All signing certificates should be unique");
                                    }
                                    hashSet.add(guaranteedEncodedFormX509Certificate);
                                    i2 = i5;
                                    CertificateFactory certificateFactory2 = certificateFactory;
                                    arrayList.add(new SigningCertificateNode(guaranteedEncodedFormX509Certificate, SignatureAlgorithm.findById(i6), SignatureAlgorithm.findById(i5), lengthPrefixedByteArray, i4));
                                    i3 = i3;
                                    certificateFactory = certificateFactory2;
                                } catch (ApkFormatException e8) {
                                    th2 = e8;
                                } catch (BufferUnderflowException e9) {
                                    th2 = e9;
                                } catch (InvalidAlgorithmParameterException e10) {
                                    th = e10;
                                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                } catch (InvalidKeyException e11) {
                                    th = e11;
                                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                } catch (NoSuchAlgorithmException e12) {
                                    th = e12;
                                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                } catch (SignatureException e13) {
                                    th = e13;
                                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                } catch (CertificateException e14) {
                                    certificateException = e14;
                                    throw new SecurityException("Failed to decode certificate #" + i + " when parsing SourceStampCertificateLineage object", certificateException);
                                }
                            } else {
                                try {
                                    try {
                                        throw new SecurityException("Signing algorithm ID mismatch for certificate #" + lengthPrefixedSlice + " when verifying SourceStampCertificateLineage object");
                                    } catch (ApkFormatException e15) {
                                        e = e15;
                                        th2 = e;
                                        throw new IOException("Failed to parse SourceStampCertificateLineage object", th2);
                                    } catch (BufferUnderflowException e16) {
                                        e = e16;
                                        th2 = e;
                                        throw new IOException("Failed to parse SourceStampCertificateLineage object", th2);
                                    } catch (InvalidAlgorithmParameterException e17) {
                                        th = e17;
                                        throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                    } catch (InvalidKeyException e18) {
                                        th = e18;
                                        throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                    } catch (NoSuchAlgorithmException e19) {
                                        th = e19;
                                        throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                    } catch (SignatureException e20) {
                                        th = e20;
                                        throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                    } catch (CertificateException e21) {
                                        certificateException = e21;
                                        throw new SecurityException("Failed to decode certificate #" + i + " when parsing SourceStampCertificateLineage object", certificateException);
                                    }
                                } catch (ApkFormatException e22) {
                                    e = e22;
                                    th2 = e;
                                } catch (BufferUnderflowException e23) {
                                    e = e23;
                                    th2 = e;
                                } catch (InvalidAlgorithmParameterException e24) {
                                    e = e24;
                                    th = e;
                                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                } catch (InvalidKeyException e25) {
                                    e = e25;
                                    th = e;
                                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                } catch (NoSuchAlgorithmException e26) {
                                    e = e26;
                                    th = e;
                                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                } catch (SignatureException e27) {
                                    e = e27;
                                    th = e;
                                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                                } catch (CertificateException e28) {
                                    certificateException = e28;
                                }
                            }
                        } catch (ApkFormatException e29) {
                            e = e29;
                            th2 = e;
                        } catch (BufferUnderflowException e30) {
                            e = e30;
                            th2 = e;
                        } catch (InvalidAlgorithmParameterException e31) {
                            e = e31;
                            th = e;
                            throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                        } catch (InvalidKeyException e32) {
                            e = e32;
                            th = e;
                            throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                        } catch (NoSuchAlgorithmException e33) {
                            e = e33;
                            th = e;
                            throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                        } catch (SignatureException e34) {
                            e = e34;
                            th = e;
                            throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing SourceStampCertificateLineage object", th);
                        } catch (CertificateException e35) {
                            certificateException = e35;
                        }
                    }
                    return arrayList;
                } catch (ApkFormatException e36) {
                    e = e36;
                    th2 = e;
                } catch (BufferUnderflowException e37) {
                    e = e37;
                    th2 = e;
                } catch (InvalidAlgorithmParameterException e38) {
                    th = e38;
                } catch (InvalidKeyException e39) {
                    th = e39;
                } catch (NoSuchAlgorithmException e40) {
                    th = e40;
                } catch (SignatureException e41) {
                    th = e41;
                } catch (CertificateException e42) {
                    certificateException = e42;
                }
            } catch (ApkFormatException e43) {
                th2 = e43;
            } catch (BufferUnderflowException e44) {
                th2 = e44;
            } catch (InvalidAlgorithmParameterException e45) {
                th = e45;
            } catch (InvalidKeyException e46) {
                th = e46;
            } catch (NoSuchAlgorithmException e47) {
                th = e47;
            } catch (SignatureException e48) {
                th = e48;
            } catch (CertificateException e49) {
                certificateException = e49;
            }
            throw new IOException("Failed to parse SourceStampCertificateLineage object", th2);
        } catch (CertificateException e50) {
            throw new IllegalStateException("Failed to obtain X.509 CertificateFactory", e50);
        }
    }
}
