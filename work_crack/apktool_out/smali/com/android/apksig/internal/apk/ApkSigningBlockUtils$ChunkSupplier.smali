.class Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;
.super Ljava/lang/Object;
.source "ApkSigningBlockUtils.java"

# interfaces
.implements Ljava/util/function/Supplier;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ChunkSupplier"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/function/Supplier<",
        "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;",
        ">;"
    }
.end annotation


# instance fields
.field private final chunkCounts:[I

.field private final dataSources:[Lcom/android/apksig/util/DataSource;

.field private final nextIndex:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final totalChunkCount:I


# direct methods
.method private constructor <init>([Lcom/android/apksig/util/DataSource;)V
    .locals 7
    .param p1, "dataSources"    # [Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dataSources"
        }
    .end annotation

    .line 522
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 523
    iput-object p1, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;->dataSources:[Lcom/android/apksig/util/DataSource;

    .line 524
    array-length v0, p1

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;->chunkCounts:[I

    .line 525
    const/4 v0, 0x0

    .line 526
    .local v0, "totalChunkCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 527
    aget-object v2, p1, v1

    invoke-interface {v2}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v2

    const-wide/32 v4, 0x100000

    invoke-static {v2, v3, v4, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->access$1100(JJ)J

    move-result-wide v2

    .line 529
    .local v2, "chunkCount":J
    const-wide/32 v4, 0x7fffffff

    cmp-long v4, v2, v4

    if-gtz v4, :cond_0

    .line 535
    iget-object v4, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;->chunkCounts:[I

    long-to-int v5, v2

    aput v5, v4, v1

    .line 536
    int-to-long v4, v0

    add-long/2addr v4, v2

    long-to-int v0, v4

    .line 526
    .end local v2    # "chunkCount":J
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 530
    .restart local v2    # "chunkCount":J
    :cond_0
    new-instance v4, Ljava/lang/RuntimeException;

    .line 533
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    .line 531
    const-string v6, "Number of chunks in dataSource[%d] is greater than max int."

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 538
    .end local v1    # "i":I
    .end local v2    # "chunkCount":J
    :cond_1
    iput v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;->totalChunkCount:I

    .line 539
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;->nextIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 540
    return-void
.end method

.method synthetic constructor <init>([Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$1;)V
    .locals 0
    .param p1, "x0"    # [Lcom/android/apksig/util/DataSource;
    .param p2, "x1"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$1;

    .line 516
    invoke-direct {p0, p1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;-><init>([Lcom/android/apksig/util/DataSource;)V

    return-void
.end method


# virtual methods
.method public get()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;
    .locals 12

    .line 550
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;->nextIndex:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    .line 551
    .local v0, "index":I
    const/4 v1, 0x0

    if-ltz v0, :cond_3

    iget v2, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;->totalChunkCount:I

    if-lt v0, v2, :cond_0

    goto :goto_2

    .line 555
    :cond_0
    const/4 v2, 0x0

    .line 556
    .local v2, "dataSourceIndex":I
    int-to-long v3, v0

    .line 557
    .local v3, "dataSourceChunkOffset":J
    :goto_0
    iget-object v5, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;->dataSources:[Lcom/android/apksig/util/DataSource;

    array-length v6, v5

    if-ge v2, v6, :cond_2

    .line 558
    iget-object v6, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;->chunkCounts:[I

    aget v6, v6, v2

    int-to-long v7, v6

    cmp-long v7, v3, v7

    if-gez v7, :cond_1

    .line 559
    goto :goto_1

    .line 561
    :cond_1
    int-to-long v5, v6

    sub-long/2addr v3, v5

    .line 557
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 564
    :cond_2
    :goto_1
    aget-object v5, v5, v2

    .line 565
    invoke-interface {v5}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v5

    const-wide/32 v7, 0x100000

    mul-long v9, v3, v7

    sub-long/2addr v5, v9

    .line 564
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    .line 569
    .local v5, "remainingSize":J
    long-to-int v9, v5

    .line 570
    .local v9, "size":I
    invoke-static {v9}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v10

    .line 572
    .local v10, "buffer":Ljava/nio/ByteBuffer;
    :try_start_0
    iget-object v11, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;->dataSources:[Lcom/android/apksig/util/DataSource;

    aget-object v11, v11, v2

    mul-long/2addr v7, v3

    invoke-interface {v11, v7, v8, v9, v10}, Lcom/android/apksig/util/DataSource;->copyTo(JILjava/nio/ByteBuffer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 577
    nop

    .line 578
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 580
    new-instance v7, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;

    invoke-direct {v7, v0, v10, v9, v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;-><init>(ILjava/nio/ByteBuffer;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$1;)V

    return-object v7

    .line 575
    :catch_0
    move-exception v1

    .line 576
    .local v1, "e":Ljava/io/IOException;
    new-instance v7, Ljava/lang/IllegalStateException;

    const-string v8, "Failed to read chunk"

    invoke-direct {v7, v8, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 552
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "dataSourceIndex":I
    .end local v3    # "dataSourceChunkOffset":J
    .end local v5    # "remainingSize":J
    .end local v9    # "size":I
    .end local v10    # "buffer":Ljava/nio/ByteBuffer;
    :cond_3
    :goto_2
    return-object v1
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .line 516
    invoke-virtual {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;->get()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;

    move-result-object v0

    return-object v0
.end method
