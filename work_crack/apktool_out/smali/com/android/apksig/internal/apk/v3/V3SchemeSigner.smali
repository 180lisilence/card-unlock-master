.class public Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;
.super Ljava/lang/Object;
.source "V3SchemeSigner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;,
        Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock;
    }
.end annotation


# static fields
.field public static final APK_SIGNATURE_SCHEME_V3_BLOCK_ID:I = -0xfac9740

.field public static final PROOF_OF_ROTATION_ATTR_ID:I = 0x3ba06f8c


# instance fields
.field private final mBeforeCentralDir:Lcom/android/apksig/util/DataSource;

.field private final mBlockId:I

.field private final mCentralDir:Lcom/android/apksig/util/DataSource;

.field private final mEocd:Lcom/android/apksig/util/DataSource;

.field private final mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

.field private final mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

.field private final mRotationTargetsDevRelease:Z

.field private final mSignerConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/util/List;Lcom/android/apksig/util/RunnablesExecutor;ILjava/util/OptionalInt;Z)V
    .locals 0
    .param p1, "beforeCentralDir"    # Lcom/android/apksig/util/DataSource;
    .param p2, "centralDir"    # Lcom/android/apksig/util/DataSource;
    .param p3, "eocd"    # Lcom/android/apksig/util/DataSource;
    .param p5, "executor"    # Lcom/android/apksig/util/RunnablesExecutor;
    .param p6, "blockId"    # I
    .param p7, "optionalRotationMinSdkVersion"    # Ljava/util/OptionalInt;
    .param p8, "rotationTargetsDevRelease"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
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
            "beforeCentralDir",
            "centralDir",
            "eocd",
            "signerConfigs",
            "executor",
            "blockId",
            "optionalRotationMinSdkVersion",
            "rotationTargetsDevRelease"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/util/DataSource;",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            ">;",
            "Lcom/android/apksig/util/RunnablesExecutor;",
            "I",
            "Ljava/util/OptionalInt;",
            "Z)V"
        }
    .end annotation

    .line 83
    .local p4, "signerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mBeforeCentralDir:Lcom/android/apksig/util/DataSource;

    .line 85
    iput-object p2, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mCentralDir:Lcom/android/apksig/util/DataSource;

    .line 86
    iput-object p3, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mEocd:Lcom/android/apksig/util/DataSource;

    .line 87
    iput-object p4, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mSignerConfigs:Ljava/util/List;

    .line 88
    iput-object p5, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    .line 89
    iput p6, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mBlockId:I

    .line 90
    iput-object p7, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    .line 91
    iput-boolean p8, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mRotationTargetsDevRelease:Z

    .line 92
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/util/List;Lcom/android/apksig/util/RunnablesExecutor;ILjava/util/OptionalInt;ZLcom/android/apksig/internal/apk/v3/V3SchemeSigner$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/apksig/util/DataSource;
    .param p2, "x1"    # Lcom/android/apksig/util/DataSource;
    .param p3, "x2"    # Lcom/android/apksig/util/DataSource;
    .param p4, "x3"    # Ljava/util/List;
    .param p5, "x4"    # Lcom/android/apksig/util/RunnablesExecutor;
    .param p6, "x5"    # I
    .param p7, "x6"    # Ljava/util/OptionalInt;
    .param p8, "x7"    # Z
    .param p9, "x8"    # Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$1;

    .line 62
    invoke-direct/range {p0 .. p8}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;-><init>(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/util/List;Lcom/android/apksig/util/RunnablesExecutor;ILjava/util/OptionalInt;Z)V

    return-void
.end method

