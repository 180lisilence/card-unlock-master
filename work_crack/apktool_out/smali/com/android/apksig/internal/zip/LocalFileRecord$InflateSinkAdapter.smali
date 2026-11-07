.class Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;
.super Ljava/lang/Object;
.source "LocalFileRecord.java"

# interfaces
.implements Lcom/android/apksig/util/DataSink;
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/zip/LocalFileRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InflateSinkAdapter"
.end annotation


# instance fields
.field private mClosed:Z

.field private final mDelegate:Lcom/android/apksig/util/DataSink;

.field private mInflater:Ljava/util/zip/Inflater;

.field private mInputBuffer:[B

.field private mOutputBuffer:[B

.field private mOutputByteCount:J


# direct methods
.method private constructor <init>(Lcom/android/apksig/util/DataSink;)V
    .locals 2
    .param p1, "delegate"    # Lcom/android/apksig/util/DataSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "delegate"
        }
    .end annotation

    .line 472
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 466
    new-instance v0, Ljava/util/zip/Inflater;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/zip/Inflater;-><init>(Z)V

    iput-object v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mInflater:Ljava/util/zip/Inflater;

    .line 473
    iput-object p1, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mDelegate:Lcom/android/apksig/util/DataSink;

    .line 474
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/apksig/util/DataSink;Lcom/android/apksig/internal/zip/LocalFileRecord$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/apksig/util/DataSink;
    .param p2, "x1"    # Lcom/android/apksig/internal/zip/LocalFileRecord$1;

    .line 463
    invoke-direct {p0, p1}, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;-><init>(Lcom/android/apksig/util/DataSink;)V

    return-void
.end method

.method private checkNotClosed()V
    .locals 2

    .line 532
    iget-boolean v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mClosed:Z

    if-nez v0, :cond_0

    .line 535
    return-void

    .line 533
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 522
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mClosed:Z

    .line 523
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mInputBuffer:[B

    .line 524
    iput-object v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mOutputBuffer:[B

    .line 525
    iget-object v1, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mInflater:Ljava/util/zip/Inflater;

    if-eqz v1, :cond_0

    .line 526
    invoke-virtual {v1}, Ljava/util/zip/Inflater;->end()V

    .line 527
    iput-object v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mInflater:Ljava/util/zip/Inflater;

    .line 529
    :cond_0
    return-void
.end method

.method public consume(Ljava/nio/ByteBuffer;)V
    .locals 3
    .param p1, "buf"    # Ljava/nio/ByteBuffer;
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
            Ljava/io/IOException;
        }
    .end annotation

    .line 500
    invoke-direct {p0}, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->checkNotClosed()V

    .line 501
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 502
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->consume([BII)V

    .line 503
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_1

    .line 505
    :cond_0
    iget-object v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mInputBuffer:[B

    if-nez v0, :cond_1

    .line 506
    const/high16 v0, 0x10000

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mInputBuffer:[B

    .line 508
    :cond_1
    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 509
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    iget-object v1, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mInputBuffer:[B

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 510
    .local v0, "chunkSize":I
    iget-object v1, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mInputBuffer:[B

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 511
    iget-object v1, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mInputBuffer:[B

    invoke-virtual {p0, v1, v2, v0}, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->consume([BII)V

    .line 512
    .end local v0    # "chunkSize":I
    goto :goto_0

    .line 514
    :cond_2
    :goto_1
    return-void
.end method

.method public consume([BII)V
    .locals 5
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "buf",
            "offset",
            "length"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 478
    invoke-direct {p0}, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->checkNotClosed()V

    .line 479
    iget-object v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mInflater:Ljava/util/zip/Inflater;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/zip/Inflater;->setInput([BII)V

    .line 480
    iget-object v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mOutputBuffer:[B

    if-nez v0, :cond_0

    .line 481
    const/high16 v0, 0x10000

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mOutputBuffer:[B

    .line 483
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mInflater:Ljava/util/zip/Inflater;

    invoke-virtual {v0}, Ljava/util/zip/Inflater;->finished()Z

    move-result v0

    if-nez v0, :cond_2

    .line 486
    :try_start_0
    iget-object v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mInflater:Ljava/util/zip/Inflater;

    iget-object v1, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mOutputBuffer:[B

    invoke-virtual {v0, v1}, Ljava/util/zip/Inflater;->inflate([B)I

    move-result v0
    :try_end_0
    .catch Ljava/util/zip/DataFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 489
    .local v0, "outputChunkSize":I
    nop

    .line 490
    if-nez v0, :cond_1

    .line 491
    return-void

    .line 493
    :cond_1
    iget-object v1, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mDelegate:Lcom/android/apksig/util/DataSink;

    iget-object v2, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mOutputBuffer:[B

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3, v0}, Lcom/android/apksig/util/DataSink;->consume([BII)V

    .line 494
    iget-wide v1, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mOutputByteCount:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mOutputByteCount:J

    .line 495
    .end local v0    # "outputChunkSize":I
    goto :goto_0

    .line 487
    :catch_0
    move-exception v0

    .line 488
    .local v0, "e":Ljava/util/zip/DataFormatException;
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Failed to inflate data"

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 496
    .end local v0    # "e":Ljava/util/zip/DataFormatException;
    :cond_2
    return-void
.end method

.method public getOutputByteCount()J
    .locals 2

    .line 517
    iget-wide v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->mOutputByteCount:J

    return-wide v0
.end method
