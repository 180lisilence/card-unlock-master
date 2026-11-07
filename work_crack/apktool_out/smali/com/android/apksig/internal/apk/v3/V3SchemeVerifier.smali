.class public Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;
.super Ljava/lang/Object;
.source "V3SchemeVerifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;
    }
.end annotation


# instance fields
.field private final mApk:Lcom/android/apksig/util/DataSource;

.field private mApkSignatureSchemeV3Block:Ljava/nio/ByteBuffer;

.field private final mBlockId:I

.field private final mContentDigestsToVerify:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            ">;"
        }
    .end annotation
.end field

.field private final mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

.field private final mFullVerification:Z

.field private final mMaxSdkVersion:I

.field private final mMinSdkVersion:I

.field private final mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

.field private final mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

.field private final mZipSections:Lcom/android/apksig/apk/ApkUtils$ZipSections;


# direct methods
.method private constructor <init>(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;Ljava/util/Set;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;IIILjava/util/OptionalInt;Z)V
    .locals 0
    .param p1, "executor"    # Lcom/android/apksig/util/RunnablesExecutor;
    .param p2, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p3, "zipSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .param p5, "result"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .param p6, "minSdkVersion"    # I
    .param p7, "maxSdkVersion"    # I
    .param p8, "blockId"    # I
    .param p9, "optionalRotationMinSdkVersion"    # Ljava/util/OptionalInt;
    .param p10, "fullVerification"    # Z
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
            0x0
        }
        names = {
            "executor",
            "apk",
            "zipSections",
            "contentDigestsToVerify",
            "result",
            "minSdkVersion",
            "maxSdkVersion",
            "blockId",
            "optionalRotationMinSdkVersion",
            "fullVerification"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/RunnablesExecutor;",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/apk/ApkUtils$ZipSections;",
            "Ljava/util/Set<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            ">;",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;",
            "III",
            "Ljava/util/OptionalInt;",
            "Z)V"
        }
    .end annotation

    .line 95
    .local p4, "contentDigestsToVerify":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    iput-object p1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    .line 97
    iput-object p2, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mApk:Lcom/android/apksig/util/DataSource;

    .line 98
    iput-object p3, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mZipSections:Lcom/android/apksig/apk/ApkUtils$ZipSections;

    .line 99
    iput-object p4, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mContentDigestsToVerify:Ljava/util/Set;

    .line 100
    iput-object p5, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    .line 101
    iput p6, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mMinSdkVersion:I

    .line 102
    iput p7, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mMaxSdkVersion:I

    .line 103
    iput p8, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mBlockId:I

    .line 104
    iput-object p9, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    .line 105
    iput-boolean p10, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mFullVerification:Z

    .line 106
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;Ljava/util/Set;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;IIILjava/util/OptionalInt;ZLcom/android/apksig/internal/apk/v3/V3SchemeVerifier$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/apksig/util/RunnablesExecutor;
    .param p2, "x1"    # Lcom/android/apksig/util/DataSource;
    .param p3, "x2"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .param p4, "x3"    # Ljava/util/Set;
    .param p5, "x4"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .param p6, "x5"    # I
    .param p7, "x6"    # I
    .param p8, "x7"    # I
    .param p9, "x8"    # Ljava/util/OptionalInt;
    .param p10, "x9"    # Z
    .param p11, "x10"    # Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$1;

    .line 71
    invoke-direct/range {p0 .. p10}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;-><init>(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;Ljava/util/Set;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;IIILjava/util/OptionalInt;Z)V

    return-void
.end method

