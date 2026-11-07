.class public Lcom/android/apksig/ApkVerifier;
.super Ljava/lang/Object;
.source "ApkVerifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/ApkVerifier$Result;,
        Lcom/android/apksig/ApkVerifier$Issue;,
        Lcom/android/apksig/ApkVerifier$ByteArray;,
        Lcom/android/apksig/ApkVerifier$ApkVerificationIssueAdapter;,
        Lcom/android/apksig/ApkVerifier$Builder;,
        Lcom/android/apksig/ApkVerifier$IssueWithParams;
    }
.end annotation


# static fields
.field private static final SUPPORTED_APK_SIG_SCHEME_NAMES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mApkDataSource:Lcom/android/apksig/util/DataSource;

.field private final mApkFile:Ljava/io/File;

.field private final mMaxSdkVersion:I

.field private final mMinSdkVersion:Ljava/lang/Integer;

.field private final mV4SignatureFile:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 89
    invoke-static {}, Lcom/android/apksig/ApkVerifier;->loadSupportedApkSigSchemeNames()Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/android/apksig/ApkVerifier;->SUPPORTED_APK_SIG_SCHEME_NAMES:Ljava/util/Map;

    .line 88
    return-void
.end method

.method private constructor <init>(Ljava/io/File;Lcom/android/apksig/util/DataSource;Ljava/io/File;Ljava/lang/Integer;I)V
    .locals 0
    .param p1, "apkFile"    # Ljava/io/File;
    .param p2, "apkDataSource"    # Lcom/android/apksig/util/DataSource;
    .param p3, "v4SignatureFile"    # Ljava/io/File;
    .param p4, "minSdkVersion"    # Ljava/lang/Integer;
    .param p5, "maxSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "apkFile",
            "apkDataSource",
            "v4SignatureFile",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object p1, p0, Lcom/android/apksig/ApkVerifier;->mApkFile:Ljava/io/File;

    .line 114
    iput-object p2, p0, Lcom/android/apksig/ApkVerifier;->mApkDataSource:Lcom/android/apksig/util/DataSource;

    .line 115
    iput-object p3, p0, Lcom/android/apksig/ApkVerifier;->mV4SignatureFile:Ljava/io/File;

    .line 116
    iput-object p4, p0, Lcom/android/apksig/ApkVerifier;->mMinSdkVersion:Ljava/lang/Integer;

    .line 117
    iput p5, p0, Lcom/android/apksig/ApkVerifier;->mMaxSdkVersion:I

    .line 118
    return-void
.end method

