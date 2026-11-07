.class Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;
.super Ljava/lang/Object;
.source "AndroidBinXmlParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/AndroidBinXmlParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Chunk"
.end annotation


# static fields
.field static final HEADER_MIN_SIZE_BYTES:I = 0x8

.field public static final RES_XML_TYPE_END_ELEMENT:I = 0x103

.field public static final RES_XML_TYPE_RESOURCE_MAP:I = 0x180

.field public static final RES_XML_TYPE_START_ELEMENT:I = 0x102

.field public static final TYPE_RES_XML:I = 0x3

.field public static final TYPE_STRING_POOL:I = 0x1


# instance fields
.field private final mContents:Ljava/nio/ByteBuffer;

.field private final mHeader:Ljava/nio/ByteBuffer;

.field private final mType:I


# direct methods
.method public constructor <init>(ILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "type"    # I
    .param p2, "header"    # Ljava/nio/ByteBuffer;
    .param p3, "contents"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "type",
            "header",
            "contents"
        }
    .end annotation

    .line 505
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 506
    iput p1, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->mType:I

    .line 507
    iput-object p2, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->mHeader:Ljava/nio/ByteBuffer;

    .line 508
    iput-object p3, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->mContents:Ljava/nio/ByteBuffer;

    .line 509
    return-void
.end method

.method public static get(Ljava/nio/ByteBuffer;)Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;
    .locals 14
    .param p0, "input"    # Ljava/nio/ByteBuffer;
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
            Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
        }
    .end annotation

    .line 534
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-ge v0, v2, :cond_0

    .line 536
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 537
    return-object v1

    .line 540
    :cond_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 541
    .local v0, "originalPosition":I
    invoke-static {p0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->access$100(Ljava/nio/ByteBuffer;)I

    move-result v3

    .line 542
    .local v3, "type":I
    invoke-static {p0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->access$100(Ljava/nio/ByteBuffer;)I

    move-result v4

    .line 543
    .local v4, "headerSize":I
    invoke-static {p0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->access$200(Ljava/nio/ByteBuffer;)J

    move-result-wide v5

    .line 544
    .local v5, "chunkSize":J
    const-wide/16 v7, 0x8

    sub-long v7, v5, v7

    .line 545
    .local v7, "chunkRemaining":J
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v9

    int-to-long v9, v9

    cmp-long v9, v7, v9

    if-lez v9, :cond_1

    .line 547
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 548
    return-object v1

    .line 550
    :cond_1
    const-string v1, " bytes"

    if-lt v4, v2, :cond_3

    .line 553
    int-to-long v9, v4

    cmp-long v2, v9, v5

    if-gtz v2, :cond_2

    .line 558
    add-int v1, v0, v4

    .line 559
    .local v1, "contentStartPosition":I
    int-to-long v9, v0

    add-long/2addr v9, v5

    .line 560
    .local v9, "chunkEndPosition":J
    new-instance v2, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;

    .line 563
    invoke-static {p0, v0, v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->access$300(Ljava/nio/ByteBuffer;II)Ljava/nio/ByteBuffer;

    move-result-object v11

    int-to-long v12, v1

    .line 564
    invoke-static {p0, v12, v13, v9, v10}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->access$400(Ljava/nio/ByteBuffer;JJ)Ljava/nio/ByteBuffer;

    move-result-object v12

    invoke-direct {v2, v3, v11, v12}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;-><init>(ILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    .line 565
    .local v2, "chunk":Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;
    long-to-int v11, v9

    invoke-virtual {p0, v11}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 566
    return-object v2

    .line 554
    .end local v1    # "contentStartPosition":I
    .end local v2    # "chunk":Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;
    .end local v9    # "chunkEndPosition":J
    :cond_2
    new-instance v2, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Malformed chunk: header too long: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " bytes. Chunk size: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 551
    :cond_3
    new-instance v2, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Malformed chunk: header too short: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;-><init>(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method public getContents()Ljava/nio/ByteBuffer;
    .locals 2

    .line 512
    iget-object v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->mContents:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 513
    .local v0, "result":Ljava/nio/ByteBuffer;
    iget-object v1, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->mContents:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 514
    return-object v0
.end method

.method public getHeader()Ljava/nio/ByteBuffer;
    .locals 2

    .line 518
    iget-object v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->mHeader:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 519
    .local v0, "result":Ljava/nio/ByteBuffer;
    iget-object v1, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->mHeader:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 520
    return-object v0
.end method

.method public getType()I
    .locals 1

    .line 524
    iget v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->mType:I

    return v0
.end method
