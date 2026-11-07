package com.android.apksig;

import com.android.apksig.apk.ApkFormatException;
import com.android.apksig.apk.ApkUtils;
import com.android.apksig.internal.apk.AndroidBinXmlParser;
import com.android.apksig.internal.apk.ApkSigResult;
import com.android.apksig.internal.apk.ApkSignerInfo;
import com.android.apksig.internal.apk.ApkSigningBlockUtils;
import com.android.apksig.internal.apk.ContentDigestAlgorithm;
import com.android.apksig.internal.apk.SignatureAlgorithm;
import com.android.apksig.internal.apk.SignatureInfo;
import com.android.apksig.internal.apk.SignatureNotFoundException;
import com.android.apksig.internal.apk.p000v1.V1SchemeVerifier;
import com.android.apksig.internal.apk.p001v2.V2SchemeVerifier;
import com.android.apksig.internal.apk.p002v3.V3SchemeVerifier;
import com.android.apksig.internal.apk.p003v4.V4SchemeVerifier;
import com.android.apksig.internal.apk.stamp.V2SourceStampVerifier;
import com.android.apksig.internal.asn1.ber.BerEncoding;
import com.android.apksig.internal.zip.CentralDirectoryRecord;
import com.android.apksig.internal.zip.LocalFileRecord;
import com.android.apksig.util.DataSource;
import com.android.apksig.util.DataSources;
import com.android.apksig.util.RunnablesExecutor;
import com.android.apksig.zip.ZipFormatException;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateEncodingException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.IntPredicate;
import java.util.function.ToIntFunction;

/* JADX INFO: loaded from: classes.dex */
public class ApkVerifier {
    private static final Map<Integer, String> SUPPORTED_APK_SIG_SCHEME_NAMES = loadSupportedApkSigSchemeNames();
    private final DataSource mApkDataSource;
    private final File mApkFile;
    private final int mMaxSdkVersion;
    private final Integer mMinSdkVersion;
    private final File mV4SignatureFile;

    public static class ApkVerificationIssueAdapter {
        static final Map<Integer, Issue> sVerificationIssueIdToIssue;

        static {
            HashMap map = new HashMap();
            sVerificationIssueIdToIssue = map;
            map.put(1, Issue.V2_SIG_MALFORMED_SIGNERS);
            map.put(2, Issue.V2_SIG_NO_SIGNERS);
            map.put(3, Issue.V2_SIG_MALFORMED_SIGNER);
            map.put(4, Issue.V2_SIG_MALFORMED_SIGNATURE);
            map.put(5, Issue.V2_SIG_NO_SIGNATURES);
            map.put(6, Issue.V2_SIG_MALFORMED_CERTIFICATE);
            map.put(7, Issue.V2_SIG_NO_CERTIFICATES);
            map.put(8, Issue.V2_SIG_MALFORMED_DIGEST);
            map.put(9, Issue.V3_SIG_MALFORMED_SIGNERS);
            map.put(10, Issue.V3_SIG_NO_SIGNERS);
            map.put(11, Issue.V3_SIG_MALFORMED_SIGNER);
            map.put(12, Issue.V3_SIG_MALFORMED_SIGNATURE);
            map.put(13, Issue.V3_SIG_NO_SIGNATURES);
            map.put(14, Issue.V3_SIG_MALFORMED_CERTIFICATE);
            map.put(15, Issue.V3_SIG_NO_CERTIFICATES);
            map.put(16, Issue.V3_SIG_MALFORMED_DIGEST);
            map.put(17, Issue.SOURCE_STAMP_NO_SIGNATURE);
            map.put(18, Issue.SOURCE_STAMP_MALFORMED_CERTIFICATE);
            map.put(19, Issue.SOURCE_STAMP_UNKNOWN_SIG_ALGORITHM);
            map.put(20, Issue.SOURCE_STAMP_MALFORMED_SIGNATURE);
            map.put(21, Issue.SOURCE_STAMP_DID_NOT_VERIFY);
            map.put(22, Issue.SOURCE_STAMP_VERIFY_EXCEPTION);
            map.put(23, Issue.SOURCE_STAMP_EXPECTED_DIGEST_MISMATCH);
            map.put(24, Issue.SOURCE_STAMP_SIGNATURE_BLOCK_WITHOUT_CERT_DIGEST);
            map.put(25, Issue.SOURCE_STAMP_CERT_DIGEST_AND_SIG_BLOCK_MISSING);
            map.put(26, Issue.SOURCE_STAMP_NO_SUPPORTED_SIGNATURE);
            map.put(27, Issue.SOURCE_STAMP_CERTIFICATE_MISMATCH_BETWEEN_SIGNATURE_BLOCK_AND_APK);
            map.put(28, Issue.MALFORMED_APK);
            map.put(29, Issue.UNEXPECTED_EXCEPTION);
            map.put(30, Issue.SOURCE_STAMP_SIG_MISSING);
            map.put(31, Issue.SOURCE_STAMP_MALFORMED_ATTRIBUTE);
            map.put(32, Issue.SOURCE_STAMP_UNKNOWN_ATTRIBUTE);
            map.put(33, Issue.SOURCE_STAMP_MALFORMED_LINEAGE);
            map.put(34, Issue.SOURCE_STAMP_POR_CERT_MISMATCH);
            map.put(35, Issue.SOURCE_STAMP_POR_DID_NOT_VERIFY);
            map.put(36, Issue.JAR_SIG_NO_SIGNATURES);
            map.put(37, Issue.JAR_SIG_PARSE_EXCEPTION);
            map.put(38, Issue.SOURCE_STAMP_INVALID_TIMESTAMP);
        }

        private ApkVerificationIssueAdapter() {
        }

        public static List<IssueWithParams> getIssuesFromVerificationIssues(List<? extends ApkVerificationIssue> list) {
            ArrayList arrayList = new ArrayList(list.size());
            for (ApkVerificationIssue apkVerificationIssue : list) {
                if (apkVerificationIssue instanceof IssueWithParams) {
                    arrayList.add((IssueWithParams) apkVerificationIssue);
                } else {
                    arrayList.add(new IssueWithParams(sVerificationIssueIdToIssue.get(Integer.valueOf(apkVerificationIssue.getIssueId())), apkVerificationIssue.getParams()));
                }
            }
            return arrayList;
        }
    }

    public static class Builder {
        private final DataSource mApkDataSource;
        private final File mApkFile;
        private int mMaxSdkVersion = Integer.MAX_VALUE;
        private Integer mMinSdkVersion;
        private File mV4SignatureFile;

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

        public ApkVerifier build() {
            return new ApkVerifier(this.mApkFile, this.mApkDataSource, this.mV4SignatureFile, this.mMinSdkVersion, this.mMaxSdkVersion);
        }

        public Builder setMaxCheckedPlatformVersion(int i) {
            this.mMaxSdkVersion = i;
            return this;
        }

        public Builder setMinCheckedPlatformVersion(int i) {
            this.mMinSdkVersion = Integer.valueOf(i);
            return this;
        }

        public Builder setV4SignatureFile(File file) {
            this.mV4SignatureFile = file;
            return this;
        }
    }

    private static class ByteArray {
        private final byte[] mArray;
        private final int mHashCode;

