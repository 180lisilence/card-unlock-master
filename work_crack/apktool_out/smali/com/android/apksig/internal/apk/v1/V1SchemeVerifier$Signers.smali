.class Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signers;
.super Ljava/lang/Object;
.source "V1SchemeVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Signers"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 209
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/apksig/util/DataSource;JLjava/util/List;Ljava/util/Set;Ljava/util/Map;Ljava/util/Set;IILcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/apksig/util/DataSource;
    .param p1, "x1"    # J
    .param p3, "x2"    # Ljava/util/List;
    .param p4, "x3"    # Ljava/util/Set;
    .param p5, "x4"    # Ljava/util/Map;
    .param p6, "x5"    # Ljava/util/Set;
    .param p7, "x6"    # I
    .param p8, "x7"    # I
    .param p9, "x8"    # Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 209
    invoke-static/range {p0 .. p9}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signers;->verify(Lcom/android/apksig/util/DataSource;JLjava/util/List;Ljava/util/Set;Ljava/util/Map;Ljava/util/Set;IILcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)V

    return-void
.end method

.method private static verify(Lcom/android/apksig/util/DataSource;JLjava/util/List;Ljava/util/Set;Ljava/util/Map;Ljava/util/Set;IILcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)V
    .locals 28
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "cdStartOffset"    # J
    .param p7, "minSdkVersion"    # I
    .param p8, "maxSdkVersion"    # I
    .param p9, "result"    # Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;
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
            "apk",
            "cdStartOffset",
            "cdRecords",
            "cdEntryNames",
            "supportedApkSigSchemeNames",
            "foundApkSigSchemeIds",
            "minSdkVersion",
            "maxSdkVersion",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/DataSource;",
            "J",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/zip/CentralDirectoryRecord;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;II",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 228
    .local p3, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .local p4, "cdEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .local p5, "supportedApkSigSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    .local p6, "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    move-object/from16 v10, p9

    const/4 v0, 0x0

    .line 229
    .local v0, "manifestEntry":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    new-instance v1, Ljava/util/HashMap;

    const/4 v11, 0x1

    invoke-direct {v1, v11}, Ljava/util/HashMap;-><init>(I)V

    move-object v12, v1

    .line 230
    .local v12, "sigFileEntries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v11}, Ljava/util/ArrayList;-><init>(I)V

    move-object v13, v1

    .line 231
    .local v13, "sigBlockEntries":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move-object v14, v0

    .end local v0    # "manifestEntry":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .local v14, "manifestEntry":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const-string v2, ".SF"

    const-string v15, "META-INF/"

    if-eqz v0, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 232
    .local v0, "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    invoke-virtual {v0}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v3

    .line 233
    .local v3, "entryName":Ljava/lang/String;
    invoke-virtual {v3, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 234
    goto :goto_0

    .line 236
    :cond_0
    if-nez v14, :cond_1

    const-string v4, "META-INF/MANIFEST.MF"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 238
    move-object v14, v0

    .line 239
    goto :goto_0

    .line 241
    :cond_1
    invoke-virtual {v3, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 242
    invoke-interface {v12, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 243
    goto :goto_0

    .line 245
    :cond_2
    const-string v2, ".RSA"

    invoke-virtual {v3, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 246
    const-string v2, ".DSA"

    invoke-virtual {v3, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 247
    const-string v2, ".EC"

    invoke-virtual {v3, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_1

    .line 251
    .end local v0    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v3    # "entryName":Ljava/lang/String;
    :cond_3
    goto :goto_0

    .line 248
    .restart local v0    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v3    # "entryName":Ljava/lang/String;
    :cond_4
    :goto_1
    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 249
    goto :goto_0

    .line 252
    .end local v0    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v3    # "entryName":Ljava/lang/String;
    :cond_5
    const/4 v0, 0x0

    if-nez v14, :cond_6

    .line 253
    sget-object v1, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_MANIFEST:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v10, v1, v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$200(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 254
    return-void

    .line 260
    :cond_6
    nop

    .line 261
    move-object/from16 v9, p0

    move-wide/from16 v7, p1

    :try_start_0
    invoke-static {v9, v14, v7, v8}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)[B

    move-result-object v1
    :try_end_0
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 264
    .local v1, "manifestBytes":[B
    nop

    .line 266
    nop

    .line 267
    move-object/from16 v6, p4

    invoke-static {v1, v6, v10}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->parseManifest([BLjava/util/Set;Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v24

    .line 269
    .local v24, "manifestSections":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Lcom/android/apksig/internal/jar/ManifestParser$Section;Ljava/util/Map<Ljava/lang/String;Lcom/android/apksig/internal/jar/ManifestParser$Section;>;>;"
    invoke-static/range {p9 .. p9}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$000(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 270
    return-void

    .line 273
    :cond_7
    invoke-virtual/range {v24 .. v24}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v25, v3

    check-cast v25, Lcom/android/apksig/internal/jar/ManifestParser$Section;

    .line 274
    .local v25, "manifestMainSection":Lcom/android/apksig/internal/jar/ManifestParser$Section;
    nop

    .line 275
    invoke-virtual/range {v24 .. v24}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v26, v3

    check-cast v26, Ljava/util/Map;

    .line 281
    .local v26, "entryNameToManifestSection":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/android/apksig/internal/jar/ManifestParser$Section;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    move-object v4, v3

    .line 282
    .local v4, "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 283
    .local v5, "sigBlockEntry":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    invoke-virtual {v5}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v11

    .line 284
    .local v11, "sigBlockEntryName":Ljava/lang/String;
    const/16 v0, 0x2e

    invoke-virtual {v11, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 285
    .local v0, "extensionDelimiterIndex":I
    move-object/from16 v22, v3

    const/4 v3, -0x1

    if-eq v0, v3, :cond_9

    .line 290
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 291
    const/4 v6, 0x0

    invoke-virtual {v11, v6, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 292
    .local v3, "sigFileEntryName":Ljava/lang/String;
    invoke-interface {v12, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 293
    .local v6, "sigFileEntry":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    if-nez v6, :cond_8

    .line 294
    sget-object v7, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_MISSING_FILE:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v11, v3}, [Ljava/lang/Object;

    move-result-object v8

    invoke-static {v10, v7, v8}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$300(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 296
    move-wide/from16 v7, p1

    move-object/from16 v6, p4

    move-object/from16 v3, v22

    const/4 v0, 0x0

    const/4 v11, 0x1

    goto :goto_2

    .line 298
    :cond_8
    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v11, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    .line 299
    .local v7, "signerName":Ljava/lang/String;
    new-instance v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    .line 301
    move/from16 v23, v0

    .end local v0    # "extensionDelimiterIndex":I
    .local v23, "extensionDelimiterIndex":I
    invoke-virtual {v6}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v27, v2

    const/4 v2, 0x0

    invoke-direct {v8, v7, v11, v0, v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$1;)V

    move-object/from16 v20, v8

    .line 302
    .local v20, "signerInfo":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;
    new-instance v0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;

    const/16 v21, 0x0

    move-object/from16 v16, v0

    move-object/from16 v17, v7

    move-object/from16 v18, v5

    move-object/from16 v19, v6

    invoke-direct/range {v16 .. v21}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;-><init>(Ljava/lang/String;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$1;)V

    .line 303
    .local v0, "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 304
    .end local v0    # "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;
    .end local v3    # "sigFileEntryName":Ljava/lang/String;
    .end local v5    # "sigBlockEntry":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v6    # "sigFileEntry":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v7    # "signerName":Ljava/lang/String;
    .end local v11    # "sigBlockEntryName":Ljava/lang/String;
    .end local v20    # "signerInfo":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;
    .end local v23    # "extensionDelimiterIndex":I
    move-wide/from16 v7, p1

    move-object/from16 v6, p4

    move-object/from16 v3, v22

    move-object/from16 v2, v27

    const/4 v0, 0x0

    const/4 v11, 0x1

    goto :goto_2

    .line 286
    .local v0, "extensionDelimiterIndex":I
    .restart local v5    # "sigBlockEntry":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v11    # "sigBlockEntryName":Ljava/lang/String;
    :cond_9
    move/from16 v23, v0

    .end local v0    # "extensionDelimiterIndex":I
    .restart local v23    # "extensionDelimiterIndex":I
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Signature block file name does not contain extension: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 305
    .end local v5    # "sigBlockEntry":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v11    # "sigBlockEntryName":Ljava/lang/String;
    .end local v23    # "extensionDelimiterIndex":I
    :cond_a
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 306
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v10, v0, v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$200(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 307
    return-void

    .line 313
    :cond_b
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;

    .line 314
    .local v8, "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;
    move-object v2, v8

    move-object/from16 v3, p0

    move-object v11, v4

    .end local v4    # "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .local v11, "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    move-wide/from16 v4, p1

    move/from16 v6, p7

    move/from16 v7, p8

    invoke-virtual/range {v2 .. v7}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->verifySigBlockAgainstSigFile(Lcom/android/apksig/util/DataSource;JII)V

    .line 316
    invoke-virtual {v8}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->getResult()Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    move-result-object v2

    invoke-static {v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$600(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 317
    iget-object v2, v10, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->signers:Ljava/util/List;

    invoke-virtual {v8}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->getResult()Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 319
    .end local v8    # "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;
    :cond_c
    move-object v4, v11

    goto :goto_3

    .line 320
    .end local v11    # "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .restart local v4    # "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    :cond_d
    move-object v11, v4

    .end local v4    # "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .restart local v11    # "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    invoke-static/range {p9 .. p9}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$000(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 321
    return-void

    .line 328
    :cond_e
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 329
    .local v0, "remainingSigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_11

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;

    .line 330
    .local v3, "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;
    move-object/from16 v16, v3

    move-object/from16 v17, v1

    move-object/from16 v18, v25

    move-object/from16 v19, v26

    move-object/from16 v20, p5

    move-object/from16 v21, p6

    move/from16 v22, p7

    move/from16 v23, p8

    invoke-virtual/range {v16 .. v23}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->verifySigFileAgainstManifest([BLcom/android/apksig/internal/jar/ManifestParser$Section;Ljava/util/Map;Ljava/util/Map;Ljava/util/Set;II)V

    .line 338
    invoke-virtual {v3}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->isIgnored()Z

    move-result v4

    if-eqz v4, :cond_f

    .line 339
    iget-object v4, v10, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->ignoredSigners:Ljava/util/List;

    invoke-virtual {v3}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->getResult()Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 341
    :cond_f
    invoke-virtual {v3}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->getResult()Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    move-result-object v4

    invoke-static {v4}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->access$600(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 342
    iget-object v4, v10, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->signers:Ljava/util/List;

    invoke-virtual {v3}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->getResult()Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 344
    :cond_10
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 347
    .end local v3    # "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;
    :goto_5
    goto :goto_4

    .line 348
    :cond_11
    invoke-static/range {p9 .. p9}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$000(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 349
    return-void

    .line 351
    :cond_12
    move-object v6, v0

    .line 352
    .end local v11    # "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .local v6, "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_13

    .line 353
    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v10, v2, v3}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$200(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 354
    return-void

    .line 367
    :cond_13
    nop

    .line 368
    move-object v11, v1

    .end local v1    # "manifestBytes":[B
    .local v11, "manifestBytes":[B
    move-object/from16 v1, p0

    move-wide/from16 v2, p1

    move-object/from16 v4, p3

    move-object/from16 v5, v26

    move/from16 v7, p7

    move/from16 v8, p8

    move-object/from16 v9, p9

    invoke-static/range {v1 .. v9}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->access$700(Lcom/android/apksig/util/DataSource;JLjava/util/Collection;Ljava/util/Map;Ljava/util/List;IILcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)Ljava/util/Set;

    move-result-object v1

    .line 377
    .local v1, "apkSigners":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    invoke-static/range {p9 .. p9}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$000(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 378
    return-void

    .line 389
    :cond_14
    new-instance v2, Ljava/util/HashSet;

    iget-object v3, v10, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->signers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    const/4 v4, 0x1

    add-int/2addr v3, v4

    invoke-direct {v2, v3}, Ljava/util/HashSet;-><init>(I)V

    .line 390
    .local v2, "signatureEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual {v14}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 391
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_15

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;

    .line 392
    .local v4, "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;
    invoke-virtual {v4}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->getSignatureBlockEntryName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 393
    invoke-virtual {v4}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->getSignatureFileEntryName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 394
    .end local v4    # "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;
    goto :goto_6

    .line 395
    :cond_15
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_7
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_17

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 396
    .local v4, "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    invoke-virtual {v4}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v5

    .line 397
    .local v5, "entryName":Ljava/lang/String;
    invoke-virtual {v5, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_16

    .line 398
    const-string v7, "/"

    invoke-virtual {v5, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_16

    .line 399
    invoke-interface {v2, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_16

    .line 400
    sget-object v7, Lcom/android/apksig/ApkVerifier$Issue;->JAR_SIG_UNPROTECTED_ZIP_ENTRY:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v8

    invoke-static {v10, v7, v8}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->access$300(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 402
    .end local v4    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v5    # "entryName":Ljava/lang/String;
    :cond_16
    goto :goto_7

    .line 405
    :cond_17
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_19

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;

    .line 406
    .local v4, "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;
    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_18

    .line 407
    iget-object v5, v10, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->signers:Ljava/util/List;

    invoke-virtual {v4}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->getResult()Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 409
    :cond_18
    iget-object v5, v10, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->ignoredSigners:Ljava/util/List;

    invoke-virtual {v4}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;->getResult()Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 411
    .end local v4    # "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;
    :goto_9
    goto :goto_8

    .line 413
    :cond_19
    const/4 v3, 0x1

    iput-boolean v3, v10, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->verified:Z

    .line 414
    return-void

    .line 262
    .end local v0    # "remainingSigners":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .end local v1    # "apkSigners":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .end local v2    # "signatureEntryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v6    # "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Signer;>;"
    .end local v11    # "manifestBytes":[B
    .end local v24    # "manifestSections":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Lcom/android/apksig/internal/jar/ManifestParser$Section;Ljava/util/Map<Ljava/lang/String;Lcom/android/apksig/internal/jar/ManifestParser$Section;>;>;"
    .end local v25    # "manifestMainSection":Lcom/android/apksig/internal/jar/ManifestParser$Section;
    .end local v26    # "entryNameToManifestSection":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/android/apksig/internal/jar/ManifestParser$Section;>;"
    :catch_0
    move-exception v0

    move-object v1, v0

    move-object v0, v1

    .line 263
    .local v0, "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v1, Lcom/android/apksig/apk/ApkFormatException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Malformed ZIP entry: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v14}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method
