.class public abstract Lcom/android/apksig/util/DataSources;
.super Ljava/lang/Object;
.source "DataSources.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asDataSource(Ljava/io/RandomAccessFile;)Lcom/android/apksig/util/DataSource;
    .locals 1
    .param p0, "file"    # Ljava/io/RandomAccessFile;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "file"
        }
    .end annotation

    .line 48
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-static {v0}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/nio/channels/FileChannel;)Lcom/android/apksig/util/DataSource;

    move-result-object v0

    return-object v0
.end method

.method public static asDataSource(Ljava/io/RandomAccessFile;JJ)Lcom/android/apksig/util/DataSource;
    .locals 1
    .param p0, "file"    # Ljava/io/RandomAccessFile;
    .param p1, "offset"    # J
    .param p3, "size"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "file",
            "offset",
            "size"
        }
    .end annotation

    .line 56
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-static {v0, p1, p2, p3, p4}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/nio/channels/FileChannel;JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v0

    return-object v0
.end method

.method public static asDataSource(Ljava/nio/ByteBuffer;)Lcom/android/apksig/util/DataSource;
    .locals 1
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buffer"
        }
    .end annotation

    .line 37
    if-eqz p0, :cond_0

    .line 40
    new-instance v0, Lcom/android/apksig/internal/util/ByteBufferDataSource;

    invoke-direct {v0, p0}, Lcom/android/apksig/internal/util/ByteBufferDataSource;-><init>(Ljava/nio/ByteBuffer;)V

    return-object v0

    .line 38
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
.end method

.method public static asDataSource(Ljava/nio/channels/FileChannel;)Lcom/android/apksig/util/DataSource;
    .locals 1
    .param p0, "channel"    # Ljava/nio/channels/FileChannel;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "channel"
        }
    .end annotation

    .line 64
    if-eqz p0, :cond_0

    .line 67
    new-instance v0, Lcom/android/apksig/internal/util/FileChannelDataSource;

    invoke-direct {v0, p0}, Lcom/android/apksig/internal/util/FileChannelDataSource;-><init>(Ljava/nio/channels/FileChannel;)V

    return-object v0

    .line 65
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
.end method

.method public static asDataSource(Ljava/nio/channels/FileChannel;JJ)Lcom/android/apksig/util/DataSource;
    .locals 7
    .param p0, "channel"    # Ljava/nio/channels/FileChannel;
    .param p1, "offset"    # J
    .param p3, "size"    # J
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

    .line 75
    if-eqz p0, :cond_0

    .line 78
    new-instance v6, Lcom/android/apksig/internal/util/FileChannelDataSource;

    move-object v0, v6

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/apksig/internal/util/FileChannelDataSource;-><init>(Ljava/nio/channels/FileChannel;JJ)V

    return-object v6

    .line 76
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
.end method
