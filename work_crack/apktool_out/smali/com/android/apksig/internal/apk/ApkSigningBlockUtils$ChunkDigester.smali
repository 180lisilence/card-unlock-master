.class Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;
.super Ljava/lang/Object;
.source "ApkSigningBlockUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ChunkDigester"
.end annotation


# instance fields
.field private final chunkDigests:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;",
            ">;"
        }
    .end annotation
.end field

.field private final dataSupplier:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;

.field private final mdSink:Lcom/android/apksig/util/DataSink;

.field private final messageDigests:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/security/MessageDigest;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;Ljava/util/List;)V
    .locals 4
    .param p1, "dataSupplier"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dataSupplier",
            "chunkDigests"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;",
            ">;)V"
        }
    .end annotation

    .line 455
    .local p2, "chunkDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 456
    iput-object p1, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;->dataSupplier:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;

    .line 457
    iput-object p2, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;->chunkDigests:Ljava/util/List;

    .line 458
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;->messageDigests:Ljava/util/List;

    .line 459
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;

    .line 461
    .local v1, "chunkDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;
    :try_start_0
    iget-object v2, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;->messageDigests:Ljava/util/List;

    invoke-static {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->access$200(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;)Ljava/security/MessageDigest;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 464
    nop

    .line 465
    .end local v1    # "chunkDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;
    goto :goto_0

    .line 462
    .restart local v1    # "chunkDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;
    :catch_0
    move-exception v0

    .line 463
    .local v0, "ex":Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 466
    .end local v0    # "ex":Ljava/security/NoSuchAlgorithmException;
    .end local v1    # "chunkDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;
    :cond_0
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;->messageDigests:Ljava/util/List;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/security/MessageDigest;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/security/MessageDigest;

    invoke-static {v0}, Lcom/android/apksig/util/DataSinks;->asDataSink([Ljava/security/MessageDigest;)Lcom/android/apksig/util/DataSink;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;->mdSink:Lcom/android/apksig/util/DataSink;

    .line 467
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;Ljava/util/List;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;
    .param p2, "x1"    # Ljava/util/List;
    .param p3, "x2"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$1;

    .line 449
    invoke-direct {p0, p1, p2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;-><init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 471
    const/4 v0, 0x5

    new-array v0, v0, [B

    .line 472
    .local v0, "chunkContentPrefix":[B
    const/16 v1, -0x5b

    const/4 v2, 0x0

    aput-byte v1, v0, v2

    .line 475
    :try_start_0
    iget-object v1, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;->dataSupplier:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;

    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;->get()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;

    move-result-object v1

    .line 476
    .local v1, "chunk":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;
    :goto_0
    if-eqz v1, :cond_3

    .line 478
    invoke-static {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;->access$600(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;)I

    move-result v3

    .line 479
    .local v3, "size":I
    int-to-long v4, v3

    const-wide/32 v6, 0x100000

    cmp-long v4, v4, v6

    if-gtz v4, :cond_2

    .line 484
    const/4 v4, 0x1

    invoke-static {v3, v0, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->access$500(I[BI)V

    .line 485
    iget-object v4, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;->mdSink:Lcom/android/apksig/util/DataSink;

    array-length v5, v0

    invoke-interface {v4, v0, v2, v5}, Lcom/android/apksig/util/DataSink;->consume([BII)V

    .line 488
    iget-object v4, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;->mdSink:Lcom/android/apksig/util/DataSink;

    invoke-static {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;->access$700(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;)Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/android/apksig/util/DataSink;->consume(Ljava/nio/ByteBuffer;)V

    .line 491
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    iget-object v5, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;->chunkDigests:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 492
    iget-object v5, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;->chunkDigests:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;

    .line 493
    .local v5, "chunkDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;
    iget-object v6, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;->messageDigests:Ljava/util/List;

    invoke-interface {v6, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/security/MessageDigest;

    .line 494
    invoke-static {v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->access$400(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;)[B

    move-result-object v7

    .line 495
    invoke-static {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;->access$800(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;)I

    move-result v8

    invoke-static {v5, v8}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->access$900(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;I)I

    move-result v8

    .line 496
    invoke-static {v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->access$1000(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;)I

    move-result v9

    .line 493
    invoke-virtual {v6, v7, v8, v9}, Ljava/security/MessageDigest;->digest([BII)I

    move-result v6

    .line 497
    .local v6, "actualDigestSize":I
    invoke-static {v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->access$1000(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;)I

    move-result v7

    if-ne v6, v7, :cond_0

    .line 491
    .end local v5    # "chunkDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;
    .end local v6    # "actualDigestSize":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 498
    .restart local v5    # "chunkDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;
    .restart local v6    # "actualDigestSize":I
    :cond_0
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unexpected output size of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 499
    invoke-static {v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->access$300(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;)Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " digest: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .end local v0    # "chunkContentPrefix":[B
    throw v2

    .line 477
    .end local v3    # "size":I
    .end local v4    # "i":I
    .end local v5    # "chunkDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;
    .end local v6    # "actualDigestSize":I
    .restart local v0    # "chunkContentPrefix":[B
    :cond_1
    iget-object v3, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigester;->dataSupplier:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;

    invoke-virtual {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;->get()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;

    move-result-object v3

    move-object v1, v3

    goto/16 :goto_0

    .line 480
    .restart local v3    # "size":I
    :cond_2
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Chunk size greater than expected: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .end local v0    # "chunkContentPrefix":[B
    throw v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/DigestException; {:try_start_0 .. :try_end_0} :catch_0

    .line 506
    .end local v1    # "chunk":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;
    .end local v3    # "size":I
    .restart local v0    # "chunkContentPrefix":[B
    :cond_3
    nop

    .line 507
    return-void

    .line 504
    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    .line 505
    .local v1, "e":Ljava/lang/Exception;
    :goto_2
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method
