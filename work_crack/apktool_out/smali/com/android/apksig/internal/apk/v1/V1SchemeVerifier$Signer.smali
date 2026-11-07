.class Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;
.super Ljava/lang/Object;
.source "V1SchemeVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Signer"
.end annotation


# instance fields
.field private mIgnored:Z

.field private final mName:Ljava/lang/String;

.field private final mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

.field private mSigFileBytes:[B

.field private mSigFileEntryNames:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mSignatureBlockEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

.field private final mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;


# direct methods
.method private constructor <init>(Ljava/lang/String;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "sigBlockEntry"    # Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .param p3, "sigFileEntry"    # Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .param p4, "result"    # Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "name",
            "sigBlockEntry",
            "sigFileEntry",
            "result"
        }
    .end annotation

    .line 431
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 432
    iput-object p1, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mName:Ljava/lang/String;

    .line 433
    iput-object p4, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    .line 434
    iput-object p2, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureBlockEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 435
    iput-object p3, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 436
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .param p3, "x2"    # Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .param p4, "x3"    # Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;
    .param p5, "x4"    # Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$1;

    .line 417
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;-><init>(Ljava/lang/String;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;)V

    return-void
.end method

.method private checkForStrippedApkSignatures(Lcom/android/apksig/internal/jar/ManifestParser$Section;Ljava/util/Map;Ljava/util/Set;)V
    .locals 11
    .param p1, "sfMainSection"    # Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "sfMainSection",
            "supportedApkSigSchemeNames",
            "foundApkSigSchemeIds"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/internal/jar/ManifestParser$Section;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1073
    .local p2, "supportedApkSigSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    .local p3, "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    nop

    .line 1074
    const-string v0, "X-Android-APK-Signed"

    invoke-virtual {p1, v0}, Lcom/android/apksig/internal/jar/ManifestParser$Section;->getAttributeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1080
    .local v0, "signedWithApkSchemes":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 1082
    invoke-interface {p3}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1084
    iget-object v1, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_APK_SIG_STRIP_PROTECTION:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v3, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 1086
    invoke-virtual {v3}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 1084
    invoke-static {v1, v2, v3}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$900(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 1088
    :cond_0
    return-void

    .line 1091
    :cond_1
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1092
    return-void

    .line 1095
    :cond_2
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 1096
    .local v1, "supportedApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    new-instance v2, Ljava/util/HashSet;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/HashSet;-><init>(I)V

    .line 1097
    .local v2, "supportedExpectedApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    new-instance v3, Ljava/util/StringTokenizer;

    const-string v4, ","

    invoke-direct {v3, v0, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1098
    .local v3, "tokenizer":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 1099
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 1100
    .local v4, "idText":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1101
    goto :goto_0

    .line 1105
    :cond_3
    :try_start_0
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1108
    .local v5, "id":I
    nop

    .line 1111
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1112
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1114
    :cond_4
    iget-object v6, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v7, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_UNKNOWN_APK_SIG_SCHEME_ID:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v8, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 1116
    invoke-virtual {v8}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v8

    .line 1117
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    filled-new-array {v8, v9}, [Ljava/lang/Object;

    move-result-object v8

    .line 1114
    invoke-static {v6, v7, v8}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$900(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 1119
    .end local v4    # "idText":Ljava/lang/String;
    .end local v5    # "id":I
    :goto_1
    goto :goto_0

    .line 1106
    .restart local v4    # "idText":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 1107
    .local v5, "ignored":Ljava/lang/Exception;
    goto :goto_0

    .line 1121
    .end local v4    # "idText":Ljava/lang/String;
    .end local v5    # "ignored":Ljava/lang/Exception;
    :cond_5
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 1122
    .local v5, "id":I
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {p3, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6

    .line 1123
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {p2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 1124
    .local v6, "apkSigSchemeName":Ljava/lang/String;
    iget-object v7, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v8, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MISSING_APK_SIG_REFERENCED:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v9, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 1126
    invoke-virtual {v9}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v9

    .line 1127
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    filled-new-array {v9, v10, v6}, [Ljava/lang/Object;

    move-result-object v9

    .line 1124
    invoke-static {v7, v8, v9}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$800(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 1130
    .end local v5    # "id":I
    .end local v6    # "apkSigSchemeName":Ljava/lang/String;
    :cond_6
    goto :goto_2

    .line 1131
    :cond_7
    return-void
.end method

.method public static getCertificateChain(Ljava/util/List;Ljava/security/cert/X509Certificate;)Ljava/util/List;
    .locals 8
    .param p1, "leaf"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "certs",
            "leaf"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;",
            "Ljava/security/cert/X509Certificate;",
            ")",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation

    .line 798
    .local p0, "certs":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 799
    .local v0, "unusedCerts":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 800
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 801
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 802
    move-object v2, p1

    .line 803
    .local v2, "root":Ljava/security/cert/X509Certificate;
    :goto_0
    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v3

    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getIssuerDN()Ljava/security/Principal;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 804
    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getIssuerDN()Ljava/security/Principal;

    move-result-object v3

    .line 805
    .local v3, "targetDn":Ljava/security/Principal;
    const/4 v4, 0x0

    .line 806
    .local v4, "issuerFound":Z
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_1

    .line 807
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/security/cert/X509Certificate;

    .line 808
    .local v6, "unusedCert":Ljava/security/cert/X509Certificate;
    invoke-virtual {v6}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 809
    const/4 v4, 0x1

    .line 810
    invoke-interface {v0, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 811
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 812
    move-object v2, v6

    .line 813
    goto :goto_2

    .line 806
    .end local v6    # "unusedCert":Ljava/security/cert/X509Certificate;
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 816
    .end local v5    # "i":I
    :cond_1
    :goto_2
    if-nez v4, :cond_2

    .line 817
    goto :goto_3

    .line 819
    .end local v3    # "targetDn":Ljava/security/Principal;
    .end local v4    # "issuerFound":Z
    :cond_2
    goto :goto_0

    .line 820
    :cond_3
    :goto_3
    return-object v1
.end method

.method private verifyManifestDigest(Lcom/android/apksig/internal/jar/ManifestParser$Section;Z[BII)Z
    .locals 17
    .param p1, "sfMainSection"    # Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .param p2, "createdBySigntool"    # Z
    .param p3, "manifestBytes"    # [B
    .param p4, "minSdkVersion"    # I
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
            "sfMainSection",
            "createdBySigntool",
            "manifestBytes",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 943
    move-object/from16 v0, p0

    .line 946
    if-eqz p2, :cond_0

    const-string v1, "-Digest"

    goto :goto_0

    :cond_0
    const-string v1, "-Digest-Manifest"

    .line 944
    :goto_0
    move-object/from16 v2, p1

    move/from16 v3, p4

    move/from16 v4, p5

    invoke-static {v2, v1, v3, v4}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->getDigestsToVerify(Lcom/android/apksig/internal/jar/ManifestParser$Section;Ljava/lang/String;II)Ljava/util/Collection;

    move-result-object v1

    .line 949
    .local v1, "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    xor-int/lit8 v5, v5, 0x1

    .line 950
    .local v5, "digestFound":Z
    if-nez v5, :cond_1

    .line 951
    iget-object v6, v0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v7, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_MANIFEST_DIGEST_IN_SIG_FILE:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v8, v0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 953
    invoke-virtual {v8}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    .line 951
    invoke-static {v6, v7, v8}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$900(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 954
    const/4 v6, 0x0

    return v6

    .line 957
    :cond_1
    const/4 v6, 0x1

    .line 958
    .local v6, "verified":Z
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;

    .line 959
    .local v8, "expectedDigest":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;
    iget-object v9, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;->jcaDigestAlgorithm:Ljava/lang/String;

    .line 960
    .local v9, "jcaDigestAlgorithm":Ljava/lang/String;
    move-object/from16 v10, p3

    invoke-static {v9, v10}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->access$1000(Ljava/lang/String;[B)[B

    move-result-object v11

    .line 961
    .local v11, "actual":[B
    iget-object v12, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;->digest:[B

    .line 962
    .local v12, "expected":[B
    invoke-static {v12, v11}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v13

    if-nez v13, :cond_2

    .line 963
    iget-object v13, v0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v14, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_ZIP_ENTRY_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v15, v0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 967
    invoke-virtual {v15}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v15

    .line 968
    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object v0

    .line 969
    move-object/from16 v16, v1

    .end local v1    # "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    .local v16, "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object v1

    invoke-virtual {v1, v12}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object v1

    const-string v2, "META-INF/MANIFEST.MF"

    filled-new-array {v2, v9, v15, v0, v1}, [Ljava/lang/Object;

    move-result-object v0

    .line 963
    invoke-static {v13, v14, v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$900(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 970
    const/4 v0, 0x0

    move v6, v0

    .end local v6    # "verified":Z
    .local v0, "verified":Z
    goto :goto_2

    .line 962
    .end local v0    # "verified":Z
    .end local v16    # "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    .restart local v1    # "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    .restart local v6    # "verified":Z
    :cond_2
    move-object/from16 v16, v1

    .line 972
    .end local v1    # "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    .end local v8    # "expectedDigest":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;
    .end local v9    # "jcaDigestAlgorithm":Ljava/lang/String;
    .end local v11    # "actual":[B
    .end local v12    # "expected":[B
    .restart local v16    # "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    :goto_2
    move-object/from16 v0, p0

    move-object/from16 v2, p1

    move-object/from16 v1, v16

    goto :goto_1

    .line 973
    .end local v16    # "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    .restart local v1    # "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    :cond_3
    return v6
.end method

.method private verifyManifestIndividualSectionDigest(Lcom/android/apksig/internal/jar/ManifestParser$Section;ZLcom/android/apksig/internal/jar/ManifestParser$Section;[BII)V
    .locals 17
    .param p1, "sfIndividualSection"    # Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .param p2, "createdBySigntool"    # Z
    .param p3, "manifestIndividualSection"    # Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .param p4, "manifestBytes"    # [B
    .param p5, "minSdkVersion"    # I
    .param p6, "maxSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "sfIndividualSection",
            "createdBySigntool",
            "manifestIndividualSection",
            "manifestBytes",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 1027
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/internal/jar/ManifestParser$Section;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1028
    .local v2, "entryName":Ljava/lang/String;
    nop

    .line 1029
    const-string v3, "-Digest"

    move-object/from16 v4, p1

    move/from16 v5, p5

    move/from16 v6, p6

    invoke-static {v4, v3, v5, v6}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->getDigestsToVerify(Lcom/android/apksig/internal/jar/ManifestParser$Section;Ljava/lang/String;II)Ljava/util/Collection;

    move-result-object v3

    .line 1031
    .local v3, "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1032
    iget-object v7, v0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v8, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_ZIP_ENTRY_DIGEST_IN_SIG_FILE:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v9, v0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 1035
    invoke-virtual {v9}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v9

    filled-new-array {v2, v9}, [Ljava/lang/Object;

    move-result-object v9

    .line 1032
    invoke-static {v7, v8, v9}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$800(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 1036
    return-void

    .line 1039
    :cond_0
    invoke-virtual/range {p3 .. p3}, Lcom/android/apksig/internal/jar/ManifestParser$Section;->getStartOffset()I

    move-result v7

    .line 1040
    .local v7, "sectionStartIndex":I
    invoke-virtual/range {p3 .. p3}, Lcom/android/apksig/internal/jar/ManifestParser$Section;->getSizeBytes()I

    move-result v8

    .line 1041
    .local v8, "sectionSizeBytes":I
    if-eqz p2, :cond_1

    .line 1042
    add-int v9, v7, v8

    .line 1043
    .local v9, "sectionEndIndex":I
    add-int/lit8 v10, v9, -0x1

    aget-byte v10, v1, v10

    const/16 v11, 0xa

    if-ne v10, v11, :cond_1

    add-int/lit8 v10, v9, -0x2

    aget-byte v10, v1, v10

    if-ne v10, v11, :cond_1

    .line 1045
    add-int/lit8 v8, v8, -0x1

    .line 1048
    .end local v9    # "sectionEndIndex":I
    :cond_1
    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;

    .line 1049
    .local v10, "expectedDigest":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;
    iget-object v11, v10, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;->jcaDigestAlgorithm:Ljava/lang/String;

    .line 1050
    .local v11, "jcaDigestAlgorithm":Ljava/lang/String;
    nop

    .line 1051
    invoke-static {v11, v1, v7, v8}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->access$1100(Ljava/lang/String;[BII)[B

    move-result-object v12

    .line 1056
    .local v12, "actual":[B
    iget-object v13, v10, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;->digest:[B

    .line 1057
    .local v13, "expected":[B
    invoke-static {v13, v12}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v14

    if-nez v14, :cond_2

    .line 1058
    iget-object v14, v0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v15, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MANIFEST_SECTION_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v1, v0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 1062
    invoke-virtual {v1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v1

    .line 1063
    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object v0

    .line 1064
    move-object/from16 v16, v3

    .end local v3    # "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    .local v16, "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v11, v1, v0, v3}, [Ljava/lang/Object;

    move-result-object v0

    .line 1058
    invoke-static {v14, v15, v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$800(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    goto :goto_1

    .line 1057
    .end local v16    # "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    .restart local v3    # "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    :cond_2
    move-object/from16 v16, v3

    .line 1066
    .end local v3    # "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    .end local v10    # "expectedDigest":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;
    .end local v11    # "jcaDigestAlgorithm":Ljava/lang/String;
    .end local v12    # "actual":[B
    .end local v13    # "expected":[B
    .restart local v16    # "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    :goto_1
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v3, v16

    goto :goto_0

    .line 1067
    .end local v16    # "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    .restart local v3    # "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    :cond_3
    return-void
.end method

.method private verifyManifestMainSectionDigest(Lcom/android/apksig/internal/jar/ManifestParser$Section;Lcom/android/apksig/internal/jar/ManifestParser$Section;[BII)V
    .locals 16
    .param p1, "sfMainSection"    # Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .param p2, "manifestMainSection"    # Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .param p3, "manifestBytes"    # [B
    .param p4, "minSdkVersion"    # I
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
            "sfMainSection",
            "manifestMainSection",
            "manifestBytes",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 986
    move-object/from16 v0, p0

    .line 987
    const-string v1, "-Digest-Manifest-Main-Attributes"

    move-object/from16 v2, p1

    move/from16 v3, p4

    move/from16 v4, p5

    invoke-static {v2, v1, v3, v4}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->getDigestsToVerify(Lcom/android/apksig/internal/jar/ManifestParser$Section;Ljava/lang/String;II)Ljava/util/Collection;

    move-result-object v1

    .line 992
    .local v1, "expectedDigests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 993
    return-void

    .line 996
    :cond_0
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;

    .line 997
    .local v6, "expectedDigest":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;
    iget-object v7, v6, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;->jcaDigestAlgorithm:Ljava/lang/String;

    .line 998
    .local v7, "jcaDigestAlgorithm":Ljava/lang/String;
    nop

    .line 1002
    invoke-virtual/range {p2 .. p2}, Lcom/android/apksig/internal/jar/ManifestParser$Section;->getStartOffset()I

    move-result v8

    .line 1003
    invoke-virtual/range {p2 .. p2}, Lcom/android/apksig/internal/jar/ManifestParser$Section;->getSizeBytes()I

    move-result v9

    .line 999
    move-object/from16 v10, p3

    invoke-static {v7, v10, v8, v9}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->access$1100(Ljava/lang/String;[BII)[B

    move-result-object v8

    .line 1004
    .local v8, "actual":[B
    iget-object v9, v6, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;->digest:[B

    .line 1005
    .local v9, "expected":[B
    invoke-static {v9, v8}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v11

    if-nez v11, :cond_1

    .line 1006
    iget-object v11, v0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v12, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MANIFEST_MAIN_SECTION_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v13, v0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 1009
    invoke-virtual {v13}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v13

    .line 1010
    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object v14

    .line 1011
    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object v15

    filled-new-array {v7, v13, v14, v15}, [Ljava/lang/Object;

    move-result-object v13

    .line 1006
    invoke-static {v11, v12, v13}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$800(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 1013
    .end local v6    # "expectedDigest":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;
    .end local v7    # "jcaDigestAlgorithm":Ljava/lang/String;
    .end local v8    # "actual":[B
    .end local v9    # "expected":[B
    :cond_1
    goto :goto_0

    .line 1014
    :cond_2
    move-object/from16 v10, p3

    return-void
.end method

.method private verifySignerInfoAgainstSigFile(Lcom/android/apksig/internal/pkcs7/SignedData;Ljava/util/Collection;Lcom/android/apksig/internal/pkcs7/SignerInfo;[BII)Ljava/security/cert/X509Certificate;
    .locals 18
    .param p1, "signedData"    # Lcom/android/apksig/internal/pkcs7/SignedData;
    .param p3, "signerInfo"    # Lcom/android/apksig/internal/pkcs7/SignerInfo;
    .param p4, "signatureFile"    # [B
    .param p5, "minSdkVersion"    # I
    .param p6, "maxSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "signedData",
            "signedDataCertificates",
            "signerInfo",
            "signatureFile",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/internal/pkcs7/SignedData;",
            "Ljava/util/Collection<",
            "Ljava/security/cert/X509Certificate;",
            ">;",
            "Lcom/android/apksig/internal/pkcs7/SignerInfo;",
            "[BII)",
            "Ljava/security/cert/X509Certificate;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 602
    .local p2, "signedDataCertificates":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/security/cert/X509Certificate;>;"
    move-object/from16 v1, p0

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    iget-object v0, v2, Lcom/android/apksig/internal/pkcs7/SignerInfo;->digestAlgorithm:Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;

    iget-object v10, v0, Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;->algorithm:Ljava/lang/String;

    .line 603
    .local v10, "digestAlgorithmOid":Ljava/lang/String;
    iget-object v0, v2, Lcom/android/apksig/internal/pkcs7/SignerInfo;->signatureAlgorithm:Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;

    iget-object v11, v0, Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;->algorithm:Ljava/lang/String;

    .line 604
    .local v11, "signatureAlgorithmOid":Ljava/lang/String;
    nop

    .line 605
    invoke-static/range {p5 .. p6}, Lcom/android/apksig/internal/util/InclusiveIntRange;->fromTo(II)Lcom/android/apksig/internal/util/InclusiveIntRange;

    move-result-object v12

    .line 606
    .local v12, "desiredApiLevels":Lcom/android/apksig/internal/util/InclusiveIntRange;
    nop

    .line 607
    invoke-static {v10, v11}, Lcom/android/apksig/internal/oid/OidConstants;->getSigAlgSupportedApiLevels(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v13

    .line 608
    .local v13, "apiLevelsWhereDigestAndSigAlgorithmSupported":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/InclusiveIntRange;>;"
    nop

    .line 609
    invoke-virtual {v12, v13}, Lcom/android/apksig/internal/util/InclusiveIntRange;->getValuesNotIn(Ljava/util/List;)Ljava/util/List;

    move-result-object v14

    .line 610
    .local v14, "apiLevelsWhereDigestAlgorithmNotSupported":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/InclusiveIntRange;>;"
    invoke-interface {v14}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    .line 611
    nop

    .line 612
    invoke-static {v10}, Lcom/android/apksig/internal/oid/OidConstants$OidToUserFriendlyNameMapper;->getUserFriendlyNameForOid(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 614
    .local v0, "digestAlgorithmUserFriendly":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 615
    move-object v0, v10

    .line 617
    :cond_0
    nop

    .line 618
    invoke-static {v11}, Lcom/android/apksig/internal/oid/OidConstants$OidToUserFriendlyNameMapper;->getUserFriendlyNameForOid(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 620
    .local v4, "signatureAlgorithmUserFriendly":Ljava/lang/String;
    if-nez v4, :cond_1

    .line 621
    move-object v4, v11

    move-object/from16 v16, v4

    goto :goto_0

    .line 620
    :cond_1
    move-object/from16 v16, v4

    .line 623
    .end local v4    # "signatureAlgorithmUserFriendly":Ljava/lang/String;
    .local v16, "signatureAlgorithmUserFriendly":Ljava/lang/String;
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object v9, v4

    .line 624
    .local v9, "apiLevelsUserFriendly":Ljava/lang/StringBuilder;
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/apksig/internal/util/InclusiveIntRange;

    .line 625
    .local v5, "range":Lcom/android/apksig/internal/util/InclusiveIntRange;
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_2

    .line 626
    const-string v6, ", "

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 628
    :cond_2
    invoke-virtual {v5}, Lcom/android/apksig/internal/util/InclusiveIntRange;->getMin()I

    move-result v6

    invoke-virtual {v5}, Lcom/android/apksig/internal/util/InclusiveIntRange;->getMax()I

    move-result v7

    if-ne v6, v7, :cond_3

    .line 629
    invoke-virtual {v5}, Lcom/android/apksig/internal/util/InclusiveIntRange;->getMin()I

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 630
    :cond_3
    invoke-virtual {v5}, Lcom/android/apksig/internal/util/InclusiveIntRange;->getMax()I

    move-result v6

    const v7, 0x7fffffff

    if-ne v6, v7, :cond_4

    .line 631
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Lcom/android/apksig/internal/util/InclusiveIntRange;->getMin()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "+"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 633
    :cond_4
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Lcom/android/apksig/internal/util/InclusiveIntRange;->getMin()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "-"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v5}, Lcom/android/apksig/internal/util/InclusiveIntRange;->getMax()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 635
    .end local v5    # "range":Lcom/android/apksig/internal/util/InclusiveIntRange;
    :goto_2
    goto :goto_1

    .line 636
    :cond_5
    iget-object v8, v1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v7, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_UNSUPPORTED_SIG_ALG:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v4, v1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureBlockEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 638
    invoke-virtual {v4}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v4

    .line 641
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object v5, v10

    move-object v6, v11

    move-object v15, v7

    move-object/from16 v7, v17

    move-object v1, v8

    move-object v8, v0

    move-object/from16 v17, v9

    .end local v9    # "apiLevelsUserFriendly":Ljava/lang/StringBuilder;
    .local v17, "apiLevelsUserFriendly":Ljava/lang/StringBuilder;
    move-object/from16 v9, v16

    filled-new-array/range {v4 .. v9}, [Ljava/lang/Object;

    move-result-object v4

    .line 636
    invoke-static {v1, v15, v4}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$800(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 644
    const/4 v1, 0x0

    return-object v1

    .line 651
    .end local v0    # "digestAlgorithmUserFriendly":Ljava/lang/String;
    .end local v16    # "signatureAlgorithmUserFriendly":Ljava/lang/String;
    .end local v17    # "apiLevelsUserFriendly":Ljava/lang/StringBuilder;
    :cond_6
    iget-object v0, v2, Lcom/android/apksig/internal/pkcs7/SignerInfo;->sid:Lcom/android/apksig/internal/pkcs7/SignerIdentifier;

    .line 652
    move-object/from16 v1, p2

    invoke-static {v1, v0}, Lcom/android/apksig/internal/x509/Certificate;->findCertificate(Ljava/util/Collection;Lcom/android/apksig/internal/pkcs7/SignerIdentifier;)Ljava/security/cert/X509Certificate;

    move-result-object v4

    .line 653
    .local v4, "signingCertificate":Ljava/security/cert/X509Certificate;
    if-eqz v4, :cond_14

    .line 662
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->hasUnsupportedCriticalExtension()Z

    move-result v0

    if-nez v0, :cond_13

    .line 666
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getKeyUsage()[Z

    move-result-object v5

    .line 667
    .local v5, "keyUsageExtension":[Z
    const/4 v6, 0x1

    if-eqz v5, :cond_a

    .line 668
    array-length v0, v5

    const/4 v7, 0x0

    if-lt v0, v6, :cond_7

    aget-boolean v0, v5, v7

    if-eqz v0, :cond_7

    move v0, v6

    goto :goto_3

    :cond_7
    move v0, v7

    .line 670
    .local v0, "digitalSignature":Z
    :goto_3
    array-length v8, v5

    const/4 v9, 0x2

    if-lt v8, v9, :cond_8

    aget-boolean v8, v5, v6

    if-eqz v8, :cond_8

    move v7, v6

    .line 672
    .local v7, "nonRepudiation":Z
    :cond_8
    if-nez v0, :cond_a

    if-eqz v7, :cond_9

    goto :goto_4

    .line 673
    :cond_9
    new-instance v6, Ljava/security/SignatureException;

    const-string v8, "Signing certificate not authorized for use in digital signatures: keyUsage extension missing digitalSignature and nonRepudiation"

    invoke-direct {v6, v8}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 682
    .end local v0    # "digitalSignature":Z
    .end local v7    # "nonRepudiation":Z
    :cond_a
    :goto_4
    nop

    .line 683
    invoke-static {v10, v11}, Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;->getJcaSignatureAlgorithm(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 684
    .local v7, "jcaSignatureAlgorithm":Ljava/lang/String;
    invoke-static {v7}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v8

    .line 685
    .local v8, "s":Ljava/security/Signature;
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v9

    .line 687
    .local v9, "publicKey":Ljava/security/PublicKey;
    :try_start_0
    invoke-virtual {v8, v9}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    .line 704
    goto :goto_5

    .line 688
    :catch_0
    move-exception v0

    move-object v15, v0

    .line 693
    .local v15, "e":Ljava/security/InvalidKeyException;
    :try_start_1
    invoke-static {v9}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodePublicKey(Ljava/security/PublicKey;)[B

    move-result-object v0

    .line 694
    .local v0, "encodedPublicKey":[B
    invoke-interface {v9}, Ljava/security/PublicKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v6

    new-instance v1, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v1, v0}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    invoke-virtual {v6, v1}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v1
    :try_end_1
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_1 .. :try_end_1} :catch_2

    move-object v9, v1

    .line 701
    .end local v0    # "encodedPublicKey":[B
    nop

    .line 702
    invoke-static {v7}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v8

    .line 703
    invoke-virtual {v8, v9}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 706
    .end local v15    # "e":Ljava/security/InvalidKeyException;
    :goto_5
    iget-object v0, v2, Lcom/android/apksig/internal/pkcs7/SignerInfo;->signedAttrs:Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    if-eqz v0, :cond_11

    .line 710
    const/16 v0, 0x13

    move/from16 v1, p5

    if-lt v1, v0, :cond_10

    .line 729
    :try_start_2
    iget-object v0, v2, Lcom/android/apksig/internal/pkcs7/SignerInfo;->signedAttrs:Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    .line 731
    invoke-virtual {v0}, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;->getEncoded()Ljava/nio/ByteBuffer;

    move-result-object v0

    const-class v6, Lcom/android/apksig/internal/pkcs7/Attribute;

    .line 730
    invoke-static {v0, v6}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parseImplicitSetOf(Ljava/nio/ByteBuffer;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 732
    .local v0, "signedAttributes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/Attribute;>;"
    new-instance v6, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$SignedAttributes;

    invoke-direct {v6, v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$SignedAttributes;-><init>(Ljava/util/Collection;)V

    .line 733
    .local v6, "signedAttrs":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$SignedAttributes;
    const/16 v15, 0x18

    move/from16 v1, p6

    if-lt v1, v15, :cond_c

    .line 735
    const-string v15, "1.2.840.113549.1.9.3"

    .line 736
    invoke-virtual {v6, v15}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$SignedAttributes;->getSingleObjectIdentifierValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 738
    .local v15, "contentType":Ljava/lang/String;
    if-eqz v15, :cond_b

    .line 741
    move-object/from16 v1, p1

    move-object/from16 v16, v0

    .end local v0    # "signedAttributes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/Attribute;>;"
    .local v16, "signedAttributes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/Attribute;>;"
    iget-object v0, v1, Lcom/android/apksig/internal/pkcs7/SignedData;->encapContentInfo:Lcom/android/apksig/internal/pkcs7/EncapsulatedContentInfo;

    iget-object v0, v0, Lcom/android/apksig/internal/pkcs7/EncapsulatedContentInfo;->contentType:Ljava/lang/String;

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 746
    const/16 v17, 0x0

    return-object v17

    .line 739
    .end local v16    # "signedAttributes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/Attribute;>;"
    .restart local v0    # "signedAttributes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/Attribute;>;"
    :cond_b
    move-object/from16 v1, p1

    move-object/from16 v16, v0

    .end local v0    # "signedAttributes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/Attribute;>;"
    .restart local v16    # "signedAttributes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/Attribute;>;"
    new-instance v0, Ljava/security/SignatureException;

    const-string v1, "No Content Type in signed attributes"

    invoke-direct {v0, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    .end local v4    # "signingCertificate":Ljava/security/cert/X509Certificate;
    .end local v5    # "keyUsageExtension":[Z
    .end local v7    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .end local v8    # "s":Ljava/security/Signature;
    .end local v9    # "publicKey":Ljava/security/PublicKey;
    .end local v10    # "digestAlgorithmOid":Ljava/lang/String;
    .end local v11    # "signatureAlgorithmOid":Ljava/lang/String;
    .end local v12    # "desiredApiLevels":Lcom/android/apksig/internal/util/InclusiveIntRange;
    .end local v13    # "apiLevelsWhereDigestAndSigAlgorithmSupported":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/InclusiveIntRange;>;"
    .end local v14    # "apiLevelsWhereDigestAlgorithmNotSupported":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/InclusiveIntRange;>;"
    .end local p1    # "signedData":Lcom/android/apksig/internal/pkcs7/SignedData;
    .end local p2    # "signedDataCertificates":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/security/cert/X509Certificate;>;"
    .end local p3    # "signerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    .end local p4    # "signatureFile":[B
    .end local p5    # "minSdkVersion":I
    .end local p6    # "maxSdkVersion":I
    throw v0

    .line 733
    .end local v15    # "contentType":Ljava/lang/String;
    .end local v16    # "signedAttributes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/Attribute;>;"
    .restart local v0    # "signedAttributes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/Attribute;>;"
    .restart local v4    # "signingCertificate":Ljava/security/cert/X509Certificate;
    .restart local v5    # "keyUsageExtension":[Z
    .restart local v7    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .restart local v8    # "s":Ljava/security/Signature;
    .restart local v9    # "publicKey":Ljava/security/PublicKey;
    .restart local v10    # "digestAlgorithmOid":Ljava/lang/String;
    .restart local v11    # "signatureAlgorithmOid":Ljava/lang/String;
    .restart local v12    # "desiredApiLevels":Lcom/android/apksig/internal/util/InclusiveIntRange;
    .restart local v13    # "apiLevelsWhereDigestAndSigAlgorithmSupported":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/InclusiveIntRange;>;"
    .restart local v14    # "apiLevelsWhereDigestAlgorithmNotSupported":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/InclusiveIntRange;>;"
    .restart local p1    # "signedData":Lcom/android/apksig/internal/pkcs7/SignedData;
    .restart local p2    # "signedDataCertificates":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/security/cert/X509Certificate;>;"
    .restart local p3    # "signerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    .restart local p4    # "signatureFile":[B
    .restart local p5    # "minSdkVersion":I
    .restart local p6    # "maxSdkVersion":I
    :cond_c
    move-object/from16 v16, v0

    .line 749
    .end local v0    # "signedAttributes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/Attribute;>;"
    .restart local v16    # "signedAttributes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/Attribute;>;"
    :cond_d
    const-string v0, "1.2.840.113549.1.9.4"

    .line 750
    invoke-virtual {v6, v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$SignedAttributes;->getSingleOctetStringValue(Ljava/lang/String;)[B

    move-result-object v0

    .line 752
    .local v0, "expectedSignatureFileDigest":[B
    if-eqz v0, :cond_f

    .line 755
    nop

    .line 757
    invoke-static {v10}, Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;->getJcaDigestAlgorithm(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 756
    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 758
    invoke-virtual {v1, v3}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    .line 759
    .local v1, "actualSignatureFileDigest":[B
    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v15
    :try_end_2
    .catch Lcom/android/apksig/internal/asn1/Asn1DecodingException; {:try_start_2 .. :try_end_2} :catch_1

    if-nez v15, :cond_e

    .line 765
    const/4 v15, 0x0

    return-object v15

    .line 769
    .end local v0    # "expectedSignatureFileDigest":[B
    .end local v1    # "actualSignatureFileDigest":[B
    .end local v6    # "signedAttrs":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$SignedAttributes;
    .end local v16    # "signedAttributes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/Attribute;>;"
    :cond_e
    nop

    .line 774
    iget-object v0, v2, Lcom/android/apksig/internal/pkcs7/SignerInfo;->signedAttrs:Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    invoke-virtual {v0}, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;->getEncoded()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 775
    .local v0, "signedAttrsOriginalEncoding":Ljava/nio/ByteBuffer;
    const/16 v1, 0x31

    invoke-virtual {v8, v1}, Ljava/security/Signature;->update(B)V

    .line 776
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 777
    invoke-virtual {v8, v0}, Ljava/security/Signature;->update(Ljava/nio/ByteBuffer;)V

    .line 778
    .end local v0    # "signedAttrsOriginalEncoding":Ljava/nio/ByteBuffer;
    goto :goto_6

    .line 753
    .local v0, "expectedSignatureFileDigest":[B
    .restart local v6    # "signedAttrs":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$SignedAttributes;
    .restart local v16    # "signedAttributes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/Attribute;>;"
    :cond_f
    :try_start_3
    new-instance v1, Ljava/security/SignatureException;

    const-string v15, "No content digest in signed attributes"

    invoke-direct {v1, v15}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    .end local v4    # "signingCertificate":Ljava/security/cert/X509Certificate;
    .end local v5    # "keyUsageExtension":[Z
    .end local v7    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .end local v8    # "s":Ljava/security/Signature;
    .end local v9    # "publicKey":Ljava/security/PublicKey;
    .end local v10    # "digestAlgorithmOid":Ljava/lang/String;
    .end local v11    # "signatureAlgorithmOid":Ljava/lang/String;
    .end local v12    # "desiredApiLevels":Lcom/android/apksig/internal/util/InclusiveIntRange;
    .end local v13    # "apiLevelsWhereDigestAndSigAlgorithmSupported":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/InclusiveIntRange;>;"
    .end local v14    # "apiLevelsWhereDigestAlgorithmNotSupported":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/InclusiveIntRange;>;"
    .end local p1    # "signedData":Lcom/android/apksig/internal/pkcs7/SignedData;
    .end local p2    # "signedDataCertificates":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/security/cert/X509Certificate;>;"
    .end local p3    # "signerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    .end local p4    # "signatureFile":[B
    .end local p5    # "minSdkVersion":I
    .end local p6    # "maxSdkVersion":I
    throw v1
    :try_end_3
    .catch Lcom/android/apksig/internal/asn1/Asn1DecodingException; {:try_start_3 .. :try_end_3} :catch_1

    .line 767
    .end local v0    # "expectedSignatureFileDigest":[B
    .end local v6    # "signedAttrs":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$SignedAttributes;
    .end local v16    # "signedAttributes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/Attribute;>;"
    .restart local v4    # "signingCertificate":Ljava/security/cert/X509Certificate;
    .restart local v5    # "keyUsageExtension":[Z
    .restart local v7    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .restart local v8    # "s":Ljava/security/Signature;
    .restart local v9    # "publicKey":Ljava/security/PublicKey;
    .restart local v10    # "digestAlgorithmOid":Ljava/lang/String;
    .restart local v11    # "signatureAlgorithmOid":Ljava/lang/String;
    .restart local v12    # "desiredApiLevels":Lcom/android/apksig/internal/util/InclusiveIntRange;
    .restart local v13    # "apiLevelsWhereDigestAndSigAlgorithmSupported":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/InclusiveIntRange;>;"
    .restart local v14    # "apiLevelsWhereDigestAlgorithmNotSupported":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/InclusiveIntRange;>;"
    .restart local p1    # "signedData":Lcom/android/apksig/internal/pkcs7/SignedData;
    .restart local p2    # "signedDataCertificates":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/security/cert/X509Certificate;>;"
    .restart local p3    # "signerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    .restart local p4    # "signatureFile":[B
    .restart local p5    # "minSdkVersion":I
    .restart local p6    # "maxSdkVersion":I
    :catch_1
    move-exception v0

    .line 768
    .local v0, "e":Lcom/android/apksig/internal/asn1/Asn1DecodingException;
    new-instance v1, Ljava/security/SignatureException;

    const-string v6, "Failed to parse signed attributes"

    invoke-direct {v1, v6, v0}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 724
    .end local v0    # "e":Lcom/android/apksig/internal/asn1/Asn1DecodingException;
    :cond_10
    new-instance v0, Ljava/security/SignatureException;

    const-string v1, "APKs with Signed Attributes broken on platforms with API Level < 19"

    invoke-direct {v0, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 781
    :cond_11
    invoke-virtual {v8, v3}, Ljava/security/Signature;->update([B)V

    .line 783
    :goto_6
    iget-object v0, v2, Lcom/android/apksig/internal/pkcs7/SignerInfo;->signature:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {v0}, Lcom/android/apksig/internal/util/ByteBufferUtils;->toByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v0

    .line 784
    .local v0, "sigBytes":[B
    invoke-virtual {v8, v0}, Ljava/security/Signature;->verify([B)Z

    move-result v1

    if-nez v1, :cond_12

    .line 788
    const/4 v1, 0x0

    return-object v1

    .line 791
    :cond_12
    return-object v4

    .line 696
    .end local v0    # "sigBytes":[B
    .local v15, "e":Ljava/security/InvalidKeyException;
    :catch_2
    move-exception v0

    .line 700
    .local v0, "ikse":Ljava/security/spec/InvalidKeySpecException;
    throw v15

    .line 663
    .end local v0    # "ikse":Ljava/security/spec/InvalidKeySpecException;
    .end local v5    # "keyUsageExtension":[Z
    .end local v7    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .end local v8    # "s":Ljava/security/Signature;
    .end local v9    # "publicKey":Ljava/security/PublicKey;
    .end local v15    # "e":Ljava/security/InvalidKeyException;
    :cond_13
    new-instance v0, Ljava/security/SignatureException;

    const-string v1, "Signing certificate has unsupported critical extensions"

    invoke-direct {v0, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 654
    :cond_14
    new-instance v0, Ljava/security/SignatureException;

    const-string v1, "Signing certificate referenced in SignerInfo not found in SignedData"

    invoke-direct {v0, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .line 439
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getResult()Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;
    .locals 1

    .line 463
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    return-object v0
.end method

.method public getSigFileEntryNames()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 459
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSigFileEntryNames:Ljava/util/Set;

    return-object v0
.end method

.method public getSignatureBlockEntryName()Ljava/lang/String;
    .locals 1

    .line 447
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureBlockEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    invoke-virtual {v0}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSignatureFileEntryName()Ljava/lang/String;
    .locals 1

    .line 443
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    invoke-virtual {v0}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isIgnored()Z
    .locals 1

    .line 455
    iget-boolean v0, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mIgnored:Z

    return v0
.end method

.method setIgnored()V
    .locals 1

    .line 451
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mIgnored:Z

    .line 452
    return-void
.end method

.method public verifySigBlockAgainstSigFile(Lcom/android/apksig/util/DataSource;JII)V
    .locals 20
    .param p1, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p2, "cdStartOffset"    # J
    .param p4, "minSdkVersion"    # I
    .param p5, "maxSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "apk",
            "cdStartOffset",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 472
    move-object/from16 v8, p0

    move-object/from16 v9, p1

    move-wide/from16 v10, p2

    const-string v1, "Malformed ZIP entry: "

    :try_start_0
    iget-object v0, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureBlockEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 473
    invoke-static {v9, v0, v10, v11}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)[B

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_a

    move-object v12, v0

    .line 478
    .local v12, "sigBlockBytes":[B
    nop

    .line 481
    :try_start_1
    iget-object v0, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 482
    invoke-static {v9, v0, v10, v11}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)[B

    move-result-object v0

    iput-object v0, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSigFileBytes:[B
    :try_end_1
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_1 .. :try_end_1} :catch_9

    .line 487
    nop

    .line 492
    nop

    .line 493
    :try_start_2
    invoke-static {v12}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    const-class v1, Lcom/android/apksig/internal/pkcs7/ContentInfo;

    invoke-static {v0, v1}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parse(Ljava/nio/ByteBuffer;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/apksig/internal/pkcs7/ContentInfo;

    .line 494
    .local v0, "contentInfo":Lcom/android/apksig/internal/pkcs7/ContentInfo;
    const-string v1, "1.2.840.113549.1.7.2"

    iget-object v2, v0, Lcom/android/apksig/internal/pkcs7/ContentInfo;->contentType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 498
    iget-object v1, v0, Lcom/android/apksig/internal/pkcs7/ContentInfo;->content:Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    .line 499
    invoke-virtual {v1}, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;->getEncoded()Ljava/nio/ByteBuffer;

    move-result-object v1

    const-class v2, Lcom/android/apksig/internal/pkcs7/SignedData;

    invoke-static {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parse(Ljava/nio/ByteBuffer;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/pkcs7/SignedData;
    :try_end_2
    .catch Lcom/android/apksig/internal/asn1/Asn1DecodingException; {:try_start_2 .. :try_end_2} :catch_8

    move-object v13, v1

    .line 505
    .end local v0    # "contentInfo":Lcom/android/apksig/internal/pkcs7/ContentInfo;
    .local v13, "signedData":Lcom/android/apksig/internal/pkcs7/SignedData;
    nop

    .line 507
    iget-object v0, v13, Lcom/android/apksig/internal/pkcs7/SignedData;->signerInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 508
    iget-object v0, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v1, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v2, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureBlockEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    invoke-virtual {v2}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$800(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 509
    return-void

    .line 514
    :cond_0
    const/4 v0, 0x0

    .line 515
    .local v0, "firstVerifiedSignerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    const/4 v1, 0x0

    .line 520
    .local v1, "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    const/16 v2, 0x18

    move/from16 v14, p4

    if-ge v14, v2, :cond_1

    .line 521
    iget-object v2, v13, Lcom/android/apksig/internal/pkcs7/SignedData;->signerInfos:Ljava/util/List;

    .line 522
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/pkcs7/SignerInfo;

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    move-object v15, v2

    .local v2, "unverifiedSignerInfosToTry":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/SignerInfo;>;"
    goto :goto_0

    .line 524
    .end local v2    # "unverifiedSignerInfosToTry":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/SignerInfo;>;"
    :cond_1
    iget-object v2, v13, Lcom/android/apksig/internal/pkcs7/SignedData;->signerInfos:Ljava/util/List;

    move-object v15, v2

    .line 526
    .local v15, "unverifiedSignerInfosToTry":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/SignerInfo;>;"
    :goto_0
    const/4 v2, 0x0

    .line 527
    .local v2, "signedDataCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v16

    move-object/from16 v17, v0

    move-object v7, v1

    .end local v0    # "firstVerifiedSignerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    .end local v1    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .local v7, "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .local v17, "firstVerifiedSignerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    :goto_1
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v18, v0

    check-cast v18, Lcom/android/apksig/internal/pkcs7/SignerInfo;

    .line 529
    .local v18, "unverifiedSignerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    if-nez v2, :cond_2

    .line 531
    :try_start_3
    iget-object v0, v13, Lcom/android/apksig/internal/pkcs7/SignedData;->certificates:Ljava/util/List;

    invoke-static {v0}, Lcom/android/apksig/internal/x509/Certificate;->parseCertificates(Ljava/util/List;)Ljava/util/List;

    move-result-object v0
    :try_end_3
    .catch Ljava/security/cert/CertificateException; {:try_start_3 .. :try_end_3} :catch_0

    .line 536
    .end local v2    # "signedDataCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .local v0, "signedDataCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    move-object/from16 v19, v0

    goto :goto_2

    .line 532
    .end local v0    # "signedDataCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .restart local v2    # "signedDataCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    :catch_0
    move-exception v0

    .line 533
    .local v0, "e":Ljava/security/cert/CertificateException;
    iget-object v1, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_PARSE_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v4, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureBlockEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 534
    invoke-virtual {v4}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v4, v0}, [Ljava/lang/Object;

    move-result-object v4

    .line 533
    invoke-static {v1, v3, v4}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$800(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 535
    return-void

    .line 529
    .end local v0    # "e":Ljava/security/cert/CertificateException;
    :cond_2
    move-object/from16 v19, v2

    .line 542
    .end local v2    # "signedDataCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .local v19, "signedDataCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    :goto_2
    :try_start_4
    iget-object v5, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSigFileBytes:[B
    :try_end_4
    .catch Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException; {:try_start_4 .. :try_end_4} :catch_6
    .catch Ljava/security/InvalidKeyException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/security/SignatureException; {:try_start_4 .. :try_end_4} :catch_4

    .line 543
    move-object/from16 v1, p0

    move-object v2, v13

    move-object/from16 v3, v19

    move-object/from16 v4, v18

    move/from16 v6, p4

    move-object v9, v7

    .end local v7    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .local v9, "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    move/from16 v7, p5

    :try_start_5
    invoke-direct/range {v1 .. v7}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->verifySignerInfoAgainstSigFile(Lcom/android/apksig/internal/pkcs7/SignedData;Ljava/util/Collection;Lcom/android/apksig/internal/pkcs7/SignerInfo;[BII)Ljava/security/cert/X509Certificate;

    move-result-object v0

    .line 550
    .local v0, "signingCertificate":Ljava/security/cert/X509Certificate;
    iget-object v1, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    invoke-static {v1}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$600(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;)Z

    move-result v1
    :try_end_5
    .catch Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/security/InvalidKeyException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/security/SignatureException; {:try_start_5 .. :try_end_5} :catch_1

    if-eqz v1, :cond_3

    .line 551
    return-void

    .line 553
    :cond_3
    if-eqz v0, :cond_4

    .line 555
    if-nez v17, :cond_4

    .line 556
    move-object/from16 v1, v18

    .line 557
    .end local v17    # "firstVerifiedSignerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    .local v1, "firstVerifiedSignerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    move-object v2, v0

    move-object/from16 v17, v1

    move-object v7, v2

    .end local v9    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .local v2, "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    goto :goto_3

    .line 571
    .end local v1    # "firstVerifiedSignerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    .end local v2    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .restart local v9    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .restart local v17    # "firstVerifiedSignerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    :cond_4
    move-object v7, v9

    .end local v9    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .restart local v7    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    :goto_3
    nop

    .line 572
    .end local v0    # "signingCertificate":Ljava/security/cert/X509Certificate;
    .end local v18    # "unverifiedSignerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    move-object/from16 v9, p1

    move-object/from16 v2, v19

    goto :goto_1

    .line 564
    .end local v7    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .restart local v9    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .restart local v18    # "unverifiedSignerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    :catch_1
    move-exception v0

    goto :goto_5

    :catch_2
    move-exception v0

    goto :goto_5

    .line 560
    :catch_3
    move-exception v0

    goto :goto_6

    .line 564
    .end local v9    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .restart local v7    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    :catch_4
    move-exception v0

    goto :goto_4

    :catch_5
    move-exception v0

    :goto_4
    move-object v9, v7

    .line 565
    .end local v7    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .local v0, "e":Ljava/security/GeneralSecurityException;
    .restart local v9    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    :goto_5
    iget-object v1, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v3, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureBlockEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 567
    invoke-virtual {v3}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 568
    invoke-virtual {v4}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v3, v4, v0}, [Ljava/lang/Object;

    move-result-object v3

    .line 565
    invoke-static {v1, v2, v3}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$800(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 570
    return-void

    .line 560
    .end local v0    # "e":Ljava/security/GeneralSecurityException;
    .end local v9    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .restart local v7    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    :catch_6
    move-exception v0

    move-object v9, v7

    .line 561
    .end local v7    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .local v0, "e":Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException;
    .restart local v9    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    :goto_6
    iget-object v1, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_PARSE_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v3, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureBlockEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 562
    invoke-virtual {v3}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3, v0}, [Ljava/lang/Object;

    move-result-object v3

    .line 561
    invoke-static {v1, v2, v3}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$800(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 563
    return-void

    .line 573
    .end local v0    # "e":Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException;
    .end local v9    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .end local v18    # "unverifiedSignerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    .end local v19    # "signedDataCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .local v2, "signedDataCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .restart local v7    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    :cond_5
    move-object v9, v7

    .end local v7    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .restart local v9    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    if-nez v17, :cond_6

    .line 575
    iget-object v0, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v1, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v3, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureBlockEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 577
    invoke-virtual {v3}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 578
    invoke-virtual {v4}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    .line 575
    invoke-static {v0, v1, v3}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$800(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 579
    return-void

    .line 582
    :cond_6
    nop

    .line 583
    invoke-static {v2, v9}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->getCertificateChain(Ljava/util/List;Ljava/security/cert/X509Certificate;)Ljava/util/List;

    move-result-object v0

    .line 585
    .local v0, "signingCertChain":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    iget-object v1, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    iget-object v1, v1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->certChain:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 586
    iget-object v1, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    iget-object v1, v1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->certChain:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 587
    return-void

    .line 495
    .end local v2    # "signedDataCertificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .end local v9    # "firstVerifiedSignerInfoSigningCertificate":Ljava/security/cert/X509Certificate;
    .end local v13    # "signedData":Lcom/android/apksig/internal/pkcs7/SignedData;
    .end local v15    # "unverifiedSignerInfosToTry":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/pkcs7/SignerInfo;>;"
    .end local v17    # "firstVerifiedSignerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    .local v0, "contentInfo":Lcom/android/apksig/internal/pkcs7/ContentInfo;
    :cond_7
    move/from16 v14, p4

    :try_start_6
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported ContentInfo.contentType: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/android/apksig/internal/pkcs7/ContentInfo;->contentType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    .end local v12    # "sigBlockBytes":[B
    .end local p1    # "apk":Lcom/android/apksig/util/DataSource;
    .end local p2    # "cdStartOffset":J
    .end local p4    # "minSdkVersion":I
    .end local p5    # "maxSdkVersion":I
    throw v1
    :try_end_6
    .catch Lcom/android/apksig/internal/asn1/Asn1DecodingException; {:try_start_6 .. :try_end_6} :catch_7

    .line 500
    .end local v0    # "contentInfo":Lcom/android/apksig/internal/pkcs7/ContentInfo;
    .restart local v12    # "sigBlockBytes":[B
    .restart local p1    # "apk":Lcom/android/apksig/util/DataSource;
    .restart local p2    # "cdStartOffset":J
    .restart local p4    # "minSdkVersion":I
    .restart local p5    # "maxSdkVersion":I
    :catch_7
    move-exception v0

    goto :goto_7

    :catch_8
    move-exception v0

    move/from16 v14, p4

    .line 501
    .local v0, "e":Lcom/android/apksig/internal/asn1/Asn1DecodingException;
    :goto_7
    invoke-virtual {v0}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;->printStackTrace()V

    .line 502
    iget-object v1, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_PARSE_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v3, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureBlockEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 503
    invoke-virtual {v3}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3, v0}, [Ljava/lang/Object;

    move-result-object v3

    .line 502
    invoke-static {v1, v2, v3}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$800(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 504
    return-void

    .line 484
    .end local v0    # "e":Lcom/android/apksig/internal/asn1/Asn1DecodingException;
    :catch_9
    move-exception v0

    move/from16 v14, p4

    .line 485
    .local v0, "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v2, Lcom/android/apksig/apk/ApkFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 486
    invoke-virtual {v3}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 475
    .end local v0    # "e":Lcom/android/apksig/zip/ZipFormatException;
    .end local v12    # "sigBlockBytes":[B
    :catch_a
    move-exception v0

    move/from16 v14, p4

    .line 476
    .restart local v0    # "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v2, Lcom/android/apksig/apk/ApkFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureBlockEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 477
    invoke-virtual {v3}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public verifySigFileAgainstManifest([BLcom/android/apksig/internal/jar/ManifestParser$Section;Ljava/util/Map;Ljava/util/Map;Ljava/util/Set;II)V
    .locals 23
    .param p1, "manifestBytes"    # [B
    .param p2, "manifestMainSection"    # Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .param p6, "minSdkVersion"    # I
    .param p7, "maxSdkVersion"    # I
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
            "manifestBytes",
            "manifestMainSection",
            "entryNameToManifestSection",
            "supportedApkSigSchemeNames",
            "foundApkSigSchemeIds",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Lcom/android/apksig/internal/jar/ManifestParser$Section;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/android/apksig/internal/jar/ManifestParser$Section;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;II)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 835
    .local p3, "entryNameToManifestSection":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/android/apksig/internal/jar/ManifestParser$Section;>;"
    .local p4, "supportedApkSigSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    .local p5, "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    move-object/from16 v7, p0

    new-instance v0, Lcom/android/apksig/internal/jar/ManifestParser;

    iget-object v1, v7, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSigFileBytes:[B

    invoke-direct {v0, v1}, Lcom/android/apksig/internal/jar/ManifestParser;-><init>([B)V

    move-object v8, v0

    .line 836
    .local v8, "sf":Lcom/android/apksig/internal/jar/ManifestParser;
    invoke-virtual {v8}, Lcom/android/apksig/internal/jar/ManifestParser;->readSection()Lcom/android/apksig/internal/jar/ManifestParser$Section;

    move-result-object v9

    .line 837
    .local v9, "sfMainSection":Lcom/android/apksig/internal/jar/ManifestParser$Section;
    sget-object v0, Ljava/util/jar/Attributes$Name;->SIGNATURE_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v9, v0}, Lcom/android/apksig/internal/jar/ManifestParser$Section;->getAttributeValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 838
    iget-object v0, v7, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v1, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MISSING_VERSION_ATTR_IN_SIG_FILE:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v2, v7, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 840
    invoke-virtual {v2}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 838
    invoke-static {v0, v1, v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$800(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 841
    invoke-virtual/range {p0 .. p0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->setIgnored()V

    .line 842
    return-void

    .line 845
    :cond_0
    const/16 v0, 0x18

    move/from16 v10, p7

    if-lt v10, v0, :cond_1

    .line 849
    move-object/from16 v11, p4

    move-object/from16 v12, p5

    invoke-direct {v7, v9, v11, v12}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->checkForStrippedApkSignatures(Lcom/android/apksig/internal/jar/ManifestParser$Section;Ljava/util/Map;Ljava/util/Set;)V

    .line 851
    iget-object v0, v7, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    invoke-static {v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$600(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 852
    return-void

    .line 845
    :cond_1
    move-object/from16 v11, p4

    move-object/from16 v12, p5

    .line 856
    :cond_2
    const/4 v0, 0x0

    .line 857
    .local v0, "createdBySigntool":Z
    const-string v1, "Created-By"

    invoke-virtual {v9, v1}, Lcom/android/apksig/internal/jar/ManifestParser$Section;->getAttributeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 858
    .local v13, "createdBy":Ljava/lang/String;
    if-eqz v13, :cond_4

    .line 859
    const-string v1, "signtool"

    invoke-virtual {v13, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_3

    const/4 v1, 0x1

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    :goto_0
    move v0, v1

    move v14, v0

    goto :goto_1

    .line 858
    :cond_4
    move v14, v0

    .line 861
    .end local v0    # "createdBySigntool":Z
    .local v14, "createdBySigntool":Z
    :goto_1
    nop

    .line 862
    move-object/from16 v0, p0

    move-object v1, v9

    move v2, v14

    move-object/from16 v3, p1

    move/from16 v4, p6

    move/from16 v5, p7

    invoke-direct/range {v0 .. v5}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->verifyManifestDigest(Lcom/android/apksig/internal/jar/ManifestParser$Section;Z[BII)Z

    move-result v15

    .line 868
    .local v15, "manifestDigestVerified":Z
    if-nez v14, :cond_5

    .line 869
    move-object/from16 v0, p0

    move-object v1, v9

    move-object/from16 v2, p2

    move-object/from16 v3, p1

    move/from16 v4, p6

    move/from16 v5, p7

    invoke-direct/range {v0 .. v5}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->verifyManifestMainSectionDigest(Lcom/android/apksig/internal/jar/ManifestParser$Section;Lcom/android/apksig/internal/jar/ManifestParser$Section;[BII)V

    .line 876
    :cond_5
    iget-object v0, v7, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    invoke-static {v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$600(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 877
    return-void

    .line 883
    :cond_6
    invoke-virtual {v8}, Lcom/android/apksig/internal/jar/ManifestParser;->readAllSections()Ljava/util/List;

    move-result-object v16

    .line 884
    .local v16, "sfSections":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/jar/ManifestParser$Section;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-interface/range {v16 .. v16}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    move-object v6, v0

    .line 885
    .local v6, "sfEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 886
    .local v0, "sfSectionNumber":I
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_2
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Lcom/android/apksig/internal/jar/ManifestParser$Section;

    .line 887
    .local v18, "sfSection":Lcom/android/apksig/internal/jar/ManifestParser$Section;
    add-int/lit8 v19, v0, 0x1

    .line 888
    .end local v0    # "sfSectionNumber":I
    .local v19, "sfSectionNumber":I
    invoke-virtual/range {v18 .. v18}, Lcom/android/apksig/internal/jar/ManifestParser$Section;->getName()Ljava/lang/String;

    move-result-object v5

    .line 889
    .local v5, "entryName":Ljava/lang/String;
    if-nez v5, :cond_7

    .line 890
    iget-object v0, v7, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v1, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_UNNNAMED_SIG_FILE_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v2, v7, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 892
    invoke-virtual {v2}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v2

    .line 893
    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    .line 890
    invoke-static {v0, v1, v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$800(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 894
    invoke-virtual/range {p0 .. p0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->setIgnored()V

    .line 895
    return-void

    .line 897
    :cond_7
    invoke-interface {v6, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 898
    iget-object v0, v7, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v1, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_DUPLICATE_SIG_FILE_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v2, v7, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 900
    invoke-virtual {v2}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2, v5}, [Ljava/lang/Object;

    move-result-object v2

    .line 898
    invoke-static {v0, v1, v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$800(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 902
    invoke-virtual/range {p0 .. p0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->setIgnored()V

    .line 903
    return-void

    .line 905
    :cond_8
    if-eqz v15, :cond_9

    .line 908
    move-object/from16 v22, v8

    move-object v8, v6

    goto :goto_3

    .line 912
    :cond_9
    move-object/from16 v4, p3

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v20, v0

    check-cast v20, Lcom/android/apksig/internal/jar/ManifestParser$Section;

    .line 913
    .local v20, "manifestSection":Lcom/android/apksig/internal/jar/ManifestParser$Section;
    if-nez v20, :cond_a

    .line 914
    iget-object v0, v7, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mResult:Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    sget-object v1, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_ZIP_ENTRY_DIGEST_IN_SIG_FILE:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v2, v7, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSignatureFileEntry:Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 917
    invoke-virtual {v2}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v5, v2}, [Ljava/lang/Object;

    move-result-object v2

    .line 914
    invoke-static {v0, v1, v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$800(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 918
    invoke-virtual/range {p0 .. p0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->setIgnored()V

    .line 919
    move-object/from16 v22, v8

    move-object v8, v6

    goto :goto_3

    .line 921
    :cond_a
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move v2, v14

    move-object/from16 v3, v20

    move-object/from16 v4, p1

    move-object/from16 v21, v5

    .end local v5    # "entryName":Ljava/lang/String;
    .local v21, "entryName":Ljava/lang/String;
    move/from16 v5, p6

    move-object/from16 v22, v8

    move-object v8, v6

    .end local v6    # "sfEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local v8, "sfEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local v22, "sf":Lcom/android/apksig/internal/jar/ManifestParser;
    move/from16 v6, p7

    invoke-direct/range {v0 .. v6}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->verifyManifestIndividualSectionDigest(Lcom/android/apksig/internal/jar/ManifestParser$Section;ZLcom/android/apksig/internal/jar/ManifestParser$Section;[BII)V

    .line 928
    .end local v18    # "sfSection":Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .end local v20    # "manifestSection":Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .end local v21    # "entryName":Ljava/lang/String;
    nop

    .line 886
    .end local v22    # "sf":Lcom/android/apksig/internal/jar/ManifestParser;
    .restart local v6    # "sfEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local v8, "sf":Lcom/android/apksig/internal/jar/ManifestParser;
    :goto_3
    move-object v6, v8

    move/from16 v0, v19

    move-object/from16 v8, v22

    .end local v6    # "sfEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local v8, "sfEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v22    # "sf":Lcom/android/apksig/internal/jar/ManifestParser;
    goto/16 :goto_2

    .line 929
    .end local v19    # "sfSectionNumber":I
    .end local v22    # "sf":Lcom/android/apksig/internal/jar/ManifestParser;
    .restart local v0    # "sfSectionNumber":I
    .restart local v6    # "sfEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local v8, "sf":Lcom/android/apksig/internal/jar/ManifestParser;
    :cond_b
    move-object/from16 v22, v8

    move-object v8, v6

    .end local v6    # "sfEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local v8, "sfEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v22    # "sf":Lcom/android/apksig/internal/jar/ManifestParser;
    iput-object v8, v7, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->mSigFileEntryNames:Ljava/util/Set;

    .line 930
    return-void
.end method
