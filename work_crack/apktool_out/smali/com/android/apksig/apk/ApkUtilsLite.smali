.class public Lcom/android/apksig/apk/ApkUtilsLite;
.super Ljava/lang/Object;
.source "ApkUtilsLite.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/apk/ApkUtilsLite$ApkSigningBlock;
    }
.end annotation


# static fields
.field private static final APK_SIG_BLOCK_MAGIC_HI:J = 0x3234206b636f6c42L

.field private static final APK_SIG_BLOCK_MAGIC_LO:J = 0x20676953204b5041L

.field private static final APK_SIG_BLOCK_MIN_SIZE:I = 0x20


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static computeSha256DigestBytes([B)[B
    .locals 3
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .line 192
    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    .local v0, "messageDigest":Ljava/security/MessageDigest;
    nop

    .line 196
    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 197
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    return-object v1

    .line 193
    .end local v0    # "messageDigest":Ljava/security/MessageDigest;
    :catch_0
    move-exception v0

    .line 194
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "SHA-256 is not found"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static findApkSigningBlock(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/zip/ZipSections;)Lcom/android/apksig/apk/ApkUtilsLite$ApkSigningBlock;
    .locals 19
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "zipSections"    # Lcom/android/apksig/zip/ZipSections;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apk",
            "zipSections"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkSigningBlockNotFoundException;
        }
    .end annotation

    .line 104
    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/zip/ZipSections;->getZipCentralDirectoryOffset()J

    move-result-wide v1

    .line 105
    .local v1, "centralDirStartOffset":J
    nop

    .line 106
    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/zip/ZipSections;->getZipCentralDirectorySizeBytes()J

    move-result-wide v3

    add-long/2addr v3, v1

    .line 107
    .local v3, "centralDirEndOffset":J
    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/zip/ZipSections;->getZipEndOfCentralDirectoryOffset()J

    move-result-wide v5

    .line 108
    .local v5, "eocdStartOffset":J
    cmp-long v7, v3, v5

    if-nez v7, :cond_6

    .line 115
    const-wide/16 v7, 0x20

    cmp-long v7, v1, v7

    if-ltz v7, :cond_5

    .line 123
    const-wide/16 v7, 0x18

    sub-long v7, v1, v7

    const/16 v9, 0x18

    invoke-interface {v0, v7, v8, v9}, Lcom/android/apksig/util/DataSource;->getByteBuffer(JI)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 124
    .local v7, "footer":Ljava/nio/ByteBuffer;
    sget-object v8, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v7, v8}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 125
    const/16 v8, 0x8

    invoke-virtual {v7, v8}, Ljava/nio/ByteBuffer;->getLong(I)J

    move-result-wide v9

    const-wide v11, 0x20676953204b5041L

    cmp-long v9, v9, v11

    if-nez v9, :cond_4

    .line 126
    const/16 v9, 0x10

    invoke-virtual {v7, v9}, Ljava/nio/ByteBuffer;->getLong(I)J

    move-result-wide v9

    const-wide v11, 0x3234206b636f6c42L    # 7.465385175170059E-67

    cmp-long v9, v9, v11

    if-nez v9, :cond_3

    .line 131
    const/4 v9, 0x0

    invoke-virtual {v7, v9}, Ljava/nio/ByteBuffer;->getLong(I)J

    move-result-wide v10

    .line 132
    .local v10, "apkSigBlockSizeInFooter":J
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v12

    int-to-long v12, v12

    cmp-long v12, v10, v12

    if-ltz v12, :cond_2

    const-wide/32 v12, 0x7ffffff7

    cmp-long v12, v10, v12

    if-gtz v12, :cond_2

    .line 137
    const-wide/16 v12, 0x8

    add-long/2addr v12, v10

    long-to-int v12, v12

    .line 138
    .local v12, "totalSize":I
    int-to-long v13, v12

    sub-long v13, v1, v13

    .line 139
    .local v13, "apkSigBlockOffset":J
    const-wide/16 v15, 0x0

    cmp-long v15, v13, v15

    if-ltz v15, :cond_1

    .line 143
    invoke-interface {v0, v13, v14, v8}, Lcom/android/apksig/util/DataSource;->getByteBuffer(JI)Ljava/nio/ByteBuffer;

    move-result-object v8

    .line 144
    .local v8, "apkSigBlock":Ljava/nio/ByteBuffer;
    sget-object v15, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v8, v15}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 145
    move-wide v15, v5

    .end local v5    # "eocdStartOffset":J
    .local v15, "eocdStartOffset":J
    invoke-virtual {v8, v9}, Ljava/nio/ByteBuffer;->getLong(I)J

    move-result-wide v5

    .line 146
    .local v5, "apkSigBlockSizeInHeader":J
    cmp-long v9, v5, v10

    if-nez v9, :cond_0

    .line 151
    new-instance v9, Lcom/android/apksig/apk/ApkUtilsLite$ApkSigningBlock;

    move-object/from16 v17, v7

    move-object/from16 v18, v8

    .end local v7    # "footer":Ljava/nio/ByteBuffer;
    .end local v8    # "apkSigBlock":Ljava/nio/ByteBuffer;
    .local v17, "footer":Ljava/nio/ByteBuffer;
    .local v18, "apkSigBlock":Ljava/nio/ByteBuffer;
    int-to-long v7, v12

    invoke-interface {v0, v13, v14, v7, v8}, Lcom/android/apksig/util/DataSource;->slice(JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v7

    invoke-direct {v9, v13, v14, v7}, Lcom/android/apksig/apk/ApkUtilsLite$ApkSigningBlock;-><init>(JLcom/android/apksig/util/DataSource;)V

    return-object v9

    .line 147
    .end local v17    # "footer":Ljava/nio/ByteBuffer;
    .end local v18    # "apkSigBlock":Ljava/nio/ByteBuffer;
    .restart local v7    # "footer":Ljava/nio/ByteBuffer;
    .restart local v8    # "apkSigBlock":Ljava/nio/ByteBuffer;
    :cond_0
    move-object/from16 v17, v7

    move-object/from16 v18, v8

    .end local v7    # "footer":Ljava/nio/ByteBuffer;
    .end local v8    # "apkSigBlock":Ljava/nio/ByteBuffer;
    .restart local v17    # "footer":Ljava/nio/ByteBuffer;
    .restart local v18    # "apkSigBlock":Ljava/nio/ByteBuffer;
    new-instance v7, Lcom/android/apksig/apk/ApkSigningBlockNotFoundException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "APK Signing Block sizes in header and footer do not match: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " vs "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/android/apksig/apk/ApkSigningBlockNotFoundException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 140
    .end local v15    # "eocdStartOffset":J
    .end local v17    # "footer":Ljava/nio/ByteBuffer;
    .end local v18    # "apkSigBlock":Ljava/nio/ByteBuffer;
    .local v5, "eocdStartOffset":J
    .restart local v7    # "footer":Ljava/nio/ByteBuffer;
    :cond_1
    move-wide v15, v5

    move-object/from16 v17, v7

    .end local v5    # "eocdStartOffset":J
    .end local v7    # "footer":Ljava/nio/ByteBuffer;
    .restart local v15    # "eocdStartOffset":J
    .restart local v17    # "footer":Ljava/nio/ByteBuffer;
    new-instance v5, Lcom/android/apksig/apk/ApkSigningBlockNotFoundException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "APK Signing Block offset out of range: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/android/apksig/apk/ApkSigningBlockNotFoundException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 132
    .end local v12    # "totalSize":I
    .end local v13    # "apkSigBlockOffset":J
    .end local v15    # "eocdStartOffset":J
    .end local v17    # "footer":Ljava/nio/ByteBuffer;
    .restart local v5    # "eocdStartOffset":J
    .restart local v7    # "footer":Ljava/nio/ByteBuffer;
    :cond_2
    move-wide v15, v5

    move-object/from16 v17, v7

    .line 134
    .end local v5    # "eocdStartOffset":J
    .end local v7    # "footer":Ljava/nio/ByteBuffer;
    .restart local v15    # "eocdStartOffset":J
    .restart local v17    # "footer":Ljava/nio/ByteBuffer;
    new-instance v5, Lcom/android/apksig/apk/ApkSigningBlockNotFoundException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "APK Signing Block size out of range: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/android/apksig/apk/ApkSigningBlockNotFoundException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 126
    .end local v10    # "apkSigBlockSizeInFooter":J
    .end local v15    # "eocdStartOffset":J
    .end local v17    # "footer":Ljava/nio/ByteBuffer;
    .restart local v5    # "eocdStartOffset":J
    .restart local v7    # "footer":Ljava/nio/ByteBuffer;
    :cond_3
    move-wide v15, v5

    move-object/from16 v17, v7

    .end local v5    # "eocdStartOffset":J
    .end local v7    # "footer":Ljava/nio/ByteBuffer;
    .restart local v15    # "eocdStartOffset":J
    .restart local v17    # "footer":Ljava/nio/ByteBuffer;
    goto :goto_0

    .line 125
    .end local v15    # "eocdStartOffset":J
    .end local v17    # "footer":Ljava/nio/ByteBuffer;
    .restart local v5    # "eocdStartOffset":J
    .restart local v7    # "footer":Ljava/nio/ByteBuffer;
    :cond_4
    move-wide v15, v5

    move-object/from16 v17, v7

    .line 127
    .end local v5    # "eocdStartOffset":J
    .end local v7    # "footer":Ljava/nio/ByteBuffer;
    .restart local v15    # "eocdStartOffset":J
    .restart local v17    # "footer":Ljava/nio/ByteBuffer;
    :goto_0
    new-instance v5, Lcom/android/apksig/apk/ApkSigningBlockNotFoundException;

    const-string v6, "No APK Signing Block before ZIP Central Directory"

    invoke-direct {v5, v6}, Lcom/android/apksig/apk/ApkSigningBlockNotFoundException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 116
    .end local v15    # "eocdStartOffset":J
    .end local v17    # "footer":Ljava/nio/ByteBuffer;
    .restart local v5    # "eocdStartOffset":J
    :cond_5
    move-wide v15, v5

    .end local v5    # "eocdStartOffset":J
    .restart local v15    # "eocdStartOffset":J
    new-instance v5, Lcom/android/apksig/apk/ApkSigningBlockNotFoundException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "APK too small for APK Signing Block. ZIP Central Directory offset: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/android/apksig/apk/ApkSigningBlockNotFoundException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 109
    .end local v15    # "eocdStartOffset":J
    .restart local v5    # "eocdStartOffset":J
    :cond_6
    move-wide v15, v5

    .end local v5    # "eocdStartOffset":J
    .restart local v15    # "eocdStartOffset":J
    new-instance v5, Lcom/android/apksig/apk/ApkSigningBlockNotFoundException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "ZIP Central Directory is not immediately followed by End of Central Directory. CD end: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", EoCD start: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-wide v7, v15

    .end local v15    # "eocdStartOffset":J
    .local v7, "eocdStartOffset":J
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/android/apksig/apk/ApkSigningBlockNotFoundException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public static findZipSections(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/zip/ZipSections;
    .locals 21
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apk"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/zip/ZipFormatException;
        }
    .end annotation

    .line 46
    nop

    .line 47
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/zip/ZipUtils;->findZipEndOfCentralDirectoryRecord(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v0

    .line 48
    .local v0, "eocdAndOffsetInFile":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/nio/ByteBuffer;Ljava/lang/Long;>;"
    if-eqz v0, :cond_2

    .line 52
    invoke-virtual {v0}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    .line 53
    .local v1, "eocdBuf":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    .line 54
    .local v11, "eocdOffset":J
    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 55
    invoke-static {v1}, Lcom/android/apksig/internal/zip/ZipUtils;->getZipEocdCentralDirectoryOffset(Ljava/nio/ByteBuffer;)J

    move-result-wide v13

    .line 56
    .local v13, "cdStartOffset":J
    cmp-long v2, v13, v11

    if-gtz v2, :cond_1

    .line 62
    invoke-static {v1}, Lcom/android/apksig/internal/zip/ZipUtils;->getZipEocdCentralDirectorySizeBytes(Ljava/nio/ByteBuffer;)J

    move-result-wide v15

    .line 63
    .local v15, "cdSizeBytes":J
    add-long v8, v13, v15

    .line 64
    .local v8, "cdEndOffset":J
    cmp-long v2, v8, v11

    if-gtz v2, :cond_0

    .line 71
    invoke-static {v1}, Lcom/android/apksig/internal/zip/ZipUtils;->getZipEocdCentralDirectoryTotalRecordCount(Ljava/nio/ByteBuffer;)I

    move-result v17

    .line 73
    .local v17, "cdRecordCount":I
    new-instance v18, Lcom/android/apksig/zip/ZipSections;

    move-object/from16 v2, v18

    move-wide v3, v13

    move-wide v5, v15

    move/from16 v7, v17

    move-wide/from16 v19, v13

    move-wide v13, v8

    .end local v8    # "cdEndOffset":J
    .local v13, "cdEndOffset":J
    .local v19, "cdStartOffset":J
    move-wide v8, v11

    move-object v10, v1

    invoke-direct/range {v2 .. v10}, Lcom/android/apksig/zip/ZipSections;-><init>(JJIJLjava/nio/ByteBuffer;)V

    return-object v18

    .line 65
    .end local v17    # "cdRecordCount":I
    .end local v19    # "cdStartOffset":J
    .restart local v8    # "cdEndOffset":J
    .local v13, "cdStartOffset":J
    :cond_0
    move-wide/from16 v19, v13

    move-wide v13, v8

    .end local v8    # "cdEndOffset":J
    .local v13, "cdEndOffset":J
    .restart local v19    # "cdStartOffset":J
    new-instance v2, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ZIP Central Directory overlaps with End of Central Directory. CD end: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", EoCD start: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 57
    .end local v15    # "cdSizeBytes":J
    .end local v19    # "cdStartOffset":J
    .local v13, "cdStartOffset":J
    :cond_1
    move-wide/from16 v19, v13

    .end local v13    # "cdStartOffset":J
    .restart local v19    # "cdStartOffset":J
    new-instance v2, Lcom/android/apksig/zip/ZipFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ZIP Central Directory start offset out of range: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-wide/from16 v4, v19

    .end local v19    # "cdStartOffset":J
    .local v4, "cdStartOffset":J
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, ". ZIP End of Central Directory offset: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 49
    .end local v1    # "eocdBuf":Ljava/nio/ByteBuffer;
    .end local v4    # "cdStartOffset":J
    .end local v11    # "eocdOffset":J
    :cond_2
    new-instance v1, Lcom/android/apksig/zip/ZipFormatException;

    const-string v2, "ZIP End of Central Directory record not found"

    invoke-direct {v1, v2}, Lcom/android/apksig/zip/ZipFormatException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
