package com.android.apksig;

import com.android.apksig.apk.ApkFormatException;
import com.android.apksig.apk.ApkSigningBlockNotFoundException;
import com.android.apksig.apk.ApkUtils;
import com.android.apksig.apk.MinSdkVersionException;
import com.android.apksig.internal.apk.ApkSigningBlockUtils;
import com.android.apksig.internal.util.ByteBufferDataSource;
import com.android.apksig.internal.zip.CentralDirectoryRecord;
import com.android.apksig.internal.zip.EocdRecord;
import com.android.apksig.internal.zip.LocalFileRecord;
import com.android.apksig.internal.zip.ZipUtils;
import com.android.apksig.util.DataSink;
import com.android.apksig.util.DataSinks;
import com.android.apksig.util.DataSource;
import com.android.apksig.util.DataSources;
import com.android.apksig.util.ReadableDataSink;
import com.android.apksig.zip.ZipFormatException;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.SignatureException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class ApkSigner {
    private static final short ALIGNMENT_ZIP_EXTRA_DATA_FIELD_HEADER_ID = -9931;
    private static final short ALIGNMENT_ZIP_EXTRA_DATA_FIELD_MIN_SIZE_BYTES = 6;
    private static final short ANDROID_COMMON_PAGE_ALIGNMENT_BYTES = 4096;
    private static final short ANDROID_FILE_ALIGNMENT_BYTES = 4096;
    private static final String ANDROID_MANIFEST_ZIP_ENTRY_NAME = "AndroidManifest.xml";
    private final boolean mAlignFileSize;
    private final String mCreatedBy;
    private final boolean mDebuggableApkPermitted;
    private final boolean mForceSourceStampOverwrite;
    private final DataSource mInputApkDataSource;
    private final File mInputApkFile;
    private final Integer mMinSdkVersion;
    private final boolean mOtherSignersSignaturesPreserved;
    private final DataSink mOutputApkDataSink;
    private final DataSource mOutputApkDataSource;
    private final File mOutputApkFile;
    private final File mOutputV4File;
    private final int mRotationMinSdkVersion;
    private final boolean mRotationTargetsDevRelease;
    private final List<SignerConfig> mSignerConfigs;
    private final ApkSignerEngine mSignerEngine;
    private final SigningCertificateLineage mSigningCertificateLineage;
    private final SignerConfig mSourceStampSignerConfig;
    private final SigningCertificateLineage mSourceStampSigningCertificateLineage;
    private final boolean mSourceStampTimestampEnabled;
    private final boolean mV1SigningEnabled;
    private final boolean mV2SigningEnabled;
    private final boolean mV3SigningEnabled;
    private final boolean mV4ErrorReportingEnabled;
    private final boolean mV4SigningEnabled;
    private final boolean mVerityEnabled;

    /* JADX INFO: renamed from: com.android.apksig.ApkSigner$1 */
    static /* synthetic */ class C00001 {

        /* JADX INFO: renamed from: $SwitchMap$com$android$apksig$ApkSignerEngine$InputJarEntryInstructions$OutputPolicy */
        static final /* synthetic */ int[] f0x62cebf84;

        static {
            int[] iArr = new int[ApkSignerEngine.InputJarEntryInstructions.OutputPolicy.values().length];
            f0x62cebf84 = iArr;
            try {
                iArr[ApkSignerEngine.InputJarEntryInstructions.OutputPolicy.OUTPUT.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                f0x62cebf84[ApkSignerEngine.InputJarEntryInstructions.OutputPolicy.OUTPUT_BY_ENGINE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                f0x62cebf84[ApkSignerEngine.InputJarEntryInstructions.OutputPolicy.SKIP.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    public static class Builder {
        private boolean mAlignFileSize;
        private String mCreatedBy;
        private boolean mDebuggableApkPermitted;
        private boolean mForceSourceStampOverwrite;
        private DataSource mInputApkDataSource;
        private File mInputApkFile;
        private Integer mMinSdkVersion;
        private boolean mOtherSignersSignaturesPreserved;
        private DataSink mOutputApkDataSink;
        private DataSource mOutputApkDataSource;
        private File mOutputApkFile;
        private File mOutputV4File;
        private int mRotationMinSdkVersion;
        private boolean mRotationTargetsDevRelease;
        private final List<SignerConfig> mSignerConfigs;
        private final ApkSignerEngine mSignerEngine;
        private SigningCertificateLineage mSigningCertificateLineage;
        private SignerConfig mSourceStampSignerConfig;
        private SigningCertificateLineage mSourceStampSigningCertificateLineage;
        private boolean mSourceStampTimestampEnabled;
        private boolean mV1SigningEnabled;
        private boolean mV2SigningEnabled;
        private boolean mV3SigningEnabled;
        private boolean mV3SigningExplicitlyDisabled;
        private boolean mV3SigningExplicitlyEnabled;
        private boolean mV4ErrorReportingEnabled;
        private boolean mV4SigningEnabled;
        private boolean mVerityEnabled;

        public Builder(ApkSignerEngine apkSignerEngine) {
            this.mForceSourceStampOverwrite = false;
            this.mSourceStampTimestampEnabled = true;
            this.mV1SigningEnabled = true;
            this.mV2SigningEnabled = true;
            this.mV3SigningEnabled = true;
            this.mV4SigningEnabled = false;
            this.mAlignFileSize = false;
            this.mVerityEnabled = false;
            this.mV4ErrorReportingEnabled = false;
            this.mDebuggableApkPermitted = true;
            this.mRotationMinSdkVersion = 33;
            this.mRotationTargetsDevRelease = false;
            this.mV3SigningExplicitlyDisabled = false;
            this.mV3SigningExplicitlyEnabled = false;
            if (apkSignerEngine == null) {
                throw new NullPointerException("signerEngine == null");
            }
            this.mSignerEngine = apkSignerEngine;
            this.mSignerConfigs = null;
        }

        public Builder(List<SignerConfig> list) {
            this.mForceSourceStampOverwrite = false;
            this.mSourceStampTimestampEnabled = true;
            this.mV1SigningEnabled = true;
            this.mV2SigningEnabled = true;
            this.mV3SigningEnabled = true;
            this.mV4SigningEnabled = false;
            this.mAlignFileSize = false;
            this.mVerityEnabled = false;
            this.mV4ErrorReportingEnabled = false;
            this.mDebuggableApkPermitted = true;
            this.mRotationMinSdkVersion = 33;
            this.mRotationTargetsDevRelease = false;
            this.mV3SigningExplicitlyDisabled = false;
            this.mV3SigningExplicitlyEnabled = false;
            if (list.isEmpty()) {
                throw new IllegalArgumentException("At least one signer config must be provided");
            }
            if (list.size() > 1) {
                this.mV3SigningEnabled = false;
            }
            this.mSignerConfigs = new ArrayList(list);
            this.mSignerEngine = null;
        }

        private void checkInitializedWithoutEngine() {
            if (this.mSignerEngine != null) {
                throw new IllegalStateException("Operation is not available when builder initialized with an engine");
            }
        }

        public ApkSigner build() {
            boolean z = this.mV3SigningExplicitlyDisabled;
            if (z && this.mV3SigningExplicitlyEnabled) {
                throw new IllegalStateException("Builder configured to both enable and disable APK Signature Scheme v3 signing");
            }
            if (z) {
                this.mV3SigningEnabled = false;
            }
            if (this.mV3SigningExplicitlyEnabled) {
                this.mV3SigningEnabled = true;
            }
            if (this.mV4SigningEnabled && !this.mV2SigningEnabled && !this.mV3SigningEnabled) {
                if (this.mV4ErrorReportingEnabled) {
                    throw new IllegalStateException("APK Signature Scheme v4 signing requires at least v2 or v3 signing to be enabled");
                }
                this.mV4SigningEnabled = false;
            }
            return new ApkSigner(this.mSignerConfigs, this.mSourceStampSignerConfig, this.mSourceStampSigningCertificateLineage, this.mForceSourceStampOverwrite, this.mSourceStampTimestampEnabled, this.mMinSdkVersion, this.mRotationMinSdkVersion, this.mRotationTargetsDevRelease, this.mV1SigningEnabled, this.mV2SigningEnabled, this.mV3SigningEnabled, this.mV4SigningEnabled, this.mAlignFileSize, this.mVerityEnabled, this.mV4ErrorReportingEnabled, this.mDebuggableApkPermitted, this.mOtherSignersSignaturesPreserved, this.mCreatedBy, this.mSignerEngine, this.mInputApkFile, this.mInputApkDataSource, this.mOutputApkFile, this.mOutputApkDataSink, this.mOutputApkDataSource, this.mOutputV4File, this.mSigningCertificateLineage, null);
        }

        public Builder setAlignFileSize(boolean z) {
            checkInitializedWithoutEngine();
            this.mAlignFileSize = z;
            return this;
        }

        public Builder setCreatedBy(String str) {
            checkInitializedWithoutEngine();
            if (str == null) {
                throw new NullPointerException();
            }
            this.mCreatedBy = str;
            return this;
        }

        public Builder setDebuggableApkPermitted(boolean z) {
            checkInitializedWithoutEngine();
            this.mDebuggableApkPermitted = z;
            return this;
        }

        public Builder setForceSourceStampOverwrite(boolean z) {
            this.mForceSourceStampOverwrite = z;
            return this;
        }

        public Builder setInputApk(DataSource dataSource) {
            if (dataSource == null) {
                throw new NullPointerException("inputApk == null");
            }
            this.mInputApkDataSource = dataSource;
            this.mInputApkFile = null;
            return this;
        }

        public Builder setInputApk(File file) {
            if (file == null) {
                throw new NullPointerException("inputApk == null");
            }
            this.mInputApkFile = file;
            this.mInputApkDataSource = null;
            return this;
        }

        public Builder setMinSdkVersion(int i) {
            checkInitializedWithoutEngine();
            this.mMinSdkVersion = Integer.valueOf(i);
            return this;
        }

        public Builder setMinSdkVersionForRotation(int i) {
            checkInitializedWithoutEngine();
            if (i < 33) {
                this.mRotationMinSdkVersion = 28;
            } else {
                this.mRotationMinSdkVersion = i;
            }
            return this;
        }

        public Builder setOtherSignersSignaturesPreserved(boolean z) {
            checkInitializedWithoutEngine();
            this.mOtherSignersSignaturesPreserved = z;
            return this;
        }

        public Builder setOutputApk(DataSink dataSink, DataSource dataSource) {
            if (dataSink == null) {
                throw new NullPointerException("outputApkOut == null");
            }
            if (dataSource == null) {
                throw new NullPointerException("outputApkIn == null");
            }
            this.mOutputApkFile = null;
            this.mOutputApkDataSink = dataSink;
            this.mOutputApkDataSource = dataSource;
            return this;
        }

        public Builder setOutputApk(ReadableDataSink readableDataSink) {
            if (readableDataSink != null) {
                return setOutputApk(readableDataSink, readableDataSink);
            }
            throw new NullPointerException("outputApk == null");
        }

        public Builder setOutputApk(File file) {
            if (file == null) {
                throw new NullPointerException("outputApk == null");
            }
            this.mOutputApkFile = file;
            this.mOutputApkDataSink = null;
            this.mOutputApkDataSource = null;
            return this;
        }

        public Builder setRotationTargetsDevRelease(boolean z) {
            checkInitializedWithoutEngine();
            this.mRotationTargetsDevRelease = z;
            return this;
        }

        public Builder setSigningCertificateLineage(SigningCertificateLineage signingCertificateLineage) {
            if (signingCertificateLineage != null) {
                this.mV3SigningEnabled = true;
                this.mSigningCertificateLineage = signingCertificateLineage;
            }
            return this;
        }

        public Builder setSourceStampSignerConfig(SignerConfig signerConfig) {
            this.mSourceStampSignerConfig = signerConfig;
            return this;
        }

        public Builder setSourceStampSigningCertificateLineage(SigningCertificateLineage signingCertificateLineage) {
            this.mSourceStampSigningCertificateLineage = signingCertificateLineage;
            return this;
        }

        public Builder setSourceStampTimestampEnabled(boolean z) {
            this.mSourceStampTimestampEnabled = z;
            return this;
        }

        public Builder setV1SigningEnabled(boolean z) {
            checkInitializedWithoutEngine();
            this.mV1SigningEnabled = z;
            return this;
        }

        public Builder setV2SigningEnabled(boolean z) {
            checkInitializedWithoutEngine();
            this.mV2SigningEnabled = z;
            return this;
        }

        public Builder setV3SigningEnabled(boolean z) {
            checkInitializedWithoutEngine();
            this.mV3SigningEnabled = z;
            if (z) {
                this.mV3SigningExplicitlyEnabled = true;
            } else {
                this.mV3SigningExplicitlyDisabled = true;
            }
            return this;
        }

        public Builder setV4ErrorReportingEnabled(boolean z) {
            checkInitializedWithoutEngine();
            this.mV4ErrorReportingEnabled = z;
            return this;
        }

        public Builder setV4SignatureOutputFile(File file) {
            if (file == null) {
                throw new NullPointerException("v4HashRootOutputFile == null");
            }
            this.mOutputV4File = file;
            return this;
        }

        public Builder setV4SigningEnabled(boolean z) {
            checkInitializedWithoutEngine();
            this.mV4SigningEnabled = z;
            this.mV4ErrorReportingEnabled = z;
            return this;
        }

        public Builder setVerityEnabled(boolean z) {
            checkInitializedWithoutEngine();
            this.mVerityEnabled = z;
            return this;
        }
    }

    private static class OutputSizeAndDataOffset {
        public long dataOffsetBytes;
        public long outputBytes;

        public OutputSizeAndDataOffset(long j, long j2) {
            this.outputBytes = j;
            this.dataOffsetBytes = j2;
        }
    }

    public static class SignerConfig {
        private final List<X509Certificate> mCertificates;
        private boolean mDeterministicDsaSigning;
        private final String mName;
        private final PrivateKey mPrivateKey;

        public static class Builder {
            private final List<X509Certificate> mCertificates;
            private final boolean mDeterministicDsaSigning;
            private final String mName;
            private final PrivateKey mPrivateKey;

            public Builder(String str, PrivateKey privateKey, List<X509Certificate> list) {
                this(str, privateKey, list, false);
            }

            public Builder(String str, PrivateKey privateKey, List<X509Certificate> list, boolean z) {
                if (str.isEmpty()) {
                    throw new IllegalArgumentException("Empty name");
                }
                this.mName = str;
                this.mPrivateKey = privateKey;
                this.mCertificates = new ArrayList(list);
                this.mDeterministicDsaSigning = z;
            }

            public SignerConfig build() {
                return new SignerConfig(this.mName, this.mPrivateKey, this.mCertificates, this.mDeterministicDsaSigning, null);
            }
        }

        private SignerConfig(String str, PrivateKey privateKey, List<X509Certificate> list, boolean z) {
            this.mName = str;
            this.mPrivateKey = privateKey;
            this.mCertificates = Collections.unmodifiableList(new ArrayList(list));
            this.mDeterministicDsaSigning = z;
        }

        /* synthetic */ SignerConfig(String str, PrivateKey privateKey, List list, boolean z, C00001 c00001) {
            this(str, privateKey, list, z);
        }

        public List<X509Certificate> getCertificates() {
            return this.mCertificates;
        }

        public boolean getDeterministicDsaSigning() {
            return this.mDeterministicDsaSigning;
        }

        public String getName() {
            return this.mName;
        }

        public PrivateKey getPrivateKey() {
            return this.mPrivateKey;
        }
    }

    private ApkSigner(List<SignerConfig> list, SignerConfig signerConfig, SigningCertificateLineage signingCertificateLineage, boolean z, boolean z2, Integer num, int i, boolean z3, boolean z4, boolean z5, boolean z6, boolean z7, boolean z8, boolean z9, boolean z10, boolean z11, boolean z12, String str, ApkSignerEngine apkSignerEngine, File file, DataSource dataSource, File file2, DataSink dataSink, DataSource dataSource2, File file3, SigningCertificateLineage signingCertificateLineage2) {
        this.mSignerConfigs = list;
        this.mSourceStampSignerConfig = signerConfig;
        this.mSourceStampSigningCertificateLineage = signingCertificateLineage;
        this.mForceSourceStampOverwrite = z;
        this.mSourceStampTimestampEnabled = z2;
        this.mMinSdkVersion = num;
        this.mRotationMinSdkVersion = i;
        this.mRotationTargetsDevRelease = z3;
        this.mV1SigningEnabled = z4;
        this.mV2SigningEnabled = z5;
        this.mV3SigningEnabled = z6;
        this.mV4SigningEnabled = z7;
        this.mAlignFileSize = z8;
        this.mVerityEnabled = z9;
        this.mV4ErrorReportingEnabled = z10;
        this.mDebuggableApkPermitted = z11;
        this.mOtherSignersSignaturesPreserved = z12;
        this.mCreatedBy = str;
        this.mSignerEngine = apkSignerEngine;
        this.mInputApkFile = file;
        this.mInputApkDataSource = dataSource;
        this.mOutputApkFile = file2;
        this.mOutputApkDataSink = dataSink;
        this.mOutputApkDataSource = dataSource2;
        this.mOutputV4File = file3;
        this.mSigningCertificateLineage = signingCertificateLineage2;
    }

    /* synthetic */ ApkSigner(List list, SignerConfig signerConfig, SigningCertificateLineage signingCertificateLineage, boolean z, boolean z2, Integer num, int i, boolean z3, boolean z4, boolean z5, boolean z6, boolean z7, boolean z8, boolean z9, boolean z10, boolean z11, boolean z12, String str, ApkSignerEngine apkSignerEngine, File file, DataSource dataSource, File file2, DataSink dataSink, DataSource dataSource2, File file3, SigningCertificateLineage signingCertificateLineage2, C00001 c00001) {
        this(list, signerConfig, signingCertificateLineage, z, z2, num, i, z3, z4, z5, z6, z7, z8, z9, z10, z11, z12, str, apkSignerEngine, file, dataSource, file2, dataSink, dataSource2, file3, signingCertificateLineage2);
    }

    private static ByteBuffer createExtraFieldToAlignData(ByteBuffer byteBuffer, long j, int i) {
        if (i <= 1) {
            return byteBuffer;
        }
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(byteBuffer.remaining() + 5 + i);
        byteBufferAllocate.order(ByteOrder.LITTLE_ENDIAN);
        while (byteBuffer.remaining() >= 4) {
            short s = byteBuffer.getShort();
            int unsignedInt16 = ZipUtils.getUnsignedInt16(byteBuffer);
            if (unsignedInt16 > byteBuffer.remaining()) {
                break;
            }
            if ((s == 0 && unsignedInt16 == 0) || s == -9931) {
                byteBuffer.position(byteBuffer.position() + unsignedInt16);
            } else {
                byteBuffer.position(byteBuffer.position() - 4);
                int iLimit = byteBuffer.limit();
                byteBuffer.limit(byteBuffer.position() + 4 + unsignedInt16);
                byteBufferAllocate.put(byteBuffer);
                byteBuffer.limit(iLimit);
            }
        }
        int iPosition = (i - ((int) (((((long) byteBufferAllocate.position()) + j) + 6) % ((long) i)))) % i;
        byteBufferAllocate.putShort(ALIGNMENT_ZIP_EXTRA_DATA_FIELD_HEADER_ID);
        ZipUtils.putUnsignedInt16(byteBufferAllocate, iPosition + 2);
        ZipUtils.putUnsignedInt16(byteBufferAllocate, i);
        byteBufferAllocate.position(byteBufferAllocate.position() + iPosition);
        byteBufferAllocate.flip();
        return byteBufferAllocate;
    }

    private static List<Hints.PatternWithRange> extractPinPatterns(List<CentralDirectoryRecord> list, DataSource dataSource) throws IOException, ApkFormatException {
        CentralDirectoryRecord centralDirectoryRecordFindCdRecord = findCdRecord(list, Hints.PIN_HINT_ASSET_ZIP_ENTRY_NAME);
        if (centralDirectoryRecordFindCdRecord == null) {
            return null;
        }
        new ArrayList();
        try {
            return Hints.parsePinPatterns(LocalFileRecord.getUncompressedData(dataSource, centralDirectoryRecordFindCdRecord, dataSource.size()));
        } catch (ZipFormatException e) {
            throw new ApkFormatException("Bad " + centralDirectoryRecordFindCdRecord);
        }
    }

    private static CentralDirectoryRecord findCdRecord(List<CentralDirectoryRecord> list, String str) {
        for (CentralDirectoryRecord centralDirectoryRecord : list) {
            if (str.equals(centralDirectoryRecord.getName())) {
                return centralDirectoryRecord;
            }
        }
        return null;
    }

    private static void fulfillInspectInputJarEntryRequest(DataSource dataSource, LocalFileRecord localFileRecord, ApkSignerEngine.InspectJarEntryRequest inspectJarEntryRequest) throws IOException, ApkFormatException {
        try {
            localFileRecord.outputUncompressedData(dataSource, inspectJarEntryRequest.getDataSink());
            inspectJarEntryRequest.done();
        } catch (ZipFormatException e) {
            throw new ApkFormatException("Malformed ZIP entry: " + localFileRecord.getName(), e);
        }
    }

    static ByteBuffer getAndroidManifestFromApk(List<CentralDirectoryRecord> list, DataSource dataSource) throws IOException, ApkFormatException, ZipFormatException {
        CentralDirectoryRecord centralDirectoryRecordFindCdRecord = findCdRecord(list, "AndroidManifest.xml");
        if (centralDirectoryRecordFindCdRecord != null) {
            return ByteBuffer.wrap(LocalFileRecord.getUncompressedData(dataSource, centralDirectoryRecordFindCdRecord, dataSource.size()));
        }
        throw new ApkFormatException("Missing AndroidManifest.xml");
    }

    private static int getInputJarEntryDataAlignmentMultiple(LocalFileRecord localFileRecord) {
        if (localFileRecord.isDataCompressed()) {
            return 1;
        }
        ByteBuffer extra = localFileRecord.getExtra();
        if (extra.hasRemaining()) {
            extra.order(ByteOrder.LITTLE_ENDIAN);
            while (extra.remaining() >= 4) {
                short s = extra.getShort();
                int unsignedInt16 = ZipUtils.getUnsignedInt16(extra);
                if (unsignedInt16 > extra.remaining()) {
                    break;
                }
                if (s == -9931) {
                    if (unsignedInt16 < 2) {
                        break;
                    }
                    return ZipUtils.getUnsignedInt16(extra);
                }
                extra.position(extra.position() + unsignedInt16);
            }
        }
        if (localFileRecord.getName().endsWith(".so")) {
            return ApkSigningBlockUtils.ANDROID_COMMON_PAGE_ALIGNMENT_BYTES;
        }
        return 4;
    }

    private static int getMinSdkVersionFromApk(List<CentralDirectoryRecord> list, DataSource dataSource) throws MinSdkVersionException, IOException {
        try {
            return ApkUtils.getMinSdkVersionFromBinaryAndroidManifest(getAndroidManifestFromApk(list, dataSource));
        } catch (ApkFormatException | ZipFormatException e) {
            throw new MinSdkVersionException("Failed to determine APK's minimum supported Android platform version", e);
        }
    }

    private static ByteBuffer getZipCentralDirectory(DataSource dataSource, ApkUtils.ZipSections zipSections) throws IOException, ApkFormatException {
        long zipCentralDirectorySizeBytes = zipSections.getZipCentralDirectorySizeBytes();
        if (zipCentralDirectorySizeBytes > 2147483647L) {
            throw new ApkFormatException("ZIP Central Directory too large: " + zipCentralDirectorySizeBytes);
        }
        ByteBuffer byteBuffer = dataSource.getByteBuffer(zipSections.getZipCentralDirectoryOffset(), (int) zipCentralDirectorySizeBytes);
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN);
        return byteBuffer;
    }

    private static long outputDataToOutputApk(String str, byte[] bArr, long j, List<CentralDirectoryRecord> list, int i, int i2, DataSink dataSink) throws IOException {
        ZipUtils.DeflateResult deflateResultDeflate = ZipUtils.deflate(ByteBuffer.wrap(bArr));
        byte[] bArr2 = deflateResultDeflate.output;
        long j2 = deflateResultDeflate.inputCrc32;
        long jOutputRecordWithDeflateCompressedData = LocalFileRecord.outputRecordWithDeflateCompressedData(str, i, i2, bArr2, j2, bArr.length, dataSink);
        list.add(CentralDirectoryRecord.createWithDeflateCompressedData(str, i, i2, j2, bArr2.length, bArr.length, j));
        return jOutputRecordWithDeflateCompressedData;
    }

    private static OutputSizeAndDataOffset outputInputJarEntryLfhRecordPreservingDataAlignment(DataSource dataSource, LocalFileRecord localFileRecord, DataSink dataSink, long j) throws IOException {
        long startOffsetInArchive = localFileRecord.getStartOffsetInArchive();
        if (startOffsetInArchive == j) {
            return new OutputSizeAndDataOffset(localFileRecord.outputRecord(dataSource, dataSink), localFileRecord.getDataStartOffsetInRecord());
        }
        int inputJarEntryDataAlignmentMultiple = getInputJarEntryDataAlignmentMultiple(localFileRecord);
        if (inputJarEntryDataAlignmentMultiple <= 1 || startOffsetInArchive % ((long) inputJarEntryDataAlignmentMultiple) == j % ((long) inputJarEntryDataAlignmentMultiple)) {
            return new OutputSizeAndDataOffset(localFileRecord.outputRecord(dataSource, dataSink), localFileRecord.getDataStartOffsetInRecord());
        }
        if ((((long) localFileRecord.getDataStartOffsetInRecord()) + startOffsetInArchive) % ((long) inputJarEntryDataAlignmentMultiple) != 0) {
            return new OutputSizeAndDataOffset(localFileRecord.outputRecord(dataSource, dataSink), localFileRecord.getDataStartOffsetInRecord());
        }
        ByteBuffer byteBufferCreateExtraFieldToAlignData = createExtraFieldToAlignData(localFileRecord.getExtra(), ((long) localFileRecord.getExtraFieldStartOffsetInsideRecord()) + j, inputJarEntryDataAlignmentMultiple);
        return new OutputSizeAndDataOffset(localFileRecord.outputRecordWithModifiedExtra(dataSource, byteBufferCreateExtraFieldToAlignData, dataSink), (((long) localFileRecord.getDataStartOffsetInRecord()) + ((long) byteBufferCreateExtraFieldToAlignData.remaining())) - ((long) localFileRecord.getExtra().remaining()));
    }

    private static List<CentralDirectoryRecord> parseZipCentralDirectory(ByteBuffer byteBuffer, ApkUtils.ZipSections zipSections) throws ApkFormatException {
        long zipCentralDirectoryOffset = zipSections.getZipCentralDirectoryOffset();
        int zipCentralDirectoryRecordCount = zipSections.getZipCentralDirectoryRecordCount();
        ArrayList arrayList = new ArrayList(zipCentralDirectoryRecordCount);
        HashSet hashSet = new HashSet(zipCentralDirectoryRecordCount);
        for (int i = 0; i < zipCentralDirectoryRecordCount; i++) {
            int iPosition = byteBuffer.position();
            try {
                CentralDirectoryRecord record = CentralDirectoryRecord.getRecord(byteBuffer);
                String name = record.getName();
                if (!hashSet.add(name)) {
                    throw new ApkFormatException("Multiple ZIP entries with the same name: " + name);
                }
                arrayList.add(record);
            } catch (ZipFormatException e) {
                throw new ApkFormatException("Malformed ZIP Central Directory record #" + (i + 1) + " at file offset " + (((long) iPosition) + zipCentralDirectoryOffset), e);
            }
        }
        if (byteBuffer.hasRemaining()) {
            throw new ApkFormatException("Unused space at the end of ZIP Central Directory: " + byteBuffer.remaining() + " bytes starting at file offset " + (((long) byteBuffer.position()) + zipCentralDirectoryOffset));
        }
        return arrayList;
    }

    private static void requestOutputEntryInspection(ApkSignerEngine apkSignerEngine, String str, byte[] bArr) throws IOException {
        ApkSignerEngine.InspectJarEntryRequest inspectJarEntryRequestOutputJarEntry = apkSignerEngine.outputJarEntry(str);
        if (inspectJarEntryRequestOutputJarEntry != null) {
            inspectJarEntryRequestOutputJarEntry.getDataSink().consume(bArr, 0, bArr.length);
            inspectJarEntryRequestOutputJarEntry.done();
        }
    }

    private void sign(DataSource dataSource, DataSink dataSink, DataSource dataSource2) throws SignatureException, NoSuchAlgorithmException, IOException, InvalidKeyException, ApkFormatException, ZipFormatException {
        long j;
        DataSource contents;
        DataSource dataSourceSlice;
        List<CentralDirectoryRecord> zipCentralDirectory;
        List<Hints.PatternWithRange> listExtractPinPatterns;
        ArrayList arrayList;
        ByteBuffer byteBuffer;
        ApkSignerEngine apkSignerEngineBuild;
        ArrayList arrayList2;
        byte[] uncompressedData;
        HashMap map;
        Iterator it;
        long j2;
        long size;
        int i;
        int i2;
        ApkSigner apkSigner;
        long jOutputDataToOutputApk;
        DataSink dataSink2;
        ByteBuffer byteBuffer2;
        byte[] bArr;
        boolean z;
        byte[] bArr2;
        List<CentralDirectoryRecord> list;
        int i3;
        int i4;
        long j3;
        int i5;
        long j4;
        DataSink dataSink3 = dataSink;
        try {
            ApkUtils.ZipSections zipSectionsFindZipSections = ApkUtils.findZipSections(dataSource);
            long startOffset = -1;
            try {
                ApkUtils.ApkSigningBlock apkSigningBlockFindApkSigningBlock = ApkUtils.findApkSigningBlock(dataSource, zipSectionsFindZipSections);
                startOffset = apkSigningBlockFindApkSigningBlock.getStartOffset();
                j = startOffset;
                contents = apkSigningBlockFindApkSigningBlock.getContents();
                while (true) {
                    contents = contents;
                    if (!it.hasNext()) {
                        byte[] bArr3 = uncompressedData;
                        int i6 = i2;
                        int i7 = i;
                        ApkUtils.ZipSections zipSections = zipSectionsFindZipSections;
                        ArrayList arrayList3 = arrayList;
                        List<CentralDirectoryRecord> list2 = zipCentralDirectory;
                        DataSource dataSource3 = dataSourceSlice;
                        long size2 = dataSource3.size();
                        if (size < size2) {
                            long j5 = size2 - size;
                            dataSource3.feed(size, j5, dataSink);
                            j2 += j5;
                        }
                        ArrayList arrayList4 = new ArrayList(list2.size() + 10);
                        Iterator<CentralDirectoryRecord> it2 = list2.iterator();
                        while (it2.hasNext()) {
                            CentralDirectoryRecord centralDirectoryRecord = (CentralDirectoryRecord) map.get(it2.next().getName());
                            if (centralDirectoryRecord != null) {
                                arrayList4.add(centralDirectoryRecord);
                            }
                        }
                        if (i7 == -1) {
                            i6 = 0;
                            i7 = 14881;
                        }
                        if (apkSignerEngineBuild.isEligibleForSourceStamp()) {
                            byte[] bArrGenerateSourceStampCertificateDigest = apkSignerEngineBuild.generateSourceStampCertificateDigest();
                            if (this.mForceSourceStampOverwrite || bArr3 == null) {
                                bArr = bArr3;
                            } else {
                                bArr = bArr3;
                                if (!Arrays.equals(bArrGenerateSourceStampCertificateDigest, bArr)) {
                                    throw new ApkFormatException(String.format("Cannot generate SourceStamp. APK contains an existing entry with the name: %s, and it is different than the provided source stamp certificate", "stamp-cert-sha256"));
                                }
                            }
                            apkSigner = this;
                            jOutputDataToOutputApk = j2 + outputDataToOutputApk("stamp-cert-sha256", bArrGenerateSourceStampCertificateDigest, j2, arrayList4, i6, i7, dataSink);
                        } else {
                            apkSigner = this;
                            jOutputDataToOutputApk = j2;
                        }
                        if (arrayList3 != null) {
                            arrayList3.add(new Hints.ByteRange(jOutputDataToOutputApk, Long.MAX_VALUE));
                            byte[] bArrEncodeByteRangeList = Hints.encodeByteRangeList(arrayList3);
                            requestOutputEntryInspection(apkSignerEngineBuild, Hints.PIN_BYTE_RANGE_ZIP_ENTRY_NAME, bArrEncodeByteRangeList);
                            jOutputDataToOutputApk += outputDataToOutputApk(Hints.PIN_BYTE_RANGE_ZIP_ENTRY_NAME, bArrEncodeByteRangeList, jOutputDataToOutputApk, arrayList4, i6, i7, dataSink);
                        }
                        ApkSignerEngine.OutputJarSignatureRequest outputJarSignatureRequestOutputJarEntries = apkSignerEngineBuild.outputJarEntries();
                        if (outputJarSignatureRequestOutputJarEntries != null) {
                            long jOutputDataToOutputApk2 = jOutputDataToOutputApk;
                            for (ApkSignerEngine.OutputJarSignatureRequest.JarEntry jarEntry : outputJarSignatureRequestOutputJarEntries.getAdditionalJarEntries()) {
                                String name = jarEntry.getName();
                                byte[] data = jarEntry.getData();
                                requestOutputEntryInspection(apkSignerEngineBuild, name, data);
                                jOutputDataToOutputApk2 += outputDataToOutputApk(name, data, jOutputDataToOutputApk2, arrayList4, i6, i7, dataSink);
                            }
                            outputJarSignatureRequestOutputJarEntries.done();
                            jOutputDataToOutputApk = jOutputDataToOutputApk2;
                        }
                        Iterator it3 = arrayList4.iterator();
                        long size3 = 0;
                        while (it3.hasNext()) {
                            size3 += (long) ((CentralDirectoryRecord) it3.next()).getSize();
                            i7 = i7;
                            outputJarSignatureRequestOutputJarEntries = outputJarSignatureRequestOutputJarEntries;
                        }
                        if (size3 > 2147483647L) {
                            throw new IOException("Output ZIP Central Directory too large: " + size3 + " bytes");
                        }
                        ByteBuffer byteBufferAllocate = ByteBuffer.allocate((int) size3);
                        Iterator it4 = arrayList4.iterator();
                        while (it4.hasNext()) {
                            ((CentralDirectoryRecord) it4.next()).copyTo(byteBufferAllocate);
                        }
                        byteBufferAllocate.flip();
                        ByteBufferDataSource byteBufferDataSource = new ByteBufferDataSource(byteBufferAllocate);
                        long j6 = jOutputDataToOutputApk;
                        ByteBuffer byteBufferCreateWithModifiedCentralDirectoryInfo = EocdRecord.createWithModifiedCentralDirectoryInfo(zipSections.getZipEndOfCentralDirectory(), arrayList4.size(), byteBufferDataSource.size(), j6);
                        ApkSignerEngine.OutputApkSigningBlockRequest2 outputApkSigningBlockRequest2OutputZipSections2 = apkSignerEngineBuild.outputZipSections2(dataSource2, byteBufferDataSource, DataSources.asDataSource(byteBufferCreateWithModifiedCentralDirectoryInfo));
                        if (outputApkSigningBlockRequest2OutputZipSections2 != null) {
                            int paddingSizeBeforeApkSigningBlock = outputApkSigningBlockRequest2OutputZipSections2.getPaddingSizeBeforeApkSigningBlock();
                            byte[] apkSigningBlock = outputApkSigningBlockRequest2OutputZipSections2.getApkSigningBlock();
                            outputApkSigningBlockRequest2OutputZipSections2.done();
                            long size4 = j6 + byteBufferDataSource.size() + ((long) paddingSizeBeforeApkSigningBlock) + ((long) apkSigningBlock.length) + ((long) byteBufferCreateWithModifiedCentralDirectoryInfo.remaining());
                            if (apkSigner.mAlignFileSize && size4 % 4096 != 0) {
                                byteBufferCreateWithModifiedCentralDirectoryInfo = EocdRecord.createWithPaddedComment(byteBufferCreateWithModifiedCentralDirectoryInfo, (int) (4096 - (size4 % 4096)));
                                outputApkSigningBlockRequest2OutputZipSections2 = apkSignerEngineBuild.outputZipSections2(dataSource2, new ByteBufferDataSource(byteBufferAllocate), DataSources.asDataSource(byteBufferCreateWithModifiedCentralDirectoryInfo));
                                apkSigningBlock = outputApkSigningBlockRequest2OutputZipSections2.getApkSigningBlock();
                                outputApkSigningBlockRequest2OutputZipSections2.done();
                            }
                            dataSink2 = dataSink;
                            dataSink2.consume(ByteBuffer.allocate(paddingSizeBeforeApkSigningBlock));
                            dataSink2.consume(apkSigningBlock, 0, apkSigningBlock.length);
                            ZipUtils.setZipEocdCentralDirectoryOffset(byteBufferCreateWithModifiedCentralDirectoryInfo, j6 + ((long) paddingSizeBeforeApkSigningBlock) + ((long) apkSigningBlock.length));
                            byteBuffer2 = byteBufferCreateWithModifiedCentralDirectoryInfo;
                        } else {
                            dataSink2 = dataSink;
                            byteBuffer2 = byteBufferCreateWithModifiedCentralDirectoryInfo;
                        }
                        byteBufferDataSource.feed(0L, byteBufferDataSource.size(), dataSink);
                        dataSink2.consume(byteBuffer2);
                        apkSignerEngineBuild.outputDone();
                        if (apkSigner.mV4SigningEnabled) {
                            apkSignerEngineBuild.signV4(dataSource2, apkSigner.mOutputV4File, !apkSigner.mV4ErrorReportingEnabled);
                            return;
                        }
                        return;
                    }
                    it = it;
                    CentralDirectoryRecord centralDirectoryRecord2 = (CentralDirectoryRecord) it.next();
                    arrayList2 = arrayList2;
                    String name2 = centralDirectoryRecord2.getName();
                    if (!Hints.PIN_BYTE_RANGE_ZIP_ENTRY_NAME.equals(name2)) {
                        if ("stamp-cert-sha256".equals(name2)) {
                            List<CentralDirectoryRecord> list3 = zipCentralDirectory;
                            try {
                                uncompressedData = LocalFileRecord.getUncompressedData(dataSourceSlice, centralDirectoryRecord2, dataSourceSlice.size());
                                zipCentralDirectory = list3;
                            } catch (ZipFormatException e) {
                                throw new ApkFormatException("Bad source stamp entry");
                            }
                        } else {
                            List<CentralDirectoryRecord> list4 = zipCentralDirectory;
                            ApkSignerEngine.InputJarEntryInstructions inputJarEntryInstructionsInputJarEntry = apkSignerEngineBuild.inputJarEntry(name2);
                            switch (C00001.f0x62cebf84[inputJarEntryInstructionsInputJarEntry.getOutputPolicy().ordinal()]) {
                                case 1:
                                    z = true;
                                    break;
                                case 2:
                                case 3:
                                    z = false;
                                    break;
                                default:
                                    throw new RuntimeException("Unknown output policy: " + inputJarEntryInstructionsInputJarEntry.getOutputPolicy());
                            }
                            long localFileHeaderOffset = centralDirectoryRecord2.getLocalFileHeaderOffset();
                            if (localFileHeaderOffset > size) {
                                long j7 = localFileHeaderOffset - size;
                                list = list4;
                                bArr2 = uncompressedData;
                                dataSourceSlice.feed(size, j7, dataSink);
                                j2 += j7;
                                size = localFileHeaderOffset;
                            } else {
                                bArr2 = uncompressedData;
                                list = list4;
                            }
                            try {
                                DataSource dataSource4 = dataSourceSlice;
                                try {
                                    LocalFileRecord record = LocalFileRecord.getRecord(dataSource4, centralDirectoryRecord2, dataSourceSlice.size());
                                    size += record.getSize();
                                    ApkSignerEngine.InspectJarEntryRequest inspectJarEntryRequest = inputJarEntryInstructionsInputJarEntry.getInspectJarEntryRequest();
                                    if (inspectJarEntryRequest != null) {
                                        fulfillInspectInputJarEntryRequest(dataSource4, record, inspectJarEntryRequest);
                                    }
                                    if (z) {
                                        int lastModificationDate = centralDirectoryRecord2.getLastModificationDate();
                                        int lastModificationTime = centralDirectoryRecord2.getLastModificationTime();
                                        if (i == -1 || lastModificationDate > i || (lastModificationDate == i && lastModificationTime > i2)) {
                                            i3 = lastModificationDate;
                                            i4 = lastModificationTime;
                                        } else {
                                            i3 = i;
                                            i4 = i2;
                                        }
                                        ApkSignerEngine.InspectJarEntryRequest inspectJarEntryRequestOutputJarEntry = apkSignerEngineBuild.outputJarEntry(name2);
                                        if (inspectJarEntryRequestOutputJarEntry != null) {
                                            fulfillInspectInputJarEntryRequest(dataSource4, record, inspectJarEntryRequestOutputJarEntry);
                                        }
                                        long j8 = j2;
                                        int i8 = i3;
                                        OutputSizeAndDataOffset outputSizeAndDataOffsetOutputInputJarEntryLfhRecordPreservingDataAlignment = outputInputJarEntryLfhRecordPreservingDataAlignment(dataSource4, record, dataSink3, j8);
                                        long j9 = j2 + outputSizeAndDataOffsetOutputInputJarEntryLfhRecordPreservingDataAlignment.outputBytes;
                                        long j10 = outputSizeAndDataOffsetOutputInputJarEntryLfhRecordPreservingDataAlignment.dataOffsetBytes + j8;
                                        if (listExtractPinPatterns != null) {
                                            boolean z2 = false;
                                            for (Hints.PatternWithRange patternWithRange : listExtractPinPatterns) {
                                                OutputSizeAndDataOffset outputSizeAndDataOffset = outputSizeAndDataOffsetOutputInputJarEntryLfhRecordPreservingDataAlignment;
                                                int i9 = i4;
                                                if (patternWithRange.matcher(centralDirectoryRecord2.getName()).matches()) {
                                                    j4 = j9;
                                                    Hints.ByteRange byteRangeClampToAbsoluteByteRange = patternWithRange.ClampToAbsoluteByteRange(new Hints.ByteRange(j10, j9));
                                                    if (byteRangeClampToAbsoluteByteRange != null) {
                                                        arrayList.add(byteRangeClampToAbsoluteByteRange);
                                                        z2 = true;
                                                    }
                                                } else {
                                                    j4 = j9;
                                                }
                                                i4 = i9;
                                                outputSizeAndDataOffsetOutputInputJarEntryLfhRecordPreservingDataAlignment = outputSizeAndDataOffset;
                                                j9 = j4;
                                            }
                                            j3 = j9;
                                            i5 = i4;
                                            if (z2) {
                                                arrayList.add(new Hints.ByteRange(j8, j10));
                                            }
                                        } else {
                                            j3 = j9;
                                            i5 = i4;
                                        }
                                        map.put(name2, j8 == record.getStartOffsetInArchive() ? centralDirectoryRecord2 : centralDirectoryRecord2.createWithModifiedLocalFileHeaderOffset(j8));
                                        i = i8;
                                        i2 = i5;
                                        j2 = j3;
                                    } else {
                                        i2 = i2;
                                    }
                                    dataSink3 = dataSink;
                                    dataSourceSlice = dataSource4;
                                    zipCentralDirectory = list;
                                    uncompressedData = bArr2;
                                    byteBuffer = byteBuffer;
                                    i = i;
                                    arrayList = arrayList;
                                    zipSectionsFindZipSections = zipSectionsFindZipSections;
                                } catch (ZipFormatException e2) {
                                    e = e2;
                                    throw new ApkFormatException("Malformed ZIP entry: " + centralDirectoryRecord2.getName(), e);
                                }
                            } catch (ZipFormatException e3) {
                                e = e3;
                            }
                        }
                    }
                }
            } catch (ApkSigningBlockNotFoundException e4) {
                j = startOffset;
                contents = null;
            }
            dataSourceSlice = dataSource.slice(0L, j != -1 ? j : zipSectionsFindZipSections.getZipCentralDirectoryOffset());
            ByteBuffer zipCentralDirectory2 = getZipCentralDirectory(dataSource, zipSectionsFindZipSections);
            zipCentralDirectory = parseZipCentralDirectory(zipCentralDirectory2, zipSectionsFindZipSections);
            listExtractPinPatterns = extractPinPatterns(zipCentralDirectory, dataSourceSlice);
            ArrayList arrayList5 = listExtractPinPatterns == null ? null : new ArrayList();
            if (this.mSignerEngine != null) {
                apkSignerEngineBuild = this.mSignerEngine;
                arrayList = arrayList5;
                byteBuffer = zipCentralDirectory2;
            } else {
                Integer num = this.mMinSdkVersion;
                int iIntValue = num != null ? num.intValue() : getMinSdkVersionFromApk(zipCentralDirectory, dataSourceSlice);
                ArrayList arrayList6 = new ArrayList(this.mSignerConfigs.size());
                Iterator<SignerConfig> it5 = this.mSignerConfigs.iterator();
                while (it5.hasNext()) {
                    SignerConfig next = it5.next();
                    arrayList6.add(new DefaultApkSignerEngine.SignerConfig.Builder(next.getName(), next.getPrivateKey(), next.getCertificates(), next.getDeterministicDsaSigning()).build());
                    arrayList5 = arrayList5;
                    zipCentralDirectory2 = zipCentralDirectory2;
                    it5 = it5;
                    j = j;
                }
                arrayList = arrayList5;
                byteBuffer = zipCentralDirectory2;
                DefaultApkSignerEngine.Builder rotationTargetsDevRelease = new DefaultApkSignerEngine.Builder(arrayList6, iIntValue).setV1SigningEnabled(this.mV1SigningEnabled).setV2SigningEnabled(this.mV2SigningEnabled).setV3SigningEnabled(this.mV3SigningEnabled).setVerityEnabled(this.mVerityEnabled).setDebuggableApkPermitted(this.mDebuggableApkPermitted).setOtherSignersSignaturesPreserved(this.mOtherSignersSignaturesPreserved).setSigningCertificateLineage(this.mSigningCertificateLineage).setMinSdkVersionForRotation(this.mRotationMinSdkVersion).setRotationTargetsDevRelease(this.mRotationTargetsDevRelease);
                String str = this.mCreatedBy;
                if (str != null) {
                    rotationTargetsDevRelease.setCreatedBy(str);
                }
                if (this.mSourceStampSignerConfig != null) {
                    rotationTargetsDevRelease.setStampSignerConfig(new DefaultApkSignerEngine.SignerConfig.Builder(this.mSourceStampSignerConfig.getName(), this.mSourceStampSignerConfig.getPrivateKey(), this.mSourceStampSignerConfig.getCertificates(), this.mSourceStampSignerConfig.getDeterministicDsaSigning()).build());
                    rotationTargetsDevRelease.setSourceStampTimestampEnabled(this.mSourceStampTimestampEnabled);
                }
                SigningCertificateLineage signingCertificateLineage = this.mSourceStampSigningCertificateLineage;
                if (signingCertificateLineage != null) {
                    rotationTargetsDevRelease.setSourceStampSigningCertificateLineage(signingCertificateLineage);
                }
                apkSignerEngineBuild = rotationTargetsDevRelease.build();
            }
            if (contents != null) {
                apkSignerEngineBuild.inputApkSigningBlock(contents);
            }
            arrayList2 = new ArrayList(zipCentralDirectory);
            Collections.sort(arrayList2, CentralDirectoryRecord.BY_LOCAL_FILE_HEADER_OFFSET_COMPARATOR);
            uncompressedData = null;
            map = new HashMap(zipCentralDirectory.size());
            it = arrayList2.iterator();
            j2 = 0;
            size = 0;
            i = -1;
            i2 = -1;
        } catch (ZipFormatException e5) {
            throw new ApkFormatException("Malformed APK: not a ZIP archive", e5);
        }
    }

    public void sign() throws IllegalStateException, NoSuchAlgorithmException, SignatureException, IOException, InvalidKeyException, ApkFormatException {
        DataSource dataSourceAsDataSource;
        RandomAccessFile randomAccessFile = null;
        try {
            DataSource dataSourceAsDataSource2 = this.mInputApkDataSource;
            if (dataSourceAsDataSource2 == null) {
                if (this.mInputApkFile == null) {
                    throw new IllegalStateException("Input APK not specified");
                }
                RandomAccessFile randomAccessFile2 = new RandomAccessFile(this.mInputApkFile, "r");
                randomAccessFile = randomAccessFile2;
                dataSourceAsDataSource2 = DataSources.asDataSource(randomAccessFile2);
            }
            RandomAccessFile randomAccessFile3 = null;
            try {
                DataSink dataSink = this.mOutputApkDataSink;
                if (dataSink != null) {
                    dataSourceAsDataSource = this.mOutputApkDataSource;
                } else {
                    if (this.mOutputApkFile == null) {
                        throw new IllegalStateException("Output APK not specified");
                    }
                    RandomAccessFile randomAccessFile4 = new RandomAccessFile(this.mOutputApkFile, "rw");
                    randomAccessFile3 = randomAccessFile4;
                    randomAccessFile4.setLength(0L);
                    DataSink dataSinkAsDataSink = DataSinks.asDataSink(randomAccessFile4);
                    dataSourceAsDataSource = DataSources.asDataSource(randomAccessFile4);
                    dataSink = dataSinkAsDataSink;
                }
                sign(dataSourceAsDataSource2, dataSink, dataSourceAsDataSource);
                if (randomAccessFile3 != null) {
                    randomAccessFile3.close();
                }
                if (randomAccessFile != null) {
                    randomAccessFile.close();
                }
            } catch (Throwable th) {
                if (0 != 0) {
                    randomAccessFile3.close();
                }
                throw th;
            }
        } catch (Throwable th2) {
            if (randomAccessFile != null) {
                randomAccessFile.close();
            }
            throw th2;
        }
    }
}