.method private encodeSignedData(Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;)[B
    .locals 6
    .param p1, "signedData"    # Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signedData"
        }
    .end annotation

    .line 345
    iget-object v0, p1, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;->digests:Ljava/util/List;

    .line 347
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedPairsOfIntAndLengthPrefixedBytes(Ljava/util/List;)[B

    move-result-object v0

    .line 346
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsLengthPrefixedElement([B)[B

    move-result-object v0

    .line 349
    .local v0, "digests":[B
    iget-object v1, p1, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;->certificates:Ljava/util/List;

    .line 351
    invoke-static {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedElements(Ljava/util/List;)[B

    move-result-object v1

    .line 350
    invoke-static {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsLengthPrefixedElement([B)[B

    move-result-object v1

    .line 352
    .local v1, "certs":[B
    iget-object v2, p1, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;->additionalAttributes:[B

    invoke-static {v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsLengthPrefixedElement([B)[B

    move-result-object v2

    .line 367
    .local v2, "attributes":[B
    array-length v3, v0

    array-length v4, v1

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x4

    add-int/lit8 v3, v3, 0x4

    array-length v4, v2

    add-int/2addr v3, v4

    .line 369
    .local v3, "payloadSize":I
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 370
    .local v4, "result":Ljava/nio/ByteBuffer;
    sget-object v5, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 371
    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 372
    invoke-virtual {v4, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 373
    iget v5, p1, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;->minSdkVersion:I

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 374
    iget v5, p1, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;->maxSdkVersion:I

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 375
    invoke-virtual {v4, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 377
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    return-object v5
.end method

.method private encodeSigner(Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;)[B
    .locals 6
    .param p1, "signer"    # Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signer"
        }
    .end annotation

    .line 316
    iget-object v0, p1, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;->signedData:[B

    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsLengthPrefixedElement([B)[B

    move-result-object v0

    .line 317
    .local v0, "signedData":[B
    iget-object v1, p1, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;->signatures:Ljava/util/List;

    .line 319
    invoke-static {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedPairsOfIntAndLengthPrefixedBytes(Ljava/util/List;)[B

    move-result-object v1

    .line 318
    invoke-static {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsLengthPrefixedElement([B)[B

    move-result-object v1

    .line 321
    .local v1, "signatures":[B
    iget-object v2, p1, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;->publicKey:[B

    invoke-static {v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsLengthPrefixedElement([B)[B

    move-result-object v2

    .line 331
    .local v2, "publicKey":[B
    array-length v3, v0

    add-int/lit8 v3, v3, 0x4

    add-int/lit8 v3, v3, 0x4

    array-length v4, v1

    add-int/2addr v3, v4

    array-length v4, v2

    add-int/2addr v3, v4

    .line 333
    .local v3, "payloadSize":I
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 334
    .local v4, "result":Ljava/nio/ByteBuffer;
    sget-object v5, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 335
    invoke-virtual {v4, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 336
    iget v5, p1, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;->minSdkVersion:I

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 337
    iget v5, p1, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;->maxSdkVersion:I

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 338
    invoke-virtual {v4, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 339
    invoke-virtual {v4, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 341
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    return-object v5
.end method

.method private generateAdditionalAttributes(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;)[B
    .locals 6
    .param p1, "signerConfig"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signerConfig"
        }
    .end annotation

    .line 381
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 382
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    invoke-static {v0}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->generateV3SignerAttribute(Lcom/android/apksig/SigningCertificateLineage;)[B

    move-result-object v0

    .line 385
    .local v0, "lineageAttr":[B
    iget-boolean v2, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mRotationTargetsDevRelease:Z

    if-eqz v2, :cond_1

    iget v2, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mBlockId:I

    const v3, 0x1b93ad61

    if-eq v2, v3, :cond_0

    goto :goto_0

    .line 389
    :cond_0
    invoke-static {}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->generateV31RotationTargetsDevReleaseAttribute()[B

    move-result-object v2

    .line 390
    .local v2, "devReleaseRotationAttr":[B
    array-length v3, v0

    array-length v4, v2

    add-int/2addr v3, v4

    new-array v3, v3, [B

    .line 391
    .local v3, "attributes":[B
    array-length v4, v0

    invoke-static {v0, v1, v3, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 392
    array-length v4, v0

    array-length v5, v2

    invoke-static {v2, v1, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 394
    return-object v3

    .line 387
    .end local v2    # "devReleaseRotationAttr":[B
    .end local v3    # "attributes":[B
    :cond_1
    :goto_0
    return-object v0

    .line 395
    .end local v0    # "lineageAttr":[B
    :cond_2
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    invoke-virtual {v0}, Ljava/util/OptionalInt;->isPresent()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 396
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    .line 397
    invoke-virtual {v0}, Ljava/util/OptionalInt;->getAsInt()I

    move-result v0

    .line 396
    invoke-static {v0}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->generateV3RotationMinSdkVersionStrippingProtectionAttribute(I)[B

    move-result-object v0

    return-object v0

    .line 399
    :cond_3
    new-array v0, v1, [B

    return-object v0
.end method

.method public static generateApkSignatureSchemeV3Block(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/util/List;)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;
    .locals 2
    .param p0, "executor"    # Lcom/android/apksig/util/RunnablesExecutor;
    .param p1, "beforeCentralDir"    # Lcom/android/apksig/util/DataSource;
    .param p2, "centralDir"    # Lcom/android/apksig/util/DataSource;
    .param p3, "eocd"    # Lcom/android/apksig/util/DataSource;
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
            "beforeCentralDir",
            "centralDir",
            "eocd",
            "signerConfigs"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/RunnablesExecutor;",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/util/DataSource;",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            ">;)",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 166
    .local p4, "signerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    new-instance v0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;-><init>(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/util/List;)V

    .line 167
    invoke-virtual {v0, p0}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->setRunnablesExecutor(Lcom/android/apksig/util/RunnablesExecutor;)Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;

    move-result-object v0

    .line 168
    const v1, -0xfac9740

    invoke-virtual {v0, v1}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->setBlockId(I)Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;

    move-result-object v0

    .line 169
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->build()Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;

    move-result-object v0

    .line 170
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->generateApkSignatureSchemeV3BlockAndDigests()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;

    move-result-object v0

    .line 166
    return-object v0
.end method

.method private generateApkSignatureSchemeV3Block(Ljava/util/Map;)Lcom/android/apksig/internal/util/Pair;
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "contentDigests"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;)",
            "Lcom/android/apksig/internal/util/Pair<",
            "[B",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 242
    .local p1, "contentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    const-string v0, " failed"

    const-string v1, "Signer #"

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mSignerConfigs:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 243
    .local v2, "signerBlocks":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v3, 0x0

    .line 244
    .local v3, "signerNumber":I
    iget-object v4, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mSignerConfigs:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    .line 245
    .local v5, "signerConfig":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    add-int/lit8 v3, v3, 0x1

    .line 248
    :try_start_0
    invoke-direct {p0, v5, p1}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->generateSignerBlock(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;Ljava/util/Map;)[B

    move-result-object v6
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/SignatureException; {:try_start_0 .. :try_end_0} :catch_0

    .line 253
    .local v6, "signerBlock":[B
    nop

    .line 254
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 255
    .end local v5    # "signerConfig":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .end local v6    # "signerBlock":[B
    goto :goto_0

    .line 251
    .restart local v5    # "signerConfig":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    :catch_0
    move-exception v4

    .line 252
    .local v4, "e":Ljava/security/SignatureException;
    new-instance v6, Ljava/security/SignatureException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v6, v0, v4}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 249
    .end local v4    # "e":Ljava/security/SignatureException;
    :catch_1
    move-exception v4

    .line 250
    .local v4, "e":Ljava/security/InvalidKeyException;
    new-instance v6, Ljava/security/InvalidKeyException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v6, v0, v4}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 257
    .end local v4    # "e":Ljava/security/InvalidKeyException;
    .end local v5    # "signerConfig":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [[B

    .line 260
    invoke-static {v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedElements(Ljava/util/List;)[B

    move-result-object v1

    const/4 v4, 0x0

    aput-object v1, v0, v4

    .line 258
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedElements([[B)[B

    move-result-object v0

    iget v1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mBlockId:I

    .line 262
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 257
    invoke-static {v0, v1}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v0

    return-object v0
.end method

.method private generateSignerBlock(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;Ljava/util/Map;)[B
    .locals 10
    .param p1, "signerConfig"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "signerConfig",
            "contentDigests"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 268
    .local p2, "contentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 271
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v0

    .line 273
    .local v0, "publicKey":Ljava/security/PublicKey;
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodePublicKey(Ljava/security/PublicKey;)[B

    move-result-object v1

    .line 275
    .local v1, "encodedPublicKey":[B
    new-instance v2, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;-><init>(Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$1;)V

    .line 277
    .local v2, "signedData":Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;
    :try_start_0
    iget-object v4, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    invoke-static {v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeCertificates(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    iput-object v4, v2, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;->certificates:Ljava/util/List;
    :try_end_0
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 280
    nop

    .line 282
    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->signatureAlgorithms:Ljava/util/List;

    .line 283
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 284
    .local v4, "digests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    iget-object v5, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->signatureAlgorithms:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    .line 285
    .local v6, "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    nop

    .line 286
    invoke-virtual {v6}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getContentDigestAlgorithm()Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    move-result-object v7

    .line 287
    .local v7, "contentDigestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    invoke-interface {p2, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [B

    .line 288
    .local v8, "contentDigest":[B
    if-eqz v8, :cond_0

    .line 295
    invoke-virtual {v6}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getId()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v9, v8}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v9

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 296
    .end local v6    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v7    # "contentDigestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    .end local v8    # "contentDigest":[B
    goto :goto_0

    .line 289
    .restart local v6    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .restart local v7    # "contentDigestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    .restart local v8    # "contentDigest":[B
    :cond_0
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, " content digest for "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, " not computed"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 297
    .end local v6    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v7    # "contentDigestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    .end local v8    # "contentDigest":[B
    :cond_1
    iput-object v4, v2, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;->digests:Ljava/util/List;

    .line 298
    iget v5, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->minSdkVersion:I

    iput v5, v2, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;->minSdkVersion:I

    .line 299
    iget v5, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->maxSdkVersion:I

    iput v5, v2, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;->maxSdkVersion:I

    .line 300
    invoke-direct {p0, p1}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->generateAdditionalAttributes(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;)[B

    move-result-object v5

    iput-object v5, v2, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;->additionalAttributes:[B

    .line 302
    new-instance v5, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;

    invoke-direct {v5, v3}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;-><init>(Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$1;)V

    move-object v3, v5

    .line 304
    .local v3, "signer":Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;
    invoke-direct {p0, v2}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->encodeSignedData(Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;)[B

    move-result-object v5

    iput-object v5, v3, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;->signedData:[B

    .line 306
    iget v5, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->minSdkVersion:I

    iput v5, v3, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;->minSdkVersion:I

    .line 307
    iget v5, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->maxSdkVersion:I

    iput v5, v3, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;->maxSdkVersion:I

    .line 308
    iput-object v1, v3, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;->publicKey:[B

    .line 309
    iget-object v5, v3, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;->signedData:[B

    .line 310
    invoke-static {p1, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->generateSignaturesOverData(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;[B)Ljava/util/List;

    move-result-object v5

    iput-object v5, v3, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;->signatures:Ljava/util/List;

    .line 312
    invoke-direct {p0, v3}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->encodeSigner(Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;)[B

    move-result-object v5

    return-object v5

    .line 278
    .end local v3    # "signer":Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$Signer;
    .end local v4    # "digests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    :catch_0
    move-exception v3

    .line 279
    .local v3, "e":Ljava/security/cert/CertificateEncodingException;
    new-instance v4, Ljava/security/SignatureException;

    const-string v5, "Failed to encode certificates"

    invoke-direct {v4, v5, v3}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 269
    .end local v0    # "publicKey":Ljava/security/PublicKey;
    .end local v1    # "encodedPublicKey":[B
    .end local v2    # "signedData":Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$V3SignatureSchemeBlock$SignedData;
    .end local v3    # "e":Ljava/security/cert/CertificateEncodingException;
    :cond_2
    new-instance v0, Ljava/security/SignatureException;

    const-string v1, "No certificates configured for signer"

    invoke-direct {v0, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static generateV31RotationTargetsDevReleaseAttribute()[B
    .locals 3

    .line 209
    const/16 v0, 0x8

    .line 210
    .local v0, "payloadSize":I
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 211
    .local v1, "result":Ljava/nio/ByteBuffer;
    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 212
    add-int/lit8 v2, v0, -0x4

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 213
    const v2, -0x3d594c46

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 214
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    return-object v2
.end method

.method private static generateV3RotationMinSdkVersionStrippingProtectionAttribute(I)[B
    .locals 3
    .param p0, "rotationMinSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rotationMinSdkVersion"
        }
    .end annotation

    .line 195
    const/16 v0, 0xc

    .line 196
    .local v0, "payloadSize":I
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 197
    .local v1, "result":Ljava/nio/ByteBuffer;
    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 198
    add-int/lit8 v2, v0, -0x4

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 199
    const v2, 0x559f8b02

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 200
    invoke-virtual {v1, p0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 201
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    return-object v2
.end method

.method public static generateV3SignerAttribute(Lcom/android/apksig/SigningCertificateLineage;)[B
    .locals 4
    .param p0, "signingCertificateLineage"    # Lcom/android/apksig/SigningCertificateLineage;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signingCertificateLineage"
        }
    .end annotation

    .line 179
    invoke-virtual {p0}, Lcom/android/apksig/SigningCertificateLineage;->encodeSigningCertificateLineage()[B

    move-result-object v0

    .line 180
    .local v0, "encodedLineage":[B
    array-length v1, v0

    add-int/lit8 v1, v1, 0x8

    .line 181
    .local v1, "payloadSize":I
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 182
    .local v2, "result":Ljava/nio/ByteBuffer;
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 183
    array-length v3, v0

    add-int/lit8 v3, v3, 0x4

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 184
    const v3, 0x3ba06f8c

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 185
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 186
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    return-object v3
.end method

.method public static getSuggestedSignatureAlgorithms(Ljava/security/PublicKey;IZZ)Ljava/util/List;
    .locals 4
    .param p0, "signingKey"    # Ljava/security/PublicKey;
    .param p1, "minSdkVersion"    # I
    .param p2, "verityEnabled"    # Z
    .param p3, "deterministicDsaSigning"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "signingKey",
            "minSdkVersion",
            "verityEnabled",
            "deterministicDsaSigning"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/security/PublicKey;",
            "IZZ)",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/SignatureAlgorithm;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 106
    invoke-interface {p0}, Ljava/security/PublicKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v0

    .line 107
    .local v0, "keyAlgorithm":Ljava/lang/String;
    const-string v1, "RSA"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 113
    move-object v1, p0

    check-cast v1, Ljava/security/interfaces/RSAKey;

    invoke-interface {v1}, Ljava/security/interfaces/RSAKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigInteger;->bitLength()I

    move-result v1

    .line 114
    .local v1, "modulusLengthBits":I
    const/16 v2, 0xc00

    if-gt v1, v2, :cond_1

    .line 116
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 117
    .local v2, "algorithms":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/SignatureAlgorithm;>;"
    sget-object v3, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->RSA_PKCS1_V1_5_WITH_SHA256:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    if-eqz p2, :cond_0

    .line 119
    sget-object v3, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->VERITY_RSA_PKCS1_V1_5_WITH_SHA256:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    :cond_0
    return-object v2

    .line 125
    .end local v2    # "algorithms":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/SignatureAlgorithm;>;"
    :cond_1
    sget-object v2, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->RSA_PKCS1_V1_5_WITH_SHA512:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    return-object v2

    .line 127
    .end local v1    # "modulusLengthBits":I
    :cond_2
    const-string v1, "DSA"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 129
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 130
    .local v1, "algorithms":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/SignatureAlgorithm;>;"
    nop

    .line 131
    if-eqz p3, :cond_3

    .line 132
    sget-object v2, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->DETDSA_WITH_SHA256:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    goto :goto_0

    .line 133
    :cond_3
    sget-object v2, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->DSA_WITH_SHA256:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    .line 130
    :goto_0
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    if-eqz p2, :cond_4

    .line 135
    sget-object v2, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->VERITY_DSA_WITH_SHA256:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    :cond_4
    return-object v1

    .line 138
    .end local v1    # "algorithms":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/SignatureAlgorithm;>;"
    :cond_5
    const-string v1, "EC"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 140
    move-object v1, p0

    check-cast v1, Ljava/security/interfaces/ECKey;

    invoke-interface {v1}, Ljava/security/interfaces/ECKey;->getParams()Ljava/security/spec/ECParameterSpec;

    move-result-object v1

    invoke-virtual {v1}, Ljava/security/spec/ECParameterSpec;->getOrder()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigInteger;->bitLength()I

    move-result v1

    .line 141
    .local v1, "keySizeBits":I
    const/16 v2, 0x100

    if-gt v1, v2, :cond_7

    .line 143
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 144
    .restart local v2    # "algorithms":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/SignatureAlgorithm;>;"
    sget-object v3, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->ECDSA_WITH_SHA256:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 145
    if-eqz p2, :cond_6

    .line 146
    sget-object v3, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->VERITY_ECDSA_WITH_SHA256:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 148
    :cond_6
    return-object v2

    .line 152
    .end local v2    # "algorithms":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/SignatureAlgorithm;>;"
    :cond_7
    sget-object v2, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->ECDSA_WITH_SHA512:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    return-object v2

    .line 155
    .end local v1    # "keySizeBits":I
    :cond_8
    new-instance v1, Ljava/security/InvalidKeyException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported key algorithm: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public generateApkSignatureSchemeV3BlockAndDigests()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 230
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    iget-object v1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mBeforeCentralDir:Lcom/android/apksig/util/DataSource;

    iget-object v2, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mCentralDir:Lcom/android/apksig/util/DataSource;

    iget-object v3, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mEocd:Lcom/android/apksig/util/DataSource;

    iget-object v4, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->mSignerConfigs:Ljava/util/List;

    .line 231
    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->computeContentDigests(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/util/List;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v0

    .line 233
    .local v0, "digestInfo":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    new-instance v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;

    .line 234
    invoke-virtual {v0}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    invoke-direct {p0, v2}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->generateApkSignatureSchemeV3Block(Ljava/util/Map;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v2

    invoke-virtual {v0}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-direct {v1, v2, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;-><init>(Lcom/android/apksig/internal/util/Pair;Ljava/util/Map;)V

    .line 233
    return-object v1
.end method
