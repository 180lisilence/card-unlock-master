.class public final enum Lcom/android/apksig/ApkVerifier$Issue;
.super Ljava/lang/Enum;
.source "ApkVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/ApkVerifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Issue"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/apksig/ApkVerifier$Issue;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum APK_SIG_BLOCK_UNKNOWN_ENTRY_ID:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_DUPLICATE_MANIFEST_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_DUPLICATE_SIG_FILE_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_DUPLICATE_ZIP_ENTRY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_MANIFEST_MAIN_SECTION_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_MANIFEST_SECTION_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_MISSING_APK_SIG_REFERENCED:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_MISSING_FILE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_MISSING_VERSION_ATTR_IN_SIG_FILE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_MISSING_ZIP_ENTRY_REFERENCED_IN_MANIFEST:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_NO_APK_SIG_STRIP_PROTECTION:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_NO_MANIFEST:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_NO_MANIFEST_DIGEST_IN_SIG_FILE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_NO_SIGNED_ZIP_ENTRIES:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_NO_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_NO_ZIP_ENTRY_DIGEST_IN_MANIFEST:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_NO_ZIP_ENTRY_DIGEST_IN_SIG_FILE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_PARSE_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_UNKNOWN_APK_SIG_SCHEME_ID:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_UNNNAMED_MANIFEST_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_UNNNAMED_SIG_FILE_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_UNPROTECTED_ZIP_ENTRY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_UNSUPPORTED_SIG_ALG:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_ZIP_ENTRY_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_ZIP_ENTRY_NOT_SIGNED:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum JAR_SIG_ZIP_ENTRY_SIGNERS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum MALFORMED_APK:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum MIN_SIG_SCHEME_FOR_TARGET_SDK_NOT_MET:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum NO_SIG_FOR_TARGET_SANDBOX_VERSION:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_CERTIFICATE_MISMATCH_BETWEEN_SIGNATURE_BLOCK_AND_APK:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_CERT_DIGEST_AND_SIG_BLOCK_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_EXPECTED_DIGEST_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_INVALID_TIMESTAMP:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_MALFORMED_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_MALFORMED_LINEAGE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_MALFORMED_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_NO_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_NO_SUPPORTED_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_POR_CERT_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_POR_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_SIGNATURE_BLOCK_WITHOUT_CERT_DIGEST:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_SIG_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_UNKNOWN_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_UNKNOWN_SIG_ALGORITHM:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum SOURCE_STAMP_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum UNEXPECTED_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_APK_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_MALFORMED_DIGEST:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_MALFORMED_PUBLIC_KEY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_MALFORMED_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_MALFORMED_SIGNER:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_MALFORMED_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_MISSING_APK_SIG_REFERENCED:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_NO_CERTIFICATES:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_NO_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_NO_SUPPORTED_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_SIG_ALG_MISMATCH_BETWEEN_SIGNATURES_AND_DIGESTS_RECORDS:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_UNKNOWN_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_UNKNOWN_APK_SIG_SCHEME_ID:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_UNKNOWN_SIG_ALGORITHM:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V2_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V31_BLOCK_FOUND_WITHOUT_V3_BLOCK:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V31_BLOCK_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V31_ROTATION_MIN_SDK_ATTR_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V31_ROTATION_MIN_SDK_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V31_ROTATION_TARGETS_DEV_RELEASE_ATTR_ON_V3_SIGNER:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_INCONSISTENT_LINEAGES:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_INCONSISTENT_SDK_VERSIONS:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_MAX_SDK_VERSION_MISMATCH_BETWEEN_SIGNER_AND_SIGNED_DATA_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_MIN_SDK_VERSION_MISMATCH_BETWEEN_SIGNER_AND_SIGNED_DATA_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_MISSING_SDK_VERSIONS:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_APK_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_INVALID_SDK_VERSIONS:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_MALFORMED_DIGEST:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_MALFORMED_LINEAGE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_MALFORMED_PUBLIC_KEY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_MALFORMED_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_MALFORMED_SIGNER:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_MALFORMED_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_MULTIPLE_PAST_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_MULTIPLE_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_NO_CERTIFICATES:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_NO_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_NO_SUPPORTED_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_PAST_SIGNERS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_POR_CERT_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_POR_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_SIG_ALG_MISMATCH_BETWEEN_SIGNATURES_AND_DIGESTS_RECORDS:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_UNKNOWN_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_UNKNOWN_SIG_ALGORITHM:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V3_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_APK_ROOT_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_APK_TREE_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_MALFORMED_PUBLIC_KEY:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_MALFORMED_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_MULTIPLE_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_NO_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_NO_SUPPORTED_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_UNKNOWN_SIG_ALGORITHM:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_V2_V3_DIGESTS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_V2_V3_SIGNERS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

.field public static final enum V4_SIG_VERSION_NOT_CURRENT:Lcom/android/apksig/ApkVerifier$Issue;


