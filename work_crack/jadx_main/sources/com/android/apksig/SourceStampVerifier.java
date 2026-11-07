package com.android.apksig;

import com.android.apksig.apk.ApkFormatException;
import com.android.apksig.apk.ApkUtilsLite;
import com.android.apksig.internal.apk.ApkSigResult;
import com.android.apksig.internal.apk.ApkSignerInfo;
import com.android.apksig.internal.apk.ApkSigningBlockUtilsLite;
import com.android.apksig.internal.apk.ContentDigestAlgorithm;
import com.android.apksig.internal.apk.SignatureAlgorithm;
import com.android.apksig.internal.apk.SignatureInfo;
import com.android.apksig.internal.apk.SignatureNotFoundException;
import com.android.apksig.internal.apk.stamp.V2SourceStampVerifier;
import com.android.apksig.internal.asn1.ber.BerEncoding;
import com.android.apksig.internal.util.GuaranteedEncodedFormX509Certificate;
import com.android.apksig.internal.zip.CentralDirectoryRecord;
import com.android.apksig.internal.zip.LocalFileRecord;
import com.android.apksig.internal.zip.ZipUtils;
import com.android.apksig.util.DataSource;
import com.android.apksig.util.DataSources;
import com.android.apksig.zip.ZipFormatException;
import com.android.apksig.zip.ZipSections;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.security.NoSuchAlgorithmException;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class SourceStampVerifier {
    private final DataSource mApkDataSource;
    private final File mApkFile;
    private final int mMaxSdkVersion;
    private final int mMinSdkVersion;

    public static class Builder {
        private final DataSource mApkDataSource;
        private final File mApkFile;
        private int mMinSdkVersion = 1;
        private int mMaxSdkVersion = Integer.MAX_VALUE;

        public Builder(DataSource dataSource) {
            if (dataSource == null) {
                throw new NullPointerException("apk == null");
            }
            this.mApkDataSource = dataSource;
            this.mApkFile = null;
        }

        public Builder(File file) {
            if (file == null) {
                throw new NullPointerException("apk == null");
            }
            this.mApkFile = file;
            this.mApkDataSource = null;
        }

        public SourceStampVerifier build() {
            return new SourceStampVerifier(this.mApkFile, this.mApkDataSource, this.mMinSdkVersion, this.mMaxSdkVersion);
        }

        public Builder setMaxCheckedPlatformVersion(int i) {
            this.mMaxSdkVersion = i;
            return this;
        }

        public Builder setMinCheckedPlatformVersion(int i) {
            this.mMinSdkVersion = i;
            return this;
        }
    }

    public static class Result {
        private final List<List<SignerInfo>> mAllSchemeSigners;
        private final List<ApkVerificationIssue> mErrors;
        private SourceStampInfo mSourceStampInfo;
        private final List<SignerInfo> mV1SchemeSigners;
        private final List<SignerInfo> mV2SchemeSigners;
        private final List<SignerInfo> mV3SchemeSigners;
        private boolean mVerified;
        private final List<ApkVerificationIssue> mWarnings;

        public static class SignerInfo {
            private X509Certificate mSigningCertificate;
            private final List<ApkVerificationIssue> mErrors = new ArrayList();
            private final List<ApkVerificationIssue> mWarnings = new ArrayList();

            void addVerificationError(int i, Object... objArr) {
                this.mErrors.add(new ApkVerificationIssue(i, objArr));
            }

            void addVerificationWarning(int i, Object... objArr) {
                this.mWarnings.add(new ApkVerificationIssue(i, objArr));
            }

            public boolean containsErrors() {
                return !this.mErrors.isEmpty();
            }

            public List<ApkVerificationIssue> getErrors() {
                return this.mErrors;
            }

            public X509Certificate getSigningCertificate() {
                return this.mSigningCertificate;
            }

            public List<ApkVerificationIssue> getWarnings() {
                return this.mWarnings;
            }

            void setSigningCertificate(X509Certificate x509Certificate) {
                this.mSigningCertificate = x509Certificate;
            }
        }

        public static class SourceStampInfo {
            private static final boolean mWarningsAsErrors = true;
            private final List<X509Certificate> mCertificateLineage;
            private final List<X509Certificate> mCertificates;
            private final List<ApkVerificationIssue> mErrors;
            private final List<ApkVerificationIssue> mInfoMessages;
            private final long mTimestamp;
            private final List<ApkVerificationIssue> mWarnings;

            private SourceStampInfo(ApkSignerInfo apkSignerInfo) {
                ArrayList arrayList = new ArrayList();
                this.mErrors = arrayList;
                ArrayList arrayList2 = new ArrayList();
                this.mWarnings = arrayList2;
                ArrayList arrayList3 = new ArrayList();
                this.mInfoMessages = arrayList3;
                this.mCertificates = apkSignerInfo.certs;
                this.mCertificateLineage = apkSignerInfo.certificateLineage;
                arrayList.addAll(apkSignerInfo.getErrors());
                arrayList2.addAll(apkSignerInfo.getWarnings());
                arrayList3.addAll(apkSignerInfo.getInfoMessages());
                this.mTimestamp = apkSignerInfo.timestamp;
            }

            public boolean containsErrors() {
                if (this.mErrors.isEmpty() && this.mWarnings.isEmpty()) {
                    return false;
                }
                return mWarningsAsErrors;
            }

            public boolean containsInfoMessages() {
                return this.mInfoMessages.isEmpty() ^ mWarningsAsErrors;
            }

            public X509Certificate getCertificate() {
                if (this.mCertificates.isEmpty()) {
                    return null;
                }
                return this.mCertificates.get(0);
            }

            public List<X509Certificate> getCertificatesInLineage() {
                return this.mCertificateLineage;
            }

            public List<ApkVerificationIssue> getErrors() {
                ArrayList arrayList = new ArrayList();
                arrayList.addAll(this.mErrors);
                arrayList.addAll(this.mWarnings);
                return arrayList;
            }

            public List<ApkVerificationIssue> getInfoMessages() {
                return this.mInfoMessages;
            }

            public long getTimestampEpochSeconds() {
                return this.mTimestamp;
            }

            public List<ApkVerificationIssue> getWarnings() {
                return this.mWarnings;
            }
        }

        public Result() {
            ArrayList arrayList = new ArrayList();
            this.mV1SchemeSigners = arrayList;
            ArrayList arrayList2 = new ArrayList();
            this.mV2SchemeSigners = arrayList2;
            ArrayList arrayList3 = new ArrayList();
            this.mV3SchemeSigners = arrayList3;
            this.mAllSchemeSigners = Arrays.asList(arrayList, arrayList2, arrayList3);
            this.mErrors = new ArrayList();
            this.mWarnings = new ArrayList();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addV1Signer(SignerInfo signerInfo) {
            this.mV1SchemeSigners.add(signerInfo);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addV2Signer(SignerInfo signerInfo) {
            this.mV2SchemeSigners.add(signerInfo);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addV3Signer(SignerInfo signerInfo) {
            this.mV3SchemeSigners.add(signerInfo);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeFrom(ApkSigResult apkSigResult) {
            switch (apkSigResult.signatureSchemeVersion) {
                case BerEncoding.TAG_CLASS_UNIVERSAL /* 0 */:
                    this.mVerified = apkSigResult.verified;
                    if (apkSigResult.mSigners.isEmpty()) {
                        return;
                    }
                    this.mSourceStampInfo = new SourceStampInfo(apkSigResult.mSigners.get(0));
                    return;
                default:
                    throw new IllegalArgumentException("Unknown ApkSigResult Signing Block Scheme Id " + apkSigResult.signatureSchemeVersion);
            }
        }

        void addVerificationError(int i, Object... objArr) {
            this.mErrors.add(new ApkVerificationIssue(i, objArr));
        }

        void addVerificationWarning(int i, Object... objArr) {
            this.mWarnings.add(new ApkVerificationIssue(i, objArr));
        }

        public boolean containsErrors() {
            if (!this.mErrors.isEmpty()) {
                return true;
            }
            Iterator<List<SignerInfo>> it = this.mAllSchemeSigners.iterator();
            while (it.hasNext()) {
                Iterator<SignerInfo> it2 = it.next().iterator();
                while (it2.hasNext()) {
                    if (it2.next().containsErrors()) {
                        return true;
                    }
                }
            }
            SourceStampInfo sourceStampInfo = this.mSourceStampInfo;
            return sourceStampInfo != null && sourceStampInfo.containsErrors();
        }

        public List<ApkVerificationIssue> getAllErrors() {
            ArrayList arrayList = new ArrayList();
            arrayList.addAll(this.mErrors);
            Iterator<List<SignerInfo>> it = this.mAllSchemeSigners.iterator();
            while (it.hasNext()) {
                Iterator<SignerInfo> it2 = it.next().iterator();
                while (it2.hasNext()) {
                    arrayList.addAll(it2.next().getErrors());
                }
            }
            SourceStampInfo sourceStampInfo = this.mSourceStampInfo;
            if (sourceStampInfo != null) {
                arrayList.addAll(sourceStampInfo.getErrors());
            }
            return arrayList;
        }

        public List<ApkVerificationIssue> getAllWarnings() {
            ArrayList arrayList = new ArrayList();
            arrayList.addAll(this.mWarnings);
            Iterator<List<SignerInfo>> it = this.mAllSchemeSigners.iterator();
            while (it.hasNext()) {
                Iterator<SignerInfo> it2 = it.next().iterator();
                while (it2.hasNext()) {
                    arrayList.addAll(it2.next().getWarnings());
                }
            }
            SourceStampInfo sourceStampInfo = this.mSourceStampInfo;
            if (sourceStampInfo != null) {
                arrayList.addAll(sourceStampInfo.getWarnings());
            }
            return arrayList;
        }

        public List<ApkVerificationIssue> getErrors() {
            return this.mErrors;
        }

        public SourceStampInfo getSourceStampInfo() {
            return this.mSourceStampInfo;
        }

        public List<SignerInfo> getV1SchemeSigners() {
            return this.mV1SchemeSigners;
        }

        public List<SignerInfo> getV2SchemeSigners() {
            return this.mV2SchemeSigners;
        }

        public List<SignerInfo> getV3SchemeSigners() {
            return this.mV3SchemeSigners;
        }

        public List<ApkVerificationIssue> getWarnings() {
            return this.mWarnings;
        }

        public boolean isVerified() {
            return this.mVerified;
        }
    }

    private SourceStampVerifier(File file, DataSource dataSource, int i, int i2) {
        this.mApkFile = file;
        this.mApkDataSource = dataSource;
        this.mMinSdkVersion = i;
        this.mMaxSdkVersion = i2;
    }

    private static Map<ContentDigestAlgorithm, byte[]> getApkContentDigestFromV1SigningScheme(List<CentralDirectoryRecord> list, DataSource dataSource, ZipSections zipSections, Result result) throws IOException, ApkFormatException {
        CentralDirectoryRecord centralDirectoryRecord = null;
        ArrayList<CentralDirectoryRecord> arrayList = new ArrayList(1);
        EnumMap enumMap = new EnumMap(ContentDigestAlgorithm.class);
        for (CentralDirectoryRecord centralDirectoryRecord2 : list) {
            String name = centralDirectoryRecord2.getName();
            if (name != null) {
                if (centralDirectoryRecord == null && "META-INF/MANIFEST.MF".equals(name)) {
                    centralDirectoryRecord = centralDirectoryRecord2;
                } else if (name.startsWith("META-INF/") && (name.endsWith(".RSA") || name.endsWith(".DSA") || name.endsWith(".EC"))) {
                    arrayList.add(centralDirectoryRecord2);
                }
            }
        }
        if (centralDirectoryRecord == null) {
            return enumMap;
        }
        if (arrayList.isEmpty()) {
            result.addVerificationWarning(36, new Object[0]);
        } else {
            for (CentralDirectoryRecord centralDirectoryRecord3 : arrayList) {
                try {
                    for (Certificate certificate : CertificateFactory.getInstance("X.509").generateCertificates(new ByteArrayInputStream(LocalFileRecord.getUncompressedData(dataSource, centralDirectoryRecord3, zipSections.getZipCentralDirectoryOffset())))) {
                        if (certificate instanceof X509Certificate) {
                            Result.SignerInfo signerInfo = new Result.SignerInfo();
                            signerInfo.setSigningCertificate((X509Certificate) certificate);
                            result.addV1Signer(signerInfo);
                            break;
                        }
                    }
                } catch (ZipFormatException e) {
                    throw new ApkFormatException("Failed to read APK", e);
                } catch (CertificateException e2) {
                    result.addVerificationWarning(37, centralDirectoryRecord3.getName(), e2);
                }
            }
        }
        try {
            enumMap.put(ContentDigestAlgorithm.SHA256, ApkUtilsLite.computeSha256DigestBytes(LocalFileRecord.getUncompressedData(dataSource, centralDirectoryRecord, zipSections.getZipCentralDirectoryOffset())));
            return enumMap;
        } catch (ZipFormatException e3) {
            throw new ApkFormatException("Failed to read APK", e3);
        }
    }

    private static void parseSigner(ByteBuffer byteBuffer, int i, CertificateFactory certificateFactory, Map<ContentDigestAlgorithm, byte[]> map, Result.SignerInfo signerInfo) throws ApkFormatException {
        boolean z = i == 2;
        ByteBuffer lengthPrefixedSlice = ApkSigningBlockUtilsLite.getLengthPrefixedSlice(byteBuffer);
        ByteBuffer lengthPrefixedSlice2 = ApkSigningBlockUtilsLite.getLengthPrefixedSlice(lengthPrefixedSlice);
        ByteBuffer lengthPrefixedSlice3 = ApkSigningBlockUtilsLite.getLengthPrefixedSlice(lengthPrefixedSlice);
        while (lengthPrefixedSlice2.hasRemaining()) {
            try {
                ByteBuffer lengthPrefixedSlice4 = ApkSigningBlockUtilsLite.getLengthPrefixedSlice(lengthPrefixedSlice2);
                int i2 = lengthPrefixedSlice4.getInt();
                byte[] lengthPrefixedByteArray = ApkSigningBlockUtilsLite.readLengthPrefixedByteArray(lengthPrefixedSlice4);
                SignatureAlgorithm signatureAlgorithmFindById = SignatureAlgorithm.findById(i2);
                if (signatureAlgorithmFindById != null) {
                    map.put(signatureAlgorithmFindById.getContentDigestAlgorithm(), lengthPrefixedByteArray);
                }
            } catch (ApkFormatException | BufferUnderflowException e) {
                signerInfo.addVerificationWarning(z ? 8 : 16, new Object[0]);
                return;
            }
        }
        if (lengthPrefixedSlice3.hasRemaining()) {
            byte[] lengthPrefixedByteArray2 = ApkSigningBlockUtilsLite.readLengthPrefixedByteArray(lengthPrefixedSlice3);
            try {
                signerInfo.setSigningCertificate(new GuaranteedEncodedFormX509Certificate((X509Certificate) certificateFactory.generateCertificate(new ByteArrayInputStream(lengthPrefixedByteArray2)), lengthPrefixedByteArray2));
            } catch (CertificateException e2) {
                signerInfo.addVerificationWarning(z ? 6 : 14, new Object[0]);
                return;
            }
        }
        if (signerInfo.getSigningCertificate() == null) {
            signerInfo.addVerificationWarning(z ? 7 : 15, new Object[0]);
        }
    }

    public static void parseSigners(ByteBuffer byteBuffer, int i, Map<ContentDigestAlgorithm, byte[]> map, Result result) {
        boolean z = i == 2;
        try {
            ByteBuffer lengthPrefixedSlice = ApkSigningBlockUtilsLite.getLengthPrefixedSlice(byteBuffer);
            if (!lengthPrefixedSlice.hasRemaining()) {
                result.addVerificationWarning(z ? 2 : 10, new Object[0]);
                return;
            }
            try {
                CertificateFactory certificateFactory = CertificateFactory.getInstance("X.509");
                while (lengthPrefixedSlice.hasRemaining()) {
                    Result.SignerInfo signerInfo = new Result.SignerInfo();
                    if (z) {
                        result.addV2Signer(signerInfo);
                    } else {
                        result.addV3Signer(signerInfo);
                    }
                    try {
                        parseSigner(ApkSigningBlockUtilsLite.getLengthPrefixedSlice(lengthPrefixedSlice), i, certificateFactory, map, signerInfo);
                    } catch (ApkFormatException | BufferUnderflowException e) {
                        signerInfo.addVerificationWarning(z ? 3 : 11, new Object[0]);
                        return;
                    }
                }
            } catch (CertificateException e2) {
                throw new RuntimeException("Failed to obtain X.509 CertificateFactory", e2);
            }
        } catch (ApkFormatException e3) {
            result.addVerificationWarning(z ? 1 : 9, new Object[0]);
        }
    }

    private Result verifySourceStamp(DataSource dataSource, String str) {
        CentralDirectoryRecord centralDirectoryRecord;
        SignatureInfo signatureInfoFindSignature;
        SignatureInfo signatureInfoFindSignature2;
        boolean z;
        Result result = new Result();
        try {
            try {
                ZipSections zipSectionsFindZipSections = ApkUtilsLite.findZipSections(dataSource);
                List<CentralDirectoryRecord> zipCentralDirectory = ZipUtils.parseZipCentralDirectory(dataSource, zipSectionsFindZipSections);
                Iterator<CentralDirectoryRecord> it = zipCentralDirectory.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        centralDirectoryRecord = null;
                        break;
                    }
                    CentralDirectoryRecord next = it.next();
                    if ("stamp-cert-sha256".equals(next.getName())) {
                        centralDirectoryRecord = next;
                        break;
                    }
                }
                if (centralDirectoryRecord == null) {
                    try {
                        ApkSigningBlockUtilsLite.findSignature(dataSource, zipSectionsFindZipSections, 1845461005);
                        z = true;
                    } catch (SignatureNotFoundException e) {
                        z = false;
                    }
                    result.addVerificationError(z ? 24 : 25, new Object[0]);
                    return result;
                }
                byte[] uncompressedData = LocalFileRecord.getUncompressedData(dataSource, centralDirectoryRecord, zipSectionsFindZipSections.getZipCentralDirectoryOffset());
                if (str != null) {
                    String hex = ApkSigningBlockUtilsLite.toHex(uncompressedData);
                    if (!str.equalsIgnoreCase(hex)) {
                        result.addVerificationError(23, hex, str);
                        return result;
                    }
                }
                HashMap map = new HashMap();
                if (this.mMaxSdkVersion >= 28) {
                    try {
                        signatureInfoFindSignature2 = ApkSigningBlockUtilsLite.findSignature(dataSource, zipSectionsFindZipSections, -262969152);
                    } catch (SignatureNotFoundException e2) {
                        signatureInfoFindSignature2 = null;
                    }
                    if (signatureInfoFindSignature2 != null) {
                        EnumMap enumMap = new EnumMap(ContentDigestAlgorithm.class);
                        parseSigners(signatureInfoFindSignature2.signatureBlock, 3, enumMap, result);
                        map.put(3, enumMap);
                    }
                }
                if (this.mMaxSdkVersion >= 24 && (this.mMinSdkVersion < 28 || map.isEmpty())) {
                    try {
                        signatureInfoFindSignature = ApkSigningBlockUtilsLite.findSignature(dataSource, zipSectionsFindZipSections, 1896449818);
                    } catch (SignatureNotFoundException e3) {
                        signatureInfoFindSignature = null;
                    }
                    if (signatureInfoFindSignature != null) {
                        EnumMap enumMap2 = new EnumMap(ContentDigestAlgorithm.class);
                        parseSigners(signatureInfoFindSignature.signatureBlock, 2, enumMap2, result);
                        map.put(2, enumMap2);
                    }
                }
                if (this.mMinSdkVersion < 24 || map.isEmpty()) {
                    map.put(1, getApkContentDigestFromV1SigningScheme(zipCentralDirectory, dataSource, zipSectionsFindZipSections, result));
                }
                result.mergeFrom(V2SourceStampVerifier.verify(dataSource, zipSectionsFindZipSections, uncompressedData, map, this.mMinSdkVersion, this.mMaxSdkVersion));
                return result;
            } catch (SignatureNotFoundException e4) {
                result.addVerificationError(30, new Object[0]);
                return result;
            }
        } catch (ApkFormatException e5) {
            e = e5;
            result.addVerificationError(28, e);
            return result;
        } catch (ZipFormatException e6) {
            e = e6;
            result.addVerificationError(28, e);
            return result;
        } catch (IOException e7) {
            e = e7;
            result.addVerificationError(28, e);
            return result;
        } catch (NoSuchAlgorithmException e8) {
            result.addVerificationError(29, e8);
            return result;
        }
    }

    public Result verifySourceStamp() {
        return verifySourceStamp(null);
    }

    public Result verifySourceStamp(String str) {
        RandomAccessFile randomAccessFile = null;
        try {
            try {
                DataSource dataSourceAsDataSource = this.mApkDataSource;
                if (dataSourceAsDataSource == null) {
                    if (this.mApkFile == null) {
                        throw new IllegalStateException("APK not provided");
                    }
                    RandomAccessFile randomAccessFile2 = new RandomAccessFile(this.mApkFile, "r");
                    randomAccessFile = randomAccessFile2;
                    dataSourceAsDataSource = DataSources.asDataSource(randomAccessFile2, 0L, randomAccessFile2.length());
                }
                Result resultVerifySourceStamp = verifySourceStamp(dataSourceAsDataSource, str);
                if (randomAccessFile != null) {
                    try {
                        randomAccessFile.close();
                    } catch (IOException e) {
                    }
                }
                return resultVerifySourceStamp;
            } catch (IOException e2) {
                Result result = new Result();
                result.addVerificationError(29, e2);
                if (0 != 0) {
                    try {
                        randomAccessFile.close();
                    } catch (IOException e3) {
                    }
                }
                return result;
            }
        } catch (Throwable th) {
            if (0 != 0) {
                try {
                    randomAccessFile.close();
                } catch (IOException e4) {
                }
            }
            throw th;
        }
    }
}
