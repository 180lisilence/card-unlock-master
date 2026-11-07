.class public Lcom/android/apksig/internal/util/RandomAccessFileDataSink;
.super Ljava/lang/Object;
.source "RandomAccessFileDataSink.java"

# interfaces
.implements Lcom/android/apksig/util/DataSink;


# instance fields
.field private final mFile:Ljava/io/RandomAccessFile;

.field private final mFileChannel:Ljava/nio/channels/FileChannel;

.field private mPosition:J


# direct methods
.method public constructor <init>(Ljava/io/RandomAccessFile;)V
    .locals 2
    .param p1, "file"    # Ljava/io/RandomAccessFile;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "file"
        }
    .end annotation

    .line 39
    const-wide/16 v0, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;-><init>(Ljava/io/RandomAccessFile;J)V

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/io/RandomAccessFile;J)V
    .locals 3
    .param p1, "file"    # Ljava/io/RandomAccessFile;
    .param p2, "startPosition"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "file",
            "startPosition"
        }
    .end annotation

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    if-eqz p1, :cond_1

    .line 50
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_0

    .line 53
    iput-object p1, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mFile:Ljava/io/RandomAccessFile;

    .line 54
    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mFileChannel:Ljava/nio/channels/FileChannel;

    .line 55
    iput-wide p2, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mPosition:J

    .line 56
    return-void

    .line 51
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startPosition: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 48
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "file == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public consume(Ljava/nio/ByteBuffer;)V
    .locals 6
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

    .line 91
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    .line 92
    .local v0, "length":I
    if-nez v0, :cond_0

    .line 93
    return-void

    .line 96
    :cond_0
    iget-object v1, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mFile:Ljava/io/RandomAccessFile;

    monitor-enter v1

    .line 97
    :try_start_0
    iget-object v2, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mFile:Ljava/io/RandomAccessFile;

    iget-wide v3, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mPosition:J

    invoke-virtual {v2, v3, v4}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 98
    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 99
    iget-object v2, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mFileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v2, p1}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    goto :goto_0

    .line 101
    :cond_1
    iget-wide v2, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mPosition:J

    int-to-long v4, v0

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mPosition:J

    .line 102
    monitor-exit v1

    .line 103
    return-void

    .line 102
    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
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

    .line 67
    if-ltz p2, :cond_2

    .line 72
    array-length v0, p1

    if-gt p2, v0, :cond_1

    .line 78
    if-nez p3, :cond_0

    .line 79
    return-void

    .line 82
    :cond_0
    iget-object v0, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mFile:Ljava/io/RandomAccessFile;

    monitor-enter v0

    .line 83
    :try_start_0
    iget-object v1, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mFile:Ljava/io/RandomAccessFile;

    iget-wide v2, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mPosition:J

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 84
    iget-object v1, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 85
    iget-wide v1, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mPosition:J

    int-to-long v3, p3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mPosition:J

    .line 86
    monitor-exit v0

    .line 87
    return-void

    .line 86
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 75
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "offset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", buf.length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_2
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "offset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getFile()Ljava/io/RandomAccessFile;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;->mFile:Ljava/io/RandomAccessFile;

    return-object v0
.end method
