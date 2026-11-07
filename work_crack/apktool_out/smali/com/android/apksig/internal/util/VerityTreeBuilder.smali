.class public Lcom/android/apksig/internal/util/VerityTreeBuilder;
.super Ljava/lang/Object;
.source "VerityTreeBuilder.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# static fields
.field private static final CHUNK_SIZE:I = 0x1000

.field private static final DIGEST_PARALLELISM:I

.field private static final JCA_ALGORITHM:Ljava/lang/String; = "SHA-256"

.field private static final MAX_OUTSTANDING_CHUNKS:I = 0x4

.field private static final MAX_PREFETCH_CHUNKS:I = 0x400

.field private static final MIN_CHUNKS_PER_WORKER:I = 0x8


# instance fields
.field private final mExecutor:Ljava/util/concurrent/ExecutorService;

.field private final mMd:Ljava/security/MessageDigest;

.field private final mSalt:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 53
    nop

    .line 54
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    .line 53
    const/16 v1, 0x20

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    sput v0, Lcom/android/apksig/internal/util/VerityTreeBuilder;->DIGEST_PARALLELISM:I

    return-void
.end method

.method public constructor <init>([B)V
    .locals 9
    .param p1, "salt"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "salt"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    new-instance v8, Ljava/util/concurrent/ThreadPoolExecutor;

    sget v2, Lcom/android/apksig/internal/util/VerityTreeBuilder;->DIGEST_PARALLELISM:I

    const-wide/16 v3, 0x0

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/ArrayBlockingQueue;

    const/4 v0, 0x4

    invoke-direct {v6, v0}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    new-instance v7, Ljava/util/concurrent/ThreadPoolExecutor$CallerRunsPolicy;

    invoke-direct {v7}, Ljava/util/concurrent/ThreadPoolExecutor$CallerRunsPolicy;-><init>()V

    move-object v0, v8

    move v1, v2

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/RejectedExecutionHandler;)V

    iput-object v8, p0, Lcom/android/apksig/internal/util/VerityTreeBuilder;->mExecutor:Ljava/util/concurrent/ExecutorService;

    .line 87
    iput-object p1, p0, Lcom/android/apksig/internal/util/VerityTreeBuilder;->mSalt:[B

    .line 88
    invoke-static {}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->getNewMessageDigest()Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/internal/util/VerityTreeBuilder;->mMd:Ljava/security/MessageDigest;

    .line 89
    return-void
.end method

.method private static calculateLevelOffset(JI)[I
    .locals 9
    .param p0, "dataSize"    # J
    .param p2, "digestSize"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dataSize",
            "digestSize"
        }
    .end annotation

    .line 195
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 197
    .local v0, "levelSize":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    :goto_0
    const-wide/16 v1, 0x1000

    invoke-static {p0, p1, v1, v2}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->divideRoundup(JJ)J

    move-result-wide v3

    .line 198
    .local v3, "chunkCount":J
    int-to-long v5, p2

    mul-long/2addr v5, v3

    invoke-static {v5, v6, v1, v2}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->divideRoundup(JJ)J

    move-result-wide v5

    mul-long/2addr v5, v1

    .line 199
    .local v5, "size":J
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    int-to-long v7, p2

    mul-long/2addr v7, v3

    cmp-long v1, v7, v1

    if-gtz v1, :cond_1

    .line 201
    nop

    .line 207
    .end local v3    # "chunkCount":J
    .end local v5    # "size":J
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    new-array v1, v1, [I

    .line 208
    .local v1, "levelOffset":[I
    const/4 v2, 0x0

    aput v2, v1, v2

    .line 209
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 211
    add-int/lit8 v3, v2, 0x1

    aget v4, v1, v2

    .line 212
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    sub-int/2addr v5, v2

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 211
    invoke-static {v5, v6}, Ljava/lang/Math;->toIntExact(J)I

    move-result v5

    add-int/2addr v4, v5

    aput v4, v1, v3

    .line 209
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 214
    .end local v2    # "i":I
    :cond_0
    return-object v1

    .line 203
    .end local v1    # "levelOffset":[I
    .restart local v3    # "chunkCount":J
    .restart local v5    # "size":J
    :cond_1
    int-to-long v1, p2

    mul-long p0, v3, v1

    .line 204
    .end local v3    # "chunkCount":J
    .end local v5    # "size":J
    goto :goto_0
.end method

.method private cloneMessageDigest()Ljava/security/MessageDigest;
    .locals 4

    .line 315
    :try_start_0
    iget-object v0, p0, Lcom/android/apksig/internal/util/VerityTreeBuilder;->mMd:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 316
    :catch_0
    move-exception v0

    .line 318
    .local v0, "ignored":Ljava/lang/CloneNotSupportedException;
    :try_start_1
    invoke-static {}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->getNewMessageDigest()Ljava/security/MessageDigest;

    move-result-object v1
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1

    return-object v1

    .line 319
    :catch_1
    move-exception v1

    .line 320
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Failed to obtain an instance of a previously available message digest"

    invoke-direct {v2, v3, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private digestDataByChunks(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSink;)V
    .locals 23
    .param p1, "dataSource"    # Lcom/android/apksig/util/DataSource;
    .param p2, "dataSink"    # Lcom/android/apksig/util/DataSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dataSource",
            "dataSink"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 223
    invoke-interface/range {p1 .. p1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v0

    .line 224
    .local v0, "size":J
    const-wide/16 v2, 0x1000

    invoke-static {v0, v1, v2, v3}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->divideRoundup(JJ)J

    move-result-wide v4

    long-to-int v4, v4

    .line 227
    .local v4, "chunks":I
    const/16 v5, 0x400

    .line 229
    .local v5, "ioSizeChunks":I
    new-array v12, v4, [[B

    .line 231
    .local v12, "hashes":[[B
    new-instance v11, Ljava/util/concurrent/Phaser;

    const/4 v6, 0x1

    invoke-direct {v11, v6}, Ljava/util/concurrent/Phaser;-><init>(I)V

    .line 234
    .local v11, "tasks":Ljava/util/concurrent/Phaser;
    const-wide/32 v13, 0x400000

    .line 236
    .local v13, "maxReadSize":J
    const-wide/16 v6, 0x0

    .line 237
    .local v6, "readOffset":J
    const/4 v8, 0x0

    move v15, v8

    move-wide v7, v6

    .line 238
    .end local v6    # "readOffset":J
    .local v7, "readOffset":J
    .local v15, "startChunkIndex":I
    :goto_0
    cmp-long v6, v7, v0

    if-gez v6, :cond_0

    .line 239
    const-wide/32 v9, 0x400000

    add-long/2addr v9, v7

    invoke-static {v9, v10, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v16

    .line 240
    .local v16, "readLimit":J
    sub-long v9, v16, v7

    long-to-int v10, v9

    .line 241
    .local v10, "readSize":I
    move-wide/from16 v18, v0

    .end local v0    # "size":J
    .local v18, "size":J
    int-to-long v0, v10

    invoke-static {v0, v1, v2, v3}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->divideRoundup(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    .line 245
    .local v0, "bufferSizeChunks":I
    mul-int/lit16 v1, v0, 0x1000

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 246
    .local v1, "buffer":Ljava/nio/ByteBuffer;
    move-object/from16 v6, p1

    invoke-interface {v6, v7, v8, v10, v1}, Lcom/android/apksig/util/DataSource;->copyTo(JILjava/nio/ByteBuffer;)V

    .line 247
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 249
    move v9, v15

    .line 250
    .local v9, "readChunkIndex":I
    new-instance v20, Lcom/android/apksig/internal/util/VerityTreeBuilder$$ExternalSyntheticLambda0;

    move-object/from16 v6, v20

    move-wide/from16 v21, v7

    .end local v7    # "readOffset":J
    .local v21, "readOffset":J
    move-object/from16 v7, p0

    move-object v8, v1

    move v2, v10

    .end local v10    # "readSize":I
    .local v2, "readSize":I
    move-object v10, v12

    invoke-direct/range {v6 .. v11}, Lcom/android/apksig/internal/util/VerityTreeBuilder$$ExternalSyntheticLambda0;-><init>(Lcom/android/apksig/internal/util/VerityTreeBuilder;Ljava/nio/ByteBuffer;I[[BLjava/util/concurrent/Phaser;)V

    move-object/from16 v3, v20

    .line 259
    .local v3, "task":Ljava/lang/Runnable;
    invoke-virtual {v11}, Ljava/util/concurrent/Phaser;->register()I

    .line 260
    move-object/from16 v6, p0

    iget-object v7, v6, Lcom/android/apksig/internal/util/VerityTreeBuilder;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v7, v3}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 262
    add-int/2addr v15, v0

    .line 263
    int-to-long v7, v2

    add-long v7, v21, v7

    .line 264
    .end local v0    # "bufferSizeChunks":I
    .end local v1    # "buffer":Ljava/nio/ByteBuffer;
    .end local v2    # "readSize":I
    .end local v3    # "task":Ljava/lang/Runnable;
    .end local v9    # "readChunkIndex":I
    .end local v16    # "readLimit":J
    .end local v21    # "readOffset":J
    .restart local v7    # "readOffset":J
    move-wide/from16 v0, v18

    const-wide/16 v2, 0x1000

    goto :goto_0

    .line 267
    .end local v18    # "size":J
    .local v0, "size":J
    :cond_0
    move-object/from16 v6, p0

    move-wide/from16 v18, v0

    move-wide/from16 v21, v7

    .end local v0    # "size":J
    .end local v7    # "readOffset":J
    .restart local v18    # "size":J
    .restart local v21    # "readOffset":J
    invoke-virtual {v11}, Ljava/util/concurrent/Phaser;->arriveAndAwaitAdvance()I

    .line 270
    array-length v0, v12

    const/4 v1, 0x0

    move v2, v1

    :goto_1
    if-ge v2, v0, :cond_1

    aget-object v3, v12, v2

    .line 271
    .local v3, "hash":[B
    array-length v7, v3

    move-object/from16 v8, p2

    invoke-interface {v8, v3, v1, v7}, Lcom/android/apksig/util/DataSink;->consume([BII)V

    .line 270
    .end local v3    # "hash":[B
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 273
    :cond_1
    move-object/from16 v8, p2

    return-void
.end method

.method private static divideRoundup(JJ)J
    .locals 4
    .param p0, "dividend"    # J
    .param p2, "divisor"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dividend",
            "divisor"
        }
    .end annotation

    .line 291
    add-long v0, p0, p2

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    div-long/2addr v0, p2

    return-wide v0
.end method

.method private static getNewMessageDigest()Ljava/security/MessageDigest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 307
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    return-object v0
.end method

.method private saltedDigest(Ljava/nio/ByteBuffer;)[B
    .locals 1
    .param p1, "data"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .line 277
    iget-object v0, p0, Lcom/android/apksig/internal/util/VerityTreeBuilder;->mMd:Ljava/security/MessageDigest;

    invoke-direct {p0, v0, p1}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->saltedDigest(Ljava/security/MessageDigest;Ljava/nio/ByteBuffer;)[B

    move-result-object v0

    return-object v0
.end method

.method private saltedDigest(Ljava/security/MessageDigest;Ljava/nio/ByteBuffer;)[B
    .locals 1
    .param p1, "md"    # Ljava/security/MessageDigest;
    .param p2, "data"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "md",
            "data"
        }
    .end annotation

    .line 281
    invoke-virtual {p1}, Ljava/security/MessageDigest;->reset()V

    .line 282
    iget-object v0, p0, Lcom/android/apksig/internal/util/VerityTreeBuilder;->mSalt:[B

    if-eqz v0, :cond_0

    .line 283
    invoke-virtual {p1, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 285
    :cond_0
    invoke-virtual {p1, p2}, Ljava/security/MessageDigest;->update(Ljava/nio/ByteBuffer;)V

    .line 286
    invoke-virtual {p1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    return-object v0
.end method

.method private static slice(Ljava/nio/ByteBuffer;II)Ljava/nio/ByteBuffer;
    .locals 2
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;
    .param p1, "begin"    # I
    .param p2, "end"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "buffer",
            "begin",
            "end"
        }
    .end annotation

    .line 296
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 297
    .local v0, "b":Ljava/nio/ByteBuffer;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 298
    invoke-virtual {v0, p2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 299
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 300
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/android/apksig/internal/util/VerityTreeBuilder;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 94
    return-void
.end method

.method public generateVerityTree(Lcom/android/apksig/util/DataSource;)Ljava/nio/ByteBuffer;
    .locals 12
    .param p1, "fileSource"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "fileSource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 146
    iget-object v0, p0, Lcom/android/apksig/internal/util/VerityTreeBuilder;->mMd:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->getDigestLength()I

    move-result v0

    .line 150
    .local v0, "digestSize":I
    invoke-interface {p1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v1

    invoke-static {v1, v2, v0}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->calculateLevelOffset(JI)[I

    move-result-object v1

    .line 152
    .local v1, "levelOffset":[I
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    aget v2, v1, v2

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 155
    .local v2, "verityBuffer":Ljava/nio/ByteBuffer;
    array-length v3, v1

    add-int/lit8 v3, v3, -0x2

    .local v3, "i":I
    :goto_0
    if-ltz v3, :cond_2

    .line 156
    new-instance v4, Lcom/android/apksig/internal/util/ByteBufferSink;

    aget v5, v1, v3

    add-int/lit8 v6, v3, 0x1

    aget v6, v1, v6

    .line 157
    invoke-static {v2, v5, v6}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->slice(Ljava/nio/ByteBuffer;II)Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/android/apksig/internal/util/ByteBufferSink;-><init>(Ljava/nio/ByteBuffer;)V

    .line 159
    .local v4, "middleBufferSink":Lcom/android/apksig/util/DataSink;
    array-length v5, v1

    add-int/lit8 v5, v5, -0x2

    if-ne v3, v5, :cond_0

    .line 160
    move-object v5, p1

    .line 161
    .local v5, "src":Lcom/android/apksig/util/DataSource;
    invoke-direct {p0, v5, v4}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->digestDataByChunks(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSink;)V

    goto :goto_1

    .line 163
    .end local v5    # "src":Lcom/android/apksig/util/DataSource;
    :cond_0
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object v5

    add-int/lit8 v6, v3, 0x1

    aget v6, v1, v6

    add-int/lit8 v7, v3, 0x2

    aget v7, v1, v7

    invoke-static {v5, v6, v7}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->slice(Ljava/nio/ByteBuffer;II)Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-static {v5}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/nio/ByteBuffer;)Lcom/android/apksig/util/DataSource;

    move-result-object v5

    .line 165
    .restart local v5    # "src":Lcom/android/apksig/util/DataSource;
    invoke-direct {p0, v5, v4}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->digestDataByChunks(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSink;)V

    .line 169
    :goto_1
    invoke-interface {v5}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v6

    const-wide/16 v8, 0x1000

    invoke-static {v6, v7, v8, v9}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->divideRoundup(JJ)J

    move-result-wide v6

    int-to-long v10, v0

    mul-long/2addr v6, v10

    .line 170
    .local v6, "totalOutput":J
    rem-long v8, v6, v8

    long-to-int v8, v8

    .line 171
    .local v8, "incomplete":I
    if-lez v8, :cond_1

    .line 172
    rsub-int v9, v8, 0x1000

    new-array v9, v9, [B

    .line 173
    .local v9, "padding":[B
    const/4 v10, 0x0

    array-length v11, v9

    invoke-interface {v4, v9, v10, v11}, Lcom/android/apksig/util/DataSink;->consume([BII)V

    .line 155
    .end local v4    # "middleBufferSink":Lcom/android/apksig/util/DataSink;
    .end local v5    # "src":Lcom/android/apksig/util/DataSource;
    .end local v6    # "totalOutput":J
    .end local v8    # "incomplete":I
    .end local v9    # "padding":[B
    :cond_1
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 176
    .end local v3    # "i":I
    :cond_2
    return-object v2
.end method

.method public generateVerityTreeRootHash(Lcom/android/apksig/util/DataSource;)[B
    .locals 2
    .param p1, "fileSource"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "fileSource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    invoke-virtual {p0, p1}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->generateVerityTree(Lcom/android/apksig/util/DataSource;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 129
    .local v0, "verityBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {p0, v0}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->getRootHashFromTree(Ljava/nio/ByteBuffer;)[B

    move-result-object v1

    return-object v1
.end method

.method public generateVerityTreeRootHash(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;)[B
    .locals 7
    .param p1, "beforeApkSigningBlock"    # Lcom/android/apksig/util/DataSource;
    .param p2, "centralDir"    # Lcom/android/apksig/util/DataSource;
    .param p3, "eocd"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "beforeApkSigningBlock",
            "centralDir",
            "eocd"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 105
    invoke-interface {p1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x1000

    rem-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 113
    invoke-interface {p1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v0

    .line 114
    .local v0, "centralDirOffsetForDigesting":J
    invoke-interface {p3}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v4

    long-to-int v4, v4

    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 115
    .local v4, "eocdBuf":Ljava/nio/ByteBuffer;
    sget-object v5, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 116
    invoke-interface {p3}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v5

    long-to-int v5, v5

    invoke-interface {p3, v2, v3, v5, v4}, Lcom/android/apksig/util/DataSource;->copyTo(JILjava/nio/ByteBuffer;)V

    .line 117
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 118
    invoke-static {v4, v0, v1}, Lcom/android/apksig/internal/zip/ZipUtils;->setZipEocdCentralDirectoryOffset(Ljava/nio/ByteBuffer;J)V

    .line 120
    new-instance v2, Lcom/android/apksig/internal/util/ChainedDataSource;

    const/4 v3, 0x3

    new-array v3, v3, [Lcom/android/apksig/util/DataSource;

    const/4 v5, 0x0

    aput-object p1, v3, v5

    const/4 v5, 0x1

    aput-object p2, v3, v5

    .line 121
    invoke-static {v4}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/nio/ByteBuffer;)Lcom/android/apksig/util/DataSource;

    move-result-object v5

    const/4 v6, 0x2

    aput-object v5, v3, v6

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/util/ChainedDataSource;-><init>([Lcom/android/apksig/util/DataSource;)V

    .line 120
    invoke-virtual {p0, v2}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->generateVerityTreeRootHash(Lcom/android/apksig/util/DataSource;)[B

    move-result-object v2

    return-object v2

    .line 106
    .end local v0    # "centralDirOffsetForDigesting":J
    .end local v4    # "eocdBuf":Ljava/nio/ByteBuffer;
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "APK Signing Block size not a multiple of 4096: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 107
    invoke-interface {p1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getRootHashFromTree(Ljava/nio/ByteBuffer;)[B
    .locals 3
    .param p1, "verityBuffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "verityBuffer"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 183
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0x1000

    invoke-static {v0, v1, v2}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->slice(Ljava/nio/ByteBuffer;II)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 184
    .local v0, "firstPage":Ljava/nio/ByteBuffer;
    invoke-direct {p0, v0}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->saltedDigest(Ljava/nio/ByteBuffer;)[B

    move-result-object v1

    return-object v1
.end method

.method synthetic lambda$digestDataByChunks$0$com-android-apksig-internal-util-VerityTreeBuilder(Ljava/nio/ByteBuffer;I[[BLjava/util/concurrent/Phaser;)V
    .locals 6
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "readChunkIndex"    # I
    .param p3, "hashes"    # [[B
    .param p4, "tasks"    # Ljava/util/concurrent/Phaser;

    .line 251
    invoke-direct {p0}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->cloneMessageDigest()Ljava/security/MessageDigest;

    move-result-object v0

    .line 252
    .local v0, "md":Ljava/security/MessageDigest;
    const/4 v1, 0x0

    .local v1, "offset":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    .local v2, "finish":I
    move v3, p2

    .line 253
    .local v3, "chunkIndex":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 254
    add-int/lit16 v4, v1, 0x1000

    invoke-static {p1, v1, v4}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->slice(Ljava/nio/ByteBuffer;II)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 255
    .local v4, "chunk":Ljava/nio/ByteBuffer;
    invoke-direct {p0, v0, v4}, Lcom/android/apksig/internal/util/VerityTreeBuilder;->saltedDigest(Ljava/security/MessageDigest;Ljava/nio/ByteBuffer;)[B

    move-result-object v5

    aput-object v5, p3, v3

    .line 253
    .end local v4    # "chunk":Ljava/nio/ByteBuffer;
    add-int/lit16 v1, v1, 0x1000

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 257
    .end local v1    # "offset":I
    .end local v2    # "finish":I
    .end local v3    # "chunkIndex":I
    :cond_0
    invoke-virtual {p4}, Ljava/util/concurrent/Phaser;->arriveAndDeregister()I

    .line 258
    return-void
.end method