# instance fields
.field private final mFormat:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/android/apksig/ApkVerifier$Issue;
    .locals 125

    .line 1871
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v1, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_SIGNED_ZIP_ENTRIES:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_DUPLICATE_ZIP_ENTRY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_DUPLICATE_MANIFEST_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v4, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_UNNNAMED_MANIFEST_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v5, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_UNNNAMED_SIG_FILE_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v6, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_MANIFEST:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v7, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MISSING_ZIP_ENTRY_REFERENCED_IN_MANIFEST:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v8, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_ZIP_ENTRY_DIGEST_IN_MANIFEST:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v9, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_ZIP_ENTRY_DIGEST_IN_SIG_FILE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v10, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_ZIP_ENTRY_NOT_SIGNED:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v11, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_ZIP_ENTRY_SIGNERS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v12, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_ZIP_ENTRY_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v13, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MANIFEST_MAIN_SECTION_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v14, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MANIFEST_SECTION_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v15, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_MANIFEST_DIGEST_IN_SIG_FILE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v16, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_APK_SIG_STRIP_PROTECTION:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v17, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MISSING_FILE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v18, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v19, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_UNSUPPORTED_SIG_ALG:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v20, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_PARSE_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v21, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v22, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v23, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v24, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_DUPLICATE_SIG_FILE_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v25, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MISSING_VERSION_ATTR_IN_SIG_FILE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v26, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_UNKNOWN_APK_SIG_SCHEME_ID:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v27, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MISSING_APK_SIG_REFERENCED:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v28, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_UNPROTECTED_ZIP_ENTRY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v29, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v30, Lcom/android/apksig/ApkVerifier$Issue;->NO_SIG_FOR_TARGET_SANDBOX_VERSION:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v31, Lcom/android/apksig/ApkVerifier$Issue;->MIN_SIG_SCHEME_FOR_TARGET_SDK_NOT_MET:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v32, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v33, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v34, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_SIGNER:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v35, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_PUBLIC_KEY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v36, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v37, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v38, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_DIGEST:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v39, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v40, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_UNKNOWN_APK_SIG_SCHEME_ID:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v41, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MISSING_APK_SIG_REFERENCED:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v42, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_NO_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v43, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_UNKNOWN_SIG_ALGORITHM:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v44, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_UNKNOWN_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v45, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v46, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v47, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v48, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_NO_SUPPORTED_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v49, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_NO_CERTIFICATES:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v50, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v51, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_SIG_ALG_MISMATCH_BETWEEN_SIGNATURES_AND_DIGESTS_RECORDS:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v52, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_APK_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v53, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v54, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_SIGNER:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v55, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_PUBLIC_KEY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v56, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v57, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v58, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_DIGEST:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v59, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v60, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_NO_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v61, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MULTIPLE_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v62, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MULTIPLE_PAST_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v63, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_PAST_SIGNERS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v64, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_UNKNOWN_SIG_ALGORITHM:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v65, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_UNKNOWN_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v66, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v67, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_INVALID_SDK_VERSIONS:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v68, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v69, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v70, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_NO_SUPPORTED_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v71, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_NO_CERTIFICATES:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v72, Lcom/android/apksig/ApkVerifier$Issue;->V3_MIN_SDK_VERSION_MISMATCH_BETWEEN_SIGNER_AND_SIGNED_DATA_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v73, Lcom/android/apksig/ApkVerifier$Issue;->V3_MAX_SDK_VERSION_MISMATCH_BETWEEN_SIGNER_AND_SIGNED_DATA_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v74, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v75, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_SIG_ALG_MISMATCH_BETWEEN_SIGNATURES_AND_DIGESTS_RECORDS:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v76, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_APK_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v77, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_POR_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v78, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_LINEAGE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v79, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_POR_CERT_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v80, Lcom/android/apksig/ApkVerifier$Issue;->V3_INCONSISTENT_SDK_VERSIONS:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v81, Lcom/android/apksig/ApkVerifier$Issue;->V3_MISSING_SDK_VERSIONS:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v82, Lcom/android/apksig/ApkVerifier$Issue;->V3_INCONSISTENT_LINEAGES:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v83, Lcom/android/apksig/ApkVerifier$Issue;->V31_BLOCK_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v84, Lcom/android/apksig/ApkVerifier$Issue;->V31_ROTATION_MIN_SDK_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v85, Lcom/android/apksig/ApkVerifier$Issue;->V31_ROTATION_MIN_SDK_ATTR_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v86, Lcom/android/apksig/ApkVerifier$Issue;->V31_BLOCK_FOUND_WITHOUT_V3_BLOCK:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v87, Lcom/android/apksig/ApkVerifier$Issue;->V31_ROTATION_TARGETS_DEV_RELEASE_ATTR_ON_V3_SIGNER:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v88, Lcom/android/apksig/ApkVerifier$Issue;->APK_SIG_BLOCK_UNKNOWN_ENTRY_ID:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v89, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_MALFORMED_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v90, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_UNKNOWN_SIG_ALGORITHM:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v91, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v92, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_NO_SUPPORTED_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v93, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v94, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v95, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_MALFORMED_PUBLIC_KEY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v96, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v97, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_NO_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v98, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v99, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_APK_ROOT_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v100, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_APK_TREE_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v101, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_MULTIPLE_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v102, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_V2_V3_SIGNERS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v103, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_V2_V3_DIGESTS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v104, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_VERSION_NOT_CURRENT:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v105, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_CERT_DIGEST_AND_SIG_BLOCK_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v106, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_SIG_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v107, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v108, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_MALFORMED_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v109, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_UNKNOWN_SIG_ALGORITHM:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v110, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v111, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v112, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_NO_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v113, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_NO_SUPPORTED_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v114, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_CERTIFICATE_MISMATCH_BETWEEN_SIGNATURE_BLOCK_AND_APK:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v115, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_SIGNATURE_BLOCK_WITHOUT_CERT_DIGEST:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v116, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_EXPECTED_DIGEST_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v117, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_MALFORMED_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v118, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_UNKNOWN_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v119, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_MALFORMED_LINEAGE:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v120, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_POR_CERT_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v121, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_POR_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v122, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_INVALID_TIMESTAMP:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v123, Lcom/android/apksig/ApkVerifier$Issue;->MALFORMED_APK:Lcom/android/apksig/ApkVerifier$Issue;

    sget-object v124, Lcom/android/apksig/ApkVerifier$Issue;->UNEXPECTED_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array/range {v0 .. v124}, [Lcom/android/apksig/ApkVerifier$Issue;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 17

    .line 1876
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v1, 0x0

    const-string v2, "No JAR signatures"

    const-string v3, "JAR_SIG_NO_SIGNATURES"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    .line 1881
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v1, 0x1

    const-string v2, "No JAR entries covered by JAR signatures"

    const-string v3, "JAR_SIG_NO_SIGNED_ZIP_ENTRIES"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_SIGNED_ZIP_ENTRIES:Lcom/android/apksig/ApkVerifier$Issue;

    .line 1890
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v1, 0x2

    const-string v2, "Duplicate entry: %1$s"

    const-string v3, "JAR_SIG_DUPLICATE_ZIP_ENTRY"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_DUPLICATE_ZIP_ENTRY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 1899
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v1, 0x3

    const-string v2, "Duplicate section in META-INF/MANIFEST.MF: %1$s"

    const-string v3, "JAR_SIG_DUPLICATE_MANIFEST_SECTION"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_DUPLICATE_MANIFEST_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

    .line 1908
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v1, 0x4

    const-string v2, "Malformed META-INF/MANIFEST.MF: invidual section #%1$d does not have a name"

    const-string v3, "JAR_SIG_UNNNAMED_MANIFEST_SECTION"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_UNNNAMED_MANIFEST_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

    .line 1919
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v1, 0x5

    const-string v2, "Malformed %1$s: invidual section #%2$d does not have a name"

    const-string v3, "JAR_SIG_UNNNAMED_SIG_FILE_SECTION"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_UNNNAMED_SIG_FILE_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

    .line 1923
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v1, 0x6

    const-string v2, "Missing META-INF/MANIFEST.MF"

    const-string v3, "JAR_SIG_NO_MANIFEST"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_MANIFEST:Lcom/android/apksig/ApkVerifier$Issue;

    .line 1932
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v1, 0x7

    const-string v2, "%1$s entry referenced by META-INF/MANIFEST.MF not found in the APK"

    const-string v3, "JAR_SIG_MISSING_ZIP_ENTRY_REFERENCED_IN_MANIFEST"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MISSING_ZIP_ENTRY_REFERENCED_IN_MANIFEST:Lcom/android/apksig/ApkVerifier$Issue;

    .line 1942
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x8

    const-string v2, "No digest for %1$s in META-INF/MANIFEST.MF"

    const-string v3, "JAR_SIG_NO_ZIP_ENTRY_DIGEST_IN_MANIFEST"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_ZIP_ENTRY_DIGEST_IN_MANIFEST:Lcom/android/apksig/ApkVerifier$Issue;

    .line 1952
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x9

    const-string v2, "No digest for %1$s in %2$s"

    const-string v3, "JAR_SIG_NO_ZIP_ENTRY_DIGEST_IN_SIG_FILE"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_ZIP_ENTRY_DIGEST_IN_SIG_FILE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 1961
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0xa

    const-string v2, "%1$s entry not signed"

    const-string v3, "JAR_SIG_ZIP_ENTRY_NOT_SIGNED"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_ZIP_ENTRY_NOT_SIGNED:Lcom/android/apksig/ApkVerifier$Issue;

    .line 1973
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0xb

    const-string v2, "Entries %1$s and %3$s are signed with different sets of signers : <%2$s> vs <%4$s>"

    const-string v3, "JAR_SIG_ZIP_ENTRY_SIGNERS_MISMATCH"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_ZIP_ENTRY_SIGNERS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    .line 1990
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0xc

    const-string v2, "%2$s digest of %1$s does not match the digest specified in %3$s. Expected: <%5$s>, actual: <%4$s>"

    const-string v3, "JAR_SIG_ZIP_ENTRY_DIGEST_DID_NOT_VERIFY"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_ZIP_ENTRY_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2005
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0xd

    const-string v2, "%1$s digest of META-INF/MANIFEST.MF main section does not match the digest specified in %2$s. Expected: <%4$s>, actual: <%3$s>"

    const-string v3, "JAR_SIG_MANIFEST_MAIN_SECTION_DIGEST_DID_NOT_VERIFY"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MANIFEST_MAIN_SECTION_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2022
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0xe

    const-string v2, "%2$s digest of META-INF/MANIFEST.MF section for %1$s does not match the digest specified in %3$s. Expected: <%5$s>, actual: <%4$s>"

    const-string v3, "JAR_SIG_MANIFEST_SECTION_DIGEST_DID_NOT_VERIFY"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MANIFEST_SECTION_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2034
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0xf

    const-string v2, "%1$s does not specify digest of META-INF/MANIFEST.MF. This slows down verification."

    const-string v3, "JAR_SIG_NO_MANIFEST_DIGEST_IN_SIG_FILE"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_MANIFEST_DIGEST_IN_SIG_FILE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2046
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x10

    const-string v2, "APK is signed using APK Signature Scheme v2 but these signatures may be stripped without being detected because %1$s does not contain anti-stripping protections."

    const-string v3, "JAR_SIG_NO_APK_SIG_STRIP_PROTECTION"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_APK_SIG_STRIP_PROTECTION:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2059
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x11

    const-string v2, "Partial JAR signature. Found: %1$s, missing: %2$s"

    const-string v3, "JAR_SIG_MISSING_FILE"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MISSING_FILE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2071
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x12

    const-string v2, "Failed to verify JAR signature %1$s against %2$s: %3$s"

    const-string v3, "JAR_SIG_VERIFY_EXCEPTION"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2086
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x13

    const-string v2, "JAR signature %1$s uses digest algorithm %5$s and signature algorithm %6$s which is not supported on API Level(s) %4$s for which this APK is being verified"

    const-string v3, "JAR_SIG_UNSUPPORTED_SIG_ALG"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_UNSUPPORTED_SIG_ALG:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2099
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x14

    const-string v2, "Failed to parse JAR signature %1$s: %2$s"

    const-string v3, "JAR_SIG_PARSE_EXCEPTION"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_PARSE_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2110
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x15

    const-string v2, "Malformed certificate in JAR signature %1$s: %2$s"

    const-string v3, "JAR_SIG_MALFORMED_CERTIFICATE"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2121
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x16

    const-string v2, "JAR signature %1$s did not verify against %2$s"

    const-string v3, "JAR_SIG_DID_NOT_VERIFY"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2130
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x17

    const-string v2, "JAR signature %1$s contains no signers"

    const-string v3, "JAR_SIG_NO_SIGNERS"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2140
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x18

    const-string v2, "Duplicate section in %1$s: %2$s"

    const-string v3, "JAR_SIG_DUPLICATE_SIG_FILE_SECTION"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_DUPLICATE_SIG_FILE_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2150
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x19

    const-string v2, "Malformed %1$s: missing Signature-Version attribute"

    const-string v3, "JAR_SIG_MISSING_VERSION_ATTR_IN_SIG_FILE"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MISSING_VERSION_ATTR_IN_SIG_FILE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2161
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x1a

    const-string v2, "JAR signature %1$s references unknown APK signature scheme ID: %2$d"

    const-string v3, "JAR_SIG_UNKNOWN_APK_SIG_SCHEME_ID"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_UNKNOWN_APK_SIG_SCHEME_ID:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2175
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x1b

    const-string v2, "JAR signature %1$s indicates the APK is signed using %3$s but no such signature was found. Signature stripped?"

    const-string v3, "JAR_SIG_MISSING_APK_SIG_REFERENCED"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MISSING_APK_SIG_REFERENCED:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2187
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x1c

    const-string v2, "%1$s not protected by signature. Unauthorized modifications to this JAR entry will not be detected. Delete or move the entry outside of META-INF/."

    const-string v3, "JAR_SIG_UNPROTECTED_ZIP_ENTRY"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_UNPROTECTED_ZIP_ENTRY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2196
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x1d

    const-string v2, "No JAR signature from this signer"

    const-string v3, "JAR_SIG_MISSING"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2206
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x1e

    const-string v2, "Missing APK Signature Scheme v2 signature required for target sandbox version %1$d"

    const-string v3, "NO_SIG_FOR_TARGET_SANDBOX_VERSION"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->NO_SIG_FOR_TARGET_SANDBOX_VERSION:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2219
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x1f

    const-string v2, "Target SDK version %1$d requires a minimum of signature scheme v%2$d; the APK is not signed with this or a later signature scheme"

    const-string v3, "MIN_SIG_SCHEME_FOR_TARGET_SDK_NOT_MET"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->MIN_SIG_SCHEME_FOR_TARGET_SDK_NOT_MET:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2228
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x20

    const-string v2, "No APK Signature Scheme v2 signature from this signer"

    const-string v3, "V2_SIG_MISSING"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2233
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V2_SIG_MALFORMED_SIGNERS"

    const/16 v2, 0x21

    const-string v3, "Malformed list of signers"

    invoke-direct {v0, v1, v2, v3}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2239
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V2_SIG_MALFORMED_SIGNER"

    const/16 v2, 0x22

    const-string v4, "Malformed signer block"

    invoke-direct {v0, v1, v2, v4}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_SIGNER:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2249
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V2_SIG_MALFORMED_PUBLIC_KEY"

    const/16 v2, 0x23

    const-string v5, "Malformed public key: %1$s"

    invoke-direct {v0, v1, v2, v5}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_PUBLIC_KEY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2262
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V2_SIG_MALFORMED_CERTIFICATE"

    const/16 v2, 0x24

    const-string v6, "Malformed certificate #%2$d: %3$s"

    invoke-direct {v0, v1, v2, v6}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2272
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x25

    const-string v2, "Malformed APK Signature Scheme v2 signature record #%1$d"

    const-string v7, "V2_SIG_MALFORMED_SIGNATURE"

    invoke-direct {v0, v7, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2282
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x26

    const-string v2, "Malformed APK Signature Scheme v2 digest record #%1$d"

    const-string v7, "V2_SIG_MALFORMED_DIGEST"

    invoke-direct {v0, v7, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_DIGEST:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2291
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V2_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE"

    const/16 v2, 0x27

    const-string v7, "Malformed additional attribute #%1$d"

    invoke-direct {v0, v1, v2, v7}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2301
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x28

    const-string v2, "APK Signature Scheme v2 signer: %1$s references unknown APK signature scheme ID: %2$d"

    const-string v8, "V2_SIG_UNKNOWN_APK_SIG_SCHEME_ID"

    invoke-direct {v0, v8, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_UNKNOWN_APK_SIG_SCHEME_ID:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2315
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x29

    const-string v2, "APK Signature Scheme v2 signature %1$s indicates the APK is signed using %2$s but no such signature was found. Signature stripped?"

    const-string v8, "V2_SIG_MISSING_APK_SIG_REFERENCED"

    invoke-direct {v0, v8, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MISSING_APK_SIG_REFERENCED:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2322
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x2a

    const-string v2, "No signers in APK Signature Scheme v2 signature"

    const-string v8, "V2_SIG_NO_SIGNERS"

    invoke-direct {v0, v8, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_NO_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2332
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V2_SIG_UNKNOWN_SIG_ALGORITHM"

    const/16 v2, 0x2b

    const-string v8, "Unknown signature algorithm: %1$#x"

    invoke-direct {v0, v1, v2, v8}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_UNKNOWN_SIG_ALGORITHM:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2341
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V2_SIG_UNKNOWN_ADDITIONAL_ATTRIBUTE"

    const/16 v2, 0x2c

    const-string v9, "Unknown additional attribute: ID %1$#x"

    invoke-direct {v0, v1, v2, v9}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_UNKNOWN_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2352
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V2_SIG_VERIFY_EXCEPTION"

    const/16 v2, 0x2d

    const-string v10, "Failed to verify %1$s signature: %2$s"

    invoke-direct {v0, v1, v2, v10}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2361
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V2_SIG_DID_NOT_VERIFY"

    const/16 v2, 0x2e

    const-string v11, "%1$s signature over signed-data did not verify"

    invoke-direct {v0, v1, v2, v11}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2366
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V2_SIG_NO_SIGNATURES"

    const/16 v2, 0x2f

    const-string v12, "No signatures"

    invoke-direct {v0, v1, v2, v12}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2371
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x30

    const-string v2, "No supported signatures: %1$s"

    const-string v13, "V2_SIG_NO_SUPPORTED_SIGNATURES"

    invoke-direct {v0, v13, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_NO_SUPPORTED_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2376
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V2_SIG_NO_CERTIFICATES"

    const/16 v2, 0x31

    const-string v13, "No certificates"

    invoke-direct {v0, v1, v2, v13}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_NO_CERTIFICATES:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2387
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V2_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD"

    const/16 v2, 0x32

    const-string v14, "Public key mismatch between certificate and signature record: <%1$s> vs <%2$s>"

    invoke-direct {v0, v1, v2, v14}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2399
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V2_SIG_SIG_ALG_MISMATCH_BETWEEN_SIGNATURES_AND_DIGESTS_RECORDS"

    const/16 v2, 0x33

    const-string v15, "Signature algorithms mismatch between signatures and digests records: %1$s vs %2$s"

    invoke-direct {v0, v1, v2, v15}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_SIG_ALG_MISMATCH_BETWEEN_SIGNATURES_AND_DIGESTS_RECORDS:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2413
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V2_SIG_APK_DIGEST_DID_NOT_VERIFY"

    const/16 v2, 0x34

    move-object/from16 v16, v15

    const-string v15, "APK integrity check failed. %1$s digest mismatch. Expected: <%2$s>, actual: <%3$s>"

    invoke-direct {v0, v1, v2, v15}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_APK_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2420
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V3_SIG_MALFORMED_SIGNERS"

    const/16 v2, 0x35

    invoke-direct {v0, v1, v2, v3}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2426
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V3_SIG_MALFORMED_SIGNER"

    const/16 v2, 0x36

    invoke-direct {v0, v1, v2, v4}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_SIGNER:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2436
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V3_SIG_MALFORMED_PUBLIC_KEY"

    const/16 v2, 0x37

    invoke-direct {v0, v1, v2, v5}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_PUBLIC_KEY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2449
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V3_SIG_MALFORMED_CERTIFICATE"

    const/16 v2, 0x38

    invoke-direct {v0, v1, v2, v6}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2459
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x39

    const-string v2, "Malformed APK Signature Scheme v3 signature record #%1$d"

    const-string v3, "V3_SIG_MALFORMED_SIGNATURE"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2469
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x3a

    const-string v2, "Malformed APK Signature Scheme v3 digest record #%1$d"

    const-string v3, "V3_SIG_MALFORMED_DIGEST"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_DIGEST:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2478
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V3_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE"

    const/16 v2, 0x3b

    invoke-direct {v0, v1, v2, v7}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2483
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x3c

    const-string v2, "No signers in APK Signature Scheme v3 signature"

    const-string v3, "V3_SIG_NO_SIGNERS"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_NO_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2489
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x3d

    const-string v2, "Multiple APK Signature Scheme v3 signatures found for a single  platform version."

    const-string v3, "V3_SIG_MULTIPLE_SIGNERS"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MULTIPLE_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2496
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x3e

    const-string v2, "Multiple signatures found for pre-v3 signing with an APK  Signature Scheme v3 signer.  Only one allowed."

    const-string v3, "V3_SIG_MULTIPLE_PAST_SIGNERS"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MULTIPLE_PAST_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2503
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x3f

    const-string v2, "v3 signer differs from v1/v2 signer without proper signing certificate lineage."

    const-string v3, "V3_SIG_PAST_SIGNERS_MISMATCH"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_PAST_SIGNERS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2514
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V3_SIG_UNKNOWN_SIG_ALGORITHM"

    const/16 v2, 0x40

    invoke-direct {v0, v1, v2, v8}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_UNKNOWN_SIG_ALGORITHM:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2523
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V3_SIG_UNKNOWN_ADDITIONAL_ATTRIBUTE"

    const/16 v2, 0x41

    invoke-direct {v0, v1, v2, v9}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_UNKNOWN_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2534
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V3_SIG_VERIFY_EXCEPTION"

    const/16 v2, 0x42

    invoke-direct {v0, v1, v2, v10}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2545
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x43

    const-string v2, "Invalid SDK Version parameter(s) encountered in APK Signature scheme v3 signature: minSdkVersion %1$s maxSdkVersion: %2$s"

    const-string v3, "V3_SIG_INVALID_SDK_VERSIONS"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_INVALID_SDK_VERSIONS:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2555
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V3_SIG_DID_NOT_VERIFY"

    const/16 v2, 0x44

    invoke-direct {v0, v1, v2, v11}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2560
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V3_SIG_NO_SIGNATURES"

    const/16 v2, 0x45

    invoke-direct {v0, v1, v2, v12}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2565
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x46

    const-string v2, "No supported signatures"

    const-string v3, "V3_SIG_NO_SUPPORTED_SIGNATURES"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_NO_SUPPORTED_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2570
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V3_SIG_NO_CERTIFICATES"

    const/16 v2, 0x47

    invoke-direct {v0, v1, v2, v13}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_NO_CERTIFICATES:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2581
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x48

    const-string v2, "minSdkVersion mismatch between signed data and signature record: <%1$s> vs <%2$s>"

    const-string v3, "V3_MIN_SDK_VERSION_MISMATCH_BETWEEN_SIGNER_AND_SIGNED_DATA_RECORD"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_MIN_SDK_VERSION_MISMATCH_BETWEEN_SIGNER_AND_SIGNED_DATA_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2594
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x49

    const-string v2, "maxSdkVersion mismatch between signed data and signature record: <%1$s> vs <%2$s>"

    const-string v3, "V3_MAX_SDK_VERSION_MISMATCH_BETWEEN_SIGNER_AND_SIGNED_DATA_RECORD"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_MAX_SDK_VERSION_MISMATCH_BETWEEN_SIGNER_AND_SIGNED_DATA_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2607
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V3_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD"

    const/16 v2, 0x4a

    invoke-direct {v0, v1, v2, v14}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2619
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V3_SIG_SIG_ALG_MISMATCH_BETWEEN_SIGNATURES_AND_DIGESTS_RECORDS"

    const/16 v2, 0x4b

    move-object/from16 v3, v16

    invoke-direct {v0, v1, v2, v3}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_SIG_ALG_MISMATCH_BETWEEN_SIGNATURES_AND_DIGESTS_RECORDS:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2633
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V3_SIG_APK_DIGEST_DID_NOT_VERIFY"

    const/16 v2, 0x4c

    invoke-direct {v0, v1, v2, v15}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_APK_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2641
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x4d

    const-string v2, "SigningCertificateLineage attribute containd a proof-of-rotation record with signature(s) that did not verify."

    const-string v3, "V3_SIG_POR_DID_NOT_VERIFY"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_POR_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2648
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x4e

    const-string v2, "Failed to parse the SigningCertificateLineage structure in the APK Signature Scheme v3 signature\'s additional attributes section."

    const-string v3, "V3_SIG_MALFORMED_LINEAGE"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_LINEAGE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2655
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V3_SIG_POR_CERT_MISMATCH"

    const/16 v2, 0x4f

    const-string v3, "APK signing certificate differs from the associated certificate found in the signer\'s SigningCertificateLineage."

    invoke-direct {v0, v1, v2, v3}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_POR_CERT_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2665
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x50

    const-string v2, "APK Signature Scheme v3 signers supported min/max SDK versions are not continuous."

    const-string v4, "V3_INCONSISTENT_SDK_VERSIONS"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_INCONSISTENT_SDK_VERSIONS:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2676
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x51

    const-string v2, "APK Signature Scheme v3 signers supported min/max SDK versions do not cover the entire desired range.  Found min:  %1$s max %2$s"

    const-string v4, "V3_MISSING_SDK_VERSIONS"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_MISSING_SDK_VERSIONS:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2684
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x52

    const-string v2, "SigningCertificateLineages targeting different platform versions using APK Signature Scheme v3 are not all a part of the same overall lineage."

    const-string v4, "V3_INCONSISTENT_LINEAGES"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_INCONSISTENT_LINEAGES:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2695
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x53

    const-string v2, "The v3 signer indicates key rotation should be supported starting from SDK version %1$s, but a v3.1 block was not found"

    const-string v4, "V31_BLOCK_MISSING"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V31_BLOCK_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2708
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x54

    const-string v2, "The v3 signer indicates key rotation should be supported starting from SDK version %1$s, but the v3.1 block targets %2$s for rotation"

    const-string v4, "V31_ROTATION_MIN_SDK_MISMATCH"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V31_ROTATION_MIN_SDK_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2720
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x55

    const-string v2, "APK supports key rotation starting from SDK version %1$s, but the v3 signer does not contain the attribute to detect if this signature is stripped"

    const-string v4, "V31_ROTATION_MIN_SDK_ATTR_MISSING"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V31_ROTATION_MIN_SDK_ATTR_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2729
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x56

    const-string v2, "The APK contains a v3.1 signing block without a v3.0 base block"

    const-string v4, "V31_BLOCK_FOUND_WITHOUT_V3_BLOCK"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V31_BLOCK_FOUND_WITHOUT_V3_BLOCK:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2738
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x57

    const-string v2, "The rotation-targets-dev-release attribute is only supported on v3.1 signers; this attribute will be ignored by the platform in a v3.0 signer"

    const-string v4, "V31_ROTATION_TARGETS_DEV_RELEASE_ATTR_ON_V3_SIGNER"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V31_ROTATION_TARGETS_DEV_RELEASE_ATTR_ON_V3_SIGNER:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2749
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x58

    const-string v2, "APK Signing Block contains unknown entry: ID %1$#x"

    const-string v4, "APK_SIG_BLOCK_UNKNOWN_ENTRY_ID"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->APK_SIG_BLOCK_UNKNOWN_ENTRY_ID:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2759
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x59

    const-string v2, "V4 signature has malformed signer block"

    const-string v4, "V4_SIG_MALFORMED_SIGNERS"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_MALFORMED_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2770
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x5a

    const-string v2, "V4 signature has unknown signing algorithm: %1$#x"

    const-string v4, "V4_SIG_UNKNOWN_SIG_ALGORITHM"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_UNKNOWN_SIG_ALGORITHM:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2776
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x5b

    const-string v2, "V4 signature has no signature found"

    const-string v4, "V4_SIG_NO_SIGNATURES"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2783
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x5c

    const-string v2, "V4 signature has no supported signature"

    const-string v4, "V4_SIG_NO_SUPPORTED_SIGNATURES"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_NO_SUPPORTED_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2793
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V4_SIG_DID_NOT_VERIFY"

    const/16 v2, 0x5d

    invoke-direct {v0, v1, v2, v11}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2804
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V4_SIG_VERIFY_EXCEPTION"

    const/16 v2, 0x5e

    invoke-direct {v0, v1, v2, v10}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2814
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "V4_SIG_MALFORMED_PUBLIC_KEY"

    const/16 v2, 0x5f

    invoke-direct {v0, v1, v2, v5}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_MALFORMED_PUBLIC_KEY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2827
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x60

    const-string v2, "V4 signature has malformed certificate"

    const-string v4, "V4_SIG_MALFORMED_CERTIFICATE"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2833
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x61

    const-string v2, "V4 signature has no certificate"

    const-string v4, "V4_SIG_NO_CERTIFICATE"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_NO_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2844
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x62

    const-string v2, "V4 signature has mismatched certificate and signature: <%1$s> vs <%2$s>"

    const-string v4, "V4_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2857
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x63

    const-string v2, "V4 signature\'s hash tree root (content digest) did not verity"

    const-string v4, "V4_SIG_APK_ROOT_DID_NOT_VERIFY"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_APK_ROOT_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2870
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x64

    const-string v2, "V4 signature\'s hash tree did not verity"

    const-string v4, "V4_SIG_APK_TREE_DID_NOT_VERIFY"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_APK_TREE_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2876
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x65

    const-string v2, "V4 signature only supports one signer"

    const-string v4, "V4_SIG_MULTIPLE_SIGNERS"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_MULTIPLE_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2883
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x66

    const-string v2, "V4 signature and V2/V3 signature have mismatched certificates"

    const-string v4, "V4_SIG_V2_V3_SIGNERS_MISMATCH"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_V2_V3_SIGNERS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2886
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x67

    const-string v2, "V4 signature and V2/V3 signature have mismatched digests"

    const-string v4, "V4_SIG_V2_V3_DIGESTS_MISMATCH"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_V2_V3_DIGESTS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2893
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x68

    const-string v2, "V4 signature format version %1$d is different from the tool\'s current version %2$d"

    const-string v4, "V4_SIG_VERSION_NOT_CURRENT"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_VERSION_NOT_CURRENT:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2901
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x69

    const-string v2, "Neither the source stamp certificate digest file nor the signature block are present in the APK"

    const-string v4, "SOURCE_STAMP_CERT_DIGEST_AND_SIG_BLOCK_MISSING"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_CERT_DIGEST_AND_SIG_BLOCK_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2906
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x6a

    const-string v2, "No SourceStamp signature"

    const-string v4, "SOURCE_STAMP_SIG_MISSING"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_SIG_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2915
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x6b

    const-string v2, "Malformed certificate: %1$s"

    const-string v4, "SOURCE_STAMP_MALFORMED_CERTIFICATE"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2918
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x6c

    const-string v2, "Malformed SourceStamp signature"

    const-string v4, "SOURCE_STAMP_MALFORMED_SIGNATURE"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_MALFORMED_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2927
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "SOURCE_STAMP_UNKNOWN_SIG_ALGORITHM"

    const/16 v2, 0x6d

    invoke-direct {v0, v1, v2, v8}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_UNKNOWN_SIG_ALGORITHM:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2937
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "SOURCE_STAMP_VERIFY_EXCEPTION"

    const/16 v2, 0x6e

    invoke-direct {v0, v1, v2, v10}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2946
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "SOURCE_STAMP_DID_NOT_VERIFY"

    const/16 v2, 0x6f

    invoke-direct {v0, v1, v2, v11}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2949
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x70

    const-string v2, "No signature"

    const-string v4, "SOURCE_STAMP_NO_SIGNATURE"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_NO_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2960
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x71

    const-string v2, "Signature(s) {%1$s} not supported: %2$s"

    const-string v4, "SOURCE_STAMP_NO_SUPPORTED_SIGNATURE"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_NO_SUPPORTED_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2973
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x72

    const-string v2, "Certificate mismatch between SourceStamp block in APK signing block and SourceStamp file in APK: <%1$s> vs <%2$s>"

    const-string v4, "SOURCE_STAMP_CERTIFICATE_MISMATCH_BETWEEN_SIGNATURE_BLOCK_AND_APK"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_CERTIFICATE_MISMATCH_BETWEEN_SIGNATURE_BLOCK_AND_APK:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2981
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x73

    const-string v2, "A source stamp signature block was found without a corresponding certificate digest in the APK"

    const-string v4, "SOURCE_STAMP_SIGNATURE_BLOCK_WITHOUT_CERT_DIGEST"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_SIGNATURE_BLOCK_WITHOUT_CERT_DIGEST:Lcom/android/apksig/ApkVerifier$Issue;

    .line 2993
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x74

    const-string v2, "The source stamp certificate digest in the APK, %1$s, does not match the expected digest, %2$s"

    const-string v4, "SOURCE_STAMP_EXPECTED_DIGEST_MISMATCH"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_EXPECTED_DIGEST_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    .line 3004
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x75

    const-string v2, "Malformed stamp attribute #%1$d"

    const-string v4, "SOURCE_STAMP_MALFORMED_ATTRIBUTE"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_MALFORMED_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 3013
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x76

    const-string v2, "Unknown stamp attribute: ID %1$#x"

    const-string v4, "SOURCE_STAMP_UNKNOWN_ATTRIBUTE"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_UNKNOWN_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 3019
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x77

    const-string v2, "Failed to parse the SigningCertificateLineage structure in the source stamp attributes section."

    const-string v4, "SOURCE_STAMP_MALFORMED_LINEAGE"

    invoke-direct {v0, v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_MALFORMED_LINEAGE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 3026
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const-string v1, "SOURCE_STAMP_POR_CERT_MISMATCH"

    const/16 v2, 0x78

    invoke-direct {v0, v1, v2, v3}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_POR_CERT_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    .line 3034
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x79

    const-string v2, "Source stamp SigningCertificateLineage attribute contains a proof-of-rotation record with signature(s) that did not verify."

    const-string v3, "SOURCE_STAMP_POR_DID_NOT_VERIFY"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_POR_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 3043
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x7a

    const-string v2, "The source stamp timestamp attribute has an invalid value: %1$d"

    const-string v3, "SOURCE_STAMP_INVALID_TIMESTAMP"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_INVALID_TIMESTAMP:Lcom/android/apksig/ApkVerifier$Issue;

    .line 3053
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x7b

    const-string v2, "Malformed APK; the following exception was caught when attempting to parse the APK: %1$s"

    const-string v3, "MALFORMED_APK"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->MALFORMED_APK:Lcom/android/apksig/ApkVerifier$Issue;

    .line 3064
    new-instance v0, Lcom/android/apksig/ApkVerifier$Issue;

    const/16 v1, 0x7c

    const-string v2, "An unexpected exception was caught when verifying the signature: %1$s"

    const-string v3, "UNEXPECTED_EXCEPTION"

    invoke-direct {v0, v3, v1, v2}, Lcom/android/apksig/ApkVerifier$Issue;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->UNEXPECTED_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    .line 1871
    invoke-static {}, Lcom/android/apksig/ApkVerifier$Issue;->$values()[Lcom/android/apksig/ApkVerifier$Issue;

    move-result-object v0

    sput-object v0, Lcom/android/apksig/ApkVerifier$Issue;->$VALUES:[Lcom/android/apksig/ApkVerifier$Issue;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "format"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x0
        }
        names = {
            "$enum$name",
            "$enum$ordinal",
            "format"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 3069
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 3070
    iput-object p3, p0, Lcom/android/apksig/ApkVerifier$Issue;->mFormat:Ljava/lang/String;

    .line 3071
    return-void
.end method

.method static synthetic access$2100(Lcom/android/apksig/ApkVerifier$Issue;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Issue;

    .line 1871
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Issue;->mFormat:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/android/apksig/ApkVerifier$Issue;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Issue;

    .line 1871
    invoke-direct {p0}, Lcom/android/apksig/ApkVerifier$Issue;->getFormat()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getFormat()Ljava/lang/String;
    .locals 1

    .line 3078
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Issue;->mFormat:Ljava/lang/String;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/apksig/ApkVerifier$Issue;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 1871
    const-class v0, Lcom/android/apksig/ApkVerifier$Issue;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/apksig/ApkVerifier$Issue;

    return-object v0
.end method

.method public static values()[Lcom/android/apksig/ApkVerifier$Issue;
    .locals 1

    .line 1871
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->$VALUES:[Lcom/android/apksig/ApkVerifier$Issue;

    invoke-virtual {v0}, [Lcom/android/apksig/ApkVerifier$Issue;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/apksig/ApkVerifier$Issue;

    return-object v0
.end method
