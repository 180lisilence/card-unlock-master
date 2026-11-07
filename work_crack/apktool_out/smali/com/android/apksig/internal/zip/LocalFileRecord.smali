.class public Lcom/android/apksig/internal/zip/LocalFileRecord;
.super Ljava/lang/Object;
.source "LocalFileRecord.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;
    }
.end annotation


# static fields
.field private static final COMPRESSED_SIZE_OFFSET:I = 0x12

.field private static final CRC32_OFFSET:I = 0xe

.field private static final DATA_DESCRIPTOR_SIGNATURE:I = 0x8074b50

.field private static final DATA_DESCRIPTOR_SIZE_BYTES_WITHOUT_SIGNATURE:I = 0xc

.field private static final EMPTY_BYTE_BUFFER:Ljava/nio/ByteBuffer;

.field private static final EXTRA_LENGTH_OFFSET:I = 0x1c

.field private static final GP_FLAGS_OFFSET:I = 0x6

.field private static final HEADER_SIZE_BYTES:I = 0x1e

.field private static final NAME_LENGTH_OFFSET:I = 0x1a

.field private static final NAME_OFFSET:I = 0x1e

.field private static final RECORD_SIGNATURE:I = 0x4034b50

.field private static final UNCOMPRESSED_SIZE_OFFSET:I = 0x16


# instance fields
.field private final mDataCompressed:Z

.field private final mDataSize:J

.field private final mDataStartOffset:I

.field private final mExtra:Ljava/nio/ByteBuffer;

.field private final mName:Ljava/lang/String;

.field private final mNameSizeBytes:I

.field private final mSize:J

.field private final mStartOffsetInArchive:J

.field private final mUncompressedDataSize:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 372
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sput-object v0, Lcom/android/apksig/internal/zip/LocalFileRecord;->EMPTY_BYTE_BUFFER:Ljava/nio/ByteBuffer;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/nio/ByteBuffer;JJIJZJ)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "nameSizeBytes"    # I
    .param p3, "extra"    # Ljava/nio/ByteBuffer;
    .param p4, "startOffsetInArchive"    # J
    .param p6, "size"    # J
    .param p8, "dataStartOffset"    # I
    .param p9, "dataSize"    # J
    .param p11, "dataCompressed"    # Z
    .param p12, "uncompressedDataSize"    # J
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
            0x0
        }
        names = {
            "name",
            "nameSizeBytes",
            "extra",
            "startOffsetInArchive",
            "size",
            "dataStartOffset",
            "dataSize",
            "dataCompressed",
            "uncompressedDataSize"
        }
    .end annotation

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p1, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mName:Ljava/lang/String;

    .line 74
    iput p2, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mNameSizeBytes:I

    .line 75
    iput-object p3, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mExtra:Ljava/nio/ByteBuffer;

    .line 76
    iput-wide p4, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mStartOffsetInArchive:J

    .line 77
    iput-wide p6, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mSize:J

    .line 78
    iput p8, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mDataStartOffset:I

    .line 79
    iput-wide p9, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mDataSize:J

    .line 80
    iput-boolean p11, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mDataCompressed:Z

    .line 81
    iput-wide p12, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mUncompressedDataSize:J

    .line 82
    return-void
.end method

.method public static getRecord(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)Lcom/android/apksig/internal/zip/LocalFileRecord;
    .locals 6
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "cdRecord"    # Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .param p2, "cdStartOffset"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "apk",
            "cdRecord",
            "cdStartOffset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/zip/ZipFormatException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 127
    const/4 v4, 0x1

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    invoke-static/range {v0 .. v5}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getRecord(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;JZZ)Lcom/android/apksig/internal/zip/LocalFileRecord;

    move-result-object v0

    return-object v0
.end method

