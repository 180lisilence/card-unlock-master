.class public Lcom/android/apksig/internal/apk/AndroidBinXmlParser;
.super Ljava/lang/Object;
.source "AndroidBinXmlParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;,
        Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;,
        Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;,
        Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;,
        Lcom/android/apksig/internal/apk/AndroidBinXmlParser$ResourceMap;
    }
.end annotation


# static fields
.field public static final EVENT_END_DOCUMENT:I = 0x2

.field public static final EVENT_END_ELEMENT:I = 0x4

.field public static final EVENT_START_DOCUMENT:I = 0x1

.field public static final EVENT_START_ELEMENT:I = 0x3

.field private static final NO_NAMESPACE:J = 0xffffffffL

.field public static final VALUE_TYPE_BOOLEAN:I = 0x4

.field public static final VALUE_TYPE_INT:I = 0x2

.field public static final VALUE_TYPE_REFERENCE:I = 0x3

.field public static final VALUE_TYPE_STRING:I = 0x1

.field public static final VALUE_TYPE_UNSUPPORTED:I


# instance fields
.field private mCurrentElementAttrSizeBytes:I

.field private mCurrentElementAttributeCount:I

.field private mCurrentElementAttributes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentElementAttributesContents:Ljava/nio/ByteBuffer;

.field private mCurrentElementName:Ljava/lang/String;

.field private mCurrentElementNamespace:Ljava/lang/String;

.field private mCurrentEvent:I

.field private mDepth:I

.field private mResourceMap:Lcom/android/apksig/internal/apk/AndroidBinXmlParser$ResourceMap;

.field private mStringPool:Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;

