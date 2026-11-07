.class public Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;
.super Ljava/lang/Object;
.source "ApkSigningBlockUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;,
        Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;,
        Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;,
        Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;,
        Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$VerityTreeAndDigest;,
        Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;,
        Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$NoSupportedSignaturesException;,
        Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;,
        Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;,
        Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;
    }
.end annotation


# static fields
.field public static final ANDROID_COMMON_PAGE_ALIGNMENT_BYTES:I = 0x1000

.field private static final APK_SIGNING_BLOCK_MAGIC:[B

.field private static final CONTENT_DIGESTED_CHUNK_MAX_SIZE_BYTES:J = 0x100000L

.field private static final V4_CONTENT_DIGEST_ALGORITHMS:[Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

.field public static final VERITY_PADDING_BLOCK_ID:I = 0x42726577

.field public static final VERSION_APK_SIGNATURE_SCHEME_V2:I = 0x2

.field public static final VERSION_APK_SIGNATURE_SCHEME_V3:I = 0x3

.field public static final VERSION_APK_SIGNATURE_SCHEME_V31:I = 0x1f

.field public static final VERSION_APK_SIGNATURE_SCHEME_V4:I = 0x4

.field public static final VERSION_JAR_SIGNATURE_SCHEME:I = 0x1

.field public static final VERSION_SOURCE_STAMP:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 93
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->APK_SIGNING_BLOCK_MAGIC:[B

    .line 100
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    const/4 v1, 0x0

    sget-object v2, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->CHUNKED_SHA512:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->VERITY_CHUNKED_SHA256:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->CHUNKED_SHA256:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->V4_CONTENT_DIGEST_ALGORITHMS:[Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    return-void

    :array_0
    .array-data 1
        0x41t
        0x50t
        0x4bt
        0x20t
        0x53t
        0x69t
        0x67t
        0x20t
        0x42t
        0x6ct
        0x6ft
        0x63t
        0x6bt
        0x20t
        0x34t
        0x32t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$1100(JJ)J
    .locals 2
    .param p0, "x0"    # J
    .param p2, "x1"    # J

    .line 89
    invoke-static {p0, p1, p2, p3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getChunkCount(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$500(I[BI)V
    .locals 0
    .param p0, "x0"    # I
    .param p1, "x1"    # [B
    .param p2, "x2"    # I

    .line 89
    invoke-static {p0, p1, p2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->setUnsignedInt32LittleEndian(I[BI)V

    return-void
.end method

.method public static checkByteOrderLittleEndian(Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buffer"
        }
    .end annotation

    .line 244
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->checkByteOrderLittleEndian(Ljava/nio/ByteBuffer;)V

    .line 245
    return-void
.end method

.method public static compareSignatureAlgorithm(Lcom/android/apksig/internal/apk/SignatureAlgorithm;Lcom/android/apksig/internal/apk/SignatureAlgorithm;)I
    .locals 1
    .param p0, "alg1"    # Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .param p1, "alg2"    # Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "alg1",
            "alg2"
        }
    .end annotation

    .line 115
    invoke-static {p0, p1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->compareSignatureAlgorithm(Lcom/android/apksig/internal/apk/SignatureAlgorithm;Lcom/android/apksig/internal/apk/SignatureAlgorithm;)I

    move-result v0

    return v0
.end method

.method private static computeApkVerityDigest(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/util/Map;)V
    .locals 7
    .param p0, "beforeCentralDir"    # Lcom/android/apksig/util/DataSource;
    .param p1, "centralDir"    # Lcom/android/apksig/util/DataSource;
    .param p2, "eocd"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "beforeCentralDir",
            "centralDir",
            "eocd",
            "outputContentDigests"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/util/DataSource;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 600
    .local p3, "outputContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->createVerityDigestBuffer(Z)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 603
    .local v0, "encoded":Ljava/nio/ByteBuffer;
    new-instance v1, Lcom/android/apksig/internal/util/VerityTreeBuilder;

    const/16 v2, 0x8

    new-array v2, v2, [B

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/util/VerityTreeBuilder;-><init>([B)V

    .line 604
    .local v1, "builder":Lcom/android/apksig/internal/util/VerityTreeBuilder;
    :try_start_0
    invoke-virtual {v1, p0, p1, p2}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->generateVerityTreeRootHash(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;)[B

    move-result-object v2

    .line 606
    .local v2, "rootHash":[B
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 607
    invoke-interface {p0}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v3

    invoke-interface {p1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v5

    add-long/2addr v3, v5

    invoke-interface {p2}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v5

    add-long/2addr v3, v5

    invoke-virtual {v0, v3, v4}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 608
    sget-object v3, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->VERITY_CHUNKED_SHA256:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-interface {p3, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 609
    nop

    .end local v2    # "rootHash":[B
    invoke-virtual {v1}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->close()V

    .line 610
    .end local v1    # "builder":Lcom/android/apksig/internal/util/VerityTreeBuilder;
    return-void

    .line 603
    .restart local v1    # "builder":Lcom/android/apksig/internal/util/VerityTreeBuilder;
    :catchall_0
    move-exception v2

    :try_start_1
    invoke-virtual {v1}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v3

    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw v2
.end method

.method public static computeChunkVerityTreeAndDigest(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$VerityTreeAndDigest;
    .locals 8
    .param p0, "dataSource"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dataSource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 643
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->createVerityDigestBuffer(Z)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 646
    .local v0, "encoded":Ljava/nio/ByteBuffer;
    new-instance v1, Lcom/android/apksig/internal/util/VerityTreeBuilder;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/util/VerityTreeBuilder;-><init>([B)V

    .line 647
    .local v1, "builder":Lcom/android/apksig/internal/util/VerityTreeBuilder;
    :try_start_0
    invoke-virtual {v1, p0}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->generateVerityTree(Lcom/android/apksig/util/DataSource;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 648
    .local v2, "tree":Ljava/nio/ByteBuffer;
    invoke-virtual {v1, v2}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->getRootHashFromTree(Ljava/nio/ByteBuffer;)[B

    move-result-object v3

    .line 649
    .local v3, "rootHash":[B
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 650
    new-instance v4, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$VerityTreeAndDigest;

    sget-object v5, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->VERITY_CHUNKED_SHA256:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v6

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v7

    invoke-direct {v4, v5, v6, v7}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$VerityTreeAndDigest;-><init>(Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B[B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 651
    invoke-virtual {v1}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->close()V

    .line 650
    return-object v4

    .line 646
    .end local v2    # "tree":Ljava/nio/ByteBuffer;
    .end local v3    # "rootHash":[B
    :catchall_0
    move-exception v2

    :try_start_1
    invoke-virtual {v1}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v3

    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw v2
.end method

.method public static computeContentDigests(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/util/List;)Lcom/android/apksig/internal/util/Pair;
    .locals 6
    .param p0, "executor"    # Lcom/android/apksig/util/RunnablesExecutor;
    .param p1, "beforeCentralDir"    # Lcom/android/apksig/util/DataSource;
    .param p2, "centralDir"    # Lcom/android/apksig/util/DataSource;
    .param p3, "eocd"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "executor",
            "beforeCentralDir",
            "centralDir",
            "eocd",
            "signerConfigs"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/RunnablesExecutor;",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/util/DataSource;",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            ">;)",
            "Lcom/android/apksig/internal/util/Pair<",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            ">;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 1036
    .local p4, "signerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    invoke-interface {p4}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1042
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 1043
    .local v0, "contentDigestAlgorithms":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    .line 1044
    .local v2, "signerConfig":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    iget-object v3, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->signatureAlgorithms:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    .line 1045
    .local v4, "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    invoke-virtual {v4}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getContentDigestAlgorithm()Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1046
    .end local v4    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    goto :goto_1

    .line 1047
    .end local v2    # "signerConfig":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    :cond_0
    goto :goto_0

    .line 1052
    :cond_1
    nop

    .line 1053
    :try_start_0
    invoke-static {p0, v0, p1, p2, p3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->computeContentDigests(Lcom/android/apksig/util/RunnablesExecutor;Ljava/util/Set;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;)Ljava/util/Map;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/DigestException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1063
    .local v1, "contentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    nop

    .line 1066
    invoke-static {p4, v1}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v2

    return-object v2

    .line 1061
    .end local v1    # "contentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    :catch_0
    move-exception v1

    .line 1062
    .local v1, "e":Ljava/security/DigestException;
    new-instance v2, Ljava/security/SignatureException;

    const-string v3, "Failed to compute digests of APK"

    invoke-direct {v2, v3, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 1059
    .end local v1    # "e":Ljava/security/DigestException;
    :catch_1
    move-exception v1

    .line 1060
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Failed to read APK being signed"

    invoke-direct {v2, v3, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 1037
    .end local v0    # "contentDigestAlgorithms":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    .end local v1    # "e":Ljava/io/IOException;
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No signer configs provided. At least one is required"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static computeContentDigests(Lcom/android/apksig/util/RunnablesExecutor;Ljava/util/Set;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;)Ljava/util/Map;
    .locals 5
    .param p0, "executor"    # Lcom/android/apksig/util/RunnablesExecutor;
    .param p2, "beforeCentralDir"    # Lcom/android/apksig/util/DataSource;
    .param p3, "centralDir"    # Lcom/android/apksig/util/DataSource;
    .param p4, "eocd"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "executor",
            "digestAlgorithms",
            "beforeCentralDir",
            "centralDir",
            "eocd"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/RunnablesExecutor;",
            "Ljava/util/Set<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            ">;",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/util/DataSource;",
            ")",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/DigestException;
        }
    .end annotation

    .line 265
    .local p1, "digestAlgorithms":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 266
    .local v0, "contentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 267
    .local v1, "oneMbChunkBasedAlgorithm":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    .line 268
    .local v3, "digestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    sget-object v4, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->CHUNKED_SHA256:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    if-eq v3, v4, :cond_0

    sget-object v4, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->CHUNKED_SHA512:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    if-ne v3, v4, :cond_1

    .line 270
    :cond_0
    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 272
    .end local v3    # "digestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    :cond_1
    goto :goto_0

    .line 273
    :cond_2
    const/4 v2, 0x3

    new-array v2, v2, [Lcom/android/apksig/util/DataSource;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    const/4 v3, 0x2

    aput-object p4, v2, v3

    invoke-static {p0, v1, v2, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->computeOneMbChunkContentDigests(Lcom/android/apksig/util/RunnablesExecutor;Ljava/util/Set;[Lcom/android/apksig/util/DataSource;Ljava/util/Map;)V

    .line 279
    sget-object v2, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->VERITY_CHUNKED_SHA256:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    invoke-interface {p1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 280
    invoke-static {p2, p3, p4, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->computeApkVerityDigest(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/util/Map;)V

    .line 282
    :cond_3
    return-object v0
.end method

.method static computeOneMbChunkContentDigests(Lcom/android/apksig/util/RunnablesExecutor;Ljava/util/Set;[Lcom/android/apksig/util/DataSource;Ljava/util/Map;)V
    .locals 10
    .param p0, "executor"    # Lcom/android/apksig/util/RunnablesExecutor;
    .param p2, "contents"    # [Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "executor",
            "digestAlgorithms",
            "contents",
            "outputContentDigests"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/RunnablesExecutor;",
            "Ljava/util/Set<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            ">;[",
            "Lcom/android/apksig/util/DataSource;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/DigestException;
        }
    .end annotation

    .line 394
    .local p1, "digestAlgorithms":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    .local p3, "outputContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    const-wide/16 v0, 0x0

    .line 395
    .local v0, "chunkCountLong":J
    array-length v2, p2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, p2, v3

    .line 396
    .local v4, "input":Lcom/android/apksig/util/DataSource;
    nop

    .line 397
    invoke-interface {v4}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v5

    const-wide/32 v7, 0x100000

    invoke-static {v5, v6, v7, v8}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getChunkCount(JJ)J

    move-result-wide v5

    add-long/2addr v0, v5

    .line 395
    .end local v4    # "input":Lcom/android/apksig/util/DataSource;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 399
    :cond_0
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_3

    .line 402
    long-to-int v2, v0

    .line 404
    .local v2, "chunkCount":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 405
    .local v3, "chunkDigestsList":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;>;"
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    .line 406
    .local v5, "algorithms":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    new-instance v7, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;

    invoke-direct {v7, v5, v2, v6}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;-><init>(Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$1;)V

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 407
    .end local v5    # "algorithms":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    goto :goto_1

    .line 409
    :cond_1
    new-instance v4, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;

    invoke-direct {v4, p2, v6}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;-><init>([Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$1;)V

    .line 410
    .local v4, "chunkSupplier":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;
    new-instance v5, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$$ExternalSyntheticLambda0;

    invoke-direct {v5, v4, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$$ExternalSyntheticLambda0;-><init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;Ljava/util/List;)V

    invoke-interface {p0, v5}, Lcom/android/apksig/util/RunnablesExecutor;->execute(Lcom/android/apksig/util/RunnablesProvider;)V

    .line 413
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;

    .line 414
    .local v6, "chunkDigests":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;
    invoke-static {v6}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->access$200(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;)Ljava/security/MessageDigest;

    move-result-object v7

    .line 415
    .local v7, "messageDigest":Ljava/security/MessageDigest;
    nop

    .line 416
    invoke-static {v6}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->access$300(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;)Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    move-result-object v8

    .line 417
    invoke-static {v6}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->access$400(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;)[B

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v9

    .line 415
    invoke-interface {p3, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 418
    .end local v6    # "chunkDigests":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;
    .end local v7    # "messageDigest":Ljava/security/MessageDigest;
    goto :goto_2

    .line 419
    :cond_2
    return-void

    .line 400
    .end local v2    # "chunkCount":I
    .end local v3    # "chunkDigestsList":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;>;"
    .end local v4    # "chunkSupplier":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;
    :cond_3
    new-instance v2, Ljava/security/DigestException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Input too long: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " chunks"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/security/DigestException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method static computeOneMbChunkContentDigests(Ljava/util/Set;[Lcom/android/apksig/util/DataSource;Ljava/util/Map;)V
    .locals 28
    .param p1, "contents"    # [Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "digestAlgorithms",
            "contents",
            "outputContentDigests"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            ">;[",
            "Lcom/android/apksig/util/DataSource;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/DigestException;
        }
    .end annotation

    .line 300
    .local p0, "digestAlgorithms":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    .local p2, "outputContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    move-object/from16 v1, p1

    const-wide/16 v2, 0x0

    .line 301
    .local v2, "chunkCountLong":J
    array-length v0, v1

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    const-wide/32 v6, 0x100000

    if-ge v5, v0, :cond_0

    aget-object v8, v1, v5

    .line 302
    .local v8, "input":Lcom/android/apksig/util/DataSource;
    nop

    .line 303
    invoke-interface {v8}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v9

    invoke-static {v9, v10, v6, v7}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getChunkCount(JJ)J

    move-result-wide v6

    add-long/2addr v2, v6

    .line 301
    .end local v8    # "input":Lcom/android/apksig/util/DataSource;
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 305
    :cond_0
    const-wide/32 v8, 0x7fffffff

    cmp-long v0, v2, v8

    if-gtz v0, :cond_8

    .line 308
    long-to-int v5, v2

    .line 310
    .local v5, "chunkCount":I
    nop

    .line 311
    invoke-interface/range {p0 .. p0}, Ljava/util/Set;->size()I

    move-result v0

    new-array v0, v0, [Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    move-object/from16 v8, p0

    invoke-interface {v8, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v9, v0

    check-cast v9, [Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    .line 312
    .local v9, "digestAlgorithmsArray":[Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    array-length v0, v9

    new-array v10, v0, [Ljava/security/MessageDigest;

    .line 313
    .local v10, "mds":[Ljava/security/MessageDigest;
    array-length v0, v9

    new-array v11, v0, [[B

    .line 314
    .local v11, "digestsOfChunks":[[B
    array-length v0, v9

    new-array v12, v0, [I

    .line 315
    .local v12, "digestOutputSizes":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v13, v9

    const/4 v14, 0x5

    const/4 v15, 0x1

    if-ge v0, v13, :cond_1

    .line 316
    aget-object v13, v9, v0

    .line 317
    .local v13, "digestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    invoke-virtual {v13}, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->getChunkDigestOutputSizeBytes()I

    move-result v16

    .line 318
    .local v16, "digestOutputSizeBytes":I
    aput v16, v12, v0

    .line 319
    mul-int v17, v5, v16

    add-int/lit8 v14, v17, 0x5

    new-array v14, v14, [B

    .line 321
    .local v14, "concatenationOfChunkCountAndChunkDigests":[B
    const/16 v17, 0x5a

    aput-byte v17, v14, v4

    .line 322
    invoke-static {v5, v14, v15}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->setUnsignedInt32LittleEndian(I[BI)V

    .line 324
    aput-object v14, v11, v0

    .line 325
    invoke-virtual {v13}, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->getJcaMessageDigestAlgorithm()Ljava/lang/String;

    move-result-object v15

    .line 326
    .local v15, "jcaAlgorithm":Ljava/lang/String;
    invoke-static {v15}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v17

    aput-object v17, v10, v0

    .line 315
    .end local v13    # "digestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    .end local v14    # "concatenationOfChunkCountAndChunkDigests":[B
    .end local v15    # "jcaAlgorithm":Ljava/lang/String;
    .end local v16    # "digestOutputSizeBytes":I
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 329
    .end local v0    # "i":I
    :cond_1
    invoke-static {v10}, Lcom/android/apksig/util/DataSinks;->asDataSink([Ljava/security/MessageDigest;)Lcom/android/apksig/util/DataSink;

    move-result-object v13

    .line 330
    .local v13, "mdSink":Lcom/android/apksig/util/DataSink;
    new-array v15, v14, [B

    .line 331
    .local v15, "chunkContentPrefix":[B
    const/16 v16, -0x5b

    aput-byte v16, v15, v4

    .line 332
    const/16 v16, 0x0

    .line 343
    .local v16, "chunkIndex":I
    array-length v0, v1

    :goto_2
    if-ge v4, v0, :cond_6

    aget-object v22, v1, v4

    .line 344
    .local v22, "input":Lcom/android/apksig/util/DataSource;
    const-wide/16 v18, 0x0

    .line 345
    .local v18, "inputOffset":J
    invoke-interface/range {v22 .. v22}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v20

    move/from16 v14, v16

    move-wide/from16 v23, v18

    move-wide/from16 v6, v20

    .line 346
    .end local v16    # "chunkIndex":I
    .end local v18    # "inputOffset":J
    .local v6, "inputRemaining":J
    .local v14, "chunkIndex":I
    .local v23, "inputOffset":J
    :goto_3
    const-wide/16 v18, 0x0

    cmp-long v16, v6, v18

    if-lez v16, :cond_5

    .line 347
    nop

    .line 348
    move/from16 v27, v0

    move-wide/from16 v25, v2

    const-wide/32 v0, 0x100000

    .end local v2    # "chunkCountLong":J
    .local v25, "chunkCountLong":J
    invoke-static {v6, v7, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v2, v2

    .line 349
    .local v2, "chunkSize":I
    const/4 v3, 0x1

    invoke-static {v2, v15, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->setUnsignedInt32LittleEndian(I[BI)V

    .line 350
    const/16 v16, 0x0

    move/from16 v0, v16

    .restart local v0    # "i":I
    :goto_4
    array-length v1, v10

    if-ge v0, v1, :cond_2

    .line 351
    aget-object v1, v10, v0

    invoke-virtual {v1, v15}, Ljava/security/MessageDigest;->update([B)V

    .line 350
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 354
    .end local v0    # "i":I
    :cond_2
    int-to-long v0, v2

    move-object/from16 v16, v22

    move-wide/from16 v17, v23

    move-wide/from16 v19, v0

    move-object/from16 v21, v13

    :try_start_0
    invoke-interface/range {v16 .. v21}, Lcom/android/apksig/util/DataSource;->feed(JJLcom/android/apksig/util/DataSink;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 357
    nop

    .line 358
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_5
    array-length v1, v9

    if-ge v0, v1, :cond_4

    .line 359
    aget-object v1, v10, v0

    .line 360
    .local v1, "md":Ljava/security/MessageDigest;
    aget-object v3, v11, v0

    .line 361
    .local v3, "concatenationOfChunkCountAndChunkDigests":[B
    move/from16 v18, v5

    .end local v5    # "chunkCount":I
    .local v18, "chunkCount":I
    aget v5, v12, v0

    .line 362
    .local v5, "expectedDigestSizeBytes":I
    mul-int v16, v14, v5

    const/16 v19, 0x5

    add-int/lit8 v8, v16, 0x5

    .line 363
    invoke-virtual {v1, v3, v8, v5}, Ljava/security/MessageDigest;->digest([BII)I

    move-result v8

    .line 367
    .local v8, "actualDigestSizeBytes":I
    if-ne v8, v5, :cond_3

    .line 358
    .end local v1    # "md":Ljava/security/MessageDigest;
    .end local v3    # "concatenationOfChunkCountAndChunkDigests":[B
    .end local v5    # "expectedDigestSizeBytes":I
    .end local v8    # "actualDigestSizeBytes":I
    add-int/lit8 v0, v0, 0x1

    const/4 v3, 0x1

    move-object/from16 v8, p0

    move/from16 v5, v18

    goto :goto_5

    .line 368
    .restart local v1    # "md":Ljava/security/MessageDigest;
    .restart local v3    # "concatenationOfChunkCountAndChunkDigests":[B
    .restart local v5    # "expectedDigestSizeBytes":I
    .restart local v8    # "actualDigestSizeBytes":I
    :cond_3
    new-instance v4, Ljava/lang/RuntimeException;

    move/from16 v16, v0

    .end local v0    # "i":I
    .local v16, "i":I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v20, v3

    .end local v3    # "concatenationOfChunkCountAndChunkDigests":[B
    .local v20, "concatenationOfChunkCountAndChunkDigests":[B
    const-string v3, "Unexpected output size of "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 369
    invoke-virtual {v1}, Ljava/security/MessageDigest;->getAlgorithm()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " digest: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 358
    .end local v1    # "md":Ljava/security/MessageDigest;
    .end local v8    # "actualDigestSizeBytes":I
    .end local v16    # "i":I
    .end local v18    # "chunkCount":I
    .end local v20    # "concatenationOfChunkCountAndChunkDigests":[B
    .restart local v0    # "i":I
    .local v5, "chunkCount":I
    :cond_4
    move/from16 v16, v0

    move/from16 v18, v5

    const/16 v19, 0x5

    .line 373
    .end local v0    # "i":I
    .end local v5    # "chunkCount":I
    .restart local v18    # "chunkCount":I
    int-to-long v0, v2

    add-long v23, v23, v0

    .line 374
    int-to-long v0, v2

    sub-long/2addr v6, v0

    .line 375
    nop

    .end local v2    # "chunkSize":I
    add-int/lit8 v14, v14, 0x1

    .line 376
    move-object/from16 v8, p0

    move-object/from16 v1, p1

    move-wide/from16 v2, v25

    move/from16 v0, v27

    goto/16 :goto_3

    .line 355
    .end local v18    # "chunkCount":I
    .restart local v2    # "chunkSize":I
    .restart local v5    # "chunkCount":I
    :catch_0
    move-exception v0

    move/from16 v18, v5

    move-object v1, v0

    .end local v5    # "chunkCount":I
    .restart local v18    # "chunkCount":I
    move-object v0, v1

    .line 356
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to read chunk #"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 346
    .end local v0    # "e":Ljava/io/IOException;
    .end local v18    # "chunkCount":I
    .end local v25    # "chunkCountLong":J
    .local v2, "chunkCountLong":J
    .restart local v5    # "chunkCount":I
    :cond_5
    move/from16 v27, v0

    move-wide/from16 v25, v2

    move/from16 v18, v5

    const/16 v19, 0x5

    .line 343
    .end local v2    # "chunkCountLong":J
    .end local v5    # "chunkCount":I
    .end local v6    # "inputRemaining":J
    .end local v22    # "input":Lcom/android/apksig/util/DataSource;
    .end local v23    # "inputOffset":J
    .restart local v18    # "chunkCount":I
    .restart local v25    # "chunkCountLong":J
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v8, p0

    move-object/from16 v1, p1

    move/from16 v16, v14

    move/from16 v14, v19

    const-wide/32 v6, 0x100000

    goto/16 :goto_2

    .line 379
    .end local v14    # "chunkIndex":I
    .end local v18    # "chunkCount":I
    .end local v25    # "chunkCountLong":J
    .restart local v2    # "chunkCountLong":J
    .restart local v5    # "chunkCount":I
    .local v16, "chunkIndex":I
    :cond_6
    move-wide/from16 v25, v2

    move/from16 v18, v5

    .end local v2    # "chunkCountLong":J
    .end local v5    # "chunkCount":I
    .restart local v18    # "chunkCount":I
    .restart local v25    # "chunkCountLong":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    array-length v1, v9

    if-ge v0, v1, :cond_7

    .line 380
    aget-object v1, v9, v0

    .line 381
    .local v1, "digestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    aget-object v2, v11, v0

    .line 382
    .local v2, "concatenationOfChunkCountAndChunkDigests":[B
    aget-object v3, v10, v0

    .line 383
    .local v3, "md":Ljava/security/MessageDigest;
    invoke-virtual {v3, v2}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v4

    .line 384
    .local v4, "digest":[B
    move-object/from16 v5, p2

    invoke-interface {v5, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 379
    .end local v1    # "digestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    .end local v2    # "concatenationOfChunkCountAndChunkDigests":[B
    .end local v3    # "md":Ljava/security/MessageDigest;
    .end local v4    # "digest":[B
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_7
    move-object/from16 v5, p2

    .line 386
    .end local v0    # "i":I
    return-void

    .line 306
    .end local v9    # "digestAlgorithmsArray":[Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    .end local v10    # "mds":[Ljava/security/MessageDigest;
    .end local v11    # "digestsOfChunks":[[B
    .end local v12    # "digestOutputSizes":[I
    .end local v13    # "mdSink":Lcom/android/apksig/util/DataSink;
    .end local v15    # "chunkContentPrefix":[B
    .end local v16    # "chunkIndex":I
    .end local v18    # "chunkCount":I
    .end local v25    # "chunkCountLong":J
    .local v2, "chunkCountLong":J
    :cond_8
    move-wide/from16 v25, v2

    .end local v2    # "chunkCountLong":J
    .restart local v25    # "chunkCountLong":J
    new-instance v0, Ljava/security/DigestException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Input too long: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-wide/from16 v2, v25

    .end local v25    # "chunkCountLong":J
    .restart local v2    # "chunkCountLong":J
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " chunks"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/security/DigestException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static copyWithModifiedCDOffset(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/util/DataSource;
    .locals 6
    .param p0, "beforeCentralDir"    # Lcom/android/apksig/util/DataSource;
    .param p1, "eocd"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "beforeCentralDir",
            "eocd"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 835
    invoke-interface {p0}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v0

    .line 836
    .local v0, "centralDirOffsetForDigesting":J
    invoke-interface {p1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v2

    long-to-int v2, v2

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 837
    .local v2, "eocdBuf":Ljava/nio/ByteBuffer;
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 838
    invoke-interface {p1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v3

    long-to-int v3, v3

    const-wide/16 v4, 0x0

    invoke-interface {p1, v4, v5, v3, v2}, Lcom/android/apksig/util/DataSource;->copyTo(JILjava/nio/ByteBuffer;)V

    .line 839
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 840
    invoke-static {v2, v0, v1}, Lcom/android/apksig/internal/zip/ZipUtils;->setZipEocdCentralDirectoryOffset(Ljava/nio/ByteBuffer;J)V

    .line 841
    invoke-static {v2}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/nio/ByteBuffer;)Lcom/android/apksig/util/DataSource;

    move-result-object v3

    return-object v3
.end method

.method private static createVerityDigestBuffer(Z)Ljava/nio/ByteBuffer;
    .locals 3
    .param p0, "includeSourceDataSize"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "includeSourceDataSize"
        }
    .end annotation

    .line 617
    sget-object v0, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->VERITY_CHUNKED_SHA256:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    .line 618
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->getChunkDigestOutputSizeBytes()I

    move-result v0

    .line 619
    .local v0, "backBufferSize":I
    if-eqz p0, :cond_0

    .line 620
    add-int/lit8 v0, v0, 0x8

    .line 622
    :cond_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 623
    .local v1, "encoded":Ljava/nio/ByteBuffer;
    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 624
    return-object v1
.end method

.method public static encodeAsLengthPrefixedElement([B)[B
    .locals 2
    .param p0, "bytes"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation

    .line 750
    const/4 v0, 0x1

    new-array v0, v0, [[B

    .line 751
    .local v0, "adapterBytes":[[B
    const/4 v1, 0x0

    aput-object p0, v0, v1

    .line 752
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedElements([[B)[B

    move-result-object v1

    return-object v1
.end method

.method public static encodeAsSequenceOfLengthPrefixedElements(Ljava/util/List;)[B
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sequence"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "[B>;)[B"
        }
    .end annotation

    .line 756
    .local p0, "sequence":Ljava/util/List;, "Ljava/util/List<[B>;"
    nop

    .line 757
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [[B

    invoke-interface {p0, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[B

    .line 756
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedElements([[B)[B

    move-result-object v0

    return-object v0
.end method

.method public static encodeAsSequenceOfLengthPrefixedElements([[B)[B
    .locals 6
    .param p0, "sequence"    # [[B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sequence"
        }
    .end annotation

    .line 761
    const/4 v0, 0x0

    .line 762
    .local v0, "payloadSize":I
    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_0

    aget-object v4, p0, v3

    .line 763
    .local v4, "element":[B
    array-length v5, v4

    add-int/lit8 v5, v5, 0x4

    add-int/2addr v0, v5

    .line 762
    .end local v4    # "element":[B
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 765
    :cond_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 766
    .local v1, "result":Ljava/nio/ByteBuffer;
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 767
    array-length v3, p0

    :goto_1
    if-ge v2, v3, :cond_1

    aget-object v4, p0, v2

    .line 768
    .restart local v4    # "element":[B
    array-length v5, v4

    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 769
    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 767
    .end local v4    # "element":[B
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 771
    :cond_1
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    return-object v2
.end method

.method public static encodeAsSequenceOfLengthPrefixedPairsOfIntAndLengthPrefixedBytes(Ljava/util/List;)[B
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sequence"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/util/Pair<",
            "Ljava/lang/Integer;",
            "[B>;>;)[B"
        }
    .end annotation

    .line 776
    .local p0, "sequence":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    nop

    .line 777
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->encodeAsSequenceOfLengthPrefixedPairsOfIntAndLengthPrefixedBytes(Ljava/util/List;)[B

    move-result-object v0

    .line 776
    return-object v0
.end method

.method public static encodeCertificates(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "certificates"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;)",
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .line 742
    .local p0, "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 743
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/security/cert/X509Certificate;

    .line 744
    .local v2, "certificate":Ljava/security/cert/X509Certificate;
    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 745
    .end local v2    # "certificate":Ljava/security/cert/X509Certificate;
    goto :goto_0

    .line 746
    :cond_0
    return-object v0
.end method

.method public static encodePublicKey(Ljava/security/PublicKey;)[B
    .locals 14
    .param p0, "publicKey"    # Ljava/security/PublicKey;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "publicKey"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 667
    const/4 v0, 0x0

    .line 668
    .local v0, "encodedPublicKey":[B
    const-string v1, "X.509"

    invoke-interface {p0}, Ljava/security/PublicKey;->getFormat()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 669
    invoke-interface {p0}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v0

    .line 671
    invoke-interface {p0}, Ljava/security/PublicKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v1

    .line 672
    .local v1, "keyAlgorithm":Ljava/lang/String;
    const-string v2, "RSA"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "1.2.840.113549.1.1.1"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 676
    :cond_0
    :try_start_0
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 677
    .local v2, "encodedPublicKeyBuffer":Ljava/nio/ByteBuffer;
    const-class v3, Lcom/android/apksig/internal/x509/SubjectPublicKeyInfo;

    invoke-static {v2, v3}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parse(Ljava/nio/ByteBuffer;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/x509/SubjectPublicKeyInfo;

    .line 683
    .local v3, "subjectPublicKeyInfo":Lcom/android/apksig/internal/x509/SubjectPublicKeyInfo;
    iget-object v4, v3, Lcom/android/apksig/internal/x509/SubjectPublicKeyInfo;->subjectPublicKey:Ljava/nio/ByteBuffer;

    .line 684
    .local v4, "subjectPublicKeyBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    .line 685
    .local v5, "padding":B
    const-class v6, Lcom/android/apksig/internal/x509/RSAPublicKey;

    invoke-static {v4, v6}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parse(Ljava/nio/ByteBuffer;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/internal/x509/RSAPublicKey;

    .line 689
    .local v6, "rsaPublicKey":Lcom/android/apksig/internal/x509/RSAPublicKey;
    iget-object v7, v6, Lcom/android/apksig/internal/x509/RSAPublicKey;->modulus:Ljava/math/BigInteger;

    sget-object v8, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    invoke-virtual {v7, v8}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v7

    if-gez v7, :cond_1

    .line 693
    iget-object v7, v6, Lcom/android/apksig/internal/x509/RSAPublicKey;->modulus:Ljava/math/BigInteger;

    invoke-virtual {v7}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v7

    .line 694
    .local v7, "encodedModulus":[B
    array-length v8, v7

    const/4 v9, 0x1

    add-int/2addr v8, v9

    new-array v8, v8, [B

    .line 695
    .local v8, "reencodedModulus":[B
    const/4 v10, 0x0

    aput-byte v10, v8, v10

    .line 696
    array-length v11, v7

    invoke-static {v7, v10, v8, v9, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 698
    new-instance v11, Ljava/math/BigInteger;

    invoke-direct {v11, v8}, Ljava/math/BigInteger;-><init>([B)V

    iput-object v11, v6, Lcom/android/apksig/internal/x509/RSAPublicKey;->modulus:Ljava/math/BigInteger;

    .line 702
    invoke-static {v6}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->encode(Ljava/lang/Object;)[B

    move-result-object v11

    .line 703
    .local v11, "reencodedRSAPublicKey":[B
    array-length v12, v11

    add-int/2addr v12, v9

    new-array v12, v12, [B

    .line 705
    .local v12, "reencodedSubjectPublicKey":[B
    aput-byte v5, v12, v10

    .line 706
    array-length v13, v11

    invoke-static {v11, v10, v12, v9, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 708
    invoke-static {v12}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v9

    iput-object v9, v3, Lcom/android/apksig/internal/x509/SubjectPublicKeyInfo;->subjectPublicKey:Ljava/nio/ByteBuffer;

    .line 710
    invoke-static {v3}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->encode(Ljava/lang/Object;)[B

    move-result-object v9
    :try_end_0
    .catch Lcom/android/apksig/internal/asn1/Asn1DecodingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/android/apksig/internal/asn1/Asn1EncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v9

    .line 716
    .end local v2    # "encodedPublicKeyBuffer":Ljava/nio/ByteBuffer;
    .end local v3    # "subjectPublicKeyInfo":Lcom/android/apksig/internal/x509/SubjectPublicKeyInfo;
    .end local v4    # "subjectPublicKeyBuffer":Ljava/nio/ByteBuffer;
    .end local v5    # "padding":B
    .end local v6    # "rsaPublicKey":Lcom/android/apksig/internal/x509/RSAPublicKey;
    .end local v7    # "encodedModulus":[B
    .end local v8    # "reencodedModulus":[B
    .end local v11    # "reencodedRSAPublicKey":[B
    .end local v12    # "reencodedSubjectPublicKey":[B
    :cond_1
    goto :goto_1

    .line 712
    :catch_0
    move-exception v2

    goto :goto_0

    :catch_1
    move-exception v2

    .line 713
    .local v2, "e":Ljava/lang/Exception;
    :goto_0
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Caught a exception encoding the public key: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 714
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 715
    const/4 v0, 0x0

    .line 719
    .end local v1    # "keyAlgorithm":Ljava/lang/String;
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_2
    :goto_1
    const-string v1, " of class "

    const-string v2, "Failed to obtain X.509 encoded form of public key "

    if-nez v0, :cond_3

    .line 721
    nop

    .line 722
    :try_start_1
    invoke-interface {p0}, Ljava/security/PublicKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v3

    const-class v4, Ljava/security/spec/X509EncodedKeySpec;

    .line 723
    invoke-virtual {v3, p0, v4}, Ljava/security/KeyFactory;->getKeySpec(Ljava/security/Key;Ljava/lang/Class;)Ljava/security/spec/KeySpec;

    move-result-object v3

    check-cast v3, Ljava/security/spec/X509EncodedKeySpec;

    .line 724
    invoke-virtual {v3}, Ljava/security/spec/X509EncodedKeySpec;->getEncoded()[B

    move-result-object v3
    :try_end_1
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_1 .. :try_end_1} :catch_2

    move-object v0, v3

    .line 730
    goto :goto_2

    .line 725
    :catch_2
    move-exception v3

    .line 726
    .local v3, "e":Ljava/security/spec/InvalidKeySpecException;
    new-instance v4, Ljava/security/InvalidKeyException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 728
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1, v3}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 732
    .end local v3    # "e":Ljava/security/spec/InvalidKeySpecException;
    :cond_3
    :goto_2
    if-eqz v0, :cond_4

    array-length v3, v0

    if-eqz v3, :cond_4

    .line 737
    return-object v0

    .line 733
    :cond_4
    new-instance v3, Ljava/security/InvalidKeyException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 735
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static findApkSignatureSchemeBlock(Ljava/nio/ByteBuffer;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Ljava/nio/ByteBuffer;
    .locals 3
    .param p0, "apkSigningBlock"    # Ljava/nio/ByteBuffer;
    .param p1, "blockId"    # I
    .param p2, "result"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "apkSigningBlock",
            "blockId",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;
        }
    .end annotation

    .line 237
    :try_start_0
    invoke-static {p0, p1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->findApkSignatureSchemeBlock(Ljava/nio/ByteBuffer;I)Ljava/nio/ByteBuffer;

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 238
    :catch_0
    move-exception v0

    .line 239
    .local v0, "e":Lcom/android/apksig/internal/apk/SignatureNotFoundException;
    new-instance v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;

    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/SignatureNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Lcom/android/apksig/internal/apk/SignatureInfo;
    .locals 3
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "zipSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .param p2, "blockId"    # I
    .param p3, "result"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "apk",
            "zipSections",
            "blockId",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;
        }
    .end annotation

    .line 795
    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/zip/ZipSections;I)Lcom/android/apksig/internal/apk/SignatureInfo;

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 796
    :catch_0
    move-exception v0

    .line 797
    .local v0, "e":Lcom/android/apksig/internal/apk/SignatureNotFoundException;
    new-instance v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;

    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/SignatureNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static generateApkSigningBlock(Ljava/util/List;)[B
    .locals 14
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apkSignatureSchemeBlockPairs"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/util/Pair<",
            "[B",
            "Ljava/lang/Integer;",
            ">;>;)[B"
        }
    .end annotation

    .line 856
    .local p0, "apkSignatureSchemeBlockPairs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;>;"
    const/4 v0, 0x0

    .line 857
    .local v0, "blocksSize":I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/16 v3, 0xc

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/util/Pair;

    .line 858
    .local v2, "schemeBlockPair":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;"
    invoke-virtual {v2}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    array-length v4, v4

    add-int/2addr v4, v3

    add-int/2addr v0, v4

    .line 859
    .end local v2    # "schemeBlockPair":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;"
    goto :goto_0

    .line 861
    :cond_0
    add-int/lit8 v1, v0, 0x8

    add-int/lit8 v1, v1, 0x8

    add-int/lit8 v1, v1, 0x10

    .line 867
    .local v1, "resultSize":I
    const/4 v2, 0x0

    .line 868
    .local v2, "paddingPair":Ljava/nio/ByteBuffer;
    rem-int/lit16 v4, v1, 0x1000

    if-eqz v4, :cond_2

    .line 869
    rem-int/lit16 v4, v1, 0x1000

    rsub-int v4, v4, 0x1000

    .line 871
    .local v4, "padding":I
    if-ge v4, v3, :cond_1

    .line 872
    add-int/lit16 v4, v4, 0x1000

    .line 874
    :cond_1
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    sget-object v5, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 875
    add-int/lit8 v3, v4, -0x8

    int-to-long v5, v3

    invoke-virtual {v2, v5, v6}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 876
    const v3, 0x42726577

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 877
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 878
    add-int/2addr v1, v4

    .line 881
    .end local v4    # "padding":I
    :cond_2
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 882
    .local v3, "result":Ljava/nio/ByteBuffer;
    sget-object v4, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 883
    int-to-long v4, v1

    const-wide/16 v6, 0x8

    sub-long/2addr v4, v6

    .line 884
    .local v4, "blockSizeFieldValue":J
    invoke-virtual {v3, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 886
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/apksig/internal/util/Pair;

    .line 887
    .local v7, "schemeBlockPair":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;"
    invoke-virtual {v7}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [B

    .line 888
    .local v8, "apkSignatureSchemeBlock":[B
    invoke-virtual {v7}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 889
    .local v9, "apkSignatureSchemeId":I
    array-length v10, v8

    int-to-long v10, v10

    const-wide/16 v12, 0x4

    add-long/2addr v10, v12

    .line 890
    .local v10, "pairSizeFieldValue":J
    invoke-virtual {v3, v10, v11}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 891
    invoke-virtual {v3, v9}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 892
    invoke-virtual {v3, v8}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 893
    .end local v7    # "schemeBlockPair":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;"
    .end local v8    # "apkSignatureSchemeBlock":[B
    .end local v9    # "apkSignatureSchemeId":I
    .end local v10    # "pairSizeFieldValue":J
    goto :goto_1

    .line 895
    :cond_3
    if-eqz v2, :cond_4

    .line 896
    invoke-virtual {v3, v2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 899
    :cond_4
    invoke-virtual {v3, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 900
    sget-object v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->APK_SIGNING_BLOCK_MAGIC:[B

    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 902
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v6

    return-object v6
.end method

.method public static generateApkSigningBlockPadding(Lcom/android/apksig/util/DataSource;Z)Lcom/android/apksig/internal/util/Pair;
    .locals 7
    .param p0, "beforeCentralDir"    # Lcom/android/apksig/util/DataSource;
    .param p1, "apkSigningBlockPaddingSupported"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "beforeCentralDir",
            "apkSigningBlockPaddingSupported"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/DataSource;",
            "Z)",
            "Lcom/android/apksig/internal/util/Pair<",
            "Lcom/android/apksig/util/DataSource;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 815
    const/4 v0, 0x0

    .line 816
    .local v0, "padSizeBeforeSigningBlock":I
    if-eqz p1, :cond_0

    .line 817
    invoke-interface {p0}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v1

    const-wide/16 v3, 0x1000

    rem-long/2addr v1, v3

    const-wide/16 v5, 0x0

    cmp-long v1, v1, v5

    if-eqz v1, :cond_0

    .line 818
    nop

    .line 820
    invoke-interface {p0}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v1

    rem-long/2addr v1, v3

    sub-long/2addr v3, v1

    long-to-int v0, v3

    .line 821
    new-instance v1, Lcom/android/apksig/internal/util/ChainedDataSource;

    const/4 v2, 0x2

    new-array v2, v2, [Lcom/android/apksig/util/DataSource;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    .line 824
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 823
    invoke-static {v3}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/nio/ByteBuffer;)Lcom/android/apksig/util/DataSource;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/util/ChainedDataSource;-><init>([Lcom/android/apksig/util/DataSource;)V

    move-object p0, v1

    .line 826
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v1

    return-object v1
.end method

.method public static generatePkcs7DerEncodedMessage([BLjava/nio/ByteBuffer;Ljava/util/List;Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;)[B
    .locals 10
    .param p0, "signatureBytes"    # [B
    .param p1, "data"    # Ljava/nio/ByteBuffer;
    .param p3, "digestAlgorithmId"    # Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;
    .param p4, "signatureAlgorithmId"    # Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "signatureBytes",
            "data",
            "signerCerts",
            "digestAlgorithmId",
            "signatureAlgorithmId"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Ljava/nio/ByteBuffer;",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;",
            "Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;",
            "Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;",
            ")[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;,
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .line 1208
    .local p2, "signerCerts":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    new-instance v0, Lcom/android/apksig/internal/pkcs7/SignerInfo;

    invoke-direct {v0}, Lcom/android/apksig/internal/pkcs7/SignerInfo;-><init>()V

    .line 1209
    .local v0, "signerInfo":Lcom/android/apksig/internal/pkcs7/SignerInfo;
    const/4 v1, 0x1

    iput v1, v0, Lcom/android/apksig/internal/pkcs7/SignerInfo;->version:I

    .line 1210
    const/4 v2, 0x0

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/security/cert/X509Certificate;

    .line 1211
    .local v2, "signingCert":Ljava/security/cert/X509Certificate;
    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getIssuerX500Principal()Ljavax/security/auth/x500/X500Principal;

    move-result-object v3

    .line 1212
    .local v3, "signerCertIssuer":Ljavax/security/auth/x500/X500Principal;
    new-instance v4, Lcom/android/apksig/internal/pkcs7/SignerIdentifier;

    new-instance v5, Lcom/android/apksig/internal/pkcs7/IssuerAndSerialNumber;

    new-instance v6, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    .line 1215
    invoke-virtual {v3}, Ljavax/security/auth/x500/X500Principal;->getEncoded()[B

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;-><init>([B)V

    .line 1216
    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getSerialNumber()Ljava/math/BigInteger;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/android/apksig/internal/pkcs7/IssuerAndSerialNumber;-><init>(Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;Ljava/math/BigInteger;)V

    invoke-direct {v4, v5}, Lcom/android/apksig/internal/pkcs7/SignerIdentifier;-><init>(Lcom/android/apksig/internal/pkcs7/IssuerAndSerialNumber;)V

    iput-object v4, v0, Lcom/android/apksig/internal/pkcs7/SignerInfo;->sid:Lcom/android/apksig/internal/pkcs7/SignerIdentifier;

    .line 1218
    iput-object p3, v0, Lcom/android/apksig/internal/pkcs7/SignerInfo;->digestAlgorithm:Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;

    .line 1219
    iput-object p4, v0, Lcom/android/apksig/internal/pkcs7/SignerInfo;->signatureAlgorithm:Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;

    .line 1220
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    iput-object v4, v0, Lcom/android/apksig/internal/pkcs7/SignerInfo;->signature:Ljava/nio/ByteBuffer;

    .line 1222
    new-instance v4, Lcom/android/apksig/internal/pkcs7/SignedData;

    invoke-direct {v4}, Lcom/android/apksig/internal/pkcs7/SignedData;-><init>()V

    .line 1223
    .local v4, "signedData":Lcom/android/apksig/internal/pkcs7/SignedData;
    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v5, v4, Lcom/android/apksig/internal/pkcs7/SignedData;->certificates:Ljava/util/List;

    .line 1224
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/security/cert/X509Certificate;

    .line 1225
    .local v6, "cert":Ljava/security/cert/X509Certificate;
    iget-object v7, v4, Lcom/android/apksig/internal/pkcs7/SignedData;->certificates:Ljava/util/List;

    new-instance v8, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    invoke-virtual {v6}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;-><init>([B)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1226
    .end local v6    # "cert":Ljava/security/cert/X509Certificate;
    goto :goto_0

    .line 1227
    :cond_0
    iput v1, v4, Lcom/android/apksig/internal/pkcs7/SignedData;->version:I

    .line 1228
    invoke-static {p3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v4, Lcom/android/apksig/internal/pkcs7/SignedData;->digestAlgorithms:Ljava/util/List;

    .line 1229
    new-instance v1, Lcom/android/apksig/internal/pkcs7/EncapsulatedContentInfo;

    const-string v5, "1.2.840.113549.1.7.1"

    invoke-direct {v1, v5}, Lcom/android/apksig/internal/pkcs7/EncapsulatedContentInfo;-><init>(Ljava/lang/String;)V

    iput-object v1, v4, Lcom/android/apksig/internal/pkcs7/SignedData;->encapContentInfo:Lcom/android/apksig/internal/pkcs7/EncapsulatedContentInfo;

    .line 1231
    iget-object v1, v4, Lcom/android/apksig/internal/pkcs7/SignedData;->encapContentInfo:Lcom/android/apksig/internal/pkcs7/EncapsulatedContentInfo;

    iput-object p1, v1, Lcom/android/apksig/internal/pkcs7/EncapsulatedContentInfo;->content:Ljava/nio/ByteBuffer;

    .line 1232
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v4, Lcom/android/apksig/internal/pkcs7/SignedData;->signerInfos:Ljava/util/List;

    .line 1233
    new-instance v1, Lcom/android/apksig/internal/pkcs7/ContentInfo;

    invoke-direct {v1}, Lcom/android/apksig/internal/pkcs7/ContentInfo;-><init>()V

    .line 1234
    .local v1, "contentInfo":Lcom/android/apksig/internal/pkcs7/ContentInfo;
    const-string v5, "1.2.840.113549.1.7.2"

    iput-object v5, v1, Lcom/android/apksig/internal/pkcs7/ContentInfo;->contentType:Ljava/lang/String;

    .line 1235
    new-instance v5, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    invoke-static {v4}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->encode(Ljava/lang/Object;)[B

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;-><init>([B)V

    iput-object v5, v1, Lcom/android/apksig/internal/pkcs7/ContentInfo;->content:Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    .line 1236
    invoke-static {v1}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->encode(Ljava/lang/Object;)[B

    move-result-object v5

    return-object v5
.end method

.method public static generateSignaturesOverData(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;[B)Ljava/util/List;
    .locals 13
    .param p0, "signerConfig"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "signerConfig",
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            "[B)",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/util/Pair<",
            "Ljava/lang/Integer;",
            "[B>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 1139
    const-string v0, "Failed to sign using "

    const-string v1, " signature using public key from certificate"

    const-string v2, "Failed to verify generated "

    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->signatureAlgorithms:Ljava/util/List;

    .line 1140
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 1141
    .local v3, "signatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    iget-object v4, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/security/cert/X509Certificate;

    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v4

    .line 1142
    .local v4, "publicKey":Ljava/security/PublicKey;
    iget-object v5, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->signatureAlgorithms:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    .line 1143
    .local v6, "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    nop

    .line 1144
    invoke-virtual {v6}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaSignatureAlgorithmAndParams()Lcom/android/apksig/internal/util/Pair;

    move-result-object v7

    .line 1145
    .local v7, "sigAlgAndParams":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;+Ljava/security/spec/AlgorithmParameterSpec;>;"
    invoke-virtual {v7}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 1146
    .local v8, "jcaSignatureAlgorithm":Ljava/lang/String;
    invoke-virtual {v7}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/security/spec/AlgorithmParameterSpec;

    .line 1149
    .local v9, "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    :try_start_0
    invoke-static {v8}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v10

    .line 1150
    .local v10, "signature":Ljava/security/Signature;
    iget-object v11, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->privateKey:Ljava/security/PrivateKey;

    invoke-virtual {v10, v11}, Ljava/security/Signature;->initSign(Ljava/security/PrivateKey;)V

    .line 1151
    if-eqz v9, :cond_0

    .line 1152
    invoke-virtual {v10, v9}, Ljava/security/Signature;->setParameter(Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 1154
    :cond_0
    invoke-virtual {v10, p1}, Ljava/security/Signature;->update([B)V

    .line 1155
    invoke-virtual {v10}, Ljava/security/Signature;->sign()[B

    move-result-object v11
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/security/SignatureException; {:try_start_0 .. :try_end_0} :catch_3

    move-object v10, v11

    .line 1160
    .local v10, "signatureBytes":[B
    nop

    .line 1163
    :try_start_1
    invoke-static {v8}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v11

    .line 1164
    .local v11, "signature":Ljava/security/Signature;
    invoke-virtual {v11, v4}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 1165
    if-eqz v9, :cond_1

    .line 1166
    invoke-virtual {v11, v9}, Ljava/security/Signature;->setParameter(Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 1168
    :cond_1
    invoke-virtual {v11, p1}, Ljava/security/Signature;->update([B)V

    .line 1169
    invoke-virtual {v11, v10}, Ljava/security/Signature;->verify([B)Z

    move-result v12
    :try_end_1
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/security/SignatureException; {:try_start_1 .. :try_end_1} :catch_0

    if-eqz v12, :cond_2

    .line 1182
    .end local v11    # "signature":Ljava/security/Signature;
    nop

    .line 1184
    invoke-virtual {v6}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getId()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v11, v10}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v11

    invoke-interface {v3, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1185
    .end local v6    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v7    # "sigAlgAndParams":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;+Ljava/security/spec/AlgorithmParameterSpec;>;"
    .end local v8    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .end local v9    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .end local v10    # "signatureBytes":[B
    goto :goto_0

    .line 1170
    .restart local v6    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .restart local v7    # "sigAlgAndParams":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;+Ljava/security/spec/AlgorithmParameterSpec;>;"
    .restart local v8    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .restart local v9    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .restart local v10    # "signatureBytes":[B
    .restart local v11    # "signature":Ljava/security/Signature;
    :cond_2
    :try_start_2
    new-instance v0, Ljava/security/SignatureException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    .end local v3    # "signatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    .end local v4    # "publicKey":Ljava/security/PublicKey;
    .end local v6    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v7    # "sigAlgAndParams":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;+Ljava/security/spec/AlgorithmParameterSpec;>;"
    .end local v8    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .end local v9    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .end local v10    # "signatureBytes":[B
    .end local p0    # "signerConfig":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .end local p1    # "data":[B
    throw v0
    :try_end_2
    .catch Ljava/security/InvalidKeyException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/security/SignatureException; {:try_start_2 .. :try_end_2} :catch_0

    .line 1178
    .end local v11    # "signature":Ljava/security/Signature;
    .restart local v3    # "signatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    .restart local v4    # "publicKey":Ljava/security/PublicKey;
    .restart local v6    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .restart local v7    # "sigAlgAndParams":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;+Ljava/security/spec/AlgorithmParameterSpec;>;"
    .restart local v8    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .restart local v9    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .restart local v10    # "signatureBytes":[B
    .restart local p0    # "signerConfig":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .restart local p1    # "data":[B
    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    .line 1179
    .local v0, "e":Ljava/security/GeneralSecurityException;
    :goto_1
    new-instance v5, Ljava/security/SignatureException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v5, v1, v0}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 1174
    .end local v0    # "e":Ljava/security/GeneralSecurityException;
    :catch_2
    move-exception v0

    .line 1175
    .local v0, "e":Ljava/security/InvalidKeyException;
    new-instance v5, Ljava/security/InvalidKeyException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v5, v1, v0}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 1158
    .end local v0    # "e":Ljava/security/InvalidKeyException;
    .end local v10    # "signatureBytes":[B
    :catch_3
    move-exception v1

    goto :goto_2

    :catch_4
    move-exception v1

    .line 1159
    .local v1, "e":Ljava/security/GeneralSecurityException;
    :goto_2
    new-instance v2, Ljava/security/SignatureException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 1156
    .end local v1    # "e":Ljava/security/GeneralSecurityException;
    :catch_5
    move-exception v1

    .line 1157
    .local v1, "e":Ljava/security/InvalidKeyException;
    new-instance v2, Ljava/security/InvalidKeyException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0, v1}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 1186
    .end local v1    # "e":Ljava/security/InvalidKeyException;
    .end local v6    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v7    # "sigAlgAndParams":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;+Ljava/security/spec/AlgorithmParameterSpec;>;"
    .end local v8    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .end local v9    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_3
    return-object v3
.end method

.method public static getApkSignatureBlockSigners([B)Ljava/util/List;
    .locals 13
    .param p0, "signatureBlock"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signatureBlock"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/util/Pair<",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;[B>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/security/cert/CertificateException;
        }
    .end annotation

    .line 978
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 979
    .local v0, "signatureBlockBuffer":Ljava/nio/ByteBuffer;
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 980
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 981
    .local v1, "signersBuffer":Ljava/nio/ByteBuffer;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 982
    .local v2, "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/util/List<Ljava/security/cert/X509Certificate;>;[B>;>;"
    :goto_0
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 985
    invoke-static {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 986
    .local v3, "signer":Ljava/nio/ByteBuffer;
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    new-array v4, v4, [B

    .line 987
    .local v4, "signerBytes":[B
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 988
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 990
    invoke-static {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 993
    .local v5, "signedData":Ljava/nio/ByteBuffer;
    invoke-static {v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 994
    invoke-static {v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 995
    .local v6, "certificatesBuffer":Ljava/nio/ByteBuffer;
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 996
    .local v7, "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    :goto_1
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 997
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v8

    .line 998
    .local v8, "certLength":I
    new-array v9, v8, [B

    .line 999
    .local v9, "certBytes":[B
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v10

    if-gt v8, v10, :cond_0

    .line 1004
    invoke-virtual {v6, v9}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 1005
    new-instance v10, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;

    .line 1007
    invoke-static {v9}, Lcom/android/apksig/internal/util/X509CertificateUtils;->generateCertificate([B)Ljava/security/cert/X509Certificate;

    move-result-object v11

    invoke-direct {v10, v11, v9}, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;-><init>(Ljava/security/cert/X509Certificate;[B)V

    .line 1008
    .local v10, "signerCert":Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;
    invoke-interface {v7, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1009
    .end local v8    # "certLength":I
    .end local v9    # "certBytes":[B
    .end local v10    # "signerCert":Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;
    goto :goto_1

    .line 1000
    .restart local v8    # "certLength":I
    .restart local v9    # "certBytes":[B
    :cond_0
    new-instance v10, Ljava/lang/IllegalArgumentException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Cert index "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 1001
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v12, v12, 0x1

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " under signer index "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    .line 1002
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v12, v12, 0x1

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " size out of range: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 1010
    .end local v8    # "certLength":I
    .end local v9    # "certBytes":[B
    :cond_1
    invoke-static {v7, v4}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v8

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1011
    .end local v3    # "signer":Ljava/nio/ByteBuffer;
    .end local v4    # "signerBytes":[B
    .end local v5    # "signedData":Ljava/nio/ByteBuffer;
    .end local v6    # "certificatesBuffer":Ljava/nio/ByteBuffer;
    .end local v7    # "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    goto/16 :goto_0

    .line 1012
    :cond_2
    return-object v2
.end method

.method public static getApkSignatureBlocks(Lcom/android/apksig/util/DataSource;)Ljava/util/List;
    .locals 11
    .param p0, "apkSigningBlock"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apkSigningBlock"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/DataSource;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/util/Pair<",
            "[B",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 923
    invoke-interface {p0}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v0

    .line 924
    .local v0, "apkSigningBlockSize":J
    invoke-interface {p0}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v2

    const-wide/32 v4, 0x7fffffff

    cmp-long v2, v2, v4

    if-gtz v2, :cond_2

    const-wide/16 v2, 0x20

    cmp-long v2, v0, v2

    if-ltz v2, :cond_2

    .line 930
    nop

    .line 931
    invoke-interface {p0}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v2

    long-to-int v2, v2

    add-int/lit8 v2, v2, -0x20

    .line 930
    const-wide/16 v6, 0x8

    invoke-interface {p0, v6, v7, v2}, Lcom/android/apksig/util/DataSource;->getByteBuffer(JI)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 932
    .local v2, "apkSigningBlockBuffer":Ljava/nio/ByteBuffer;
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 933
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 934
    .local v3, "signatureBlocks":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;>;"
    :goto_0
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 935
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v6

    .line 936
    .local v6, "blockLength":J
    cmp-long v8, v6, v4

    if-gtz v8, :cond_0

    const-wide/16 v8, 0x4

    cmp-long v8, v6, v8

    if-ltz v8, :cond_0

    .line 941
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v8

    .line 944
    .local v8, "blockId":I
    long-to-int v9, v6

    add-int/lit8 v9, v9, -0x4

    new-array v9, v9, [B

    .line 945
    .local v9, "blockValue":[B
    invoke-virtual {v2, v9}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 946
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v10

    invoke-interface {v3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 947
    .end local v6    # "blockLength":J
    .end local v8    # "blockId":I
    .end local v9    # "blockValue":[B
    goto :goto_0

    .line 937
    .restart local v6    # "blockLength":J
    :cond_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Block index "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 938
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v8, " size out of range: "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 948
    .end local v6    # "blockLength":J
    :cond_1
    return-object v3

    .line 925
    .end local v2    # "apkSigningBlockBuffer":Ljava/nio/ByteBuffer;
    .end local v3    # "signatureBlocks":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;>;"
    :cond_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "APK signing block size out of range: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static getChunkCount(JJ)J
    .locals 4
    .param p0, "inputSize"    # J
    .param p2, "chunkSize"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "inputSize",
            "chunkSize"
        }
    .end annotation

    .line 655
    add-long v0, p0, p2

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    div-long/2addr v0, p2

    return-wide v0
.end method

.method public static getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 1
    .param p0, "source"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "source"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 248
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public static getSignaturesToVerify(Ljava/util/List;II)Ljava/util/List;
    .locals 1
    .param p1, "minSdkVersion"    # I
    .param p2, "maxSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "signatures",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/android/apksig/internal/apk/ApkSupportedSignature;",
            ">(",
            "Ljava/util/List<",
            "TT;>;II)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$NoSupportedSignaturesException;
        }
    .end annotation

    .line 1084
    .local p0, "signatures":Ljava/util/List;, "Ljava/util/List<TT;>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getSignaturesToVerify(Ljava/util/List;IIZ)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getSignaturesToVerify(Ljava/util/List;IIZ)Ljava/util/List;
    .locals 3
    .param p1, "minSdkVersion"    # I
    .param p2, "maxSdkVersion"    # I
    .param p3, "onlyRequireJcaSupport"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "signatures",
            "minSdkVersion",
            "maxSdkVersion",
            "onlyRequireJcaSupport"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/android/apksig/internal/apk/ApkSupportedSignature;",
            ">(",
            "Ljava/util/List<",
            "TT;>;IIZ)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$NoSupportedSignaturesException;
        }
    .end annotation

    .line 1106
    .local p0, "signatures":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :try_start_0
    invoke-static {p0, p1, p2, p3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getSignaturesToVerify(Ljava/util/List;IIZ)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/internal/apk/NoApkSupportedSignaturesException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 1108
    :catch_0
    move-exception v0

    .line 1109
    .local v0, "e":Lcom/android/apksig/internal/apk/NoApkSupportedSignaturesException;
    new-instance v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$NoSupportedSignaturesException;

    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/NoApkSupportedSignaturesException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$NoSupportedSignaturesException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static synthetic lambda$computeOneMbChunkContentDigests$0(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;Ljava/util/List;)Ljava/lang/Runnable;
    .locals 2
    .param p0, "chunkSupplier"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;
    .param p1, "chunkDigestsList"    # Ljava/util/List;

    .line 410
    new-instance v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;-><init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;Ljava/util/List;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$1;)V

    return-object v0
.end method

.method public static pickBestDigestForV4(Ljava/util/Map;)[B
    .locals 5
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
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;)[B"
        }
    .end annotation

    .line 1245
    .local p0, "contentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    sget-object v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->V4_CONTENT_DIGEST_ALGORITHMS:[Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 1246
    .local v3, "algo":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    invoke-interface {p0, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1247
    invoke-interface {p0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0

    .line 1245
    .end local v3    # "algo":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1250
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B
    .locals 1
    .param p0, "buf"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buf"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 252
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v0

    return-object v0
.end method

.method private static setUnsignedInt32LittleEndian(I[BI)V
    .locals 2
    .param p0, "value"    # I
    .param p1, "result"    # [B
    .param p2, "offset"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "value",
            "result",
            "offset"
        }
    .end annotation

    .line 659
    and-int/lit16 v0, p0, 0xff

    int-to-byte v0, v0

    aput-byte v0, p1, p2

    .line 660
    add-int/lit8 v0, p2, 0x1

    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 661
    add-int/lit8 v0, p2, 0x2

    shr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 662
    add-int/lit8 v0, p2, 0x3

    shr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p1, v0

    .line 663
    return-void
.end method

.method public static toHex([B)Ljava/lang/String;
    .locals 1
    .param p0, "value"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 256
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->toHex([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static verifyIntegrity(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/nio/ByteBuffer;Ljava/util/Set;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V
    .locals 18
    .param p0, "executor"    # Lcom/android/apksig/util/RunnablesExecutor;
    .param p1, "beforeApkSigningBlock"    # Lcom/android/apksig/util/DataSource;
    .param p2, "centralDir"    # Lcom/android/apksig/util/DataSource;
    .param p3, "eocd"    # Ljava/nio/ByteBuffer;
    .param p5, "result"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
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
            "executor",
            "beforeApkSigningBlock",
            "centralDir",
            "eocd",
            "contentDigestAlgorithms",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/RunnablesExecutor;",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/util/DataSource;",
            "Ljava/nio/ByteBuffer;",
            "Ljava/util/Set<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            ">;",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 139
    .local p4, "contentDigestAlgorithms":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-interface/range {p4 .. p4}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_b

    .line 148
    invoke-virtual/range {p3 .. p3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 149
    .local v4, "modifiedEocd":Ljava/nio/ByteBuffer;
    invoke-virtual/range {p3 .. p3}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    .line 150
    .local v5, "eocdSavedPos":I
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 151
    invoke-virtual {v4, v1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 152
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 155
    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 156
    invoke-interface/range {p1 .. p1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v6

    invoke-static {v4, v6, v7}, Lcom/android/apksig/internal/zip/ZipUtils;->setZipEocdCentralDirectoryOffset(Ljava/nio/ByteBuffer;J)V

    .line 159
    :try_start_0
    new-instance v0, Lcom/android/apksig/internal/util/ByteBufferDataSource;

    invoke-direct {v0, v4}, Lcom/android/apksig/internal/util/ByteBufferDataSource;-><init>(Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catch Ljava/security/DigestException; {:try_start_0 .. :try_end_0} :catch_2

    .line 160
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    :try_start_1
    invoke-static {v6, v2, v7, v8, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->computeContentDigests(Lcom/android/apksig/util/RunnablesExecutor;Ljava/util/Set;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;)Ljava/util/Map;

    move-result-object v0

    .line 167
    .local v0, "actualContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    sget-object v9, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->VERITY_CHUNKED_SHA256:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    invoke-interface {v0, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9
    :try_end_1
    .catch Ljava/security/DigestException; {:try_start_1 .. :try_end_1} :catch_1

    if-eqz v9, :cond_2

    .line 168
    :try_start_2
    invoke-interface/range {p1 .. p1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v9

    const-wide/16 v11, 0x1000

    rem-long/2addr v9, v11

    const-wide/16 v13, 0x0

    cmp-long v9, v9, v13

    if-nez v9, :cond_1

    .line 174
    invoke-static/range {p3 .. p3}, Lcom/android/apksig/internal/zip/ZipUtils;->getZipEocdCentralDirectoryOffset(Ljava/nio/ByteBuffer;)J

    move-result-wide v9

    .line 175
    .local v9, "centralDirOffset":J
    invoke-interface/range {p1 .. p1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v15

    sub-long v13, v9, v15

    .line 176
    .local v13, "signingBlockSize":J
    rem-long v11, v13, v11

    const-wide/16 v15, 0x0

    cmp-long v11, v11, v15

    if-nez v11, :cond_0

    goto :goto_0

    .line 177
    :cond_0
    new-instance v11, Ljava/lang/RuntimeException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "APK Signing Block size is not multiple of page size: "

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .end local v4    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .end local v5    # "eocdSavedPos":I
    .end local p0    # "executor":Lcom/android/apksig/util/RunnablesExecutor;
    .end local p1    # "beforeApkSigningBlock":Lcom/android/apksig/util/DataSource;
    .end local p2    # "centralDir":Lcom/android/apksig/util/DataSource;
    .end local p3    # "eocd":Ljava/nio/ByteBuffer;
    .end local p4    # "contentDigestAlgorithms":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    .end local p5    # "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    throw v11

    .line 169
    .end local v9    # "centralDirOffset":J
    .end local v13    # "signingBlockSize":J
    .restart local v4    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .restart local v5    # "eocdSavedPos":I
    .restart local p0    # "executor":Lcom/android/apksig/util/RunnablesExecutor;
    .restart local p1    # "beforeApkSigningBlock":Lcom/android/apksig/util/DataSource;
    .restart local p2    # "centralDir":Lcom/android/apksig/util/DataSource;
    .restart local p3    # "eocd":Ljava/nio/ByteBuffer;
    .restart local p4    # "contentDigestAlgorithms":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    .restart local p5    # "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    :cond_1
    new-instance v9, Ljava/lang/RuntimeException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "APK Signing Block is not aligned on 4k boundary: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 171
    invoke-interface/range {p1 .. p1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v11

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .end local v4    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .end local v5    # "eocdSavedPos":I
    .end local p0    # "executor":Lcom/android/apksig/util/RunnablesExecutor;
    .end local p1    # "beforeApkSigningBlock":Lcom/android/apksig/util/DataSource;
    .end local p2    # "centralDir":Lcom/android/apksig/util/DataSource;
    .end local p3    # "eocd":Ljava/nio/ByteBuffer;
    .end local p4    # "contentDigestAlgorithms":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    .end local p5    # "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    throw v9
    :try_end_2
    .catch Ljava/security/DigestException; {:try_start_2 .. :try_end_2} :catch_0

    .line 182
    .end local v0    # "actualContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    .restart local v4    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .restart local v5    # "eocdSavedPos":I
    .restart local p0    # "executor":Lcom/android/apksig/util/RunnablesExecutor;
    .restart local p1    # "beforeApkSigningBlock":Lcom/android/apksig/util/DataSource;
    .restart local p2    # "centralDir":Lcom/android/apksig/util/DataSource;
    .restart local p3    # "eocd":Ljava/nio/ByteBuffer;
    .restart local p4    # "contentDigestAlgorithms":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    .restart local p5    # "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    :catch_0
    move-exception v0

    move-object/from16 v16, v4

    move/from16 v17, v5

    goto/16 :goto_4

    .line 184
    .restart local v0    # "actualContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    :cond_2
    :goto_0
    nop

    .line 185
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 194
    iget-object v9, v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_9

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    .line 195
    .local v10, "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    iget-object v11, v10, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->contentDigests:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_8

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;

    .line 196
    .local v12, "expected":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    nop

    .line 197
    invoke-virtual {v12}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;->getSignatureAlgorithmId()I

    move-result v13

    invoke-static {v13}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v13

    .line 198
    .local v13, "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    if-nez v13, :cond_3

    .line 199
    goto :goto_2

    .line 201
    :cond_3
    nop

    .line 202
    invoke-virtual {v13}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getContentDigestAlgorithm()Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    move-result-object v14

    .line 206
    .local v14, "contentDigestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    invoke-interface {v2, v14}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_4

    .line 207
    goto :goto_2

    .line 209
    :cond_4
    invoke-virtual {v12}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;->getValue()[B

    move-result-object v15

    .line 210
    .local v15, "expectedDigest":[B
    invoke-interface {v0, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v1, v16

    check-cast v1, [B

    .line 211
    .local v1, "actualDigest":[B
    invoke-static {v15, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v16

    if-nez v16, :cond_7

    .line 212
    move-object/from16 v16, v4

    .end local v4    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .local v16, "modifiedEocd":Ljava/nio/ByteBuffer;
    iget v4, v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signatureSchemeVersion:I

    move/from16 v17, v5

    .end local v5    # "eocdSavedPos":I
    .local v17, "eocdSavedPos":I
    const/4 v5, 0x2

    if-ne v4, v5, :cond_5

    .line 213
    sget-object v4, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_APK_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 216
    invoke-static {v15}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->toHex([B)Ljava/lang/String;

    move-result-object v5

    .line 217
    invoke-static {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->toHex([B)Ljava/lang/String;

    move-result-object v6

    filled-new-array {v14, v5, v6}, [Ljava/lang/Object;

    move-result-object v5

    .line 213
    invoke-virtual {v10, v4, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    move-object/from16 v6, p0

    move-object/from16 v1, p3

    move-object/from16 v4, v16

    move/from16 v5, v17

    goto :goto_2

    .line 218
    :cond_5
    iget v4, v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signatureSchemeVersion:I

    const/4 v5, 0x3

    if-ne v4, v5, :cond_6

    .line 219
    sget-object v4, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_APK_DIGEST_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 222
    invoke-static {v15}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->toHex([B)Ljava/lang/String;

    move-result-object v5

    .line 223
    invoke-static {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->toHex([B)Ljava/lang/String;

    move-result-object v6

    filled-new-array {v14, v5, v6}, [Ljava/lang/Object;

    move-result-object v5

    .line 219
    invoke-virtual {v10, v4, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    move-object/from16 v6, p0

    move-object/from16 v1, p3

    move-object/from16 v4, v16

    move/from16 v5, v17

    goto :goto_2

    .line 218
    :cond_6
    move-object/from16 v6, p0

    move-object/from16 v1, p3

    move-object/from16 v4, v16

    move/from16 v5, v17

    goto/16 :goto_2

    .line 227
    .end local v16    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .end local v17    # "eocdSavedPos":I
    .restart local v4    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .restart local v5    # "eocdSavedPos":I
    :cond_7
    move-object/from16 v16, v4

    move/from16 v17, v5

    .end local v4    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .end local v5    # "eocdSavedPos":I
    .restart local v16    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .restart local v17    # "eocdSavedPos":I
    iget-object v4, v10, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->verifiedContentDigests:Ljava/util/Map;

    invoke-interface {v4, v14, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    .end local v1    # "actualDigest":[B
    .end local v12    # "expected":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    .end local v13    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v14    # "contentDigestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    .end local v15    # "expectedDigest":[B
    move-object/from16 v6, p0

    move-object/from16 v1, p3

    move-object/from16 v4, v16

    goto/16 :goto_2

    .line 195
    .end local v16    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .end local v17    # "eocdSavedPos":I
    .restart local v4    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .restart local v5    # "eocdSavedPos":I
    :cond_8
    move-object/from16 v16, v4

    move/from16 v17, v5

    .line 229
    .end local v4    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .end local v5    # "eocdSavedPos":I
    .end local v10    # "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    .restart local v16    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .restart local v17    # "eocdSavedPos":I
    move-object/from16 v6, p0

    move-object/from16 v1, p3

    goto/16 :goto_1

    .line 230
    .end local v16    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .end local v17    # "eocdSavedPos":I
    .restart local v4    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .restart local v5    # "eocdSavedPos":I
    :cond_9
    return-void

    .line 186
    :cond_a
    move-object/from16 v16, v4

    move/from16 v17, v5

    .end local v4    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .end local v5    # "eocdSavedPos":I
    .restart local v16    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .restart local v17    # "eocdSavedPos":I
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Mismatch between sets of requested and computed content digests . Requested: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", computed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 189
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 182
    .end local v0    # "actualContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    .end local v16    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .end local v17    # "eocdSavedPos":I
    .restart local v4    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .restart local v5    # "eocdSavedPos":I
    :catch_1
    move-exception v0

    goto :goto_3

    :catch_2
    move-exception v0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    :goto_3
    move-object/from16 v16, v4

    move/from16 v17, v5

    .line 183
    .end local v4    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .end local v5    # "eocdSavedPos":I
    .local v0, "e":Ljava/security/DigestException;
    .restart local v16    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .restart local v17    # "eocdSavedPos":I
    :goto_4
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v4, "Failed to compute content digests"

    invoke-direct {v1, v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 142
    .end local v0    # "e":Ljava/security/DigestException;
    .end local v16    # "modifiedEocd":Ljava/nio/ByteBuffer;
    .end local v17    # "eocdSavedPos":I
    :cond_b
    move-object/from16 v7, p1

    move-object/from16 v8, p2

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "No content digests found"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