.method synthetic constructor <init>(Ljava/io/File;Lcom/android/apksig/util/DataSource;Ljava/io/File;Ljava/lang/Integer;ILcom/android/apksig/ApkVerifier$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/io/File;
    .param p2, "x1"    # Lcom/android/apksig/util/DataSource;
    .param p3, "x2"    # Ljava/io/File;
    .param p4, "x3"    # Ljava/lang/Integer;
    .param p5, "x4"    # I
    .param p6, "x5"    # Lcom/android/apksig/ApkVerifier$1;

    .line 86
    invoke-direct/range {p0 .. p5}, Lcom/android/apksig/ApkVerifier;-><init>(Ljava/io/File;Lcom/android/apksig/util/DataSource;Ljava/io/File;Ljava/lang/Integer;I)V

    return-void
.end method

.method private static checkV4Certificate(Ljava/util/List;Ljava/util/List;Lcom/android/apksig/ApkVerifier$Result;)V
    .locals 4
    .param p2, "result"    # Lcom/android/apksig/ApkVerifier$Result;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "v4Certs",
            "v2v3Certs",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;",
            "Lcom/android/apksig/ApkVerifier$Result;",
            ")V"
        }
    .end annotation

    .line 957
    .local p0, "v4Certs":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .local p1, "v2v3Certs":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    const/4 v0, 0x0

    :try_start_0
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509Certificate;

    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v1

    .line 958
    .local v1, "v4Cert":[B
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/security/cert/X509Certificate;

    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v2

    .line 959
    .local v2, "cert":[B
    invoke-static {v2, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-nez v3, :cond_0

    .line 960
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_V2_V3_SIGNERS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p2, v3, v0}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 964
    .end local v1    # "v4Cert":[B
    .end local v2    # "cert":[B
    :cond_0
    nop

    .line 965
    return-void

    .line 962
    :catch_0
    move-exception v0

    .line 963
    .local v0, "e":Ljava/security/cert/CertificateEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Failed to encode APK signer cert"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static checkV4Signer(Ljava/util/List;Ljava/util/List;[BLcom/android/apksig/ApkVerifier$Result;)V
    .locals 3
    .param p2, "digestFromV4"    # [B
    .param p3, "result"    # Lcom/android/apksig/ApkVerifier$Result;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "v3Signers",
            "v4Certs",
            "digestFromV4",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;",
            ">;",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;[B",
            "Lcom/android/apksig/ApkVerifier$Result;",
            ")V"
        }
    .end annotation

    .line 940
    .local p0, "v3Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;>;"
    .local p1, "v4Certs":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    .line 941
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_MULTIPLE_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {p3, v0, v1}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 945
    :cond_0
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;

    invoke-static {v0}, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->access$800(Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;)Ljava/util/List;

    move-result-object v0

    invoke-static {p1, v0, p3}, Lcom/android/apksig/ApkVerifier;->checkV4Certificate(Ljava/util/List;Ljava/util/List;Lcom/android/apksig/ApkVerifier$Result;)V

    .line 948
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;

    invoke-virtual {v0}, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->getContentDigests()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/android/apksig/ApkVerifier;->pickBestDigestForV4(Ljava/util/List;)[B

    move-result-object v0

    .line 949
    .local v0, "digestFromV3":[B
    invoke-static {p2, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-nez v1, :cond_1

    .line 950
    sget-object v1, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_V2_V3_DIGESTS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p3, v1, v2}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 952
    :cond_1
    return-void
.end method

.method private static collectApkContentDigests(Ljava/util/List;Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "contentDigests",
            "apkContentDigests"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;",
            ">;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;)V"
        }
    .end annotation

    .line 1018
    .local p0, "contentDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;>;"
    .local p1, "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;

    .line 1019
    .local v1, "contentDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    nop

    .line 1020
    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;->getSignatureAlgorithmId()I

    move-result v2

    invoke-static {v2}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v2

    .line 1021
    .local v2, "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    if-nez v2, :cond_0

    .line 1022
    goto :goto_0

    .line 1024
    :cond_0
    nop

    .line 1025
    invoke-virtual {v2}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getContentDigestAlgorithm()Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    move-result-object v3

    .line 1026
    .local v3, "contentDigestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;->getValue()[B

    move-result-object v4

    invoke-interface {p1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1027
    .end local v1    # "contentDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    .end local v2    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v3    # "contentDigestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    goto :goto_0

    .line 1029
    :cond_1
    return-void
.end method

.method private static varargs createSourceStampResultWithError(Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)Lcom/android/apksig/ApkVerifier$Result;
    .locals 2
    .param p0, "verificationStatus"    # Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;
    .param p1, "issue"    # Lcom/android/apksig/ApkVerifier$Issue;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "verificationStatus",
            "issue",
            "params"
        }
    .end annotation

    .line 861
    new-instance v0, Lcom/android/apksig/ApkVerifier$Result;

    invoke-direct {v0}, Lcom/android/apksig/ApkVerifier$Result;-><init>()V

    .line 862
    .local v0, "result":Lcom/android/apksig/ApkVerifier$Result;
    invoke-virtual {v0, p1, p2}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 863
    invoke-static {p0, v0}, Lcom/android/apksig/ApkVerifier;->mergeSourceStampResult(Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;Lcom/android/apksig/ApkVerifier$Result;)Lcom/android/apksig/ApkVerifier$Result;

    move-result-object v1

    return-object v1
.end method

.method private static getAndroidManifestFromApk(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/nio/ByteBuffer;
    .locals 5
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "zipSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apk",
            "zipSections"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 1034
    nop

    .line 1035
    invoke-static {p0, p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->parseZipCentralDirectory(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/util/List;

    move-result-object v0

    .line 1037
    .local v0, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    nop

    .line 1039
    :try_start_0
    invoke-virtual {p1}, Lcom/android/apksig/apk/ApkUtils$ZipSections;->getZipCentralDirectoryOffset()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    invoke-interface {p0, v3, v4, v1, v2}, Lcom/android/apksig/util/DataSource;->slice(JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v1

    .line 1037
    invoke-static {v0, v1}, Lcom/android/apksig/ApkSigner;->getAndroidManifestFromApk(Ljava/util/List;Lcom/android/apksig/util/DataSource;)Ljava/nio/ByteBuffer;

    move-result-object v1
    :try_end_0
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 1040
    :catch_0
    move-exception v1

    .line 1041
    .local v1, "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v2, Lcom/android/apksig/apk/ApkFormatException;

    const-string v3, "Failed to read AndroidManifest.xml"

    invoke-direct {v2, v3, v1}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static getApkContentDigestFromV1SigningScheme(Ljava/util/List;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/util/Map;
    .locals 6
    .param p1, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p2, "zipSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "cdRecords",
            "apk",
            "zipSections"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/zip/CentralDirectoryRecord;",
            ">;",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/apk/ApkUtils$ZipSections;",
            ")",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 988
    .local p0, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    const/4 v0, 0x0

    .line 989
    .local v0, "manifestCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    new-instance v1, Ljava/util/EnumMap;

    const-class v2, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    invoke-direct {v1, v2}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 991
    .local v1, "v1ContentDigest":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 992
    .local v3, "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    const-string v4, "META-INF/MANIFEST.MF"

    invoke-virtual {v3}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 993
    move-object v0, v3

    .line 994
    goto :goto_1

    .line 996
    .end local v3    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :cond_0
    goto :goto_0

    .line 997
    :cond_1
    :goto_1
    if-nez v0, :cond_2

    .line 1001
    return-object v1

    .line 1004
    :cond_2
    nop

    .line 1006
    :try_start_0
    invoke-virtual {p2}, Lcom/android/apksig/apk/ApkUtils$ZipSections;->getZipCentralDirectoryOffset()J

    move-result-wide v2

    .line 1005
    invoke-static {p1, v0, v2, v3}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)[B

    move-result-object v2

    .line 1007
    .local v2, "manifestBytes":[B
    sget-object v3, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->SHA256:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    .line 1008
    invoke-static {v2}, Lcom/android/apksig/apk/ApkUtils;->computeSha256DigestBytes([B)[B

    move-result-object v4

    .line 1007
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1009
    return-object v1

    .line 1010
    .end local v2    # "manifestBytes":[B
    :catch_0
    move-exception v2

    .line 1011
    .local v2, "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v3, Lcom/android/apksig/apk/ApkFormatException;

    const-string v4, "Failed to read APK"

    invoke-direct {v3, v4, v2}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method private getApkContentDigests(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;Ljava/util/Set;Ljava/util/Map;Ljava/util/Map;II)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .locals 16
    .param p1, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p2, "zipSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .param p6, "apkSigSchemeVersion"    # I
    .param p7, "minSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "apk",
            "zipSections",
            "foundApkSigSchemeIds",
            "supportedSchemeNames",
            "sigSchemeApkContentDigests",
            "apkSigSchemeVersion",
            "minSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/apk/ApkUtils$ZipSections;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;>;II)",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 894
    .local p3, "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .local p4, "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    .local p5, "sigSchemeApkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    move/from16 v1, p6

    const/4 v2, 0x0

    const/4 v0, 0x3

    const/4 v3, 0x2

    if-eq v1, v3, :cond_0

    if-eq v1, v0, :cond_0

    .line 896
    return-object v2

    .line 898
    :cond_0
    new-instance v4, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    invoke-direct {v4, v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;-><init>(I)V

    .line 901
    .local v4, "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    if-ne v1, v0, :cond_1

    .line 902
    const v0, -0xfac9740

    goto :goto_0

    .line 903
    :cond_1
    const v0, 0x7109871a

    :goto_0
    nop

    .line 904
    .local v0, "sigSchemeBlockId":I
    move-object/from16 v12, p1

    move-object/from16 v13, p2

    :try_start_0
    invoke-static {v12, v13, v0, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Lcom/android/apksig/internal/apk/SignatureInfo;

    move-result-object v2
    :try_end_0
    .catch Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v2

    .line 908
    .local v0, "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    nop

    .line 909
    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v14, p3

    invoke-interface {v14, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 911
    new-instance v2, Ljava/util/HashSet;

    const/4 v5, 0x1

    invoke-direct {v2, v5}, Ljava/util/HashSet;-><init>(I)V

    .line 912
    .local v2, "contentDigestsToVerify":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    if-ne v1, v3, :cond_2

    .line 913
    iget-object v5, v0, Lcom/android/apksig/internal/apk/SignatureInfo;->signatureBlock:Ljava/nio/ByteBuffer;

    move-object/from16 v3, p0

    iget v10, v3, Lcom/android/apksig/ApkVerifier;->mMaxSdkVersion:I

    move-object v6, v2

    move-object/from16 v7, p4

    move-object/from16 v8, p3

    move/from16 v9, p7

    move-object v11, v4

    invoke-static/range {v5 .. v11}, Lcom/android/apksig/internal/apk/v2/V2SchemeVerifier;->parseSigners(Ljava/nio/ByteBuffer;Ljava/util/Set;Ljava/util/Map;Ljava/util/Set;IILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V

    goto :goto_1

    .line 917
    :cond_2
    move-object/from16 v3, p0

    iget-object v5, v0, Lcom/android/apksig/internal/apk/SignatureInfo;->signatureBlock:Ljava/nio/ByteBuffer;

    invoke-static {v5, v2, v4}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->parseSigners(Ljava/nio/ByteBuffer;Ljava/util/Set;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V

    .line 920
    :goto_1
    new-instance v5, Ljava/util/EnumMap;

    const-class v6, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    invoke-direct {v5, v6}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 922
    .local v5, "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    iget-object v6, v4, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    .line 924
    .local v7, "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    iget-object v8, v7, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->contentDigests:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_3
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;

    .line 925
    .local v9, "contentDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    nop

    .line 926
    invoke-virtual {v9}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;->getSignatureAlgorithmId()I

    move-result v10

    .line 925
    invoke-static {v10}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v10

    .line 927
    .local v10, "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    if-nez v10, :cond_3

    .line 928
    goto :goto_3

    .line 930
    :cond_3
    invoke-virtual {v10}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getContentDigestAlgorithm()Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    move-result-object v11

    .line 931
    invoke-virtual {v9}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;->getValue()[B

    move-result-object v15

    .line 930
    invoke-interface {v5, v11, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 932
    .end local v9    # "contentDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    .end local v10    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    goto :goto_3

    .line 933
    .end local v7    # "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    :cond_4
    goto :goto_2

    .line 934
    :cond_5
    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move-object/from16 v7, p5

    invoke-interface {v7, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 935
    return-object v4

    .line 906
    .end local v0    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    .end local v2    # "contentDigestsToVerify":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    .end local v5    # "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    :catch_0
    move-exception v0

    move-object/from16 v3, p0

    move-object/from16 v14, p3

    move-object/from16 v7, p5

    move-object v5, v0

    move-object v0, v5

    .line 907
    .local v0, "e":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;
    return-object v2
.end method

.method private static getApkContentDigestsFromSigningSchemeResult(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Ljava/util/Map;
    .locals 4
    .param p0, "apkSigningSchemeResult"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apkSigningSchemeResult"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;",
            ")",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;"
        }
    .end annotation

    .line 976
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 977
    .local v0, "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    iget-object v1, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    .line 978
    .local v2, "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    iget-object v3, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->contentDigests:Ljava/util/List;

    invoke-static {v3, v0}, Lcom/android/apksig/ApkVerifier;->collectApkContentDigests(Ljava/util/List;Ljava/util/Map;)V

    .line 979
    .end local v2    # "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    goto :goto_0

    .line 980
    :cond_0
    return-object v0
.end method

.method private static getMinimumSignatureSchemeVersionForTargetSdk(I)I
    .locals 1
    .param p0, "targetSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "targetSdkVersion"
        }
    .end annotation

    .line 1046
    const/16 v0, 0x1e

    if-lt p0, v0, :cond_0

    .line 1047
    const/4 v0, 0x2

    return v0

    .line 1049
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method private static getSupportedSchemeNames(I)Ljava/util/Map;
    .locals 4
    .param p0, "maxSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 645
    const/16 v0, 0x1c

    if-lt p0, v0, :cond_0

    .line 646
    sget-object v0, Lcom/android/apksig/ApkVerifier;->SUPPORTED_APK_SIG_SCHEME_NAMES:Ljava/util/Map;

    .local v0, "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    goto :goto_0

    .line 647
    .end local v0    # "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    :cond_0
    const/16 v0, 0x18

    if-lt p0, v0, :cond_1

    .line 648
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 649
    .restart local v0    # "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    sget-object v3, Lcom/android/apksig/ApkVerifier;->SUPPORTED_APK_SIG_SCHEME_NAMES:Ljava/util/Map;

    .line 651
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 650
    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 649
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 653
    .end local v0    # "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    .line 655
    .restart local v0    # "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    :goto_0
    return-object v0
.end method

.method static synthetic lambda$verify$0(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;)I
    .locals 1
    .param p0, "signer"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    .line 223
    iget v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->minSdkVersion:I

    return v0
.end method

.method private static loadSupportedApkSigSchemeNames()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 92
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 93
    .local v0, "supportedMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    nop

    .line 94
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 93
    const-string v2, "APK Signature Scheme v2"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    nop

    .line 96
    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 95
    const-string v2, "APK Signature Scheme v3"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    return-object v0
.end method

.method private static mergeSourceStampResult(Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;Lcom/android/apksig/ApkVerifier$Result;)Lcom/android/apksig/ApkVerifier$Result;
    .locals 1
    .param p0, "verificationStatus"    # Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;
    .param p1, "result"    # Lcom/android/apksig/ApkVerifier$Result;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "verificationStatus",
            "result"
        }
    .end annotation

    .line 873
    new-instance v0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;

    invoke-direct {v0, p0}, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;-><init>(Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;)V

    invoke-static {p1, v0}, Lcom/android/apksig/ApkVerifier$Result;->access$1202(Lcom/android/apksig/ApkVerifier$Result;Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;)Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;

    .line 874
    return-object p1
.end method

.method private static pickBestDigestForV4(Ljava/util/List;)[B
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "contentDigests"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;",
            ">;)[B"
        }
    .end annotation

    .line 969
    .local p0, "contentDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 970
    .local v0, "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    invoke-static {p0, v0}, Lcom/android/apksig/ApkVerifier;->collectApkContentDigests(Ljava/util/List;Ljava/util/Map;)V

    .line 971
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->pickBestDigestForV4(Ljava/util/Map;)[B

    move-result-object v1

    return-object v1
.end method

.method private verify(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/ApkVerifier$Result;
    .locals 23
    .param p1, "apk"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apk"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 174
    move-object/from16 v1, p0

    move-object/from16 v9, p1

    iget v10, v1, Lcom/android/apksig/ApkVerifier;->mMaxSdkVersion:I

    .line 178
    .local v10, "maxSdkVersion":I
    :try_start_0
    invoke-static/range {p1 .. p1}, Lcom/android/apksig/apk/ApkUtils;->findZipSections(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/apk/ApkUtils$ZipSections;

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_11

    move-object v11, v0

    .line 181
    .local v11, "zipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    nop

    .line 183
    const/4 v12, 0x0

    .line 185
    .local v12, "androidManifest":Ljava/nio/ByteBuffer;
    invoke-direct {v1, v9, v11}, Lcom/android/apksig/ApkVerifier;->verifyAndGetMinSdkVersion(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)I

    move-result v13

    .line 187
    .local v13, "minSdkVersion":I
    new-instance v0, Lcom/android/apksig/ApkVerifier$Result;

    invoke-direct {v0}, Lcom/android/apksig/ApkVerifier$Result;-><init>()V

    move-object v14, v0

    .line 188
    .local v14, "result":Lcom/android/apksig/ApkVerifier$Result;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v15, v0

    .line 200
    .local v15, "signatureSchemeApkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    invoke-static {v10}, Lcom/android/apksig/ApkVerifier;->getSupportedSchemeNames(I)Ljava/util/Map;

    move-result-object v16

    .line 205
    .local v16, "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    new-instance v0, Ljava/util/HashSet;

    const/4 v8, 0x2

    invoke-direct {v0, v8}, Ljava/util/HashSet;-><init>(I)V

    move-object v7, v0

    .line 206
    .local v7, "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    const/16 v6, 0x18

    const/4 v5, 0x0

    if-lt v10, v6, :cond_9

    .line 207
    sget-object v4, Lcom/android/apksig/util/RunnablesExecutor;->SINGLE_THREADED:Lcom/android/apksig/util/RunnablesExecutor;

    .line 211
    .local v4, "executor":Lcom/android/apksig/util/RunnablesExecutor;
    const/4 v2, 0x0

    .line 212
    .local v2, "rotationMinSdkVersion":I
    const/16 v3, 0x1f

    const/16 v8, 0x21

    if-lt v10, v8, :cond_1

    .line 214
    :try_start_1
    new-instance v0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;

    .line 215
    invoke-static {v13, v8}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-direct {v0, v9, v11, v6, v10}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;-><init>(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;II)V

    .line 217
    invoke-virtual {v0, v4}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->setRunnablesExecutor(Lcom/android/apksig/util/RunnablesExecutor;)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;

    move-result-object v0

    .line 218
    const v6, 0x1b93ad61

    invoke-virtual {v0, v6}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->setBlockId(I)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;

    move-result-object v0

    .line 219
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->build()Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;

    move-result-object v0

    .line 220
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->verify()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    move-result-object v0

    .line 221
    .local v0, "v31Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v7, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 222
    iget-object v6, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v6

    new-instance v8, Lcom/android/apksig/ApkVerifier$$ExternalSyntheticLambda0;

    invoke-direct {v8}, Lcom/android/apksig/ApkVerifier$$ExternalSyntheticLambda0;-><init>()V

    invoke-interface {v6, v8}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    move-result-object v6

    .line 223
    invoke-interface {v6}, Ljava/util/stream/IntStream;->min()Ljava/util/OptionalInt;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/util/OptionalInt;->orElse(I)I

    move-result v6

    move v2, v6

    .line 224
    invoke-static {v14, v0}, Lcom/android/apksig/ApkVerifier$Result;->access$000(Lcom/android/apksig/ApkVerifier$Result;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V

    .line 225
    nop

    .line 226
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 227
    invoke-static {v0}, Lcom/android/apksig/ApkVerifier;->getApkContentDigestsFromSigningSchemeResult(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Ljava/util/Map;

    move-result-object v8

    .line 225
    invoke-interface {v15, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 230
    nop

    .end local v0    # "v31Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    goto :goto_0

    .line 228
    :catch_0
    move-exception v0

    .line 231
    :goto_0
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->containsErrors()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 232
    return-object v14

    .line 231
    :cond_0
    move v8, v2

    goto :goto_1

    .line 212
    :cond_1
    move v8, v2

    .line 236
    .end local v2    # "rotationMinSdkVersion":I
    .local v8, "rotationMinSdkVersion":I
    :goto_1
    const/16 v2, 0x1c

    const/16 v6, 0x21

    if-lt v13, v6, :cond_2

    invoke-interface {v7}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 238
    :cond_2
    :try_start_2
    new-instance v0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;

    .line 239
    invoke-static {v13, v2}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-direct {v0, v9, v11, v6, v10}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;-><init>(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;II)V

    .line 241
    invoke-virtual {v0, v4}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->setRunnablesExecutor(Lcom/android/apksig/util/RunnablesExecutor;)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;

    move-result-object v0

    .line 242
    const v6, -0xfac9740

    invoke-virtual {v0, v6}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->setBlockId(I)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;

    move-result-object v0

    .line 243
    .local v0, "builder":Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;
    if-lez v8, :cond_3

    .line 244
    invoke-virtual {v0, v8}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->setRotationMinSdkVersion(I)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;

    .line 246
    :cond_3
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->build()Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->verify()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    move-result-object v6

    .line 247
    .local v6, "v3Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    const/16 v19, 0x3

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v7, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 248
    invoke-static {v14, v6}, Lcom/android/apksig/ApkVerifier$Result;->access$000(Lcom/android/apksig/ApkVerifier$Result;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V

    .line 249
    nop

    .line 250
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 251
    invoke-static {v6}, Lcom/android/apksig/ApkVerifier;->getApkContentDigestsFromSigningSchemeResult(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Ljava/util/Map;

    move-result-object v5

    .line 249
    invoke-interface {v15, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException; {:try_start_2 .. :try_end_2} :catch_1

    .line 260
    const/4 v5, 0x0

    .end local v0    # "builder":Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;
    .end local v6    # "v3Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    goto :goto_2

    .line 252
    :catch_1
    move-exception v0

    .line 256
    .local v0, "ignored":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;
    nop

    .line 257
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 256
    invoke-interface {v7, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 258
    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->V31_BLOCK_FOUND_WITHOUT_V3_BLOCK:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v5, 0x0

    new-array v3, v5, [Ljava/lang/Object;

    invoke-virtual {v14, v2, v3}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    goto :goto_2

    .line 256
    :cond_4
    const/4 v5, 0x0

    .line 261
    .end local v0    # "ignored":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;
    :goto_2
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->containsErrors()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 262
    return-object v14

    .line 270
    :cond_5
    const/16 v2, 0x1c

    if-lt v13, v2, :cond_7

    invoke-interface {v7}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_3

    :cond_6
    move-object/from16 v18, v4

    move/from16 v20, v8

    move/from16 v19, v13

    const/16 v17, 0x2

    move-object v13, v7

    goto :goto_5

    .line 272
    :cond_7
    :goto_3
    nop

    .line 279
    const/16 v6, 0x18

    :try_start_3
    invoke-static {v13, v6}, Ljava/lang/Math;->max(II)I

    move-result v0
    :try_end_3
    .catch Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException; {:try_start_3 .. :try_end_3} :catch_3

    .line 273
    move-object v2, v4

    move-object/from16 v3, p1

    move-object/from16 v18, v4

    .end local v4    # "executor":Lcom/android/apksig/util/RunnablesExecutor;
    .local v18, "executor":Lcom/android/apksig/util/RunnablesExecutor;
    move-object v4, v11

    move-object/from16 v5, v16

    move-object v6, v7

    move/from16 v19, v13

    move-object v13, v7

    .end local v7    # "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .local v13, "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .local v19, "minSdkVersion":I
    move v7, v0

    move/from16 v20, v8

    const/16 v17, 0x2

    .end local v8    # "rotationMinSdkVersion":I
    .local v20, "rotationMinSdkVersion":I
    move v8, v10

    :try_start_4
    invoke-static/range {v2 .. v8}, Lcom/android/apksig/internal/apk/v2/V2SchemeVerifier;->verify(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;Ljava/util/Map;Ljava/util/Set;II)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    move-result-object v0

    .line 281
    .local v0, "v2Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v13, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 282
    invoke-static {v14, v0}, Lcom/android/apksig/ApkVerifier$Result;->access$000(Lcom/android/apksig/ApkVerifier$Result;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V

    .line 283
    nop

    .line 284
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 285
    invoke-static {v0}, Lcom/android/apksig/ApkVerifier;->getApkContentDigestsFromSigningSchemeResult(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Ljava/util/Map;

    move-result-object v3

    .line 283
    invoke-interface {v15, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException; {:try_start_4 .. :try_end_4} :catch_2

    .line 288
    nop

    .end local v0    # "v2Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    goto :goto_4

    .line 286
    :catch_2
    move-exception v0

    goto :goto_4

    .end local v18    # "executor":Lcom/android/apksig/util/RunnablesExecutor;
    .end local v19    # "minSdkVersion":I
    .end local v20    # "rotationMinSdkVersion":I
    .restart local v4    # "executor":Lcom/android/apksig/util/RunnablesExecutor;
    .restart local v7    # "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .restart local v8    # "rotationMinSdkVersion":I
    .local v13, "minSdkVersion":I
    :catch_3
    move-exception v0

    move-object/from16 v18, v4

    move/from16 v20, v8

    move/from16 v19, v13

    const/16 v17, 0x2

    move-object v13, v7

    .line 289
    .end local v4    # "executor":Lcom/android/apksig/util/RunnablesExecutor;
    .end local v7    # "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v8    # "rotationMinSdkVersion":I
    .local v13, "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .restart local v18    # "executor":Lcom/android/apksig/util/RunnablesExecutor;
    .restart local v19    # "minSdkVersion":I
    .restart local v20    # "rotationMinSdkVersion":I
    :goto_4
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->containsErrors()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 290
    return-object v14

    .line 295
    :cond_8
    :goto_5
    iget-object v0, v1, Lcom/android/apksig/ApkVerifier;->mV4SignatureFile:Ljava/io/File;

    if-eqz v0, :cond_a

    .line 296
    nop

    .line 297
    invoke-static {v9, v0}, Lcom/android/apksig/internal/apk/v4/V4SchemeVerifier;->verify(Lcom/android/apksig/util/DataSource;Ljava/io/File;)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    move-result-object v0

    .line 298
    .local v0, "v4Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    nop

    .line 299
    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 298
    invoke-interface {v13, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 300
    invoke-static {v14, v0}, Lcom/android/apksig/ApkVerifier$Result;->access$000(Lcom/android/apksig/ApkVerifier$Result;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V

    .line 301
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->containsErrors()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 302
    return-object v14

    .line 206
    .end local v0    # "v4Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .end local v18    # "executor":Lcom/android/apksig/util/RunnablesExecutor;
    .end local v19    # "minSdkVersion":I
    .end local v20    # "rotationMinSdkVersion":I
    .restart local v7    # "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .local v13, "minSdkVersion":I
    :cond_9
    move/from16 v17, v8

    move/from16 v19, v13

    move-object v13, v7

    .line 309
    .end local v7    # "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .local v13, "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .restart local v19    # "minSdkVersion":I
    :cond_a
    const/16 v0, 0x1a

    const/4 v8, 0x1

    if-lt v10, v0, :cond_c

    .line 310
    if-nez v12, :cond_b

    .line 311
    invoke-static {v9, v11}, Lcom/android/apksig/ApkVerifier;->getAndroidManifestFromApk(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/nio/ByteBuffer;

    move-result-object v12

    .line 313
    :cond_b
    nop

    .line 314
    invoke-virtual {v12}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {v0}, Lcom/android/apksig/apk/ApkUtils;->getTargetSandboxVersionFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 315
    .local v0, "targetSandboxVersion":I
    if-le v0, v8, :cond_c

    .line 316
    invoke-interface {v13}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 317
    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->NO_SIG_FOR_TARGET_SANDBOX_VERSION:Lcom/android/apksig/ApkVerifier$Issue;

    .line 319
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 317
    invoke-virtual {v14, v2, v3}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 324
    .end local v0    # "targetSandboxVersion":I
    :cond_c
    nop

    .line 325
    invoke-static {v9, v11}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->parseZipCentralDirectory(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/util/List;

    move-result-object v7

    .line 331
    .local v7, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    move/from16 v6, v19

    const/16 v2, 0x18

    .end local v19    # "minSdkVersion":I
    .local v6, "minSdkVersion":I
    if-lt v6, v2, :cond_e

    invoke-interface {v13}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_6

    :cond_d
    move/from16 v19, v6

    goto :goto_7

    .line 332
    :cond_e
    :goto_6
    nop

    .line 333
    move-object/from16 v2, p1

    move-object v3, v11

    move-object/from16 v4, v16

    move-object v5, v13

    move/from16 v19, v6

    .end local v6    # "minSdkVersion":I
    .restart local v19    # "minSdkVersion":I
    move-object/from16 v22, v7

    .end local v7    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .local v22, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    move v7, v10

    invoke-static/range {v2 .. v7}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->verify(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;Ljava/util/Map;Ljava/util/Set;II)Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;

    move-result-object v0

    .line 340
    .local v0, "v1Result":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;
    invoke-static {v14, v0}, Lcom/android/apksig/ApkVerifier$Result;->access$100(Lcom/android/apksig/ApkVerifier$Result;Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)V

    .line 341
    nop

    .line 342
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 343
    move-object/from16 v7, v22

    .end local v22    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v7    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    invoke-static {v7, v9, v11}, Lcom/android/apksig/ApkVerifier;->getApkContentDigestFromV1SigningScheme(Ljava/util/List;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/util/Map;

    move-result-object v3

    .line 341
    invoke-interface {v15, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    .end local v0    # "v1Result":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;
    :goto_7
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->containsErrors()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 346
    return-object v14

    .line 351
    :cond_f
    const/4 v0, 0x0

    .line 352
    .local v0, "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :try_start_5
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3
    :try_end_5
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_5 .. :try_end_5} :catch_b
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_5 .. :try_end_5} :catch_a

    if-eqz v3, :cond_11

    :try_start_6
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 353
    .local v3, "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    const-string v4, "stamp-cert-sha256"

    .line 354
    invoke-virtual {v3}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v5

    .line 353
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4
    :try_end_6
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_6 .. :try_end_6} :catch_5
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_6 .. :try_end_6} :catch_4

    if-eqz v4, :cond_10

    .line 355
    move-object v0, v3

    .line 356
    goto :goto_9

    .line 358
    .end local v3    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :cond_10
    goto :goto_8

    .line 379
    .end local v0    # "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :catch_4
    move-exception v0

    move-object/from16 v18, v7

    goto :goto_b

    .line 377
    :catch_5
    move-exception v0

    move-object/from16 v18, v7

    goto :goto_c

    .line 361
    .restart local v0    # "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :cond_11
    :goto_9
    if-eqz v0, :cond_12

    .line 362
    nop

    .line 366
    :try_start_7
    invoke-virtual {v11}, Lcom/android/apksig/apk/ApkUtils$ZipSections;->getZipCentralDirectoryOffset()J

    move-result-wide v2

    .line 363
    invoke-static {v9, v0, v2, v3}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)[B

    move-result-object v4
    :try_end_7
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_7 .. :try_end_7} :catch_b
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_7 .. :try_end_7} :catch_a

    .line 367
    .local v4, "sourceStampCertificateDigest":[B
    nop

    .line 373
    const/16 v2, 0x1e

    move/from16 v6, v19

    .end local v19    # "minSdkVersion":I
    .restart local v6    # "minSdkVersion":I
    :try_start_8
    invoke-static {v6, v2}, Ljava/lang/Math;->max(II)I

    move-result v18
    :try_end_8
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_8 .. :try_end_8} :catch_9
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_8 .. :try_end_8} :catch_8

    .line 368
    move-object/from16 v2, p1

    move-object v3, v11

    move-object v5, v15

    move/from16 v19, v6

    .end local v6    # "minSdkVersion":I
    .restart local v19    # "minSdkVersion":I
    move/from16 v6, v18

    move-object/from16 v18, v7

    .end local v7    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .local v18, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    move v7, v10

    :try_start_9
    invoke-static/range {v2 .. v7}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampVerifier;->verify(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/zip/ZipSections;[BLjava/util/Map;II)Lcom/android/apksig/internal/apk/ApkSigResult;

    move-result-object v2

    .line 375
    .local v2, "sourceStampResult":Lcom/android/apksig/internal/apk/ApkSigResult;
    invoke-static {v14, v2}, Lcom/android/apksig/ApkVerifier$Result;->access$200(Lcom/android/apksig/ApkVerifier$Result;Lcom/android/apksig/internal/apk/ApkSigResult;)V
    :try_end_9
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_9 .. :try_end_9} :catch_7
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_9 .. :try_end_9} :catch_6

    goto :goto_a

    .line 379
    .end local v0    # "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v2    # "sourceStampResult":Lcom/android/apksig/internal/apk/ApkSigResult;
    .end local v4    # "sourceStampCertificateDigest":[B
    :catch_6
    move-exception v0

    goto :goto_b

    .line 377
    :catch_7
    move-exception v0

    goto :goto_c

    .line 379
    .end local v18    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v19    # "minSdkVersion":I
    .restart local v6    # "minSdkVersion":I
    .restart local v7    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    :catch_8
    move-exception v0

    move/from16 v19, v6

    move-object/from16 v18, v7

    .end local v6    # "minSdkVersion":I
    .end local v7    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v18    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v19    # "minSdkVersion":I
    goto :goto_b

    .line 377
    .end local v18    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v19    # "minSdkVersion":I
    .restart local v6    # "minSdkVersion":I
    .restart local v7    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    :catch_9
    move-exception v0

    move/from16 v19, v6

    move-object/from16 v18, v7

    .end local v6    # "minSdkVersion":I
    .end local v7    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v18    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v19    # "minSdkVersion":I
    goto :goto_c

    .line 361
    .end local v18    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v0    # "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v7    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    :cond_12
    move-object/from16 v18, v7

    .line 381
    .end local v0    # "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v7    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v18    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    :goto_a
    const/4 v3, 0x0

    goto :goto_d

    .line 379
    .end local v18    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v7    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    :catch_a
    move-exception v0

    move-object/from16 v18, v7

    .line 380
    .end local v7    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .local v0, "e":Lcom/android/apksig/zip/ZipFormatException;
    .restart local v18    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    :goto_b
    new-instance v2, Lcom/android/apksig/apk/ApkFormatException;

    const-string v3, "Failed to read APK"

    invoke-direct {v2, v3, v0}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 377
    .end local v0    # "e":Lcom/android/apksig/zip/ZipFormatException;
    .end local v18    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v7    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    :catch_b
    move-exception v0

    move-object/from16 v18, v7

    .line 378
    .end local v7    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .local v0, "ignored":Lcom/android/apksig/internal/apk/SignatureNotFoundException;
    .restart local v18    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    :goto_c
    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_SIG_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Object;

    invoke-virtual {v14, v2, v4}, Lcom/android/apksig/ApkVerifier$Result;->addWarning(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 381
    .end local v0    # "ignored":Lcom/android/apksig/internal/apk/SignatureNotFoundException;
    nop

    .line 382
    :goto_d
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->containsErrors()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 383
    return-object v14

    .line 388
    :cond_13
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV1Scheme()Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV2Scheme()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 389
    new-instance v0, Ljava/util/ArrayList;

    .line 390
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->getV1SchemeSigners()Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v2, v0

    .line 391
    .local v2, "v1Signers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;>;"
    new-instance v0, Ljava/util/ArrayList;

    .line 392
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->getV2SchemeSigners()Ljava/util/List;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v4, v0

    .line 393
    .local v4, "v2Signers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v5, v0

    .line 394
    .local v5, "v1SignerCerts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/apksig/ApkVerifier$ByteArray;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v6, v0

    .line 395
    .local v6, "v2SignerCerts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/apksig/ApkVerifier$ByteArray;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;

    .line 397
    .local v7, "signer":Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;
    :try_start_a
    new-instance v3, Lcom/android/apksig/ApkVerifier$ByteArray;

    invoke-virtual {v7}, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->getCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v8

    move-object/from16 v21, v0

    const/4 v0, 0x0

    invoke-direct {v3, v8, v0}, Lcom/android/apksig/ApkVerifier$ByteArray;-><init>([BLcom/android/apksig/ApkVerifier$1;)V

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_a
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_a .. :try_end_a} :catch_c

    .line 401
    nop

    .line 402
    .end local v7    # "signer":Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;
    move-object/from16 v0, v21

    const/4 v3, 0x0

    const/4 v8, 0x1

    goto :goto_e

    .line 398
    .restart local v7    # "signer":Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;
    :catch_c
    move-exception v0

    .line 399
    .local v0, "e":Ljava/security/cert/CertificateEncodingException;
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to encode JAR signer "

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 400
    invoke-virtual {v7}, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v8, " certs"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 403
    .end local v0    # "e":Ljava/security/cert/CertificateEncodingException;
    .end local v7    # "signer":Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;
    :cond_14
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_15

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;

    .line 405
    .local v1, "signer":Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;
    :try_start_b
    new-instance v3, Lcom/android/apksig/ApkVerifier$ByteArray;

    invoke-virtual {v1}, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->getCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v7

    invoke-virtual {v7}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v7

    const/4 v8, 0x0

    invoke-direct {v3, v7, v8}, Lcom/android/apksig/ApkVerifier$ByteArray;-><init>([BLcom/android/apksig/ApkVerifier$1;)V

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_b
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_b .. :try_end_b} :catch_d

    .line 411
    nop

    .line 412
    .end local v1    # "signer":Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;
    goto :goto_f

    .line 406
    .restart local v1    # "signer":Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;
    :catch_d
    move-exception v0

    .line 407
    .restart local v0    # "e":Ljava/security/cert/CertificateEncodingException;
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to encode APK Signature Scheme v2 signer (index: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 409
    invoke-virtual {v1}, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->getIndex()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ") certs"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 414
    .end local v0    # "e":Ljava/security/cert/CertificateEncodingException;
    .end local v1    # "signer":Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;
    :cond_15
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_17

    .line 415
    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/ApkVerifier$ByteArray;

    .line 416
    .local v1, "v1Cert":Lcom/android/apksig/ApkVerifier$ByteArray;
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_16

    .line 417
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;

    .line 418
    .local v3, "v1Signer":Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;
    sget-object v7, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    move-object/from16 v21, v1

    const/4 v8, 0x0

    .end local v1    # "v1Cert":Lcom/android/apksig/ApkVerifier$ByteArray;
    .local v21, "v1Cert":Lcom/android/apksig/ApkVerifier$ByteArray;
    new-array v1, v8, [Ljava/lang/Object;

    invoke-static {v3, v7, v1}, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->access$400(Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 419
    goto :goto_11

    .line 416
    .end local v3    # "v1Signer":Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;
    .end local v21    # "v1Cert":Lcom/android/apksig/ApkVerifier$ByteArray;
    .restart local v1    # "v1Cert":Lcom/android/apksig/ApkVerifier$ByteArray;
    :cond_16
    move-object/from16 v21, v1

    .line 414
    .end local v1    # "v1Cert":Lcom/android/apksig/ApkVerifier$ByteArray;
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 422
    .end local v0    # "i":I
    :cond_17
    :goto_11
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_12
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_19

    .line 423
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/ApkVerifier$ByteArray;

    .line 424
    .local v1, "v2Cert":Lcom/android/apksig/ApkVerifier$ByteArray;
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_18

    .line 425
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;

    .line 426
    .local v3, "v2Signer":Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;
    sget-object v7, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    move-object/from16 v21, v1

    const/4 v8, 0x0

    .end local v1    # "v2Cert":Lcom/android/apksig/ApkVerifier$ByteArray;
    .local v21, "v2Cert":Lcom/android/apksig/ApkVerifier$ByteArray;
    new-array v1, v8, [Ljava/lang/Object;

    invoke-static {v3, v7, v1}, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->access$500(Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 427
    goto :goto_13

    .line 424
    .end local v3    # "v2Signer":Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;
    .end local v21    # "v2Cert":Lcom/android/apksig/ApkVerifier$ByteArray;
    .restart local v1    # "v2Cert":Lcom/android/apksig/ApkVerifier$ByteArray;
    :cond_18
    move-object/from16 v21, v1

    .line 422
    .end local v1    # "v2Cert":Lcom/android/apksig/ApkVerifier$ByteArray;
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 435
    .end local v0    # "i":I
    .end local v2    # "v1Signers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;>;"
    .end local v4    # "v2Signers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;>;"
    .end local v5    # "v1SignerCerts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/apksig/ApkVerifier$ByteArray;>;"
    .end local v6    # "v2SignerCerts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/apksig/ApkVerifier$ByteArray;>;"
    :cond_19
    :goto_13
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV3Scheme()Z

    move-result v0

    if-eqz v0, :cond_22

    .line 436
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV1Scheme()Z

    move-result v0

    if-nez v0, :cond_1a

    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV2Scheme()Z

    move-result v0

    if-eqz v0, :cond_22

    .line 437
    :cond_1a
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->getSigningCertificateLineage()Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v1

    .line 439
    .local v1, "lineage":Lcom/android/apksig/SigningCertificateLineage;
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV1Scheme()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 440
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->getV1SchemeSigners()Ljava/util/List;

    move-result-object v0

    .line 441
    .local v0, "v1Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_1b

    .line 444
    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MULTIPLE_PAST_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Object;

    invoke-virtual {v14, v2, v4}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    goto :goto_14

    .line 441
    :cond_1b
    const/4 v3, 0x0

    .line 446
    :goto_14
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;

    invoke-static {v2}, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->access$600(Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Ljava/security/cert/X509Certificate;

    .line 447
    .local v0, "oldSignerCert":Ljava/security/cert/X509Certificate;
    move-object v2, v0

    goto :goto_15

    .line 448
    .end local v0    # "oldSignerCert":Ljava/security/cert/X509Certificate;
    :cond_1c
    const/4 v3, 0x0

    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->getV2SchemeSigners()Ljava/util/List;

    move-result-object v0

    .line 449
    .local v0, "v2Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    const/4 v4, 0x1

    if-eq v2, v4, :cond_1d

    .line 452
    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MULTIPLE_PAST_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v4, v3, [Ljava/lang/Object;

    invoke-virtual {v14, v2, v4}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 454
    :cond_1d
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;

    invoke-static {v2}, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->access$700(Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/security/cert/X509Certificate;

    .line 456
    .end local v0    # "v2Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;>;"
    .local v2, "oldSignerCert":Ljava/security/cert/X509Certificate;
    :goto_15
    if-nez v1, :cond_20

    .line 459
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->getV3SchemeSigners()Ljava/util/List;

    move-result-object v3

    .line 460
    .local v3, "v3Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    const/4 v4, 0x1

    if-eq v0, v4, :cond_1e

    .line 463
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MULTIPLE_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Object;

    invoke-virtual {v14, v0, v5}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    goto :goto_16

    .line 460
    :cond_1e
    const/4 v4, 0x0

    .line 466
    :goto_16
    :try_start_c
    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v0

    .line 467
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;

    invoke-static {v5}, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->access$800(Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/security/cert/X509Certificate;

    invoke-virtual {v5}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v4

    .line 466
    invoke-static {v0, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_1f

    .line 468
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_PAST_SIGNERS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Object;

    invoke-virtual {v14, v0, v5}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V
    :try_end_c
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_c .. :try_end_c} :catch_e

    .line 474
    :cond_1f
    nop

    .line 475
    .end local v3    # "v3Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;>;"
    goto :goto_17

    .line 470
    .restart local v3    # "v3Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;>;"
    :catch_e
    move-exception v0

    .line 472
    .local v0, "e":Ljava/security/cert/CertificateEncodingException;
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "Failed to encode APK Signature Scheme v3 signer cert"

    invoke-direct {v4, v5, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 479
    .end local v0    # "e":Ljava/security/cert/CertificateEncodingException;
    .end local v3    # "v3Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;>;"
    :cond_20
    :try_start_d
    invoke-virtual {v1, v2}, Lcom/android/apksig/SigningCertificateLineage;->getSubLineage(Ljava/security/cert/X509Certificate;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v0

    move-object v1, v0

    .line 480
    invoke-virtual {v1}, Lcom/android/apksig/SigningCertificateLineage;->size()I

    move-result v0

    const/4 v3, 0x1

    if-eq v0, v3, :cond_21

    .line 482
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_PAST_SIGNERS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Object;

    invoke-virtual {v14, v0, v4}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V
    :try_end_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_d .. :try_end_d} :catch_f

    .line 487
    :cond_21
    goto :goto_17

    .line 484
    :catch_f
    move-exception v0

    .line 486
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_PAST_SIGNERS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Object;

    invoke-virtual {v14, v3, v5}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 494
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .end local v1    # "lineage":Lcom/android/apksig/SigningCertificateLineage;
    .end local v2    # "oldSignerCert":Ljava/security/cert/X509Certificate;
    :cond_22
    :goto_17
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV4Scheme()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 495
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->getV4SchemeSigners()Ljava/util/List;

    move-result-object v0

    .line 497
    .local v0, "v4Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;>;"
    nop

    .line 498
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;

    invoke-virtual {v2}, Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;->getContentDigests()Ljava/util/List;

    move-result-object v2

    .line 499
    .local v2, "digestsFromV4":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_23

    .line 500
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_V2_V3_DIGESTS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v4, v1, [Ljava/lang/Object;

    invoke-virtual {v14, v3, v4}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 502
    :cond_23
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;

    invoke-virtual {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;->getValue()[B

    move-result-object v1

    .line 504
    .local v1, "digestFromV4":[B
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV3Scheme()Z

    move-result v3

    if-eqz v3, :cond_27

    .line 505
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV31Scheme()Z

    move-result v3

    if-eqz v3, :cond_24

    move/from16 v8, v17

    goto :goto_18

    :cond_24
    const/4 v8, 0x1

    :goto_18
    move v3, v8

    .line 506
    .local v3, "expectedSize":I
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-eq v4, v3, :cond_25

    .line 507
    sget-object v4, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_MULTIPLE_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v5, 0x0

    new-array v6, v5, [Ljava/lang/Object;

    invoke-virtual {v14, v4, v6}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    goto :goto_19

    .line 506
    :cond_25
    const/4 v5, 0x0

    .line 510
    :goto_19
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->getV3SchemeSigners()Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;

    invoke-static {v5}, Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;->access$900(Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;)Ljava/util/List;

    move-result-object v5

    invoke-static {v4, v5, v1, v14}, Lcom/android/apksig/ApkVerifier;->checkV4Signer(Ljava/util/List;Ljava/util/List;[BLcom/android/apksig/ApkVerifier$Result;)V

    .line 512
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV31Scheme()Z

    move-result v4

    if-eqz v4, :cond_26

    .line 513
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->getV31SchemeSigners()Ljava/util/List;

    move-result-object v4

    const/4 v5, 0x1

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;

    invoke-static {v6}, Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;->access$900(Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;)Ljava/util/List;

    move-result-object v5

    invoke-static {v4, v5, v1, v14}, Lcom/android/apksig/ApkVerifier;->checkV4Signer(Ljava/util/List;Ljava/util/List;[BLcom/android/apksig/ApkVerifier$Result;)V

    .line 516
    .end local v3    # "expectedSize":I
    :cond_26
    goto :goto_1b

    :cond_27
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV2Scheme()Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 517
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_28

    .line 518
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_MULTIPLE_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v4, 0x0

    new-array v5, v4, [Ljava/lang/Object;

    invoke-virtual {v14, v3, v5}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 521
    :cond_28
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->getV2SchemeSigners()Ljava/util/List;

    move-result-object v3

    .line 522
    .local v3, "v2Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_29

    .line 523
    sget-object v4, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_MULTIPLE_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v5, 0x0

    new-array v6, v5, [Ljava/lang/Object;

    invoke-virtual {v14, v4, v6}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    goto :goto_1a

    .line 522
    :cond_29
    const/4 v5, 0x0

    .line 527
    :goto_1a
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;

    invoke-static {v4}, Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;->access$900(Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;

    invoke-static {v6}, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->access$700(Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;)Ljava/util/List;

    move-result-object v6

    invoke-static {v4, v6, v14}, Lcom/android/apksig/ApkVerifier;->checkV4Certificate(Ljava/util/List;Ljava/util/List;Lcom/android/apksig/ApkVerifier$Result;)V

    .line 530
    nop

    .line 531
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;

    invoke-virtual {v4}, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->getContentDigests()Ljava/util/List;

    move-result-object v4

    .line 530
    invoke-static {v4}, Lcom/android/apksig/ApkVerifier;->pickBestDigestForV4(Ljava/util/List;)[B

    move-result-object v4

    .line 532
    .local v4, "digestFromV2":[B
    invoke-static {v1, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v6

    if-nez v6, :cond_2a

    .line 533
    sget-object v6, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_V2_V3_DIGESTS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v14, v6, v5}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 535
    .end local v3    # "v2Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;>;"
    .end local v4    # "digestFromV2":[B
    :cond_2a
    goto :goto_1b

    .line 536
    :cond_2b
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "V4 signature must be also verified with V2/V3"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 543
    .end local v0    # "v4Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;>;"
    .end local v1    # "digestFromV4":[B
    .end local v2    # "digestsFromV4":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;>;"
    :cond_2c
    :goto_1b
    if-nez v12, :cond_2d

    .line 544
    :try_start_e
    invoke-static {v9, v11}, Lcom/android/apksig/ApkVerifier;->getAndroidManifestFromApk(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/nio/ByteBuffer;

    move-result-object v0
    :try_end_e
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_e .. :try_end_e} :catch_10

    move-object v12, v0

    goto :goto_1c

    .line 546
    :catch_10
    move-exception v0

    goto :goto_1d

    .line 549
    :cond_2d
    :goto_1c
    nop

    .line 550
    :goto_1d
    if-eqz v12, :cond_30

    .line 551
    nop

    .line 552
    invoke-virtual {v12}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 551
    invoke-static {v0}, Lcom/android/apksig/apk/ApkUtils;->getTargetSdkVersionFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 553
    .local v0, "targetSdkVersion":I
    invoke-static {v0}, Lcom/android/apksig/ApkVerifier;->getMinimumSignatureSchemeVersionForTargetSdk(I)I

    move-result v1

    .line 557
    .local v1, "minSchemeVersion":I
    const/4 v2, 0x1

    if-le v1, v2, :cond_30

    if-lt v10, v0, :cond_30

    .line 559
    packed-switch v1, :pswitch_data_0

    goto :goto_1e

    .line 561
    :pswitch_0
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV2Scheme()Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 562
    goto :goto_1e

    .line 567
    :cond_2e
    :pswitch_1
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV3Scheme()Z

    move-result v2

    if-nez v2, :cond_30

    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV31Scheme()Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 568
    goto :goto_1e

    .line 570
    :cond_2f
    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->MIN_SIG_SCHEME_FOR_TARGET_SDK_NOT_MET:Lcom/android/apksig/ApkVerifier$Issue;

    .line 571
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 572
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    .line 570
    invoke-virtual {v14, v2, v3}, Lcom/android/apksig/ApkVerifier$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 577
    .end local v0    # "targetSdkVersion":I
    .end local v1    # "minSchemeVersion":I
    :cond_30
    :goto_1e
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->containsErrors()Z

    move-result v0

    if-eqz v0, :cond_31

    .line 578
    return-object v14

    .line 582
    :cond_31
    invoke-static {v14}, Lcom/android/apksig/ApkVerifier$Result;->access$1000(Lcom/android/apksig/ApkVerifier$Result;)V

    .line 583
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV31Scheme()Z

    move-result v0

    if-eqz v0, :cond_32

    .line 584
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->getV31SchemeSigners()Ljava/util/List;

    move-result-object v0

    .line 585
    .local v0, "v31Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;

    invoke-virtual {v1}, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->getCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v1

    invoke-static {v14, v1}, Lcom/android/apksig/ApkVerifier$Result;->access$1100(Lcom/android/apksig/ApkVerifier$Result;Ljava/security/cert/X509Certificate;)V

    .line 586
    .end local v0    # "v31Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;>;"
    goto :goto_21

    :cond_32
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV3Scheme()Z

    move-result v0

    if-eqz v0, :cond_33

    .line 587
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->getV3SchemeSigners()Ljava/util/List;

    move-result-object v0

    .line 588
    .local v0, "v3Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;

    invoke-virtual {v1}, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->getCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v1

    invoke-static {v14, v1}, Lcom/android/apksig/ApkVerifier$Result;->access$1100(Lcom/android/apksig/ApkVerifier$Result;Ljava/security/cert/X509Certificate;)V

    .line 589
    .end local v0    # "v3Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;>;"
    goto :goto_21

    :cond_33
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV2Scheme()Z

    move-result v0

    if-eqz v0, :cond_35

    .line 590
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->getV2SchemeSigners()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_34

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;

    .line 591
    .local v1, "signerInfo":Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;
    invoke-virtual {v1}, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->getCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v2

    invoke-static {v14, v2}, Lcom/android/apksig/ApkVerifier$Result;->access$1100(Lcom/android/apksig/ApkVerifier$Result;Ljava/security/cert/X509Certificate;)V

    .line 592
    .end local v1    # "signerInfo":Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;
    goto :goto_1f

    :cond_34
    goto :goto_21

    .line 593
    :cond_35
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->isVerifiedUsingV1Scheme()Z

    move-result v0

    if-eqz v0, :cond_37

    .line 594
    invoke-virtual {v14}, Lcom/android/apksig/ApkVerifier$Result;->getV1SchemeSigners()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_20
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_36

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;

    .line 595
    .local v1, "signerInfo":Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;
    invoke-virtual {v1}, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->getCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v2

    invoke-static {v14, v2}, Lcom/android/apksig/ApkVerifier$Result;->access$1100(Lcom/android/apksig/ApkVerifier$Result;Ljava/security/cert/X509Certificate;)V

    .line 596
    .end local v1    # "signerInfo":Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;
    goto :goto_20

    :cond_36
    nop

    .line 602
    :goto_21
    return-object v14

    .line 598
    :cond_37
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "APK verified, but has not verified using any of v1, v2 or v3 schemes"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 179
    .end local v11    # "zipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .end local v12    # "androidManifest":Ljava/nio/ByteBuffer;
    .end local v13    # "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v14    # "result":Lcom/android/apksig/ApkVerifier$Result;
    .end local v15    # "signatureSchemeApkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    .end local v16    # "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    .end local v18    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v19    # "minSdkVersion":I
    :catch_11
    move-exception v0

    move-object v1, v0

    move-object v0, v1

    .line 180
    .local v0, "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v1, Lcom/android/apksig/apk/ApkFormatException;

    const-string v2, "Malformed APK: not a ZIP archive"

    invoke-direct {v1, v2, v0}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private verifyAndGetMinSdkVersion(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)I
    .locals 7
    .param p1, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p2, "zipSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apk",
            "zipSections"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 611
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier;->mMinSdkVersion:Ljava/lang/Integer;

    const-string v1, ")"

    const-string v2, ") > maxSdkVersion ("

    if-eqz v0, :cond_3

    .line 612
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ltz v0, :cond_2

    .line 616
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier;->mMinSdkVersion:Ljava/lang/Integer;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget v3, p0, Lcom/android/apksig/ApkVerifier;->mMaxSdkVersion:I

    if-gt v0, v3, :cond_0

    goto :goto_0

    .line 617
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "minSdkVersion ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/apksig/ApkVerifier;->mMinSdkVersion:Ljava/lang/Integer;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/apksig/ApkVerifier;->mMaxSdkVersion:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 621
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier;->mMinSdkVersion:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    .line 613
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "minSdkVersion must not be negative: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/apksig/ApkVerifier;->mMinSdkVersion:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 624
    :cond_3
    const/4 v0, 0x0

    .line 626
    .local v0, "androidManifest":Ljava/nio/ByteBuffer;
    if-nez v0, :cond_4

    .line 627
    invoke-static {p1, p2}, Lcom/android/apksig/ApkVerifier;->getAndroidManifestFromApk(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 629
    :cond_4
    nop

    .line 630
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-static {v3}, Lcom/android/apksig/apk/ApkUtils;->getMinSdkVersionFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;)I

    move-result v3

    .line 631
    .local v3, "minSdkVersion":I
    iget v4, p0, Lcom/android/apksig/ApkVerifier;->mMaxSdkVersion:I

    if-gt v3, v4, :cond_5

    .line 636
    return v3

    .line 632
    :cond_5
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "minSdkVersion from APK ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v5, p0, Lcom/android/apksig/ApkVerifier;->mMaxSdkVersion:I

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private verifySourceStamp(Lcom/android/apksig/util/DataSource;Ljava/lang/String;)Lcom/android/apksig/ApkVerifier$Result;
    .locals 26
    .param p1, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p2, "expectedCertDigest"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apk",
            "expectedCertDigest"
        }
    .end annotation

    .line 721
    move-object/from16 v14, p0

    move-object/from16 v15, p1

    move-object/from16 v13, p2

    const/4 v12, 0x0

    :try_start_0
    invoke-static/range {p1 .. p1}, Lcom/android/apksig/apk/ApkUtils;->findZipSections(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/apk/ApkUtils$ZipSections;

    move-result-object v0

    move-object v11, v0

    .line 722
    .local v11, "zipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    invoke-direct {v14, v15, v11}, Lcom/android/apksig/ApkVerifier;->verifyAndGetMinSdkVersion(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)I

    move-result v0

    move v10, v0

    .line 725
    .local v10, "minSdkVersion":I
    nop

    .line 726
    invoke-static {v15, v11}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->parseZipCentralDirectory(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/util/List;

    move-result-object v0

    move-object v9, v0

    .line 727
    .local v9, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    const/4 v0, 0x0

    .line 728
    .local v0, "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 729
    .local v2, "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    const-string v3, "stamp-cert-sha256"

    invoke-virtual {v2}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_0 .. :try_end_0} :catch_3

    if-eqz v3, :cond_0

    .line 730
    move-object v0, v2

    .line 731
    move-object v8, v0

    goto :goto_1

    .line 733
    .end local v2    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :cond_0
    goto :goto_0

    .line 728
    :cond_1
    move-object v8, v0

    .line 738
    .end local v0    # "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .local v8, "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :goto_1
    if-nez v8, :cond_3

    .line 741
    :try_start_1
    new-instance v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    invoke-direct {v0, v12}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;-><init>(I)V

    .line 743
    .local v0, "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    const v1, 0x6dff800d

    invoke-static {v15, v11, v1, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Lcom/android/apksig/internal/apk/SignatureInfo;
    :try_end_1
    .catch Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_1 .. :try_end_1} :catch_3

    .line 745
    const/4 v1, 0x1

    .line 748
    .end local v0    # "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .local v1, "stampSigningBlockFound":Z
    goto :goto_2

    .line 746
    .end local v1    # "stampSigningBlockFound":Z
    :catch_0
    move-exception v0

    .line 747
    .local v0, "e":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;
    const/4 v1, 0x0

    .line 749
    .end local v0    # "e":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;
    .restart local v1    # "stampSigningBlockFound":Z
    :goto_2
    if-eqz v1, :cond_2

    .line 750
    :try_start_2
    sget-object v0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;->STAMP_NOT_VERIFIED:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_SIGNATURE_BLOCK_WITHOUT_CERT_DIGEST:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v3, v12, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lcom/android/apksig/ApkVerifier;->createSourceStampResultWithError(Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)Lcom/android/apksig/ApkVerifier$Result;

    move-result-object v0

    return-object v0

    .line 754
    :cond_2
    sget-object v0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;->STAMP_MISSING:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_CERT_DIGEST_AND_SIG_BLOCK_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v3, v12, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lcom/android/apksig/ApkVerifier;->createSourceStampResultWithError(Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)Lcom/android/apksig/ApkVerifier$Result;

    move-result-object v0

    return-object v0

    .line 762
    .end local v1    # "stampSigningBlockFound":Z
    :cond_3
    nop

    .line 766
    invoke-virtual {v11}, Lcom/android/apksig/apk/ApkUtils$ZipSections;->getZipCentralDirectoryOffset()J

    move-result-wide v0

    .line 763
    invoke-static {v15, v8, v0, v1}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)[B

    move-result-object v17

    .line 767
    .local v17, "sourceStampCertificateDigest":[B
    if-eqz v13, :cond_4

    .line 768
    invoke-static/range {v17 .. v17}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->toHex([B)Ljava/lang/String;

    move-result-object v0

    .line 769
    .local v0, "actualCertDigest":Ljava/lang/String;
    invoke-virtual {v13, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 770
    sget-object v1, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;->CERT_DIGEST_MISMATCH:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_EXPECTED_DIGEST_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v0, v13}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/android/apksig/ApkVerifier;->createSourceStampResultWithError(Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)Lcom/android/apksig/ApkVerifier$Result;

    move-result-object v1

    return-object v1

    .line 778
    .end local v0    # "actualCertDigest":Ljava/lang/String;
    :cond_4
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 780
    .local v0, "signatureSchemeApkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    iget v1, v14, Lcom/android/apksig/ApkVerifier;->mMaxSdkVersion:I

    invoke-static {v1}, Lcom/android/apksig/ApkVerifier;->getSupportedSchemeNames(I)Ljava/util/Map;

    move-result-object v5

    .line 781
    .local v5, "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    new-instance v4, Ljava/util/HashSet;

    const/4 v1, 0x2

    invoke-direct {v4, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 783
    .local v4, "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    new-instance v1, Lcom/android/apksig/ApkVerifier$Result;

    invoke-direct {v1}, Lcom/android/apksig/ApkVerifier$Result;-><init>()V

    move-object v7, v1

    .line 784
    .local v7, "result":Lcom/android/apksig/ApkVerifier$Result;
    const/16 v16, 0x0

    .line 785
    .local v16, "v3Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    iget v1, v14, Lcom/android/apksig/ApkVerifier;->mMaxSdkVersion:I
    :try_end_2
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_2 .. :try_end_2} :catch_7
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_6
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_2 .. :try_end_2} :catch_3

    const/16 v6, 0x1c

    if-lt v1, v6, :cond_5

    .line 786
    const/16 v18, 0x3

    .line 789
    :try_start_3
    invoke-static {v10, v6}, Ljava/lang/Math;->max(II)I

    move-result v19

    .line 786
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object v3, v11

    move v12, v6

    move-object v6, v0

    move-object v12, v7

    .end local v7    # "result":Lcom/android/apksig/ApkVerifier$Result;
    .local v12, "result":Lcom/android/apksig/ApkVerifier$Result;
    move/from16 v7, v18

    move-object/from16 v22, v8

    .end local v8    # "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .local v22, "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    move/from16 v8, v19

    invoke-direct/range {v1 .. v8}, Lcom/android/apksig/ApkVerifier;->getApkContentDigests(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;Ljava/util/Set;Ljava/util/Map;Ljava/util/Map;II)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    move-result-object v1

    .line 790
    .end local v16    # "v3Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .local v1, "v3Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    if-eqz v1, :cond_6

    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->containsErrors()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 791
    invoke-static {v12, v1}, Lcom/android/apksig/ApkVerifier$Result;->access$000(Lcom/android/apksig/ApkVerifier$Result;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V

    .line 792
    sget-object v2, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;->VERIFICATION_ERROR:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

    invoke-static {v2, v12}, Lcom/android/apksig/ApkVerifier;->mergeSourceStampResult(Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;Lcom/android/apksig/ApkVerifier$Result;)Lcom/android/apksig/ApkVerifier$Result;

    move-result-object v2

    return-object v2

    .line 785
    .end local v1    # "v3Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .end local v12    # "result":Lcom/android/apksig/ApkVerifier$Result;
    .end local v22    # "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v7    # "result":Lcom/android/apksig/ApkVerifier$Result;
    .restart local v8    # "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v16    # "v3Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    :cond_5
    move-object v12, v7

    move-object/from16 v22, v8

    .end local v7    # "result":Lcom/android/apksig/ApkVerifier$Result;
    .end local v8    # "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v12    # "result":Lcom/android/apksig/ApkVerifier$Result;
    .restart local v22    # "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    move-object/from16 v1, v16

    .line 798
    .end local v16    # "v3Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .restart local v1    # "v3Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    :cond_6
    const/4 v2, 0x0

    .line 799
    .local v2, "v2Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    iget v3, v14, Lcom/android/apksig/ApkVerifier;->mMaxSdkVersion:I

    const/16 v8, 0x18

    if-lt v3, v8, :cond_9

    const/16 v3, 0x1c

    if-lt v10, v3, :cond_8

    .line 800
    invoke-interface {v4}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_7

    goto :goto_3

    :cond_7
    move-object/from16 v21, v1

    move-object/from16 v18, v2

    move-object/from16 v25, v5

    move-object/from16 v23, v9

    move/from16 v24, v10

    move-object v1, v11

    move-object v2, v12

    const/4 v5, 0x0

    goto :goto_4

    .line 801
    :cond_8
    :goto_3
    const/4 v3, 0x2

    .line 804
    invoke-static {v10, v8}, Ljava/lang/Math;->max(II)I

    move-result v16
    :try_end_3
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_3 .. :try_end_3} :catch_7
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_6
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_3 .. :try_end_3} :catch_2

    .line 801
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object v8, v11

    move-object/from16 v23, v9

    .end local v9    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .local v23, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    move-object v9, v4

    move/from16 v24, v10

    .end local v10    # "minSdkVersion":I
    .local v24, "minSdkVersion":I
    move-object v10, v5

    move-object/from16 v21, v1

    move-object v1, v11

    .end local v11    # "zipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .local v1, "zipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .local v21, "v3Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    move-object v11, v0

    move-object/from16 v18, v2

    move-object/from16 v25, v5

    move-object v2, v12

    const/4 v5, 0x0

    .end local v5    # "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    .end local v12    # "result":Lcom/android/apksig/ApkVerifier$Result;
    .local v2, "result":Lcom/android/apksig/ApkVerifier$Result;
    .local v18, "v2Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .local v25, "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    move v12, v3

    move/from16 v13, v16

    :try_start_4
    invoke-direct/range {v6 .. v13}, Lcom/android/apksig/ApkVerifier;->getApkContentDigests(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;Ljava/util/Set;Ljava/util/Map;Ljava/util/Map;II)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    move-result-object v3

    .line 805
    .end local v18    # "v2Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .local v3, "v2Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    if-eqz v3, :cond_a

    invoke-virtual {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->containsErrors()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 806
    invoke-static {v2, v3}, Lcom/android/apksig/ApkVerifier$Result;->access$000(Lcom/android/apksig/ApkVerifier$Result;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V

    .line 807
    sget-object v6, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;->VERIFICATION_ERROR:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

    invoke-static {v6, v2}, Lcom/android/apksig/ApkVerifier;->mergeSourceStampResult(Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;Lcom/android/apksig/ApkVerifier$Result;)Lcom/android/apksig/ApkVerifier$Result;

    move-result-object v5

    return-object v5

    .line 799
    .end local v3    # "v2Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .end local v21    # "v3Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .end local v23    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v24    # "minSdkVersion":I
    .end local v25    # "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    .local v1, "v3Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .local v2, "v2Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .restart local v5    # "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    .restart local v9    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v10    # "minSdkVersion":I
    .restart local v11    # "zipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .restart local v12    # "result":Lcom/android/apksig/ApkVerifier$Result;
    :cond_9
    move-object/from16 v21, v1

    move-object/from16 v18, v2

    move-object/from16 v25, v5

    move-object/from16 v23, v9

    move/from16 v24, v10

    move-object v1, v11

    move-object v2, v12

    const/4 v5, 0x0

    .line 813
    .end local v5    # "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    .end local v9    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v10    # "minSdkVersion":I
    .end local v11    # "zipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .end local v12    # "result":Lcom/android/apksig/ApkVerifier$Result;
    .local v1, "zipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .local v2, "result":Lcom/android/apksig/ApkVerifier$Result;
    .restart local v18    # "v2Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .restart local v21    # "v3Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .restart local v23    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v24    # "minSdkVersion":I
    .restart local v25    # "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    :goto_4
    move-object/from16 v3, v18

    .end local v18    # "v2Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .restart local v3    # "v2Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    :cond_a
    const/4 v6, 0x1

    move/from16 v7, v24

    const/16 v8, 0x18

    .end local v24    # "minSdkVersion":I
    .local v7, "minSdkVersion":I
    if-lt v7, v8, :cond_c

    invoke-interface {v4}, Ljava/util/Set;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_b

    goto :goto_5

    :cond_b
    move-object/from16 v9, v23

    goto :goto_6

    .line 814
    :cond_c
    :goto_5
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 815
    move-object/from16 v9, v23

    .end local v23    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v9    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    invoke-static {v9, v15, v1}, Lcom/android/apksig/ApkVerifier;->getApkContentDigestFromV1SigningScheme(Ljava/util/List;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/util/Map;

    move-result-object v10

    .line 814
    invoke-interface {v0, v8, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 818
    :goto_6
    iget v8, v14, Lcom/android/apksig/ApkVerifier;->mMaxSdkVersion:I

    .line 819
    move-object/from16 v15, p1

    move-object/from16 v16, v1

    move-object/from16 v18, v0

    move/from16 v19, v7

    move/from16 v20, v8

    invoke-static/range {v15 .. v20}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampVerifier;->verify(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/zip/ZipSections;[BLjava/util/Map;II)Lcom/android/apksig/internal/apk/ApkSigResult;

    move-result-object v8

    .line 826
    .local v8, "sourceStampResult":Lcom/android/apksig/internal/apk/ApkSigResult;
    invoke-static {v2, v8}, Lcom/android/apksig/ApkVerifier$Result;->access$200(Lcom/android/apksig/ApkVerifier$Result;Lcom/android/apksig/internal/apk/ApkSigResult;)V

    .line 829
    iget-boolean v10, v8, Lcom/android/apksig/internal/apk/ApkSigResult;->verified:Z

    if-eqz v10, :cond_d

    .line 830
    invoke-static {v2}, Lcom/android/apksig/ApkVerifier$Result;->access$1000(Lcom/android/apksig/ApkVerifier$Result;)V

    goto :goto_7

    .line 835
    :cond_d
    invoke-virtual {v2, v6}, Lcom/android/apksig/ApkVerifier$Result;->setWarningsAsErrors(Z)V
    :try_end_4
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_4 .. :try_end_4} :catch_7
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_6
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_4 .. :try_end_4} :catch_1

    .line 837
    :goto_7
    return-object v2

    .line 846
    .end local v0    # "signatureSchemeApkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    .end local v1    # "zipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .end local v2    # "result":Lcom/android/apksig/ApkVerifier$Result;
    .end local v3    # "v2Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .end local v4    # "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v7    # "minSdkVersion":I
    .end local v8    # "sourceStampResult":Lcom/android/apksig/internal/apk/ApkSigResult;
    .end local v9    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v17    # "sourceStampCertificateDigest":[B
    .end local v21    # "v3Result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .end local v22    # "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v25    # "supportedSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    :catch_1
    move-exception v0

    goto :goto_8

    :catch_2
    move-exception v0

    const/4 v5, 0x0

    goto :goto_8

    :catch_3
    move-exception v0

    move v5, v12

    .line 847
    .local v0, "e":Lcom/android/apksig/internal/apk/SignatureNotFoundException;
    :goto_8
    sget-object v1, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;->STAMP_NOT_VERIFIED:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_SIG_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {v1, v2, v3}, Lcom/android/apksig/ApkVerifier;->createSourceStampResultWithError(Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)Lcom/android/apksig/ApkVerifier$Result;

    move-result-object v1

    return-object v1

    .line 842
    .end local v0    # "e":Lcom/android/apksig/internal/apk/SignatureNotFoundException;
    :catch_4
    move-exception v0

    .line 843
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    sget-object v1, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;->VERIFICATION_ERROR:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->UNEXPECTED_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/android/apksig/ApkVerifier;->createSourceStampResultWithError(Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)Lcom/android/apksig/ApkVerifier$Result;

    move-result-object v1

    return-object v1

    .line 838
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_5
    move-exception v0

    goto :goto_9

    :catch_6
    move-exception v0

    goto :goto_9

    :catch_7
    move-exception v0

    .line 839
    .local v0, "e":Ljava/lang/Exception;
    :goto_9
    sget-object v1, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;->VERIFICATION_ERROR:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->MALFORMED_APK:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/android/apksig/ApkVerifier;->createSourceStampResultWithError(Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)Lcom/android/apksig/ApkVerifier$Result;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public verify()Lcom/android/apksig/ApkVerifier$Result;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 141
    const/4 v0, 0x0

    .line 144
    .local v0, "in":Ljava/io/Closeable;
    :try_start_0
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier;->mApkDataSource:Lcom/android/apksig/util/DataSource;

    if-eqz v1, :cond_0

    .line 145
    nop

    .local v1, "apk":Lcom/android/apksig/util/DataSource;
    goto :goto_0

    .line 146
    .end local v1    # "apk":Lcom/android/apksig/util/DataSource;
    :cond_0
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier;->mApkFile:Ljava/io/File;

    if-eqz v1, :cond_2

    .line 147
    new-instance v1, Ljava/io/RandomAccessFile;

    iget-object v2, p0, Lcom/android/apksig/ApkVerifier;->mApkFile:Ljava/io/File;

    const-string v3, "r"

    invoke-direct {v1, v2, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 148
    .local v1, "f":Ljava/io/RandomAccessFile;
    move-object v0, v1

    .line 149
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    invoke-static {v1, v4, v5, v2, v3}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/io/RandomAccessFile;JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v2

    move-object v1, v2

    .line 150
    .local v1, "apk":Lcom/android/apksig/util/DataSource;
    nop

    .line 153
    :goto_0
    invoke-direct {p0, v1}, Lcom/android/apksig/ApkVerifier;->verify(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/ApkVerifier$Result;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 155
    if-eqz v0, :cond_1

    .line 156
    invoke-interface {v0}, Ljava/io/Closeable;->close()V

    .line 153
    :cond_1
    return-object v2

    .line 151
    .end local v1    # "apk":Lcom/android/apksig/util/DataSource;
    :cond_2
    :try_start_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "APK not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v0    # "in":Ljava/io/Closeable;
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 155
    .restart local v0    # "in":Ljava/io/Closeable;
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_3

    .line 156
    invoke-interface {v0}, Ljava/io/Closeable;->close()V

    .line 158
    :cond_3
    throw v1
.end method

.method public verifySourceStamp()Lcom/android/apksig/ApkVerifier$Result;
    .locals 1

    .line 669
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/apksig/ApkVerifier;->verifySourceStamp(Ljava/lang/String;)Lcom/android/apksig/ApkVerifier$Result;

    move-result-object v0

    return-object v0
.end method

.method public verifySourceStamp(Ljava/lang/String;)Lcom/android/apksig/ApkVerifier$Result;
    .locals 6
    .param p1, "expectedCertDigest"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedCertDigest"
        }
    .end annotation

    .line 685
    const/4 v0, 0x0

    .line 688
    .local v0, "in":Ljava/io/Closeable;
    :try_start_0
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier;->mApkDataSource:Lcom/android/apksig/util/DataSource;

    if-eqz v1, :cond_0

    .line 689
    nop

    .local v1, "apk":Lcom/android/apksig/util/DataSource;
    goto :goto_0

    .line 690
    .end local v1    # "apk":Lcom/android/apksig/util/DataSource;
    :cond_0
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier;->mApkFile:Ljava/io/File;

    if-eqz v1, :cond_2

    .line 691
    new-instance v1, Ljava/io/RandomAccessFile;

    iget-object v2, p0, Lcom/android/apksig/ApkVerifier;->mApkFile:Ljava/io/File;

    const-string v3, "r"

    invoke-direct {v1, v2, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 692
    .local v1, "f":Ljava/io/RandomAccessFile;
    move-object v0, v1

    .line 693
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    invoke-static {v1, v4, v5, v2, v3}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/io/RandomAccessFile;JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v2

    move-object v1, v2

    .line 694
    .local v1, "apk":Lcom/android/apksig/util/DataSource;
    nop

    .line 697
    :goto_0
    invoke-direct {p0, v1, p1}, Lcom/android/apksig/ApkVerifier;->verifySourceStamp(Lcom/android/apksig/util/DataSource;Ljava/lang/String;)Lcom/android/apksig/ApkVerifier$Result;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 703
    if-eqz v0, :cond_1

    .line 705
    :try_start_1
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 707
    goto :goto_1

    .line 706
    :catch_0
    move-exception v3

    .line 697
    :cond_1
    :goto_1
    return-object v2

    .line 695
    .end local v1    # "apk":Lcom/android/apksig/util/DataSource;
    :cond_2
    :try_start_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "APK not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v0    # "in":Ljava/io/Closeable;
    .end local p1    # "expectedCertDigest":Ljava/lang/String;
    throw v1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 703
    .restart local v0    # "in":Ljava/io/Closeable;
    .restart local p1    # "expectedCertDigest":Ljava/lang/String;
    :catchall_0
    move-exception v1

    goto :goto_3

    .line 698
    :catch_1
    move-exception v1

    .line 699
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    sget-object v2, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;->VERIFICATION_ERROR:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->UNEXPECTED_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/android/apksig/ApkVerifier;->createSourceStampResultWithError(Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)Lcom/android/apksig/ApkVerifier$Result;

    move-result-object v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 703
    if-eqz v0, :cond_3

    .line 705
    :try_start_4
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 707
    goto :goto_2

    .line 706
    :catch_2
    move-exception v3

    .line 699
    :cond_3
    :goto_2
    return-object v2

    .line 703
    .end local v1    # "e":Ljava/io/IOException;
    :goto_3
    if-eqz v0, :cond_4

    .line 705
    :try_start_5
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 707
    goto :goto_4

    .line 706
    :catch_3
    move-exception v2

    .line 709
    :cond_4
    :goto_4
    throw v1
.end method
