.class public Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader;
.super Ljava/lang/Object;
.source "InputStreamBerDataValueReader.java"

# interfaces
.implements Lcom/android/apksig/internal/asn1/ber/BerDataValueReader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;
    }
.end annotation


# instance fields
.field private final mIn:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "in"
        }
    .end annotation

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    if-eqz p1, :cond_0

    .line 35
    iput-object p1, p0, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader;->mIn:Ljava/io/InputStream;

    .line 36
    return-void

    .line 33
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "in == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static readDataValue(Ljava/io/InputStream;)Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    .locals 14
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
        }
    .end annotation

    .line 51
    new-instance v0, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;-><init>(Ljava/io/InputStream;Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$1;)V

    .line 54
    .local v0, "in":Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;
    :try_start_0
    invoke-virtual {v0}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;->read()I

    move-result v2

    .line 55
    .local v2, "firstIdentifierByte":I
    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 57
    return-object v1

    .line 59
    :cond_0
    invoke-static {v0, v2}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader;->readTagNumber(Ljava/io/InputStream;I)I

    move-result v9

    .line 61
    .local v9, "tagNumber":I
    invoke-virtual {v0}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;->read()I

    move-result v1

    .line 62
    .local v1, "firstLengthByte":I
    if-eq v1, v3, :cond_4

    .line 66
    int-to-byte v3, v2

    invoke-static {v3}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->isConstructed(B)Z

    move-result v3

    .line 69
    .local v3, "constructed":Z
    and-int/lit16 v4, v1, 0x80

    if-nez v4, :cond_1

    .line 71
    invoke-static {v1}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader;->readShortFormLength(I)I

    move-result v4

    .line 72
    .local v4, "contentsLength":I
    invoke-virtual {v0}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;->getReadByteCount()I

    move-result v5

    .line 73
    .local v5, "contentsOffsetInDataValue":I
    invoke-static {v0, v4}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader;->skipDefiniteLengthContents(Ljava/io/InputStream;I)V

    move v10, v4

    move v11, v5

    goto :goto_1

    .line 74
    .end local v4    # "contentsLength":I
    .end local v5    # "contentsOffsetInDataValue":I
    :cond_1
    and-int/lit16 v4, v1, 0xff

    const/16 v5, 0x80

    if-eq v4, v5, :cond_2

    .line 76
    invoke-static {v0, v1}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader;->readLongFormLength(Ljava/io/InputStream;I)I

    move-result v4

    .line 77
    .restart local v4    # "contentsLength":I
    invoke-virtual {v0}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;->getReadByteCount()I

    move-result v5

    .line 78
    .restart local v5    # "contentsOffsetInDataValue":I
    invoke-static {v0, v4}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader;->skipDefiniteLengthContents(Ljava/io/InputStream;I)V

    move v10, v4

    move v11, v5

    goto :goto_1

    .line 81
    .end local v4    # "contentsLength":I
    .end local v5    # "contentsOffsetInDataValue":I
    :cond_2
    invoke-virtual {v0}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;->getReadByteCount()I

    move-result v4

    move v5, v4

    .line 83
    .restart local v5    # "contentsOffsetInDataValue":I
    if-eqz v3, :cond_3

    .line 84
    invoke-static {v0}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader;->skipConstructedIndefiniteLengthContents(Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;)I

    move-result v4

    goto :goto_0

    .line 85
    :cond_3
    invoke-static {v0}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader;->skipPrimitiveIndefiniteLengthContents(Ljava/io/InputStream;)I

    move-result v4

    :goto_0
    move v10, v4

    move v11, v5

    .line 88
    .end local v5    # "contentsOffsetInDataValue":I
    .local v10, "contentsLength":I
    .local v11, "contentsOffsetInDataValue":I
    :goto_1
    invoke-virtual {v0}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;->getReadBytes()[B

    move-result-object v4

    move-object v12, v4

    .line 89
    .local v12, "encoded":[B
    nop

    .line 90
    invoke-static {v12, v11, v10}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 91
    .local v6, "encodedContents":Ljava/nio/ByteBuffer;
    new-instance v13, Lcom/android/apksig/internal/asn1/ber/BerDataValue;

    .line 92
    invoke-static {v12}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v5

    int-to-byte v4, v2

    .line 94
    invoke-static {v4}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->getTagClass(B)I

    move-result v7

    move-object v4, v13

    move v8, v3

    invoke-direct/range {v4 .. v9}, Lcom/android/apksig/internal/asn1/ber/BerDataValue;-><init>(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IZI)V

    .line 91
    return-object v13

    .line 63
    .end local v3    # "constructed":Z
    .end local v6    # "encodedContents":Ljava/nio/ByteBuffer;
    .end local v10    # "contentsLength":I
    .end local v11    # "contentsOffsetInDataValue":I
    .end local v12    # "encoded":[B
    :cond_4
    new-instance v3, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    const-string v4, "Missing length"

    invoke-direct {v3, v4}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    .end local v0    # "in":Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;
    .end local p0    # "input":Ljava/io/InputStream;
    throw v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    .end local v1    # "firstLengthByte":I
    .end local v2    # "firstIdentifierByte":I
    .end local v9    # "tagNumber":I
    .restart local v0    # "in":Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;
    .restart local p0    # "input":Ljava/io/InputStream;
    :catch_0
    move-exception v1

    .line 98
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    const-string v3, "Failed to read data value"

    invoke-direct {v2, v3, v1}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static readHighTagNumber(Ljava/io/InputStream;)I
    .locals 4
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "in"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
        }
    .end annotation

    .line 119
    const/4 v0, 0x0

    .line 121
    .local v0, "result":I
    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 122
    .local v1, "b":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 125
    const v2, 0xffffff

    if-gt v0, v2, :cond_1

    .line 128
    shl-int/lit8 v0, v0, 0x7

    .line 129
    and-int/lit8 v2, v1, 0x7f

    or-int/2addr v0, v2

    .line 130
    and-int/lit16 v2, v1, 0x80

    if-nez v2, :cond_0

    .line 131
    return v0

    .line 126
    :cond_1
    new-instance v2, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    const-string v3, "Tag number too large"

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 123
    :cond_2
    new-instance v2, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    const-string v3, "Truncated tag number"

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static readLongFormLength(Ljava/io/InputStream;I)I
    .locals 6
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "firstLengthByte"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "in",
            "firstLengthByte"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
        }
    .end annotation

    .line 142
    and-int/lit8 v0, p1, 0x7f

    .line 143
    .local v0, "byteCount":I
    const/4 v1, 0x4

    if-gt v0, v1, :cond_3

    .line 146
    const/4 v1, 0x0

    .line 147
    .local v1, "result":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_2

    .line 148
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v3

    .line 149
    .local v3, "b":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_1

    .line 152
    const v4, 0x7fffff

    if-gt v1, v4, :cond_0

    .line 155
    shl-int/lit8 v1, v1, 0x8

    .line 156
    and-int/lit16 v4, v3, 0xff

    or-int/2addr v1, v4

    .line 147
    .end local v3    # "b":I
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 153
    .restart local v3    # "b":I
    :cond_0
    new-instance v4, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    const-string v5, "Length too large"

    invoke-direct {v4, v5}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 150
    :cond_1
    new-instance v4, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    const-string v5, "Truncated length"

    invoke-direct {v4, v5}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 158
    .end local v2    # "i":I
    .end local v3    # "b":I
    :cond_2
    return v1

    .line 144
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

