.class public Lcom/android/apksig/internal/jar/ManifestParser;
.super Ljava/lang/Object;
.source "ManifestParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/jar/ManifestParser$Section;,
        Lcom/android/apksig/internal/jar/ManifestParser$Attribute;
    }
.end annotation


# static fields
.field private static final EMPTY_BYTE_ARRAY:[B


# instance fields
.field private mBufferedLine:[B

.field private mEndOffset:I

.field private final mManifest:[B

.field private mOffset:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 205
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/android/apksig/internal/jar/ManifestParser;->EMPTY_BYTE_ARRAY:[B

    return-void
.end method

.method public constructor <init>([B)V
    .locals 2
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .line 46
    const/4 v0, 0x0

    array-length v1, p1

    invoke-direct {p0, p1, v0, v1}, Lcom/android/apksig/internal/jar/ManifestParser;-><init>([BII)V

    .line 47
    return-void
.end method

.method public constructor <init>([BII)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "data",
            "offset",
            "length"
        }
    .end annotation

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mManifest:[B

    .line 54
    iput p2, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mOffset:I

    .line 55
    add-int v0, p2, p3

    iput v0, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mEndOffset:I

    .line 56
    return-void
.end method

.method private static concat([B[BII)[B
    .locals 3
    .param p0, "arr1"    # [B
    .param p1, "arr2"    # [B
    .param p2, "offset2"    # I
    .param p3, "length2"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "arr1",
            "arr2",
            "offset2",
            "length2"
        }
    .end annotation

    .line 208
    array-length v0, p0

    add-int/2addr v0, p3

    new-array v0, v0, [B

    .line 209
    .local v0, "result":[B
    const/4 v1, 0x0

    array-length v2, p0

    invoke-static {p0, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 210
    array-length v1, p0

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 211
    return-object v0
.end method

.method private static parseAttr(Ljava/lang/String;)Lcom/android/apksig/internal/jar/ManifestParser$Attribute;
    .locals 4
    .param p0, "attr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "attr"
        }
    .end annotation

    .line 108
    const-string v0, ": "

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 109
    .local v1, "delimiterIndex":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 110
    new-instance v0, Lcom/android/apksig/internal/jar/ManifestParser$Attribute;

    const-string v2, ""

    invoke-direct {v0, p0, v2}, Lcom/android/apksig/internal/jar/ManifestParser$Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 112
    :cond_0
    new-instance v2, Lcom/android/apksig/internal/jar/ManifestParser$Attribute;

    .line 113
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 114
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v3, v0}, Lcom/android/apksig/internal/jar/ManifestParser$Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    return-object v2
.end method

.method private readAttribute()Ljava/lang/String;
    .locals 3

    .line 123
    invoke-direct {p0}, Lcom/android/apksig/internal/jar/ManifestParser;->readAttributeBytes()[B

    move-result-object v0

    .line 124
    .local v0, "bytes":[B
    if-nez v0, :cond_0

    .line 125
    const/4 v1, 0x0

    return-object v1

    .line 126
    :cond_0
    array-length v1, v0

    if-nez v1, :cond_1

    .line 127
    const-string v1, ""

    return-object v1

    .line 129
    :cond_1
    new-instance v1, Ljava/lang/String;

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v1
.end method

.method private readAttributeBytes()[B
    .locals 6

    .line 139
    iget-object v0, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mBufferedLine:[B

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    array-length v0, v0

    if-nez v0, :cond_0

    .line 140
    iput-object v1, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mBufferedLine:[B

    .line 141
    sget-object v0, Lcom/android/apksig/internal/jar/ManifestParser;->EMPTY_BYTE_ARRAY:[B

    return-object v0

    .line 145
    :cond_0
    invoke-direct {p0}, Lcom/android/apksig/internal/jar/ManifestParser;->readLine()[B

    move-result-object v0

    .line 146
    .local v0, "line":[B
    if-nez v0, :cond_2

    .line 148
    iget-object v2, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mBufferedLine:[B

    if-eqz v2, :cond_1

    .line 149
    iget-object v2, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mBufferedLine:[B

    .line 150
    .local v2, "result":[B
    iput-object v1, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mBufferedLine:[B

    .line 151
    return-object v2

    .line 153
    .end local v2    # "result":[B
    :cond_1
    return-object v1

    .line 157
    :cond_2
    array-length v2, v0

    if-nez v2, :cond_4

    .line 159
    iget-object v1, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mBufferedLine:[B

    if-eqz v1, :cond_3

    .line 160
    iget-object v1, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mBufferedLine:[B

    .line 161
    .local v1, "result":[B
    sget-object v2, Lcom/android/apksig/internal/jar/ManifestParser;->EMPTY_BYTE_ARRAY:[B

    iput-object v2, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mBufferedLine:[B

    .line 162
    return-object v1

    .line 164
    .end local v1    # "result":[B
    :cond_3
    sget-object v1, Lcom/android/apksig/internal/jar/ManifestParser;->EMPTY_BYTE_ARRAY:[B

    return-object v1

    .line 167
    :cond_4
    iget-object v2, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mBufferedLine:[B

    const/16 v3, 0x20

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-nez v2, :cond_5

    .line 168
    move-object v1, v0

    .local v1, "attrLine":[B
    goto :goto_0

    .line 170
    .end local v1    # "attrLine":[B
    :cond_5
    array-length v2, v0

    if-eqz v2, :cond_a

    aget-byte v2, v0, v4

    if-eq v2, v3, :cond_6

    goto :goto_1

    .line 176
    :cond_6
    iget-object v2, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mBufferedLine:[B

    .line 177
    .local v2, "attrLine":[B
    iput-object v1, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mBufferedLine:[B

    .line 178
    array-length v1, v0

    sub-int/2addr v1, v5

    invoke-static {v2, v0, v5, v1}, Lcom/android/apksig/internal/jar/ManifestParser;->concat([B[BII)[B

    move-result-object v1

    .line 185
    .end local v2    # "attrLine":[B
    .restart local v1    # "attrLine":[B
    :goto_0
    invoke-direct {p0}, Lcom/android/apksig/internal/jar/ManifestParser;->readLine()[B

    move-result-object v0

    .line 186
    if-nez v0, :cond_7

    .line 188
    return-object v1

    .line 189
    :cond_7
    array-length v2, v0

    if-nez v2, :cond_8

    .line 191
    sget-object v2, Lcom/android/apksig/internal/jar/ManifestParser;->EMPTY_BYTE_ARRAY:[B

    iput-object v2, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mBufferedLine:[B

    .line 192
    return-object v1

    .line 194
    :cond_8
    aget-byte v2, v0, v4

    if-ne v2, v3, :cond_9

    .line 196
    array-length v2, v0

    sub-int/2addr v2, v5

    invoke-static {v1, v0, v5, v2}, Lcom/android/apksig/internal/jar/ManifestParser;->concat([B[BII)[B

    move-result-object v1

    goto :goto_0

    .line 199
    :cond_9
    iput-object v0, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mBufferedLine:[B

    .line 200
    return-object v1

    .line 172
    .end local v1    # "attrLine":[B
    :cond_a
    :goto_1
    iget-object v1, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mBufferedLine:[B

    .line 173
    .local v1, "result":[B
    iput-object v0, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mBufferedLine:[B

    .line 174
    return-object v1
.end method

.method private readLine()[B
    .locals 9

    .line 219
    iget v0, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mOffset:I

    iget v1, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mEndOffset:I

    if-lt v0, v1, :cond_0

    .line 220
    const/4 v0, 0x0

    return-object v0

    .line 222
    :cond_0
    iget v0, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mOffset:I

    .line 223
    .local v0, "startOffset":I
    const/4 v1, -0x1

    .line 224
    .local v1, "newlineStartOffset":I
    const/4 v2, -0x1

    .line 225
    .local v2, "newlineEndOffset":I
    move v3, v0

    .local v3, "i":I
    :goto_0
    iget v4, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mEndOffset:I

    if-ge v3, v4, :cond_4

    .line 226
    iget-object v5, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mManifest:[B

    aget-byte v6, v5, v3

    .line 227
    .local v6, "b":B
    const/16 v7, 0xd

    const/16 v8, 0xa

    if-ne v6, v7, :cond_2

    .line 228
    move v1, v3

    .line 229
    add-int/lit8 v7, v3, 0x1

    .line 230
    .local v7, "nextIndex":I
    if-ge v7, v4, :cond_1

    aget-byte v4, v5, v7

    if-ne v4, v8, :cond_1

    .line 231
    add-int/lit8 v2, v7, 0x1

    .line 232
    goto :goto_1

    .line 234
    :cond_1
    move v2, v7

    .line 235
    goto :goto_1

    .line 236
    .end local v7    # "nextIndex":I
    :cond_2
    if-ne v6, v8, :cond_3

    .line 237
    move v1, v3

    .line 238
    add-int/lit8 v2, v3, 0x1

    .line 239
    goto :goto_1

    .line 225
    .end local v6    # "b":B
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 242
    .end local v3    # "i":I
    :cond_4
    :goto_1
    const/4 v3, -0x1

    if-ne v1, v3, :cond_5

    .line 243
    iget v1, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mEndOffset:I

    .line 244
    iget v2, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mEndOffset:I

    .line 246
    :cond_5
    iput v2, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mOffset:I

    .line 248
    if-ne v1, v0, :cond_6

    .line 249
    sget-object v3, Lcom/android/apksig/internal/jar/ManifestParser;->EMPTY_BYTE_ARRAY:[B

    return-object v3

    .line 251
    :cond_6
    iget-object v3, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mManifest:[B

    invoke-static {v3, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v3

    return-object v3
.end method


# virtual methods
.method public readAllSections()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/jar/ManifestParser$Section;",
            ">;"
        }
    .end annotation

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .local v0, "sections":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/jar/ManifestParser$Section;>;"
    :goto_0
    invoke-virtual {p0}, Lcom/android/apksig/internal/jar/ManifestParser;->readSection()Lcom/android/apksig/internal/jar/ManifestParser$Section;

    move-result-object v1

    move-object v2, v1

    .local v2, "section":Lcom/android/apksig/internal/jar/ManifestParser$Section;
    if-eqz v1, :cond_0

    .line 65
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 67
    :cond_0
    return-object v0
.end method

.method public readSection()Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .locals 6

    .line 78
    nop

    :cond_0
    iget v0, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mOffset:I

    .line 79
    .local v0, "sectionStartOffset":I
    invoke-direct {p0}, Lcom/android/apksig/internal/jar/ManifestParser;->readAttribute()Ljava/lang/String;

    move-result-object v1

    .line 80
    .local v1, "attr":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 81
    const/4 v2, 0x0

    return-object v2

    .line 83
    :cond_1
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    .line 84
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 85
    .local v2, "attrs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/jar/ManifestParser$Attribute;>;"
    invoke-static {v1}, Lcom/android/apksig/internal/jar/ManifestParser;->parseAttr(Ljava/lang/String;)Lcom/android/apksig/internal/jar/ManifestParser$Attribute;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    :goto_0
    invoke-direct {p0}, Lcom/android/apksig/internal/jar/ManifestParser;->readAttribute()Ljava/lang/String;

    move-result-object v1

    .line 90
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_2

    .line 92
    goto :goto_1

    .line 94
    :cond_2
    invoke-static {v1}, Lcom/android/apksig/internal/jar/ManifestParser;->parseAttr(Ljava/lang/String;)Lcom/android/apksig/internal/jar/ManifestParser$Attribute;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 97
    :cond_3
    :goto_1
    iget v3, p0, Lcom/android/apksig/internal/jar/ManifestParser;->mOffset:I

    .line 98
    .local v3, "sectionEndOffset":I
    sub-int v4, v3, v0

    .line 100
    .local v4, "sectionSizeBytes":I
    new-instance v5, Lcom/android/apksig/internal/jar/ManifestParser$Section;

    invoke-direct {v5, v0, v4, v2}, Lcom/android/apksig/internal/jar/ManifestParser$Section;-><init>(IILjava/util/List;)V

    return-object v5
.end method
