.class public Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;
.super Ljava/lang/Object;
.source "V4Signature.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/v4/V4Signature;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SigningInfoBlock"
.end annotation


# instance fields
.field public final blockId:I

.field public final signingInfo:[B


# direct methods
.method public constructor <init>(I[B)V
    .locals 0
    .param p1, "blockId"    # I
    .param p2, "signingInfo"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "blockId",
            "signingInfo"
        }
    .end annotation

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    iput p1, p0, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;->blockId:I

    .line 124
    iput-object p2, p0, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;->signingInfo:[B

    .line 125
    return-void
.end method

.method static fromByteBuffer(Ljava/nio/ByteBuffer;)Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;
    .locals 3
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buffer"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 128
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 129
    .local v0, "blockId":I
    invoke-static {p0}, Lcom/android/apksig/internal/apk/v4/V4Signature;->readBytes(Ljava/nio/ByteBuffer;)[B

    move-result-object v1

    .line 130
    .local v1, "signingInfo":[B
    new-instance v2, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;

    invoke-direct {v2, v0, v1}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;-><init>(I[B)V

    return-object v2
.end method


# virtual methods
.method toByteArray()[B
    .locals 3

    .line 134
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;->signingInfo:[B

    invoke-static {v0}, Lcom/android/apksig/internal/apk/v4/V4Signature;->bytesSize([B)I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    .line 135
    .local v0, "size":I
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 136
    .local v1, "buffer":Ljava/nio/ByteBuffer;
    iget v2, p0, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;->blockId:I

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 137
    iget-object v2, p0, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;->signingInfo:[B

    invoke-static {v1, v2}, Lcom/android/apksig/internal/apk/v4/V4Signature;->writeBytes(Ljava/nio/ByteBuffer;[B)V

    .line 138
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    return-object v2
.end method
