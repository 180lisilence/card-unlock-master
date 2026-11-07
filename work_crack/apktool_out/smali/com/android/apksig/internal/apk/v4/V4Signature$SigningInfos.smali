.class public Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;
.super Ljava/lang/Object;
.source "V4Signature.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/v4/V4Signature;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SigningInfos"
.end annotation


# instance fields
.field public final signingInfo:Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;

.field public final signingInfoBlocks:[Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;


# direct methods
.method public constructor <init>(Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;)V
    .locals 1
    .param p1, "signingInfo"    # Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signingInfo"
        }
    .end annotation

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 147
    iput-object p1, p0, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;->signingInfo:Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;

    .line 148
    const/4 v0, 0x0

    new-array v0, v0, [Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;

    iput-object v0, p0, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;->signingInfoBlocks:[Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;

    .line 149
    return-void
.end method

.method public varargs constructor <init>(Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;[Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;)V
    .locals 0
    .param p1, "signingInfo"    # Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;
    .param p2, "signingInfoBlocks"    # [Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "signingInfo",
            "signingInfoBlocks"
        }
    .end annotation

    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 152
    iput-object p1, p0, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;->signingInfo:Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;

    .line 153
    iput-object p2, p0, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;->signingInfoBlocks:[Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;

    .line 154
    return-void
.end method

.method public static fromByteArray([B)Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;
    .locals 5
    .param p0, "bytes"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 157
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 158
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    invoke-static {v0}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->fromByteBuffer(Ljava/nio/ByteBuffer;)Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;

    move-result-object v1

    .line 159
    .local v1, "signingInfo":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-nez v2, :cond_0

    .line 160
    new-instance v2, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;

    invoke-direct {v2, v1}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;-><init>(Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;)V

    return-object v2

    .line 162
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 163
    .local v2, "signingInfoBlocks":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;>;"
    :goto_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 164
    invoke-static {v0}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;->fromByteBuffer(Ljava/nio/ByteBuffer;)Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 166
    :cond_1
    new-instance v3, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;

    .line 167
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v4, v4, [Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;

    invoke-direct {v3, v1, v4}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;-><init>(Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;[Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;)V

    .line 166
    return-object v3
.end method


# virtual methods
.method toByteArray()[B
    .locals 9

    .line 171
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;->signingInfoBlocks:[Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    new-array v0, v0, [[B

    .line 172
    .local v0, "arrays":[[B
    iget-object v1, p0, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;->signingInfo:Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;

    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->toByteArray()[B

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 173
    aget-object v1, v0, v2

    array-length v1, v1

    .line 174
    .local v1, "size":I
    const/4 v3, 0x0

    .local v3, "i":I
    iget-object v4, p0, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;->signingInfoBlocks:[Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;

    array-length v4, v4

    .local v4, "isize":I
    :goto_0
    if-ge v3, v4, :cond_0

    .line 175
    add-int/lit8 v5, v3, 0x1

    iget-object v6, p0, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;->signingInfoBlocks:[Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;

    aget-object v6, v6, v3

    invoke-virtual {v6}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;->toByteArray()[B

    move-result-object v6

    aput-object v6, v0, v5

    .line 176
    add-int/lit8 v5, v3, 0x1

    aget-object v5, v0, v5

    array-length v5, v5

    add-int/2addr v1, v5

    .line 174
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 178
    .end local v3    # "i":I
    .end local v4    # "isize":I
    :cond_0
    const/16 v3, 0x1c00

    if-gt v1, v3, :cond_2

    .line 184
    aget-object v3, v0, v2

    invoke-static {v3, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v3

    .line 185
    .local v3, "result":[B
    aget-object v4, v0, v2

    array-length v4, v4

    .line 186
    .local v4, "offset":I
    const/4 v5, 0x0

    .local v5, "i":I
    iget-object v6, p0, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;->signingInfoBlocks:[Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;

    array-length v6, v6

    .local v6, "isize":I
    :goto_1
    if-ge v5, v6, :cond_1

    .line 187
    add-int/lit8 v7, v5, 0x1

    aget-object v7, v0, v7

    add-int/lit8 v8, v5, 0x1

    aget-object v8, v0, v8

    array-length v8, v8

    invoke-static {v7, v2, v3, v4, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 188
    add-int/lit8 v7, v5, 0x1

    aget-object v7, v0, v7

    array-length v7, v7

    add-int/2addr v4, v7

    .line 186
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 190
    .end local v5    # "i":I
    .end local v6    # "isize":I
    :cond_1
    return-object v3

    .line 179
    .end local v3    # "result":[B
    .end local v4    # "offset":I
    :cond_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Combined SigningInfos length exceeded limit of 7K: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
