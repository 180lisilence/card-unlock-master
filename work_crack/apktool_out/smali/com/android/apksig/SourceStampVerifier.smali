.class public Lcom/android/apksig/SourceStampVerifier;
.super Ljava/lang/Object;
.source "SourceStampVerifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/SourceStampVerifier$Result;,
        Lcom/android/apksig/SourceStampVerifier$Builder;
    }
.end annotation


# instance fields
.field private final mApkDataSource:Lcom/android/apksig/util/DataSource;

.field private final mApkFile:Ljava/io/File;

.field private final mMaxSdkVersion:I

.field private final mMinSdkVersion:I


# direct methods
.method private constructor <init>(Ljava/io/File;Lcom/android/apksig/util/DataSource;II)V
    .locals 0
    .param p1, "apkFile"    # Ljava/io/File;
    .param p2, "apkDataSource"    # Lcom/android/apksig/util/DataSource;
    .param p3, "minSdkVersion"    # I
    .param p4, "maxSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "apkFile",
            "apkDataSource",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-object p1, p0, Lcom/android/apksig/SourceStampVerifier;->mApkFile:Ljava/io/File;

    .line 88
    iput-object p2, p0, Lcom/android/apksig/SourceStampVerifier;->mApkDataSource:Lcom/android/apksig/util/DataSource;

    .line 89
    iput p3, p0, Lcom/android/apksig/SourceStampVerifier;->mMinSdkVersion:I

    .line 90
    iput p4, p0, Lcom/android/apksig/SourceStampVerifier;->mMaxSdkVersion:I

    .line 91
    return-void
.end method