.method static synthetic access$102(Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 0
    .param p0, "x0"    # Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;
    .param p1, "x1"    # Ljava/nio/ByteBuffer;

    .line 71
    iput-object p1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mApkSignatureSchemeV3Block:Ljava/nio/ByteBuffer;

    return-object p1
.end method

.method private parseSigner(Ljava/nio/ByteBuffer;Ljava/security/cert/CertificateFactory;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;)V
    .locals 34
    .param p1, "signerBlock"    # Ljava/nio/ByteBuffer;
    .param p2, "certFactory"    # Ljava/security/cert/CertificateFactory;
    .param p3, "result"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "signerBlock",
            "certFactory",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 343
    move-object/from16 v1, p0

    move-object/from16 v2, p3

    invoke-static/range {p1 .. p1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 344
    .local v3, "signedData":Ljava/nio/ByteBuffer;
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    new-array v4, v0, [B

    .line 345
    .local v4, "signedDataBytes":[B
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 346
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 347
    iput-object v4, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signedData:[B

    .line 349
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v5

    .line 350
    .local v5, "parsedMinSdkVersion":I
    invoke-virtual/range {p1 .. p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v6

    .line 351
    .local v6, "parsedMaxSdkVersion":I
    iput v5, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->minSdkVersion:I

    .line 352
    iput v6, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->maxSdkVersion:I

    .line 353
    if-ltz v5, :cond_0

    if-le v5, v6, :cond_1

    .line 354
    :cond_0
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_INVALID_SDK_VERSIONS:Lcom/android/apksig/ApkVerifier$Issue;

    .line 355
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    filled-new-array {v7, v8}, [Ljava/lang/Object;

    move-result-object v7

    .line 354
    invoke-virtual {v2, v0, v7}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 357
    :cond_1
    invoke-static/range {p1 .. p1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 358
    .local v7, "signatures":Ljava/nio/ByteBuffer;
    invoke-static/range {p1 .. p1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v8

    .line 361
    .local v8, "publicKeyBytes":[B
    const/4 v0, 0x0

    .line 362
    .local v0, "signatureCount":I
    new-instance v9, Ljava/util/ArrayList;

    const/4 v10, 0x1

    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(I)V

    move v11, v0

    .line 363
    .end local v0    # "signatureCount":I
    .local v9, "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    .local v11, "signatureCount":I
    :goto_0
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 364
    add-int/lit8 v11, v11, 0x1

    .line 366
    :try_start_0
    invoke-static {v7}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 367
    .local v0, "signature":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v13

    .line 368
    .local v13, "sigAlgorithmId":I
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v14

    .line 369
    .local v14, "sigBytes":[B
    iget-object v15, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signatures:Ljava/util/List;

    new-instance v12, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$Signature;

    invoke-direct {v12, v13, v14}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$Signature;-><init>(I[B)V

    invoke-interface {v15, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 372
    invoke-static {v13}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v12

    .line 373
    .local v12, "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    if-nez v12, :cond_2

    .line 374
    sget-object v15, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_UNKNOWN_SIG_ALGORITHM:Lcom/android/apksig/ApkVerifier$Issue;

    move-object/from16 v17, v0

    .end local v0    # "signature":Ljava/nio/ByteBuffer;
    .local v17, "signature":Ljava/nio/ByteBuffer;
    new-array v0, v10, [Ljava/lang/Object;

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    const/16 v16, 0x0

    aput-object v18, v0, v16

    invoke-virtual {v2, v15, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addWarning(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 375
    goto :goto_0

    .line 379
    .end local v17    # "signature":Ljava/nio/ByteBuffer;
    .restart local v0    # "signature":Ljava/nio/ByteBuffer;
    :cond_2
    move-object/from16 v17, v0

    .end local v0    # "signature":Ljava/nio/ByteBuffer;
    .restart local v17    # "signature":Ljava/nio/ByteBuffer;
    new-instance v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;

    invoke-direct {v0, v12, v14}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;-><init>(Lcom/android/apksig/internal/apk/SignatureAlgorithm;[B)V

    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    .line 384
    nop

    .end local v12    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v13    # "sigAlgorithmId":I
    .end local v14    # "sigBytes":[B
    .end local v17    # "signature":Ljava/nio/ByteBuffer;
    goto :goto_0

    .line 381
    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    .line 382
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    sget-object v10, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    filled-new-array {v12}, [Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v2, v10, v12}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 383
    return-void

    .line 386
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3
    iget-object v0, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signatures:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 387
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v10}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 388
    return-void

    .line 392
    :cond_4
    const/4 v12, 0x0

    .line 394
    .local v12, "signaturesToVerify":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    :try_start_1
    iget v0, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->minSdkVersion:I

    iget v13, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->maxSdkVersion:I

    .line 395
    invoke-static {v9, v0, v13}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getSignaturesToVerify(Ljava/util/List;II)Ljava/util/List;

    move-result-object v0
    :try_end_1
    .catch Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$NoSupportedSignaturesException; {:try_start_1 .. :try_end_1} :catch_26

    move-object v12, v0

    .line 400
    nop

    .line 401
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;

    .line 402
    .local v13, "signature":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;
    iget-object v14, v13, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;->algorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    .line 403
    .local v14, "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    nop

    .line 404
    invoke-virtual {v14}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaSignatureAlgorithmAndParams()Lcom/android/apksig/internal/util/Pair;

    move-result-object v15

    invoke-virtual {v15}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 405
    .local v15, "jcaSignatureAlgorithm":Ljava/lang/String;
    nop

    .line 406
    invoke-virtual {v14}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaSignatureAlgorithmAndParams()Lcom/android/apksig/internal/util/Pair;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v10, v17

    check-cast v10, Ljava/security/spec/AlgorithmParameterSpec;

    .line 407
    .local v10, "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual {v14}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaKeyAlgorithm()Ljava/lang/String;

    move-result-object v17

    .line 410
    .local v17, "keyAlgorithm":Ljava/lang/String;
    nop

    .line 411
    move-object/from16 v19, v0

    :try_start_2
    invoke-static/range {v17 .. v17}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_f

    move-object/from16 v20, v4

    .end local v4    # "signedDataBytes":[B
    .local v20, "signedDataBytes":[B
    :try_start_3
    new-instance v4, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v4, v8}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    invoke-virtual {v0, v4}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_e

    move-object v4, v0

    .line 416
    .local v4, "publicKey":Ljava/security/PublicKey;
    nop

    .line 418
    :try_start_4
    invoke-static {v15}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v0

    .line 419
    .local v0, "sig":Ljava/security/Signature;
    invoke-virtual {v0, v4}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V
    :try_end_4
    .catch Ljava/security/InvalidKeyException; {:try_start_4 .. :try_end_4} :catch_d
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_4 .. :try_end_4} :catch_c
    .catch Ljava/security/SignatureException; {:try_start_4 .. :try_end_4} :catch_b

    .line 420
    if-eqz v10, :cond_5

    .line 421
    :try_start_5
    invoke-virtual {v0, v10}, Ljava/security/Signature;->setParameter(Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_5
    .catch Ljava/security/InvalidKeyException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/security/SignatureException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_4

    .line 432
    .end local v0    # "sig":Ljava/security/Signature;
    :catch_2
    move-exception v0

    goto :goto_3

    :catch_3
    move-exception v0

    goto :goto_3

    :catch_4
    move-exception v0

    :goto_3
    move-object/from16 v21, v4

    move-object/from16 v23, v7

    goto :goto_7

    .line 423
    .restart local v0    # "sig":Ljava/security/Signature;
    :cond_5
    :goto_4
    move-object/from16 v21, v4

    const/4 v4, 0x0

    .end local v4    # "publicKey":Ljava/security/PublicKey;
    .local v21, "publicKey":Ljava/security/PublicKey;
    :try_start_6
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 424
    invoke-virtual {v0, v3}, Ljava/security/Signature;->update(Ljava/nio/ByteBuffer;)V

    .line 425
    iget-object v4, v13, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;->signature:[B

    .line 426
    .local v4, "sigBytes":[B
    invoke-virtual {v0, v4}, Ljava/security/Signature;->verify([B)Z

    move-result v22

    if-nez v22, :cond_6

    .line 427
    move-object/from16 v22, v0

    .end local v0    # "sig":Ljava/security/Signature;
    .local v22, "sig":Ljava/security/Signature;
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;
    :try_end_6
    .catch Ljava/security/InvalidKeyException; {:try_start_6 .. :try_end_6} :catch_a
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/security/SignatureException; {:try_start_6 .. :try_end_6} :catch_8

    move-object/from16 v23, v7

    .end local v7    # "signatures":Ljava/nio/ByteBuffer;
    .local v23, "signatures":Ljava/nio/ByteBuffer;
    :try_start_7
    filled-new-array {v14}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v2, v0, v7}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 428
    return-void

    .line 430
    .end local v22    # "sig":Ljava/security/Signature;
    .end local v23    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v0    # "sig":Ljava/security/Signature;
    .restart local v7    # "signatures":Ljava/nio/ByteBuffer;
    :cond_6
    move-object/from16 v22, v0

    move-object/from16 v23, v7

    .end local v0    # "sig":Ljava/security/Signature;
    .end local v7    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v22    # "sig":Ljava/security/Signature;
    .restart local v23    # "signatures":Ljava/nio/ByteBuffer;
    iget-object v0, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->verifiedSignatures:Ljava/util/Map;

    invoke-interface {v0, v14, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 431
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mContentDigestsToVerify:Ljava/util/Set;

    invoke-virtual {v14}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getContentDigestAlgorithm()Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_7
    .catch Ljava/security/InvalidKeyException; {:try_start_7 .. :try_end_7} :catch_7
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_7 .. :try_end_7} :catch_6
    .catch Ljava/security/SignatureException; {:try_start_7 .. :try_end_7} :catch_5

    .line 436
    nop

    .line 437
    .end local v4    # "sigBytes":[B
    .end local v10    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .end local v13    # "signature":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;
    .end local v14    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v15    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .end local v17    # "keyAlgorithm":Ljava/lang/String;
    .end local v21    # "publicKey":Ljava/security/PublicKey;
    .end local v22    # "sig":Ljava/security/Signature;
    move-object/from16 v0, v19

    move-object/from16 v4, v20

    move-object/from16 v7, v23

    const/4 v10, 0x1

    goto/16 :goto_2

    .line 432
    .restart local v10    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .restart local v13    # "signature":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;
    .restart local v14    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .restart local v15    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .restart local v17    # "keyAlgorithm":Ljava/lang/String;
    .restart local v21    # "publicKey":Ljava/security/PublicKey;
    :catch_5
    move-exception v0

    goto :goto_7

    :catch_6
    move-exception v0

    goto :goto_7

    :catch_7
    move-exception v0

    goto :goto_7

    .end local v23    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v7    # "signatures":Ljava/nio/ByteBuffer;
    :catch_8
    move-exception v0

    goto :goto_5

    :catch_9
    move-exception v0

    goto :goto_5

    :catch_a
    move-exception v0

    :goto_5
    move-object/from16 v23, v7

    .end local v7    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v23    # "signatures":Ljava/nio/ByteBuffer;
    goto :goto_7

    .end local v21    # "publicKey":Ljava/security/PublicKey;
    .end local v23    # "signatures":Ljava/nio/ByteBuffer;
    .local v4, "publicKey":Ljava/security/PublicKey;
    .restart local v7    # "signatures":Ljava/nio/ByteBuffer;
    :catch_b
    move-exception v0

    goto :goto_6

    :catch_c
    move-exception v0

    goto :goto_6

    :catch_d
    move-exception v0

    :goto_6
    move-object/from16 v21, v4

    move-object/from16 v23, v7

    .line 434
    .end local v4    # "publicKey":Ljava/security/PublicKey;
    .end local v7    # "signatures":Ljava/nio/ByteBuffer;
    .local v0, "e":Ljava/security/GeneralSecurityException;
    .restart local v21    # "publicKey":Ljava/security/PublicKey;
    .restart local v23    # "signatures":Ljava/nio/ByteBuffer;
    :goto_7
    sget-object v4, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v14, v0}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v2, v4, v7}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 435
    return-void

    .line 413
    .end local v0    # "e":Ljava/security/GeneralSecurityException;
    .end local v21    # "publicKey":Ljava/security/PublicKey;
    .end local v23    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v7    # "signatures":Ljava/nio/ByteBuffer;
    :catch_e
    move-exception v0

    move-object/from16 v23, v7

    .end local v7    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v23    # "signatures":Ljava/nio/ByteBuffer;
    goto :goto_8

    .end local v20    # "signedDataBytes":[B
    .end local v23    # "signatures":Ljava/nio/ByteBuffer;
    .local v4, "signedDataBytes":[B
    .restart local v7    # "signatures":Ljava/nio/ByteBuffer;
    :catch_f
    move-exception v0

    move-object/from16 v20, v4

    move-object/from16 v23, v7

    .line 414
    .end local v4    # "signedDataBytes":[B
    .end local v7    # "signatures":Ljava/nio/ByteBuffer;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v20    # "signedDataBytes":[B
    .restart local v23    # "signatures":Ljava/nio/ByteBuffer;
    :goto_8
    sget-object v4, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_PUBLIC_KEY:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v2, v4, v7}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 415
    return-void

    .line 440
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v10    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .end local v13    # "signature":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;
    .end local v14    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v15    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .end local v17    # "keyAlgorithm":Ljava/lang/String;
    .end local v20    # "signedDataBytes":[B
    .end local v23    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v4    # "signedDataBytes":[B
    .restart local v7    # "signatures":Ljava/nio/ByteBuffer;
    :cond_7
    move-object/from16 v20, v4

    move-object/from16 v23, v7

    .end local v4    # "signedDataBytes":[B
    .end local v7    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v20    # "signedDataBytes":[B
    .restart local v23    # "signatures":Ljava/nio/ByteBuffer;
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 441
    invoke-static {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 442
    .local v4, "digests":Ljava/nio/ByteBuffer;
    invoke-static {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 444
    .local v7, "certificates":Ljava/nio/ByteBuffer;
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v10

    .line 445
    .local v10, "signedMinSdkVersion":I
    if-eq v10, v5, :cond_8

    .line 446
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_MIN_SDK_VERSION_MISMATCH_BETWEEN_SIGNER_AND_SIGNED_DATA_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

    .line 448
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    .line 449
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    filled-new-array {v13, v14}, [Ljava/lang/Object;

    move-result-object v13

    .line 446
    invoke-virtual {v2, v0, v13}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 451
    :cond_8
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v13

    .line 452
    .local v13, "signedMaxSdkVersion":I
    if-eq v13, v6, :cond_9

    .line 453
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_MAX_SDK_VERSION_MISMATCH_BETWEEN_SIGNER_AND_SIGNED_DATA_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

    .line 455
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    .line 456
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    filled-new-array {v14, v15}, [Ljava/lang/Object;

    move-result-object v14

    .line 453
    invoke-virtual {v2, v0, v14}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 458
    :cond_9
    invoke-static {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v14

    .line 461
    .local v14, "additionalAttributes":Ljava/nio/ByteBuffer;
    const/4 v0, -0x1

    move v15, v0

    .line 462
    .local v15, "certificateIndex":I
    :goto_9
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 463
    add-int/lit8 v15, v15, 0x1

    .line 464
    move-object/from16 v17, v3

    .end local v3    # "signedData":Ljava/nio/ByteBuffer;
    .local v17, "signedData":Ljava/nio/ByteBuffer;
    invoke-static {v7}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v3

    .line 467
    .local v3, "encodedCert":[B
    move/from16 v19, v5

    move-object/from16 v5, p2

    .end local v5    # "parsedMinSdkVersion":I
    .local v19, "parsedMinSdkVersion":I
    :try_start_8
    invoke-static {v3, v5}, Lcom/android/apksig/internal/util/X509CertificateUtils;->generateCertificate([BLjava/security/cert/CertificateFactory;)Ljava/security/cert/X509Certificate;

    move-result-object v0
    :try_end_8
    .catch Ljava/security/cert/CertificateException; {:try_start_8 .. :try_end_8} :catch_10

    .line 475
    .local v0, "certificate":Ljava/security/cert/X509Certificate;
    nop

    .line 480
    new-instance v5, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;

    invoke-direct {v5, v0, v3}, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;-><init>(Ljava/security/cert/X509Certificate;[B)V

    move-object v0, v5

    .line 481
    iget-object v5, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->certs:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 482
    .end local v0    # "certificate":Ljava/security/cert/X509Certificate;
    .end local v3    # "encodedCert":[B
    move-object/from16 v3, v17

    move/from16 v5, v19

    goto :goto_9

    .line 468
    .restart local v3    # "encodedCert":[B
    :catch_10
    move-exception v0

    move-object v5, v0

    move-object v0, v5

    .line 469
    .local v0, "e":Ljava/security/cert/CertificateException;
    sget-object v5, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 471
    move-object/from16 v21, v3

    .end local v3    # "encodedCert":[B
    .local v21, "encodedCert":[B
    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    add-int/lit8 v16, v15, 0x1

    .line 472
    move/from16 v22, v6

    .end local v6    # "parsedMaxSdkVersion":I
    .local v22, "parsedMaxSdkVersion":I
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array {v3, v6, v0}, [Ljava/lang/Object;

    move-result-object v3

    .line 469
    invoke-virtual {v2, v5, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 474
    return-void

    .line 484
    .end local v0    # "e":Ljava/security/cert/CertificateException;
    .end local v17    # "signedData":Ljava/nio/ByteBuffer;
    .end local v19    # "parsedMinSdkVersion":I
    .end local v21    # "encodedCert":[B
    .end local v22    # "parsedMaxSdkVersion":I
    .local v3, "signedData":Ljava/nio/ByteBuffer;
    .restart local v5    # "parsedMinSdkVersion":I
    .restart local v6    # "parsedMaxSdkVersion":I
    :cond_a
    move-object/from16 v17, v3

    move/from16 v19, v5

    move/from16 v22, v6

    .end local v3    # "signedData":Ljava/nio/ByteBuffer;
    .end local v5    # "parsedMinSdkVersion":I
    .end local v6    # "parsedMaxSdkVersion":I
    .restart local v17    # "signedData":Ljava/nio/ByteBuffer;
    .restart local v19    # "parsedMinSdkVersion":I
    .restart local v22    # "parsedMaxSdkVersion":I
    iget-object v0, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->certs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 485
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_NO_CERTIFICATES:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 486
    return-void

    .line 488
    :cond_b
    const/4 v3, 0x0

    iget-object v0, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->certs:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ljava/security/cert/X509Certificate;

    .line 491
    .local v3, "mainCertificate":Ljava/security/cert/X509Certificate;
    :try_start_9
    invoke-virtual {v3}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v0

    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodePublicKey(Ljava/security/PublicKey;)[B

    move-result-object v0
    :try_end_9
    .catch Ljava/security/InvalidKeyException; {:try_start_9 .. :try_end_9} :catch_11

    .line 496
    .local v0, "certificatePublicKeyBytes":[B
    move-object v5, v0

    move-object/from16 v21, v7

    goto :goto_a

    .line 492
    .end local v0    # "certificatePublicKeyBytes":[B
    :catch_11
    move-exception v0

    .line 493
    .local v0, "e":Ljava/security/InvalidKeyException;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v21, v7

    .end local v7    # "certificates":Ljava/nio/ByteBuffer;
    .local v21, "certificates":Ljava/nio/ByteBuffer;
    const-string v7, "Caught an exception encoding the public key: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 494
    invoke-virtual {v0}, Ljava/security/InvalidKeyException;->printStackTrace()V

    .line 495
    invoke-virtual {v3}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v5

    invoke-interface {v5}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v5

    .line 497
    .end local v0    # "e":Ljava/security/InvalidKeyException;
    .local v5, "certificatePublicKeyBytes":[B
    :goto_a
    invoke-static {v8, v5}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_c

    .line 498
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

    .line 500
    invoke-static {v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->toHex([B)Ljava/lang/String;

    move-result-object v6

    .line 501
    invoke-static {v8}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->toHex([B)Ljava/lang/String;

    move-result-object v7

    filled-new-array {v6, v7}, [Ljava/lang/Object;

    move-result-object v6

    .line 498
    invoke-virtual {v2, v0, v6}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 502
    return-void

    .line 506
    :cond_c
    const/4 v0, 0x0

    move v6, v0

    .line 507
    .local v6, "digestCount":I
    :goto_b
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 508
    add-int/lit8 v6, v6, 0x1

    .line 510
    :try_start_a
    invoke-static {v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 511
    .local v0, "digest":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v7

    .line 512
    .local v7, "sigAlgorithmId":I
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v24

    move-object/from16 v25, v24

    .line 513
    .local v25, "digestBytes":[B
    move-object/from16 v24, v0

    .end local v0    # "digest":Ljava/nio/ByteBuffer;
    .local v24, "digest":Ljava/nio/ByteBuffer;
    iget-object v0, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->contentDigests:Ljava/util/List;
    :try_end_a
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_a .. :try_end_a} :catch_17
    .catch Ljava/nio/BufferUnderflowException; {:try_start_a .. :try_end_a} :catch_16

    move-object/from16 v26, v3

    .end local v3    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .local v26, "mainCertificate":Ljava/security/cert/X509Certificate;
    :try_start_b
    new-instance v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    :try_end_b
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_b .. :try_end_b} :catch_15
    .catch Ljava/nio/BufferUnderflowException; {:try_start_b .. :try_end_b} :catch_14

    move-object/from16 v27, v4

    move-object/from16 v4, v25

    .end local v25    # "digestBytes":[B
    .local v4, "digestBytes":[B
    .local v27, "digests":Ljava/nio/ByteBuffer;
    :try_start_c
    invoke-direct {v3, v7, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;-><init>(I[B)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_c
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_c .. :try_end_c} :catch_13
    .catch Ljava/nio/BufferUnderflowException; {:try_start_c .. :try_end_c} :catch_12

    .line 519
    move-object/from16 v3, v26

    move-object/from16 v4, v27

    .end local v4    # "digestBytes":[B
    .end local v7    # "sigAlgorithmId":I
    .end local v24    # "digest":Ljava/nio/ByteBuffer;
    goto :goto_b

    .line 516
    :catch_12
    move-exception v0

    goto :goto_e

    :catch_13
    move-exception v0

    goto :goto_e

    .end local v27    # "digests":Ljava/nio/ByteBuffer;
    .local v4, "digests":Ljava/nio/ByteBuffer;
    :catch_14
    move-exception v0

    goto :goto_c

    :catch_15
    move-exception v0

    :goto_c
    move-object/from16 v27, v4

    .end local v4    # "digests":Ljava/nio/ByteBuffer;
    .restart local v27    # "digests":Ljava/nio/ByteBuffer;
    goto :goto_e

    .end local v26    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .end local v27    # "digests":Ljava/nio/ByteBuffer;
    .restart local v3    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .restart local v4    # "digests":Ljava/nio/ByteBuffer;
    :catch_16
    move-exception v0

    goto :goto_d

    :catch_17
    move-exception v0

    :goto_d
    move-object/from16 v26, v3

    move-object/from16 v27, v4

    .line 517
    .end local v3    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .end local v4    # "digests":Ljava/nio/ByteBuffer;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v26    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .restart local v27    # "digests":Ljava/nio/ByteBuffer;
    :goto_e
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_DIGEST:Lcom/android/apksig/ApkVerifier$Issue;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 518
    return-void

    .line 522
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v26    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .end local v27    # "digests":Ljava/nio/ByteBuffer;
    .restart local v3    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .restart local v4    # "digests":Ljava/nio/ByteBuffer;
    :cond_d
    move-object/from16 v26, v3

    move-object/from16 v27, v4

    .end local v3    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .end local v4    # "digests":Ljava/nio/ByteBuffer;
    .restart local v26    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .restart local v27    # "digests":Ljava/nio/ByteBuffer;
    new-instance v0, Ljava/util/ArrayList;

    iget-object v3, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signatures:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    move-object v3, v0

    .line 523
    .local v3, "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v0, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signatures:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$Signature;

    .line 524
    .local v4, "signature":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$Signature;
    invoke-virtual {v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$Signature;->getAlgorithmId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 525
    .end local v4    # "signature":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$Signature;
    goto :goto_f

    .line 526
    :cond_e
    new-instance v0, Ljava/util/ArrayList;

    iget-object v4, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->contentDigests:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    move-object v4, v0

    .line 527
    .local v4, "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v0, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->contentDigests:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;

    .line 528
    .local v7, "digest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    invoke-virtual {v7}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;->getSignatureAlgorithmId()I

    move-result v24

    move-object/from16 v25, v0

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 529
    .end local v7    # "digest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    move-object/from16 v0, v25

    goto :goto_10

    .line 531
    :cond_f
    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 532
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_SIG_ALG_MISMATCH_BETWEEN_SIGNATURES_AND_DIGESTS_RECORDS:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v2, v0, v7}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 536
    return-void

    .line 540
    :cond_10
    const/4 v0, 0x0

    .line 541
    .local v0, "additionalAttributeCount":I
    const/4 v7, 0x0

    .line 542
    .local v7, "rotationAttrFound":Z
    :goto_11
    invoke-virtual {v14}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v24

    if-eqz v24, :cond_19

    .line 543
    add-int/lit8 v24, v0, 0x1

    .line 545
    .end local v0    # "additionalAttributeCount":I
    .local v24, "additionalAttributeCount":I
    nop

    .line 546
    :try_start_d
    invoke-static {v14}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    move-object/from16 v25, v0

    .line 547
    .local v25, "attribute":Ljava/nio/ByteBuffer;
    invoke-virtual/range {v25 .. v25}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    move/from16 v28, v0

    .line 548
    .local v28, "id":I
    invoke-static/range {v25 .. v25}, Lcom/android/apksig/internal/util/ByteBufferUtils;->toByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v0

    move-object/from16 v29, v0

    .line 549
    .local v29, "value":[B
    iget-object v0, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->additionalAttributes:Ljava/util/List;
    :try_end_d
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_d .. :try_end_d} :catch_25
    .catch Ljava/nio/BufferUnderflowException; {:try_start_d .. :try_end_d} :catch_24

    move-object/from16 v30, v3

    .end local v3    # "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v30, "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :try_start_e
    new-instance v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$AdditionalAttribute;
    :try_end_e
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_e .. :try_end_e} :catch_23
    .catch Ljava/nio/BufferUnderflowException; {:try_start_e .. :try_end_e} :catch_22

    move-object/from16 v31, v4

    move/from16 v4, v28

    move-object/from16 v28, v5

    move-object/from16 v5, v29

    .end local v29    # "value":[B
    .local v4, "id":I
    .local v5, "value":[B
    .local v28, "certificatePublicKeyBytes":[B
    .local v31, "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :try_start_f
    invoke-direct {v3, v4, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$AdditionalAttribute;-><init>(I[B)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_f
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_f .. :try_end_f} :catch_21
    .catch Ljava/nio/BufferUnderflowException; {:try_start_f .. :try_end_f} :catch_20

    .line 551
    const v0, 0x3ba06f8c

    if-ne v4, v0, :cond_12

    .line 554
    nop

    .line 555
    :try_start_10
    invoke-static {v5}, Lcom/android/apksig/SigningCertificateLineage;->readFromV3AttributeValue([B)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v0

    iput-object v0, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signingCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    .line 557
    iget-object v0, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signingCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    iget-object v3, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->certs:Ljava/util/List;
    :try_end_10
    .catch Ljava/lang/SecurityException; {:try_start_10 .. :try_end_10} :catch_1d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_10 .. :try_end_10} :catch_1c
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_1b
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_10 .. :try_end_10} :catch_21
    .catch Ljava/nio/BufferUnderflowException; {:try_start_10 .. :try_end_10} :catch_20

    .line 558
    move/from16 v29, v6

    const/4 v6, 0x0

    .end local v6    # "digestCount":I
    .local v29, "digestCount":I
    :try_start_11
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/security/cert/X509Certificate;

    invoke-virtual {v0, v3}, Lcom/android/apksig/SigningCertificateLineage;->getSubLineage(Ljava/security/cert/X509Certificate;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v0

    .line 559
    .local v0, "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    iget-object v3, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signingCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    invoke-virtual {v3}, Lcom/android/apksig/SigningCertificateLineage;->size()I

    move-result v3

    invoke-virtual {v0}, Lcom/android/apksig/SigningCertificateLineage;->size()I

    move-result v6

    if-eq v3, v6, :cond_11

    .line 560
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_POR_CERT_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    move-object/from16 v32, v0

    const/4 v6, 0x0

    .end local v0    # "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    .local v32, "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    new-array v0, v6, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V
    :try_end_11
    .catch Ljava/lang/SecurityException; {:try_start_11 .. :try_end_11} :catch_1a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_11 .. :try_end_11} :catch_19
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_18
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_11 .. :try_end_11} :catch_1f
    .catch Ljava/nio/BufferUnderflowException; {:try_start_11 .. :try_end_11} :catch_1e

    goto :goto_15

    .line 559
    .end local v32    # "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    .restart local v0    # "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    :cond_11
    move-object/from16 v32, v0

    .end local v0    # "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    .restart local v32    # "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    goto :goto_15

    .line 566
    .end local v32    # "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    :catch_18
    move-exception v0

    goto :goto_12

    .line 564
    :catch_19
    move-exception v0

    goto :goto_13

    .line 562
    :catch_1a
    move-exception v0

    goto :goto_14

    .line 566
    .end local v29    # "digestCount":I
    .restart local v6    # "digestCount":I
    :catch_1b
    move-exception v0

    move/from16 v29, v6

    .line 567
    .end local v6    # "digestCount":I
    .local v0, "e":Ljava/lang/Exception;
    .restart local v29    # "digestCount":I
    :goto_12
    :try_start_12
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_LINEAGE:Lcom/android/apksig/ApkVerifier$Issue;

    move-object/from16 v32, v0

    const/4 v6, 0x0

    .end local v0    # "e":Ljava/lang/Exception;
    .local v32, "e":Ljava/lang/Exception;
    new-array v0, v6, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .end local v32    # "e":Ljava/lang/Exception;
    goto :goto_15

    .line 564
    .end local v29    # "digestCount":I
    .restart local v6    # "digestCount":I
    :catch_1c
    move-exception v0

    move/from16 v29, v6

    .line 565
    .end local v6    # "digestCount":I
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    .restart local v29    # "digestCount":I
    :goto_13
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_POR_CERT_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    move-object/from16 v32, v0

    const/4 v6, 0x0

    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    .local v32, "e":Ljava/lang/IllegalArgumentException;
    new-array v0, v6, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .end local v32    # "e":Ljava/lang/IllegalArgumentException;
    goto :goto_15

    .line 562
    .end local v29    # "digestCount":I
    .restart local v6    # "digestCount":I
    :catch_1d
    move-exception v0

    move/from16 v29, v6

    .line 563
    .end local v6    # "digestCount":I
    .local v0, "e":Ljava/lang/SecurityException;
    .restart local v29    # "digestCount":I
    :goto_14
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_POR_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    move-object/from16 v32, v0

    const/4 v6, 0x0

    .end local v0    # "e":Ljava/lang/SecurityException;
    .local v32, "e":Ljava/lang/SecurityException;
    new-array v0, v6, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 568
    .end local v32    # "e":Ljava/lang/SecurityException;
    :goto_15
    const/4 v3, 0x1

    goto/16 :goto_19

    .line 569
    .end local v29    # "digestCount":I
    .restart local v6    # "digestCount":I
    :cond_12
    move/from16 v29, v6

    .end local v6    # "digestCount":I
    .restart local v29    # "digestCount":I
    const v0, 0x559f8b02

    if-ne v4, v0, :cond_16

    .line 570
    const/4 v7, 0x1

    .line 573
    iget v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mMaxSdkVersion:I

    const/16 v3, 0x21

    if-lt v0, v3, :cond_15

    iget-boolean v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mFullVerification:Z

    if-eqz v0, :cond_15

    .line 575
    invoke-static {v5}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 576
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 577
    .local v0, "attrRotationMinSdkVersion":I
    iget-object v3, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    invoke-virtual {v3}, Ljava/util/OptionalInt;->isPresent()Z

    move-result v3

    if-eqz v3, :cond_14

    .line 578
    iget-object v3, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    invoke-virtual {v3}, Ljava/util/OptionalInt;->getAsInt()I

    move-result v3

    .line 579
    .local v3, "rotationMinSdkVersion":I
    if-eq v0, v3, :cond_13

    .line 580
    sget-object v6, Lcom/android/apksig/ApkVerifier$Issue;->V31_ROTATION_MIN_SDK_MISMATCH:Lcom/android/apksig/ApkVerifier$Issue;

    move-object/from16 v32, v5

    .end local v5    # "value":[B
    .local v32, "value":[B
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    .line 581
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    const/16 v16, 0x0

    aput-object v33, v5, v16

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    const/16 v18, 0x1

    aput-object v33, v5, v18

    .line 580
    invoke-virtual {v2, v6, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    goto :goto_16

    .line 579
    .end local v32    # "value":[B
    .restart local v5    # "value":[B
    :cond_13
    move-object/from16 v32, v5

    .line 583
    .end local v3    # "rotationMinSdkVersion":I
    .end local v5    # "value":[B
    .restart local v32    # "value":[B
    :goto_16
    goto :goto_17

    .line 584
    .end local v32    # "value":[B
    .restart local v5    # "value":[B
    :cond_14
    move-object/from16 v32, v5

    .end local v5    # "value":[B
    .restart local v32    # "value":[B
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V31_BLOCK_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/16 v16, 0x0

    aput-object v5, v6, v16

    invoke-virtual {v2, v3, v6}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 586
    .end local v0    # "attrRotationMinSdkVersion":I
    :goto_17
    goto :goto_18

    .line 573
    .end local v32    # "value":[B
    .restart local v5    # "value":[B
    :cond_15
    move-object/from16 v32, v5

    .line 601
    .end local v4    # "id":I
    .end local v5    # "value":[B
    .end local v25    # "attribute":Ljava/nio/ByteBuffer;
    :goto_18
    const/4 v3, 0x1

    goto :goto_19

    .line 597
    :catch_1e
    move-exception v0

    goto :goto_1d

    :catch_1f
    move-exception v0

    goto :goto_1d

    .line 587
    .restart local v4    # "id":I
    .restart local v5    # "value":[B
    .restart local v25    # "attribute":Ljava/nio/ByteBuffer;
    :cond_16
    move-object/from16 v32, v5

    .end local v5    # "value":[B
    .restart local v32    # "value":[B
    const v0, -0x3d594c46

    if-ne v4, v0, :cond_18

    .line 591
    iget v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mBlockId:I

    const v3, 0x1b93ad61

    if-eq v0, v3, :cond_17

    .line 592
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V31_ROTATION_TARGETS_DEV_RELEASE_ATTR_ON_V3_SIGNER:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v3, 0x0

    new-array v5, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addWarning(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    const/4 v3, 0x1

    goto :goto_19

    .line 591
    :cond_17
    const/4 v3, 0x1

    goto :goto_19

    .line 595
    :cond_18
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_UNKNOWN_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v3, 0x1

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/16 v16, 0x0

    aput-object v6, v5, v16

    invoke-virtual {v2, v0, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addWarning(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V
    :try_end_12
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_12 .. :try_end_12} :catch_1f
    .catch Ljava/nio/BufferUnderflowException; {:try_start_12 .. :try_end_12} :catch_1e

    .line 601
    .end local v4    # "id":I
    .end local v25    # "attribute":Ljava/nio/ByteBuffer;
    .end local v32    # "value":[B
    :goto_19
    move/from16 v0, v24

    move-object/from16 v5, v28

    move/from16 v6, v29

    move-object/from16 v3, v30

    move-object/from16 v4, v31

    goto/16 :goto_11

    .line 597
    .end local v29    # "digestCount":I
    .restart local v6    # "digestCount":I
    :catch_20
    move-exception v0

    goto :goto_1a

    :catch_21
    move-exception v0

    :goto_1a
    move/from16 v29, v6

    .end local v6    # "digestCount":I
    .restart local v29    # "digestCount":I
    goto :goto_1d

    .end local v28    # "certificatePublicKeyBytes":[B
    .end local v29    # "digestCount":I
    .end local v31    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v4, "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v5, "certificatePublicKeyBytes":[B
    .restart local v6    # "digestCount":I
    :catch_22
    move-exception v0

    goto :goto_1b

    :catch_23
    move-exception v0

    :goto_1b
    move-object/from16 v31, v4

    move-object/from16 v28, v5

    move/from16 v29, v6

    .end local v4    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v5    # "certificatePublicKeyBytes":[B
    .end local v6    # "digestCount":I
    .restart local v28    # "certificatePublicKeyBytes":[B
    .restart local v29    # "digestCount":I
    .restart local v31    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    goto :goto_1d

    .end local v28    # "certificatePublicKeyBytes":[B
    .end local v29    # "digestCount":I
    .end local v30    # "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v31    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v3, "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v4    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v5    # "certificatePublicKeyBytes":[B
    .restart local v6    # "digestCount":I
    :catch_24
    move-exception v0

    goto :goto_1c

    :catch_25
    move-exception v0

    :goto_1c
    move-object/from16 v30, v3

    move-object/from16 v31, v4

    move-object/from16 v28, v5

    move/from16 v29, v6

    .line 598
    .end local v3    # "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v4    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v5    # "certificatePublicKeyBytes":[B
    .end local v6    # "digestCount":I
    .local v0, "e":Ljava/lang/Exception;
    .restart local v28    # "certificatePublicKeyBytes":[B
    .restart local v29    # "digestCount":I
    .restart local v30    # "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v31    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :goto_1d
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 599
    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 598
    invoke-virtual {v2, v3, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 600
    return-void

    .line 603
    .end local v24    # "additionalAttributeCount":I
    .end local v28    # "certificatePublicKeyBytes":[B
    .end local v29    # "digestCount":I
    .end local v30    # "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v31    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v0, "additionalAttributeCount":I
    .restart local v3    # "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v4    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v5    # "certificatePublicKeyBytes":[B
    .restart local v6    # "digestCount":I
    :cond_19
    move-object/from16 v30, v3

    move-object/from16 v31, v4

    move-object/from16 v28, v5

    move/from16 v29, v6

    .end local v3    # "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v4    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v5    # "certificatePublicKeyBytes":[B
    .end local v6    # "digestCount":I
    .restart local v28    # "certificatePublicKeyBytes":[B
    .restart local v29    # "digestCount":I
    .restart local v30    # "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v31    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-boolean v3, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mFullVerification:Z

    if-eqz v3, :cond_1a

    iget-object v3, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    invoke-virtual {v3}, Ljava/util/OptionalInt;->isPresent()Z

    move-result v3

    if-eqz v3, :cond_1a

    if-nez v7, :cond_1a

    .line 604
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V31_ROTATION_MIN_SDK_ATTR_MISSING:Lcom/android/apksig/ApkVerifier$Issue;

    iget-object v4, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    .line 605
    invoke-virtual {v4}, Ljava/util/OptionalInt;->getAsInt()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 604
    invoke-virtual {v2, v3, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addWarning(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 607
    :cond_1a
    return-void

    .line 397
    .end local v0    # "additionalAttributeCount":I
    .end local v10    # "signedMinSdkVersion":I
    .end local v13    # "signedMaxSdkVersion":I
    .end local v14    # "additionalAttributes":Ljava/nio/ByteBuffer;
    .end local v15    # "certificateIndex":I
    .end local v17    # "signedData":Ljava/nio/ByteBuffer;
    .end local v19    # "parsedMinSdkVersion":I
    .end local v20    # "signedDataBytes":[B
    .end local v21    # "certificates":Ljava/nio/ByteBuffer;
    .end local v22    # "parsedMaxSdkVersion":I
    .end local v23    # "signatures":Ljava/nio/ByteBuffer;
    .end local v26    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .end local v27    # "digests":Ljava/nio/ByteBuffer;
    .end local v28    # "certificatePublicKeyBytes":[B
    .end local v29    # "digestCount":I
    .end local v30    # "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v31    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v3, "signedData":Ljava/nio/ByteBuffer;
    .local v4, "signedDataBytes":[B
    .local v5, "parsedMinSdkVersion":I
    .local v6, "parsedMaxSdkVersion":I
    .local v7, "signatures":Ljava/nio/ByteBuffer;
    :catch_26
    move-exception v0

    move-object/from16 v17, v3

    move-object/from16 v20, v4

    move/from16 v19, v5

    move/from16 v22, v6

    move-object/from16 v23, v7

    .line 398
    .end local v3    # "signedData":Ljava/nio/ByteBuffer;
    .end local v4    # "signedDataBytes":[B
    .end local v5    # "parsedMinSdkVersion":I
    .end local v6    # "parsedMaxSdkVersion":I
    .end local v7    # "signatures":Ljava/nio/ByteBuffer;
    .local v0, "e":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$NoSupportedSignaturesException;
    .restart local v17    # "signedData":Ljava/nio/ByteBuffer;
    .restart local v19    # "parsedMinSdkVersion":I
    .restart local v20    # "signedDataBytes":[B
    .restart local v22    # "parsedMaxSdkVersion":I
    .restart local v23    # "signatures":Ljava/nio/ByteBuffer;
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_NO_SUPPORTED_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 399
    return-void
.end method

.method public static parseSigners(Ljava/nio/ByteBuffer;Ljava/util/Set;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V
    .locals 3
    .param p0, "apkSignatureSchemeV3Block"    # Ljava/nio/ByteBuffer;
    .param p2, "result"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "apkSignatureSchemeV3Block",
            "contentDigestsToVerify",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            "Ljava/util/Set<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            ">;",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 259
    .local p1, "contentDigestsToVerify":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    :try_start_0
    new-instance v0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;

    invoke-direct {v0, p0}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;-><init>(Ljava/nio/ByteBuffer;)V

    .line 260
    invoke-virtual {v0, p2}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->setResult(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;

    move-result-object v0

    .line 261
    invoke-virtual {v0, p1}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->setContentDigestsToVerify(Ljava/util/Set;)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;

    move-result-object v0

    .line 262
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->setFullVerification(Z)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;

    move-result-object v0

    .line 263
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->build()Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;

    move-result-object v0

    .line 264
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->parseSigners()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 269
    nop

    .line 270
    return-void

    .line 265
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 267
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "An exception was encountered when attempting to parse the signers from the provided APK Signature Scheme v3 block"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static verify(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;II)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .locals 2
    .param p0, "executor"    # Lcom/android/apksig/util/RunnablesExecutor;
    .param p1, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p2, "zipSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .param p3, "minSdkVersion"    # I
    .param p4, "maxSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "executor",
            "apk",
            "zipSections",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;,
            Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;
        }
    .end annotation

    .line 138
    new-instance v0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;-><init>(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;II)V

    .line 139
    invoke-virtual {v0, p0}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->setRunnablesExecutor(Lcom/android/apksig/util/RunnablesExecutor;)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;

    move-result-object v0

    .line 140
    const v1, -0xfac9740

    invoke-virtual {v0, v1}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->setBlockId(I)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;

    move-result-object v0

    .line 141
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->build()Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;

    move-result-object v0

    .line 142
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->verify()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    move-result-object v0

    .line 138
    return-object v0
.end method


# virtual methods
.method public parseSigners()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;,
            Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;
        }
    .end annotation

    .line 288
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mApkSignatureSchemeV3Block:Ljava/nio/ByteBuffer;

    if-nez v1, :cond_0

    .line 289
    iget-object v1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mApk:Lcom/android/apksig/util/DataSource;

    iget-object v2, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mZipSections:Lcom/android/apksig/apk/ApkUtils$ZipSections;

    iget v3, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mBlockId:I

    iget-object v4, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    .line 290
    invoke-static {v1, v2, v3, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Lcom/android/apksig/internal/apk/SignatureInfo;

    move-result-object v1

    .line 291
    .local v1, "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    iget-object v2, v1, Lcom/android/apksig/internal/apk/SignatureInfo;->signatureBlock:Ljava/nio/ByteBuffer;

    iput-object v2, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mApkSignatureSchemeV3Block:Ljava/nio/ByteBuffer;

    .line 293
    .end local v1    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    :cond_0
    iget-object v1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mApkSignatureSchemeV3Block:Ljava/nio/ByteBuffer;

    invoke-static {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v1
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_3

    .line 297
    .local v1, "signers":Ljava/nio/ByteBuffer;
    nop

    .line 298
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-nez v2, :cond_1

    .line 299
    iget-object v2, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_NO_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 300
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    return-object v0

    .line 305
    :cond_1
    :try_start_1
    const-string v2, "X.509"

    invoke-static {v2}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v2
    :try_end_1
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_1} :catch_2

    .line 308
    .local v2, "certFactory":Ljava/security/cert/CertificateFactory;
    nop

    .line 309
    const/4 v3, 0x0

    .line 310
    .local v3, "signerCount":I
    :goto_0
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 311
    move v4, v3

    .line 312
    .local v4, "signerIndex":I
    add-int/lit8 v3, v3, 0x1

    .line 313
    new-instance v5, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    invoke-direct {v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;-><init>()V

    .line 315
    .local v5, "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    iput v4, v5, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->index:I

    .line 316
    iget-object v6, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    iget-object v6, v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 318
    :try_start_2
    invoke-static {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 319
    .local v6, "signer":Ljava/nio/ByteBuffer;
    invoke-direct {p0, v6, v2, v5}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->parseSigner(Ljava/nio/ByteBuffer;Ljava/security/cert/CertificateFactory;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;)V
    :try_end_2
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/nio/BufferUnderflowException; {:try_start_2 .. :try_end_2} :catch_0

    .line 323
    .end local v6    # "signer":Ljava/nio/ByteBuffer;
    nop

    .line 324
    .end local v4    # "signerIndex":I
    .end local v5    # "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    goto :goto_0

    .line 320
    .restart local v4    # "signerIndex":I
    .restart local v5    # "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    :catch_0
    move-exception v6

    goto :goto_1

    :catch_1
    move-exception v6

    .line 321
    .local v6, "e":Ljava/lang/Exception;
    :goto_1
    sget-object v7, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_SIGNER:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {v5, v7, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 322
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    return-object v0

    .line 325
    .end local v4    # "signerIndex":I
    .end local v5    # "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_2
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    return-object v0

    .line 306
    .end local v2    # "certFactory":Ljava/security/cert/CertificateFactory;
    .end local v3    # "signerCount":I
    :catch_2
    move-exception v0

    .line 307
    .local v0, "e":Ljava/security/cert/CertificateException;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Failed to obtain X.509 CertificateFactory"

    invoke-direct {v2, v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 294
    .end local v0    # "e":Ljava/security/cert/CertificateException;
    .end local v1    # "signers":Ljava/nio/ByteBuffer;
    :catch_3
    move-exception v1

    .line 295
    .local v1, "e":Lcom/android/apksig/apk/ApkFormatException;
    iget-object v2, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V3_SIG_MALFORMED_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 296
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    return-object v0
.end method

.method public verify()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;,
            Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;
        }
    .end annotation

    .line 156
    move-object/from16 v1, p0

    iget-object v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mApk:Lcom/android/apksig/util/DataSource;

    if-eqz v0, :cond_b

    iget-object v2, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mZipSections:Lcom/android/apksig/apk/ApkUtils$ZipSections;

    if-eqz v2, :cond_b

    .line 161
    iget v3, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mBlockId:I

    iget-object v4, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    .line 162
    invoke-static {v0, v2, v3, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Lcom/android/apksig/internal/apk/SignatureInfo;

    move-result-object v2

    .line 163
    .local v2, "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    iget-object v0, v2, Lcom/android/apksig/internal/apk/SignatureInfo;->signatureBlock:Ljava/nio/ByteBuffer;

    iput-object v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mApkSignatureSchemeV3Block:Ljava/nio/ByteBuffer;

    .line 165
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mApk:Lcom/android/apksig/util/DataSource;

    const-wide/16 v3, 0x0

    iget-wide v5, v2, Lcom/android/apksig/internal/apk/SignatureInfo;->apkSigningBlockOffset:J

    invoke-interface {v0, v3, v4, v5, v6}, Lcom/android/apksig/util/DataSource;->slice(JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v3

    .line 166
    .local v3, "beforeApkSigningBlock":Lcom/android/apksig/util/DataSource;
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mApk:Lcom/android/apksig/util/DataSource;

    iget-wide v4, v2, Lcom/android/apksig/internal/apk/SignatureInfo;->centralDirOffset:J

    iget-wide v6, v2, Lcom/android/apksig/internal/apk/SignatureInfo;->eocdOffset:J

    iget-wide v8, v2, Lcom/android/apksig/internal/apk/SignatureInfo;->centralDirOffset:J

    sub-long/2addr v6, v8

    .line 167
    invoke-interface {v0, v4, v5, v6, v7}, Lcom/android/apksig/util/DataSource;->slice(JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v4

    .line 170
    .local v4, "centralDir":Lcom/android/apksig/util/DataSource;
    iget-object v5, v2, Lcom/android/apksig/internal/apk/SignatureInfo;->eocd:Ljava/nio/ByteBuffer;

    .line 172
    .local v5, "eocd":Ljava/nio/ByteBuffer;
    invoke-virtual/range {p0 .. p0}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->parseSigners()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    .line 174
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->containsErrors()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 175
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    return-object v0

    .line 177
    :cond_0
    iget-object v7, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    iget-object v11, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mContentDigestsToVerify:Ljava/util/Set;

    iget-object v12, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    move-object v8, v3

    move-object v9, v4

    move-object v10, v5

    invoke-static/range {v7 .. v12}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->verifyIntegrity(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/nio/ByteBuffer;Ljava/util/Set;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V

    .line 183
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    move-object v6, v0

    .line 184
    .local v6, "sortedSigners":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Integer;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;>;"
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    iget-object v0, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    .line 185
    .local v7, "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    iget v8, v7, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->minSdkVersion:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v6, v8, v7}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    .end local v7    # "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    goto :goto_0

    .line 189
    :cond_1
    const/4 v0, 0x0

    .line 190
    .local v0, "firstMin":I
    const/4 v7, 0x0

    .line 191
    .local v7, "lastMax":I
    const/4 v8, 0x0

    .line 194
    .local v8, "lastLineageSize":I
    new-instance v9, Ljava/util/ArrayList;

    iget-object v10, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    iget-object v10, v10, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 196
    .local v9, "lineages":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/SigningCertificateLineage;>;"
    invoke-interface {v6}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    const/4 v12, 0x0

    if-eqz v11, :cond_6

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    .line 197
    .local v11, "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    iget v13, v11, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->minSdkVersion:I

    .line 198
    .local v13, "currentMin":I
    iget v14, v11, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->maxSdkVersion:I

    .line 199
    .local v14, "currentMax":I
    if-nez v0, :cond_2

    .line 201
    move v0, v13

    goto :goto_2

    .line 203
    :cond_2
    add-int/lit8 v15, v7, 0x1

    if-eq v13, v15, :cond_3

    .line 204
    iget-object v10, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    sget-object v15, Lcom/android/apksig/ApkVerifier$Issue;->V3_INCONSISTENT_SDK_VERSIONS:Lcom/android/apksig/ApkVerifier$Issue;

    move/from16 v16, v0

    .end local v0    # "firstMin":I
    .local v16, "firstMin":I
    new-array v0, v12, [Ljava/lang/Object;

    invoke-virtual {v10, v15, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 205
    move-object/from16 v17, v2

    goto :goto_4

    .line 203
    .end local v16    # "firstMin":I
    .restart local v0    # "firstMin":I
    :cond_3
    move/from16 v16, v0

    .line 208
    :goto_2
    move v7, v14

    .line 211
    iget-object v15, v11, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signingCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    if-eqz v15, :cond_5

    .line 212
    iget-object v15, v11, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signingCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    invoke-virtual {v15}, Lcom/android/apksig/SigningCertificateLineage;->size()I

    move-result v15

    .line 213
    .local v15, "currLineageSize":I
    if-ge v15, v8, :cond_4

    .line 214
    iget-object v10, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    move/from16 v16, v0

    .end local v0    # "firstMin":I
    .restart local v16    # "firstMin":I
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V3_INCONSISTENT_LINEAGES:Lcom/android/apksig/ApkVerifier$Issue;

    move-object/from16 v17, v2

    .end local v2    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    .local v17, "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    new-array v2, v12, [Ljava/lang/Object;

    invoke-virtual {v10, v0, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 215
    move/from16 v2, v16

    goto :goto_5

    .line 217
    .end local v16    # "firstMin":I
    .end local v17    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    .restart local v0    # "firstMin":I
    .restart local v2    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    :cond_4
    move/from16 v16, v0

    move-object/from16 v17, v2

    .end local v0    # "firstMin":I
    .end local v2    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    .restart local v16    # "firstMin":I
    .restart local v17    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    move v0, v15

    .line 218
    .end local v8    # "lastLineageSize":I
    .local v0, "lastLineageSize":I
    iget-object v2, v11, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signingCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v8, v0

    goto :goto_3

    .line 211
    .end local v15    # "currLineageSize":I
    .end local v16    # "firstMin":I
    .end local v17    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    .local v0, "firstMin":I
    .restart local v2    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    .restart local v8    # "lastLineageSize":I
    :cond_5
    move/from16 v16, v0

    move-object/from16 v17, v2

    .line 220
    .end local v0    # "firstMin":I
    .end local v2    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    .end local v11    # "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    .end local v13    # "currentMin":I
    .end local v14    # "currentMax":I
    .restart local v16    # "firstMin":I
    .restart local v17    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    :goto_3
    move/from16 v0, v16

    move-object/from16 v2, v17

    goto :goto_1

    .line 196
    .end local v16    # "firstMin":I
    .end local v17    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    .restart local v0    # "firstMin":I
    .restart local v2    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    :cond_6
    move/from16 v16, v0

    move-object/from16 v17, v2

    .line 224
    .end local v0    # "firstMin":I
    .end local v2    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    .restart local v16    # "firstMin":I
    .restart local v17    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    :goto_4
    move/from16 v2, v16

    .end local v16    # "firstMin":I
    .local v2, "firstMin":I
    :goto_5
    iget v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mMinSdkVersion:I

    const/4 v10, 0x1

    if-gt v2, v0, :cond_8

    .line 225
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    invoke-virtual {v0}, Ljava/util/OptionalInt;->isPresent()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 226
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    invoke-virtual {v0}, Ljava/util/OptionalInt;->getAsInt()I

    move-result v0

    sub-int/2addr v0, v10

    goto :goto_6

    :cond_7
    iget v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mMaxSdkVersion:I

    :goto_6
    if-ge v7, v0, :cond_9

    .line 227
    :cond_8
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    sget-object v11, Lcom/android/apksig/ApkVerifier$Issue;->V3_MISSING_SDK_VERSIONS:Lcom/android/apksig/ApkVerifier$Issue;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    filled-new-array {v13, v14}, [Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v0, v11, v13}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 231
    :cond_9
    :try_start_0
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    .line 232
    invoke-static {v9}, Lcom/android/apksig/SigningCertificateLineage;->consolidateLineages(Ljava/util/List;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v11

    iput-object v11, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signingCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 235
    goto :goto_7

    .line 233
    :catch_0
    move-exception v0

    .line 234
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    iget-object v11, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    sget-object v13, Lcom/android/apksig/ApkVerifier$Issue;->V3_INCONSISTENT_LINEAGES:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v12, v12, [Ljava/lang/Object;

    invoke-virtual {v11, v13, v12}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 236
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :goto_7
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->containsErrors()Z

    move-result v0

    if-nez v0, :cond_a

    .line 237
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    iput-boolean v10, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->verified:Z

    .line 239
    :cond_a
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    return-object v0

    .line 157
    .end local v2    # "firstMin":I
    .end local v3    # "beforeApkSigningBlock":Lcom/android/apksig/util/DataSource;
    .end local v4    # "centralDir":Lcom/android/apksig/util/DataSource;
    .end local v5    # "eocd":Ljava/nio/ByteBuffer;
    .end local v6    # "sortedSigners":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/Integer;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;>;"
    .end local v7    # "lastMax":I
    .end local v8    # "lastLineageSize":I
    .end local v9    # "lineages":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/SigningCertificateLineage;>;"
    .end local v17    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    :cond_b
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "A non-null apk and zip sections must be specified to verify an APK\'s v3 signatures"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