.method private static getRecord(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;JZZ)Lcom/android/apksig/internal/zip/LocalFileRecord;
    .locals 53
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "cdRecord"    # Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .param p2, "cdStartOffset"    # J
    .param p4, "extraFieldContentsNeeded"    # Z
    .param p5, "dataDescriptorIncluded"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "apk",
            "cdRecord",
            "cdStartOffset",
            "extraFieldContentsNeeded",
            "dataDescriptorIncluded"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/zip/ZipFormatException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 150
    move-object/from16 v1, p0

    move-wide/from16 v2, p2

    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v15

    .line 151
    .local v15, "entryName":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getNameSizeBytes()I

    move-result v13

    .line 152
    .local v13, "cdRecordEntryNameSizeBytes":I
    add-int/lit8 v14, v13, 0x1e

    .line 153
    .local v14, "headerSizeWithName":I
    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getLocalFileHeaderOffset()J

    move-result-wide v10

    .line 154
    .local v10, "headerStartOffset":J
    int-to-long v4, v14

    add-long v8, v10, v4

    .line 155
    .local v8, "headerEndOffset":J
    cmp-long v0, v8, v2

    const-string v4, ", CD start: "

    if-gtz v0, :cond_12

    .line 163
    :try_start_0
    invoke-interface {v1, v10, v11, v14}, Lcom/android/apksig/util/DataSource;->getByteBuffer(JI)Ljava/nio/ByteBuffer;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    .local v0, "header":Ljava/nio/ByteBuffer;
    nop

    .line 167
    sget-object v5, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 169
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v12

    .line 170
    .local v12, "recordSignature":I
    const v5, 0x4034b50

    if-ne v12, v5, :cond_11

    .line 175
    const/4 v5, 0x6

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result v18

    .line 176
    .local v18, "gpFlags":S
    and-int/lit8 v5, v18, 0x8

    if-eqz v5, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    .line 177
    .local v5, "dataDescriptorUsed":Z
    :goto_0
    nop

    .line 178
    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getGpFlags()S

    move-result v16

    and-int/lit8 v16, v16, 0x8

    if-eqz v16, :cond_1

    const/16 v16, 0x1

    goto :goto_1

    :cond_1
    const/16 v16, 0x0

    :goto_1
    move/from16 v19, v16

    .line 179
    .local v19, "cdDataDescriptorUsed":Z
    const-string v6, ", CD: "

    const-string v7, ". LFH: "

    move/from16 v20, v14

    move/from16 v14, v19

    .end local v19    # "cdDataDescriptorUsed":Z
    .local v14, "cdDataDescriptorUsed":Z
    .local v20, "headerSizeWithName":I
    if-ne v5, v14, :cond_10

    .line 185
    move-wide/from16 v21, v8

    .end local v8    # "headerEndOffset":J
    .local v21, "headerEndOffset":J
    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getCrc32()J

    move-result-wide v8

    .line 186
    .local v8, "uncompressedDataCrc32FromCdRecord":J
    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getCompressedSize()J

    move-result-wide v1

    .line 187
    .local v1, "compressedDataSizeFromCdRecord":J
    move-object/from16 v19, v4

    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getUncompressedSize()J

    move-result-wide v3

    .line 188
    .local v3, "uncompressedDataSizeFromCdRecord":J
    if-nez v5, :cond_5

    .line 189
    move/from16 v23, v5

    .end local v5    # "dataDescriptorUsed":Z
    .local v23, "dataDescriptorUsed":Z
    const/16 v5, 0xe

    move-wide/from16 v24, v10

    .end local v10    # "headerStartOffset":J
    .local v24, "headerStartOffset":J
    invoke-static {v0, v5}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt32(Ljava/nio/ByteBuffer;I)J

    move-result-wide v10

    .line 190
    .local v10, "crc32":J
    cmp-long v5, v10, v8

    if-nez v5, :cond_4

    .line 196
    const/16 v5, 0x12

    move/from16 v27, v12

    move/from16 v26, v13

    .end local v12    # "recordSignature":I
    .end local v13    # "cdRecordEntryNameSizeBytes":I
    .local v26, "cdRecordEntryNameSizeBytes":I
    .local v27, "recordSignature":I
    invoke-static {v0, v5}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt32(Ljava/nio/ByteBuffer;I)J

    move-result-wide v12

    .line 197
    .local v12, "compressedSize":J
    cmp-long v5, v12, v1

    if-nez v5, :cond_3

    .line 203
    const/16 v5, 0x16

    move-wide/from16 v28, v8

    .end local v8    # "uncompressedDataCrc32FromCdRecord":J
    .local v28, "uncompressedDataCrc32FromCdRecord":J
    invoke-static {v0, v5}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt32(Ljava/nio/ByteBuffer;I)J

    move-result-wide v8

    .line 204
    .local v8, "uncompressedSize":J
    cmp-long v5, v8, v3

    if-nez v5, :cond_2

    move-object/from16 v31, v0

    move/from16 v30, v14

    move-wide/from16 v8, v28

    goto/16 :goto_2

    .line 205
    :cond_2
    new-instance v5, Lcom/android/apksig/zip/ZipFormatException;

    move/from16 v30, v14

    .end local v14    # "cdDataDescriptorUsed":Z
    .local v30, "cdDataDescriptorUsed":Z
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v31, v0

    .end local v0    # "header":Ljava/nio/ByteBuffer;
    .local v31, "header":Ljava/nio/ByteBuffer;
    const-string v0, "Uncompressed size mismatch between Local File Header and Central Directory for entry "

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v0}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 198
    .end local v28    # "uncompressedDataCrc32FromCdRecord":J
    .end local v30    # "cdDataDescriptorUsed":Z
    .end local v31    # "header":Ljava/nio/ByteBuffer;
    .restart local v0    # "header":Ljava/nio/ByteBuffer;
    .local v8, "uncompressedDataCrc32FromCdRecord":J
    .restart local v14    # "cdDataDescriptorUsed":Z
    :cond_3
    move-object/from16 v31, v0

    move-wide/from16 v28, v8

    .end local v0    # "header":Ljava/nio/ByteBuffer;
    .end local v8    # "uncompressedDataCrc32FromCdRecord":J
    .restart local v28    # "uncompressedDataCrc32FromCdRecord":J
    .restart local v31    # "header":Ljava/nio/ByteBuffer;
    new-instance v0, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Compressed size mismatch between Local File Header and Central Directory for entry "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 191
    .end local v26    # "cdRecordEntryNameSizeBytes":I
    .end local v27    # "recordSignature":I
    .end local v28    # "uncompressedDataCrc32FromCdRecord":J
    .end local v31    # "header":Ljava/nio/ByteBuffer;
    .restart local v0    # "header":Ljava/nio/ByteBuffer;
    .restart local v8    # "uncompressedDataCrc32FromCdRecord":J
    .local v12, "recordSignature":I
    .restart local v13    # "cdRecordEntryNameSizeBytes":I
    :cond_4
    move-object/from16 v31, v0

    move-wide/from16 v28, v8

    .end local v0    # "header":Ljava/nio/ByteBuffer;
    .end local v8    # "uncompressedDataCrc32FromCdRecord":J
    .restart local v28    # "uncompressedDataCrc32FromCdRecord":J
    .restart local v31    # "header":Ljava/nio/ByteBuffer;
    new-instance v0, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "CRC-32 mismatch between Local File Header and Central Directory for entry "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v8, v28

    .end local v28    # "uncompressedDataCrc32FromCdRecord":J
    .restart local v8    # "uncompressedDataCrc32FromCdRecord":J
    invoke-virtual {v5, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 188
    .end local v23    # "dataDescriptorUsed":Z
    .end local v24    # "headerStartOffset":J
    .end local v31    # "header":Ljava/nio/ByteBuffer;
    .restart local v0    # "header":Ljava/nio/ByteBuffer;
    .restart local v5    # "dataDescriptorUsed":Z
    .local v10, "headerStartOffset":J
    :cond_5
    move-object/from16 v31, v0

    move/from16 v23, v5

    move-wide/from16 v24, v10

    move/from16 v27, v12

    move/from16 v26, v13

    move/from16 v30, v14

    .line 211
    .end local v0    # "header":Ljava/nio/ByteBuffer;
    .end local v5    # "dataDescriptorUsed":Z
    .end local v10    # "headerStartOffset":J
    .end local v12    # "recordSignature":I
    .end local v13    # "cdRecordEntryNameSizeBytes":I
    .end local v14    # "cdDataDescriptorUsed":Z
    .restart local v23    # "dataDescriptorUsed":Z
    .restart local v24    # "headerStartOffset":J
    .restart local v26    # "cdRecordEntryNameSizeBytes":I
    .restart local v27    # "recordSignature":I
    .restart local v30    # "cdDataDescriptorUsed":Z
    .restart local v31    # "header":Ljava/nio/ByteBuffer;
    :goto_2
    const/16 v0, 0x1a

    move-object/from16 v13, v31

    .end local v31    # "header":Ljava/nio/ByteBuffer;
    .local v13, "header":Ljava/nio/ByteBuffer;
    invoke-static {v13, v0}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt16(Ljava/nio/ByteBuffer;I)I

    move-result v0

    .line 212
    .local v0, "nameLength":I
    move/from16 v14, v26

    .end local v26    # "cdRecordEntryNameSizeBytes":I
    .local v14, "cdRecordEntryNameSizeBytes":I
    if-gt v0, v14, :cond_f

    .line 218
    const/16 v5, 0x1e

    invoke-static {v13, v5, v0}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName(Ljava/nio/ByteBuffer;II)Ljava/lang/String;

    move-result-object v12

    .line 219
    .local v12, "name":Ljava/lang/String;
    invoke-virtual {v15, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e

    .line 224
    const/16 v5, 0x1c

    invoke-static {v13, v5}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt16(Ljava/nio/ByteBuffer;I)I

    move-result v10

    .line 225
    .local v10, "extraLength":I
    const-wide/16 v5, 0x1e

    add-long v28, v24, v5

    int-to-long v5, v0

    add-long v28, v28, v5

    int-to-long v5, v10

    add-long v6, v28, v5

    .line 227
    .local v6, "dataStartOffset":J
    nop

    .line 228
    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getCompressionMethod()S

    move-result v5

    if-eqz v5, :cond_6

    const/16 v16, 0x1

    goto :goto_3

    :cond_6
    const/16 v16, 0x0

    :goto_3
    move/from16 v26, v16

    .line 229
    .local v26, "compressed":Z
    if-eqz v26, :cond_7

    .line 230
    move-wide/from16 v16, v1

    move-wide/from16 v28, v16

    .local v16, "dataSize":J
    goto :goto_4

    .line 232
    .end local v16    # "dataSize":J
    :cond_7
    move-wide/from16 v16, v3

    move-wide/from16 v28, v16

    .line 234
    .local v28, "dataSize":J
    :goto_4
    move-wide/from16 v16, v1

    .end local v1    # "compressedDataSizeFromCdRecord":J
    .local v16, "compressedDataSizeFromCdRecord":J
    add-long v1, v6, v28

    .line 235
    .local v1, "dataEndOffset":J
    move-object/from16 v34, v12

    move-object/from16 v33, v13

    move-wide/from16 v35, v16

    move-wide/from16 v12, p2

    .end local v12    # "name":Ljava/lang/String;
    .end local v13    # "header":Ljava/nio/ByteBuffer;
    .end local v16    # "compressedDataSizeFromCdRecord":J
    .local v33, "header":Ljava/nio/ByteBuffer;
    .local v34, "name":Ljava/lang/String;
    .local v35, "compressedDataSizeFromCdRecord":J
    cmp-long v5, v1, v12

    if-gtz v5, :cond_d

    .line 242
    sget-object v5, Lcom/android/apksig/internal/zip/LocalFileRecord;->EMPTY_BYTE_BUFFER:Ljava/nio/ByteBuffer;

    .line 243
    .local v5, "extra":Ljava/nio/ByteBuffer;
    if-eqz p4, :cond_8

    if-lez v10, :cond_8

    .line 244
    const-wide/16 v16, 0x1e

    add-long v16, v24, v16

    move-wide/from16 v31, v3

    .end local v3    # "uncompressedDataSizeFromCdRecord":J
    .local v31, "uncompressedDataSizeFromCdRecord":J
    int-to-long v3, v0

    add-long v3, v16, v3

    move-object/from16 v11, p0

    invoke-interface {v11, v3, v4, v10}, Lcom/android/apksig/util/DataSource;->getByteBuffer(JI)Ljava/nio/ByteBuffer;

    move-result-object v5

    move-object v3, v5

    goto :goto_5

    .line 243
    .end local v31    # "uncompressedDataSizeFromCdRecord":J
    .restart local v3    # "uncompressedDataSizeFromCdRecord":J
    :cond_8
    move-object/from16 v11, p0

    move-wide/from16 v31, v3

    .line 248
    .end local v3    # "uncompressedDataSizeFromCdRecord":J
    .restart local v31    # "uncompressedDataSizeFromCdRecord":J
    move-object v3, v5

    .end local v5    # "extra":Ljava/nio/ByteBuffer;
    .local v3, "extra":Ljava/nio/ByteBuffer;
    :goto_5
    move-wide v4, v1

    .line 250
    .local v4, "recordEndOffset":J
    if-eqz p5, :cond_c

    and-int/lit8 v16, v18, 0x8

    if-eqz v16, :cond_c

    .line 259
    const-wide/16 v16, 0xc

    add-long v16, v1, v16

    .line 261
    .local v16, "dataDescriptorEndOffset":J
    cmp-long v37, v16, v12

    move-wide/from16 v38, v4

    .end local v4    # "recordEndOffset":J
    .local v38, "recordEndOffset":J
    const-string v4, " overlaps with Central Directory. Data Descriptor end: "

    const-string v5, "Data Descriptor of "

    if-gtz v37, :cond_b

    .line 267
    move-wide/from16 v40, v6

    .end local v6    # "dataStartOffset":J
    .local v40, "dataStartOffset":J
    const/4 v6, 0x4

    invoke-interface {v11, v1, v2, v6}, Lcom/android/apksig/util/DataSource;->getByteBuffer(JI)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 268
    .local v6, "dataDescriptorPotentialSig":Ljava/nio/ByteBuffer;
    sget-object v7, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v6, v7}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 269
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v7

    move-object/from16 v37, v6

    .end local v6    # "dataDescriptorPotentialSig":Ljava/nio/ByteBuffer;
    .local v37, "dataDescriptorPotentialSig":Ljava/nio/ByteBuffer;
    const v6, 0x8074b50

    if-ne v7, v6, :cond_a

    .line 270
    const-wide/16 v6, 0x4

    add-long v16, v16, v6

    .line 271
    cmp-long v6, v16, v12

    if-gtz v6, :cond_9

    goto :goto_6

    .line 272
    :cond_9
    new-instance v6, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v7, v19

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v6, v4}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 278
    :cond_a
    :goto_6
    move-wide/from16 v4, v16

    move-wide/from16 v38, v4

    move-wide/from16 v42, v8

    .end local v38    # "recordEndOffset":J
    .restart local v4    # "recordEndOffset":J
    goto :goto_7

    .line 262
    .end local v4    # "recordEndOffset":J
    .end local v37    # "dataDescriptorPotentialSig":Ljava/nio/ByteBuffer;
    .end local v40    # "dataStartOffset":J
    .local v6, "dataStartOffset":J
    .restart local v38    # "recordEndOffset":J
    :cond_b
    move-wide/from16 v40, v6

    move-object/from16 v7, v19

    .end local v6    # "dataStartOffset":J
    .restart local v40    # "dataStartOffset":J
    new-instance v6, Lcom/android/apksig/zip/ZipFormatException;

    move-wide/from16 v42, v8

    .end local v8    # "uncompressedDataCrc32FromCdRecord":J
    .local v42, "uncompressedDataCrc32FromCdRecord":J
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v6, v4}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 250
    .end local v16    # "dataDescriptorEndOffset":J
    .end local v38    # "recordEndOffset":J
    .end local v40    # "dataStartOffset":J
    .end local v42    # "uncompressedDataCrc32FromCdRecord":J
    .restart local v4    # "recordEndOffset":J
    .restart local v6    # "dataStartOffset":J
    .restart local v8    # "uncompressedDataCrc32FromCdRecord":J
    :cond_c
    move-wide/from16 v38, v4

    move-wide/from16 v40, v6

    move-wide/from16 v42, v8

    .line 281
    .end local v4    # "recordEndOffset":J
    .end local v6    # "dataStartOffset":J
    .end local v8    # "uncompressedDataCrc32FromCdRecord":J
    .restart local v38    # "recordEndOffset":J
    .restart local v40    # "dataStartOffset":J
    .restart local v42    # "uncompressedDataCrc32FromCdRecord":J
    :goto_7
    sub-long v44, v38, v24

    .line 282
    .local v44, "recordSize":J
    add-int/lit8 v4, v0, 0x1e

    add-int v19, v4, v10

    .line 284
    .local v19, "dataStartOffsetInRecord":I
    new-instance v37, Lcom/android/apksig/internal/zip/LocalFileRecord;

    move-object/from16 v4, v37

    move/from16 v8, v23

    .end local v23    # "dataDescriptorUsed":Z
    .local v8, "dataDescriptorUsed":Z
    move-object v5, v15

    move/from16 v23, v0

    move-wide/from16 v46, v1

    move-wide/from16 v0, v40

    .end local v1    # "dataEndOffset":J
    .end local v40    # "dataStartOffset":J
    .local v0, "dataStartOffset":J
    .local v23, "nameLength":I
    .local v46, "dataEndOffset":J
    move v6, v14

    move-object v7, v3

    move-object/from16 v40, v3

    move v2, v8

    move-wide/from16 v41, v42

    .end local v3    # "extra":Ljava/nio/ByteBuffer;
    .end local v8    # "dataDescriptorUsed":Z
    .end local v42    # "uncompressedDataCrc32FromCdRecord":J
    .local v2, "dataDescriptorUsed":Z
    .local v40, "extra":Ljava/nio/ByteBuffer;
    .local v41, "uncompressedDataCrc32FromCdRecord":J
    move-wide/from16 v8, v24

    move v3, v10

    .end local v10    # "extraLength":I
    .local v3, "extraLength":I
    move-wide/from16 v10, v44

    move/from16 v43, v2

    move/from16 v48, v3

    move-wide v2, v12

    move/from16 v13, v27

    move-object/from16 v49, v34

    .end local v2    # "dataDescriptorUsed":Z
    .end local v3    # "extraLength":I
    .end local v27    # "recordSignature":I
    .end local v34    # "name":Ljava/lang/String;
    .local v13, "recordSignature":I
    .local v43, "dataDescriptorUsed":Z
    .local v48, "extraLength":I
    .local v49, "name":Ljava/lang/String;
    move/from16 v12, v19

    move/from16 v51, v13

    move/from16 v50, v14

    move/from16 v52, v30

    move-object/from16 v27, v33

    .end local v13    # "recordSignature":I
    .end local v14    # "cdRecordEntryNameSizeBytes":I
    .end local v30    # "cdDataDescriptorUsed":Z
    .end local v33    # "header":Ljava/nio/ByteBuffer;
    .local v27, "header":Ljava/nio/ByteBuffer;
    .local v50, "cdRecordEntryNameSizeBytes":I
    .local v51, "recordSignature":I
    .local v52, "cdDataDescriptorUsed":Z
    move-wide/from16 v13, v28

    move-object v2, v15

    .end local v15    # "entryName":Ljava/lang/String;
    .local v2, "entryName":Ljava/lang/String;
    move/from16 v15, v26

    move-wide/from16 v16, v31

    invoke-direct/range {v4 .. v17}, Lcom/android/apksig/internal/zip/LocalFileRecord;-><init>(Ljava/lang/String;ILjava/nio/ByteBuffer;JJIJZJ)V

    return-object v37

    .line 236
    .end local v2    # "entryName":Ljava/lang/String;
    .end local v19    # "dataStartOffsetInRecord":I
    .end local v31    # "uncompressedDataSizeFromCdRecord":J
    .end local v38    # "recordEndOffset":J
    .end local v40    # "extra":Ljava/nio/ByteBuffer;
    .end local v41    # "uncompressedDataCrc32FromCdRecord":J
    .end local v43    # "dataDescriptorUsed":Z
    .end local v44    # "recordSize":J
    .end local v46    # "dataEndOffset":J
    .end local v48    # "extraLength":I
    .end local v49    # "name":Ljava/lang/String;
    .end local v50    # "cdRecordEntryNameSizeBytes":I
    .end local v51    # "recordSignature":I
    .end local v52    # "cdDataDescriptorUsed":Z
    .local v0, "nameLength":I
    .restart local v1    # "dataEndOffset":J
    .local v3, "uncompressedDataSizeFromCdRecord":J
    .restart local v6    # "dataStartOffset":J
    .local v8, "uncompressedDataCrc32FromCdRecord":J
    .restart local v10    # "extraLength":I
    .restart local v14    # "cdRecordEntryNameSizeBytes":I
    .restart local v15    # "entryName":Ljava/lang/String;
    .local v23, "dataDescriptorUsed":Z
    .local v27, "recordSignature":I
    .restart local v30    # "cdDataDescriptorUsed":Z
    .restart local v33    # "header":Ljava/nio/ByteBuffer;
    .restart local v34    # "name":Ljava/lang/String;
    :cond_d
    move-wide/from16 v46, v1

    move-wide/from16 v31, v3

    move-wide/from16 v41, v8

    move-object v2, v15

    move/from16 v43, v23

    move/from16 v23, v0

    move-wide v0, v6

    move-object/from16 v7, v19

    .end local v1    # "dataEndOffset":J
    .end local v3    # "uncompressedDataSizeFromCdRecord":J
    .end local v6    # "dataStartOffset":J
    .end local v8    # "uncompressedDataCrc32FromCdRecord":J
    .end local v15    # "entryName":Ljava/lang/String;
    .local v0, "dataStartOffset":J
    .restart local v2    # "entryName":Ljava/lang/String;
    .local v23, "nameLength":I
    .restart local v31    # "uncompressedDataSizeFromCdRecord":J
    .restart local v41    # "uncompressedDataCrc32FromCdRecord":J
    .restart local v43    # "dataDescriptorUsed":Z
    .restart local v46    # "dataEndOffset":J
    new-instance v3, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Local File Header data of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " overlaps with Central Directory. LFH data start: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", LFH data end: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v5, v46

    .end local v46    # "dataEndOffset":J
    .local v5, "dataEndOffset":J
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v8, p2

    invoke-virtual {v4, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 220
    .end local v2    # "entryName":Ljava/lang/String;
    .end local v5    # "dataEndOffset":J
    .end local v10    # "extraLength":I
    .end local v26    # "compressed":Z
    .end local v28    # "dataSize":J
    .end local v31    # "uncompressedDataSizeFromCdRecord":J
    .end local v33    # "header":Ljava/nio/ByteBuffer;
    .end local v34    # "name":Ljava/lang/String;
    .end local v35    # "compressedDataSizeFromCdRecord":J
    .end local v41    # "uncompressedDataCrc32FromCdRecord":J
    .end local v43    # "dataDescriptorUsed":Z
    .local v0, "nameLength":I
    .local v1, "compressedDataSizeFromCdRecord":J
    .restart local v3    # "uncompressedDataSizeFromCdRecord":J
    .restart local v8    # "uncompressedDataCrc32FromCdRecord":J
    .restart local v12    # "name":Ljava/lang/String;
    .local v13, "header":Ljava/nio/ByteBuffer;
    .restart local v15    # "entryName":Ljava/lang/String;
    .local v23, "dataDescriptorUsed":Z
    :cond_e
    move-wide/from16 v35, v1

    move-wide/from16 v31, v3

    move-object/from16 v49, v12

    move-object v2, v15

    move/from16 v43, v23

    move/from16 v23, v0

    .end local v0    # "nameLength":I
    .end local v1    # "compressedDataSizeFromCdRecord":J
    .end local v3    # "uncompressedDataSizeFromCdRecord":J
    .end local v12    # "name":Ljava/lang/String;
    .end local v15    # "entryName":Ljava/lang/String;
    .restart local v2    # "entryName":Ljava/lang/String;
    .local v23, "nameLength":I
    .restart local v31    # "uncompressedDataSizeFromCdRecord":J
    .restart local v35    # "compressedDataSizeFromCdRecord":J
    .restart local v43    # "dataDescriptorUsed":Z
    .restart local v49    # "name":Ljava/lang/String;
    new-instance v0, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Name mismatch between Local File Header and Central Directory. LFH: \""

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v3, v49

    .end local v49    # "name":Ljava/lang/String;
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "\", CD: \""

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "\""

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 213
    .end local v2    # "entryName":Ljava/lang/String;
    .end local v31    # "uncompressedDataSizeFromCdRecord":J
    .end local v35    # "compressedDataSizeFromCdRecord":J
    .end local v43    # "dataDescriptorUsed":Z
    .restart local v0    # "nameLength":I
    .restart local v1    # "compressedDataSizeFromCdRecord":J
    .local v3, "uncompressedDataSizeFromCdRecord":J
    .restart local v15    # "entryName":Ljava/lang/String;
    .local v23, "dataDescriptorUsed":Z
    :cond_f
    move-wide/from16 v35, v1

    move-wide/from16 v31, v3

    move/from16 v50, v14

    move-object v2, v15

    move/from16 v43, v23

    move/from16 v23, v0

    .end local v0    # "nameLength":I
    .end local v1    # "compressedDataSizeFromCdRecord":J
    .end local v3    # "uncompressedDataSizeFromCdRecord":J
    .end local v14    # "cdRecordEntryNameSizeBytes":I
    .end local v15    # "entryName":Ljava/lang/String;
    .restart local v2    # "entryName":Ljava/lang/String;
    .local v23, "nameLength":I
    .restart local v31    # "uncompressedDataSizeFromCdRecord":J
    .restart local v35    # "compressedDataSizeFromCdRecord":J
    .restart local v43    # "dataDescriptorUsed":Z
    .restart local v50    # "cdRecordEntryNameSizeBytes":I
    new-instance v0, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Name mismatch between Local File Header and Central Directory for entry"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v3, v23

    .end local v23    # "nameLength":I
    .local v3, "nameLength":I
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " bytes, CD: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v4, v50

    .end local v50    # "cdRecordEntryNameSizeBytes":I
    .local v4, "cdRecordEntryNameSizeBytes":I
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, " bytes"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 180
    .end local v2    # "entryName":Ljava/lang/String;
    .end local v3    # "nameLength":I
    .end local v4    # "cdRecordEntryNameSizeBytes":I
    .end local v21    # "headerEndOffset":J
    .end local v24    # "headerStartOffset":J
    .end local v27    # "recordSignature":I
    .end local v30    # "cdDataDescriptorUsed":Z
    .end local v31    # "uncompressedDataSizeFromCdRecord":J
    .end local v35    # "compressedDataSizeFromCdRecord":J
    .end local v43    # "dataDescriptorUsed":Z
    .local v0, "header":Ljava/nio/ByteBuffer;
    .local v5, "dataDescriptorUsed":Z
    .local v8, "headerEndOffset":J
    .local v10, "headerStartOffset":J
    .local v12, "recordSignature":I
    .local v13, "cdRecordEntryNameSizeBytes":I
    .local v14, "cdDataDescriptorUsed":Z
    .restart local v15    # "entryName":Ljava/lang/String;
    :cond_10
    move-object/from16 v27, v0

    move/from16 v43, v5

    move-wide/from16 v21, v8

    move/from16 v52, v14

    move-wide v8, v2

    move-object v2, v15

    .end local v0    # "header":Ljava/nio/ByteBuffer;
    .end local v5    # "dataDescriptorUsed":Z
    .end local v8    # "headerEndOffset":J
    .end local v14    # "cdDataDescriptorUsed":Z
    .end local v15    # "entryName":Ljava/lang/String;
    .restart local v2    # "entryName":Ljava/lang/String;
    .restart local v21    # "headerEndOffset":J
    .local v27, "header":Ljava/nio/ByteBuffer;
    .restart local v43    # "dataDescriptorUsed":Z
    .restart local v52    # "cdDataDescriptorUsed":Z
    new-instance v0, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Data Descriptor presence mismatch between Local File Header and Central Directory for entry "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v3, v43

    .end local v43    # "dataDescriptorUsed":Z
    .local v3, "dataDescriptorUsed":Z
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v5, v52

    .end local v52    # "cdDataDescriptorUsed":Z
    .local v5, "cdDataDescriptorUsed":Z
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 171
    .end local v2    # "entryName":Ljava/lang/String;
    .end local v3    # "dataDescriptorUsed":Z
    .end local v5    # "cdDataDescriptorUsed":Z
    .end local v18    # "gpFlags":S
    .end local v20    # "headerSizeWithName":I
    .end local v21    # "headerEndOffset":J
    .end local v27    # "header":Ljava/nio/ByteBuffer;
    .restart local v0    # "header":Ljava/nio/ByteBuffer;
    .restart local v8    # "headerEndOffset":J
    .local v14, "headerSizeWithName":I
    .restart local v15    # "entryName":Ljava/lang/String;
    :cond_11
    move-object/from16 v27, v0

    move-wide/from16 v21, v8

    move-wide/from16 v24, v10

    move/from16 v51, v12

    move-wide v8, v2

    move-object v2, v15

    .end local v0    # "header":Ljava/nio/ByteBuffer;
    .end local v8    # "headerEndOffset":J
    .end local v10    # "headerStartOffset":J
    .end local v12    # "recordSignature":I
    .end local v15    # "entryName":Ljava/lang/String;
    .restart local v2    # "entryName":Ljava/lang/String;
    .restart local v21    # "headerEndOffset":J
    .restart local v24    # "headerStartOffset":J
    .restart local v27    # "header":Ljava/nio/ByteBuffer;
    .restart local v51    # "recordSignature":I
    new-instance v0, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Not a Local File Header record for entry "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ". Signature: 0x"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v3, v51

    .end local v51    # "recordSignature":I
    .local v3, "recordSignature":I
    int-to-long v5, v3

    const-wide v10, 0xffffffffL

    and-long/2addr v5, v10

    .line 173
    invoke-static {v5, v6}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 164
    .end local v2    # "entryName":Ljava/lang/String;
    .end local v3    # "recordSignature":I
    .end local v21    # "headerEndOffset":J
    .end local v24    # "headerStartOffset":J
    .end local v27    # "header":Ljava/nio/ByteBuffer;
    .restart local v8    # "headerEndOffset":J
    .restart local v10    # "headerStartOffset":J
    .restart local v15    # "entryName":Ljava/lang/String;
    :catch_0
    move-exception v0

    move-wide/from16 v21, v8

    move-wide/from16 v24, v10

    move v4, v13

    move/from16 v20, v14

    move-wide v8, v2

    move-object v2, v15

    move-object v1, v0

    .end local v8    # "headerEndOffset":J
    .end local v10    # "headerStartOffset":J
    .end local v13    # "cdRecordEntryNameSizeBytes":I
    .end local v14    # "headerSizeWithName":I
    .end local v15    # "entryName":Ljava/lang/String;
    .restart local v2    # "entryName":Ljava/lang/String;
    .restart local v4    # "cdRecordEntryNameSizeBytes":I
    .restart local v20    # "headerSizeWithName":I
    .restart local v21    # "headerEndOffset":J
    .restart local v24    # "headerStartOffset":J
    move-object v0, v1

    .line 165
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to read Local File Header of "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 156
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "entryName":Ljava/lang/String;
    .end local v4    # "cdRecordEntryNameSizeBytes":I
    .end local v20    # "headerSizeWithName":I
    .end local v21    # "headerEndOffset":J
    .end local v24    # "headerStartOffset":J
    .restart local v8    # "headerEndOffset":J
    .restart local v10    # "headerStartOffset":J
    .restart local v13    # "cdRecordEntryNameSizeBytes":I
    .restart local v14    # "headerSizeWithName":I
    .restart local v15    # "entryName":Ljava/lang/String;
    :cond_12
    move-object v7, v4

    move-wide/from16 v21, v8

    move-wide/from16 v24, v10

    move-wide v8, v2

    move-object v2, v15

    .end local v8    # "headerEndOffset":J
    .end local v10    # "headerStartOffset":J
    .end local v15    # "entryName":Ljava/lang/String;
    .restart local v2    # "entryName":Ljava/lang/String;
    .restart local v21    # "headerEndOffset":J
    .restart local v24    # "headerStartOffset":J
    new-instance v0, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Local File Header of "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " extends beyond start of Central Directory. LFH end: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-wide/from16 v10, v21

    .end local v21    # "headerEndOffset":J
    .local v10, "headerEndOffset":J
    invoke-virtual {v1, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)[B
    .locals 4
    .param p0, "source"    # Lcom/android/apksig/util/DataSource;
    .param p1, "cdRecord"    # Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .param p2, "cdStartOffsetInArchive"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "source",
            "cdRecord",
            "cdStartOffsetInArchive"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/zip/ZipFormatException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 444
    invoke-virtual {p1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getUncompressedSize()J

    move-result-wide v0

    const-wide/32 v2, 0x7fffffff

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 448
    invoke-virtual {p1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getUncompressedSize()J

    move-result-wide v0

    long-to-int v0, v0

    new-array v0, v0, [B

    .line 449
    .local v0, "result":[B
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 450
    .local v1, "resultBuf":Ljava/nio/ByteBuffer;
    new-instance v2, Lcom/android/apksig/internal/util/ByteBufferSink;

    invoke-direct {v2, v1}, Lcom/android/apksig/internal/util/ByteBufferSink;-><init>(Ljava/nio/ByteBuffer;)V

    .line 451
    .local v2, "resultSink":Lcom/android/apksig/internal/util/ByteBufferSink;
    invoke-static {p0, p1, p2, p3, v2}, Lcom/android/apksig/internal/zip/LocalFileRecord;->outputUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;JLcom/android/apksig/util/DataSink;)V

    .line 456
    return-object v0

    .line 445
    .end local v0    # "result":[B
    .end local v1    # "resultBuf":Ljava/nio/ByteBuffer;
    .end local v2    # "resultSink":Lcom/android/apksig/internal/util/ByteBufferSink;
    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 446
    invoke-virtual {p1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " too large: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getUncompressedSize()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static outputRecordWithDeflateCompressedData(Ljava/lang/String;II[BJJLcom/android/apksig/util/DataSink;)J
    .locals 17
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "lastModifiedTime"    # I
    .param p2, "lastModifiedDate"    # I
    .param p3, "compressedData"    # [B
    .param p4, "crc32"    # J
    .param p6, "uncompressedSize"    # J
    .param p8, "output"    # Lcom/android/apksig/util/DataSink;
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
            "compressedData",
            "crc32",
            "uncompressedSize",
            "output"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 344
    move-object/from16 v0, p3

    move-object/from16 v1, p8

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    move-object/from16 v3, p0

    invoke-virtual {v3, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    .line 345
    .local v2, "nameBytes":[B
    array-length v4, v2

    add-int/lit8 v4, v4, 0x1e

    .line 346
    .local v4, "recordSize":I
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 347
    .local v5, "result":Ljava/nio/ByteBuffer;
    sget-object v6, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 348
    const v6, 0x4034b50

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 349
    const/16 v6, 0x14

    invoke-static {v5, v6}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 350
    const/16 v6, 0x800

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 351
    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 352
    move/from16 v6, p1

    invoke-static {v5, v6}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 353
    move/from16 v7, p2

    invoke-static {v5, v7}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 354
    move-wide/from16 v8, p4

    invoke-static {v5, v8, v9}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt32(Ljava/nio/ByteBuffer;J)V

    .line 355
    array-length v10, v0

    int-to-long v10, v10

    invoke-static {v5, v10, v11}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt32(Ljava/nio/ByteBuffer;J)V

    .line 356
    move-wide/from16 v10, p6

    invoke-static {v5, v10, v11}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt32(Ljava/nio/ByteBuffer;J)V

    .line 357
    array-length v12, v2

    invoke-static {v5, v12}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 358
    const/4 v12, 0x0

    invoke-static {v5, v12}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 359
    invoke-virtual {v5, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 360
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v13

    if-nez v13, :cond_0

    .line 363
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 365
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v13

    int-to-long v13, v13

    .line 366
    .local v13, "outputByteCount":J
    invoke-interface {v1, v5}, Lcom/android/apksig/util/DataSink;->consume(Ljava/nio/ByteBuffer;)V

    .line 367
    array-length v15, v0

    move-object/from16 v16, v2

    .end local v2    # "nameBytes":[B
    .local v16, "nameBytes":[B
    int-to-long v2, v15

    add-long/2addr v13, v2

    .line 368
    array-length v2, v0

    invoke-interface {v1, v0, v12, v2}, Lcom/android/apksig/util/DataSink;->consume([BII)V

    .line 369
    return-wide v13

    .line 361
    .end local v13    # "outputByteCount":J
    .end local v16    # "nameBytes":[B
    .restart local v2    # "nameBytes":[B
    :cond_0
    move-object/from16 v16, v2

    .end local v2    # "nameBytes":[B
    .restart local v16    # "nameBytes":[B
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "pos: "

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->position()I

    move-result v12

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v12, ", limit: "

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->limit()I

    move-result v12

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static outputUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;JLcom/android/apksig/util/DataSink;)V
    .locals 6
    .param p0, "source"    # Lcom/android/apksig/util/DataSource;
    .param p1, "cdRecord"    # Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .param p2, "cdStartOffsetInArchive"    # J
    .param p4, "sink"    # Lcom/android/apksig/util/DataSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "source",
            "cdRecord",
            "cdStartOffsetInArchive",
            "sink"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/zip/ZipFormatException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 426
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 427
    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    invoke-static/range {v0 .. v5}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getRecord(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;JZZ)Lcom/android/apksig/internal/zip/LocalFileRecord;

    move-result-object v0

    .line 434
    .local v0, "lfhRecord":Lcom/android/apksig/internal/zip/LocalFileRecord;
    invoke-virtual {v0, p0, p4}, Lcom/android/apksig/internal/zip/LocalFileRecord;->outputUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSink;)V

    .line 435
    return-void
.end method


# virtual methods
.method public getDataStartOffsetInRecord()I
    .locals 1

    .line 101
    iget v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mDataStartOffset:I

    return v0
.end method

.method public getExtra()Ljava/nio/ByteBuffer;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mExtra:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mExtra:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mExtra:Ljava/nio/ByteBuffer;

    :goto_0
    return-object v0
.end method

.method public getExtraFieldStartOffsetInsideRecord()I
    .locals 1

    .line 93
    iget v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mNameSizeBytes:I

    add-int/lit8 v0, v0, 0x1e

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()J
    .locals 2

    .line 108
    iget-wide v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mSize:J

    return-wide v0
.end method

.method public getStartOffsetInArchive()J
    .locals 2

    .line 97
    iget-wide v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mStartOffsetInArchive:J

    return-wide v0
.end method

.method public isDataCompressed()Z
    .locals 1

    .line 115
    iget-boolean v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mDataCompressed:Z

    return v0
.end method

.method public outputRecord(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSink;)J
    .locals 8
    .param p1, "sourceApk"    # Lcom/android/apksig/util/DataSource;
    .param p2, "output"    # Lcom/android/apksig/util/DataSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "sourceApk",
            "output"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 300
    invoke-virtual {p0}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getSize()J

    move-result-wide v6

    .line 301
    .local v6, "size":J
    invoke-virtual {p0}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getStartOffsetInArchive()J

    move-result-wide v1

    move-object v0, p1

    move-wide v3, v6

    move-object v5, p2

    invoke-interface/range {v0 .. v5}, Lcom/android/apksig/util/DataSource;->feed(JJLcom/android/apksig/util/DataSink;)V

    .line 302
    return-wide v6
.end method

.method public outputRecordWithModifiedExtra(Lcom/android/apksig/util/DataSource;Ljava/nio/ByteBuffer;Lcom/android/apksig/util/DataSink;)J
    .locals 18
    .param p1, "sourceApk"    # Lcom/android/apksig/util/DataSource;
    .param p2, "extra"    # Ljava/nio/ByteBuffer;
    .param p3, "output"    # Lcom/android/apksig/util/DataSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "sourceApk",
            "extra",
            "output"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 313
    invoke-virtual/range {p0 .. p0}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getStartOffsetInArchive()J

    move-result-wide v0

    .line 314
    .local v0, "recordStartOffsetInSource":J
    invoke-virtual/range {p0 .. p0}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getExtraFieldStartOffsetInsideRecord()I

    move-result v2

    .line 315
    .local v2, "extraStartOffsetInRecord":I
    invoke-virtual/range {p2 .. p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v3

    .line 316
    .local v3, "extraSizeBytes":I
    add-int v4, v2, v3

    .line 317
    .local v4, "headerSize":I
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 318
    .local v5, "header":Ljava/nio/ByteBuffer;
    sget-object v6, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 319
    move-object/from16 v6, p1

    invoke-interface {v6, v0, v1, v2, v5}, Lcom/android/apksig/util/DataSource;->copyTo(JILjava/nio/ByteBuffer;)V

    .line 320
    invoke-virtual/range {p2 .. p2}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 321
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 322
    const/16 v7, 0x1c

    invoke-static {v5, v7, v3}, Lcom/android/apksig/internal/zip/ZipUtils;->setUnsignedInt16(Ljava/nio/ByteBuffer;II)V

    .line 324
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v7

    int-to-long v13, v7

    .line 325
    .local v13, "outputByteCount":J
    move-object/from16 v15, p3

    invoke-interface {v15, v5}, Lcom/android/apksig/util/DataSink;->consume(Ljava/nio/ByteBuffer;)V

    .line 326
    invoke-virtual/range {p0 .. p0}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getSize()J

    move-result-wide v7

    move-object/from16 v12, p0

    iget v9, v12, Lcom/android/apksig/internal/zip/LocalFileRecord;->mDataStartOffset:I

    int-to-long v10, v9

    sub-long v16, v7, v10

    .line 327
    .local v16, "remainingRecordSize":J
    int-to-long v7, v9

    add-long v8, v0, v7

    move-object/from16 v7, p1

    move-wide/from16 v10, v16

    move-object/from16 v12, p3

    invoke-interface/range {v7 .. v12}, Lcom/android/apksig/util/DataSource;->feed(JJLcom/android/apksig/util/DataSink;)V

    .line 328
    add-long v13, v13, v16

    .line 329
    return-wide v13
.end method

.method public outputUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSink;)V
    .locals 10
    .param p1, "lfhSection"    # Lcom/android/apksig/util/DataSource;
    .param p2, "sink"    # Lcom/android/apksig/util/DataSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "lfhSection",
            "sink"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/zip/ZipFormatException;
        }
    .end annotation

    .line 380
    iget-wide v0, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mStartOffsetInArchive:J

    iget v2, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mDataStartOffset:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    .line 382
    .local v0, "dataStartOffsetInArchive":J
    :try_start_0
    iget-boolean v2, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mDataCompressed:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v2, :cond_2

    .line 383
    :try_start_1
    new-instance v9, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;

    const/4 v2, 0x0

    invoke-direct {v9, p2, v2}, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;-><init>(Lcom/android/apksig/util/DataSink;Lcom/android/apksig/internal/zip/LocalFileRecord$1;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 384
    .local v9, "inflateAdapter":Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;
    :try_start_2
    iget-wide v7, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mDataSize:J

    move-object v4, p1

    move-wide v5, v0

    invoke-interface/range {v4 .. v9}, Lcom/android/apksig/util/DataSource;->feed(JJLcom/android/apksig/util/DataSink;)V

    .line 385
    invoke-virtual {v9}, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->getOutputByteCount()J

    move-result-wide v2

    .line 386
    .local v2, "actualUncompressedSize":J
    iget-wide v4, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mUncompressedDataSize:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    cmp-long v4, v2, v4

    if-nez v4, :cond_0

    .line 392
    .end local v2    # "actualUncompressedSize":J
    :try_start_3
    invoke-virtual {v9}, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 397
    .end local v9    # "inflateAdapter":Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;
    goto/16 :goto_1

    .line 387
    .restart local v2    # "actualUncompressedSize":J
    .restart local v9    # "inflateAdapter":Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;
    :cond_0
    :try_start_4
    new-instance v4, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected size of uncompressed data of "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ". Expected: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mUncompressedDataSize:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " bytes, actual: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " bytes"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    .end local v0    # "dataStartOffsetInArchive":J
    .end local v9    # "inflateAdapter":Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;
    .end local p1    # "lfhSection":Lcom/android/apksig/util/DataSource;
    .end local p2    # "sink":Lcom/android/apksig/util/DataSink;
    throw v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 383
    .end local v2    # "actualUncompressedSize":J
    .restart local v0    # "dataStartOffsetInArchive":J
    .restart local v9    # "inflateAdapter":Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;
    .restart local p1    # "lfhSection":Lcom/android/apksig/util/DataSource;
    .restart local p2    # "sink":Lcom/android/apksig/util/DataSink;
    :catchall_0
    move-exception v2

    :try_start_5
    invoke-virtual {v9}, Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v3

    :try_start_6
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "dataStartOffsetInArchive":J
    .end local p1    # "lfhSection":Lcom/android/apksig/util/DataSource;
    .end local p2    # "sink":Lcom/android/apksig/util/DataSink;
    :goto_0
    throw v2
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    .line 392
    .end local v9    # "inflateAdapter":Lcom/android/apksig/internal/zip/LocalFileRecord$InflateSinkAdapter;
    .restart local v0    # "dataStartOffsetInArchive":J
    .restart local p1    # "lfhSection":Lcom/android/apksig/util/DataSource;
    .restart local p2    # "sink":Lcom/android/apksig/util/DataSink;
    :catch_0
    move-exception v2

    .line 393
    .local v2, "e":Ljava/io/IOException;
    :try_start_7
    invoke-virtual {v2}, Ljava/io/IOException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    instance-of v3, v3, Ljava/util/zip/DataFormatException;

    if-eqz v3, :cond_1

    .line 394
    new-instance v3, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Data of entry "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " malformed"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "dataStartOffsetInArchive":J
    .end local p1    # "lfhSection":Lcom/android/apksig/util/DataSource;
    .end local p2    # "sink":Lcom/android/apksig/util/DataSink;
    throw v3

    .line 396
    .restart local v0    # "dataStartOffsetInArchive":J
    .restart local p1    # "lfhSection":Lcom/android/apksig/util/DataSource;
    .restart local p2    # "sink":Lcom/android/apksig/util/DataSink;
    :cond_1
    nop

    .end local v0    # "dataStartOffsetInArchive":J
    .end local p1    # "lfhSection":Lcom/android/apksig/util/DataSource;
    .end local p2    # "sink":Lcom/android/apksig/util/DataSink;
    throw v2

    .line 399
    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "dataStartOffsetInArchive":J
    .restart local p1    # "lfhSection":Lcom/android/apksig/util/DataSource;
    .restart local p2    # "sink":Lcom/android/apksig/util/DataSink;
    :cond_2
    iget-wide v7, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mDataSize:J

    move-object v4, p1

    move-wide v5, v0

    move-object v9, p2

    invoke-interface/range {v4 .. v9}, Lcom/android/apksig/util/DataSource;->feed(JJLcom/android/apksig/util/DataSink;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    .line 408
    :goto_1
    nop

    .line 411
    return-void

    .line 403
    :catch_1
    move-exception v2

    .line 404
    .restart local v2    # "e":Ljava/io/IOException;
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to read data of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 405
    iget-boolean v5, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mDataCompressed:Z

    if-eqz v5, :cond_3

    const-string v5, "compressed"

    goto :goto_2

    :cond_3
    const-string v5, "uncompressed"

    :goto_2
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " entry "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/android/apksig/internal/zip/LocalFileRecord;->mName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method
