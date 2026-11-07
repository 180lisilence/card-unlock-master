package com.android.apksig.internal.apk.p002v3;

import com.android.apksig.apk.ApkFormatException;
import com.android.apksig.internal.apk.ApkSigningBlockUtils;
import com.android.apksig.internal.apk.SignatureAlgorithm;
import com.android.apksig.internal.util.GuaranteedEncodedFormX509Certificate;
import com.android.apksig.internal.util.X509CertificateUtils;
import java.io.IOException;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.Signature;
import java.security.SignatureException;
import java.security.cert.CertificateEncodingException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.security.spec.AlgorithmParameterSpec;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class V3SigningCertificateLineage {
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
            return (Objects.hash(this.signingCert, this.parentSigAlgorithm, this.sigAlgorithm, Integer.valueOf(this.flags)) * 31) + Arrays.hashCode(this.signature);
        }
    }

    public static byte[] encodeSignedData(X509Certificate x509Certificate, int i) {
        try {
            byte[] bArrEncodeAsLengthPrefixedElement = ApkSigningBlockUtils.encodeAsLengthPrefixedElement(x509Certificate.getEncoded());
            ByteBuffer byteBufferAllocate = ByteBuffer.allocate(bArrEncodeAsLengthPrefixedElement.length + 4);
            byteBufferAllocate.order(ByteOrder.LITTLE_ENDIAN);
            byteBufferAllocate.put(bArrEncodeAsLengthPrefixedElement);
            byteBufferAllocate.putInt(i);
            return ApkSigningBlockUtils.encodeAsLengthPrefixedElement(byteBufferAllocate.array());
        } catch (CertificateEncodingException e) {
            throw new RuntimeException("Failed to encode V3SigningCertificateLineage certificate", e);
        }
    }

    public static byte[] encodeSigningCertificateLineage(List<SigningCertificateNode> list) {
        ArrayList arrayList = new ArrayList();
        Iterator<SigningCertificateNode> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(encodeSigningCertificateNode(it.next()));
        }
        byte[] bArrEncodeAsSequenceOfLengthPrefixedElements = ApkSigningBlockUtils.encodeAsSequenceOfLengthPrefixedElements(arrayList);
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(bArrEncodeAsSequenceOfLengthPrefixedElements.length + 4);
        byteBufferAllocate.order(ByteOrder.LITTLE_ENDIAN);
        byteBufferAllocate.putInt(1);
        byteBufferAllocate.put(bArrEncodeAsSequenceOfLengthPrefixedElements);
        return byteBufferAllocate.array();
    }

    public static byte[] encodeSigningCertificateNode(SigningCertificateNode signingCertificateNode) {
        int id = signingCertificateNode.parentSigAlgorithm != null ? signingCertificateNode.parentSigAlgorithm.getId() : 0;
        int id2 = signingCertificateNode.sigAlgorithm != null ? signingCertificateNode.sigAlgorithm.getId() : 0;
        byte[] bArrEncodeSignedData = encodeSignedData(signingCertificateNode.signingCert, id);
        byte[] bArrEncodeAsLengthPrefixedElement = ApkSigningBlockUtils.encodeAsLengthPrefixedElement(signingCertificateNode.signature);
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(bArrEncodeSignedData.length + 4 + 4 + bArrEncodeAsLengthPrefixedElement.length);
        byteBufferAllocate.order(ByteOrder.LITTLE_ENDIAN);
        byteBufferAllocate.put(bArrEncodeSignedData);
        byteBufferAllocate.putInt(signingCertificateNode.flags);
        byteBufferAllocate.putInt(id2);
        byteBufferAllocate.put(bArrEncodeAsLengthPrefixedElement);
        return byteBufferAllocate.array();
    }

    public static List<SigningCertificateNode> readSigningCertificateLineage(ByteBuffer byteBuffer) throws IOException {
        CertificateException certificateException;
        Throwable th;
        Throwable th2;
        GuaranteedEncodedFormX509Certificate guaranteedEncodedFormX509Certificate;
        ArrayList arrayList = new ArrayList();
        int i = 0;
        if (byteBuffer == null || !byteBuffer.hasRemaining()) {
            return null;
        }
        ApkSigningBlockUtils.checkByteOrderLittleEndian(byteBuffer);
        GuaranteedEncodedFormX509Certificate guaranteedEncodedFormX509Certificate2 = null;
        int i2 = 0;
        try {
            int i3 = byteBuffer.getInt();
            if (i3 != 1) {
                throw new IllegalArgumentException("Encoded SigningCertificateLineage has a version different than any of which we are aware");
            }
            HashSet hashSet = new HashSet();
            while (byteBuffer.hasRemaining()) {
                try {
                    i++;
                    ByteBuffer lengthPrefixedSlice = ApkSigningBlockUtils.getLengthPrefixedSlice(byteBuffer);
                    ByteBuffer lengthPrefixedSlice2 = ApkSigningBlockUtils.getLengthPrefixedSlice(lengthPrefixedSlice);
                    int i4 = lengthPrefixedSlice.getInt();
                    int i5 = lengthPrefixedSlice.getInt();
                    SignatureAlgorithm signatureAlgorithmFindById = SignatureAlgorithm.findById(i2);
                    byte[] lengthPrefixedByteArray = ApkSigningBlockUtils.readLengthPrefixedByteArray(lengthPrefixedSlice);
                    if (guaranteedEncodedFormX509Certificate2 != null) {
                        String first = signatureAlgorithmFindById.getJcaSignatureAlgorithmAndParams().getFirst();
                        AlgorithmParameterSpec second = signatureAlgorithmFindById.getJcaSignatureAlgorithmAndParams().getSecond();
                        PublicKey publicKey = guaranteedEncodedFormX509Certificate2.getPublicKey();
                        Signature signature = Signature.getInstance(first);
                        signature.initVerify(publicKey);
                        if (second != null) {
                            signature.setParameter(second);
                        }
                        signature.update(lengthPrefixedSlice2);
                        if (!signature.verify(lengthPrefixedByteArray)) {
                            throw new SecurityException("Unable to verify signature of certificate #" + i + " using " + first + " when verifying V3SigningCertificateLineage object");
                        }
                    }
                    lengthPrefixedSlice2.rewind();
                    byte[] lengthPrefixedByteArray2 = ApkSigningBlockUtils.readLengthPrefixedByteArray(lengthPrefixedSlice2);
                    int i6 = lengthPrefixedSlice2.getInt();
                    if (guaranteedEncodedFormX509Certificate2 != null && i2 != i6) {
                        guaranteedEncodedFormX509Certificate2 = guaranteedEncodedFormX509Certificate2;
                        throw new SecurityException("Signing algorithm ID mismatch for certificate #" + lengthPrefixedSlice + " when verifying V3SigningCertificateLineage object");
                    }
                    try {
                        GuaranteedEncodedFormX509Certificate guaranteedEncodedFormX509Certificate3 = new GuaranteedEncodedFormX509Certificate(X509CertificateUtils.generateCertificate(lengthPrefixedByteArray2), lengthPrefixedByteArray2);
                        try {
                            if (hashSet.contains(guaranteedEncodedFormX509Certificate3)) {
                                guaranteedEncodedFormX509Certificate = guaranteedEncodedFormX509Certificate3;
                                throw new SecurityException("Encountered duplicate entries in SigningCertificateLineage at certificate #" + i + ".  All signing certificates should be unique");
                            }
                            hashSet.add(guaranteedEncodedFormX509Certificate3);
                            i2 = i5;
                            guaranteedEncodedFormX509Certificate = guaranteedEncodedFormX509Certificate3;
                            try {
                                arrayList.add(new SigningCertificateNode(guaranteedEncodedFormX509Certificate3, SignatureAlgorithm.findById(i6), SignatureAlgorithm.findById(i5), lengthPrefixedByteArray, i4));
                                i3 = i3;
                                guaranteedEncodedFormX509Certificate2 = guaranteedEncodedFormX509Certificate;
                            } catch (ApkFormatException e) {
                                e = e;
                                th2 = e;
                                throw new IOException("Failed to parse V3SigningCertificateLineage object", th2);
                            } catch (BufferUnderflowException e2) {
                                e = e2;
                                th2 = e;
                                throw new IOException("Failed to parse V3SigningCertificateLineage object", th2);
                            } catch (InvalidAlgorithmParameterException e3) {
                                e = e3;
                                th = e;
                                throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                            } catch (InvalidKeyException e4) {
                                e = e4;
                                th = e;
                                throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                            } catch (NoSuchAlgorithmException e5) {
                                e = e5;
                                th = e;
                                throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                            } catch (SignatureException e6) {
                                e = e6;
                                th = e;
                                throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                            } catch (CertificateException e7) {
                                certificateException = e7;
                                throw new SecurityException("Failed to decode certificate #" + i + " when parsing V3SigningCertificateLineage object", certificateException);
                            }
                        } catch (ApkFormatException e8) {
                            e = e8;
                            th2 = e;
                        } catch (BufferUnderflowException e9) {
                            e = e9;
                            th2 = e;
                        } catch (InvalidAlgorithmParameterException e10) {
                            e = e10;
                            th = e;
                            throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                        } catch (InvalidKeyException e11) {
                            e = e11;
                            th = e;
                            throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                        } catch (NoSuchAlgorithmException e12) {
                            e = e12;
                            th = e;
                            throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                        } catch (SignatureException e13) {
                            e = e13;
                            th = e;
                            throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                        } catch (CertificateException e14) {
                            certificateException = e14;
                        }
                    } catch (ApkFormatException e15) {
                        e = e15;
                        th2 = e;
                    } catch (BufferUnderflowException e16) {
                        e = e16;
                        th2 = e;
                    } catch (InvalidAlgorithmParameterException e17) {
                        e = e17;
                        th = e;
                        throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                    } catch (InvalidKeyException e18) {
                        e = e18;
                        th = e;
                        throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                    } catch (NoSuchAlgorithmException e19) {
                        e = e19;
                        th = e;
                        throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                    } catch (SignatureException e20) {
                        e = e20;
                        th = e;
                        throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                    } catch (CertificateException e21) {
                        certificateException = e21;
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
                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                } catch (InvalidKeyException e25) {
                    e = e25;
                    th = e;
                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                } catch (NoSuchAlgorithmException e26) {
                    e = e26;
                    th = e;
                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                } catch (SignatureException e27) {
                    e = e27;
                    th = e;
                    throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
                } catch (CertificateException e28) {
                    certificateException = e28;
                }
                throw new IOException("Failed to parse V3SigningCertificateLineage object", th2);
            }
            return arrayList;
        } catch (ApkFormatException e29) {
            e = e29;
            th2 = e;
        } catch (BufferUnderflowException e30) {
            e = e30;
            th2 = e;
        } catch (InvalidAlgorithmParameterException e31) {
            e = e31;
            th = e;
            throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
        } catch (InvalidKeyException e32) {
            e = e32;
            th = e;
            throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
        } catch (NoSuchAlgorithmException e33) {
            e = e33;
            th = e;
            throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
        } catch (SignatureException e34) {
            e = e34;
            th = e;
            throw new SecurityException("Failed to verify signature over signed data for certificate #" + i + " when parsing V3SigningCertificateLineage object", th);
        } catch (CertificateException e35) {
            certificateException = e35;
        }
    }
}