.method private static readShortFormLength(I)I
    .locals 1
    .param p0, "firstLengthByte"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "firstLengthByte"
        }
    .end annotation

    .line 135
    and-int/lit8 v0, p0, 0x7f

    return v0
.end method

.method private static readTagNumber(Ljava/io/InputStream;I)I
    .locals 2
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "firstIdentifierByte"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "in",
            "firstIdentifierByte"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
        }
    .end annotation

    .line 104
    int-to-byte v0, p1

    invoke-static {v0}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->getTagNumber(B)I

    move-result v0

    .line 105
    .local v0, "tagNumber":I
    const/16 v1, 0x1f

    if-ne v0, v1, :cond_0

    .line 107
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader;->readHighTagNumber(Ljava/io/InputStream;)I

    move-result v1

    return v1

    .line 110
    :cond_0
    return v0
.end method

.method private static skipConstructedIndefiniteLengthContents(Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;)I
    .locals 5
    .param p0, "in"    # Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "in"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
        }
    .end annotation

    .line 210
    invoke-virtual {p0}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;->getReadByteCount()I

    move-result v0

    .line 215
    .local v0, "readByteCountBefore":I
    :goto_0
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader;->readDataValue(Ljava/io/InputStream;)Lcom/android/apksig/internal/asn1/ber/BerDataValue;

    move-result-object v1

    .line 216
    .local v1, "dataValue":Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    if-eqz v1, :cond_2

    .line 221
    invoke-virtual {p0}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;->getReadByteCount()I

    move-result v2

    if-lez v2, :cond_1

    .line 224
    invoke-virtual {v1}, Lcom/android/apksig/internal/asn1/ber/BerDataValue;->getEncoded()Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 225
    .local v2, "encoded":Ljava/nio/ByteBuffer;
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v3

    if-nez v3, :cond_0

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v3

    if-nez v3, :cond_0

    .line 227
    invoke-virtual {p0}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;->getReadByteCount()I

    move-result v3

    sub-int/2addr v3, v0

    sub-int/2addr v3, v4

    return v3

    .line 229
    .end local v1    # "dataValue":Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    .end local v2    # "encoded":Ljava/nio/ByteBuffer;
    :cond_0
    goto :goto_0

    .line 222
    .restart local v1    # "dataValue":Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    :cond_1
    new-instance v2, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    const-string v3, "Indefinite-length contents too long"

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 217
    :cond_2
    new-instance v2, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Truncated indefinite-length contents: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 219
    invoke-virtual {p0}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader$RecordingInputStream;->getReadByteCount()I

    move-result v4

    sub-int/2addr v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " bytes read"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static skipDefiniteLengthContents(Ljava/io/InputStream;I)V
    .locals 6
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "len"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "in",
            "len"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
        }
    .end annotation

    .line 163
    const-wide/16 v0, 0x0

    .line 164
    .local v0, "bytesRead":J
    :goto_0
    if-lez p1, :cond_1

    .line 165
    int-to-long v2, p1

    invoke-virtual {p0, v2, v3}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v2

    long-to-int v2, v2

    .line 166
    .local v2, "skipped":I
    if-lez v2, :cond_0

    .line 171
    sub-int/2addr p1, v2

    .line 172
    int-to-long v3, v2

    add-long/2addr v0, v3

    .line 173
    .end local v2    # "skipped":I
    goto :goto_0

    .line 167
    .restart local v2    # "skipped":I
    :cond_0
    new-instance v3, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Truncated definite-length contents: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " bytes read, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " missing"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 174
    .end local v2    # "skipped":I
    :cond_1
    return-void
