.class public Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;
.super Ljava/lang/Object;
.source "ByteBufferBerDataValueReader.java"

# interfaces
.implements Lcom/android/apksig/internal/asn1/ber/BerDataValueReader;


# instance fields
.field private final mBuf:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "buf"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buf"
        }
    .end annotation

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    if-eqz p1, :cond_0

    .line 32
    iput-object p1, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    .line 33
    return-void

    .line 30
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "buf == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readHighTagNumber()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
        }
    .end annotation

    .line 110
    const/4 v0, 0x0

    .line 112
    .local v0, "result":I
    :cond_0
    iget-object v1, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 115
    iget-object v1, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    .line 116
    .local v1, "b":I
    const v2, 0xffffff

    if-gt v0, v2, :cond_1

    .line 119
    shl-int/lit8 v0, v0, 0x7

    .line 120
    and-int/lit8 v2, v1, 0x7f

    or-int/2addr v0, v2

    .line 121
    and-int/lit16 v2, v1, 0x80

    if-nez v2, :cond_0

    .line 122
    return v0

    .line 117
    :cond_1
    new-instance v2, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    const-string v3, "Tag number too large"

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 113
    .end local v1    # "b":I
    :cond_2
    new-instance v1, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    const-string v2, "Truncated tag number"

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private readLongFormLength(I)I
    .locals 6
    .param p1, "firstLengthByte"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "firstLengthByte"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
        }
    .end annotation

    .line 132
    and-int/lit8 v0, p1, 0x7f

    .line 133
    .local v0, "byteCount":I
    const/4 v1, 0x4

    if-gt v0, v1, :cond_3

    .line 136
    const/4 v1, 0x0

    .line 137
    .local v1, "result":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_2

    .line 138
    iget-object v3, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 141
    iget-object v3, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    .line 142
    .local v3, "b":I
    const v4, 0x7fffff

    if-gt v1, v4, :cond_0

    .line 145
    shl-int/lit8 v1, v1, 0x8

    .line 146
    and-int/lit16 v4, v3, 0xff

    or-int/2addr v1, v4

    .line 137
    .end local v3    # "b":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 143
    .restart local v3    # "b":I
    :cond_0
    new-instance v4, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    const-string v5, "Length too large"

    invoke-direct {v4, v5}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 139
    .end local v3    # "b":I
    :cond_1
    new-instance v3, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    const-string v4, "Truncated length"

    invoke-direct {v3, v4}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 148
    .end local v2    # "i":I
    :cond_2
    return v1

    .line 134
    .end local v1    # "result":I
    :cond_3
    new-instance v1, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Length too large: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private readShortFormLength(I)I
    .locals 1
    .param p1, "firstLengthByte"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "firstLengthByte"
        }
    .end annotation

    .line 126
    and-int/lit8 v0, p1, 0x7f

    return v0
.end method

.method private readTagNumber(B)I
    .locals 2
    .param p1, "firstIdentifierByte"    # B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "firstIdentifierByte"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
        }
    .end annotation

    .line 94
    invoke-static {p1}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->getTagNumber(B)I

    move-result v0

    .line 95
    .local v0, "tagNumber":I
    const/16 v1, 0x1f

    if-ne v0, v1, :cond_0

    .line 99
    invoke-direct {p0}, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->readHighTagNumber()I

    move-result v1

    return v1

    .line 102
    :cond_0
    return v0
.end method

