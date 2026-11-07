.class Lcom/android/apksig/internal/apk/AndroidBinXmlParser$ResourceMap;
.super Ljava/lang/Object;
.source "AndroidBinXmlParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/AndroidBinXmlParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ResourceMap"
.end annotation


# instance fields
.field private final mChunkContents:Ljava/nio/ByteBuffer;

.field private final mEntryCount:I


# direct methods
.method public constructor <init>(Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;)V
    .locals 2
    .param p1, "chunk"    # Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "chunk"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
        }
    .end annotation

    .line 765
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 766
    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->getContents()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$ResourceMap;->mChunkContents:Ljava/nio/ByteBuffer;

    .line 767
    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$Chunk;->getContents()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 769
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    div-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$ResourceMap;->mEntryCount:I

    .line 770
    return-void
.end method


# virtual methods
.method public getResourceId(J)I
    .locals 3
    .param p1, "index"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .line 777
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_1

    iget v0, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$ResourceMap;->mEntryCount:I

    int-to-long v0, v0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    goto :goto_0

    .line 780
    :cond_0
    long-to-int v0, p1

    .line 782
    .local v0, "idx":I
    iget-object v1, p0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser$ResourceMap;->mChunkContents:Ljava/nio/ByteBuffer;

    mul-int/lit8 v2, v0, 0x4

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v1

    return v1

    .line 778
    .end local v0    # "idx":I
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method
