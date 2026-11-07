.class public Lcom/android/apksig/internal/apk/v4/V4Signature;
.super Ljava/lang/Object;
.source "V4Signature.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;,
        Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;,
        Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;,
        Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;
    }
.end annotation


# static fields
.field public static final CURRENT_VERSION:I = 0x2

.field public static final HASHING_ALGORITHM_SHA256:I = 0x1

.field public static final LOG2_BLOCK_SIZE_4096_BYTES:B = 0xct

.field public static final MAX_SIGNING_INFOS_SIZE:I = 0x1c00


# instance fields
.field public final hashingInfo:[B

.field public final signingInfos:[B

.field public final version:I


# direct methods
.method constructor <init>(I[B[B)V
    .locals 0
    .param p1, "version"    # I
    .param p2, "hashingInfo"    # [B
    .param p3, "signingInfos"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "version",
            "hashingInfo",
            "signingInfos"
        }
    .end annotation

    .line 201
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 202
    iput p1, p0, Lcom/android/apksig/internal/apk/v4/V4Signature;->version:I

    .line 203
    iput-object p2, p0, Lcom/android/apksig/internal/apk/v4/V4Signature;->hashingInfo:[B

    .line 204
    iput-object p3, p0, Lcom/android/apksig/internal/apk/v4/V4Signature;->signingInfos:[B

    .line 205
    return-void
.end method

.method static bytesSize([B)I
    .locals 1
    .param p0, "bytes"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation

    .line 244
    if-nez p0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    array-length v0, p0

    :goto_0
    add-int/lit8 v0, v0, 0x4

    return v0
.end method

.method static getSignedData(JLcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;)[B
    .locals 3
    .param p0, "fileSize"    # J
    .param p2, "hashingInfo"    # Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;
    .param p3, "signingInfo"    # Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "fileSize",
            "hashingInfo",
            "signingInfo"
        }
    .end annotation

    .line 224
    iget-object v0, p2, Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;->salt:[B

    .line 225
    invoke-static {v0}, Lcom/android/apksig/internal/apk/v4/V4Signature;->bytesSize([B)I

    move-result v0

    add-int/lit8 v0, v0, 0x11

    iget-object v1, p2, Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;->rawRootHash:[B

    .line 226
    invoke-static {v1}, Lcom/android/apksig/internal/apk/v4/V4Signature;->bytesSize([B)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p3, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->apkDigest:[B

    invoke-static {v1}, Lcom/android/apksig/internal/apk/v4/V4Signature;->bytesSize([B)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p3, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->certificate:[B

    .line 227
    invoke-static {v1}, Lcom/android/apksig/internal/apk/v4/V4Signature;->bytesSize([B)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p3, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->additionalData:[B

    invoke-static {v1}, Lcom/android/apksig/internal/apk/v4/V4Signature;->bytesSize([B)I

    move-result v1

    add-int/2addr v0, v1

    .line 229
    .local v0, "size":I
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 230
    .local v1, "buffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 231
    invoke-virtual {v1, p0, p1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 232
    iget v2, p2, Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;->hashAlgorithm:I

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 233
    iget-byte v2, p2, Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;->log2BlockSize:B

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 234
    iget-object v2, p2, Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;->salt:[B

    invoke-static {v1, v2}, Lcom/android/apksig/internal/apk/v4/V4Signature;->writeBytes(Ljava/nio/ByteBuffer;[B)V

    .line 235
    iget-object v2, p2, Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;->rawRootHash:[B

    invoke-static {v1, v2}, Lcom/android/apksig/internal/apk/v4/V4Signature;->writeBytes(Ljava/nio/ByteBuffer;[B)V

    .line 236
    iget-object v2, p3, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->apkDigest:[B

    invoke-static {v1, v2}, Lcom/android/apksig/internal/apk/v4/V4Signature;->writeBytes(Ljava/nio/ByteBuffer;[B)V

    .line 237
    iget-object v2, p3, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->certificate:[B

    invoke-static {v1, v2}, Lcom/android/apksig/internal/apk/v4/V4Signature;->writeBytes(Ljava/nio/ByteBuffer;[B)V

    .line 238
    iget-object v2, p3, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->additionalData:[B

    invoke-static {v1, v2}, Lcom/android/apksig/internal/apk/v4/V4Signature;->writeBytes(Ljava/nio/ByteBuffer;[B)V

    .line 239
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    return-object v2
.end method

.method static readBytes(Ljava/io/InputStream;)[B
    .locals 2
    .param p0, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 272
    :try_start_0
    invoke-static {p0}, Lcom/android/apksig/internal/apk/v4/V4Signature;->readIntLE(Ljava/io/InputStream;)I

    move-result v0

    .line 273
    .local v0, "size":I
    new-array v1, v0, [B

    .line 274
    .local v1, "bytes":[B
    invoke-static {p0, v1}, Lcom/android/apksig/internal/apk/v4/V4Signature;->readFully(Ljava/io/InputStream;[B)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 275
    return-object v1

    .line 276
    .end local v0    # "size":I
    .end local v1    # "bytes":[B
    :catch_0
    move-exception v0

    .line 277
    .local v0, "ignored":Ljava/io/EOFException;
    const/4 v1, 0x0

    return-object v1
.end method

.method static readBytes(Ljava/nio/ByteBuffer;)[B
    .locals 2
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

    .line 282
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/4 v1, 0x4

    if-lt v0, v1, :cond_1

    .line 285
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 286
    .local v0, "size":I
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    if-lt v1, v0, :cond_0

    .line 289
    new-array v1, v0, [B

    .line 290
    .local v1, "bytes":[B
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 291
    return-object v1

    .line 287
    .end local v1    # "bytes":[B
    :cond_0
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 283
    .end local v0    # "size":I
    :cond_1
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
.end method

.method static readFrom(Ljava/io/InputStream;)Lcom/android/apksig/internal/apk/v4/V4Signature;
    .locals 4
    .param p0, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 208
    invoke-static {p0}, Lcom/android/apksig/internal/apk/v4/V4Signature;->readIntLE(Ljava/io/InputStream;)I

    move-result v0

    .line 209
    .local v0, "version":I
    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 212
    invoke-static {p0}, Lcom/android/apksig/internal/apk/v4/V4Signature;->readBytes(Ljava/io/InputStream;)[B

    move-result-object v1

    .line 213
    .local v1, "hashingInfo":[B
    invoke-static {p0}, Lcom/android/apksig/internal/apk/v4/V4Signature;->readBytes(Ljava/io/InputStream;)[B

    move-result-object v2

    .line 214
    .local v2, "signingInfo":[B
    new-instance v3, Lcom/android/apksig/internal/apk/v4/V4Signature;

    invoke-direct {v3, v0, v1, v2}, Lcom/android/apksig/internal/apk/v4/V4Signature;-><init>(I[B[B)V

    return-object v3

    .line 210
    .end local v1    # "hashingInfo":[B
    .end local v2    # "signingInfo":[B
    :cond_0
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Invalid signature version."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static readFully(Ljava/io/InputStream;[B)V
    .locals 4
    .param p0, "stream"    # Ljava/io/InputStream;
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "stream",
            "buffer"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 248
    array-length v0, p1

    .line 249
    .local v0, "len":I
    const/4 v1, 0x0

    .line 250
    .local v1, "n":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 251
    sub-int v2, v0, v1

    invoke-virtual {p0, p1, v1, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 252
    .local v2, "count":I
    if-ltz v2, :cond_0

    .line 255
    add-int/2addr v1, v2

    .line 256
    .end local v2    # "count":I
    goto :goto_0

    .line 253
    .restart local v2    # "count":I
    :cond_0
    new-instance v3, Ljava/io/EOFException;

    invoke-direct {v3}, Ljava/io/EOFException;-><init>()V

    throw v3

    .line 257
    .end local v2    # "count":I
    :cond_1
    return-void
.end method

.method static readIntLE(Ljava/io/InputStream;)I
    .locals 3
    .param p0, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 260
    const/4 v0, 0x4

    new-array v0, v0, [B

    .line 261
    .local v0, "buffer":[B
    invoke-static {p0, v0}, Lcom/android/apksig/internal/apk/v4/V4Signature;->readFully(Ljava/io/InputStream;[B)V

    .line 262
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    return v1
.end method

.method static writeBytes(Ljava/io/OutputStream;[B)V
    .locals 1
    .param p0, "stream"    # Ljava/io/OutputStream;
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "stream",
            "bytes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 295
    if-nez p1, :cond_0

    .line 296
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/android/apksig/internal/apk/v4/V4Signature;->writeIntLE(Ljava/io/OutputStream;I)V

    .line 297
    return-void

    .line 299
    :cond_0
    array-length v0, p1

    invoke-static {p0, v0}, Lcom/android/apksig/internal/apk/v4/V4Signature;->writeIntLE(Ljava/io/OutputStream;I)V

    .line 300
    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 301
    return-void
.end method

.method static writeBytes(Ljava/nio/ByteBuffer;[B)V
    .locals 1
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "buffer",
            "bytes"
        }
    .end annotation

    .line 304
    if-nez p1, :cond_0

    .line 305
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 306
    return-void

    .line 308
    :cond_0
    array-length v0, p1

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 309
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 310
    return-void
.end method

.method static writeIntLE(Ljava/io/OutputStream;I)V
    .locals 2
    .param p0, "stream"    # Ljava/io/OutputStream;
    .param p1, "v"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "stream",
            "v"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 266
    const/4 v0, 0x4

    new-array v0, v0, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    .line 267
    .local v0, "buffer":[B
    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    .line 268
    return-void
.end method


# virtual methods
.method public writeTo(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "stream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 218
    iget v0, p0, Lcom/android/apksig/internal/apk/v4/V4Signature;->version:I

    invoke-static {p1, v0}, Lcom/android/apksig/internal/apk/v4/V4Signature;->writeIntLE(Ljava/io/OutputStream;I)V

    .line 219
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v4/V4Signature;->hashingInfo:[B

    invoke-static {p1, v0}, Lcom/android/apksig/internal/apk/v4/V4Signature;->writeBytes(Ljava/io/OutputStream;[B)V

    .line 220
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v4/V4Signature;->signingInfos:[B

    invoke-static {p1, v0}, Lcom/android/apksig/internal/apk/v4/V4Signature;->writeBytes(Ljava/io/OutputStream;[B)V

    .line 221
    return-void
.end method
