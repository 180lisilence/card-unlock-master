.class public Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
.super Ljava/lang/Object;
.source "CentralDirectoryRecord.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/zip/CentralDirectoryRecord$ByLocalFileHeaderOffsetComparator;
    }
.end annotation


# static fields
.field public static final BY_LOCAL_FILE_HEADER_OFFSET_COMPARATOR:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/android/apksig/internal/zip/CentralDirectoryRecord;",
            ">;"
        }
    .end annotation
.end field

.field private static final GP_FLAGS_OFFSET:I = 0x8

.field private static final HEADER_SIZE_BYTES:I = 0x2e

.field private static final LOCAL_FILE_HEADER_OFFSET_OFFSET:I = 0x2a

.field private static final NAME_OFFSET:I = 0x2e

.field private static final RECORD_SIGNATURE:I = 0x2014b50


# instance fields
.field private final mCompressedSize:J

.field private final mCompressionMethod:S

.field private final mCrc32:J

.field private final mData:Ljava/nio/ByteBuffer;

.field private final mGpFlags:S

.field private final mLastModificationDate:I

.field private final mLastModificationTime:I

.field private final mLocalFileHeaderOffset:J

.field private final mName:Ljava/lang/String;

.field private final mNameSizeBytes:I

.field private final mUncompressedSize:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 35
    new-instance v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord$ByLocalFileHeaderOffsetComparator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord$ByLocalFileHeaderOffsetComparator;-><init>(Lcom/android/apksig/internal/zip/CentralDirectoryRecord$1;)V

    sput-object v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->BY_LOCAL_FILE_HEADER_OFFSET_COMPARATOR:Ljava/util/Comparator;

    return-void
.end method

.method private constructor <init>(Ljava/nio/ByteBuffer;SSIIJJJJLjava/lang/String;I)V
    .locals 0
    .param p1, "data"    # Ljava/nio/ByteBuffer;
    .param p2, "gpFlags"    # S
    .param p3, "compressionMethod"    # S
    .param p4, "lastModificationTime"    # I
    .param p5, "lastModificationDate"    # I
    .param p6, "crc32"    # J
    .param p8, "compressedSize"    # J
    .param p10, "uncompressedSize"    # J
    .param p12, "localFileHeaderOffset"    # J
    .param p14, "name"    # Ljava/lang/String;
    .param p15, "nameSizeBytes"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "data",
            "gpFlags",
            "compressionMethod",
            "lastModificationTime",
            "lastModificationDate",
            "crc32",
            "compressedSize",
            "uncompressedSize",
            "localFileHeaderOffset",
            "name",
            "nameSizeBytes"
        }
    .end annotation

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mData:Ljava/nio/ByteBuffer;

    .line 70
    iput-short p2, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mGpFlags:S

    .line 71
    iput-short p3, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mCompressionMethod:S

    .line 72
    iput p5, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mLastModificationDate:I

    .line 73
    iput p4, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mLastModificationTime:I

    .line 74
    iput-wide p6, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mCrc32:J

    .line 75
    iput-wide p8, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mCompressedSize:J

    .line 76
    iput-wide p10, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mUncompressedSize:J

    .line 77
    iput-wide p12, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mLocalFileHeaderOffset:J

    .line 78
    iput-object p14, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mName:Ljava/lang/String;

    .line 79
    iput p15, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mNameSizeBytes:I

    .line 80
    return-void
.end method