.field private final mXml:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "xml"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "xml"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
        }
    .end annotation

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentEvent:I

    .line 86
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 88
    const/4 v0, 0x0

    .line 89
    .local v0, "resXmlChunk":Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;
    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 90
    invoke-static {p1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->get(Ljava/nio/ByteBuffer;)Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;

    move-result-object v1

    .line 91
    .local v1, "chunk":Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;
    if-nez v1, :cond_0

    .line 92
    goto :goto_1

    .line 94
    :cond_0
    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->getType()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_1

    .line 95
    move-object v0, v1

    .line 96
    goto :goto_1

    .line 98
    .end local v1    # "chunk":Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;
    :cond_1
    goto :goto_0

    .line 100
    :cond_2
    :goto_1
    if-eqz v0, :cond_3

    .line 103
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->getContents()Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mXml:Ljava/nio/ByteBuffer;

    .line 104
    return-void

    .line 101
    :cond_3
    new-instance v1, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;

    const-string v2, "No XML chunk in file"

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static synthetic access$100(Ljava/nio/ByteBuffer;)I
    .locals 1
    .param p0, "x0"    # Ljava/nio/ByteBuffer;

    .line 35
    invoke-static {p0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getUnsignedInt16(Ljava/nio/ByteBuffer;)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Ljava/nio/ByteBuffer;)J
    .locals 2
    .param p0, "x0"    # Ljava/nio/ByteBuffer;

    .line 35
    invoke-static {p0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getUnsignedInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$300(Ljava/nio/ByteBuffer;II)Ljava/nio/ByteBuffer;
    .locals 1
    .param p0, "x0"    # Ljava/nio/ByteBuffer;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .line 35
    invoke-static {p0, p1, p2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->sliceFromTo(Ljava/nio/ByteBuffer;II)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Ljava/nio/ByteBuffer;JJ)Ljava/nio/ByteBuffer;
    .locals 1
    .param p0, "x0"    # Ljava/nio/ByteBuffer;
    .param p1, "x1"    # J
    .param p3, "x2"    # J

    .line 35
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->sliceFromTo(Ljava/nio/ByteBuffer;JJ)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Ljava/nio/ByteBuffer;I)J
    .locals 2
    .param p0, "x0"    # Ljava/nio/ByteBuffer;
    .param p1, "x1"    # I

    .line 35
    invoke-static {p0, p1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getUnsignedInt32(Ljava/nio/ByteBuffer;I)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$600(Ljava/nio/ByteBuffer;)I
    .locals 1
    .param p0, "x0"    # Ljava/nio/ByteBuffer;

    .line 35
    invoke-static {p0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getUnsignedInt8(Ljava/nio/ByteBuffer;)I

    move-result v0

    return v0
.end method

.method private getAttribute(I)Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;
    .locals 3
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 254
    iget v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentEvent:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_2

    .line 257
    if-ltz p1, :cond_1

    .line 260
    iget v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttributeCount:I

    if-ge p1, v0, :cond_0

    .line 264
    invoke-direct {p0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->parseCurrentElementAttributesIfNotParsed()V

    .line 265
    iget-object v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttributes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;

    return-object v0

    .line 261
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "index must be <= attr count ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttributeCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 258
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "index must be >= 0"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 255
    :cond_2
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "Current event not a START_ELEMENT"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static getUnsignedInt16(Ljava/nio/ByteBuffer;)I
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

    .line 844
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    return v0
.end method

.method private static getUnsignedInt32(Ljava/nio/ByteBuffer;)J
    .locals 4
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buffer"
        }
    .end annotation

    .line 848
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method private static getUnsignedInt32(Ljava/nio/ByteBuffer;I)J
    .locals 4
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "buffer",
            "position"
        }
    .end annotation

    .line 852
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method private static getUnsignedInt8(Ljava/nio/ByteBuffer;)I
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

    .line 840
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method private parseCurrentElementAttributesIfNotParsed()V
    .locals 27

    .line 375
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttributes:Ljava/util/List;

    if-eqz v1, :cond_0

    .line 376
    return-void

    .line 378
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    iget v2, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttributeCount:I

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttributes:Ljava/util/List;

    .line 379
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttributeCount:I

    if-ge v1, v2, :cond_1

    .line 380
    iget v2, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttrSizeBytes:I

    mul-int v3, v1, v2

    .line 381
    .local v3, "startPosition":I
    iget-object v4, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttributesContents:Ljava/nio/ByteBuffer;

    add-int/2addr v2, v3

    .line 382
    invoke-static {v4, v3, v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->sliceFromTo(Ljava/nio/ByteBuffer;II)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 386
    .local v2, "attr":Ljava/nio/ByteBuffer;
    invoke-static {v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getUnsignedInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v14

    .line 387
    .local v14, "nsId":J
    invoke-static {v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getUnsignedInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v16

    .line 388
    .local v16, "nameId":J
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    add-int/lit8 v4, v4, 0x7

    invoke-virtual {v2, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 389
    invoke-static {v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getUnsignedInt8(Ljava/nio/ByteBuffer;)I

    move-result v18

    .line 390
    .local v18, "valueType":I
    invoke-static {v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getUnsignedInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v12

    .line 391
    .local v12, "valueData":J
    iget-object v11, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttributes:Ljava/util/List;

    new-instance v10, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;

    long-to-int v9, v12

    iget-object v7, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mStringPool:Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;

    iget-object v8, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mResourceMap:Lcom/android/apksig/internal/apk/AndroidBinXmlParser$ResourceMap;

    const/16 v19, 0x0

    move-object v4, v10

    move-wide v5, v14

    move-object/from16 v20, v7

    move-object/from16 v21, v8

    move-wide/from16 v7, v16

    move/from16 v22, v9

    move/from16 v9, v18

    move-object/from16 v23, v10

    move/from16 v10, v22

    move-object/from16 v24, v11

    move-object/from16 v11, v20

    move-wide/from16 v25, v12

    .end local v12    # "valueData":J
    .local v25, "valueData":J
    move-object/from16 v12, v21

    move-object/from16 v13, v19

    invoke-direct/range {v4 .. v13}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;-><init>(JJIILcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;Lcom/android/apksig/internal/apk/AndroidBinXmlParser$ResourceMap;Lcom/android/apksig/internal/apk/AndroidBinXmlParser$1;)V

    move-object/from16 v5, v23

    move-object/from16 v4, v24

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 379
    .end local v2    # "attr":Ljava/nio/ByteBuffer;
    .end local v3    # "startPosition":I
    .end local v14    # "nsId":J
    .end local v16    # "nameId":J
    .end local v18    # "valueType":I
    .end local v25    # "valueData":J
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 400
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method private static sliceFromTo(Ljava/nio/ByteBuffer;II)Ljava/nio/ByteBuffer;
    .locals 6
    .param p0, "source"    # Ljava/nio/ByteBuffer;
    .param p1, "start"    # I
    .param p2, "end"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "source",
            "start",
            "end"
        }
    .end annotation

    .line 813
    if-ltz p1, :cond_2

    .line 816
    if-lt p2, p1, :cond_1

    .line 819
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    .line 820
    .local v0, "capacity":I
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    if-gt p2, v1, :cond_0

    .line 823
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    .line 824
    .local v1, "originalLimit":I
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    .line 826
    .local v2, "originalPosition":I
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 827
    invoke-virtual {p0, p2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 828
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 829
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 830
    .local v4, "result":Ljava/nio/ByteBuffer;
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 831
    nop

    .line 833
    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 834
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 835
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 831
    return-object v4

    .line 833
    .end local v4    # "result":Ljava/nio/ByteBuffer;
    :catchall_0
    move-exception v4

    invoke-virtual {p0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 834
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 835
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 836
    throw v4

    .line 821
    .end local v1    # "originalLimit":I
    .end local v2    # "originalPosition":I
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "end > capacity: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " > "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 817
    .end local v0    # "capacity":I
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "end < start: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " < "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 814
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "start: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static sliceFromTo(Ljava/nio/ByteBuffer;JJ)Ljava/nio/ByteBuffer;
    .locals 4
    .param p0, "source"    # Ljava/nio/ByteBuffer;
    .param p1, "start"    # J
    .param p3, "end"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "source",
            "start",
            "end"
        }
    .end annotation

    .line 793
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_2

    .line 796
    cmp-long v0, p3, p1

    if-ltz v0, :cond_1

    .line 799
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    .line 800
    .local v0, "capacity":I
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    int-to-long v1, v1

    cmp-long v1, p3, v1

    if-gtz v1, :cond_0

    .line 803
    long-to-int v1, p1

    long-to-int v2, p3

    invoke-static {p0, v1, v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->sliceFromTo(Ljava/nio/ByteBuffer;II)Ljava/nio/ByteBuffer;

    move-result-object v1

    return-object v1

    .line 801
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "end > capacity: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " > "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 797
    .end local v0    # "capacity":I
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "end < start: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " < "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 794
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "start: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getAttributeBooleanValue(I)Z
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
        }
    .end annotation

    .line 238
    invoke-direct {p0, p1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttribute(I)Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;->getBooleanValue()Z

    move-result v0

    return v0
.end method

.method public getAttributeCount()I
    .locals 2

    .line 150
    iget v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentEvent:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 151
    const/4 v0, -0x1

    return v0

    .line 154
    :cond_0
    iget v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttributeCount:I

    return v0
.end method

.method public getAttributeIntValue(I)I
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
        }
    .end annotation

    .line 226
    invoke-direct {p0, p1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttribute(I)Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;->getIntValue()I

    move-result v0

    return v0
.end method

.method public getAttributeName(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
        }
    .end annotation

    .line 177
    invoke-direct {p0, p1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttribute(I)Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAttributeNameResourceId(I)I
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
        }
    .end annotation

    .line 166
    invoke-direct {p0, p1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttribute(I)Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;->getNameResourceId()I

    move-result v0

    return v0
.end method

.method public getAttributeNamespace(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
        }
    .end annotation

    .line 189
    invoke-direct {p0, p1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttribute(I)Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;->getNamespace()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAttributeStringValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
        }
    .end annotation

    .line 250
    invoke-direct {p0, p1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttribute(I)Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;->getStringValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAttributeValueType(I)I
    .locals 2
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
        }
    .end annotation

    .line 201
    invoke-direct {p0, p1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttribute(I)Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Attribute;->getValueType()I

    move-result v0

    .line 202
    .local v0, "type":I
    sparse-switch v0, :sswitch_data_0

    .line 213
    const/4 v1, 0x0

    return v1

    .line 211
    :sswitch_0
    const/4 v1, 0x4

    return v1

    .line 207
    :sswitch_1
    const/4 v1, 0x2

    return v1

    .line 204
    :sswitch_2
    const/4 v1, 0x1

    return v1

    .line 209
    :sswitch_3
    const/4 v1, 0x3

    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_3
        0x3 -> :sswitch_2
        0x10 -> :sswitch_1
        0x11 -> :sswitch_1
        0x12 -> :sswitch_0
    .end sparse-switch
.end method

.method public getDepth()I
    .locals 1

    .line 112
    iget v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mDepth:I

    return v0
.end method

.method public getEventType()I
    .locals 1

    .line 119
    iget v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentEvent:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .line 127
    iget v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentEvent:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 128
    const/4 v0, 0x0

    return-object v0

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementName:Ljava/lang/String;

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 2

    .line 139
    iget v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentEvent:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 140
    const/4 v0, 0x0

    return-object v0

    .line 142
    :cond_0
    iget-object v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementNamespace:Ljava/lang/String;

    return-object v0
.end method

.method public next()I
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
        }
    .end annotation

    .line 273
    move-object/from16 v0, p0

    iget v1, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentEvent:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_0

    .line 274
    iget v1, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mDepth:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mDepth:I

    .line 279
    :cond_0
    :goto_0
    iget-object v1, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mXml:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_c

    .line 280
    iget-object v1, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mXml:Ljava/nio/ByteBuffer;

    invoke-static {v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->get(Ljava/nio/ByteBuffer;)Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;

    move-result-object v1

    .line 281
    .local v1, "chunk":Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;
    if-nez v1, :cond_1

    .line 282
    goto/16 :goto_4

    .line 284
    :cond_1
    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->getType()I

    move-result v3

    const-string v4, ""

    const-wide v5, 0xffffffffL

    const-string v7, " bytes"

    const-string v8, "Named element encountered before string pool"

    const/4 v9, 0x0

    sparse-switch v3, :sswitch_data_0

    goto/16 :goto_3

    .line 359
    :sswitch_0
    iget-object v3, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mResourceMap:Lcom/android/apksig/internal/apk/AndroidBinXmlParser$ResourceMap;

    if-nez v3, :cond_2

    .line 362
    new-instance v3, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$ResourceMap;

    invoke-direct {v3, v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$ResourceMap;-><init>(Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;)V

    iput-object v3, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mResourceMap:Lcom/android/apksig/internal/apk/AndroidBinXmlParser$ResourceMap;

    .line 363
    goto/16 :goto_3

    .line 360
    :cond_2
    new-instance v2, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;

    const-string v3, "Multiple resource maps not supported"

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 338
    :sswitch_1
    iget-object v3, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mStringPool:Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;

    if-eqz v3, :cond_5

    .line 342
    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->getContents()Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 343
    .local v3, "contents":Ljava/nio/ByteBuffer;
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v8

    const/16 v10, 0x8

    if-lt v8, v10, :cond_4

    .line 348
    invoke-static {v3}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getUnsignedInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v7

    .line 349
    .local v7, "nsId":J
    invoke-static {v3}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getUnsignedInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v10

    .line 350
    .local v10, "nameId":J
    iget-object v12, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mStringPool:Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;

    invoke-virtual {v12, v10, v11}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;->getString(J)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementName:Ljava/lang/String;

    .line 351
    nop

    .line 352
    cmp-long v5, v7, v5

    if-nez v5, :cond_3

    goto :goto_1

    :cond_3
    iget-object v4, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mStringPool:Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;

    invoke-virtual {v4, v7, v8}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;->getString(J)Ljava/lang/String;

    move-result-object v4

    :goto_1
    iput-object v4, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementNamespace:Ljava/lang/String;

    .line 353
    iput v2, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentEvent:I

    .line 354
    iput-object v9, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttributes:Ljava/util/List;

    .line 355
    iput-object v9, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttributesContents:Ljava/nio/ByteBuffer;

    .line 356
    return v2

    .line 344
    .end local v7    # "nsId":J
    .end local v10    # "nameId":J
    :cond_4
    new-instance v2, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "End element chunk too short. Need at least 8 bytes. Available: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 346
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 339
    .end local v3    # "contents":Ljava/nio/ByteBuffer;
    :cond_5
    new-instance v2, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;

    invoke-direct {v2, v8}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 294
    :sswitch_2
    iget-object v2, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mStringPool:Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;

    if-eqz v2, :cond_a

    .line 298
    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->getContents()Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 299
    .local v2, "contents":Ljava/nio/ByteBuffer;
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    const/16 v8, 0x14

    if-lt v3, v8, :cond_9

    .line 304
    invoke-static {v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getUnsignedInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v7

    .line 305
    .restart local v7    # "nsId":J
    invoke-static {v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getUnsignedInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v10

    .line 306
    .restart local v10    # "nameId":J
    invoke-static {v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getUnsignedInt16(Ljava/nio/ByteBuffer;)I

    move-result v3

    .line 307
    .local v3, "attrStartOffset":I
    invoke-static {v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getUnsignedInt16(Ljava/nio/ByteBuffer;)I

    move-result v12

    .line 308
    .local v12, "attrSizeBytes":I
    invoke-static {v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getUnsignedInt16(Ljava/nio/ByteBuffer;)I

    move-result v13

    .line 309
    .local v13, "attrCount":I
    int-to-long v14, v3

    int-to-long v5, v13

    move-wide/from16 v16, v10

    .end local v10    # "nameId":J
    .local v16, "nameId":J
    int-to-long v9, v12

    mul-long/2addr v5, v9

    add-long/2addr v14, v5

    .line 310
    .local v14, "attrEndOffset":J
    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 311
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    const-string v6, ", max: "

    if-gt v3, v5, :cond_8

    .line 316
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    int-to-long v9, v5

    cmp-long v5, v14, v9

    if-gtz v5, :cond_7

    .line 322
    iget-object v5, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mStringPool:Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;

    move-wide/from16 v9, v16

    .end local v16    # "nameId":J
    .local v9, "nameId":J
    invoke-virtual {v5, v9, v10}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;->getString(J)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementName:Ljava/lang/String;

    .line 323
    nop

    .line 324
    const-wide v5, 0xffffffffL

    cmp-long v5, v7, v5

    if-nez v5, :cond_6

    goto :goto_2

    :cond_6
    iget-object v4, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mStringPool:Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;

    invoke-virtual {v4, v7, v8}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;->getString(J)Ljava/lang/String;

    move-result-object v4

    :goto_2
    iput-object v4, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementNamespace:Ljava/lang/String;

    .line 325
    iput v13, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttributeCount:I

    .line 326
    const/4 v4, 0x0

    iput-object v4, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttributes:Ljava/util/List;

    .line 327
    iput v12, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttrSizeBytes:I

    .line 328
    int-to-long v4, v3

    .line 329
    invoke-static {v2, v4, v5, v14, v15}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->sliceFromTo(Ljava/nio/ByteBuffer;JJ)Ljava/nio/ByteBuffer;

    move-result-object v4

    iput-object v4, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentElementAttributesContents:Ljava/nio/ByteBuffer;

    .line 331
    iget v4, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mDepth:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mDepth:I

    .line 332
    const/4 v4, 0x3

    iput v4, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentEvent:I

    .line 333
    return v4

    .line 317
    .end local v9    # "nameId":J
    .restart local v16    # "nameId":J
    :cond_7
    new-instance v4, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Attributes end offset out of bounds: "

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 319
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 312
    :cond_8
    new-instance v4, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Attributes start offset out of bounds: "

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 314
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 300
    .end local v3    # "attrStartOffset":I
    .end local v7    # "nsId":J
    .end local v12    # "attrSizeBytes":I
    .end local v13    # "attrCount":I
    .end local v14    # "attrEndOffset":J
    .end local v16    # "nameId":J
    :cond_9
    new-instance v3, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Start element chunk too short. Need at least 20 bytes. Available: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 302
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 295
    .end local v2    # "contents":Ljava/nio/ByteBuffer;
    :cond_a
    new-instance v2, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;

    invoke-direct {v2, v8}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 286
    :sswitch_3
    iget-object v3, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mStringPool:Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;

    if-nez v3, :cond_b

    .line 289
    new-instance v3, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;

    invoke-direct {v3, v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;-><init>(Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;)V

    iput-object v3, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mStringPool:Lcom/android/apksig/internal/apk/AndroidBinXmlParser$StringPool;

    .line 290
    goto :goto_3

    .line 287
    :cond_b
    new-instance v2, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;

    const-string v3, "Multiple string pools not supported"

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 368
    .end local v1    # "chunk":Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;
    :goto_3
    goto/16 :goto_0

    .line 370
    :cond_c
    :goto_4
    const/4 v1, 0x2

    iput v1, v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->mCurrentEvent:I

    .line 371
    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_3
        0x102 -> :sswitch_2
        0x103 -> :sswitch_1
        0x180 -> :sswitch_0
    .end sparse-switch
.end method
