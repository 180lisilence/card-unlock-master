.class public final Lcom/licenseinjector/app/core/ZipRewriter;
.super Ljava/lang/Object;
.source "ZipRewriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/licenseinjector/app/core/ZipRewriter$E;
    }
.end annotation


# static fields
.field private static final CD_SIG:J = 0x2014b50L

.field private static final EOCD_SIG:J = 0x6054b50L

.field private static final LFH_SIG:J = 0x4034b50L


# instance fields
.field private final added:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/licenseinjector/app/core/ZipRewriter$E;",
            ">;"
        }
    .end annotation
.end field

.field private final entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/licenseinjector/app/core/ZipRewriter$E;",
            ">;"
        }
    .end annotation
.end field

.field private final raf:Ljava/io/RandomAccessFile;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 2
    .param p1, "apk"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/licenseinjector/app/core/ZipRewriter;->entries:Ljava/util/List;

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/licenseinjector/app/core/ZipRewriter;->added:Ljava/util/List;

    .line 51
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "r"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/licenseinjector/app/core/ZipRewriter;->raf:Ljava/io/RandomAccessFile;

    .line 52
    invoke-direct {p0}, Lcom/licenseinjector/app/core/ZipRewriter;->parse()V

    .line 53
    return-void
.end method

.method private static crc32([B)I
    .locals 3
    .param p0, "data"    # [B

    .line 367
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 368
    .local v0, "c":Ljava/util/zip/CRC32;
    invoke-virtual {v0, p0}, Ljava/util/zip/CRC32;->update([B)V

    .line 369
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v1

    long-to-int v1, v1

    return v1
.end method

.method private static deflate([B)[B
    .locals 5
    .param p0, "data"    # [B

    .line 352
    new-instance v0, Ljava/util/zip/Deflater;

    const/4 v1, -0x1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/util/zip/Deflater;-><init>(IZ)V

    .line 354
    .local v0, "d":Ljava/util/zip/Deflater;
    :try_start_0
    invoke-virtual {v0, p0}, Ljava/util/zip/Deflater;->setInput([B)V

    .line 355
    invoke-virtual {v0}, Ljava/util/zip/Deflater;->finish()V

    .line 356
    array-length v1, p0

    add-int/lit16 v1, v1, 0x80

    new-array v1, v1, [B

    .line 357
    .local v1, "buf":[B
    invoke-virtual {v0, v1}, Ljava/util/zip/Deflater;->deflate([B)I

    move-result v2

    .line 358
    .local v2, "n":I
    new-array v3, v2, [B

    .line 359
    .local v3, "out":[B
    const/4 v4, 0x0

    invoke-static {v1, v4, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 360
    nop

    .line 362
    invoke-virtual {v0}, Ljava/util/zip/Deflater;->end()V

    .line 360
    return-object v3

    .line 362
    .end local v1    # "buf":[B
    .end local v2    # "n":I
    .end local v3    # "out":[B
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->end()V

    .line 363
    throw v1
.end method

.method private find(Ljava/lang/String;)Lcom/licenseinjector/app/core/ZipRewriter$E;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .line 119
    iget-object v0, p0, Lcom/licenseinjector/app/core/ZipRewriter;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/licenseinjector/app/core/ZipRewriter$E;

    .line 120
    .local v1, "e":Lcom/licenseinjector/app/core/ZipRewriter$E;
    iget-object v2, v1, Lcom/licenseinjector/app/core/ZipRewriter$E;->name:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 121
    return-object v1

    .line 123
    .end local v1    # "e":Lcom/licenseinjector/app/core/ZipRewriter$E;
    :cond_0
    goto :goto_0

    .line 124
    :cond_1
    iget-object v0, p0, Lcom/licenseinjector/app/core/ZipRewriter;->added:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/licenseinjector/app/core/ZipRewriter$E;

    .line 125
    .local v1, "e2":Lcom/licenseinjector/app/core/ZipRewriter$E;
    iget-object v2, v1, Lcom/licenseinjector/app/core/ZipRewriter$E;->name:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 126
    return-object v1

    .line 128
    .end local v1    # "e2":Lcom/licenseinjector/app/core/ZipRewriter$E;
    :cond_2
    goto :goto_1

    .line 129
    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method

.method private parse()V
    .locals 32
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 133
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/licenseinjector/app/core/ZipRewriter;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v1

    .line 134
    .local v1, "len":J
    const-wide/32 v3, 0x101d0

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v3, v3

    .line 135
    .local v3, "tail":I
    new-array v4, v3, [B

    .line 136
    .local v4, "buf":[B
    iget-object v5, v0, Lcom/licenseinjector/app/core/ZipRewriter;->raf:Ljava/io/RandomAccessFile;

    int-to-long v6, v3

    sub-long v6, v1, v6

    invoke-virtual {v5, v6, v7}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 137
    iget-object v5, v0, Lcom/licenseinjector/app/core/ZipRewriter;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v5, v4}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 138
    const/4 v5, -0x1

    .line 139
    .local v5, "eocd":I
    add-int/lit8 v6, v3, -0x16

    .local v6, "i":I
    :goto_0
    if-ltz v6, :cond_1

    .line 140
    invoke-static {v4, v6}, Lcom/licenseinjector/app/core/ZipRewriter;->u32([BI)J

    move-result-wide v7

    const-wide/32 v9, 0x6054b50

    cmp-long v7, v7, v9

    if-nez v7, :cond_0

    .line 141
    move v5, v6

    .line 142
    goto :goto_1

    .line 139
    :cond_0
    add-int/lit8 v6, v6, -0x1

    goto :goto_0

    .line 145
    .end local v6    # "i":I
    :cond_1
    :goto_1
    if-ltz v5, :cond_6

    .line 148
    add-int/lit8 v6, v5, 0xa

    invoke-static {v4, v6}, Lcom/licenseinjector/app/core/ZipRewriter;->u16([BI)I

    move-result v6

    .line 149
    .local v6, "total":I
    add-int/lit8 v7, v5, 0xc

    invoke-static {v4, v7}, Lcom/licenseinjector/app/core/ZipRewriter;->u32([BI)J

    move-result-wide v7

    .line 150
    .local v7, "cdSize":J
    add-int/lit8 v9, v5, 0x10

    invoke-static {v4, v9}, Lcom/licenseinjector/app/core/ZipRewriter;->u32([BI)J

    move-result-wide v9

    .line 151
    .local v9, "cdOff":J
    long-to-int v11, v7

    new-array v11, v11, [B

    .line 152
    .local v11, "cd":[B
    iget-object v12, v0, Lcom/licenseinjector/app/core/ZipRewriter;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v12, v9, v10}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 153
    iget-object v12, v0, Lcom/licenseinjector/app/core/ZipRewriter;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v12, v11}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 154
    const/4 v12, 0x0

    .line 155
    .local v12, "p":I
    const/4 v13, 0x0

    .line 156
    .local v13, "i2":I
    :goto_2
    if-ge v13, v6, :cond_5

    .line 157
    invoke-static {v11, v12}, Lcom/licenseinjector/app/core/ZipRewriter;->u32([BI)J

    move-result-wide v14

    const-wide/32 v16, 0x2014b50    # 1.6619997E-316

    cmp-long v14, v14, v16

    if-nez v14, :cond_4

    .line 160
    new-instance v14, Lcom/licenseinjector/app/core/ZipRewriter$E;

    const/4 v15, 0x0

    invoke-direct {v14, v15}, Lcom/licenseinjector/app/core/ZipRewriter$E;-><init>(Lcom/licenseinjector/app/core/ZipRewriter$1;)V

    .line 161
    .local v14, "e":Lcom/licenseinjector/app/core/ZipRewriter$E;
    add-int/lit8 v15, v12, 0x8

    invoke-static {v11, v15}, Lcom/licenseinjector/app/core/ZipRewriter;->u16([BI)I

    move-result v15

    iput v15, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->flags:I

    .line 162
    add-int/lit8 v15, v12, 0xa

    invoke-static {v11, v15}, Lcom/licenseinjector/app/core/ZipRewriter;->u16([BI)I

    move-result v15

    iput v15, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->method:I

    .line 163
    add-int/lit8 v15, v12, 0xc

    invoke-static {v11, v15}, Lcom/licenseinjector/app/core/ZipRewriter;->u16([BI)I

    move-result v15

    iput v15, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->time:I

    .line 164
    add-int/lit8 v15, v12, 0xe

    invoke-static {v11, v15}, Lcom/licenseinjector/app/core/ZipRewriter;->u16([BI)I

    move-result v15

    iput v15, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->date:I

    .line 165
    move-wide v15, v1

    .line 166
    .local v15, "len2":J
    move-wide/from16 v17, v1

    .end local v1    # "len":J
    .local v17, "len":J
    add-int/lit8 v1, v12, 0x10

    invoke-static {v11, v1}, Lcom/licenseinjector/app/core/ZipRewriter;->u32([BI)J

    move-result-wide v1

    long-to-int v1, v1

    iput v1, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->crc:I

    .line 167
    add-int/lit8 v1, v12, 0x14

    invoke-static {v11, v1}, Lcom/licenseinjector/app/core/ZipRewriter;->u32([BI)J

    move-result-wide v1

    iput-wide v1, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->compSize:J

    .line 168
    add-int/lit8 v1, v12, 0x18

    invoke-static {v11, v1}, Lcom/licenseinjector/app/core/ZipRewriter;->u32([BI)J

    move-result-wide v1

    iput-wide v1, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->uncompSize:J

    .line 169
    add-int/lit8 v1, v12, 0x1c

    invoke-static {v11, v1}, Lcom/licenseinjector/app/core/ZipRewriter;->u16([BI)I

    move-result v1

    .line 170
    .local v1, "nameLen":I
    add-int/lit8 v2, v12, 0x1e

    invoke-static {v11, v2}, Lcom/licenseinjector/app/core/ZipRewriter;->u16([BI)I

    move-result v2

    .line 171
    .local v2, "extraLen":I
    move-wide/from16 v19, v7

    .end local v7    # "cdSize":J
    .local v19, "cdSize":J
    add-int/lit8 v7, v12, 0x20

    invoke-static {v11, v7}, Lcom/licenseinjector/app/core/ZipRewriter;->u16([BI)I

    move-result v7

    .line 172
    .local v7, "commentLen":I
    move v8, v3

    .line 173
    .local v8, "tail2":I
    move-object/from16 v21, v4

    .line 174
    .local v21, "buf2":[B
    move/from16 v22, v3

    .end local v3    # "tail":I
    .local v22, "tail":I
    add-int/lit8 v3, v12, 0x2a

    move-object/from16 v23, v4

    .end local v4    # "buf":[B
    .local v23, "buf":[B
    invoke-static {v11, v3}, Lcom/licenseinjector/app/core/ZipRewriter;->u32([BI)J

    move-result-wide v3

    iput-wide v3, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->localOff:J

    .line 175
    new-array v3, v1, [B

    iput-object v3, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->nameBytes:[B

    .line 176
    move v3, v5

    .line 177
    .local v3, "eocd2":I
    add-int/lit8 v4, v12, 0x2e

    move/from16 v24, v5

    .end local v5    # "eocd":I
    .local v24, "eocd":I
    iget-object v5, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->nameBytes:[B

    move-wide/from16 v25, v9

    .end local v9    # "cdOff":J
    .local v25, "cdOff":J
    const/4 v9, 0x0

    invoke-static {v11, v4, v5, v9, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 178
    new-instance v4, Ljava/lang/String;

    iget-object v5, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->nameBytes:[B

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    iput-object v4, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->name:Ljava/lang/String;

    .line 179
    new-array v4, v2, [B

    iput-object v4, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->centralExtra:[B

    .line 180
    add-int/lit8 v4, v12, 0x2e

    add-int/2addr v4, v1

    iget-object v5, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->centralExtra:[B

    invoke-static {v11, v4, v5, v9, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 181
    new-array v4, v7, [B

    iput-object v4, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->comment:[B

    .line 182
    add-int/lit8 v4, v12, 0x2e

    add-int/2addr v4, v1

    add-int/2addr v4, v2

    iget-object v5, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->comment:[B

    invoke-static {v11, v4, v5, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 183
    add-int/lit8 v4, v1, 0x2e

    add-int/2addr v4, v2

    add-int/2addr v4, v7

    add-int/2addr v12, v4

    .line 184
    const/16 v4, 0x1e

    new-array v4, v4, [B

    .line 185
    .local v4, "lh":[B
    move v5, v6

    .line 186
    .local v5, "total2":I
    iget-object v10, v0, Lcom/licenseinjector/app/core/ZipRewriter;->raf:Ljava/io/RandomAccessFile;

    move/from16 v27, v1

    move/from16 v28, v2

    .end local v1    # "nameLen":I
    .end local v2    # "extraLen":I
    .local v27, "nameLen":I
    .local v28, "extraLen":I
    iget-wide v1, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->localOff:J

    invoke-virtual {v10, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 187
    iget-object v1, v0, Lcom/licenseinjector/app/core/ZipRewriter;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v1, v4}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 188
    invoke-static {v4, v9}, Lcom/licenseinjector/app/core/ZipRewriter;->u32([BI)J

    move-result-wide v1

    const-wide/32 v9, 0x4034b50

    cmp-long v1, v1, v9

    if-nez v1, :cond_3

    .line 191
    const/16 v1, 0x1a

    invoke-static {v4, v1}, Lcom/licenseinjector/app/core/ZipRewriter;->u16([BI)I

    move-result v1

    .line 192
    .local v1, "lNameLen":I
    const/16 v2, 0x1c

    invoke-static {v4, v2}, Lcom/licenseinjector/app/core/ZipRewriter;->u16([BI)I

    move-result v2

    iput v2, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->localExtraLen:I

    .line 193
    iget-wide v9, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->localOff:J

    const-wide/16 v29, 0x1e

    add-long v9, v9, v29

    move v2, v6

    move/from16 v31, v7

    .end local v6    # "total":I
    .end local v7    # "commentLen":I
    .local v2, "total":I
    .local v31, "commentLen":I
    int-to-long v6, v1

    add-long/2addr v9, v6

    iget v6, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->localExtraLen:I

    int-to-long v6, v6

    add-long/2addr v9, v6

    iput-wide v9, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->dataOff:J

    .line 194
    iget v6, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->localExtraLen:I

    new-array v6, v6, [B

    iput-object v6, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->localExtra:[B

    .line 195
    iget v6, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->localExtraLen:I

    if-lez v6, :cond_2

    .line 196
    iget-object v6, v0, Lcom/licenseinjector/app/core/ZipRewriter;->raf:Ljava/io/RandomAccessFile;

    iget-wide v9, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->localOff:J

    add-long v9, v9, v29

    move-object v7, v11

    move/from16 v29, v12

    .end local v11    # "cd":[B
    .end local v12    # "p":I
    .local v7, "cd":[B
    .local v29, "p":I
    int-to-long v11, v1

    add-long/2addr v9, v11

    invoke-virtual {v6, v9, v10}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 197
    iget-object v6, v0, Lcom/licenseinjector/app/core/ZipRewriter;->raf:Ljava/io/RandomAccessFile;

    iget-object v9, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->localExtra:[B

    invoke-virtual {v6, v9}, Ljava/io/RandomAccessFile;->readFully([B)V

    goto :goto_3

    .line 195
    .end local v7    # "cd":[B
    .end local v29    # "p":I
    .restart local v11    # "cd":[B
    .restart local v12    # "p":I
    :cond_2
    move-object v7, v11

    move/from16 v29, v12

    .line 199
    .end local v11    # "cd":[B
    .end local v12    # "p":I
    .restart local v7    # "cd":[B
    .restart local v29    # "p":I
    :goto_3
    iget-object v6, v0, Lcom/licenseinjector/app/core/ZipRewriter;->entries:Ljava/util/List;

    invoke-interface {v6, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 200
    add-int/lit8 v13, v13, 0x1

    .line 201
    move-wide v9, v15

    .line 202
    .end local v17    # "len":J
    .local v9, "len":J
    move v6, v8

    .line 203
    .end local v22    # "tail":I
    .local v6, "tail":I
    move-object/from16 v11, v21

    .line 204
    .end local v23    # "buf":[B
    .local v11, "buf":[B
    move v12, v3

    .line 205
    .end local v24    # "eocd":I
    .local v12, "eocd":I
    move v1, v5

    .line 206
    .end local v2    # "total":I
    .end local v3    # "eocd2":I
    .end local v4    # "lh":[B
    .end local v5    # "total2":I
    .end local v8    # "tail2":I
    .end local v14    # "e":Lcom/licenseinjector/app/core/ZipRewriter$E;
    .end local v15    # "len2":J
    .end local v21    # "buf2":[B
    .end local v27    # "nameLen":I
    .end local v28    # "extraLen":I
    .end local v31    # "commentLen":I
    .local v1, "total":I
    move v3, v6

    move-object v4, v11

    move v5, v12

    move/from16 v12, v29

    move v6, v1

    move-object v11, v7

    move-wide v1, v9

    move-wide/from16 v7, v19

    move-wide/from16 v9, v25

    goto/16 :goto_2

    .line 189
    .end local v1    # "total":I
    .end local v9    # "len":J
    .end local v29    # "p":I
    .restart local v3    # "eocd2":I
    .restart local v4    # "lh":[B
    .restart local v5    # "total2":I
    .local v6, "total":I
    .local v7, "commentLen":I
    .restart local v8    # "tail2":I
    .local v11, "cd":[B
    .local v12, "p":I
    .restart local v14    # "e":Lcom/licenseinjector/app/core/ZipRewriter$E;
    .restart local v15    # "len2":J
    .restart local v17    # "len":J
    .restart local v21    # "buf2":[B
    .restart local v22    # "tail":I
    .restart local v23    # "buf":[B
    .restart local v24    # "eocd":I
    .restart local v27    # "nameLen":I
    .restart local v28    # "extraLen":I
    :cond_3
    move v2, v6

    .end local v6    # "total":I
    .restart local v2    # "total":I
    new-instance v1, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u672c\u5730\u6587\u4ef6\u5934\u635f\u574f: "

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v9, v14, Lcom/licenseinjector/app/core/ZipRewriter$E;->name:Ljava/lang/String;

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 158
    .end local v2    # "total":I
    .end local v8    # "tail2":I
    .end local v14    # "e":Lcom/licenseinjector/app/core/ZipRewriter$E;
    .end local v15    # "len2":J
    .end local v17    # "len":J
    .end local v19    # "cdSize":J
    .end local v21    # "buf2":[B
    .end local v22    # "tail":I
    .end local v23    # "buf":[B
    .end local v24    # "eocd":I
    .end local v25    # "cdOff":J
    .end local v27    # "nameLen":I
    .end local v28    # "extraLen":I
    .local v1, "len":J
    .local v3, "tail":I
    .local v4, "buf":[B
    .local v5, "eocd":I
    .restart local v6    # "total":I
    .local v7, "cdSize":J
    .local v9, "cdOff":J
    :cond_4
    move-wide/from16 v17, v1

    move/from16 v22, v3

    move-object/from16 v23, v4

    .end local v1    # "len":J
    .end local v3    # "tail":I
    .end local v4    # "buf":[B
    .restart local v17    # "len":J
    .restart local v22    # "tail":I
    .restart local v23    # "buf":[B
    new-instance v1, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u4e2d\u592e\u76ee\u5f55\u635f\u574f @"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 207
    .end local v17    # "len":J
    .end local v22    # "tail":I
    .end local v23    # "buf":[B
    .restart local v1    # "len":J
    .restart local v3    # "tail":I
    .restart local v4    # "buf":[B
    :cond_5
    return-void

    .line 146
    .end local v6    # "total":I
    .end local v7    # "cdSize":J
    .end local v9    # "cdOff":J
    .end local v11    # "cd":[B
    .end local v12    # "p":I
    .end local v13    # "i2":I
    :cond_6
    new-instance v6, Ljava/io/IOException;

    const-string v7, "\u4e0d\u662f\u6709\u6548\u7684 ZIP\uff1a\u672a\u627e\u5230 EOCD"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method private static putU16([BII)V
    .locals 2
    .param p0, "b"    # [B
    .param p1, "o"    # I
    .param p2, "v"    # I

    .line 381
    and-int/lit16 v0, p2, 0xff

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 382
    add-int/lit8 v0, p1, 0x1

    shr-int/lit8 v1, p2, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 383
    return-void
.end method

.method private static putU32([BIJ)V
    .locals 5
    .param p0, "b"    # [B
    .param p1, "o"    # I
    .param p2, "v"    # J

    .line 386
    const-wide/16 v0, 0xff

    and-long v2, p2, v0

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, p0, p1

    .line 387
    add-int/lit8 v2, p1, 0x1

    const/16 v3, 0x8

    shr-long v3, p2, v3

    and-long/2addr v3, v0

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, p0, v2

    .line 388
    add-int/lit8 v2, p1, 0x2

    const/16 v3, 0x10

    shr-long v3, p2, v3

    and-long/2addr v3, v0

    long-to-int v3, v3

    int-to-byte v3, v3

    aput-byte v3, p0, v2

    .line 389
    add-int/lit8 v2, p1, 0x3

    const/16 v3, 0x18

    shr-long v3, p2, v3

    and-long/2addr v0, v3

    long-to-int v0, v0

    int-to-byte v0, v0

    aput-byte v0, p0, v2

    .line 390
    return-void
.end method

.method private static u16([BI)I
    .locals 2
    .param p0, "b"    # [B
    .param p1, "o"    # I

    .line 373
    aget-byte v0, p0, p1

    and-int/lit16 v0, v0, 0xff

    add-int/lit8 v1, p1, 0x1

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    return v0
.end method

.method private static u32([BI)J
    .locals 7
    .param p0, "b"    # [B
    .param p1, "o"    # I

    .line 377
    aget-byte v0, p0, p1

    int-to-long v0, v0

    const-wide/16 v2, 0xff

    and-long/2addr v0, v2

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x8

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x2

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v4, v2

    const/16 v6, 0x10

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    add-int/lit8 v4, p1, 0x3

    aget-byte v4, p0, v4

    int-to-long v4, v4

    and-long/2addr v2, v4

    const/16 v4, 0x18

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method private writeCentral(Ljava/io/BufferedOutputStream;Lcom/licenseinjector/app/core/ZipRewriter$E;J)J
    .locals 6
    .param p1, "bos"    # Ljava/io/BufferedOutputStream;
    .param p2, "e"    # Lcom/licenseinjector/app/core/ZipRewriter$E;
    .param p3, "offset"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 313
    const/16 v0, 0x2e

    new-array v0, v0, [B

    .line 314
    .local v0, "rec":[B
    const-wide/32 v1, 0x2014b50    # 1.6619997E-316

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v2}, Lcom/licenseinjector/app/core/ZipRewriter;->putU32([BIJ)V

    .line 315
    const/4 v1, 0x4

    const/16 v2, 0x14

    invoke-static {v0, v1, v2}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 316
    const/4 v1, 0x6

    invoke-static {v0, v1, v2}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 317
    const/16 v1, 0x8

    iget v4, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->flags:I

    invoke-static {v0, v1, v4}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 318
    const/16 v1, 0xa

    iget v4, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->method:I

    invoke-static {v0, v1, v4}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 319
    const/16 v1, 0xc

    iget v4, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->time:I

    invoke-static {v0, v1, v4}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 320
    const/16 v1, 0xe

    iget v4, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->date:I

    invoke-static {v0, v1, v4}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 321
    iget v1, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->crc:I

    int-to-long v4, v1

    const/16 v1, 0x10

    invoke-static {v0, v1, v4, v5}, Lcom/licenseinjector/app/core/ZipRewriter;->putU32([BIJ)V

    .line 322
    iget-wide v4, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->compSize:J

    long-to-int v1, v4

    int-to-long v4, v1

    invoke-static {v0, v2, v4, v5}, Lcom/licenseinjector/app/core/ZipRewriter;->putU32([BIJ)V

    .line 323
    iget-wide v1, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->uncompSize:J

    long-to-int v1, v1

    int-to-long v1, v1

    const/16 v4, 0x18

    invoke-static {v0, v4, v1, v2}, Lcom/licenseinjector/app/core/ZipRewriter;->putU32([BIJ)V

    .line 324
    iget-object v1, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->nameBytes:[B

    array-length v1, v1

    const/16 v2, 0x1c

    invoke-static {v0, v2, v1}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 325
    iget-object v1, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->centralExtra:[B

    array-length v1, v1

    const/16 v2, 0x1e

    invoke-static {v0, v2, v1}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 326
    iget-object v1, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->comment:[B

    array-length v1, v1

    const/16 v2, 0x20

    invoke-static {v0, v2, v1}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 327
    const/16 v1, 0x22

    invoke-static {v0, v1, v3}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 328
    const/16 v1, 0x24

    invoke-static {v0, v1, v3}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 329
    const/16 v1, 0x26

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/licenseinjector/app/core/ZipRewriter;->putU32([BIJ)V

    .line 330
    iget-wide v1, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->localOff:J

    long-to-int v1, v1

    int-to-long v1, v1

    const/16 v3, 0x2a

    invoke-static {v0, v3, v1, v2}, Lcom/licenseinjector/app/core/ZipRewriter;->putU32([BIJ)V

    .line 331
    invoke-virtual {p1, v0}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 332
    iget-object v1, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->nameBytes:[B

    invoke-virtual {p1, v1}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 333
    iget-object v1, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->centralExtra:[B

    invoke-virtual {p1, v1}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 334
    iget-object v1, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->comment:[B

    invoke-virtual {p1, v1}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 335
    const-wide/16 v1, 0x2e

    add-long/2addr v1, p3

    iget-object v3, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->nameBytes:[B

    array-length v3, v3

    int-to-long v3, v3

    add-long/2addr v1, v3

    iget-object v3, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->centralExtra:[B

    array-length v3, v3

    int-to-long v3, v3

    add-long/2addr v1, v3

    iget-object v3, p2, Lcom/licenseinjector/app/core/ZipRewriter$E;->comment:[B

    array-length v3, v3

    int-to-long v3, v3

    add-long/2addr v1, v3

    return-wide v1
.end method

.method private writeEnd(Ljava/io/BufferedOutputStream;IJJ)V
    .locals 5
    .param p1, "bos"    # Ljava/io/BufferedOutputStream;
    .param p2, "count"    # I
    .param p3, "cdSize"    # J
    .param p5, "cdOff"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 339
    const/16 v0, 0x16

    new-array v0, v0, [B

    .line 340
    .local v0, "e":[B
    const-wide/32 v1, 0x6054b50

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v2}, Lcom/licenseinjector/app/core/ZipRewriter;->putU32([BIJ)V

    .line 341
    const/4 v1, 0x4

    invoke-static {v0, v1, v3}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 342
    const/4 v1, 0x6

    invoke-static {v0, v1, v3}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 343
    const/16 v1, 0x8

    invoke-static {v0, v1, p2}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 344
    const/16 v1, 0xa

    invoke-static {v0, v1, p2}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 345
    long-to-int v1, p3

    int-to-long v1, v1

    const/16 v4, 0xc

    invoke-static {v0, v4, v1, v2}, Lcom/licenseinjector/app/core/ZipRewriter;->putU32([BIJ)V

    .line 346
    long-to-int v1, p5

    int-to-long v1, v1

    const/16 v4, 0x10

    invoke-static {v0, v4, v1, v2}, Lcom/licenseinjector/app/core/ZipRewriter;->putU32([BIJ)V

    .line 347
    const/16 v1, 0x14

    invoke-static {v0, v1, v3}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 348
    invoke-virtual {p1, v0}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 349
    return-void
.end method

.method private writeEntry(Ljava/io/BufferedOutputStream;Lcom/licenseinjector/app/core/ZipRewriter$E;JLjava/util/List;)J
    .locals 22
    .param p1, "bos"    # Ljava/io/BufferedOutputStream;
    .param p2, "e"    # Lcom/licenseinjector/app/core/ZipRewriter$E;
    .param p3, "offset"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/BufferedOutputStream;",
            "Lcom/licenseinjector/app/core/ZipRewriter$E;",
            "J",
            "Ljava/util/List<",
            "Lcom/licenseinjector/app/core/ZipRewriter$E;",
            ">;)J"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 244
    .local p5, "written":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/ZipRewriter$E;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-wide/from16 v3, p3

    iget-object v5, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->replace:[B

    if-eqz v5, :cond_0

    .line 245
    iget-object v5, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->replace:[B

    .line 246
    .local v5, "data":[B
    const/16 v6, 0x8

    .line 247
    .local v6, "method":I
    array-length v7, v5

    int-to-long v7, v7

    .line 248
    .local v7, "compSize":J
    iget-wide v9, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->replaceUncomp:J

    .line 249
    .local v9, "uncompSize":J
    iget v11, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->replaceCrc:I

    .local v11, "crc":I
    goto :goto_0

    .line 251
    .end local v5    # "data":[B
    .end local v6    # "method":I
    .end local v7    # "compSize":J
    .end local v9    # "uncompSize":J
    .end local v11    # "crc":I
    :cond_0
    iget-wide v5, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->compSize:J

    long-to-int v5, v5

    new-array v5, v5, [B

    .line 252
    .restart local v5    # "data":[B
    iget-object v6, v0, Lcom/licenseinjector/app/core/ZipRewriter;->raf:Ljava/io/RandomAccessFile;

    iget-wide v7, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->dataOff:J

    invoke-virtual {v6, v7, v8}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 253
    iget-object v6, v0, Lcom/licenseinjector/app/core/ZipRewriter;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v6, v5}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 254
    iget v6, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->method:I

    .line 255
    .restart local v6    # "method":I
    iget-wide v7, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->compSize:J

    .line 256
    .restart local v7    # "compSize":J
    iget-wide v9, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->uncompSize:J

    .line 257
    .restart local v9    # "uncompSize":J
    iget v11, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->crc:I

    .line 259
    .restart local v11    # "crc":I
    :goto_0
    const/4 v12, 0x0

    .line 260
    .local v12, "extraLen":I
    const/4 v13, 0x0

    .line 261
    .local v13, "pad":[B
    if-nez v6, :cond_4

    .line 262
    iget-object v15, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->name:Ljava/lang/String;

    const-string v14, ".so"

    invoke-virtual {v15, v14}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_1

    const/16 v14, 0x4000

    goto :goto_1

    :cond_1
    const/4 v14, 0x4

    .line 263
    .local v14, "align":I
    :goto_1
    const-wide/16 v15, 0x1e

    add-long v18, v3, v15

    iget-object v15, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->nameBytes:[B

    array-length v15, v15

    move/from16 v20, v12

    move-object/from16 v21, v13

    .end local v12    # "extraLen":I
    .end local v13    # "pad":[B
    .local v20, "extraLen":I
    .local v21, "pad":[B
    int-to-long v12, v15

    add-long v18, v18, v12

    const-wide/16 v12, 0x0

    add-long v18, v18, v12

    .line 264
    .local v18, "cur":J
    int-to-long v12, v14

    int-to-long v3, v14

    rem-long v3, v18, v3

    sub-long/2addr v12, v3

    int-to-long v3, v14

    rem-long/2addr v12, v3

    int-to-long v3, v14

    add-long/2addr v12, v3

    int-to-long v3, v14

    rem-long/2addr v12, v3

    long-to-int v3, v12

    .line 265
    .local v3, "need":I
    if-nez v3, :cond_2

    .line 266
    const/4 v4, 0x0

    .local v4, "p":I
    goto :goto_2

    .line 268
    .end local v4    # "p":I
    :cond_2
    const/4 v4, 0x4

    if-lt v3, v4, :cond_3

    move v4, v3

    goto :goto_2

    :cond_3
    add-int v4, v3, v14

    .line 270
    .restart local v4    # "p":I
    :goto_2
    if-lez v4, :cond_5

    .line 271
    new-array v13, v4, [B

    .line 272
    .end local v21    # "pad":[B
    .restart local v13    # "pad":[B
    const/16 v12, 0x35

    const/4 v15, 0x0

    aput-byte v12, v13, v15

    .line 273
    const/4 v12, 0x1

    const/16 v15, -0x27

    aput-byte v15, v13, v12

    .line 274
    add-int/lit8 v12, v4, -0x4

    .line 275
    .local v12, "sz":I
    and-int/lit16 v15, v12, 0xff

    int-to-byte v15, v15

    const/16 v21, 0x2

    aput-byte v15, v13, v21

    .line 276
    shr-int/lit8 v15, v12, 0x8

    and-int/lit16 v15, v15, 0xff

    int-to-byte v15, v15

    const/16 v21, 0x3

    aput-byte v15, v13, v21

    .line 277
    add-int/lit8 v15, v4, 0x0

    move v12, v15

    .end local v20    # "extraLen":I
    .local v15, "extraLen":I
    goto :goto_3

    .line 261
    .end local v3    # "need":I
    .end local v4    # "p":I
    .end local v14    # "align":I
    .end local v15    # "extraLen":I
    .end local v18    # "cur":J
    .local v12, "extraLen":I
    :cond_4
    move/from16 v20, v12

    move-object/from16 v21, v13

    .line 280
    .end local v12    # "extraLen":I
    .end local v13    # "pad":[B
    .restart local v20    # "extraLen":I
    .restart local v21    # "pad":[B
    :cond_5
    move/from16 v12, v20

    move-object/from16 v13, v21

    .end local v20    # "extraLen":I
    .end local v21    # "pad":[B
    .restart local v12    # "extraLen":I
    .restart local v13    # "pad":[B
    :goto_3
    iget-object v3, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->replace:[B

    if-eqz v3, :cond_6

    const/4 v15, 0x0

    goto :goto_4

    :cond_6
    iget v3, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->flags:I

    and-int/lit8 v15, v3, -0x9

    :goto_4
    move v3, v15

    .line 281
    .local v3, "flags":I
    const/16 v4, 0x1e

    new-array v4, v4, [B

    .line 282
    .local v4, "lh":[B
    const-wide/32 v14, 0x4034b50

    const/4 v0, 0x0

    invoke-static {v4, v0, v14, v15}, Lcom/licenseinjector/app/core/ZipRewriter;->putU32([BIJ)V

    .line 283
    const/16 v0, 0x14

    const/4 v14, 0x4

    invoke-static {v4, v14, v0}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 284
    const/4 v0, 0x6

    invoke-static {v4, v0, v3}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 285
    const/16 v0, 0x8

    invoke-static {v4, v0, v6}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 286
    const/16 v0, 0xa

    iget v14, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->time:I

    invoke-static {v4, v0, v14}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 287
    const/16 v0, 0xc

    iget v14, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->date:I

    invoke-static {v4, v0, v14}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 288
    const/16 v0, 0xe

    int-to-long v14, v11

    invoke-static {v4, v0, v14, v15}, Lcom/licenseinjector/app/core/ZipRewriter;->putU32([BIJ)V

    .line 289
    long-to-int v0, v7

    int-to-long v14, v0

    const/16 v0, 0x12

    invoke-static {v4, v0, v14, v15}, Lcom/licenseinjector/app/core/ZipRewriter;->putU32([BIJ)V

    .line 290
    long-to-int v0, v9

    int-to-long v14, v0

    const/16 v0, 0x16

    invoke-static {v4, v0, v14, v15}, Lcom/licenseinjector/app/core/ZipRewriter;->putU32([BIJ)V

    .line 291
    iget-object v0, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->nameBytes:[B

    array-length v0, v0

    const/16 v14, 0x1a

    invoke-static {v4, v14, v0}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 292
    const/16 v0, 0x1c

    invoke-static {v4, v0, v12}, Lcom/licenseinjector/app/core/ZipRewriter;->putU16([BII)V

    .line 293
    invoke-virtual {v1, v4}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 294
    iget-object v0, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->nameBytes:[B

    invoke-virtual {v1, v0}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 295
    if-eqz v13, :cond_7

    .line 296
    invoke-virtual {v1, v13}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 298
    :cond_7
    invoke-virtual {v1, v5}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 299
    move-wide/from16 v14, p3

    iput-wide v14, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->localOff:J

    .line 300
    iput v3, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->flags:I

    .line 301
    iput v6, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->method:I

    .line 302
    iput v11, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->crc:I

    .line 303
    iput-wide v7, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->compSize:J

    .line 304
    iput-wide v9, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->uncompSize:J

    .line 305
    move-object/from16 v0, p5

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 306
    const-string v17, "ZIP_DEBUG"

    invoke-static/range {v17 .. v17}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    if-eqz v17, :cond_8

    .line 307
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v17, v3

    .end local v3    # "flags":I
    .local v17, "flags":I
    const-string v3, "[zip] "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->name:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " m="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " cs="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " us="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " extraLen="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " off="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_5

    .line 306
    .end local v17    # "flags":I
    .restart local v3    # "flags":I
    :cond_8
    move/from16 v17, v3

    .line 309
    .end local v3    # "flags":I
    .restart local v17    # "flags":I
    :goto_5
    const-wide/16 v0, 0x1e

    add-long/2addr v0, v14

    iget-object v3, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->nameBytes:[B

    array-length v3, v3

    int-to-long v2, v3

    add-long/2addr v0, v2

    int-to-long v2, v12

    add-long/2addr v0, v2

    array-length v2, v5

    int-to-long v2, v2

    add-long/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method public add(Ljava/lang/String;[B)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "data"    # [B

    .line 84
    invoke-direct {p0, p1}, Lcom/licenseinjector/app/core/ZipRewriter;->find(Ljava/lang/String;)Lcom/licenseinjector/app/core/ZipRewriter$E;

    move-result-object v0

    .line 85
    .local v0, "exist":Lcom/licenseinjector/app/core/ZipRewriter$E;
    if-eqz v0, :cond_0

    .line 86
    invoke-static {p2}, Lcom/licenseinjector/app/core/ZipRewriter;->deflate([B)[B

    move-result-object v1

    iput-object v1, v0, Lcom/licenseinjector/app/core/ZipRewriter$E;->replace:[B

    .line 87
    return-void

    .line 89
    :cond_0
    new-instance v1, Lcom/licenseinjector/app/core/ZipRewriter$E;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/licenseinjector/app/core/ZipRewriter$E;-><init>(Lcom/licenseinjector/app/core/ZipRewriter$1;)V

    .line 90
    .local v1, "e":Lcom/licenseinjector/app/core/ZipRewriter$E;
    iput-object p1, v1, Lcom/licenseinjector/app/core/ZipRewriter$E;->name:Ljava/lang/String;

    .line 91
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    iput-object v2, v1, Lcom/licenseinjector/app/core/ZipRewriter$E;->nameBytes:[B

    .line 92
    const/16 v2, 0x8

    iput v2, v1, Lcom/licenseinjector/app/core/ZipRewriter$E;->method:I

    .line 93
    const/16 v2, 0x21

    iput v2, v1, Lcom/licenseinjector/app/core/ZipRewriter$E;->date:I

    .line 94
    array-length v2, p2

    int-to-long v2, v2

    iput-wide v2, v1, Lcom/licenseinjector/app/core/ZipRewriter$E;->uncompSize:J

    .line 95
    invoke-static {p2}, Lcom/licenseinjector/app/core/ZipRewriter;->deflate([B)[B

    move-result-object v2

    iput-object v2, v1, Lcom/licenseinjector/app/core/ZipRewriter$E;->replace:[B

    .line 96
    invoke-static {p2}, Lcom/licenseinjector/app/core/ZipRewriter;->crc32([B)I

    move-result v2

    iput v2, v1, Lcom/licenseinjector/app/core/ZipRewriter$E;->replaceCrc:I

    .line 97
    array-length v2, p2

    int-to-long v2, v2

    iput-wide v2, v1, Lcom/licenseinjector/app/core/ZipRewriter$E;->replaceUncomp:J

    .line 98
    iget-object v2, p0, Lcom/licenseinjector/app/core/ZipRewriter;->added:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    return-void
.end method

.method public close()V
    .locals 1

    .line 57
    :try_start_0
    iget-object v0, p0, Lcom/licenseinjector/app/core/ZipRewriter;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    goto :goto_0

    .line 58
    :catchall_0
    move-exception v0

    .line 60
    :goto_0
    return-void
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 71
    invoke-direct {p0, p1}, Lcom/licenseinjector/app/core/ZipRewriter;->find(Ljava/lang/String;)Lcom/licenseinjector/app/core/ZipRewriter$E;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public names()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 63
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .local v0, "r":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/licenseinjector/app/core/ZipRewriter;->entries:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/licenseinjector/app/core/ZipRewriter$E;

    .line 65
    .local v2, "e":Lcom/licenseinjector/app/core/ZipRewriter$E;
    iget-object v3, v2, Lcom/licenseinjector/app/core/ZipRewriter$E;->name:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .end local v2    # "e":Lcom/licenseinjector/app/core/ZipRewriter$E;
    goto :goto_0

    .line 67
    :cond_0
    return-object v0
.end method

.method public remove(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 102
    invoke-direct {p0, p1}, Lcom/licenseinjector/app/core/ZipRewriter;->find(Ljava/lang/String;)Lcom/licenseinjector/app/core/ZipRewriter$E;

    move-result-object v0

    .line 103
    .local v0, "e":Lcom/licenseinjector/app/core/ZipRewriter$E;
    if-eqz v0, :cond_0

    .line 104
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/licenseinjector/app/core/ZipRewriter$E;->remove:Z

    .line 106
    :cond_0
    return-void
.end method

.method public removeOldSignatures()V
    .locals 10

    .line 109
    iget-object v0, p0, Lcom/licenseinjector/app/core/ZipRewriter;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/licenseinjector/app/core/ZipRewriter$E;

    .line 110
    .local v1, "e":Lcom/licenseinjector/app/core/ZipRewriter$E;
    iget-object v8, v1, Lcom/licenseinjector/app/core/ZipRewriter$E;->name:Ljava/lang/String;

    .line 111
    .local v8, "n":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v9

    .line 112
    .local v9, "u":Ljava/lang/String;
    const-string v2, "META-INF/MANIFEST.MF"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const-string v5, "META-INF/"

    const/4 v6, 0x0

    const/16 v7, 0x9

    move-object v2, v8

    invoke-virtual/range {v2 .. v7}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, ".SF"

    invoke-virtual {v9, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, ".RSA"

    invoke-virtual {v9, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, ".DSA"

    invoke-virtual {v9, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, ".EC"

    invoke-virtual {v9, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 113
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/licenseinjector/app/core/ZipRewriter$E;->remove:Z

    .line 115
    .end local v1    # "e":Lcom/licenseinjector/app/core/ZipRewriter$E;
    .end local v8    # "n":Ljava/lang/String;
    .end local v9    # "u":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 116
    :cond_2
    return-void
.end method

.method public replace(Ljava/lang/String;[B)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "data"    # [B

    .line 75
    invoke-direct {p0, p1}, Lcom/licenseinjector/app/core/ZipRewriter;->find(Ljava/lang/String;)Lcom/licenseinjector/app/core/ZipRewriter$E;

    move-result-object v0

    .line 76
    .local v0, "e":Lcom/licenseinjector/app/core/ZipRewriter$E;
    if-eqz v0, :cond_0

    .line 77
    invoke-static {p2}, Lcom/licenseinjector/app/core/ZipRewriter;->deflate([B)[B

    move-result-object v1

    iput-object v1, v0, Lcom/licenseinjector/app/core/ZipRewriter$E;->replace:[B

    .line 78
    invoke-static {p2}, Lcom/licenseinjector/app/core/ZipRewriter;->crc32([B)I

    move-result v1

    iput v1, v0, Lcom/licenseinjector/app/core/ZipRewriter$E;->replaceCrc:I

    .line 79
    array-length v1, p2

    int-to-long v1, v1

    iput-wide v1, v0, Lcom/licenseinjector/app/core/ZipRewriter$E;->replaceUncomp:J

    .line 81
    :cond_0
    return-void
.end method

.method public writeTo(Ljava/io/File;)V
    .locals 20
    .param p1, "out"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 210
    move-object/from16 v14, p0

    move-object/from16 v15, p1

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 211
    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u65e0\u6cd5\u5220\u9664\u5df2\u5b58\u5728\u7684\u8f93\u51fa\u6587\u4ef6: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 213
    :cond_1
    :goto_0
    new-instance v0, Ljava/io/BufferedOutputStream;

    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v15}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const/high16 v2, 0x10000

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    move-object v13, v0

    .line 214
    .local v13, "bos":Ljava/io/BufferedOutputStream;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 216
    .local v6, "written":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/ZipRewriter$E;>;"
    const-wide/16 v0, 0x0

    .line 217
    .local v0, "offset":J
    :try_start_0
    iget-object v2, v14, Lcom/licenseinjector/app/core/ZipRewriter;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move-wide v8, v0

    .end local v0    # "offset":J
    .local v8, "offset":J
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v0, :cond_3

    :try_start_1
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/licenseinjector/app/core/ZipRewriter$E;

    .line 218
    .local v0, "e":Lcom/licenseinjector/app/core/ZipRewriter$E;
    iget-boolean v1, v0, Lcom/licenseinjector/app/core/ZipRewriter$E;->remove:Z

    if-nez v1, :cond_2

    .line 219
    move-object/from16 v1, p0

    move-object v2, v13

    move-object v3, v0

    move-wide v4, v8

    invoke-direct/range {v1 .. v6}, Lcom/licenseinjector/app/core/ZipRewriter;->writeEntry(Ljava/io/BufferedOutputStream;Lcom/licenseinjector/app/core/ZipRewriter$E;JLjava/util/List;)J

    move-result-wide v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-wide v8, v1

    .line 221
    .end local v0    # "e":Lcom/licenseinjector/app/core/ZipRewriter$E;
    :cond_2
    goto :goto_1

    .line 232
    .end local v8    # "offset":J
    :catchall_0
    move-exception v0

    move-object v5, v13

    goto :goto_4

    .line 222
    .restart local v8    # "offset":J
    :cond_3
    :try_start_2
    iget-object v0, v14, Lcom/licenseinjector/app/core/ZipRewriter;->added:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move-wide v1, v8

    .end local v8    # "offset":J
    .local v1, "offset":J
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz v3, :cond_4

    :try_start_3
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Lcom/licenseinjector/app/core/ZipRewriter$E;

    .line 223
    .local v9, "e2":Lcom/licenseinjector/app/core/ZipRewriter$E;
    move-object/from16 v7, p0

    move-object v8, v13

    move-wide v10, v1

    move-object v12, v6

    invoke-direct/range {v7 .. v12}, Lcom/licenseinjector/app/core/ZipRewriter;->writeEntry(Ljava/io/BufferedOutputStream;Lcom/licenseinjector/app/core/ZipRewriter$E;JLjava/util/List;)J

    move-result-wide v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-wide v1, v3

    .line 224
    .end local v9    # "e2":Lcom/licenseinjector/app/core/ZipRewriter$E;
    goto :goto_2

    .line 225
    :cond_4
    move-wide v3, v1

    .line 226
    .local v3, "cdStart":J
    move-wide v7, v1

    .line 227
    .local v7, "cdEnd":J
    :try_start_4
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move-wide v10, v7

    .end local v7    # "cdEnd":J
    .local v10, "cdEnd":J
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    if-eqz v5, :cond_5

    :try_start_5
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/licenseinjector/app/core/ZipRewriter$E;

    .line 228
    .local v5, "e3":Lcom/licenseinjector/app/core/ZipRewriter$E;
    invoke-direct {v14, v13, v5, v10, v11}, Lcom/licenseinjector/app/core/ZipRewriter;->writeCentral(Ljava/io/BufferedOutputStream;Lcom/licenseinjector/app/core/ZipRewriter$E;J)J

    move-result-wide v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-wide v10, v7

    .line 229
    .end local v5    # "e3":Lcom/licenseinjector/app/core/ZipRewriter$E;
    goto :goto_3

    .line 230
    :cond_5
    :try_start_6
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    sub-long v16, v10, v3

    move-object/from16 v7, p0

    move-object v8, v13

    move-wide/from16 v18, v10

    .end local v10    # "cdEnd":J
    .local v18, "cdEnd":J
    move-wide/from16 v10, v16

    move-object v5, v13

    .end local v13    # "bos":Ljava/io/BufferedOutputStream;
    .local v5, "bos":Ljava/io/BufferedOutputStream;
    move-wide v12, v3

    :try_start_7
    invoke-direct/range {v7 .. v13}, Lcom/licenseinjector/app/core/ZipRewriter;->writeEnd(Ljava/io/BufferedOutputStream;IJJ)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 232
    .end local v1    # "offset":J
    .end local v3    # "cdStart":J
    .end local v18    # "cdEnd":J
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->flush()V

    .line 233
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->close()V

    .line 234
    nop

    .line 235
    return-void

    .line 232
    :catchall_1
    move-exception v0

    goto :goto_4

    .end local v5    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v13    # "bos":Ljava/io/BufferedOutputStream;
    :catchall_2
    move-exception v0

    move-object v5, v13

    .end local v13    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v5    # "bos":Ljava/io/BufferedOutputStream;
    :goto_4
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->flush()V

    .line 233
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->close()V

    .line 234
    throw v0
.end method