.method public static createWithDeflateCompressedData(Ljava/lang/String;IIJJJJ)Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .locals 22
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "lastModifiedTime"    # I
    .param p2, "lastModifiedDate"    # I
    .param p3, "crc32"    # J
    .param p5, "compressedSize"    # J
    .param p7, "uncompressedSize"    # J
    .param p9, "localFileHeaderOffset"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "name",
            "lastModifiedTime",
            "lastModifiedDate",
            "crc32",
            "compressedSize",
            "uncompressedSize",
            "localFileHeaderOffset"
        }
    .end annotation

    .line 226
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    move-object/from16 v15, p0

    invoke-virtual {v15, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 227
    .local v0, "nameBytes":[B
    const/16 v13, 0x800

    .line 228
    .local v13, "gpFlags":S
    const/16 v14, 0x8

    .line 229
    .local v14, "compressionMethod":S
    array-length v1, v0

    add-int/lit8 v17, v1, 0x2e

    .line 230
    .local v17, "recordSize":I
    invoke-static/range {v17 .. v17}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v11

    .line 231
    .local v11, "result":Ljava/nio/ByteBuffer;
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v11, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 232
    const v1, 0x2014b50

    invoke-virtual {v11, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 233
    const/16 v1, 0x14

    invoke-static {v11, v1}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 234
    invoke-static {v11, v1}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 235
    invoke-virtual {v11, v13}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 236
    invoke-virtual {v11, v14}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 237
    move/from16 v12, p1

    invoke-static {v11, v12}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 238
    move/from16 v9, p2

    invoke-static {v11, v9}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 239
    move-wide/from16 v7, p3

    invoke-static {v11, v7, v8}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt32(Ljava/nio/ByteBuffer;J)V

    .line 240
    move-wide/from16 v5, p5

    invoke-static {v11, v5, v6}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt32(Ljava/nio/ByteBuffer;J)V

    .line 241
    move-wide/from16 v3, p7

    invoke-static {v11, v3, v4}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt32(Ljava/nio/ByteBuffer;J)V

    .line 242
    array-length v1, v0

    invoke-static {v11, v1}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 243
    const/4 v1, 0x0

    invoke-static {v11, v1}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 244
    invoke-static {v11, v1}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 245
    invoke-static {v11, v1}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 246
    invoke-static {v11, v1}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 247
    const-wide/16 v1, 0x0

    invoke-static {v11, v1, v2}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt32(Ljava/nio/ByteBuffer;J)V

    .line 248
    move-wide/from16 v1, p9

    invoke-static {v11, v1, v2}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt32(Ljava/nio/ByteBuffer;J)V

    .line 249
    invoke-virtual {v11, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 251
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v10

    if-nez v10, :cond_0

    .line 254
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 255
    new-instance v18, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    array-length v10, v0

    move-object/from16 v1, v18

    move-object v2, v11

    move v3, v13

    move v4, v14

    move/from16 v5, p1

    move/from16 v6, p2

    move-wide/from16 v7, p3

    move/from16 v16, v10

    move-wide/from16 v9, p5

    move-object/from16 v19, v11

    .end local v11    # "result":Ljava/nio/ByteBuffer;
    .local v19, "result":Ljava/nio/ByteBuffer;
    move-wide/from16 v11, p7

    move/from16 v20, v13

    move/from16 v21, v14

    .end local v13    # "gpFlags":S
    .end local v14    # "compressionMethod":S
    .local v20, "gpFlags":S
    .local v21, "compressionMethod":S
    move-wide/from16 v13, p9

    move-object/from16 v15, p0

    invoke-direct/range {v1 .. v16}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;-><init>(Ljava/nio/ByteBuffer;SSIIJJJJLjava/lang/String;I)V

    return-object v18

    .line 252
    .end local v19    # "result":Ljava/nio/ByteBuffer;
    .end local v20    # "gpFlags":S
    .end local v21    # "compressionMethod":S
    .restart local v11    # "result":Ljava/nio/ByteBuffer;
    .restart local v13    # "gpFlags":S
    .restart local v14    # "compressionMethod":S
    :cond_0
    move-object/from16 v19, v11

    .end local v11    # "result":Ljava/nio/ByteBuffer;
    .restart local v19    # "result":Ljava/nio/ByteBuffer;
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pos: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {v19 .. v19}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", limit: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {v19 .. v19}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static getName(Ljava/nio/ByteBuffer;II)Ljava/lang/String;
    .locals 4
    .param p0, "record"    # Ljava/nio/ByteBuffer;
    .param p1, "position"    # I
    .param p2, "nameLengthBytes"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "record",
            "position",
            "nameLengthBytes"
        }
    .end annotation

    .line 272
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasArray()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 273
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    .line 274
    .local v0, "nameBytes":[B
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v1

    add-int/2addr v1, p1

    .local v1, "nameBytesOffset":I
    goto :goto_0

    .line 276
    .end local v0    # "nameBytes":[B
    .end local v1    # "nameBytesOffset":I
    :cond_0
    new-array v0, p2, [B

    .line 277
    .restart local v0    # "nameBytes":[B
    const/4 v1, 0x0

    .line 278
    .restart local v1    # "nameBytesOffset":I
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    .line 280
    .local v2, "originalPosition":I
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 281
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 283
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 284
    nop

    .line 286
    .end local v2    # "originalPosition":I
    :goto_0
    new-instance v2, Ljava/lang/String;

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v2, v0, v1, p2, v3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    return-object v2

    .line 283
    .restart local v2    # "originalPosition":I
    :catchall_0
    move-exception v3

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 284
    throw v3
.end method

.method public static getRecord(Ljava/nio/ByteBuffer;)Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .locals 39
    .param p0, "buf"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buf"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/zip/ZipFormatException;
        }
    .end annotation

    .line 131
    move-object/from16 v1, p0

    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/zip/ZipUtils;->assertByteOrderLittleEndian(Ljava/nio/ByteBuffer;)V

    .line 132
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/16 v2, 0x2e

    const-string v3, " bytes"

    if-lt v0, v2, :cond_2

    .line 138
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    .line 139
    .local v2, "originalPosition":I
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    .line 140
    .local v4, "recordSignature":I
    const v0, 0x2014b50

    if-ne v4, v0, :cond_1

    .line 145
    add-int/lit8 v0, v2, 0x8

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 146
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v21

    .line 147
    .local v21, "gpFlags":S
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v22

    .line 148
    .local v22, "compressionMethod":S
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt16(Ljava/nio/ByteBuffer;)I

    move-result v23

    .line 149
    .local v23, "lastModificationTime":I
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt16(Ljava/nio/ByteBuffer;)I

    move-result v24

    .line 150
    .local v24, "lastModificationDate":I
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v25

    .line 151
    .local v25, "crc32":J
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v27

    .line 152
    .local v27, "compressedSize":J
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v29

    .line 153
    .local v29, "uncompressedSize":J
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt16(Ljava/nio/ByteBuffer;)I

    move-result v15

    .line 154
    .local v15, "nameSize":I
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt16(Ljava/nio/ByteBuffer;)I

    move-result v31

    .line 155
    .local v31, "extraSize":I
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt16(Ljava/nio/ByteBuffer;)I

    move-result v32

    .line 156
    .local v32, "commentSize":I
    add-int/lit8 v0, v2, 0x2a

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 157
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt32(Ljava/nio/ByteBuffer;)J

    move-result-wide v33

    .line 158
    .local v33, "localFileHeaderOffset":J
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 159
    add-int/lit8 v0, v15, 0x2e

    add-int v0, v0, v31

    add-int v13, v0, v32

    .line 160
    .local v13, "recordSize":I
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-gt v13, v0, :cond_0

    .line 166
    add-int/lit8 v0, v2, 0x2e

    invoke-static {v1, v0, v15}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName(Ljava/nio/ByteBuffer;II)Ljava/lang/String;

    move-result-object v3

    .line 167
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 168
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v14

    .line 169
    .local v14, "originalLimit":I
    add-int v11, v2, v13

    .line 172
    .local v11, "recordEndInBuf":I
    :try_start_0
    invoke-virtual {v1, v11}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 173
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 175
    .local v6, "recordBuf":Ljava/nio/ByteBuffer;
    invoke-virtual {v1, v14}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 176
    nop

    .line 178
    invoke-virtual {v1, v11}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 179
    new-instance v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    move-object v5, v0

    move/from16 v7, v21

    move/from16 v8, v22

    move/from16 v9, v23

    move/from16 v10, v24

    move/from16 v35, v11

    .end local v11    # "recordEndInBuf":I
    .local v35, "recordEndInBuf":I
    move-wide/from16 v11, v25

    move/from16 v36, v2

    move/from16 v37, v4

    move v2, v13

    move v4, v14

    .end local v13    # "recordSize":I
    .end local v14    # "originalLimit":I
    .local v2, "recordSize":I
    .local v4, "originalLimit":I
    .local v36, "originalPosition":I
    .local v37, "recordSignature":I
    move-wide/from16 v13, v27

    move/from16 v38, v15

    .end local v15    # "nameSize":I
    .local v38, "nameSize":I
    move-wide/from16 v15, v29

    move-wide/from16 v17, v33

    move-object/from16 v19, v3

    move/from16 v20, v38

    invoke-direct/range {v5 .. v20}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;-><init>(Ljava/nio/ByteBuffer;SSIIJJJJLjava/lang/String;I)V

    return-object v0

    .line 175
    .end local v6    # "recordBuf":Ljava/nio/ByteBuffer;
    .end local v35    # "recordEndInBuf":I
    .end local v36    # "originalPosition":I
    .end local v37    # "recordSignature":I
    .end local v38    # "nameSize":I
    .local v2, "originalPosition":I
    .local v4, "recordSignature":I
    .restart local v11    # "recordEndInBuf":I
    .restart local v13    # "recordSize":I
    .restart local v14    # "originalLimit":I
    .restart local v15    # "nameSize":I
    :catchall_0
    move-exception v0

    move/from16 v36, v2

    move/from16 v37, v4

    move/from16 v35, v11

    move v2, v13

    move v4, v14

    move/from16 v38, v15

    .end local v11    # "recordEndInBuf":I
    .end local v13    # "recordSize":I
    .end local v14    # "originalLimit":I
    .end local v15    # "nameSize":I
    .local v2, "recordSize":I
    .local v4, "originalLimit":I
    .restart local v35    # "recordEndInBuf":I
    .restart local v36    # "originalPosition":I
    .restart local v37    # "recordSignature":I
    .restart local v38    # "nameSize":I
    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 176
    throw v0

    .line 161
    .end local v3    # "name":Ljava/lang/String;
    .end local v35    # "recordEndInBuf":I
    .end local v36    # "originalPosition":I
    .end local v37    # "recordSignature":I
    .end local v38    # "nameSize":I
    .local v2, "originalPosition":I
    .local v4, "recordSignature":I
    .restart local v13    # "recordSize":I
    .restart local v15    # "nameSize":I
    :cond_0
    move/from16 v36, v2

    move/from16 v37, v4

    move v2, v13

    .end local v4    # "recordSignature":I
    .end local v13    # "recordSize":I
    .local v2, "recordSize":I
    .restart local v36    # "originalPosition":I
    .restart local v37    # "recordSignature":I
    new-instance v0, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Input too short. Need: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " bytes, available: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 163
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/nio/BufferUnderflowException;

    invoke-direct {v4}, Ljava/nio/BufferUnderflowException;-><init>()V

    invoke-direct {v0, v3, v4}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    .line 141
    .end local v15    # "nameSize":I
    .end local v21    # "gpFlags":S
    .end local v22    # "compressionMethod":S
    .end local v23    # "lastModificationTime":I
    .end local v24    # "lastModificationDate":I
    .end local v25    # "crc32":J
    .end local v27    # "compressedSize":J
    .end local v29    # "uncompressedSize":J
    .end local v31    # "extraSize":I
    .end local v32    # "commentSize":I
    .end local v33    # "localFileHeaderOffset":J
    .end local v36    # "originalPosition":I
    .end local v37    # "recordSignature":I
    .local v2, "originalPosition":I
    .restart local v4    # "recordSignature":I
    :cond_1
    move/from16 v36, v2

    move/from16 v37, v4

    .end local v2    # "originalPosition":I
    .end local v4    # "recordSignature":I
    .restart local v36    # "originalPosition":I
    .restart local v37    # "recordSignature":I
    new-instance v0, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Not a Central Directory record. Signature: 0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v3, v37

    .end local v37    # "recordSignature":I
    .local v3, "recordSignature":I
    int-to-long v4, v3

    const-wide v6, 0xffffffffL

    and-long/2addr v4, v6

    .line 143
    invoke-static {v4, v5}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 133
    .end local v3    # "recordSignature":I
    .end local v36    # "originalPosition":I
    :cond_2
    new-instance v0, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Input too short. Need at least: 46 bytes, available: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 135
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/nio/BufferUnderflowException;

    invoke-direct {v3}, Ljava/nio/BufferUnderflowException;-><init>()V

    invoke-direct {v0, v2, v3}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method public copyTo(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "output"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "output"
        }
    .end annotation

    .line 194
    iget-object v0, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mData:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 195
    return-void
.end method

.method public createWithModifiedLocalFileHeaderOffset(J)Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .locals 19
    .param p1, "localFileHeaderOffset"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "localFileHeaderOffset"
        }
    .end annotation

    .line 199
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mData:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 200
    .local v1, "result":Ljava/nio/ByteBuffer;
    iget-object v2, v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mData:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 201
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 202
    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 203
    const/16 v2, 0x2a

    move-wide/from16 v14, p1

    invoke-static {v1, v2, v14, v15}, Lcom/android/apksig/internal/zip/ZipUtils;->setUnsignedInt32(Ljava/nio/ByteBuffer;IJ)V

    .line 204
    new-instance v18, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    iget-short v4, v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mGpFlags:S

    iget-short v5, v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mCompressionMethod:S

    iget v6, v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mLastModificationTime:I

    iget v7, v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mLastModificationDate:I

    iget-wide v8, v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mCrc32:J

    iget-wide v10, v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mCompressedSize:J

    iget-wide v12, v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mUncompressedSize:J

    iget-object v3, v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mName:Ljava/lang/String;

    iget v2, v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mNameSizeBytes:I

    move/from16 v17, v2

    move-object/from16 v2, v18

    move-object/from16 v16, v3

    move-object v3, v1

    invoke-direct/range {v2 .. v17}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;-><init>(Ljava/nio/ByteBuffer;SSIIJJJJLjava/lang/String;I)V

    return-object v18
.end method

.method public getCompressedSize()J
    .locals 2

    .line 115
    iget-wide v0, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mCompressedSize:J

    return-wide v0
.end method

.method public getCompressionMethod()S
    .locals 1

    .line 99
    iget-short v0, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mCompressionMethod:S

    return v0
.end method

.method public getCrc32()J
    .locals 2

    .line 111
    iget-wide v0, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mCrc32:J

    return-wide v0
.end method

.method public getGpFlags()S
    .locals 1

    .line 95
    iget-short v0, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mGpFlags:S

    return v0
.end method

.method public getLastModificationDate()I
    .locals 1

    .line 107
    iget v0, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mLastModificationDate:I

    return v0
.end method

.method public getLastModificationTime()I
    .locals 1

    .line 103
    iget v0, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mLastModificationTime:I

    return v0
.end method

.method public getLocalFileHeaderOffset()J
    .locals 2

    .line 123
    iget-wide v0, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mLocalFileHeaderOffset:J

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getNameSizeBytes()I
    .locals 1

    .line 91
    iget v0, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mNameSizeBytes:I

    return v0
.end method

.method public getSize()I
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mData:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    return v0
.end method

.method public getUncompressedSize()J
    .locals 2

    .line 119
    iget-wide v0, p0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->mUncompressedSize:J

    return-wide v0
.end method