.method synthetic constructor <init>(Ljava/io/File;Lcom/android/apksig/util/DataSource;IILcom/android/apksig/SourceStampVerifier$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/io/File;
    .param p2, "x1"    # Lcom/android/apksig/util/DataSource;
    .param p3, "x2"    # I
    .param p4, "x3"    # I
    .param p5, "x4"    # Lcom/android/apksig/SourceStampVerifier$1;

    .line 75
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/apksig/SourceStampVerifier;-><init>(Ljava/io/File;Lcom/android/apksig/util/DataSource;II)V

    return-void
.end method

.method private static getApkContentDigestFromV1SigningScheme(Ljava/util/List;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/zip/ZipSections;Lcom/android/apksig/SourceStampVerifier$Result;)Ljava/util/Map;
    .locals 11
    .param p1, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p2, "zipSections"    # Lcom/android/apksig/zip/ZipSections;
    .param p3, "result"    # Lcom/android/apksig/SourceStampVerifier$Result;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "cdRecords",
            "apk",
            "zipSections",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/zip/CentralDirectoryRecord;",
            ">;",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/zip/ZipSections;",
            "Lcom/android/apksig/SourceStampVerifier$Result;",
            ")",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 433
    .local p0, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    const/4 v0, 0x0

    .line 434
    .local v0, "manifestCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 435
    .local v1, "signatureBlockRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    new-instance v2, Ljava/util/EnumMap;

    const-class v3, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    invoke-direct {v2, v3}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 437
    .local v2, "v1ContentDigest":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 438
    .local v4, "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    invoke-virtual {v4}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v5

    .line 439
    .local v5, "cdRecordName":Ljava/lang/String;
    if-nez v5, :cond_0

    .line 440
    goto :goto_0

    .line 442
    :cond_0
    if-nez v0, :cond_1

    const-string v6, "META-INF/MANIFEST.MF"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 443
    move-object v0, v4

    .line 444
    goto :goto_0

    .line 446
    :cond_1
    const-string v6, "META-INF/"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 447
    const-string v6, ".RSA"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 448
    const-string v6, ".DSA"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 449
    const-string v6, ".EC"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 450
    :cond_2
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 452
    .end local v4    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v5    # "cdRecordName":Ljava/lang/String;
    :cond_3
    goto :goto_0

    .line 453
    :cond_4
    if-nez v0, :cond_5

    .line 457
    return-object v2

    .line 459
    :cond_5
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    const-string v4, "Failed to read APK"

    if-eqz v3, :cond_6

    .line 460
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    const/16 v5, 0x24

    invoke-virtual {p3, v5, v3}, Lcom/android/apksig/SourceStampVerifier$Result;->addVerificationWarning(I[Ljava/lang/Object;)V

    goto :goto_4

    .line 462
    :cond_6
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 464
    .local v5, "signatureBlockRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :try_start_0
    const-string v6, "X.509"

    invoke-static {v6}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v6

    .line 465
    .local v6, "certFactory":Ljava/security/cert/CertificateFactory;
    nop

    .line 466
    invoke-virtual {p2}, Lcom/android/apksig/zip/ZipSections;->getZipCentralDirectoryOffset()J

    move-result-wide v7

    .line 465
    invoke-static {p1, v5, v7, v8}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)[B

    move-result-object v7

    .line 467
    .local v7, "signatureBlockBytes":[B
    new-instance v8, Ljava/io/ByteArrayInputStream;

    invoke-direct {v8, v7}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v6, v8}, Ljava/security/cert/CertificateFactory;->generateCertificates(Ljava/io/InputStream;)Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_8

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/security/cert/Certificate;

    .line 471
    .local v9, "certificate":Ljava/security/cert/Certificate;
    instance-of v10, v9, Ljava/security/cert/X509Certificate;

    if-eqz v10, :cond_7

    .line 472
    new-instance v8, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;

    invoke-direct {v8}, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;-><init>()V

    .line 473
    .local v8, "signerInfo":Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    move-object v10, v9

    check-cast v10, Ljava/security/cert/X509Certificate;

    invoke-virtual {v8, v10}, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->setSigningCertificate(Ljava/security/cert/X509Certificate;)V

    .line 474
    invoke-static {p3, v8}, Lcom/android/apksig/SourceStampVerifier$Result;->access$300(Lcom/android/apksig/SourceStampVerifier$Result;Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;)V
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 475
    goto :goto_3

    .line 477
    .end local v8    # "signerInfo":Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    .end local v9    # "certificate":Ljava/security/cert/Certificate;
    :cond_7
    goto :goto_2

    .line 486
    .end local v6    # "certFactory":Ljava/security/cert/CertificateFactory;
    .end local v7    # "signatureBlockBytes":[B
    :cond_8
    :goto_3
    nop

    .line 487
    .end local v5    # "signatureBlockRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    goto :goto_1

    .line 484
    .restart local v5    # "signatureBlockRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :catch_0
    move-exception v3

    .line 485
    .local v3, "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v6, Lcom/android/apksig/apk/ApkFormatException;

    invoke-direct {v6, v4, v3}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 478
    .end local v3    # "e":Lcom/android/apksig/zip/ZipFormatException;
    :catch_1
    move-exception v3

    .line 481
    .local v3, "e":Ljava/security/cert/CertificateException;
    nop

    .line 482
    invoke-virtual {v5}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v6

    filled-new-array {v6, v3}, [Ljava/lang/Object;

    move-result-object v6

    .line 481
    const/16 v7, 0x25

    invoke-virtual {p3, v7, v6}, Lcom/android/apksig/SourceStampVerifier$Result;->addVerificationWarning(I[Ljava/lang/Object;)V

    .line 483
    nop

    .line 490
    .end local v3    # "e":Ljava/security/cert/CertificateException;
    .end local v5    # "signatureBlockRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :cond_9
    :goto_4
    nop

    .line 492
    :try_start_1
    invoke-virtual {p2}, Lcom/android/apksig/zip/ZipSections;->getZipCentralDirectoryOffset()J

    move-result-wide v5

    .line 491
    invoke-static {p1, v0, v5, v6}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)[B

    move-result-object v3

    .line 493
    .local v3, "manifestBytes":[B
    sget-object v5, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->SHA256:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    .line 494
    invoke-static {v3}, Lcom/android/apksig/apk/ApkUtilsLite;->computeSha256DigestBytes([B)[B

    move-result-object v6

    .line 493
    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_1 .. :try_end_1} :catch_2

    .line 495
    return-object v2

    .line 496
    .end local v3    # "manifestBytes":[B
    :catch_2
    move-exception v3

    .line 497
    .local v3, "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v5, Lcom/android/apksig/apk/ApkFormatException;

    invoke-direct {v5, v4, v3}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method private static parseSigner(Ljava/nio/ByteBuffer;ILjava/security/cert/CertificateFactory;Ljava/util/Map;Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;)V
    .locals 10
    .param p0, "signerBlock"    # Ljava/nio/ByteBuffer;
    .param p1, "apkSigSchemeVersion"    # I
    .param p2, "certFactory"    # Ljava/security/cert/CertificateFactory;
    .param p4, "signerInfo"    # Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "signerBlock",
            "apkSigSchemeVersion",
            "certFactory",
            "apkContentDigests",
            "signerInfo"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            "I",
            "Ljava/security/cert/CertificateFactory;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;",
            "Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 359
    .local p3, "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    const/4 v0, 0x2

    const/4 v1, 0x0

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    .line 367
    .local v0, "isV2Signer":Z
    :goto_0
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 368
    .local v2, "signedData":Ljava/nio/ByteBuffer;
    invoke-static {v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 369
    .local v3, "digests":Ljava/nio/ByteBuffer;
    invoke-static {v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 372
    .local v4, "certificates":Ljava/nio/ByteBuffer;
    :goto_1
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 374
    :try_start_0
    invoke-static {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 375
    .local v5, "digest":Ljava/nio/ByteBuffer;
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v6

    .line 376
    .local v6, "sigAlgorithmId":I
    invoke-static {v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v7

    .line 377
    .local v7, "digestBytes":[B
    invoke-static {v6}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v8

    .line 378
    .local v8, "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    if-nez v8, :cond_1

    .line 379
    goto :goto_1

    .line 381
    :cond_1
    invoke-virtual {v8}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getContentDigestAlgorithm()Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    move-result-object v9

    invoke-interface {p3, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    .line 387
    nop

    .end local v5    # "digest":Ljava/nio/ByteBuffer;
    .end local v6    # "sigAlgorithmId":I
    .end local v7    # "digestBytes":[B
    .end local v8    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    goto :goto_1

    .line 382
    :catch_0
    move-exception v5

    goto :goto_2

    :catch_1
    move-exception v5

    .line 383
    .local v5, "e":Ljava/lang/Exception;
    :goto_2
    nop

    .line 384
    if-eqz v0, :cond_2

    const/16 v6, 0x8

    goto :goto_3

    .line 385
    :cond_2
    const/16 v6, 0x10

    :goto_3
    new-array v1, v1, [Ljava/lang/Object;

    .line 383
    invoke-virtual {p4, v6, v1}, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->addVerificationWarning(I[Ljava/lang/Object;)V

    .line 386
    return-void

    .line 391
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_3
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 392
    invoke-static {v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v5

    .line 395
    .local v5, "encodedCert":[B
    :try_start_1
    new-instance v6, Ljava/io/ByteArrayInputStream;

    invoke-direct {v6, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {p2, v6}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v6

    check-cast v6, Ljava/security/cert/X509Certificate;
    :try_end_1
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_1} :catch_2

    .line 402
    .local v6, "certificate":Ljava/security/cert/X509Certificate;
    nop

    .line 407
    new-instance v7, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;

    invoke-direct {v7, v6, v5}, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;-><init>(Ljava/security/cert/X509Certificate;[B)V

    move-object v6, v7

    .line 408
    invoke-virtual {p4, v6}, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->setSigningCertificate(Ljava/security/cert/X509Certificate;)V

    goto :goto_5

    .line 397
    .end local v6    # "certificate":Ljava/security/cert/X509Certificate;
    :catch_2
    move-exception v6

    .line 398
    .local v6, "e":Ljava/security/cert/CertificateException;
    nop

    .line 399
    if-eqz v0, :cond_4

    const/4 v7, 0x6

    goto :goto_4

    .line 400
    :cond_4
    const/16 v7, 0xe

    :goto_4
    new-array v1, v1, [Ljava/lang/Object;

    .line 398
    invoke-virtual {p4, v7, v1}, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->addVerificationWarning(I[Ljava/lang/Object;)V

    .line 401
    return-void

    .line 411
    .end local v5    # "encodedCert":[B
    .end local v6    # "e":Ljava/security/cert/CertificateException;
    :cond_5
    :goto_5
    invoke-virtual {p4}, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->getSigningCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v5

    if-nez v5, :cond_7

    .line 412
    nop

    .line 413
    if-eqz v0, :cond_6

    const/4 v5, 0x7

    goto :goto_6

    .line 414
    :cond_6
    const/16 v5, 0xf

    :goto_6
    new-array v1, v1, [Ljava/lang/Object;

    .line 412
    invoke-virtual {p4, v5, v1}, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->addVerificationWarning(I[Ljava/lang/Object;)V

    .line 415
    return-void

    .line 417
    :cond_7
    return-void
.end method

.method public static parseSigners(Ljava/nio/ByteBuffer;ILjava/util/Map;Lcom/android/apksig/SourceStampVerifier$Result;)V
    .locals 7
    .param p0, "apkSignatureSchemeBlock"    # Ljava/nio/ByteBuffer;
    .param p1, "apkSigSchemeVersion"    # I
    .param p3, "result"    # Lcom/android/apksig/SourceStampVerifier$Result;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "apkSignatureSchemeBlock",
            "apkSigSchemeVersion",
            "apkContentDigests",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            "I",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;",
            "Lcom/android/apksig/SourceStampVerifier$Result;",
            ")V"
        }
    .end annotation

    .line 293
    .local p2, "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ne p1, v2, :cond_0

    move v3, v0

    goto :goto_0

    :cond_0
    move v3, v1

    .line 298
    .local v3, "isV2Block":Z
    :goto_0
    :try_start_0
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_3

    .line 303
    .local v0, "signers":Ljava/nio/ByteBuffer;
    nop

    .line 304
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    if-nez v4, :cond_2

    .line 305
    if-eqz v3, :cond_1

    goto :goto_1

    .line 306
    :cond_1
    const/16 v2, 0xa

    :goto_1
    new-array v1, v1, [Ljava/lang/Object;

    .line 305
    invoke-virtual {p3, v2, v1}, Lcom/android/apksig/SourceStampVerifier$Result;->addVerificationWarning(I[Ljava/lang/Object;)V

    .line 307
    return-void

    .line 312
    :cond_2
    :try_start_1
    const-string v2, "X.509"

    invoke-static {v2}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v2
    :try_end_1
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_1} :catch_2

    .line 315
    .local v2, "certFactory":Ljava/security/cert/CertificateFactory;
    nop

    .line 316
    :goto_2
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 317
    new-instance v4, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;

    invoke-direct {v4}, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;-><init>()V

    .line 318
    .local v4, "signerInfo":Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    if-eqz v3, :cond_3

    .line 319
    invoke-static {p3, v4}, Lcom/android/apksig/SourceStampVerifier$Result;->access$100(Lcom/android/apksig/SourceStampVerifier$Result;Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;)V

    goto :goto_3

    .line 321
    :cond_3
    invoke-static {p3, v4}, Lcom/android/apksig/SourceStampVerifier$Result;->access$200(Lcom/android/apksig/SourceStampVerifier$Result;Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;)V

    .line 324
    :goto_3
    :try_start_2
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 325
    .local v5, "signer":Ljava/nio/ByteBuffer;
    invoke-static {v5, p1, v2, p2, v4}, Lcom/android/apksig/SourceStampVerifier;->parseSigner(Ljava/nio/ByteBuffer;ILjava/security/cert/CertificateFactory;Ljava/util/Map;Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;)V
    :try_end_2
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/nio/BufferUnderflowException; {:try_start_2 .. :try_end_2} :catch_0

    .line 336
    .end local v5    # "signer":Ljava/nio/ByteBuffer;
    nop

    .line 337
    .end local v4    # "signerInfo":Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    goto :goto_2

    .line 331
    .restart local v4    # "signerInfo":Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    :catch_0
    move-exception v5

    goto :goto_4

    :catch_1
    move-exception v5

    .line 332
    .local v5, "e":Ljava/lang/Exception;
    :goto_4
    nop

    .line 333
    if-eqz v3, :cond_4

    const/4 v6, 0x3

    goto :goto_5

    .line 334
    :cond_4
    const/16 v6, 0xb

    :goto_5
    new-array v1, v1, [Ljava/lang/Object;

    .line 332
    invoke-virtual {v4, v6, v1}, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->addVerificationWarning(I[Ljava/lang/Object;)V

    .line 335
    return-void

    .line 338
    .end local v4    # "signerInfo":Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_5
    return-void

    .line 313
    .end local v2    # "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_2
    move-exception v1

    .line 314
    .local v1, "e":Ljava/security/cert/CertificateException;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v4, "Failed to obtain X.509 CertificateFactory"

    invoke-direct {v2, v4, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 299
    .end local v0    # "signers":Ljava/nio/ByteBuffer;
    .end local v1    # "e":Ljava/security/cert/CertificateException;
    :catch_3
    move-exception v2

    .line 300
    .local v2, "e":Lcom/android/apksig/apk/ApkFormatException;
    if-eqz v3, :cond_6

    goto :goto_6

    .line 301
    :cond_6
    const/16 v0, 0x9

    :goto_6
    new-array v1, v1, [Ljava/lang/Object;

    .line 300
    invoke-virtual {p3, v0, v1}, Lcom/android/apksig/SourceStampVerifier$Result;->addVerificationWarning(I[Ljava/lang/Object;)V

    .line 302
    return-void
.end method

.method private verifySourceStamp(Lcom/android/apksig/util/DataSource;Ljava/lang/String;)Lcom/android/apksig/SourceStampVerifier$Result;
    .locals 13
    .param p1, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p2, "expectedCertDigest"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apk",
            "expectedCertDigest"
        }
    .end annotation

    .line 163
    new-instance v0, Lcom/android/apksig/SourceStampVerifier$Result;

    invoke-direct {v0}, Lcom/android/apksig/SourceStampVerifier$Result;-><init>()V

    .line 165
    .local v0, "result":Lcom/android/apksig/SourceStampVerifier$Result;
    const/4 v1, 0x0

    const/16 v2, 0x1c

    :try_start_0
    invoke-static {p1}, Lcom/android/apksig/apk/ApkUtilsLite;->findZipSections(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/zip/ZipSections;

    move-result-object v3

    .line 167
    .local v3, "zipSections":Lcom/android/apksig/zip/ZipSections;
    nop

    .line 168
    invoke-static {p1, v3}, Lcom/android/apksig/internal/zip/ZipUtils;->parseZipCentralDirectory(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/zip/ZipSections;)Ljava/util/List;

    move-result-object v4

    move-object v10, v4

    .line 169
    .local v10, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    const/4 v4, 0x0

    .line 170
    .local v4, "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 171
    .local v6, "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    const-string v7, "stamp-cert-sha256"

    invoke-virtual {v6}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_0 .. :try_end_0} :catch_3

    if-eqz v7, :cond_0

    .line 172
    move-object v4, v6

    .line 173
    move-object v11, v4

    goto :goto_1

    .line 175
    .end local v6    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :cond_0
    goto :goto_0

    .line 170
    :cond_1
    move-object v11, v4

    .line 180
    .end local v4    # "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .local v11, "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :goto_1
    const/16 v4, 0x18

    if-nez v11, :cond_3

    .line 183
    const v5, 0x6dff800d

    :try_start_1
    invoke-static {p1, v3, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/zip/ZipSections;I)Lcom/android/apksig/internal/apk/SignatureInfo;
    :try_end_1
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_4

    .line 185
    const/4 v5, 0x1

    .line 188
    .local v5, "stampSigningBlockFound":Z
    goto :goto_2

    .line 186
    .end local v5    # "stampSigningBlockFound":Z
    :catch_0
    move-exception v5

    .line 187
    .local v5, "e":Lcom/android/apksig/internal/apk/SignatureNotFoundException;
    const/4 v6, 0x0

    move v5, v6

    .line 189
    .local v5, "stampSigningBlockFound":Z
    :goto_2
    if-eqz v5, :cond_2

    .line 190
    goto :goto_3

    .line 191
    :cond_2
    const/16 v4, 0x19

    :goto_3
    :try_start_2
    new-array v6, v1, [Ljava/lang/Object;

    .line 189
    invoke-virtual {v0, v4, v6}, Lcom/android/apksig/SourceStampVerifier$Result;->addVerificationError(I[Ljava/lang/Object;)V

    .line 192
    return-object v0

    .line 197
    .end local v5    # "stampSigningBlockFound":Z
    :cond_3
    nop

    .line 201
    invoke-virtual {v3}, Lcom/android/apksig/zip/ZipSections;->getZipCentralDirectoryOffset()J

    move-result-wide v5

    .line 198
    invoke-static {p1, v11, v5, v6}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)[B

    move-result-object v6

    .line 202
    .local v6, "sourceStampCertificateDigest":[B
    if-eqz p2, :cond_4

    .line 203
    invoke-static {v6}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->toHex([B)Ljava/lang/String;

    move-result-object v5

    .line 205
    .local v5, "actualCertDigest":Ljava/lang/String;
    invoke-virtual {p2, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 206
    filled-new-array {v5, p2}, [Ljava/lang/Object;

    move-result-object v4

    const/16 v7, 0x17

    invoke-virtual {v0, v7, v4}, Lcom/android/apksig/SourceStampVerifier$Result;->addVerificationError(I[Ljava/lang/Object;)V

    .line 209
    return-object v0

    .line 213
    .end local v5    # "actualCertDigest":Ljava/lang/String;
    :cond_4
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    move-object v12, v5

    .line 215
    .local v12, "signatureSchemeApkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    iget v5, p0, Lcom/android/apksig/SourceStampVerifier;->mMaxSdkVersion:I
    :try_end_2
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_2 .. :try_end_2} :catch_7
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_6
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_2 .. :try_end_2} :catch_3

    if-lt v5, v2, :cond_5

    .line 218
    const v5, -0xfac9740

    :try_start_3
    invoke-static {p1, v3, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/zip/ZipSections;I)Lcom/android/apksig/internal/apk/SignatureInfo;

    move-result-object v5
    :try_end_3
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_3 .. :try_end_3} :catch_7
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_6
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_3} :catch_4

    .line 222
    .local v5, "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    goto :goto_4

    .line 220
    .end local v5    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    :catch_1
    move-exception v5

    .line 221
    .local v5, "e":Lcom/android/apksig/internal/apk/SignatureNotFoundException;
    const/4 v7, 0x0

    move-object v5, v7

    .line 223
    .local v5, "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    :goto_4
    if-eqz v5, :cond_5

    .line 224
    :try_start_4
    new-instance v7, Ljava/util/EnumMap;

    const-class v8, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    invoke-direct {v7, v8}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 226
    .local v7, "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    iget-object v8, v5, Lcom/android/apksig/internal/apk/SignatureInfo;->signatureBlock:Ljava/nio/ByteBuffer;

    const/4 v9, 0x3

    invoke-static {v8, v9, v7, v0}, Lcom/android/apksig/SourceStampVerifier;->parseSigners(Ljava/nio/ByteBuffer;ILjava/util/Map;Lcom/android/apksig/SourceStampVerifier$Result;)V

    .line 228
    nop

    .line 229
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 228
    invoke-interface {v12, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    .end local v5    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    .end local v7    # "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    :cond_5
    iget v5, p0, Lcom/android/apksig/SourceStampVerifier;->mMaxSdkVersion:I

    if-lt v5, v4, :cond_7

    iget v5, p0, Lcom/android/apksig/SourceStampVerifier;->mMinSdkVersion:I

    if-lt v5, v2, :cond_6

    .line 234
    invoke-interface {v12}, Ljava/util/Map;->isEmpty()Z

    move-result v5
    :try_end_4
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_4 .. :try_end_4} :catch_7
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_6
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_4 .. :try_end_4} :catch_3

    if-eqz v5, :cond_7

    .line 237
    :cond_6
    const v5, 0x7109871a

    :try_start_5
    invoke-static {p1, v3, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/zip/ZipSections;I)Lcom/android/apksig/internal/apk/SignatureInfo;

    move-result-object v5
    :try_end_5
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_6
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_5 .. :try_end_5} :catch_4

    .line 241
    .restart local v5    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    goto :goto_5

    .line 239
    .end local v5    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    :catch_2
    move-exception v5

    .line 240
    .local v5, "e":Lcom/android/apksig/internal/apk/SignatureNotFoundException;
    const/4 v7, 0x0

    move-object v5, v7

    .line 242
    .local v5, "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    :goto_5
    if-eqz v5, :cond_7

    .line 243
    :try_start_6
    new-instance v7, Ljava/util/EnumMap;

    const-class v8, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    invoke-direct {v7, v8}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 245
    .restart local v7    # "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    iget-object v8, v5, Lcom/android/apksig/internal/apk/SignatureInfo;->signatureBlock:Ljava/nio/ByteBuffer;

    const/4 v9, 0x2

    invoke-static {v8, v9, v7, v0}, Lcom/android/apksig/SourceStampVerifier;->parseSigners(Ljava/nio/ByteBuffer;ILjava/util/Map;Lcom/android/apksig/SourceStampVerifier$Result;)V

    .line 247
    nop

    .line 248
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 247
    invoke-interface {v12, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    .end local v5    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    .end local v7    # "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    :cond_7
    iget v5, p0, Lcom/android/apksig/SourceStampVerifier;->mMinSdkVersion:I

    if-lt v5, v4, :cond_8

    .line 253
    invoke-interface {v12}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 254
    :cond_8
    nop

    .line 255
    invoke-static {v10, p1, v3, v0}, Lcom/android/apksig/SourceStampVerifier;->getApkContentDigestFromV1SigningScheme(Ljava/util/List;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/zip/ZipSections;Lcom/android/apksig/SourceStampVerifier$Result;)Ljava/util/Map;

    move-result-object v4

    .line 256
    .local v4, "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v12, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    .end local v4    # "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    :cond_9
    iget v8, p0, Lcom/android/apksig/SourceStampVerifier;->mMinSdkVersion:I

    iget v9, p0, Lcom/android/apksig/SourceStampVerifier;->mMaxSdkVersion:I

    .line 261
    move-object v4, p1

    move-object v5, v3

    move-object v7, v12

    invoke-static/range {v4 .. v9}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampVerifier;->verify(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/zip/ZipSections;[BLjava/util/Map;II)Lcom/android/apksig/internal/apk/ApkSigResult;

    move-result-object v4

    .line 268
    .local v4, "sourceStampResult":Lcom/android/apksig/internal/apk/ApkSigResult;
    invoke-static {v0, v4}, Lcom/android/apksig/SourceStampVerifier$Result;->access$000(Lcom/android/apksig/SourceStampVerifier$Result;Lcom/android/apksig/internal/apk/ApkSigResult;)V
    :try_end_6
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_6 .. :try_end_6} :catch_7
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_6
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_6 .. :try_end_6} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_6 .. :try_end_6} :catch_4
    .catch Lcom/android/apksig/internal/apk/SignatureNotFoundException; {:try_start_6 .. :try_end_6} :catch_3

    .line 269
    return-object v0

    .line 274
    .end local v3    # "zipSections":Lcom/android/apksig/zip/ZipSections;
    .end local v4    # "sourceStampResult":Lcom/android/apksig/internal/apk/ApkSigResult;
    .end local v6    # "sourceStampCertificateDigest":[B
    .end local v10    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v11    # "sourceStampCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v12    # "signatureSchemeApkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    :catch_3
    move-exception v2

    .line 275
    .local v2, "e":Lcom/android/apksig/internal/apk/SignatureNotFoundException;
    const/16 v3, 0x1e

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v3, v1}, Lcom/android/apksig/SourceStampVerifier$Result;->addVerificationError(I[Ljava/lang/Object;)V

    goto :goto_8

    .line 272
    .end local v2    # "e":Lcom/android/apksig/internal/apk/SignatureNotFoundException;
    :catch_4
    move-exception v1

    .line 273
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    const/16 v2, 0x1d

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/android/apksig/SourceStampVerifier$Result;->addVerificationError(I[Ljava/lang/Object;)V

    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    goto :goto_7

    .line 270
    :catch_5
    move-exception v1

    goto :goto_6

    :catch_6
    move-exception v1

    goto :goto_6

    :catch_7
    move-exception v1

    .line 271
    .local v1, "e":Ljava/lang/Exception;
    :goto_6
    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/android/apksig/SourceStampVerifier$Result;->addVerificationError(I[Ljava/lang/Object;)V

    .line 276
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_7
    nop

    .line 277
    :goto_8
    return-object v0
.end method


# virtual methods
.method public verifySourceStamp()Lcom/android/apksig/SourceStampVerifier$Result;
    .locals 1

    .line 111
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/apksig/SourceStampVerifier;->verifySourceStamp(Ljava/lang/String;)Lcom/android/apksig/SourceStampVerifier$Result;

    move-result-object v0

    return-object v0
.end method

.method public verifySourceStamp(Ljava/lang/String;)Lcom/android/apksig/SourceStampVerifier$Result;
    .locals 6
    .param p1, "expectedCertDigest"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedCertDigest"
        }
    .end annotation

    .line 127
    const/4 v0, 0x0

    .line 130
    .local v0, "in":Ljava/io/Closeable;
    :try_start_0
    iget-object v1, p0, Lcom/android/apksig/SourceStampVerifier;->mApkDataSource:Lcom/android/apksig/util/DataSource;

    if-eqz v1, :cond_0

    .line 131
    nop

    .local v1, "apk":Lcom/android/apksig/util/DataSource;
    goto :goto_0

    .line 132
    .end local v1    # "apk":Lcom/android/apksig/util/DataSource;
    :cond_0
    iget-object v1, p0, Lcom/android/apksig/SourceStampVerifier;->mApkFile:Ljava/io/File;

    if-eqz v1, :cond_2

    .line 133
    new-instance v1, Ljava/io/RandomAccessFile;

    iget-object v2, p0, Lcom/android/apksig/SourceStampVerifier;->mApkFile:Ljava/io/File;

    const-string v3, "r"

    invoke-direct {v1, v2, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 134
    .local v1, "f":Ljava/io/RandomAccessFile;
    move-object v0, v1

    .line 135
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    invoke-static {v1, v4, v5, v2, v3}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/io/RandomAccessFile;JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v2

    move-object v1, v2

    .line 136
    .local v1, "apk":Lcom/android/apksig/util/DataSource;
    nop

    .line 139
    :goto_0
    invoke-direct {p0, v1, p1}, Lcom/android/apksig/SourceStampVerifier;->verifySourceStamp(Lcom/android/apksig/util/DataSource;Ljava/lang/String;)Lcom/android/apksig/SourceStampVerifier$Result;

    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 145
    if-eqz v0, :cond_1

    .line 147
    :try_start_1
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 149
    goto :goto_1

    .line 148
    :catch_0
    move-exception v3

    .line 139
    :cond_1
    :goto_1
    return-object v2

    .line 137
    .end local v1    # "apk":Lcom/android/apksig/util/DataSource;
    :cond_2
    :try_start_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "APK not provided"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v0    # "in":Ljava/io/Closeable;
    .end local p1    # "expectedCertDigest":Ljava/lang/String;
    throw v1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 145
    .restart local v0    # "in":Ljava/io/Closeable;
    .restart local p1    # "expectedCertDigest":Ljava/lang/String;
    :catchall_0
    move-exception v1

    goto :goto_3

    .line 140
    :catch_1
    move-exception v1

    .line 141
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v2, Lcom/android/apksig/SourceStampVerifier$Result;

    invoke-direct {v2}, Lcom/android/apksig/SourceStampVerifier$Result;-><init>()V

    .line 142
    .local v2, "result":Lcom/android/apksig/SourceStampVerifier$Result;
    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v3

    const/16 v4, 0x1d

    invoke-virtual {v2, v4, v3}, Lcom/android/apksig/SourceStampVerifier$Result;->addVerificationError(I[Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 143
    nop

    .line 145
    if-eqz v0, :cond_3

    .line 147
    :try_start_4
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 149
    goto :goto_2

    .line 148
    :catch_2
    move-exception v3

    .line 143
    :cond_3
    :goto_2
    return-object v2

    .line 145
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "result":Lcom/android/apksig/SourceStampVerifier$Result;
    :goto_3
    if-eqz v0, :cond_4

    .line 147
    :try_start_5
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 149
    goto :goto_4

    .line 148
    :catch_3
    move-exception v2

    .line 151
    :cond_4
    :goto_4
    throw v1
.end method
