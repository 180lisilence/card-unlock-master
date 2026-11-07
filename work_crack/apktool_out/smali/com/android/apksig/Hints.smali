.class public final Lcom/android/apksig/Hints;
.super Ljava/lang/Object;
.source "Hints.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/Hints$ByteRange;,
        Lcom/android/apksig/Hints$PatternWithRange;
    }
.end annotation


# static fields
.field public static final PIN_BYTE_RANGE_ZIP_ENTRY_NAME:Ljava/lang/String; = "pinlist.meta"

.field public static final PIN_HINT_ASSET_ZIP_ENTRY_NAME:Ljava/lang/String; = "assets/com.android.hints.pins.txt"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static clampToInt(J)I
    .locals 4
    .param p0, "value"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 38
    const-wide/32 v0, 0x7fffffff

    invoke-static {p0, p1, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public static encodeByteRangeList(Ljava/util/List;)[B
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "pinByteRanges"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/Hints$ByteRange;",
            ">;)[B"
        }
    .end annotation

    .line 89
    .local p0, "pinByteRanges":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$ByteRange;>;"
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x8

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 90
    .local v0, "bos":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 92
    .local v1, "out":Ljava/io/DataOutputStream;
    :try_start_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/Hints$ByteRange;

    .line 93
    .local v3, "pinByteRange":Lcom/android/apksig/Hints$ByteRange;
    iget-wide v4, v3, Lcom/android/apksig/Hints$ByteRange;->start:J

    invoke-static {v4, v5}, Lcom/android/apksig/Hints;->clampToInt(J)I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 94
    iget-wide v4, v3, Lcom/android/apksig/Hints$ByteRange;->end:J

    iget-wide v6, v3, Lcom/android/apksig/Hints$ByteRange;->start:J

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Lcom/android/apksig/Hints;->clampToInt(J)I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/io/DataOutputStream;->writeInt(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    .end local v3    # "pinByteRange":Lcom/android/apksig/Hints$ByteRange;
    goto :goto_0

    .line 98
    :cond_0
    nop

    .line 99
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2

    .line 96
    :catch_0
    move-exception v2

    .line 97
    .local v2, "ex":Ljava/io/IOException;
    new-instance v3, Ljava/lang/AssertionError;

    const-string v4, "impossible"

    invoke-direct {v3, v4, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public static parsePinPatterns([B)Ljava/util/ArrayList;
    .locals 21
    .param p0, "patternBlob"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "patternBlob"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Ljava/util/ArrayList<",
            "Lcom/android/apksig/Hints$PatternWithRange;",
            ">;"
        }
    .end annotation

    .line 103
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v0

    .line 105
    .local v1, "pinPatterns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/apksig/Hints$PatternWithRange;>;"
    :try_start_0
    new-instance v0, Ljava/lang/String;

    const-string v2, "UTF-8"
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v3, p0

    :try_start_1
    invoke-direct {v0, v3, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v2, v0

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v2, :cond_2

    aget-object v6, v0, v5

    .line 106
    .local v6, "rawLine":Ljava/lang/String;
    const-string v7, "#.*"

    const-string v8, ""

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 107
    .local v7, "line":Ljava/lang/String;
    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 108
    .local v8, "fields":[Ljava/lang/String;
    array-length v9, v8

    const/4 v10, 0x1

    if-ne v9, v10, :cond_0

    .line 109
    new-instance v9, Lcom/android/apksig/Hints$PatternWithRange;

    aget-object v10, v8, v4

    invoke-direct {v9, v10}, Lcom/android/apksig/Hints$PatternWithRange;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 110
    :cond_0
    array-length v9, v8

    const/4 v11, 0x3

    if-ne v9, v11, :cond_1

    .line 111
    aget-object v9, v8, v10

    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v9

    .line 112
    .local v9, "start":J
    const/4 v11, 0x2

    aget-object v11, v8, v11

    invoke-static {v11}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v11

    move-wide/from16 v17, v11

    .line 113
    .local v17, "end":J
    new-instance v15, Lcom/android/apksig/Hints$PatternWithRange;

    aget-object v12, v8, v4

    sub-long v19, v17, v9

    move-object v11, v15

    move-wide v13, v9

    move-object v4, v15

    move-wide/from16 v15, v19

    invoke-direct/range {v11 .. v16}, Lcom/android/apksig/Hints$PatternWithRange;-><init>(Ljava/lang/String;JJ)V

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    nop

    .line 105
    .end local v6    # "rawLine":Ljava/lang/String;
    .end local v7    # "line":Ljava/lang/String;
    .end local v8    # "fields":[Ljava/lang/String;
    .end local v9    # "start":J
    .end local v17    # "end":J
    :goto_1
    add-int/lit8 v5, v5, 0x1

    const/4 v4, 0x0

    goto :goto_0

    .line 115
    .restart local v6    # "rawLine":Ljava/lang/String;
    .restart local v7    # "line":Ljava/lang/String;
    .restart local v8    # "fields":[Ljava/lang/String;
    :cond_1
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bad pin pattern line "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local v1    # "pinPatterns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/apksig/Hints$PatternWithRange;>;"
    .end local p0    # "patternBlob":[B
    throw v0
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    .line 120
    .end local v6    # "rawLine":Ljava/lang/String;
    .end local v7    # "line":Ljava/lang/String;
    .end local v8    # "fields":[Ljava/lang/String;
    .restart local v1    # "pinPatterns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/apksig/Hints$PatternWithRange;>;"
    .restart local p0    # "patternBlob":[B
    :cond_2
    nop

    .line 121
    return-object v1

    .line 118
    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    move-object/from16 v3, p0

    .line 119
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    :goto_2
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v4, "UTF-8 must be supported"

    invoke-direct {v2, v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