.end method

.method private static skipPrimitiveIndefiniteLengthContents(Ljava/io/InputStream;)I
    .locals 6
    .param p0, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "in"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
        }
    .end annotation

    .line 179
    const/4 v0, 0x0

    .line 180
    .local v0, "prevZeroByte":Z
    const/4 v1, 0x0

    .line 182
    .local v1, "bytesRead":I
    :goto_0
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 183
    .local v2, "b":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_3

    .line 187
    add-int/lit8 v1, v1, 0x1

    .line 188
    if-ltz v1, :cond_2

    .line 191
    if-nez v2, :cond_1

    .line 192
    if-eqz v0, :cond_0

    .line 194
    add-int/lit8 v3, v1, -0x2

    return v3

    .line 196
    :cond_0
    const/4 v0, 0x1

    .line 197
    goto :goto_0

    .line 199
    :cond_1
    const/4 v0, 0x0

    .line 201
    .end local v2    # "b":I
    goto :goto_0

    .line 189
    .restart local v2    # "b":I
    :cond_2
    new-instance v3, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    const-string v4, "Indefinite-length contents too long"

    invoke-direct {v3, v4}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 184
    :cond_3
    new-instance v3, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Truncated indefinite-length contents: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " bytes read"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public readDataValue()Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
        }
    .end annotation

    .line 40
    iget-object v0, p0, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader;->mIn:Ljava/io/InputStream;

    invoke-static {v0}, Lcom/android/apksig/internal/asn1/ber/InputStreamBerDataValueReader;->readDataValue(Ljava/io/InputStream;)Lcom/android/apksig/internal/asn1/ber/BerDataValue;

    move-result-object v0

    return-object v0
.end method