.method private skipConstructedIndefiniteLengthContents()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
        }
    .end annotation

    .line 192
    iget-object v0, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 193
    .local v0, "startPos":I
    :goto_0
    iget-object v1, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 195
    iget-object v1, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    iget-object v1, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result v1

    if-nez v1, :cond_0

    .line 196
    iget-object v1, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    sub-int/2addr v1, v0

    .line 197
    .local v1, "contentsLength":I
    iget-object v2, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    add-int/lit8 v3, v3, 0x2

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 198
    return v1

    .line 201
    .end local v1    # "contentsLength":I
    :cond_0
    invoke-virtual {p0}, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->readDataValue()Lcom/android/apksig/internal/asn1/ber/BerDataValue;

    goto :goto_0

    .line 204
    :cond_1
    new-instance v1, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Truncated indefinite-length contents: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    .line 206
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    sub-int/2addr v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes read"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private skipDefiniteLengthContents(I)V
    .locals 3
    .param p1, "contentsLength"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "contentsLength"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
        }
    .end annotation

    .line 152
    iget-object v0, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-lt v0, p1, :cond_0

    .line 157
    iget-object v0, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    add-int/2addr v1, p1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 158
    return-void

    .line 153
    :cond_0
    new-instance v0, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Truncated contents. Need: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " bytes, available: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    .line 155
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private skipPrimitiveIndefiniteLengthContents()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
        }
    .end annotation

    .line 162
    const/4 v0, 0x0

    .line 163
    .local v0, "prevZeroByte":Z
    const/4 v1, 0x0

    .line 165
    .local v1, "bytesRead":I
    :goto_0
    iget-object v2, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 170
    iget-object v2, p0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    .line 171
    .local v2, "b":I
    add-int/lit8 v1, v1, 0x1

    .line 172
    if-ltz v1, :cond_2

    .line 175
    if-nez v2, :cond_1

    .line 176
    if-eqz v0, :cond_0

    .line 178
    add-int/lit8 v3, v1, -0x2

    return v3

    .line 180
    :cond_0
    const/4 v0, 0x1

    goto :goto_1

    .line 182
    :cond_1
    const/4 v0, 0x0

    .line 184
    .end local v2    # "b":I
    :goto_1
    goto :goto_0

    .line 173
    .restart local v2    # "b":I
    :cond_2
    new-instance v3, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    const-string v4, "Indefinite-length contents too long"

    invoke-direct {v3, v4}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 166
    .end local v2    # "b":I
    :cond_3
    new-instance v2, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Truncated indefinite-length contents: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " bytes read"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method public readDataValue()Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
        }
    .end annotation

    .line 37
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    .line 38
    .local v1, "startPosition":I
    iget-object v2, v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-nez v2, :cond_0

    .line 39
    const/4 v2, 0x0

    return-object v2

    .line 41
    :cond_0
    iget-object v2, v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    .line 42
    .local v2, "firstIdentifierByte":B
    invoke-direct {v0, v2}, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->readTagNumber(B)I

    move-result v9

    .line 43
    .local v9, "tagNumber":I
    invoke-static {v2}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->isConstructed(B)Z

    move-result v10

    .line 45
    .local v10, "constructed":Z
    iget-object v3, v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 48
    iget-object v3, v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    and-int/lit16 v11, v3, 0xff

    .line 51
    .local v11, "firstLengthByte":I
    and-int/lit16 v3, v11, 0x80

    if-nez v3, :cond_1

    .line 53
    invoke-direct {v0, v11}, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->readShortFormLength(I)I

    move-result v3

    .line 54
    .local v3, "contentsLength":I
    iget-object v4, v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    sub-int/2addr v4, v1

    .line 55
    .local v4, "contentsOffsetInTag":I
    invoke-direct {v0, v3}, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->skipDefiniteLengthContents(I)V

    move v12, v3

    move v13, v4

    goto :goto_1

    .line 56
    .end local v3    # "contentsLength":I
    .end local v4    # "contentsOffsetInTag":I
    :cond_1
    const/16 v3, 0x80

    if-eq v11, v3, :cond_2

    .line 58
    invoke-direct {v0, v11}, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->readLongFormLength(I)I

    move-result v3

    .line 59
    .restart local v3    # "contentsLength":I
    iget-object v4, v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    sub-int/2addr v4, v1

    .line 60
    .restart local v4    # "contentsOffsetInTag":I
    invoke-direct {v0, v3}, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->skipDefiniteLengthContents(I)V

    move v12, v3

    move v13, v4

    goto :goto_1

    .line 63
    .end local v3    # "contentsLength":I
    .end local v4    # "contentsOffsetInTag":I
    :cond_2
    iget-object v3, v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    sub-int v4, v3, v1

    .line 65
    .restart local v4    # "contentsOffsetInTag":I
    if-eqz v10, :cond_3

    .line 66
    invoke-direct/range {p0 .. p0}, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->skipConstructedIndefiniteLengthContents()I

    move-result v3

    goto :goto_0

    .line 67
    :cond_3
    invoke-direct/range {p0 .. p0}, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->skipPrimitiveIndefiniteLengthContents()I

    move-result v3

    :goto_0
    move v12, v3

    move v13, v4

    .line 71
    .end local v4    # "contentsOffsetInTag":I
    .local v12, "contentsLength":I
    .local v13, "contentsOffsetInTag":I
    :goto_1
    iget-object v3, v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->position()I

    move-result v14

    .line 72
    .local v14, "endPosition":I
    iget-object v3, v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 73
    iget-object v3, v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->limit()I

    move-result v15

    .line 74
    .local v15, "bufOriginalLimit":I
    iget-object v3, v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v14}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 75
    iget-object v3, v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v8

    .line 76
    .local v8, "encoded":Ljava/nio/ByteBuffer;
    iget-object v3, v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 77
    iget-object v3, v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->mBuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v15}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 80
    invoke-virtual {v8, v13}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 81
    add-int v3, v13, v12

    invoke-virtual {v8, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 82
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v16

    .line 83
    .local v16, "encodedContents":Ljava/nio/ByteBuffer;
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 85
    new-instance v17, Lcom/android/apksig/internal/asn1/ber/BerDataValue;

    .line 88
    invoke-static {v2}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->getTagClass(B)I

    move-result v6

    move-object/from16 v3, v17

    move-object v4, v8

    move-object/from16 v5, v16

    move v7, v10

    move-object/from16 v18, v8

    .end local v8    # "encoded":Ljava/nio/ByteBuffer;
    .local v18, "encoded":Ljava/nio/ByteBuffer;
    move v8, v9

    invoke-direct/range {v3 .. v8}, Lcom/android/apksig/internal/asn1/ber/BerDataValue;-><init>(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IZI)V

    .line 85
    return-object v17

    .line 46
    .end local v11    # "firstLengthByte":I
    .end local v12    # "contentsLength":I
    .end local v13    # "contentsOffsetInTag":I
    .end local v14    # "endPosition":I
    .end local v15    # "bufOriginalLimit":I
    .end local v16    # "encodedContents":Ljava/nio/ByteBuffer;
    .end local v18    # "encoded":Ljava/nio/ByteBuffer;
    :cond_4
    new-instance v3, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    const-string v4, "Missing length"

    invoke-direct {v3, v4}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
