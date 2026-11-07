.class public abstract Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;
.super Ljava/lang/Object;
.source "V1SchemeVerifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;,
        Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signers;,
        Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;,
        Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;,
        Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$ObjectIdentifierChoice;,
        Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$OctetStringChoice;,
        Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$SignedAttributes;
    }
.end annotation


# static fields
.field private static final JB_MR2_AND_NEWER_DIGEST_ALGS:[Ljava/lang/String;

.field private static final MIN_SDK_VESION_FROM_WHICH_DIGEST_SUPPORTED_IN_MANIFEST:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final UPPER_CASE_JCA_DIGEST_ALG_TO_CANONICAL:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1199
    const-string v0, "SHA-512"

    const-string v1, "SHA-384"

    const-string v2, "SHA-256"

    const-string v3, "SHA-1"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->JB_MR2_AND_NEWER_DIGEST_ALGS:[Ljava/lang/String;

    .line 1229
    new-instance v4, Ljava/util/HashMap;

    const/16 v5, 0x8

    invoke-direct {v4, v5}, Ljava/util/HashMap;-><init>(I)V

    sput-object v4, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->UPPER_CASE_JCA_DIGEST_ALG_TO_CANONICAL:Ljava/util/Map;

    .line 1230
    const-string v5, "MD5"

    invoke-interface {v4, v5, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1231
    const-string v6, "SHA"

    invoke-interface {v4, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1232
    const-string v6, "SHA1"

    invoke-interface {v4, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1233
    invoke-interface {v4, v3, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1234
    invoke-interface {v4, v2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1235
    invoke-interface {v4, v1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1236
    invoke-interface {v4, v0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1242
    new-instance v4, Ljava/util/HashMap;

    const/4 v6, 0x5

    invoke-direct {v4, v6}, Ljava/util/HashMap;-><init>(I)V

    sput-object v4, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->MIN_SDK_VESION_FROM_WHICH_DIGEST_SUPPORTED_IN_MANIFEST:Ljava/util/Map;

    .line 1243
    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1244
    invoke-interface {v4, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1245
    invoke-interface {v4, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1246
    nop

    .line 1247
    const/16 v2, 0x9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 1246
    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1248
    nop

    .line 1249
    nop

    .line 1248
    invoke-interface {v4, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1250
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$1000(Ljava/lang/String;[B)[B
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 89
    invoke-static {p0, p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->digest(Ljava/lang/String;[B)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1100(Ljava/lang/String;[BII)[B
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # [B
    .param p2, "x2"    # I
    .param p3, "x3"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 89
    invoke-static {p0, p1, p2, p3}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->digest(Ljava/lang/String;[BII)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/apksig/util/DataSource;JLjava/util/Collection;Ljava/util/Map;Ljava/util/List;IILcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/util/DataSource;
    .param p1, "x1"    # J
    .param p3, "x2"    # Ljava/util/Collection;
    .param p4, "x3"    # Ljava/util/Map;
    .param p5, "x4"    # Ljava/util/List;
    .param p6, "x5"    # I
    .param p7, "x6"    # I
    .param p8, "x7"    # Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 89
    invoke-static/range {p0 .. p8}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->verifyJarEntriesAgainstManifestAndSigners(Lcom/android/apksig/util/DataSource;JLjava/util/Collection;Ljava/util/Map;Ljava/util/List;IILcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method private static checkForDuplicateEntries(Ljava/util/List;Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)Ljava/util/Set;
    .locals 7
    .param p1, "result"    # Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "cdRecords",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/zip/CentralDirectoryRecord;",
            ">;",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 151
    .local p0, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 152
    .local v0, "cdEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 153
    .local v1, "duplicateCdEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 154
    .local v3, "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    invoke-virtual {v3}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v4

    .line 155
    .local v4, "entryName":Ljava/lang/String;
    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 157
    if-nez v1, :cond_0

    .line 158
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    move-object v1, v5

    .line 160
    :cond_0
    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 161
    sget-object v5, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_DUPLICATE_ZIP_ENTRY:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v6

    invoke-static {p1, v5, v6}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$200(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 164
    .end local v3    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v4    # "entryName":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 165
    :cond_2
    return-object v0
.end method

.method private static digest(Ljava/lang/String;[B)[B
    .locals 1
    .param p0, "algorithm"    # Ljava/lang/String;
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "algorithm",
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 1408
    invoke-static {p0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->getMessageDigest(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    return-object v0
.end method

.method private static digest(Ljava/lang/String;[BII)[B
    .locals 2
    .param p0, "algorithm"    # Ljava/lang/String;
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "algorithm",
            "data",
            "offset",
            "length"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 1402
    invoke-static {p0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->getMessageDigest(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 1403
    .local v0, "md":Ljava/security/MessageDigest;
    invoke-virtual {v0, p1, p2, p3}, Ljava/security/MessageDigest;->update([BII)V

    .line 1404
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    return-object v1
.end method

.method private static getCanonicalJcaMessageDigestAlgorithm(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "algorithm"
        }
    .end annotation

    .line 1207
    sget-object v0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->UPPER_CASE_JCA_DIGEST_ALG_TO_CANONICAL:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method private static getDigest(Ljava/util/Collection;Ljava/lang/String;)[B
    .locals 3
    .param p1, "jcaDigestAlgorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "digests",
            "jcaDigestAlgorithm"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;",
            ">;",
            "Ljava/lang/String;",
            ")[B"
        }
    .end annotation

    .line 1253
    .local p0, "digests":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;

    .line 1254
    .local v1, "digest":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;
    iget-object v2, v1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;->jcaDigestAlgorithm:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1255
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;->digest:[B

    return-object v0

    .line 1257
    .end local v1    # "digest":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;
    :cond_0
    goto :goto_0

    .line 1258
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getDigestsToVerify(Lcom/android/apksig/internal/jar/ManifestParser$Section;Ljava/lang/String;II)Ljava/util/Collection;
    .locals 11
    .param p0, "section"    # Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .param p1, "digestAttrSuffix"    # Ljava/lang/String;
    .param p2, "minSdkVersion"    # I
    .param p3, "maxSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "section",
            "digestAttrSuffix",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/internal/jar/ManifestParser$Section;",
            "Ljava/lang/String;",
            "II)",
            "Ljava/util/Collection<",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;",
            ">;"
        }
    .end annotation

    .line 1139
    invoke-static {}, Ljava/util/Base64;->getDecoder()Ljava/util/Base64$Decoder;

    move-result-object v0

    .line 1140
    .local v0, "base64Decoder":Ljava/util/Base64$Decoder;
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 1141
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    const/4 v2, 0x0

    const/16 v3, 0x12

    if-ge p2, v3, :cond_5

    .line 1147
    const-string v4, "Digest-Algorithms"

    invoke-virtual {p0, v4}, Lcom/android/apksig/internal/jar/ManifestParser$Section;->getAttributeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1148
    .local v4, "algs":Ljava/lang/String;
    if-nez v4, :cond_0

    .line 1149
    const-string v4, "SHA SHA1"

    .line 1151
    :cond_0
    new-instance v5, Ljava/util/StringTokenizer;

    invoke-direct {v5, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 1152
    .local v5, "tokens":Ljava/util/StringTokenizer;
    :cond_1
    :goto_0
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 1153
    invoke-virtual {v5}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v6

    .line 1154
    .local v6, "alg":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 1155
    .local v7, "attrName":Ljava/lang/String;
    invoke-virtual {p0, v7}, Lcom/android/apksig/internal/jar/ManifestParser$Section;->getAttributeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1156
    .local v8, "digestBase64":Ljava/lang/String;
    if-nez v8, :cond_2

    .line 1158
    goto :goto_0

    .line 1160
    :cond_2
    invoke-static {v6}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->getCanonicalJcaMessageDigestAlgorithm(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1161
    if-eqz v6, :cond_1

    .line 1162
    invoke-static {v6}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->getMinSdkVersionFromWhichSupportedInManifestOrSignatureFile(Ljava/lang/String;)I

    move-result v9

    if-le v9, p2, :cond_3

    .line 1165
    goto :goto_0

    .line 1168
    :cond_3
    new-instance v9, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;

    invoke-virtual {v0, v8}, Ljava/util/Base64$Decoder;->decode(Ljava/lang/String;)[B

    move-result-object v10

    invoke-direct {v9, v6, v10, v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;-><init>(Ljava/lang/String;[BLcom/android/apksig/internal/apk/v1/V1SchemeVerifier$1;)V

    invoke-interface {v1, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1169
    nop

    .line 1172
    .end local v6    # "alg":Ljava/lang/String;
    .end local v7    # "attrName":Ljava/lang/String;
    .end local v8    # "digestBase64":Ljava/lang/String;
    :cond_4
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 1173
    return-object v1

    .line 1177
    .end local v4    # "algs":Ljava/lang/String;
    .end local v5    # "tokens":Ljava/util/StringTokenizer;
    :cond_5
    if-lt p3, v3, :cond_8

    .line 1180
    sget-object v3, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->JB_MR2_AND_NEWER_DIGEST_ALGS:[Ljava/lang/String;

    array-length v4, v3

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v4, :cond_8

    aget-object v6, v3, v5

    .line 1181
    .restart local v6    # "alg":Ljava/lang/String;
    invoke-static {v6, p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->getJarDigestAttributeName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1182
    .restart local v7    # "attrName":Ljava/lang/String;
    invoke-virtual {p0, v7}, Lcom/android/apksig/internal/jar/ManifestParser$Section;->getAttributeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1183
    .restart local v8    # "digestBase64":Ljava/lang/String;
    if-nez v8, :cond_6

    .line 1185
    nop

    .line 1180
    .end local v6    # "alg":Ljava/lang/String;
    .end local v7    # "attrName":Ljava/lang/String;
    .end local v8    # "digestBase64":Ljava/lang/String;
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1187
    .restart local v6    # "alg":Ljava/lang/String;
    .restart local v7    # "attrName":Ljava/lang/String;
    .restart local v8    # "digestBase64":Ljava/lang/String;
    :cond_6
    invoke-virtual {v0, v8}, Ljava/util/Base64$Decoder;->decode(Ljava/lang/String;)[B

    move-result-object v3

    .line 1188
    .local v3, "digest":[B
    invoke-static {v1, v6}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->getDigest(Ljava/util/Collection;Ljava/lang/String;)[B

    move-result-object v4

    .line 1189
    .local v4, "digestInResult":[B
    if-eqz v4, :cond_7

    invoke-static {v4, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v5

    if-nez v5, :cond_8

    .line 1190
    :cond_7
    new-instance v5, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;

    invoke-direct {v5, v6, v3, v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;-><init>(Ljava/lang/String;[BLcom/android/apksig/internal/apk/v1/V1SchemeVerifier$1;)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1196
    .end local v3    # "digest":[B
    .end local v4    # "digestInResult":[B
    .end local v6    # "alg":Ljava/lang/String;
    .end local v7    # "attrName":Ljava/lang/String;
    .end local v8    # "digestBase64":Ljava/lang/String;
    :cond_8
    return-object v1
.end method

.method private static getJarDigestAttributeName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "jcaDigestAlgorithm"    # Ljava/lang/String;
    .param p1, "attrNameSuffix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "jcaDigestAlgorithm",
            "attrNameSuffix"
        }
    .end annotation

    .line 1220
    const-string v0, "SHA-1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1221
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SHA1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 1223
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getMessageDigest(Ljava/lang/String;)Ljava/security/MessageDigest;
    .locals 1
    .param p0, "algorithm"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "algorithm"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 1397
    invoke-static {p0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    return-object v0
.end method

.method public static getMinSdkVersionFromWhichSupportedInManifestOrSignatureFile(Ljava/lang/String;)I
    .locals 2
    .param p0, "jcaAlgorithmName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "jcaAlgorithmName"
        }
    .end annotation

    .line 1212
    sget-object v0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->MIN_SDK_VESION_FROM_WHICH_DIGEST_SUPPORTED_IN_MANIFEST:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 1214
    invoke-virtual {p0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 1213
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 1215
    .local v0, "result":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_0

    :cond_0
    const v1, 0x7fffffff

    :goto_0
    return v1
.end method

.method private static getSignerNames(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signers"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1385
    .local p0, "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1386
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 1388
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1389
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;

    .line 1390
    .local v2, "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;
    invoke-virtual {v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1391
    .end local v2    # "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;
    goto :goto_0

    .line 1392
    :cond_1
    return-object v0
.end method

.method private static isJarEntryDigestNeededInManifest(Ljava/lang/String;)Z
    .locals 1
    .param p0, "entryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entryName"
        }
    .end annotation

    .line 1277
    const-string v0, "META-INF/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1278
    const/4 v0, 0x0

    return v0

    .line 1280
    :cond_0
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static parseManifest([BLjava/util/Set;Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)Lcom/android/apksig/internal/util/Pair;
    .locals 10
    .param p0, "manifestBytes"    # [B
    .param p2, "result"    # Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "manifestBytes",
            "cdEntryNames",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;",
            ")",
            "Lcom/android/apksig/internal/util/Pair<",
            "Lcom/android/apksig/internal/jar/ManifestParser$Section;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/android/apksig/internal/jar/ManifestParser$Section;",
            ">;>;"
        }
    .end annotation

    .line 180
    .local p1, "cdEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v0, Lcom/android/apksig/internal/jar/ManifestParser;

    invoke-direct {v0, p0}, Lcom/android/apksig/internal/jar/ManifestParser;-><init>([B)V

    .line 181
    .local v0, "manifest":Lcom/android/apksig/internal/jar/ManifestParser;
    invoke-virtual {v0}, Lcom/android/apksig/internal/jar/ManifestParser;->readSection()Lcom/android/apksig/internal/jar/ManifestParser$Section;

    move-result-object v1

    .line 182
    .local v1, "manifestMainSection":Lcom/android/apksig/internal/jar/ManifestParser$Section;
    invoke-virtual {v0}, Lcom/android/apksig/internal/jar/ManifestParser;->readAllSections()Ljava/util/List;

    move-result-object v2

    .line 183
    .local v2, "manifestIndividualSections":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/jar/ManifestParser$Section;>;"
    new-instance v3, Ljava/util/HashMap;

    .line 184
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(I)V

    .line 185
    .local v3, "entryNameToManifestSection":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/android/apksig/internal/jar/ManifestParser$Section;>;"
    const/4 v4, 0x0

    .line 186
    .local v4, "manifestSectionNumber":I
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/internal/jar/ManifestParser$Section;

    .line 187
    .local v6, "manifestSection":Lcom/android/apksig/internal/jar/ManifestParser$Section;
    add-int/lit8 v4, v4, 0x1

    .line 188
    invoke-virtual {v6}, Lcom/android/apksig/internal/jar/ManifestParser$Section;->getName()Ljava/lang/String;

    move-result-object v7

    .line 189
    .local v7, "entryName":Ljava/lang/String;
    if-nez v7, :cond_0

    .line 190
    sget-object v8, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_UNNNAMED_MANIFEST_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v9

    invoke-static {p2, v8, v9}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$200(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 191
    goto :goto_0

    .line 193
    :cond_0
    invoke-interface {v3, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_1

    .line 194
    sget-object v8, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_DUPLICATE_MANIFEST_SECTION:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v9

    invoke-static {p2, v8, v9}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$200(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 195
    goto :goto_0

    .line 197
    :cond_1
    invoke-interface {p1, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 198
    sget-object v8, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MISSING_ZIP_ENTRY_REFERENCED_IN_MANIFEST:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v9

    invoke-static {p2, v8, v9}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$200(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 200
    goto :goto_0

    .line 202
    .end local v6    # "manifestSection":Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .end local v7    # "entryName":Ljava/lang/String;
    :cond_2
    goto :goto_0

    .line 203
    :cond_3
    invoke-static {v1, v3}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v5

    return-object v5
.end method

.method public static parseZipCentralDirectory(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/util/List;
    .locals 1
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "apkSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apk",
            "apkSections"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/apk/ApkUtils$ZipSections;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/zip/CentralDirectoryRecord;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 1265
    invoke-static {p0, p1}, Lcom/android/apksig/internal/zip/ZipUtils;->parseZipCentralDirectory(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/zip/ZipSections;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static verify(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;Ljava/util/Map;Ljava/util/Set;II)Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;
    .locals 15
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "apkSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .param p4, "minSdkVersion"    # I
    .param p5, "maxSdkVersion"    # I
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
            "apk",
            "apkSections",
            "supportedApkSigSchemeNames",
            "foundApkSigSchemeIds",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/apk/ApkUtils$ZipSections;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;II)",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 115
    .local p2, "supportedApkSigSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    .local p3, "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    move/from16 v10, p4

    move/from16 v11, p5

    if-gt v10, v11, :cond_1

    .line 121
    new-instance v0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;

    invoke-direct {v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;-><init>()V

    move-object v12, v0

    .line 124
    .local v12, "result":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;
    invoke-static/range {p0 .. p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->parseZipCentralDirectory(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/util/List;

    move-result-object v13

    .line 125
    .local v13, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    invoke-static {v13, v12}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->checkForDuplicateEntries(Ljava/util/List;Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)Ljava/util/Set;

    move-result-object v14

    .line 126
    .local v14, "cdEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-static {v12}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$000(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 127
    return-object v12

    .line 131
    :cond_0
    nop

    .line 133
    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/apk/ApkUtils$ZipSections;->getZipCentralDirectoryOffset()J

    move-result-wide v1

    .line 131
    move-object v0, p0

    move-object v3, v13

    move-object v4, v14

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move/from16 v7, p4

    move/from16 v8, p5

    move-object v9, v12

    invoke-static/range {v0 .. v9}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signers;->access$100(Lcom/android/apksig/util/DataSource;JLjava/util/List;Ljava/util/Set;Ljava/util/Map;Ljava/util/Set;IILcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)V

    .line 142
    return-object v12

    .line 116
    .end local v12    # "result":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;
    .end local v13    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v14    # "cdEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "minSdkVersion ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") > maxSdkVersion ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static verifyJarEntriesAgainstManifestAndSigners(Lcom/android/apksig/util/DataSource;JLjava/util/Collection;Ljava/util/Map;Ljava/util/List;IILcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)Ljava/util/Set;
    .locals 21
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "cdOffsetInApk"    # J
    .param p6, "minSdkVersion"    # I
    .param p7, "maxSdkVersion"    # I
    .param p8, "result"    # Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
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
            "cdOffsetInApk",
            "cdRecords",
            "entryNameToManifestSection",
            "signers",
            "minSdkVersion",
            "maxSdkVersion",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/DataSource;",
            "J",
            "Ljava/util/Collection<",
            "Lcom/android/apksig/internal/zip/CentralDirectoryRecord;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/android/apksig/internal/jar/ManifestParser$Section;",
            ">;",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;",
            ">;II",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;",
            ")",
            "Ljava/util/Set<",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 1293
    .local p3, "cdRecords":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .local p4, "entryNameToManifestSection":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/android/apksig/internal/jar/ManifestParser$Section;>;"
    .local p5, "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    move-object/from16 v1, p8

    new-instance v0, Ljava/util/ArrayList;

    move-object/from16 v2, p3

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v3, v0

    .line 1295
    .local v3, "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    sget-object v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->BY_LOCAL_FILE_HEADER_OFFSET_COMPARATOR:Ljava/util/Comparator;

    invoke-static {v3, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1298
    const/4 v0, 0x0

    .line 1299
    .local v0, "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    const/4 v4, 0x0

    .line 1300
    .local v4, "firstSignedEntryName":Ljava/lang/String;
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 1301
    .local v6, "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    invoke-virtual {v6}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v7

    .line 1302
    .local v7, "entryName":Ljava/lang/String;
    invoke-static {v7}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->isJarEntryDigestNeededInManifest(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 1303
    move-object/from16 v8, p4

    goto :goto_0

    .line 1306
    :cond_0
    move-object/from16 v8, p4

    invoke-interface {v8, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/apksig/internal/jar/ManifestParser$Section;

    .line 1307
    .local v9, "manifestSection":Lcom/android/apksig/internal/jar/ManifestParser$Section;
    if-nez v9, :cond_1

    .line 1308
    sget-object v10, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_ZIP_ENTRY_DIGEST_IN_MANIFEST:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v11

    invoke-static {v1, v10, v11}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$200(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 1309
    goto :goto_0

    .line 1312
    :cond_1
    new-instance v10, Ljava/util/ArrayList;

    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v11

    invoke-direct {v10, v11}, Ljava/util/ArrayList;-><init>(I)V

    .line 1313
    .local v10, "entrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;

    .line 1314
    .local v12, "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;
    invoke-virtual {v12}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->getSigFileEntryNames()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 1315
    invoke-interface {v10, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1317
    .end local v12    # "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;
    :cond_2
    goto :goto_1

    .line 1318
    :cond_3
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_4

    .line 1319
    sget-object v11, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_ZIP_ENTRY_NOT_SIGNED:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v12

    invoke-static {v1, v11, v12}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$200(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 1320
    goto :goto_0

    .line 1322
    :cond_4
    if-nez v0, :cond_5

    .line 1323
    move-object v0, v10

    .line 1324
    move-object v4, v7

    move-object v11, v4

    move-object v4, v0

    goto :goto_2

    .line 1325
    :cond_5
    invoke-virtual {v10, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_6

    .line 1326
    sget-object v11, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_ZIP_ENTRY_SIGNERS_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    .line 1329
    invoke-static {v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->getSignerNames(Ljava/util/List;)Ljava/util/List;

    move-result-object v12

    .line 1331
    invoke-static {v10}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->getSignerNames(Ljava/util/List;)Ljava/util/List;

    move-result-object v13

    filled-new-array {v4, v12, v7, v13}, [Ljava/lang/Object;

    move-result-object v12

    .line 1326
    invoke-static {v1, v11, v12}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$200(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 1332
    goto/16 :goto_0

    .line 1325
    :cond_6
    move-object v11, v4

    move-object v4, v0

    .line 1335
    .end local v0    # "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .local v4, "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .local v11, "firstSignedEntryName":Ljava/lang/String;
    :goto_2
    new-instance v0, Ljava/util/ArrayList;

    .line 1337
    const-string v12, "-Digest"

    move/from16 v13, p6

    move/from16 v14, p7

    invoke-static {v9, v12, v13, v14}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->getDigestsToVerify(Lcom/android/apksig/internal/jar/ManifestParser$Section;Ljava/lang/String;II)Ljava/util/Collection;

    move-result-object v12

    invoke-direct {v0, v12}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v12, v0

    .line 1339
    .local v12, "expectedDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1340
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_ZIP_ENTRY_DIGEST_IN_MANIFEST:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v15

    invoke-static {v1, v0, v15}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$200(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 1341
    move-object/from16 v16, v3

    move-object/from16 v17, v4

    move-object/from16 v18, v5

    goto/16 :goto_6

    .line 1344
    :cond_7
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v0

    new-array v15, v0, [Ljava/security/MessageDigest;

    .line 1345
    .local v15, "mds":[Ljava/security/MessageDigest;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_8

    .line 1346
    invoke-interface {v12, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;

    iget-object v2, v2, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;->jcaDigestAlgorithm:Ljava/lang/String;

    invoke-static {v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->getMessageDigest(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    aput-object v2, v15, v0

    .line 1345
    add-int/lit8 v0, v0, 0x1

    move-object/from16 v2, p3

    goto :goto_3

    .line 1350
    .end local v0    # "i":I
    :cond_8
    nop

    .line 1354
    :try_start_0
    invoke-static {v15}, Lcom/android/apksig/util/DataSinks;->asDataSink([Ljava/security/MessageDigest;)Lcom/android/apksig/util/DataSink;

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 1350
    move-object/from16 v2, p0

    move-object/from16 v16, v3

    move-object/from16 v17, v4

    move-wide/from16 v3, p1

    .end local v3    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v4    # "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .local v16, "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .local v17, "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    :try_start_1
    invoke-static {v2, v6, v3, v4, v0}, Lcom/android/apksig/internal/zip/LocalFileRecord;->outputUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;JLcom/android/apksig/util/DataSink;)V
    :try_end_1
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1359
    nop

    .line 1361
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_4
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_a

    .line 1362
    invoke-interface {v12, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;

    .line 1363
    .local v2, "expectedDigest":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;
    aget-object v18, v15, v0

    invoke-virtual/range {v18 .. v18}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    .line 1364
    .local v3, "actualDigest":[B
    iget-object v4, v2, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;->digest:[B

    invoke-static {v4, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v4

    if-nez v4, :cond_9

    .line 1365
    sget-object v4, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_ZIP_ENTRY_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    move-object/from16 v18, v5

    iget-object v5, v2, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;->jcaDigestAlgorithm:Ljava/lang/String;

    .line 1370
    move-object/from16 v19, v6

    .end local v6    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .local v19, "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object v6

    .line 1371
    move-object/from16 v20, v3

    .end local v3    # "actualDigest":[B
    .local v20, "actualDigest":[B
    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object v3

    iget-object v8, v2, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;->digest:[B

    invoke-virtual {v3, v8}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object v3

    const-string v8, "META-INF/MANIFEST.MF"

    filled-new-array {v7, v5, v8, v6, v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 1365
    invoke-static {v1, v4, v3}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$200(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    goto :goto_5

    .line 1364
    .end local v19    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v20    # "actualDigest":[B
    .restart local v3    # "actualDigest":[B
    .restart local v6    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :cond_9
    move-object/from16 v20, v3

    move-object/from16 v18, v5

    move-object/from16 v19, v6

    .line 1361
    .end local v2    # "expectedDigest":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;
    .end local v3    # "actualDigest":[B
    .end local v6    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v19    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :goto_5
    add-int/lit8 v0, v0, 0x1

    move-object/from16 v2, p0

    move-wide/from16 v3, p1

    move-object/from16 v8, p4

    move-object/from16 v5, v18

    move-object/from16 v6, v19

    goto :goto_4

    .end local v19    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v6    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :cond_a
    move-object/from16 v18, v5

    move-object/from16 v19, v6

    .line 1374
    .end local v0    # "i":I
    .end local v6    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v7    # "entryName":Ljava/lang/String;
    .end local v9    # "manifestSection":Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .end local v10    # "entrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .end local v12    # "expectedDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    .end local v15    # "mds":[Ljava/security/MessageDigest;
    nop

    .line 1300
    .end local v16    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v17    # "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .local v3, "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v4    # "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    :goto_6
    move-object/from16 v2, p3

    move-object v4, v11

    move-object/from16 v3, v16

    move-object/from16 v0, v17

    move-object/from16 v5, v18

    .end local v3    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v4    # "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .restart local v16    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v17    # "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    goto/16 :goto_0

    .line 1357
    .restart local v6    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v7    # "entryName":Ljava/lang/String;
    .restart local v9    # "manifestSection":Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .restart local v10    # "entrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .restart local v12    # "expectedDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    .restart local v15    # "mds":[Ljava/security/MessageDigest;
    :catch_0
    move-exception v0

    move-object/from16 v19, v6

    .end local v6    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v19    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    goto :goto_7

    .line 1355
    .end local v19    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v6    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :catch_1
    move-exception v0

    move-object/from16 v19, v6

    .end local v6    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v19    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    goto :goto_8

    .line 1357
    .end local v16    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v17    # "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .end local v19    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v3    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v4    # "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .restart local v6    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :catch_2
    move-exception v0

    move-object/from16 v16, v3

    move-object/from16 v17, v4

    move-object/from16 v19, v6

    .line 1358
    .end local v3    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v4    # "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .end local v6    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .local v0, "e":Ljava/io/IOException;
    .restart local v16    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v17    # "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .restart local v19    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :goto_7
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to read entry: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 1355
    .end local v0    # "e":Ljava/io/IOException;
    .end local v16    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v17    # "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .end local v19    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v3    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v4    # "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .restart local v6    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :catch_3
    move-exception v0

    move-object/from16 v16, v3

    move-object/from16 v17, v4

    move-object/from16 v19, v6

    .line 1356
    .end local v3    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v4    # "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .end local v6    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .local v0, "e":Lcom/android/apksig/zip/ZipFormatException;
    .restart local v16    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v17    # "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .restart local v19    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :goto_8
    new-instance v2, Lcom/android/apksig/apk/ApkFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Malformed ZIP entry: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 1376
    .end local v7    # "entryName":Ljava/lang/String;
    .end local v9    # "manifestSection":Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .end local v10    # "entrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .end local v11    # "firstSignedEntryName":Ljava/lang/String;
    .end local v12    # "expectedDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    .end local v15    # "mds":[Ljava/security/MessageDigest;
    .end local v16    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v17    # "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .end local v19    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .local v0, "firstSignedEntrySigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .restart local v3    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .local v4, "firstSignedEntryName":Ljava/lang/String;
    :cond_b
    move/from16 v13, p6

    move/from16 v14, p7

    move-object/from16 v16, v3

    .end local v3    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v16    # "cdRecordsSortedByLocalFileHeaderOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    if-nez v0, :cond_c

    .line 1377
    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_SIGNED_ZIP_ENTRIES:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1, v2, v3}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$200(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 1378
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v2

    return-object v2

    .line 1380
    :cond_c
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v2
.end method
