.class Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;
.super Ljava/lang/Object;
.source "ByteArrayDataSink.java"

# interfaces
.implements Lcom/android/apksig/util/DataSource;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/util/ByteArrayDataSink;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SliceDataSource"
.end annotation


# instance fields
.field private final mSliceOffset:I

.field private final mSliceSize:I

.field final synthetic this$0:Lcom/android/apksig/internal/util/ByteArrayDataSink;


# direct methods
.method private constructor <init>(Lcom/android/apksig/internal/util/ByteArrayDataSink;II)V
    .locals 0
    .param p2, "offset"    # I
    .param p3, "size"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0,
            0x0
        }
        names = {
            "this$0",
            "offset",
            "size"
        }
    .end annotation

    .line 175
    iput-object p1, p0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->this$0:Lcom/android/apksig/internal/util/ByteArrayDataSink;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 176
    iput p2, p0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->mSliceOffset:I

    .line 177
    iput p3, p0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->mSliceSize:I

    .line 178
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/apksig/internal/util/ByteArrayDataSink;IILcom/android/apksig/internal/util/ByteArrayDataSink$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/apksig/internal/util/ByteArrayDataSink;
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # Lcom/android/apksig/internal/util/ByteArrayDataSink$1;

    .line 171
    invoke-direct {p0, p1, p2, p3}, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;-><init>(Lcom/android/apksig/internal/util/ByteArrayDataSink;II)V

    return-void
.end method

.method private checkChunkValid(JJ)V
    .locals 8
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

    .line 218
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_4

    .line 221
    cmp-long v0, p3, v0

    if-ltz v0, :cond_3

    .line 224
    iget v0, p0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->mSliceSize:I

    int-to-long v1, v0

    cmp-long v1, p1, v1

    const-string v2, ")"

    const-string v3, ") > source size ("

    const-string v4, "offset ("

    if-gtz v1, :cond_2

    .line 228
    add-long v5, p1, p3

    .line 229
    .local v5, "endOffset":J
    cmp-long v1, v5, p1

    const-string v7, ") + size ("

    if-ltz v1, :cond_1

    .line 233
    int-to-long v0, v0

    cmp-long v0, v5, v0

    if-gtz v0, :cond_0

    .line 238
    return-void

    .line 234
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->mSliceSize:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 230
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") overflow"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 225
    .end local v5    # "endOffset":J
    :cond_2
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, p0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->mSliceSize:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 222
    :cond_3
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 219
    :cond_4
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "offset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public copyTo(JILjava/nio/ByteBuffer;)V
    .locals 3
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

    .line 203
    int-to-long v0, p3

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->checkChunkValid(JJ)V

    .line 206
    iget-object v0, p0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->this$0:Lcom/android/apksig/internal/util/ByteArrayDataSink;

    invoke-static {v0}, Lcom/android/apksig/internal/util/ByteArrayDataSink;->access$100(Lcom/android/apksig/internal/util/ByteArrayDataSink;)[B

    move-result-object v0

    iget v1, p0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->mSliceOffset:I

    int-to-long v1, v1

    add-long/2addr v1, p1

    long-to-int v1, v1

    invoke-virtual {p4, v0, v1, p3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 207
    return-void
.end method

.method public feed(JJLcom/android/apksig/util/DataSink;)V
    .locals 3
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

    .line 187
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->checkChunkValid(JJ)V

    .line 190
    iget-object v0, p0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->this$0:Lcom/android/apksig/internal/util/ByteArrayDataSink;

    invoke-static {v0}, Lcom/android/apksig/internal/util/ByteArrayDataSink;->access$100(Lcom/android/apksig/internal/util/ByteArrayDataSink;)[B

    move-result-object v0

    iget v1, p0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->mSliceOffset:I

    int-to-long v1, v1

    add-long/2addr v1, p1

    long-to-int v1, v1

    long-to-int v2, p3

    invoke-interface {p5, v0, v1, v2}, Lcom/android/apksig/util/DataSink;->consume([BII)V

    .line 191
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

    .line 195
    int-to-long v0, p3

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->checkChunkValid(JJ)V

    .line 198
    iget-object v0, p0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->this$0:Lcom/android/apksig/internal/util/ByteArrayDataSink;

    invoke-static {v0}, Lcom/android/apksig/internal/util/ByteArrayDataSink;->access$100(Lcom/android/apksig/internal/util/ByteArrayDataSink;)[B

    move-result-object v0

    iget v1, p0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->mSliceOffset:I

    int-to-long v1, v1

    add-long/2addr v1, p1

    long-to-int v1, v1

    invoke-static {v0, v1, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public size()J
    .locals 2

    .line 182
    iget v0, p0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->mSliceSize:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public slice(JJ)Lcom/android/apksig/util/DataSource;
    .locals 4
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

    .line 211
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->checkChunkValid(JJ)V

    .line 214
    new-instance v0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;

    iget-object v1, p0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->this$0:Lcom/android/apksig/internal/util/ByteArrayDataSink;

    iget v2, p0, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;->mSliceOffset:I

    int-to-long v2, v2

    add-long/2addr v2, p1

    long-to-int v2, v2

    long-to-int v3, p3

    invoke-direct {v0, v1, v2, v3}, Lcom/android/apksig/internal/util/ByteArrayDataSink$SliceDataSource;-><init>(Lcom/android/apksig/internal/util/ByteArrayDataSink;II)V

    return-object v0
.end method
