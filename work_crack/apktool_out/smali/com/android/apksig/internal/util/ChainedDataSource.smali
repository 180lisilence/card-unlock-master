.class public Lcom/android/apksig/internal/util/ChainedDataSource;
.super Ljava/lang/Object;
.source "ChainedDataSource.java"

# interfaces
.implements Lcom/android/apksig/util/DataSource;


# instance fields
.field private final mSources:[Lcom/android/apksig/util/DataSource;

.field private final mTotalSize:J


# direct methods
.method public varargs constructor <init>([Lcom/android/apksig/util/DataSource;)V
    .locals 2
    .param p1, "sources"    # [Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sources"
        }
    .end annotation

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/android/apksig/internal/util/ChainedDataSource;->mSources:[Lcom/android/apksig/util/DataSource;

    .line 34
    invoke-static {p1}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lcom/android/apksig/internal/util/ChainedDataSource$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/android/apksig/internal/util/ChainedDataSource$$ExternalSyntheticLambda0;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->mapToLong(Ljava/util/function/ToLongFunction;)Ljava/util/stream/LongStream;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/stream/LongStream;->sum()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/apksig/internal/util/ChainedDataSource;->mTotalSize:J

    .line 35
    return-void
.end method

.method static synthetic lambda$new$0(Lcom/android/apksig/util/DataSource;)J
    .locals 2
    .param p0, "src"    # Lcom/android/apksig/util/DataSource;

    .line 34
    invoke-interface {p0}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v0

    return-wide v0
.end method

.method private locateDataSource(J)Lcom/android/apksig/internal/util/Pair;
    .locals 6
    .param p1, "offset"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "offset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lcom/android/apksig/internal/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 135
    move-wide v0, p1

    .line 136
    .local v0, "localOffset":J
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget-object v3, p0, Lcom/android/apksig/internal/util/ChainedDataSource;->mSources:[Lcom/android/apksig/util/DataSource;

    array-length v4, v3

    if-ge v2, v4, :cond_1

    .line 137
    aget-object v3, v3, v2

    invoke-interface {v3}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v3

    cmp-long v3, v0, v3

    if-gez v3, :cond_0

    .line 138
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v3

    return-object v3

    .line 140
    :cond_0
    iget-object v3, p0, Lcom/android/apksig/internal/util/ChainedDataSource;->mSources:[Lcom/android/apksig/util/DataSource;

    aget-object v3, v3, v2

    invoke-interface {v3}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v3

    sub-long/2addr v0, v3

    .line 136
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 142
    .end local v2    # "i":I
    :cond_1
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Access is out of bound, offset: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", totalSize: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lcom/android/apksig/internal/util/ChainedDataSource;->mTotalSize:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method public copyTo(JILjava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "offset"    # J
    .param p3, "size"    # I
    .param p4, "dest"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "offset",
            "size",
            "dest"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 98
    int-to-long v3, p3

    new-instance v5, Lcom/android/apksig/internal/util/ByteBufferSink;

    invoke-direct {v5, p4}, Lcom/android/apksig/internal/util/ByteBufferSink;-><init>(Ljava/nio/ByteBuffer;)V

    move-object v0, p0

    move-wide v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/android/apksig/internal/util/ChainedDataSource;->feed(JJLcom/android/apksig/util/DataSink;)V

    .line 99
    return-void
.end method

.method public feed(JJLcom/android/apksig/util/DataSink;)V
    .locals 17
    .param p1, "offset"    # J
    .param p3, "size"    # J
    .param p5, "sink"    # Lcom/android/apksig/util/DataSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "offset",
            "size",
            "sink"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 44
    move-object/from16 v0, p0

    add-long v1, p1, p3

    iget-wide v3, v0, Lcom/android/apksig/internal/util/ChainedDataSource;->mTotalSize:J

    cmp-long v1, v1, v3

    if-gtz v1, :cond_3

    .line 48
    iget-object v1, v0, Lcom/android/apksig/internal/util/ChainedDataSource;->mSources:[Lcom/android/apksig/util/DataSource;

    array-length v2, v1

    const/4 v3, 0x0

    move-wide/from16 v10, p1

    move-wide/from16 v12, p3

    .end local p1    # "offset":J
    .end local p3    # "size":J
    .local v10, "offset":J
    .local v12, "size":J
    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v14, v1, v3

    .line 50
    .local v14, "src":Lcom/android/apksig/util/DataSource;
    invoke-interface {v14}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v4

    cmp-long v4, v10, v4

    if-ltz v4, :cond_0

    .line 51
    invoke-interface {v14}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v4

    sub-long/2addr v10, v4

    .line 52
    goto :goto_1

    .line 56
    :cond_0
    invoke-interface {v14}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v4

    sub-long v15, v4, v10

    .line 57
    .local v15, "remaining":J
    cmp-long v4, v15, v12

    if-ltz v4, :cond_1

    .line 58
    move-object v4, v14

    move-wide v5, v10

    move-wide v7, v12

    move-object/from16 v9, p5

    invoke-interface/range {v4 .. v9}, Lcom/android/apksig/util/DataSource;->feed(JJLcom/android/apksig/util/DataSink;)V

    .line 59
    goto :goto_2

    .line 63
    :cond_1
    move-object v4, v14

    move-wide v5, v10

    move-wide v7, v15

    move-object/from16 v9, p5

    invoke-interface/range {v4 .. v9}, Lcom/android/apksig/util/DataSource;->feed(JJLcom/android/apksig/util/DataSink;)V

    .line 64
    sub-long/2addr v12, v15

    .line 65
    const-wide/16 v4, 0x0

    move-wide v10, v4

    .line 48
    .end local v14    # "src":Lcom/android/apksig/util/DataSource;
    .end local v15    # "remaining":J
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 67
    :cond_2
    :goto_2
    return-void

    .line 45
    .end local v10    # "offset":J
    .end local v12    # "size":J
    .restart local p1    # "offset":J
    .restart local p3    # "size":J
    :cond_3
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    const-string v2, "Requested more than available"

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getByteBuffer(JI)Ljava/nio/ByteBuffer;
    .locals 7
    .param p1, "offset"    # J
    .param p3, "size"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "offset",
            "size"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 71
    int-to-long v0, p3

    add-long/2addr v0, p1

    iget-wide v2, p0, Lcom/android/apksig/internal/util/ChainedDataSource;->mTotalSize:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_2

    .line 76
    invoke-direct {p0, p1, p2}, Lcom/android/apksig/internal/util/ChainedDataSource;->locateDataSource(J)Lcom/android/apksig/internal/util/Pair;

    move-result-object v0

    .line 77
    .local v0, "firstSource":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;Ljava/lang/Long;>;"
    invoke-virtual {v0}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 78
    .local v1, "i":I
    invoke-virtual {v0}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    .line 81
    int-to-long v2, p3

    add-long/2addr v2, p1

    iget-object v4, p0, Lcom/android/apksig/internal/util/ChainedDataSource;->mSources:[Lcom/android/apksig/util/DataSource;

    aget-object v4, v4, v1

    invoke-interface {v4}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-gtz v2, :cond_0

    .line 82
    iget-object v2, p0, Lcom/android/apksig/internal/util/ChainedDataSource;->mSources:[Lcom/android/apksig/util/DataSource;

    aget-object v2, v2, v1

    invoke-interface {v2, p1, p2, p3}, Lcom/android/apksig/util/DataSource;->getByteBuffer(JI)Ljava/nio/ByteBuffer;

    move-result-object v2

    return-object v2

    .line 86
    :cond_0
    invoke-static {p3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 87
    .local v2, "buffer":Ljava/nio/ByteBuffer;
    :goto_0
    iget-object v3, p0, Lcom/android/apksig/internal/util/ChainedDataSource;->mSources:[Lcom/android/apksig/util/DataSource;

    array-length v3, v3

    if-ge v1, v3, :cond_1

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 88
    iget-object v3, p0, Lcom/android/apksig/internal/util/ChainedDataSource;->mSources:[Lcom/android/apksig/util/DataSource;

    aget-object v3, v3, v1

    invoke-interface {v3}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v3

    sub-long/2addr v3, p1

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    int-to-long v5, v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    .line 89
    .local v3, "sizeToCopy":J
    iget-object v5, p0, Lcom/android/apksig/internal/util/ChainedDataSource;->mSources:[Lcom/android/apksig/util/DataSource;

    aget-object v5, v5, v1

    invoke-static {v3, v4}, Ljava/lang/Math;->toIntExact(J)I

    move-result v6

    invoke-interface {v5, p1, p2, v6, v2}, Lcom/android/apksig/util/DataSource;->copyTo(JILjava/nio/ByteBuffer;)V

    .line 90
    const-wide/16 p1, 0x0

    .line 87
    .end local v3    # "sizeToCopy":J
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 92
    :cond_1
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 93
    return-object v2

    .line 72
    .end local v0    # "firstSource":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;Ljava/lang/Long;>;"
    .end local v1    # "i":I
    .end local v2    # "buffer":Ljava/nio/ByteBuffer;
    :cond_2
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "Requested more than available"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public size()J
    .locals 2

    .line 39
    iget-wide v0, p0, Lcom/android/apksig/internal/util/ChainedDataSource;->mTotalSize:J

    return-wide v0
.end method

.method public slice(JJ)Lcom/android/apksig/util/DataSource;
    .locals 17
    .param p1, "offset"    # J
    .param p3, "size"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "offset",
            "size"
        }
    .end annotation

    .line 104
    move-object/from16 v0, p0

    move-wide/from16 v1, p3

    invoke-direct/range {p0 .. p2}, Lcom/android/apksig/internal/util/ChainedDataSource;->locateDataSource(J)Lcom/android/apksig/internal/util/Pair;

    move-result-object v3

    .line 105
    .local v3, "firstSource":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;Ljava/lang/Long;>;"
    invoke-virtual {v3}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 106
    .local v4, "beginIndex":I
    invoke-virtual {v3}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    .line 107
    .local v5, "beginLocalOffset":J
    iget-object v7, v0, Lcom/android/apksig/internal/util/ChainedDataSource;->mSources:[Lcom/android/apksig/util/DataSource;

    aget-object v7, v7, v4

    .line 109
    .local v7, "beginSource":Lcom/android/apksig/util/DataSource;
    add-long v8, v5, v1

    invoke-interface {v7}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v10

    cmp-long v8, v8, v10

    if-gtz v8, :cond_0

    .line 110
    invoke-interface {v7, v5, v6, v1, v2}, Lcom/android/apksig/util/DataSource;->slice(JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v8

    return-object v8

    .line 114
    :cond_0
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 115
    .local v8, "sources":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/apksig/util/DataSource;>;"
    nop

    .line 116
    invoke-interface {v7}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v9

    sub-long/2addr v9, v5

    .line 115
    invoke-interface {v7, v5, v6, v9, v10}, Lcom/android/apksig/util/DataSource;->slice(JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    add-long v9, p1, v1

    const-wide/16 v11, 0x1

    sub-long/2addr v9, v11

    invoke-direct {v0, v9, v10}, Lcom/android/apksig/internal/util/ChainedDataSource;->locateDataSource(J)Lcom/android/apksig/internal/util/Pair;

    move-result-object v9

    .line 119
    .local v9, "lastSource":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;Ljava/lang/Long;>;"
    invoke-virtual {v9}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    .line 120
    .local v10, "endIndex":I
    invoke-virtual {v9}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Long;

    invoke-virtual {v13}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    .line 122
    .local v13, "endLocalOffset":J
    add-int/lit8 v15, v4, 0x1

    .local v15, "i":I
    :goto_0
    if-ge v15, v10, :cond_1

    .line 123
    iget-object v11, v0, Lcom/android/apksig/internal/util/ChainedDataSource;->mSources:[Lcom/android/apksig/util/DataSource;

    aget-object v11, v11, v15

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 122
    add-int/lit8 v15, v15, 0x1

    const-wide/16 v11, 0x1

    goto :goto_0

    .line 126
    .end local v15    # "i":I
    :cond_1
    iget-object v11, v0, Lcom/android/apksig/internal/util/ChainedDataSource;->mSources:[Lcom/android/apksig/util/DataSource;

    aget-object v11, v11, v10

    const-wide/16 v0, 0x0

    move-object v12, v3

    const-wide/16 v15, 0x1

    .end local v3    # "firstSource":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;Ljava/lang/Long;>;"
    .local v12, "firstSource":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;Ljava/lang/Long;>;"
    add-long v2, v13, v15

    invoke-interface {v11, v0, v1, v2, v3}, Lcom/android/apksig/util/DataSource;->slice(JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 127
    new-instance v0, Lcom/android/apksig/internal/util/ChainedDataSource;

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/android/apksig/util/DataSource;

    invoke-virtual {v8, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/android/apksig/util/DataSource;

    invoke-direct {v0, v1}, Lcom/android/apksig/internal/util/ChainedDataSource;-><init>([Lcom/android/apksig/util/DataSource;)V

    return-object v0
.end method
