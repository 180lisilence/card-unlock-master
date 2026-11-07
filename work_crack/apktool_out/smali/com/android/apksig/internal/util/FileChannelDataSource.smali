.class public Lcom/android/apksig/internal/util/FileChannelDataSource;
.super Ljava/lang/Object;
.source "FileChannelDataSource.java"

# interfaces
.implements Lcom/android/apksig/util/DataSource;


# static fields
.field private static final MAX_READ_CHUNK_SIZE:I = 0x100000


# instance fields
.field private final mChannel:Ljava/nio/channels/FileChannel;

.field private final mOffset:J

.field private final mSize:J


# direct methods
.method public constructor <init>(Ljava/nio/channels/FileChannel;)V
    .locals 2
    .param p1, "channel"    # Ljava/nio/channels/FileChannel;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "channel"
        }
    .end annotation

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/android/apksig/internal/util/FileChannelDataSource;->mChannel:Ljava/nio/channels/FileChannel;

    .line 45
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/apksig/internal/util/FileChannelDataSource;->mOffset:J

    .line 46
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/android/apksig/internal/util/FileChannelDataSource;->mSize:J

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/nio/channels/FileChannel;JJ)V
    .locals 3
    .param p1, "channel"    # Ljava/nio/channels/FileChannel;
    .param p2, "offset"    # J
    .param p4, "size"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "channel",
            "offset",
            "size"
        }
    .end annotation

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_1

    .line 60
    cmp-long v0, p4, v0

    if-ltz v0, :cond_0

    .line 63
    iput-object p1, p0, Lcom/android/apksig/internal/util/FileChannelDataSource;->mChannel:Ljava/nio/channels/FileChannel;

    .line 64
    iput-wide p2, p0, Lcom/android/apksig/internal/util/FileChannelDataSource;->mOffset:J

    .line 65
    iput-wide p4, p0, Lcom/android/apksig/internal/util/FileChannelDataSource;->mSize:J

    .line 66
    return-void

    .line 61
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "offset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static checkChunkValid(JJJ)V
    .locals 8
    .param p0, "offset"    # J
    .param p2, "size"    # J
    .param p4, "sourceSize"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "offset",
            "size",
            "sourceSize"
        }
    .end annotation

    .line 170
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-ltz v2, :cond_4

    .line 173
    cmp-long v0, p2, v0

    if-ltz v0, :cond_3

    .line 176
    cmp-long v0, p0, p4

    const-string v1, ")"

    const-string v2, ") > source size ("

    const-string v3, "offset ("

    if-gtz v0, :cond_2

    .line 180
    add-long v4, p0, p2

    .line 181
    .local v4, "endOffset":J
    cmp-long v0, v4, p0

    const-string v6, ") + size ("

    if-ltz v0, :cond_1

    .line 185
    cmp-long v0, v4, p4

    if-gtz v0, :cond_0

    .line 190
    return-void

    .line 186
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 182
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") overflow"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 177
    .end local v4    # "endOffset":J
    :cond_2
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 174
    :cond_3
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 171
    :cond_4
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "offset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public copyTo(JILjava/nio/ByteBuffer;)V
    .locals 10
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

    .line 128
    invoke-virtual {p0}, Lcom/android/apksig/internal/util/FileChannelDataSource;->size()J

    move-result-wide v6

    .line 129
    .local v6, "sourceSize":J
    int-to-long v2, p3

    move-wide v0, p1

    move-wide v4, v6

    invoke-static/range {v0 .. v5}, Lcom/android/apksig/internal/util/FileChannelDataSource;->checkChunkValid(JJJ)V

    .line 130
    if-nez p3, :cond_0

    .line 131
    return-void

    .line 133
    :cond_0
    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-gt p3, v0, :cond_2

    .line 137
    iget-wide v0, p0, Lcom/android/apksig/internal/util/FileChannelDataSource;->mOffset:J

    add-long/2addr v0, p1

    .line 138
    .local v0, "offsetInFile":J
    move v2, p3

    .line 139
    .local v2, "remaining":I
    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    .line 143
    .local v3, "prevLimit":I
    :try_start_0
    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    add-int/2addr v4, p3

    invoke-virtual {p4, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 144
    :goto_0
    if-lez v2, :cond_1

    .line 146
    iget-object v4, p0, Lcom/android/apksig/internal/util/FileChannelDataSource;->mChannel:Ljava/nio/channels/FileChannel;

    monitor-enter v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 147
    :try_start_1
    iget-object v5, p0, Lcom/android/apksig/internal/util/FileChannelDataSource;->mChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v5, v0, v1}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 148
    iget-object v5, p0, Lcom/android/apksig/internal/util/FileChannelDataSource;->mChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v5, p4}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v5

    .line 149
    .local v5, "chunkSize":I
    monitor-exit v4

    .line 150
    int-to-long v8, v5

    add-long/2addr v0, v8

    .line 151
    sub-int/2addr v2, v5

    .line 152
    .end local v5    # "chunkSize":I
    goto :goto_0

    .line 149
    :catchall_0
    move-exception v5

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v0    # "offsetInFile":J
    .end local v2    # "remaining":I
    .end local v3    # "prevLimit":I
    .end local v6    # "sourceSize":J
    .end local p1    # "offset":J
    .end local p3    # "size":I
    .end local p4    # "dest":Ljava/nio/ByteBuffer;
    :try_start_2
    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 154
    .restart local v0    # "offsetInFile":J
    .restart local v2    # "remaining":I
    .restart local v3    # "prevLimit":I
    .restart local v6    # "sourceSize":J
    .restart local p1    # "offset":J
    .restart local p3    # "size":I
    .restart local p4    # "dest":Ljava/nio/ByteBuffer;
    :cond_1
    invoke-virtual {p4, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 155
    nop

    .line 156
    return-void

    .line 154
    :catchall_1
    move-exception v4

    invoke-virtual {p4, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 155
    throw v4

    .line 134
    .end local v0    # "offsetInFile":J
    .end local v2    # "remaining":I
    .end local v3    # "prevLimit":I
    :cond_2
    new-instance v0, Ljava/nio/BufferOverflowException;

    invoke-direct {v0}, Ljava/nio/BufferOverflowException;-><init>()V

    throw v0
.end method

.method public feed(JJLcom/android/apksig/util/DataSink;)V
    .locals 15
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

    .line 94
    move-object v1, p0

    invoke-virtual {p0}, Lcom/android/apksig/internal/util/FileChannelDataSource;->size()J

    move-result-wide v8

    .line 95
    .local v8, "sourceSize":J
    move-wide/from16 v2, p1

    move-wide/from16 v4, p3

    move-wide v6, v8

    invoke-static/range {v2 .. v7}, Lcom/android/apksig/internal/util/FileChannelDataSource;->checkChunkValid(JJJ)V

    .line 96
    const-wide/16 v2, 0x0

    cmp-long v0, p3, v2

    if-nez v0, :cond_0

    .line 97
    return-void

    .line 100
    :cond_0
    iget-wide v4, v1, Lcom/android/apksig/internal/util/FileChannelDataSource;->mOffset:J

    add-long v4, v4, p1

    .line 101
    .local v4, "chunkOffsetInFile":J
    move-wide/from16 v6, p3

    .line 102
    .local v6, "remaining":J
    const-wide/32 v10, 0x100000

    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v10

    long-to-int v0, v10

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v10

    .line 104
    .local v10, "buf":Ljava/nio/ByteBuffer;
    :goto_0
    cmp-long v0, v6, v2

    if-lez v0, :cond_3

    .line 105
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    int-to-long v11, v0

    invoke-static {v6, v7, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v11

    long-to-int v11, v11

    .line 106
    .local v11, "chunkSize":I
    move v12, v11

    .line 107
    .local v12, "chunkRemaining":I
    invoke-virtual {v10, v11}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 108
    iget-object v13, v1, Lcom/android/apksig/internal/util/FileChannelDataSource;->mChannel:Ljava/nio/channels/FileChannel;

    monitor-enter v13

    .line 109
    :try_start_0
    iget-object v0, v1, Lcom/android/apksig/internal/util/FileChannelDataSource;->mChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v0, v4, v5}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 110
    :goto_1
    if-lez v12, :cond_2

    .line 111
    iget-object v0, v1, Lcom/android/apksig/internal/util/FileChannelDataSource;->mChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v0, v10}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 112
    .local v0, "read":I
    if-ltz v0, :cond_1

    .line 115
    sub-int/2addr v12, v0

    .line 116
    .end local v0    # "read":I
    goto :goto_1

    .line 113
    .restart local v0    # "read":I
    :cond_1
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Unexpected EOF encountered"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v4    # "chunkOffsetInFile":J
    .end local v6    # "remaining":J
    .end local v8    # "sourceSize":J
    .end local v10    # "buf":Ljava/nio/ByteBuffer;
    .end local v11    # "chunkSize":I
    .end local v12    # "chunkRemaining":I
    .end local p1    # "offset":J
    .end local p3    # "size":J
    .end local p5    # "sink":Lcom/android/apksig/util/DataSink;
    throw v2

    .line 117
    .end local v0    # "read":I
    .restart local v4    # "chunkOffsetInFile":J
    .restart local v6    # "remaining":J
    .restart local v8    # "sourceSize":J
    .restart local v10    # "buf":Ljava/nio/ByteBuffer;
    .restart local v11    # "chunkSize":I
    .restart local v12    # "chunkRemaining":I
    .restart local p1    # "offset":J
    .restart local p3    # "size":J
    .restart local p5    # "sink":Lcom/android/apksig/util/DataSink;
    :cond_2
    monitor-exit v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 118
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 119
    move-object/from16 v14, p5

    invoke-interface {v14, v10}, Lcom/android/apksig/util/DataSink;->consume(Ljava/nio/ByteBuffer;)V

    .line 120
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 121
    int-to-long v2, v11

    add-long/2addr v4, v2

    .line 122
    int-to-long v2, v11

    sub-long/2addr v6, v2

    .line 123
    .end local v11    # "chunkSize":I
    .end local v12    # "chunkRemaining":I
    const-wide/16 v2, 0x0

    goto :goto_0

    .line 117
    .restart local v11    # "chunkSize":I
    .restart local v12    # "chunkRemaining":I
    :catchall_0
    move-exception v0

    move-object/from16 v14, p5

    :goto_2
    :try_start_1
    monitor-exit v13
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v0

    :catchall_1
    move-exception v0

    goto :goto_2

    .line 124
    .end local v11    # "chunkSize":I
    .end local v12    # "chunkRemaining":I
    :cond_3
    move-object/from16 v14, p5

    return-void
.end method

.method public getByteBuffer(JI)Ljava/nio/ByteBuffer;
    .locals 3
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

    .line 160
    if-ltz p3, :cond_0

    .line 163
    invoke-static {p3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 164
    .local v0, "result":Ljava/nio/ByteBuffer;
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/android/apksig/internal/util/FileChannelDataSource;->copyTo(JILjava/nio/ByteBuffer;)V

    .line 165
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 166
    return-object v0

    .line 161
    .end local v0    # "result":Ljava/nio/ByteBuffer;
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public size()J
    .locals 4

    .line 70
    iget-wide v0, p0, Lcom/android/apksig/internal/util/FileChannelDataSource;->mSize:J

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    .line 72
    :try_start_0
    iget-object v0, p0, Lcom/android/apksig/internal/util/FileChannelDataSource;->mChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 73
    :catch_0
    move-exception v0

    .line 74
    .local v0, "e":Ljava/io/IOException;
    const-wide/16 v1, 0x0

    return-wide v1

    .line 77
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    return-wide v0
.end method

.method public slice(JJ)Lcom/android/apksig/internal/util/FileChannelDataSource;
    .locals 15
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

    .line 83
    move-object v0, p0

    invoke-virtual {p0}, Lcom/android/apksig/internal/util/FileChannelDataSource;->size()J

    move-result-wide v7

    .line 84
    .local v7, "sourceSize":J
    move-wide/from16 v1, p1

    move-wide/from16 v3, p3

    move-wide v5, v7

    invoke-static/range {v1 .. v6}, Lcom/android/apksig/internal/util/FileChannelDataSource;->checkChunkValid(JJJ)V

    .line 85
    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-nez v1, :cond_0

    cmp-long v1, p3, v7

    if-nez v1, :cond_0

    .line 86
    return-object v0

    .line 89
    :cond_0
    new-instance v1, Lcom/android/apksig/internal/util/FileChannelDataSource;

    iget-object v10, v0, Lcom/android/apksig/internal/util/FileChannelDataSource;->mChannel:Ljava/nio/channels/FileChannel;

    iget-wide v2, v0, Lcom/android/apksig/internal/util/FileChannelDataSource;->mOffset:J

    add-long v11, v2, p1

    move-object v9, v1

    move-wide/from16 v13, p3

    invoke-direct/range {v9 .. v14}, Lcom/android/apksig/internal/util/FileChannelDataSource;-><init>(Ljava/nio/channels/FileChannel;JJ)V

    return-object v1
.end method

.method public bridge synthetic slice(JJ)Lcom/android/apksig/util/DataSource;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "offset",
            "size"
        }
    .end annotation

    .line 30
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/apksig/internal/util/FileChannelDataSource;->slice(JJ)Lcom/android/apksig/internal/util/FileChannelDataSource;

    move-result-object p1

    return-object p1
.end method