        private ByteArray(byte[] bArr) {
            this.mArray = bArr;
            this.mHashCode = Arrays.hashCode(bArr);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ByteArray)) {
                return false;
            }
            ByteArray byteArray = (ByteArray) obj;
            return hashCode() == byteArray.hashCode() && Arrays.equals(this.mArray, byteArray.mArray);
        }

        public int hashCode() {
            return this.mHashCode;
        }
    }

    public enum Issue {
        JAR_SIG_NO_SIGNATURES("No JAR signatures"),
        JAR_SIG_NO_SIGNED_ZIP_ENTRIES("No JAR entries covered by JAR signatures"),
        JAR_SIG_DUPLICATE_ZIP_ENTRY("Duplicate entry: %1$s"),
        JAR_SIG_DUPLICATE_MANIFEST_SECTION("Duplicate section in META-INF/MANIFEST.MF: %1$s"),
        JAR_SIG_UNNNAMED_MANIFEST_SECTION("Malformed META-INF/MANIFEST.MF: invidual section #%1$d does not have a name"),
        JAR_SIG_UNNNAMED_SIG_FILE_SECTION("Malformed %1$s: invidual section #%2$d does not have a name"),
        JAR_SIG_NO_MANIFEST("Missing META-INF/MANIFEST.MF"),
        JAR_SIG_MISSING_ZIP_ENTRY_REFERENCED_IN_MANIFEST("%1$s entry referenced by META-INF/MANIFEST.MF not found in the APK"),
        JAR_SIG_NO_ZIP_ENTRY_DIGEST_IN_MANIFEST("No digest for %1$s in META-INF/MANIFEST.MF"),
        JAR_SIG_NO_ZIP_ENTRY_DIGEST_IN_SIG_FILE("No digest for %1$s in %2$s"),
        JAR_SIG_ZIP_ENTRY_NOT_SIGNED("%1$s entry not signed"),
        JAR_SIG_ZIP_ENTRY_SIGNERS_MISMATCH("Entries %1$s and %3$s are signed with different sets of signers : <%2$s> vs <%4$s>"),
        JAR_SIG_ZIP_ENTRY_DIGEST_DID_NOT_VERIFY("%2$s digest of %1$s does not match the digest specified in %3$s. Expected: <%5$s>, actual: <%4$s>"),
        JAR_SIG_MANIFEST_MAIN_SECTION_DIGEST_DID_NOT_VERIFY("%1$s digest of META-INF/MANIFEST.MF main section does not match the digest specified in %2$s. Expected: <%4$s>, actual: <%3$s>"),
        JAR_SIG_MANIFEST_SECTION_DIGEST_DID_NOT_VERIFY("%2$s digest of META-INF/MANIFEST.MF section for %1$s does not match the digest specified in %3$s. Expected: <%5$s>, actual: <%4$s>"),
        JAR_SIG_NO_MANIFEST_DIGEST_IN_SIG_FILE("%1$s does not specify digest of META-INF/MANIFEST.MF. This slows down verification."),
        JAR_SIG_NO_APK_SIG_STRIP_PROTECTION("APK is signed using APK Signature Scheme v2 but these signatures may be stripped without being detected because %1$s does not contain anti-stripping protections."),
        JAR_SIG_MISSING_FILE("Partial JAR signature. Found: %1$s, missing: %2$s"),
        JAR_SIG_VERIFY_EXCEPTION("Failed to verify JAR signature %1$s against %2$s: %3$s"),
        JAR_SIG_UNSUPPORTED_SIG_ALG("JAR signature %1$s uses digest algorithm %5$s and signature algorithm %6$s which is not supported on API Level(s) %4$s for which this APK is being verified"),
        JAR_SIG_PARSE_EXCEPTION("Failed to parse JAR signature %1$s: %2$s"),
        JAR_SIG_MALFORMED_CERTIFICATE("Malformed certificate in JAR signature %1$s: %2$s"),
        JAR_SIG_DID_NOT_VERIFY("JAR signature %1$s did not verify against %2$s"),
        JAR_SIG_NO_SIGNERS("JAR signature %1$s contains no signers"),
        JAR_SIG_DUPLICATE_SIG_FILE_SECTION("Duplicate section in %1$s: %2$s"),
        JAR_SIG_MISSING_VERSION_ATTR_IN_SIG_FILE("Malformed %1$s: missing Signature-Version attribute"),
        JAR_SIG_UNKNOWN_APK_SIG_SCHEME_ID("JAR signature %1$s references unknown APK signature scheme ID: %2$d"),
        JAR_SIG_MISSING_APK_SIG_REFERENCED("JAR signature %1$s indicates the APK is signed using %3$s but no such signature was found. Signature stripped?"),
        JAR_SIG_UNPROTECTED_ZIP_ENTRY("%1$s not protected by signature. Unauthorized modifications to this JAR entry will not be detected. Delete or move the entry outside of META-INF/."),
        JAR_SIG_MISSING("No JAR signature from this signer"),
        NO_SIG_FOR_TARGET_SANDBOX_VERSION("Missing APK Signature Scheme v2 signature required for target sandbox version %1$d"),
        MIN_SIG_SCHEME_FOR_TARGET_SDK_NOT_MET("Target SDK version %1$d requires a minimum of signature scheme v%2$d; the APK is not signed with this or a later signature scheme"),
        V2_SIG_MISSING("No APK Signature Scheme v2 signature from this signer"),
        V2_SIG_MALFORMED_SIGNERS("Malformed list of signers"),
        V2_SIG_MALFORMED_SIGNER("Malformed signer block"),
        V2_SIG_MALFORMED_PUBLIC_KEY("Malformed public key: %1$s"),
        V2_SIG_MALFORMED_CERTIFICATE("Malformed certificate #%2$d: %3$s"),
        V2_SIG_MALFORMED_SIGNATURE("Malformed APK Signature Scheme v2 signature record #%1$d"),
        V2_SIG_MALFORMED_DIGEST("Malformed APK Signature Scheme v2 digest record #%1$d"),
        V2_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE("Malformed additional attribute #%1$d"),
        V2_SIG_UNKNOWN_APK_SIG_SCHEME_ID("APK Signature Scheme v2 signer: %1$s references unknown APK signature scheme ID: %2$d"),
        V2_SIG_MISSING_APK_SIG_REFERENCED("APK Signature Scheme v2 signature %1$s indicates the APK is signed using %2$s but no such signature was found. Signature stripped?"),
        V2_SIG_NO_SIGNERS("No signers in APK Signature Scheme v2 signature"),
        V2_SIG_UNKNOWN_SIG_ALGORITHM("Unknown signature algorithm: %1$#x"),
        V2_SIG_UNKNOWN_ADDITIONAL_ATTRIBUTE("Unknown additional attribute: ID %1$#x"),
        V2_SIG_VERIFY_EXCEPTION("Failed to verify %1$s signature: %2$s"),
        V2_SIG_DID_NOT_VERIFY("%1$s signature over signed-data did not verify"),
        V2_SIG_NO_SIGNATURES("No signatures"),
        V2_SIG_NO_SUPPORTED_SIGNATURES("No supported signatures: %1$s"),
        V2_SIG_NO_CERTIFICATES("No certificates"),
        V2_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD("Public key mismatch between certificate and signature record: <%1$s> vs <%2$s>"),
        V2_SIG_SIG_ALG_MISMATCH_BETWEEN_SIGNATURES_AND_DIGESTS_RECORDS("Signature algorithms mismatch between signatures and digests records: %1$s vs %2$s"),
        V2_SIG_APK_DIGEST_DID_NOT_VERIFY("APK integrity check failed. %1$s digest mismatch. Expected: <%2$s>, actual: <%3$s>"),
        V3_SIG_MALFORMED_SIGNERS("Malformed list of signers"),
        V3_SIG_MALFORMED_SIGNER("Malformed signer block"),
        V3_SIG_MALFORMED_PUBLIC_KEY("Malformed public key: %1$s"),
        V3_SIG_MALFORMED_CERTIFICATE("Malformed certificate #%2$d: %3$s"),
        V3_SIG_MALFORMED_SIGNATURE("Malformed APK Signature Scheme v3 signature record #%1$d"),
        V3_SIG_MALFORMED_DIGEST("Malformed APK Signature Scheme v3 digest record #%1$d"),
        V3_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE("Malformed additional attribute #%1$d"),
        V3_SIG_NO_SIGNERS("No signers in APK Signature Scheme v3 signature"),
        V3_SIG_MULTIPLE_SIGNERS("Multiple APK Signature Scheme v3 signatures found for a single  platform version."),
        V3_SIG_MULTIPLE_PAST_SIGNERS("Multiple signatures found for pre-v3 signing with an APK  Signature Scheme v3 signer.  Only one allowed."),
        V3_SIG_PAST_SIGNERS_MISMATCH("v3 signer differs from v1/v2 signer without proper signing certificate lineage."),
        V3_SIG_UNKNOWN_SIG_ALGORITHM("Unknown signature algorithm: %1$#x"),
        V3_SIG_UNKNOWN_ADDITIONAL_ATTRIBUTE("Unknown additional attribute: ID %1$#x"),
        V3_SIG_VERIFY_EXCEPTION("Failed to verify %1$s signature: %2$s"),
        V3_SIG_INVALID_SDK_VERSIONS("Invalid SDK Version parameter(s) encountered in APK Signature scheme v3 signature: minSdkVersion %1$s maxSdkVersion: %2$s"),
        V3_SIG_DID_NOT_VERIFY("%1$s signature over signed-data did not verify"),
        V3_SIG_NO_SIGNATURES("No signatures"),
        V3_SIG_NO_SUPPORTED_SIGNATURES("No supported signatures"),
        V3_SIG_NO_CERTIFICATES("No certificates"),
        V3_MIN_SDK_VERSION_MISMATCH_BETWEEN_SIGNER_AND_SIGNED_DATA_RECORD("minSdkVersion mismatch between signed data and signature record: <%1$s> vs <%2$s>"),
        V3_MAX_SDK_VERSION_MISMATCH_BETWEEN_SIGNER_AND_SIGNED_DATA_RECORD("maxSdkVersion mismatch between signed data and signature record: <%1$s> vs <%2$s>"),
        V3_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD("Public key mismatch between certificate and signature record: <%1$s> vs <%2$s>"),
        V3_SIG_SIG_ALG_MISMATCH_BETWEEN_SIGNATURES_AND_DIGESTS_RECORDS("Signature algorithms mismatch between signatures and digests records: %1$s vs %2$s"),
        V3_SIG_APK_DIGEST_DID_NOT_VERIFY("APK integrity check failed. %1$s digest mismatch. Expected: <%2$s>, actual: <%3$s>"),
        V3_SIG_POR_DID_NOT_VERIFY("SigningCertificateLineage attribute containd a proof-of-rotation record with signature(s) that did not verify."),
        V3_SIG_MALFORMED_LINEAGE("Failed to parse the SigningCertificateLineage structure in the APK Signature Scheme v3 signature's additional attributes section."),
        V3_SIG_POR_CERT_MISMATCH("APK signing certificate differs from the associated certificate found in the signer's SigningCertificateLineage."),
        V3_INCONSISTENT_SDK_VERSIONS("APK Signature Scheme v3 signers supported min/max SDK versions are not continuous."),
        V3_MISSING_SDK_VERSIONS("APK Signature Scheme v3 signers supported min/max SDK versions do not cover the entire desired range.  Found min:  %1$s max %2$s"),
        V3_INCONSISTENT_LINEAGES("SigningCertificateLineages targeting different platform versions using APK Signature Scheme v3 are not all a part of the same overall lineage."),
        V31_BLOCK_MISSING("The v3 signer indicates key rotation should be supported starting from SDK version %1$s, but a v3.1 block was not found"),
        V31_ROTATION_MIN_SDK_MISMATCH("The v3 signer indicates key rotation should be supported starting from SDK version %1$s, but the v3.1 block targets %2$s for rotation"),
        V31_ROTATION_MIN_SDK_ATTR_MISSING("APK supports key rotation starting from SDK version %1$s, but the v3 signer does not contain the attribute to detect if this signature is stripped"),
        V31_BLOCK_FOUND_WITHOUT_V3_BLOCK("The APK contains a v3.1 signing block without a v3.0 base block"),
        V31_ROTATION_TARGETS_DEV_RELEASE_ATTR_ON_V3_SIGNER("The rotation-targets-dev-release attribute is only supported on v3.1 signers; this attribute will be ignored by the platform in a v3.0 signer"),
        APK_SIG_BLOCK_UNKNOWN_ENTRY_ID("APK Signing Block contains unknown entry: ID %1$#x"),
        V4_SIG_MALFORMED_SIGNERS("V4 signature has malformed signer block"),
        V4_SIG_UNKNOWN_SIG_ALGORITHM("V4 signature has unknown signing algorithm: %1$#x"),
        V4_SIG_NO_SIGNATURES("V4 signature has no signature found"),
        V4_SIG_NO_SUPPORTED_SIGNATURES("V4 signature has no supported signature"),
        V4_SIG_DID_NOT_VERIFY("%1$s signature over signed-data did not verify"),
        V4_SIG_VERIFY_EXCEPTION("Failed to verify %1$s signature: %2$s"),
        V4_SIG_MALFORMED_PUBLIC_KEY("Malformed public key: %1$s"),
        V4_SIG_MALFORMED_CERTIFICATE("V4 signature has malformed certificate"),
        V4_SIG_NO_CERTIFICATE("V4 signature has no certificate"),
        V4_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD("V4 signature has mismatched certificate and signature: <%1$s> vs <%2$s>"),
        V4_SIG_APK_ROOT_DID_NOT_VERIFY("V4 signature's hash tree root (content digest) did not verity"),
        V4_SIG_APK_TREE_DID_NOT_VERIFY("V4 signature's hash tree did not verity"),
        V4_SIG_MULTIPLE_SIGNERS("V4 signature only supports one signer"),
        V4_SIG_V2_V3_SIGNERS_MISMATCH("V4 signature and V2/V3 signature have mismatched certificates"),
        V4_SIG_V2_V3_DIGESTS_MISMATCH("V4 signature and V2/V3 signature have mismatched digests"),
        V4_SIG_VERSION_NOT_CURRENT("V4 signature format version %1$d is different from the tool's current version %2$d"),
        SOURCE_STAMP_CERT_DIGEST_AND_SIG_BLOCK_MISSING("Neither the source stamp certificate digest file nor the signature block are present in the APK"),
        SOURCE_STAMP_SIG_MISSING("No SourceStamp signature"),
        SOURCE_STAMP_MALFORMED_CERTIFICATE("Malformed certificate: %1$s"),
        SOURCE_STAMP_MALFORMED_SIGNATURE("Malformed SourceStamp signature"),
        SOURCE_STAMP_UNKNOWN_SIG_ALGORITHM("Unknown signature algorithm: %1$#x"),
        SOURCE_STAMP_VERIFY_EXCEPTION("Failed to verify %1$s signature: %2$s"),
        SOURCE_STAMP_DID_NOT_VERIFY("%1$s signature over signed-data did not verify"),
        SOURCE_STAMP_NO_SIGNATURE("No signature"),
        SOURCE_STAMP_NO_SUPPORTED_SIGNATURE("Signature(s) {%1$s} not supported: %2$s"),
        SOURCE_STAMP_CERTIFICATE_MISMATCH_BETWEEN_SIGNATURE_BLOCK_AND_APK("Certificate mismatch between SourceStamp block in APK signing block and SourceStamp file in APK: <%1$s> vs <%2$s>"),
        SOURCE_STAMP_SIGNATURE_BLOCK_WITHOUT_CERT_DIGEST("A source stamp signature block was found without a corresponding certificate digest in the APK"),
        SOURCE_STAMP_EXPECTED_DIGEST_MISMATCH("The source stamp certificate digest in the APK, %1$s, does not match the expected digest, %2$s"),
        SOURCE_STAMP_MALFORMED_ATTRIBUTE("Malformed stamp attribute #%1$d"),
        SOURCE_STAMP_UNKNOWN_ATTRIBUTE("Unknown stamp attribute: ID %1$#x"),
        SOURCE_STAMP_MALFORMED_LINEAGE("Failed to parse the SigningCertificateLineage structure in the source stamp attributes section."),
        SOURCE_STAMP_POR_CERT_MISMATCH("APK signing certificate differs from the associated certificate found in the signer's SigningCertificateLineage."),
        SOURCE_STAMP_POR_DID_NOT_VERIFY("Source stamp SigningCertificateLineage attribute contains a proof-of-rotation record with signature(s) that did not verify."),
        SOURCE_STAMP_INVALID_TIMESTAMP("The source stamp timestamp attribute has an invalid value: %1$d"),
        MALFORMED_APK("Malformed APK; the following exception was caught when attempting to parse the APK: %1$s"),
        UNEXPECTED_EXCEPTION("An unexpected exception was caught when verifying the signature: %1$s");

        private final String mFormat;

        Issue(String str) {
            this.mFormat = str;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public String getFormat() {
            return this.mFormat;
        }
    }

    public static class IssueWithParams extends ApkVerificationIssue {
        private final Issue mIssue;
        private final Object[] mParams;

        public IssueWithParams(Issue issue, Object[] objArr) {
            super(issue.mFormat, objArr);
            this.mIssue = issue;
            this.mParams = objArr;
        }

        public Issue getIssue() {
            return this.mIssue;
        }

        @Override // com.android.apksig.ApkVerificationIssue
        public Object[] getParams() {
            return (Object[]) this.mParams.clone();
        }

        @Override // com.android.apksig.ApkVerificationIssue
        public String toString() {
            return String.format(this.mIssue.getFormat(), this.mParams);
        }
    }

    public static class Result {
        private SigningCertificateLineage mSigningCertificateLineage;
        private SourceStampInfo mSourceStampInfo;
        private boolean mSourceStampVerified;
        private boolean mVerified;
        private boolean mVerifiedUsingV1Scheme;
        private boolean mVerifiedUsingV2Scheme;
        private boolean mVerifiedUsingV31Scheme;
        private boolean mVerifiedUsingV3Scheme;
        private boolean mVerifiedUsingV4Scheme;
        private boolean mWarningsAsErrors;
        private final List<IssueWithParams> mErrors = new ArrayList();
        private final List<IssueWithParams> mWarnings = new ArrayList();
        private final List<X509Certificate> mSignerCerts = new ArrayList();
        private final List<V1SchemeSignerInfo> mV1SchemeSigners = new ArrayList();
        private final List<V1SchemeSignerInfo> mV1SchemeIgnoredSigners = new ArrayList();
        private final List<V2SchemeSignerInfo> mV2SchemeSigners = new ArrayList();
        private final List<V3SchemeSignerInfo> mV3SchemeSigners = new ArrayList();
        private final List<V3SchemeSignerInfo> mV31SchemeSigners = new ArrayList();
        private final List<V4SchemeSignerInfo> mV4SchemeSigners = new ArrayList();

        public static class SourceStampInfo {
            private final List<X509Certificate> mCertificateLineage;
            private final List<X509Certificate> mCertificates;
            private final List<IssueWithParams> mErrors;
            private final List<IssueWithParams> mInfoMessages;
            private final SourceStampVerificationStatus mSourceStampVerificationStatus;
            private final long mTimestamp;
            private final List<IssueWithParams> mWarnings;

            public enum SourceStampVerificationStatus {
                STAMP_VERIFIED,
                STAMP_VERIFICATION_FAILED,
                CERT_DIGEST_MISMATCH,
                STAMP_MISSING,
                STAMP_NOT_VERIFIED,
                VERIFICATION_ERROR
            }

            SourceStampInfo(SourceStampVerificationStatus sourceStampVerificationStatus) {
                this.mCertificates = Collections.emptyList();
                this.mCertificateLineage = Collections.emptyList();
                this.mErrors = Collections.emptyList();
                this.mWarnings = Collections.emptyList();
                this.mInfoMessages = Collections.emptyList();
                this.mSourceStampVerificationStatus = sourceStampVerificationStatus;
                this.mTimestamp = 0L;
            }

            private SourceStampInfo(ApkSignerInfo apkSignerInfo) {
                this.mCertificates = apkSignerInfo.certs;
                this.mCertificateLineage = apkSignerInfo.certificateLineage;
                List<IssueWithParams> issuesFromVerificationIssues = ApkVerificationIssueAdapter.getIssuesFromVerificationIssues(apkSignerInfo.getErrors());
                this.mErrors = issuesFromVerificationIssues;
                List<IssueWithParams> issuesFromVerificationIssues2 = ApkVerificationIssueAdapter.getIssuesFromVerificationIssues(apkSignerInfo.getWarnings());
                this.mWarnings = issuesFromVerificationIssues2;
                this.mInfoMessages = ApkVerificationIssueAdapter.getIssuesFromVerificationIssues(apkSignerInfo.getInfoMessages());
                if (issuesFromVerificationIssues.isEmpty() && issuesFromVerificationIssues2.isEmpty()) {
                    this.mSourceStampVerificationStatus = SourceStampVerificationStatus.STAMP_VERIFIED;
                } else {
                    this.mSourceStampVerificationStatus = SourceStampVerificationStatus.STAMP_VERIFICATION_FAILED;
                }
                this.mTimestamp = apkSignerInfo.timestamp;
            }

            public boolean containsErrors() {
                return !this.mErrors.isEmpty();
            }

            public boolean containsInfoMessages() {
                return !this.mInfoMessages.isEmpty();
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

            public List<IssueWithParams> getErrors() {
                return this.mErrors;
            }

            public List<IssueWithParams> getInfoMessages() {
                return this.mInfoMessages;
            }

            public SourceStampVerificationStatus getSourceStampVerificationStatus() {
                return this.mSourceStampVerificationStatus;
            }

            public long getTimestampEpochSeconds() {
                return this.mTimestamp;
            }

            public List<IssueWithParams> getWarnings() {
                return this.mWarnings;
            }
        }

        public static class V1SchemeSignerInfo {
            private final List<X509Certificate> mCertChain;
            private final List<IssueWithParams> mErrors;
            private final String mName;
            private final String mSignatureBlockFileName;
            private final String mSignatureFileName;
            private final List<IssueWithParams> mWarnings;

            private V1SchemeSignerInfo(V1SchemeVerifier.Result.SignerInfo signerInfo) {
                this.mName = signerInfo.name;
                this.mCertChain = signerInfo.certChain;
                this.mSignatureBlockFileName = signerInfo.signatureBlockFileName;
                this.mSignatureFileName = signerInfo.signatureFileName;
                this.mErrors = signerInfo.getErrors();
                this.mWarnings = signerInfo.getWarnings();
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void addError(Issue issue, Object... objArr) {
                this.mErrors.add(new IssueWithParams(issue, objArr));
            }

            public boolean containsErrors() {
                return !this.mErrors.isEmpty();
            }

            public X509Certificate getCertificate() {
                if (this.mCertChain.isEmpty()) {
                    return null;
                }
                return this.mCertChain.get(0);
            }

            public List<X509Certificate> getCertificateChain() {
                return this.mCertChain;
            }

            public List<IssueWithParams> getErrors() {
                return this.mErrors;
            }

            public String getName() {
                return this.mName;
            }

            public String getSignatureBlockFileName() {
                return this.mSignatureBlockFileName;
            }

            public String getSignatureFileName() {
                return this.mSignatureFileName;
            }

            public List<IssueWithParams> getWarnings() {
                return this.mWarnings;
            }
        }

        public static class V2SchemeSignerInfo {
            private final List<X509Certificate> mCerts;
            private final List<ApkSigningBlockUtils.Result.SignerInfo.ContentDigest> mContentDigests;
            private final List<IssueWithParams> mErrors;
            private final int mIndex;
            private final List<IssueWithParams> mWarnings;

            private V2SchemeSignerInfo(ApkSigningBlockUtils.Result.SignerInfo signerInfo) {
                this.mIndex = signerInfo.index;
                this.mCerts = signerInfo.certs;
                this.mErrors = signerInfo.getErrors();
                this.mWarnings = signerInfo.getWarnings();
                this.mContentDigests = signerInfo.contentDigests;
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void addError(Issue issue, Object... objArr) {
                this.mErrors.add(new IssueWithParams(issue, objArr));
            }

            public boolean containsErrors() {
                return !this.mErrors.isEmpty();
            }

            public X509Certificate getCertificate() {
                if (this.mCerts.isEmpty()) {
                    return null;
                }
                return this.mCerts.get(0);
            }

            public List<X509Certificate> getCertificates() {
                return this.mCerts;
            }

            public List<ApkSigningBlockUtils.Result.SignerInfo.ContentDigest> getContentDigests() {
                return this.mContentDigests;
            }

            public List<IssueWithParams> getErrors() {
                return this.mErrors;
            }

            public int getIndex() {
                return this.mIndex;
            }

            public List<IssueWithParams> getWarnings() {
                return this.mWarnings;
            }
        }

        public static class V3SchemeSignerInfo {
            private final List<X509Certificate> mCerts;
            private final List<ApkSigningBlockUtils.Result.SignerInfo.ContentDigest> mContentDigests;
            private final List<IssueWithParams> mErrors;
            private final int mIndex;
            private final int mMaxSdkVersion;
            private final int mMinSdkVersion;
            private final boolean mRotationTargetsDevRelease;
            private final List<IssueWithParams> mWarnings;

            private V3SchemeSignerInfo(ApkSigningBlockUtils.Result.SignerInfo signerInfo) {
                this.mIndex = signerInfo.index;
                this.mCerts = signerInfo.certs;
                this.mErrors = signerInfo.getErrors();
                this.mWarnings = signerInfo.getWarnings();
                this.mContentDigests = signerInfo.contentDigests;
                this.mMinSdkVersion = signerInfo.minSdkVersion;
                this.mMaxSdkVersion = signerInfo.maxSdkVersion;
                this.mRotationTargetsDevRelease = signerInfo.additionalAttributes.stream().mapToInt(new ToIntFunction() { // from class: com.android.apksig.ApkVerifier$Result$V3SchemeSignerInfo$$ExternalSyntheticLambda0
                    @Override // java.util.function.ToIntFunction
                    public final int applyAsInt(Object obj) {
                        return ((ApkSigningBlockUtils.Result.SignerInfo.AdditionalAttribute) obj).getId();
                    }
                }).anyMatch(new IntPredicate() { // from class: com.android.apksig.ApkVerifier$Result$V3SchemeSignerInfo$$ExternalSyntheticLambda1
                    @Override // java.util.function.IntPredicate
                    public final boolean test(int i) {
                        return ApkVerifier.Result.V3SchemeSignerInfo.lambda$new$1(i);
                    }
                });
            }

            static /* synthetic */ boolean lambda$new$1(int i) {
                return i == -1029262406;
            }

            public boolean containsErrors() {
                return !this.mErrors.isEmpty();
            }

            public X509Certificate getCertificate() {
                if (this.mCerts.isEmpty()) {
                    return null;
                }
                return this.mCerts.get(0);
            }

            public List<X509Certificate> getCertificates() {
                return this.mCerts;
            }

            public List<ApkSigningBlockUtils.Result.SignerInfo.ContentDigest> getContentDigests() {
                return this.mContentDigests;
            }

            public List<IssueWithParams> getErrors() {
                return this.mErrors;
            }

            public int getIndex() {
                return this.mIndex;
            }

            public int getMaxSdkVersion() {
                return this.mMaxSdkVersion;
            }

            public int getMinSdkVersion() {
                return this.mMinSdkVersion;
            }

            public boolean getRotationTargetsDevRelease() {
                return this.mRotationTargetsDevRelease;
            }

            public List<IssueWithParams> getWarnings() {
                return this.mWarnings;
            }
        }

        public static class V4SchemeSignerInfo {
            private final List<X509Certificate> mCerts;
            private final List<ApkSigningBlockUtils.Result.SignerInfo.ContentDigest> mContentDigests;
            private final List<IssueWithParams> mErrors;
            private final int mIndex;
            private final List<IssueWithParams> mWarnings;

            private V4SchemeSignerInfo(ApkSigningBlockUtils.Result.SignerInfo signerInfo) {
                this.mIndex = signerInfo.index;
                this.mCerts = signerInfo.certs;
                this.mErrors = signerInfo.getErrors();
                this.mWarnings = signerInfo.getWarnings();
                this.mContentDigests = signerInfo.contentDigests;
            }

            public boolean containsErrors() {
                return !this.mErrors.isEmpty();
            }

            public X509Certificate getCertificate() {
                if (this.mCerts.isEmpty()) {
                    return null;
                }
                return this.mCerts.get(0);
            }

            public List<X509Certificate> getCertificates() {
                return this.mCerts;
            }

            public List<ApkSigningBlockUtils.Result.SignerInfo.ContentDigest> getContentDigests() {
                return this.mContentDigests;
            }

            public List<IssueWithParams> getErrors() {
                return this.mErrors;
            }

            public int getIndex() {
                return this.mIndex;
            }

            public List<IssueWithParams> getWarnings() {
                return this.mWarnings;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void addSignerCertificate(X509Certificate x509Certificate) {
            this.mSignerCerts.add(x509Certificate);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeFrom(ApkSigResult apkSigResult) {
            switch (apkSigResult.signatureSchemeVersion) {
                case BerEncoding.TAG_CLASS_UNIVERSAL /* 0 */:
                    this.mSourceStampVerified = apkSigResult.verified;
                    if (apkSigResult.mSigners.isEmpty()) {
                        return;
                    }
                    this.mSourceStampInfo = new SourceStampInfo(apkSigResult.mSigners.get(0));
                    return;
                default:
                    throw new IllegalArgumentException("Unknown ApkSigResult Signing Block Scheme Id " + apkSigResult.signatureSchemeVersion);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeFrom(ApkSigningBlockUtils.Result result) {
            switch (result.signatureSchemeVersion) {
                case BerEncoding.TAG_CLASS_UNIVERSAL /* 0 */:
                    this.mSourceStampVerified = result.verified;
                    if (result.signers.isEmpty()) {
                        return;
                    }
                    this.mSourceStampInfo = new SourceStampInfo(result.signers.get(0));
                    return;
                case 2:
                    this.mVerifiedUsingV2Scheme = result.verified;
                    Iterator<ApkSigningBlockUtils.Result.SignerInfo> it = result.signers.iterator();
                    while (it.hasNext()) {
                        this.mV2SchemeSigners.add(new V2SchemeSignerInfo(it.next()));
                    }
                    return;
                case 3:
                    this.mVerifiedUsingV3Scheme = result.verified;
                    Iterator<ApkSigningBlockUtils.Result.SignerInfo> it2 = result.signers.iterator();
                    while (it2.hasNext()) {
                        this.mV3SchemeSigners.add(new V3SchemeSignerInfo(it2.next()));
                    }
                    if (this.mSigningCertificateLineage == null) {
                        this.mSigningCertificateLineage = result.signingCertificateLineage;
                        return;
                    }
                    return;
                case 4:
                    this.mVerifiedUsingV4Scheme = result.verified;
                    Iterator<ApkSigningBlockUtils.Result.SignerInfo> it3 = result.signers.iterator();
                    while (it3.hasNext()) {
                        this.mV4SchemeSigners.add(new V4SchemeSignerInfo(it3.next()));
                    }
                    return;
                case 31:
                    this.mVerifiedUsingV31Scheme = result.verified;
                    Iterator<ApkSigningBlockUtils.Result.SignerInfo> it4 = result.signers.iterator();
                    while (it4.hasNext()) {
                        this.mV31SchemeSigners.add(new V3SchemeSignerInfo(it4.next()));
                    }
                    this.mSigningCertificateLineage = result.signingCertificateLineage;
                    return;
                default:
                    throw new IllegalArgumentException("Unknown Signing Block Scheme Id");
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void mergeFrom(V1SchemeVerifier.Result result) {
            this.mVerifiedUsingV1Scheme = result.verified;
            this.mErrors.addAll(result.getErrors());
            this.mWarnings.addAll(result.getWarnings());
            Iterator<V1SchemeVerifier.Result.SignerInfo> it = result.signers.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                this.mV1SchemeSigners.add(new V1SchemeSignerInfo(it.next()));
            }
            Iterator<V1SchemeVerifier.Result.SignerInfo> it2 = result.ignoredSigners.iterator();
            while (it2.hasNext()) {
                this.mV1SchemeIgnoredSigners.add(new V1SchemeSignerInfo(it2.next()));
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setVerified() {
            this.mVerified = true;
        }

        void addError(Issue issue, Object... objArr) {
            this.mErrors.add(new IssueWithParams(issue, objArr));
        }

        void addWarning(Issue issue, Object... objArr) {
            this.mWarnings.add(new IssueWithParams(issue, objArr));
        }

        public boolean containsErrors() {
            if (!this.mErrors.isEmpty()) {
                return true;
            }
            if (this.mWarningsAsErrors && !this.mWarnings.isEmpty()) {
                return true;
            }
            if (!this.mV1SchemeSigners.isEmpty()) {
                for (V1SchemeSignerInfo v1SchemeSignerInfo : this.mV1SchemeSigners) {
                    if (v1SchemeSignerInfo.containsErrors()) {
                        return true;
                    }
                    if (this.mWarningsAsErrors && !v1SchemeSignerInfo.getWarnings().isEmpty()) {
                        return true;
                    }
                }
            }
            if (!this.mV2SchemeSigners.isEmpty()) {
                for (V2SchemeSignerInfo v2SchemeSignerInfo : this.mV2SchemeSigners) {
                    if (v2SchemeSignerInfo.containsErrors()) {
                        return true;
                    }
                    if (this.mWarningsAsErrors && !v2SchemeSignerInfo.getWarnings().isEmpty()) {
                        return true;
                    }
                }
            }
            if (!this.mV3SchemeSigners.isEmpty()) {
                for (V3SchemeSignerInfo v3SchemeSignerInfo : this.mV3SchemeSigners) {
                    if (v3SchemeSignerInfo.containsErrors()) {
                        return true;
                    }
                    if (this.mWarningsAsErrors && !v3SchemeSignerInfo.getWarnings().isEmpty()) {
                        return true;
                    }
                }
            }
            SourceStampInfo sourceStampInfo = this.mSourceStampInfo;
            if (sourceStampInfo == null) {
                return false;
            }
            if (sourceStampInfo.containsErrors()) {
                return true;
            }
            return this.mWarningsAsErrors && !this.mSourceStampInfo.getWarnings().isEmpty();
        }

        public List<IssueWithParams> getAllErrors() {
            ArrayList arrayList = new ArrayList();
            arrayList.addAll(this.mErrors);
            if (this.mWarningsAsErrors) {
                arrayList.addAll(this.mWarnings);
            }
            if (!this.mV1SchemeSigners.isEmpty()) {
                for (V1SchemeSignerInfo v1SchemeSignerInfo : this.mV1SchemeSigners) {
                    arrayList.addAll(v1SchemeSignerInfo.mErrors);
                    if (this.mWarningsAsErrors) {
                        arrayList.addAll(v1SchemeSignerInfo.getWarnings());
                    }
                }
            }
            if (!this.mV2SchemeSigners.isEmpty()) {
                for (V2SchemeSignerInfo v2SchemeSignerInfo : this.mV2SchemeSigners) {
                    arrayList.addAll(v2SchemeSignerInfo.mErrors);
                    if (this.mWarningsAsErrors) {
                        arrayList.addAll(v2SchemeSignerInfo.getWarnings());
                    }
                }
            }
            if (!this.mV3SchemeSigners.isEmpty()) {
                for (V3SchemeSignerInfo v3SchemeSignerInfo : this.mV3SchemeSigners) {
                    arrayList.addAll(v3SchemeSignerInfo.mErrors);
                    if (this.mWarningsAsErrors) {
                        arrayList.addAll(v3SchemeSignerInfo.getWarnings());
                    }
                }
            }
            SourceStampInfo sourceStampInfo = this.mSourceStampInfo;
            if (sourceStampInfo != null) {
                arrayList.addAll(sourceStampInfo.getErrors());
                if (this.mWarningsAsErrors) {
                    arrayList.addAll(this.mSourceStampInfo.getWarnings());
                }
            }
            return arrayList;
        }

        public List<IssueWithParams> getErrors() {
            if (!this.mWarningsAsErrors) {
                return this.mErrors;
            }
            ArrayList arrayList = new ArrayList();
            arrayList.addAll(this.mErrors);
            arrayList.addAll(this.mWarnings);
            return arrayList;
        }

        public List<X509Certificate> getSignerCertificates() {
            return this.mSignerCerts;
        }

        public SigningCertificateLineage getSigningCertificateLineage() {
            return this.mSigningCertificateLineage;
        }

        public SourceStampInfo getSourceStampInfo() {
            return this.mSourceStampInfo;
        }

        public List<V1SchemeSignerInfo> getV1SchemeIgnoredSigners() {
            return this.mV1SchemeIgnoredSigners;
        }

        public List<V1SchemeSignerInfo> getV1SchemeSigners() {
            return this.mV1SchemeSigners;
        }

        public List<V2SchemeSignerInfo> getV2SchemeSigners() {
            return this.mV2SchemeSigners;
        }

        public List<V3SchemeSignerInfo> getV31SchemeSigners() {
            return this.mV31SchemeSigners;
        }

        public List<V3SchemeSignerInfo> getV3SchemeSigners() {
            return this.mV3SchemeSigners;
        }

        public List<V4SchemeSignerInfo> getV4SchemeSigners() {
            return this.mV4SchemeSigners;
        }

        public List<IssueWithParams> getWarnings() {
            return this.mWarnings;
        }

        public boolean isSourceStampVerified() {
            return this.mSourceStampVerified;
        }

        public boolean isVerified() {
            return this.mVerified;
        }

        public boolean isVerifiedUsingV1Scheme() {
            return this.mVerifiedUsingV1Scheme;
        }

        public boolean isVerifiedUsingV2Scheme() {
            return this.mVerifiedUsingV2Scheme;
        }

        public boolean isVerifiedUsingV31Scheme() {
            return this.mVerifiedUsingV31Scheme;
        }

        public boolean isVerifiedUsingV3Scheme() {
            return this.mVerifiedUsingV3Scheme;
        }

        public boolean isVerifiedUsingV4Scheme() {
            return this.mVerifiedUsingV4Scheme;
        }

        void setWarningsAsErrors(boolean z) {
            this.mWarningsAsErrors = z;
        }
    }

    private ApkVerifier(File file, DataSource dataSource, File file2, Integer num, int i) {
        this.mApkFile = file;
        this.mApkDataSource = dataSource;
        this.mV4SignatureFile = file2;
        this.mMinSdkVersion = num;
        this.mMaxSdkVersion = i;
    }

    private static void checkV4Certificate(List<X509Certificate> list, List<X509Certificate> list2, Result result) {
        try {
            if (Arrays.equals(list2.get(0).getEncoded(), list.get(0).getEncoded())) {
                return;
            }
            result.addError(Issue.V4_SIG_V2_V3_SIGNERS_MISMATCH, new Object[0]);
        } catch (CertificateEncodingException e) {
            throw new RuntimeException("Failed to encode APK signer cert", e);
        }
    }

    private static void checkV4Signer(List<Result.V3SchemeSignerInfo> list, List<X509Certificate> list2, byte[] bArr, Result result) {
        if (list.size() != 1) {
            result.addError(Issue.V4_SIG_MULTIPLE_SIGNERS, new Object[0]);
        }
        checkV4Certificate(list2, list.get(0).mCerts, result);
        if (Arrays.equals(bArr, pickBestDigestForV4(list.get(0).getContentDigests()))) {
            return;
        }
        result.addError(Issue.V4_SIG_V2_V3_DIGESTS_MISMATCH, new Object[0]);
    }

    private static void collectApkContentDigests(List<ApkSigningBlockUtils.Result.SignerInfo.ContentDigest> list, Map<ContentDigestAlgorithm, byte[]> map) {
        for (ApkSigningBlockUtils.Result.SignerInfo.ContentDigest contentDigest : list) {
            SignatureAlgorithm signatureAlgorithmFindById = SignatureAlgorithm.findById(contentDigest.getSignatureAlgorithmId());
            if (signatureAlgorithmFindById != null) {
                map.put(signatureAlgorithmFindById.getContentDigestAlgorithm(), contentDigest.getValue());
            }
        }
    }

    private static Result createSourceStampResultWithError(Result.SourceStampInfo.SourceStampVerificationStatus sourceStampVerificationStatus, Issue issue, Object... objArr) {
        Result result = new Result();
        result.addError(issue, objArr);
        return mergeSourceStampResult(sourceStampVerificationStatus, result);
    }

    private static ByteBuffer getAndroidManifestFromApk(DataSource dataSource, ApkUtils.ZipSections zipSections) throws IOException, ApkFormatException {
        try {
            return ApkSigner.getAndroidManifestFromApk(V1SchemeVerifier.parseZipCentralDirectory(dataSource, zipSections), dataSource.slice(0L, zipSections.getZipCentralDirectoryOffset()));
        } catch (ZipFormatException e) {
            throw new ApkFormatException("Failed to read AndroidManifest.xml", e);
        }
    }

    private static Map<ContentDigestAlgorithm, byte[]> getApkContentDigestFromV1SigningScheme(List<CentralDirectoryRecord> list, DataSource dataSource, ApkUtils.ZipSections zipSections) throws IOException, ApkFormatException {
        CentralDirectoryRecord centralDirectoryRecord = null;
        EnumMap enumMap = new EnumMap(ContentDigestAlgorithm.class);
        for (CentralDirectoryRecord centralDirectoryRecord2 : list) {
            if ("META-INF/MANIFEST.MF".equals(centralDirectoryRecord2.getName())) {
                centralDirectoryRecord = centralDirectoryRecord2;
                break;
            }
        }
        if (centralDirectoryRecord == null) {
            return enumMap;
        }
        try {
            enumMap.put(ContentDigestAlgorithm.SHA256, ApkUtils.computeSha256DigestBytes(LocalFileRecord.getUncompressedData(dataSource, centralDirectoryRecord, zipSections.getZipCentralDirectoryOffset())));
            return enumMap;
        } catch (ZipFormatException e) {
            throw new ApkFormatException("Failed to read APK", e);
        }
    }

    private ApkSigningBlockUtils.Result getApkContentDigests(DataSource dataSource, ApkUtils.ZipSections zipSections, Set<Integer> set, Map<Integer, String> map, Map<Integer, Map<ContentDigestAlgorithm, byte[]>> map2, int i, int i2) throws NoSuchAlgorithmException, IOException {
        if (i != 2 && i != 3) {
            return null;
        }
        ApkSigningBlockUtils.Result result = new ApkSigningBlockUtils.Result(i);
        try {
            SignatureInfo signatureInfoFindSignature = ApkSigningBlockUtils.findSignature(dataSource, zipSections, i == 3 ? -262969152 : 1896449818, result);
            set.add(Integer.valueOf(i));
            HashSet hashSet = new HashSet(1);
            if (i == 2) {
                V2SchemeVerifier.parseSigners(signatureInfoFindSignature.signatureBlock, hashSet, map, set, i2, this.mMaxSdkVersion, result);
            } else {
                V3SchemeVerifier.parseSigners(signatureInfoFindSignature.signatureBlock, hashSet, result);
            }
            EnumMap enumMap = new EnumMap(ContentDigestAlgorithm.class);
            Iterator<ApkSigningBlockUtils.Result.SignerInfo> it = result.signers.iterator();
            while (it.hasNext()) {
                for (ApkSigningBlockUtils.Result.SignerInfo.ContentDigest contentDigest : it.next().contentDigests) {
                    SignatureAlgorithm signatureAlgorithmFindById = SignatureAlgorithm.findById(contentDigest.getSignatureAlgorithmId());
                    if (signatureAlgorithmFindById != null) {
                        enumMap.put(signatureAlgorithmFindById.getContentDigestAlgorithm(), contentDigest.getValue());
                    }
                }
            }
            map2.put(Integer.valueOf(i), enumMap);
            return result;
        } catch (ApkSigningBlockUtils.SignatureNotFoundException e) {
            return null;
        }
    }

    private static Map<ContentDigestAlgorithm, byte[]> getApkContentDigestsFromSigningSchemeResult(ApkSigningBlockUtils.Result result) {
        HashMap map = new HashMap();
        Iterator<ApkSigningBlockUtils.Result.SignerInfo> it = result.signers.iterator();
        while (it.hasNext()) {
            collectApkContentDigests(it.next().contentDigests, map);
        }
        return map;
    }

    private static int getMinimumSignatureSchemeVersionForTargetSdk(int i) {
        return i >= 30 ? 2 : 1;
    }

    private static Map<Integer, String> getSupportedSchemeNames(int i) {
        if (i >= 28) {
            return SUPPORTED_APK_SIG_SCHEME_NAMES;
        }
        if (i < 24) {
            return Collections.emptyMap();
        }
        HashMap map = new HashMap(1);
        map.put(2, SUPPORTED_APK_SIG_SCHEME_NAMES.get(2));
        return map;
    }

    private static Map<Integer, String> loadSupportedApkSigSchemeNames() {
        HashMap map = new HashMap(2);
        map.put(2, "APK Signature Scheme v2");
        map.put(3, "APK Signature Scheme v3");
        return map;
    }

    private static Result mergeSourceStampResult(Result.SourceStampInfo.SourceStampVerificationStatus sourceStampVerificationStatus, Result result) {
        result.mSourceStampInfo = new Result.SourceStampInfo(sourceStampVerificationStatus);
        return result;
    }

    private static byte[] pickBestDigestForV4(List<ApkSigningBlockUtils.Result.SignerInfo.ContentDigest> list) {
        HashMap map = new HashMap();
        collectApkContentDigests(list, map);
        return ApkSigningBlockUtils.pickBestDigestForV4(map);
    }

    /* JADX WARN: Code duplicated, block: B:114:0x0255 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:115:0x0256  */
    /* JADX WARN: Code duplicated, block: B:122:0x028c  */
    /* JADX WARN: Code duplicated, block: B:131:0x02d9  */
    /* JADX WARN: Code duplicated, block: B:140:0x031d  */
    /* JADX WARN: Code duplicated, block: B:143:0x033a A[LOOP:3: B:138:0x0317->B:143:0x033a, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:147:0x0346  */
    /* JADX WARN: Code duplicated, block: B:150:0x0363 A[LOOP:4: B:145:0x0340->B:150:0x0363, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:159:0x0384  */
    /* JADX WARN: Code duplicated, block: B:161:0x038f  */
    /* JADX WARN: Code duplicated, block: B:162:0x0398  */
    /* JADX WARN: Code duplicated, block: B:164:0x03ac  */
    /* JADX WARN: Code duplicated, block: B:166:0x03b8  */
    /* JADX WARN: Code duplicated, block: B:169:0x03d1  */
    /* JADX WARN: Code duplicated, block: B:171:0x03dc  */
    /* JADX WARN: Code duplicated, block: B:172:0x03e5  */
    /* JADX WARN: Code duplicated, block: B:175:0x0404 A[Catch: CertificateEncodingException -> 0x040e, TRY_LEAVE, TryCatch #10 {CertificateEncodingException -> 0x040e, blocks: (B:173:0x03e6, B:175:0x0404), top: B:278:0x03e6 }] */
    /* JADX WARN: Code duplicated, block: B:182:0x0423 A[Catch: IllegalArgumentException -> 0x042c, TRY_LEAVE, TryCatch #12 {IllegalArgumentException -> 0x042c, blocks: (B:180:0x0417, B:182:0x0423), top: B:280:0x0417 }] */
    /* JADX WARN: Code duplicated, block: B:188:0x043b  */
    /* JADX WARN: Code duplicated, block: B:190:0x0452  */
    /* JADX WARN: Code duplicated, block: B:193:0x0469  */
    /* JADX WARN: Code duplicated, block: B:195:0x046f  */
    /* JADX WARN: Code duplicated, block: B:196:0x0472  */
    /* JADX WARN: Code duplicated, block: B:199:0x047a  */
    /* JADX WARN: Code duplicated, block: B:200:0x0483  */
    /* JADX WARN: Code duplicated, block: B:203:0x049b  */
    /* JADX WARN: Code duplicated, block: B:205:0x04ae  */
    /* JADX WARN: Code duplicated, block: B:207:0x04b4  */
    /* JADX WARN: Code duplicated, block: B:209:0x04bb  */
    /* JADX WARN: Code duplicated, block: B:212:0x04ce  */
    /* JADX WARN: Code duplicated, block: B:213:0x04d7  */
    /* JADX WARN: Code duplicated, block: B:216:0x0504  */
    /* JADX WARN: Code duplicated, block: B:218:0x050c  */
    /* JADX WARN: Code duplicated, block: B:232:0x0537  */
    /* JADX WARN: Code duplicated, block: B:235:0x053e A[FALL_THROUGH] */
    /* JADX WARN: Code duplicated, block: B:243:0x0562 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:244:0x0563  */
    /* JADX WARN: Code duplicated, block: B:246:0x056c  */
    /* JADX WARN: Code duplicated, block: B:247:0x0584  */
    /* JADX WARN: Code duplicated, block: B:249:0x058a  */
    /* JADX WARN: Code duplicated, block: B:250:0x05a2  */
    /* JADX WARN: Code duplicated, block: B:252:0x05a8  */
    /* JADX WARN: Code duplicated, block: B:255:0x05b6 A[LOOP:5: B:253:0x05b0->B:255:0x05b6, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:257:0x05c5  */
    /* JADX WARN: Code duplicated, block: B:259:0x05cb  */
    /* JADX WARN: Code duplicated, block: B:262:0x05d9 A[LOOP:6: B:260:0x05d3->B:262:0x05d9, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:265:0x05e9  */
    /* JADX WARN: Code duplicated, block: B:276:0x0516 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:280:0x0417 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:305:0x0329 A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:307:0x0352 A[SYNTHETIC] */
    private Result verify(DataSource dataSource) throws AndroidBinXmlParser.XmlParserException, NoSuchAlgorithmException, IOException, ApkFormatException {
        int i;
        int i2;
        HashSet hashSet;
        Iterator<Result.V1SchemeSignerInfo> it;
        Iterator<Result.V2SchemeSignerInfo> it2;
        int targetSdkVersionFromBinaryAndroidManifest;
        int minimumSignatureSchemeVersionForTargetSdk;
        List<Result.V4SchemeSignerInfo> v4SchemeSigners;
        List<ApkSigningBlockUtils.Result.SignerInfo.ContentDigest> contentDigests;
        byte[] value;
        List<Result.V2SchemeSignerInfo> v2SchemeSigners;
        int i3;
        int i4;
        int i5;
        SigningCertificateLineage signingCertificateLineage;
        List<Result.V2SchemeSignerInfo> v2SchemeSigners2;
        X509Certificate x509Certificate;
        List<Result.V3SchemeSignerInfo> v3SchemeSigners;
        int i6;
        List<Result.V1SchemeSignerInfo> v1SchemeSigners;
        int i7;
        ArrayList arrayList;
        ArrayList<Result.V2SchemeSignerInfo> arrayList2;
        ArrayList arrayList3;
        ArrayList arrayList4;
        Iterator it3;
        int i8;
        int i9;
        Result.V1SchemeSignerInfo v1SchemeSignerInfo;
        int i10;
        int i11 = this.mMaxSdkVersion;
        try {
            ApkUtils.ZipSections zipSectionsFindZipSections = ApkUtils.findZipSections(dataSource);
            ByteBuffer androidManifestFromApk = null;
            int iVerifyAndGetMinSdkVersion = verifyAndGetMinSdkVersion(dataSource, zipSectionsFindZipSections);
            Result result = new Result();
            HashMap map = new HashMap();
            Map<Integer, String> supportedSchemeNames = getSupportedSchemeNames(i11);
            HashSet hashSet2 = new HashSet(2);
            if (i11 >= 24) {
                RunnablesExecutor runnablesExecutor = RunnablesExecutor.SINGLE_THREADED;
                int iOrElse = 0;
                if (i11 >= 33) {
                    try {
                        ApkSigningBlockUtils.Result resultVerify = new V3SchemeVerifier.Builder(dataSource, zipSectionsFindZipSections, Math.max(iVerifyAndGetMinSdkVersion, 33), i11).setRunnablesExecutor(runnablesExecutor).setBlockId(462663009).build().verify();
                        hashSet2.add(31);
                        iOrElse = resultVerify.signers.stream().mapToInt(new ToIntFunction() { // from class: com.android.apksig.ApkVerifier$$ExternalSyntheticLambda0
                            @Override // java.util.function.ToIntFunction
                            public final int applyAsInt(Object obj) {
                                return ((ApkSigningBlockUtils.Result.SignerInfo) obj).minSdkVersion;
                            }
                        }).min().orElse(0);
                        result.mergeFrom(resultVerify);
                        map.put(31, getApkContentDigestsFromSigningSchemeResult(resultVerify));
                    } catch (ApkSigningBlockUtils.SignatureNotFoundException e) {
                    }
                    if (result.containsErrors()) {
                        return result;
                    }
                    i10 = iOrElse;
                } else {
                    i10 = 0;
                }
                if (iVerifyAndGetMinSdkVersion < 33 || hashSet2.isEmpty()) {
                    try {
                        V3SchemeVerifier.Builder blockId = new V3SchemeVerifier.Builder(dataSource, zipSectionsFindZipSections, Math.max(iVerifyAndGetMinSdkVersion, 28), i11).setRunnablesExecutor(runnablesExecutor).setBlockId(-262969152);
                        if (i10 > 0) {
                            blockId.setRotationMinSdkVersion(i10);
                        }
                        ApkSigningBlockUtils.Result resultVerify2 = blockId.build().verify();
                        hashSet2.add(3);
                        result.mergeFrom(resultVerify2);
                        map.put(3, getApkContentDigestsFromSigningSchemeResult(resultVerify2));
                    } catch (ApkSigningBlockUtils.SignatureNotFoundException e2) {
                        if (hashSet2.contains(31)) {
                            result.addError(Issue.V31_BLOCK_FOUND_WITHOUT_V3_BLOCK, new Object[0]);
                        }
                    }
                    if (result.containsErrors()) {
                        return result;
                    }
                }
                if (iVerifyAndGetMinSdkVersion < 28 || hashSet2.isEmpty()) {
                    try {
                        int iMax = Math.max(iVerifyAndGetMinSdkVersion, 24);
                        i2 = iVerifyAndGetMinSdkVersion;
                        hashSet = hashSet2;
                        i = 2;
                        try {
                            ApkSigningBlockUtils.Result resultVerify3 = V2SchemeVerifier.verify(runnablesExecutor, dataSource, zipSectionsFindZipSections, supportedSchemeNames, hashSet2, iMax, i11);
                            hashSet.add(2);
                            result.mergeFrom(resultVerify3);
                            map.put(2, getApkContentDigestsFromSigningSchemeResult(resultVerify3));
                        } catch (ApkSigningBlockUtils.SignatureNotFoundException e3) {
                        }
                    } catch (ApkSigningBlockUtils.SignatureNotFoundException e4) {
                        i2 = iVerifyAndGetMinSdkVersion;
                        i = 2;
                        hashSet = hashSet2;
                    }
                    if (result.containsErrors()) {
                        return result;
                    }
                } else {
                    i2 = iVerifyAndGetMinSdkVersion;
                    i = 2;
                    hashSet = hashSet2;
                }
                File file = this.mV4SignatureFile;
                if (file != null) {
                    ApkSigningBlockUtils.Result resultVerify4 = V4SchemeVerifier.verify(dataSource, file);
                    hashSet.add(4);
                    result.mergeFrom(resultVerify4);
                    if (result.containsErrors()) {
                        return result;
                    }
                }
            } else {
                i = 2;
                i2 = iVerifyAndGetMinSdkVersion;
                hashSet = hashSet2;
            }
            if (i11 >= 26) {
                androidManifestFromApk = 0 == 0 ? getAndroidManifestFromApk(dataSource, zipSectionsFindZipSections) : null;
                int targetSandboxVersionFromBinaryAndroidManifest = ApkUtils.getTargetSandboxVersionFromBinaryAndroidManifest(androidManifestFromApk.slice());
                if (targetSandboxVersionFromBinaryAndroidManifest > 1 && hashSet.isEmpty()) {
                    result.addError(Issue.NO_SIG_FOR_TARGET_SANDBOX_VERSION, Integer.valueOf(targetSandboxVersionFromBinaryAndroidManifest));
                }
            }
            List<CentralDirectoryRecord> zipCentralDirectory = V1SchemeVerifier.parseZipCentralDirectory(dataSource, zipSectionsFindZipSections);
            int i12 = i2;
            if (i12 < 24 || hashSet.isEmpty()) {
                result.mergeFrom(V1SchemeVerifier.verify(dataSource, zipSectionsFindZipSections, supportedSchemeNames, hashSet, i12, i11));
                zipCentralDirectory = zipCentralDirectory;
                map.put(1, getApkContentDigestFromV1SigningScheme(zipCentralDirectory, dataSource, zipSectionsFindZipSections));
            }
            if (result.containsErrors()) {
                return result;
            }
            CentralDirectoryRecord centralDirectoryRecord = null;
            try {
                for (CentralDirectoryRecord centralDirectoryRecord2 : zipCentralDirectory) {
                    try {
                        if ("stamp-cert-sha256".equals(centralDirectoryRecord2.getName())) {
                            centralDirectoryRecord = centralDirectoryRecord2;
                            break;
                        }
                    } catch (SignatureNotFoundException e5) {
                        result.addWarning(Issue.SOURCE_STAMP_SIG_MISSING, new Object[0]);
                        if (result.containsErrors()) {
                            return result;
                        }
                        if (result.isVerifiedUsingV1Scheme()) {
                            arrayList = new ArrayList(result.getV1SchemeSigners());
                            arrayList2 = new ArrayList(result.getV2SchemeSigners());
                            arrayList3 = new ArrayList();
                            arrayList4 = new ArrayList();
                            it3 = arrayList.iterator();
                            while (it3.hasNext()) {
                                v1SchemeSignerInfo = (Result.V1SchemeSignerInfo) it3.next();
                                try {
                                    Iterator it4 = it3;
                                    arrayList3.add(new ByteArray(v1SchemeSignerInfo.getCertificate().getEncoded()));
                                    it3 = it4;
                                } catch (CertificateEncodingException e6) {
                                    throw new IllegalStateException("Failed to encode JAR signer " + v1SchemeSignerInfo.getName() + " certs", e6);
                                }
                            }
                            for (Result.V2SchemeSignerInfo v2SchemeSignerInfo : arrayList2) {
                                try {
                                    arrayList4.add(new ByteArray(v2SchemeSignerInfo.getCertificate().getEncoded()));
                                } catch (CertificateEncodingException e7) {
                                    throw new IllegalStateException("Failed to encode APK Signature Scheme v2 signer (index: " + v2SchemeSignerInfo.getIndex() + ") certs", e7);
                                }
                            }
                            for (i8 = 0; i8 < arrayList3.size(); i8++) {
                                if (!arrayList4.contains((ByteArray) arrayList3.get(i8))) {
                                    ((Result.V1SchemeSignerInfo) arrayList.get(i8)).addError(Issue.V2_SIG_MISSING, new Object[0]);
                                    break;
                                }
                            }
                            for (i9 = 0; i9 < arrayList4.size(); i9++) {
                                if (!arrayList3.contains((ByteArray) arrayList4.get(i9))) {
                                    ((Result.V2SchemeSignerInfo) arrayList2.get(i9)).addError(Issue.JAR_SIG_MISSING, new Object[0]);
                                    break;
                                }
                            }
                        }
                        if (result.isVerifiedUsingV3Scheme()) {
                            signingCertificateLineage = result.getSigningCertificateLineage();
                            if (result.isVerifiedUsingV1Scheme()) {
                                v1SchemeSigners = result.getV1SchemeSigners();
                                if (v1SchemeSigners.size() != 1) {
                                    i7 = 0;
                                    result.addError(Issue.V3_SIG_MULTIPLE_PAST_SIGNERS, new Object[0]);
                                } else {
                                    i7 = 0;
                                }
                                x509Certificate = (X509Certificate) v1SchemeSigners.get(i7).mCertChain.get(i7);
                            } else {
                                v2SchemeSigners2 = result.getV2SchemeSigners();
                                if (v2SchemeSigners2.size() != 1) {
                                    result.addError(Issue.V3_SIG_MULTIPLE_PAST_SIGNERS, new Object[0]);
                                }
                                x509Certificate = (X509Certificate) v2SchemeSigners2.get(0).mCerts.get(0);
                            }
                            if (signingCertificateLineage == null) {
                                v3SchemeSigners = result.getV3SchemeSigners();
                                if (v3SchemeSigners.size() != 1) {
                                    i6 = 0;
                                    result.addError(Issue.V3_SIG_MULTIPLE_SIGNERS, new Object[0]);
                                } else {
                                    i6 = 0;
                                }
                                try {
                                    if (!Arrays.equals(x509Certificate.getEncoded(), ((X509Certificate) v3SchemeSigners.get(i6).mCerts.get(i6)).getEncoded())) {
                                        result.addError(Issue.V3_SIG_PAST_SIGNERS_MISMATCH, new Object[0]);
                                    }
                                } catch (CertificateEncodingException e8) {
                                    throw new RuntimeException("Failed to encode APK Signature Scheme v3 signer cert", e8);
                                }
                            } else {
                                try {
                                    if (signingCertificateLineage.getSubLineage(x509Certificate).size() != 1) {
                                        result.addError(Issue.V3_SIG_PAST_SIGNERS_MISMATCH, new Object[0]);
                                    }
                                } catch (IllegalArgumentException e9) {
                                    result.addError(Issue.V3_SIG_PAST_SIGNERS_MISMATCH, new Object[0]);
                                }
                            }
                        }
                        if (result.isVerifiedUsingV4Scheme()) {
                            v4SchemeSigners = result.getV4SchemeSigners();
                            contentDigests = v4SchemeSigners.get(0).getContentDigests();
                            if (contentDigests.size() != 1) {
                                result.addError(Issue.V4_SIG_V2_V3_DIGESTS_MISMATCH, new Object[0]);
                            }
                            value = contentDigests.get(0).getValue();
                            if (result.isVerifiedUsingV3Scheme()) {
                                if (result.isVerifiedUsingV31Scheme()) {
                                    i4 = i;
                                } else {
                                    i4 = 1;
                                }
                                if (v4SchemeSigners.size() != i4) {
                                    i5 = 0;
                                    result.addError(Issue.V4_SIG_MULTIPLE_SIGNERS, new Object[0]);
                                } else {
                                    i5 = 0;
                                }
                                checkV4Signer(result.getV3SchemeSigners(), v4SchemeSigners.get(i5).mCerts, value, result);
                                if (result.isVerifiedUsingV31Scheme()) {
                                    checkV4Signer(result.getV31SchemeSigners(), v4SchemeSigners.get(1).mCerts, value, result);
                                }
                            } else {
                                if (result.isVerifiedUsingV2Scheme()) {
                                    throw new RuntimeException("V4 signature must be also verified with V2/V3");
                                }
                                if (v4SchemeSigners.size() != 1) {
                                    result.addError(Issue.V4_SIG_MULTIPLE_SIGNERS, new Object[0]);
                                }
                                v2SchemeSigners = result.getV2SchemeSigners();
                                if (v2SchemeSigners.size() != 1) {
                                    i3 = 0;
                                    result.addError(Issue.V4_SIG_MULTIPLE_SIGNERS, new Object[0]);
                                } else {
                                    i3 = 0;
                                }
                                checkV4Certificate(v4SchemeSigners.get(i3).mCerts, v2SchemeSigners.get(i3).mCerts, result);
                                if (!Arrays.equals(value, pickBestDigestForV4(v2SchemeSigners.get(i3).getContentDigests()))) {
                                    result.addError(Issue.V4_SIG_V2_V3_DIGESTS_MISMATCH, new Object[i3]);
                                }
                            }
                        }
                        if (androidManifestFromApk == null) {
                            try {
                                androidManifestFromApk = getAndroidManifestFromApk(dataSource, zipSectionsFindZipSections);
                            } catch (ApkFormatException e10) {
                            }
                        }
                        if (androidManifestFromApk != null) {
                            switch (minimumSignatureSchemeVersionForTargetSdk) {
                                case 2:
                                    if (!result.isVerifiedUsingV2Scheme()) {
                                    }
                                case 3:
                                    if (!result.isVerifiedUsingV3Scheme()) {
                                        result.addError(Issue.MIN_SIG_SCHEME_FOR_TARGET_SDK_NOT_MET, Integer.valueOf(targetSdkVersionFromBinaryAndroidManifest), Integer.valueOf(minimumSignatureSchemeVersionForTargetSdk));
                                    }
                                    break;
                            }
                        }
                        if (result.containsErrors()) {
                            return result;
                        }
                        result.setVerified();
                        if (result.isVerifiedUsingV31Scheme()) {
                            List<Result.V3SchemeSignerInfo> v31SchemeSigners = result.getV31SchemeSigners();
                            result.addSignerCertificate(v31SchemeSigners.get(v31SchemeSigners.size() - 1).getCertificate());
                        } else if (result.isVerifiedUsingV3Scheme()) {
                            List<Result.V3SchemeSignerInfo> v3SchemeSigners2 = result.getV3SchemeSigners();
                            result.addSignerCertificate(v3SchemeSigners2.get(v3SchemeSigners2.size() - 1).getCertificate());
                        } else if (result.isVerifiedUsingV2Scheme()) {
                            it2 = result.getV2SchemeSigners().iterator();
                            while (it2.hasNext()) {
                                result.addSignerCertificate(it2.next().getCertificate());
                            }
                        } else {
                            if (result.isVerifiedUsingV1Scheme()) {
                                throw new RuntimeException("APK verified, but has not verified using any of v1, v2 or v3 schemes");
                            }
                            it = result.getV1SchemeSigners().iterator();
                            while (it.hasNext()) {
                                result.addSignerCertificate(it.next().getCertificate());
                            }
                        }
                        return result;
                    } catch (ZipFormatException e11) {
                        e = e11;
                        throw new ApkFormatException("Failed to read APK", e);
                    }
                }
                if (centralDirectoryRecord != null) {
                    try {
                        try {
                            result.mergeFrom(V2SourceStampVerifier.verify(dataSource, zipSectionsFindZipSections, LocalFileRecord.getUncompressedData(dataSource, centralDirectoryRecord, zipSectionsFindZipSections.getZipCentralDirectoryOffset()), map, Math.max(i12, 30), i11));
                        } catch (SignatureNotFoundException e12) {
                            result.addWarning(Issue.SOURCE_STAMP_SIG_MISSING, new Object[0]);
                        } catch (ZipFormatException e13) {
                            e = e13;
                            throw new ApkFormatException("Failed to read APK", e);
                        }
                    } catch (SignatureNotFoundException e14) {
                    } catch (ZipFormatException e15) {
                        e = e15;
                    }
                }
            } catch (SignatureNotFoundException e16) {
            } catch (ZipFormatException e17) {
                e = e17;
            }
            if (result.containsErrors()) {
                return result;
            }
            if (result.isVerifiedUsingV1Scheme() && result.isVerifiedUsingV2Scheme()) {
                arrayList = new ArrayList(result.getV1SchemeSigners());
                arrayList2 = new ArrayList(result.getV2SchemeSigners());
                arrayList3 = new ArrayList();
                arrayList4 = new ArrayList();
                it3 = arrayList.iterator();
                while (it3.hasNext()) {
                    v1SchemeSignerInfo = (Result.V1SchemeSignerInfo) it3.next();
                    Iterator it5 = it3;
                    arrayList3.add(new ByteArray(v1SchemeSignerInfo.getCertificate().getEncoded()));
                    it3 = it5;
                }
                while (r0.hasNext()) {
                    arrayList4.add(new ByteArray(v2SchemeSignerInfo.getCertificate().getEncoded()));
                }
                while (i8 < arrayList3.size()) {
                    if (!arrayList4.contains((ByteArray) arrayList3.get(i8))) {
                        ((Result.V1SchemeSignerInfo) arrayList.get(i8)).addError(Issue.V2_SIG_MISSING, new Object[0]);
                        break;
                    }
                }
                while (i9 < arrayList4.size()) {
                    if (!arrayList3.contains((ByteArray) arrayList4.get(i9))) {
                        ((Result.V2SchemeSignerInfo) arrayList2.get(i9)).addError(Issue.JAR_SIG_MISSING, new Object[0]);
                        break;
                    }
                }
            }
            if (result.isVerifiedUsingV3Scheme() && (result.isVerifiedUsingV1Scheme() || result.isVerifiedUsingV2Scheme())) {
                signingCertificateLineage = result.getSigningCertificateLineage();
                if (result.isVerifiedUsingV1Scheme()) {
                    v1SchemeSigners = result.getV1SchemeSigners();
                    if (v1SchemeSigners.size() != 1) {
                        i7 = 0;
                        result.addError(Issue.V3_SIG_MULTIPLE_PAST_SIGNERS, new Object[0]);
                    } else {
                        i7 = 0;
                    }
                    x509Certificate = (X509Certificate) v1SchemeSigners.get(i7).mCertChain.get(i7);
                } else {
                    v2SchemeSigners2 = result.getV2SchemeSigners();
                    if (v2SchemeSigners2.size() != 1) {
                        result.addError(Issue.V3_SIG_MULTIPLE_PAST_SIGNERS, new Object[0]);
                    }
                    x509Certificate = (X509Certificate) v2SchemeSigners2.get(0).mCerts.get(0);
                }
                if (signingCertificateLineage == null) {
                    v3SchemeSigners = result.getV3SchemeSigners();
                    if (v3SchemeSigners.size() != 1) {
                        i6 = 0;
                        result.addError(Issue.V3_SIG_MULTIPLE_SIGNERS, new Object[0]);
                    } else {
                        i6 = 0;
                    }
                    if (!Arrays.equals(x509Certificate.getEncoded(), ((X509Certificate) v3SchemeSigners.get(i6).mCerts.get(i6)).getEncoded())) {
                        result.addError(Issue.V3_SIG_PAST_SIGNERS_MISMATCH, new Object[0]);
                    }
                } else if (signingCertificateLineage.getSubLineage(x509Certificate).size() != 1) {
                    result.addError(Issue.V3_SIG_PAST_SIGNERS_MISMATCH, new Object[0]);
                }
            }
            if (result.isVerifiedUsingV4Scheme()) {
                v4SchemeSigners = result.getV4SchemeSigners();
                contentDigests = v4SchemeSigners.get(0).getContentDigests();
                if (contentDigests.size() != 1) {
                    result.addError(Issue.V4_SIG_V2_V3_DIGESTS_MISMATCH, new Object[0]);
                }
                value = contentDigests.get(0).getValue();
                if (result.isVerifiedUsingV3Scheme()) {
                    if (result.isVerifiedUsingV31Scheme()) {
                        i4 = i;
                    } else {
                        i4 = 1;
                    }
                    if (v4SchemeSigners.size() != i4) {
                        i5 = 0;
                        result.addError(Issue.V4_SIG_MULTIPLE_SIGNERS, new Object[0]);
                    } else {
                        i5 = 0;
                    }
                    checkV4Signer(result.getV3SchemeSigners(), v4SchemeSigners.get(i5).mCerts, value, result);
                    if (result.isVerifiedUsingV31Scheme()) {
                        checkV4Signer(result.getV31SchemeSigners(), v4SchemeSigners.get(1).mCerts, value, result);
                    }
                } else {
                    if (result.isVerifiedUsingV2Scheme()) {
                        throw new RuntimeException("V4 signature must be also verified with V2/V3");
                    }
                    if (v4SchemeSigners.size() != 1) {
                        result.addError(Issue.V4_SIG_MULTIPLE_SIGNERS, new Object[0]);
                    }
                    v2SchemeSigners = result.getV2SchemeSigners();
                    if (v2SchemeSigners.size() != 1) {
                        i3 = 0;
                        result.addError(Issue.V4_SIG_MULTIPLE_SIGNERS, new Object[0]);
                    } else {
                        i3 = 0;
                    }
                    checkV4Certificate(v4SchemeSigners.get(i3).mCerts, v2SchemeSigners.get(i3).mCerts, result);
                    if (!Arrays.equals(value, pickBestDigestForV4(v2SchemeSigners.get(i3).getContentDigests()))) {
                        result.addError(Issue.V4_SIG_V2_V3_DIGESTS_MISMATCH, new Object[i3]);
                    }
                }
            }
            if (androidManifestFromApk == null) {
                androidManifestFromApk = getAndroidManifestFromApk(dataSource, zipSectionsFindZipSections);
            }
            if (androidManifestFromApk != null && (minimumSignatureSchemeVersionForTargetSdk = getMinimumSignatureSchemeVersionForTargetSdk((targetSdkVersionFromBinaryAndroidManifest = ApkUtils.getTargetSdkVersionFromBinaryAndroidManifest(androidManifestFromApk.slice())))) > 1 && i11 >= targetSdkVersionFromBinaryAndroidManifest) {
                switch (minimumSignatureSchemeVersionForTargetSdk) {
                    case 2:
                        if (!result.isVerifiedUsingV2Scheme()) {
                        }
                    case 3:
                        if (!result.isVerifiedUsingV3Scheme() && !result.isVerifiedUsingV31Scheme()) {
                            result.addError(Issue.MIN_SIG_SCHEME_FOR_TARGET_SDK_NOT_MET, Integer.valueOf(targetSdkVersionFromBinaryAndroidManifest), Integer.valueOf(minimumSignatureSchemeVersionForTargetSdk));
                        }
                        break;
                }
            }
            if (result.containsErrors()) {
                return result;
            }
            result.setVerified();
            if (result.isVerifiedUsingV31Scheme()) {
                List<Result.V3SchemeSignerInfo> v31SchemeSigners2 = result.getV31SchemeSigners();
                result.addSignerCertificate(v31SchemeSigners2.get(v31SchemeSigners2.size() - 1).getCertificate());
            } else if (result.isVerifiedUsingV3Scheme()) {
                List<Result.V3SchemeSignerInfo> v3SchemeSigners3 = result.getV3SchemeSigners();
                result.addSignerCertificate(v3SchemeSigners3.get(v3SchemeSigners3.size() - 1).getCertificate());
            } else if (result.isVerifiedUsingV2Scheme()) {
                it2 = result.getV2SchemeSigners().iterator();
                while (it2.hasNext()) {
                    result.addSignerCertificate(it2.next().getCertificate());
                }
            } else {
                if (result.isVerifiedUsingV1Scheme()) {
                    throw new RuntimeException("APK verified, but has not verified using any of v1, v2 or v3 schemes");
                }
                it = result.getV1SchemeSigners().iterator();
                while (it.hasNext()) {
                    result.addSignerCertificate(it.next().getCertificate());
                }
            }
            return result;
        } catch (ZipFormatException e18) {
            throw new ApkFormatException("Malformed APK: not a ZIP archive", e18);
        }
    }

    private int verifyAndGetMinSdkVersion(DataSource dataSource, ApkUtils.ZipSections zipSections) throws AndroidBinXmlParser.XmlParserException, IOException, ApkFormatException {
        Integer num = this.mMinSdkVersion;
        if (num == null) {
            int minSdkVersionFromBinaryAndroidManifest = ApkUtils.getMinSdkVersionFromBinaryAndroidManifest((0 == 0 ? getAndroidManifestFromApk(dataSource, zipSections) : null).slice());
            if (minSdkVersionFromBinaryAndroidManifest <= this.mMaxSdkVersion) {
                return minSdkVersionFromBinaryAndroidManifest;
            }
            throw new IllegalArgumentException("minSdkVersion from APK (" + minSdkVersionFromBinaryAndroidManifest + ") > maxSdkVersion (" + this.mMaxSdkVersion + ")");
        }
        if (num.intValue() < 0) {
            throw new IllegalArgumentException("minSdkVersion must not be negative: " + this.mMinSdkVersion);
        }
        Integer num2 = this.mMinSdkVersion;
        if (num2 == null || num2.intValue() <= this.mMaxSdkVersion) {
            return this.mMinSdkVersion.intValue();
        }
        throw new IllegalArgumentException("minSdkVersion (" + this.mMinSdkVersion + ") > maxSdkVersion (" + this.mMaxSdkVersion + ")");
    }

    private Result verifySourceStamp(DataSource dataSource, String str) throws AndroidBinXmlParser.XmlParserException {
        int i;
        CentralDirectoryRecord centralDirectoryRecord;
        boolean z;
        Result result;
        ApkSigningBlockUtils.Result apkContentDigests;
        try {
            try {
                ApkUtils.ZipSections zipSectionsFindZipSections = ApkUtils.findZipSections(dataSource);
                int iVerifyAndGetMinSdkVersion = verifyAndGetMinSdkVersion(dataSource, zipSectionsFindZipSections);
                List<CentralDirectoryRecord> zipCentralDirectory = V1SchemeVerifier.parseZipCentralDirectory(dataSource, zipSectionsFindZipSections);
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
                        ApkSigningBlockUtils.findSignature(dataSource, zipSectionsFindZipSections, 1845461005, new ApkSigningBlockUtils.Result(0));
                        z = true;
                    } catch (ApkSigningBlockUtils.SignatureNotFoundException e) {
                        z = false;
                    }
                    return z ? createSourceStampResultWithError(Result.SourceStampInfo.SourceStampVerificationStatus.STAMP_NOT_VERIFIED, Issue.SOURCE_STAMP_SIGNATURE_BLOCK_WITHOUT_CERT_DIGEST, new Object[0]) : createSourceStampResultWithError(Result.SourceStampInfo.SourceStampVerificationStatus.STAMP_MISSING, Issue.SOURCE_STAMP_CERT_DIGEST_AND_SIG_BLOCK_MISSING, new Object[0]);
                }
                byte[] uncompressedData = LocalFileRecord.getUncompressedData(dataSource, centralDirectoryRecord, zipSectionsFindZipSections.getZipCentralDirectoryOffset());
                if (str != null) {
                    String hex = ApkSigningBlockUtils.toHex(uncompressedData);
                    if (!str.equalsIgnoreCase(hex)) {
                        return createSourceStampResultWithError(Result.SourceStampInfo.SourceStampVerificationStatus.CERT_DIGEST_MISMATCH, Issue.SOURCE_STAMP_EXPECTED_DIGEST_MISMATCH, hex, str);
                    }
                }
                HashMap map = new HashMap();
                Map<Integer, String> supportedSchemeNames = getSupportedSchemeNames(this.mMaxSdkVersion);
                HashSet hashSet = new HashSet(2);
                Result result2 = new Result();
                if (this.mMaxSdkVersion >= 28) {
                    try {
                        result = result2;
                        apkContentDigests = getApkContentDigests(dataSource, zipSectionsFindZipSections, hashSet, supportedSchemeNames, map, 3, Math.max(iVerifyAndGetMinSdkVersion, 28));
                        if (apkContentDigests != null && apkContentDigests.containsErrors()) {
                            result.mergeFrom(apkContentDigests);
                            return mergeSourceStampResult(Result.SourceStampInfo.SourceStampVerificationStatus.VERIFICATION_ERROR, result);
                        }
                    } catch (SignatureNotFoundException e2) {
                        i = 0;
                        return createSourceStampResultWithError(Result.SourceStampInfo.SourceStampVerificationStatus.STAMP_NOT_VERIFIED, Issue.SOURCE_STAMP_SIG_MISSING, new Object[i]);
                    }
                } else {
                    result = result2;
                    apkContentDigests = null;
                }
                if (this.mMaxSdkVersion >= 24 && (iVerifyAndGetMinSdkVersion < 28 || hashSet.isEmpty())) {
                    zipCentralDirectory = zipCentralDirectory;
                    iVerifyAndGetMinSdkVersion = iVerifyAndGetMinSdkVersion;
                    zipSectionsFindZipSections = zipSectionsFindZipSections;
                    result = result;
                    i = 0;
                    try {
                        ApkSigningBlockUtils.Result apkContentDigests2 = getApkContentDigests(dataSource, zipSectionsFindZipSections, hashSet, supportedSchemeNames, map, 2, Math.max(iVerifyAndGetMinSdkVersion, 24));
                        if (apkContentDigests2 != null && apkContentDigests2.containsErrors()) {
                            result.mergeFrom(apkContentDigests2);
                            return mergeSourceStampResult(Result.SourceStampInfo.SourceStampVerificationStatus.VERIFICATION_ERROR, result);
                        }
                    } catch (SignatureNotFoundException e3) {
                        return createSourceStampResultWithError(Result.SourceStampInfo.SourceStampVerificationStatus.STAMP_NOT_VERIFIED, Issue.SOURCE_STAMP_SIG_MISSING, new Object[i]);
                    }
                }
                int i2 = iVerifyAndGetMinSdkVersion;
                if (i2 < 24 || hashSet.isEmpty()) {
                    map.put(1, getApkContentDigestFromV1SigningScheme(zipCentralDirectory, dataSource, zipSectionsFindZipSections));
                }
                ApkSigResult apkSigResultVerify = V2SourceStampVerifier.verify(dataSource, zipSectionsFindZipSections, uncompressedData, map, i2, this.mMaxSdkVersion);
                result.mergeFrom(apkSigResultVerify);
                if (apkSigResultVerify.verified) {
                    result.setVerified();
                } else {
                    result.setWarningsAsErrors(true);
                }
                return result;
            } catch (SignatureNotFoundException e4) {
                i = 0;
            }
        } catch (ApkFormatException e5) {
            e = e5;
            return createSourceStampResultWithError(Result.SourceStampInfo.SourceStampVerificationStatus.VERIFICATION_ERROR, Issue.MALFORMED_APK, e);
        } catch (ZipFormatException e6) {
            e = e6;
            return createSourceStampResultWithError(Result.SourceStampInfo.SourceStampVerificationStatus.VERIFICATION_ERROR, Issue.MALFORMED_APK, e);
        } catch (IOException e7) {
            e = e7;
            return createSourceStampResultWithError(Result.SourceStampInfo.SourceStampVerificationStatus.VERIFICATION_ERROR, Issue.MALFORMED_APK, e);
        } catch (NoSuchAlgorithmException e8) {
            return createSourceStampResultWithError(Result.SourceStampInfo.SourceStampVerificationStatus.VERIFICATION_ERROR, Issue.UNEXPECTED_EXCEPTION, e8);
        }
    }

    public Result verify() throws IllegalStateException, NoSuchAlgorithmException, IOException, ApkFormatException {
        RandomAccessFile randomAccessFile = null;
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
            Result resultVerify = verify(dataSourceAsDataSource);
            if (randomAccessFile != null) {
                randomAccessFile.close();
            }
            return resultVerify;
        } catch (Throwable th) {
            if (0 != 0) {
                randomAccessFile.close();
            }
            throw th;
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
                Result resultCreateSourceStampResultWithError = createSourceStampResultWithError(Result.SourceStampInfo.SourceStampVerificationStatus.VERIFICATION_ERROR, Issue.UNEXPECTED_EXCEPTION, e2);
                if (0 != 0) {
                    try {
                        randomAccessFile.close();
                    } catch (IOException e3) {
                    }
                }
                return resultCreateSourceStampResultWithError;
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
