.class public abstract Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;
.super Ljava/lang/Object;
.source "V4SchemeSigner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    return-void
.end method

.method private static convertToV4HashingInfo(Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;)Lcom/android/apksig/internal/util/Pair;
    .locals 2
    .param p0, "algorithm"    # Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "algorithm"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            ")",
            "Lcom/android/apksig/internal/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Byte;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 384
    sget-object v0, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$1;->$SwitchMap$com$android$apksig$internal$apk$ContentDigestAlgorithm:[I

    invoke-virtual {p0}, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 389
    new-instance v0, Ljava/security/NoSuchAlgorithmException;

    const-string v1, "Invalid hash algorithm, only SHA2-256 over 4 KB chunks supported."

    invoke-direct {v0, v1}, Ljava/security/NoSuchAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 386
    :pswitch_0
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 387
    const/16 v1, 0xc

    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v1

    .line 386
    invoke-static {v0, v1}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public static digestAlgorithmSortingOrder(Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;)I
    .locals 2
    .param p0, "contentDigestAlgorithm"    # Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "contentDigestAlgorithm"
        }
    .end annotation

    .line 356
    sget-object v0, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$1;->$SwitchMap$com$android$apksig$internal$apk$ContentDigestAlgorithm:[I

    invoke-virtual {p0}, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 364
    const/4 v0, -0x1

    return v0

    .line 362
    :pswitch_0
    const/4 v0, 0x2

    return v0

    .line 360
    :pswitch_1
    const/4 v0, 0x1

    return v0

    .line 358
    :pswitch_2
    const/4 v0, 0x0

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static generateSignature(Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;[B[BJ)Lcom/android/apksig/internal/apk/v4/V4Signature;
    .locals 8
    .param p0, "signerConfig"    # Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;
    .param p1, "hashingInfo"    # Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;
    .param p2, "apkDigest"    # [B
    .param p3, "additionalData"    # [B
    .param p4, "fileSize"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "signerConfig",
            "hashingInfo",
            "apkDigest",
            "additionalData",
            "fileSize"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;,
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .line 215
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;->v4Config:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    invoke-static/range {v0 .. v5}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->generateSigningInfo(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;[B[BJ)Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;

    move-result-object v0

    .line 219
    .local v0, "signingInfo":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;
    iget-object v1, p0, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;->v41Config:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    if-eqz v1, :cond_0

    .line 220
    new-instance v1, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;

    iget-object v2, p0, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;->v41Config:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    .line 222
    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-wide v6, p4

    invoke-static/range {v2 .. v7}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->generateSigningInfo(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;[B[BJ)Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;

    move-result-object v2

    .line 223
    invoke-virtual {v2}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->toByteArray()[B

    move-result-object v2

    const v3, 0x1b93ad61

    invoke-direct {v1, v3, v2}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;-><init>(I[B)V

    .line 224
    .local v1, "extSigningBlock":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;
    new-instance v2, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;

    const/4 v3, 0x1

    new-array v3, v3, [Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    invoke-direct {v2, v0, v3}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;-><init>(Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;[Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;)V

    move-object v1, v2

    .line 225
    .local v1, "signingInfos":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;
    goto :goto_0

    .line 226
    .end local v1    # "signingInfos":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;
    :cond_0
    new-instance v1, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;

    invoke-direct {v1, v0}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;-><init>(Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;)V

    .line 229
    .restart local v1    # "signingInfos":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;
    :goto_0
    new-instance v2, Lcom/android/apksig/internal/apk/v4/V4Signature;

    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;->toByteArray()[B

    move-result-object v3

    .line 230
    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;->toByteArray()[B

    move-result-object v4

    const/4 v5, 0x2

    invoke-direct {v2, v5, v3, v4}, Lcom/android/apksig/internal/apk/v4/V4Signature;-><init>(I[B[B)V

    .line 229
    return-object v2
.end method

.method private static generateSigningInfo(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;[B[BJ)Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;
    .locals 19
    .param p0, "signerConfig"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .param p1, "hashingInfo"    # Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;
    .param p2, "apkDigest"    # [B
    .param p3, "additionalData"    # [B
    .param p4, "fileSize"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "signerConfig",
            "hashingInfo",
            "apkDigest",
            "additionalData",
            "fileSize"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;,
            Ljava/security/cert/CertificateEncodingException;
        }
    .end annotation

    .line 175
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 178
    iget-object v1, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 183
    iget-object v1, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509Certificate;

    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v1

    .line 185
    .local v1, "publicKey":Ljava/security/PublicKey;
    iget-object v4, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    invoke-static {v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeCertificates(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    .line 186
    .local v4, "encodedCertificates":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    .line 188
    .local v5, "encodedCertificate":[B
    new-instance v13, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;

    .line 189
    invoke-interface {v1}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v10

    const/4 v11, -0x1

    const/4 v12, 0x0

    move-object v6, v13

    move-object/from16 v7, p2

    move-object v8, v5

    move-object/from16 v9, p3

    invoke-direct/range {v6 .. v12}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;-><init>([B[B[B[BI[B)V

    .line 191
    .local v13, "signingInfoNoSignature":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;
    move-object/from16 v14, p1

    move-wide/from16 v11, p4

    invoke-static {v11, v12, v14, v13}, Lcom/android/apksig/internal/apk/v4/V4Signature;->getSignedData(JLcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;)[B

    move-result-object v15

    .line 195
    .local v15, "data":[B
    nop

    .line 196
    invoke-static {v0, v15}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->generateSignaturesOverData(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;[B)Ljava/util/List;

    move-result-object v10

    .line 197
    .local v10, "signatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v6

    if-ne v6, v2, :cond_0

    .line 201
    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/util/Pair;

    invoke-virtual {v2}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 202
    .local v2, "signatureAlgorithmId":I
    invoke-interface {v10, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/util/Pair;

    invoke-virtual {v3}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    .line 204
    .local v3, "signature":[B
    new-instance v16, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;

    .line 205
    invoke-interface {v1}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v17

    move-object/from16 v6, v16

    move-object/from16 v7, p2

    move-object v8, v5

    move-object/from16 v9, p3

    move-object/from16 v18, v10

    .end local v10    # "signatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    .local v18, "signatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    move-object/from16 v10, v17

    move v11, v2

    move-object v12, v3

    invoke-direct/range {v6 .. v12}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;-><init>([B[B[B[BI[B)V

    .line 204
    return-object v16

    .line 198
    .end local v2    # "signatureAlgorithmId":I
    .end local v3    # "signature":[B
    .end local v18    # "signatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    .restart local v10    # "signatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    :cond_0
    new-instance v2, Ljava/security/SignatureException;

    const-string v3, "Should only be one signature generated"

    invoke-direct {v2, v3}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 179
    .end local v1    # "publicKey":Ljava/security/PublicKey;
    .end local v4    # "encodedCertificates":Ljava/util/List;, "Ljava/util/List<[B>;"
    .end local v5    # "encodedCertificate":[B
    .end local v10    # "signatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    .end local v13    # "signingInfoNoSignature":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;
    .end local v15    # "data":[B
    :cond_1
    move-object/from16 v14, p1

    new-instance v1, Ljava/security/cert/CertificateEncodingException;

    const-string v2, "Should only have one certificate"

    invoke-direct {v1, v2}, Ljava/security/cert/CertificateEncodingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 176
    :cond_2
    move-object/from16 v14, p1

    new-instance v1, Ljava/security/SignatureException;

    const-string v2, "No certificates configured for signer"

    invoke-direct {v1, v2}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static generateV4Signature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;)Lcom/android/apksig/internal/util/Pair;
    .locals 17
    .param p0, "apkContent"    # Lcom/android/apksig/util/DataSource;
    .param p1, "signerConfig"    # Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apkContent",
            "signerConfig"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;",
            ")",
            "Lcom/android/apksig/internal/util/Pair<",
            "Lcom/android/apksig/internal/apk/v4/V4Signature;",
            "[B>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 133
    const/4 v1, 0x0

    .line 135
    .local v1, "salt":[B
    const/4 v8, 0x0

    .line 137
    .local v8, "additionalData":[B
    invoke-interface/range {p0 .. p0}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v9

    .line 140
    .local v9, "fileSize":J
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->getApkDigest(Lcom/android/apksig/util/DataSource;)[B

    move-result-object v11

    .line 143
    .local v11, "apkDigest":[B
    nop

    .line 144
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->computeChunkVerityTreeAndDigest(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$VerityTreeAndDigest;

    move-result-object v12

    .line 146
    .local v12, "verityContentDigestInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$VerityTreeAndDigest;
    iget-object v13, v12, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$VerityTreeAndDigest;->contentDigestAlgorithm:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    .line 148
    .local v13, "verityContentDigestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    iget-object v14, v12, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$VerityTreeAndDigest;->rootHash:[B

    .line 149
    .local v14, "rootHash":[B
    iget-object v15, v12, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$VerityTreeAndDigest;->tree:[B

    .line 151
    .local v15, "tree":[B
    invoke-static {v13}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->convertToV4HashingInfo(Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v16

    .line 153
    .local v16, "hashingAlgorithmBlockSizePair":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;Ljava/lang/Byte;>;"
    new-instance v3, Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;

    .line 154
    invoke-virtual/range {v16 .. v16}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual/range {v16 .. v16}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Byte;

    invoke-virtual {v2}, Ljava/lang/Byte;->byteValue()B

    move-result v2

    invoke-direct {v3, v0, v2, v1, v14}, Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;-><init>(IB[B[B)V

    .line 160
    .local v3, "hashingInfo":Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;
    move-object/from16 v2, p1

    move-object v4, v11

    move-object v5, v8

    move-wide v6, v9

    :try_start_0
    invoke-static/range {v2 .. v7}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->generateSignature(Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;[B[BJ)Lcom/android/apksig/internal/apk/v4/V4Signature;

    move-result-object v0
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/SignatureException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 164
    .local v0, "signature":Lcom/android/apksig/internal/apk/v4/V4Signature;
    nop

    .line 166
    invoke-static {v0, v15}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v2

    return-object v2

    .line 162
    .end local v0    # "signature":Lcom/android/apksig/internal/apk/v4/V4Signature;
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    .line 163
    .local v0, "e":Ljava/security/GeneralSecurityException;
    :goto_0
    new-instance v2, Ljava/security/InvalidKeyException;

    const-string v4, "Signer failed"

    invoke-direct {v2, v4, v0}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public static generateV4Signature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;Ljava/io/File;)V
    .locals 4
    .param p0, "apkContent"    # Lcom/android/apksig/util/DataSource;
    .param p1, "signerConfig"    # Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;
    .param p2, "outputFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "apkContent",
            "signerConfig",
            "outputFile"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 117
    invoke-static {p0, p1}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->generateV4Signature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v0

    .line 118
    .local v0, "pair":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Lcom/android/apksig/internal/apk/v4/V4Signature;[B>;"
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    .local v1, "output":Ljava/io/OutputStream;
    :try_start_1
    invoke-virtual {v0}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/v4/V4Signature;

    invoke-virtual {v2, v1}, Lcom/android/apksig/internal/apk/v4/V4Signature;->writeTo(Ljava/io/OutputStream;)V

    .line 120
    invoke-virtual {v0}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    invoke-static {v1, v2}, Lcom/android/apksig/internal/apk/v4/V4Signature;->writeBytes(Ljava/io/OutputStream;[B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    :try_start_2
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 124
    .end local v1    # "output":Ljava/io/OutputStream;
    nop

    .line 125
    return-void

    .line 118
    .restart local v1    # "output":Ljava/io/OutputStream;
    :catchall_0
    move-exception v2

    :try_start_3
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v3

    :try_start_4
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "pair":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Lcom/android/apksig/internal/apk/v4/V4Signature;[B>;"
    .end local p0    # "apkContent":Lcom/android/apksig/util/DataSource;
    .end local p1    # "signerConfig":Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;
    .end local p2    # "outputFile":Ljava/io/File;
    :goto_0
    throw v2
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 121
    .end local v1    # "output":Ljava/io/OutputStream;
    .restart local v0    # "pair":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Lcom/android/apksig/internal/apk/v4/V4Signature;[B>;"
    .restart local p0    # "apkContent":Lcom/android/apksig/util/DataSource;
    .restart local p1    # "signerConfig":Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;
    .restart local p2    # "outputFile":Ljava/io/File;
    :catch_0
    move-exception v1

    .line 122
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    .line 123
    throw v1
.end method

.method private static getApkDigest(Lcom/android/apksig/util/DataSource;)[B
    .locals 6
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
            Ljava/io/IOException;
        }
    .end annotation

    .line 237
    :try_start_0
    invoke-static {p0}, Lcom/android/apksig/apk/ApkUtils;->findZipSections(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/apk/ApkUtils$ZipSections;

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_2

    .line 240
    .local v0, "zipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    nop

    .line 244
    :try_start_1
    invoke-static {p0, v0}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->getBestV3Digest(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)[B

    move-result-object v1
    :try_end_1
    .catch Ljava/security/SignatureException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v1

    .line 245
    :catch_0
    move-exception v1

    .line 246
    .local v1, "e":Ljava/security/SignatureException;
    move-object v2, v1

    .line 251
    .end local v1    # "e":Ljava/security/SignatureException;
    .local v2, "v3Exception":Ljava/security/SignatureException;
    :try_start_2
    invoke-static {p0, v0}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->getBestV2Digest(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)[B

    move-result-object v1
    :try_end_2
    .catch Ljava/security/SignatureException; {:try_start_2 .. :try_end_2} :catch_1

    return-object v1

    .line 252
    :catch_1
    move-exception v1

    .line 253
    .restart local v1    # "e":Ljava/security/SignatureException;
    nop

    .line 256
    .local v1, "v2Exception":Ljava/security/SignatureException;
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to obtain v2/v3 digest, v3 exception: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", v2 exception: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 238
    .end local v0    # "zipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .end local v1    # "v2Exception":Ljava/security/SignatureException;
    .end local v2    # "v3Exception":Ljava/security/SignatureException;
    :catch_2
    move-exception v0

    .line 239
    .local v0, "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Malformed APK: not a ZIP archive"

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static getBestV2Digest(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)[B
    .locals 10
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "zipSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
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
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 293
    new-instance v1, Ljava/util/HashSet;

    const/4 v7, 0x1

    invoke-direct {v1, v7}, Ljava/util/HashSet;-><init>(I)V

    .line 294
    .local v1, "contentDigestsToVerify":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3, v7}, Ljava/util/HashSet;-><init>(I)V

    .line 295
    .local v3, "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    new-instance v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;-><init>(I)V

    move-object v8, v0

    .line 298
    .local v8, "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    nop

    .line 299
    const v0, 0x7109871a

    :try_start_0
    invoke-static {p0, p1, v0, v8}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Lcom/android/apksig/internal/apk/SignatureInfo;

    move-result-object v0

    move-object v9, v0

    .line 301
    .local v9, "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    iget-object v0, v9, Lcom/android/apksig/internal/apk/SignatureInfo;->signatureBlock:Ljava/nio/ByteBuffer;

    .line 302
    .local v0, "apkSignatureSchemeV2Block":Ljava/nio/ByteBuffer;
    nop

    .line 305
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v2

    const v4, 0x7fffffff

    const v5, 0x7fffffff

    .line 302
    move-object v6, v8

    invoke-static/range {v0 .. v6}, Lcom/android/apksig/internal/apk/v2/V2SchemeVerifier;->parseSigners(Ljava/nio/ByteBuffer;Ljava/util/Set;Ljava/util/Map;Ljava/util/Set;IILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 312
    .end local v0    # "apkSignatureSchemeV2Block":Ljava/nio/ByteBuffer;
    .end local v9    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    nop

    .line 314
    iget-object v0, v8, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, v7, :cond_1

    .line 318
    iget-object v0, v8, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    .line 319
    .local v0, "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->containsErrors()Z

    move-result v2

    if-nez v2, :cond_0

    .line 323
    iget-object v2, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->contentDigests:Ljava/util/List;

    .line 325
    .local v2, "contentDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;>;"
    invoke-static {v2}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->pickBestDigest(Ljava/util/List;)[B

    move-result-object v4

    return-object v4

    .line 320
    .end local v2    # "contentDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;>;"
    :cond_0
    new-instance v2, Ljava/security/SignatureException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Parsing failed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->getErrors()Ljava/util/List;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 315
    .end local v0    # "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    :cond_1
    new-instance v0, Ljava/security/SignatureException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Should only have one signer, errors: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v8}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->getErrors()Ljava/util/List;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 310
    :catch_0
    move-exception v0

    .line 311
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/security/SignatureException;

    const-string v4, "Failed to extract and parse v2 block"

    invoke-direct {v2, v4, v0}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static getBestV3Digest(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)[B
    .locals 6
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "zipSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
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
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 263
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 264
    .local v0, "contentDigestsToVerify":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    new-instance v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    const/4 v3, 0x3

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;-><init>(I)V

    .line 267
    .local v2, "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    nop

    .line 268
    const v3, -0xfac9740

    :try_start_0
    invoke-static {p0, p1, v3, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Lcom/android/apksig/internal/apk/SignatureInfo;

    move-result-object v3

    .line 270
    .local v3, "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    iget-object v4, v3, Lcom/android/apksig/internal/apk/SignatureInfo;->signatureBlock:Ljava/nio/ByteBuffer;

    .line 271
    .local v4, "apkSignatureSchemeV3Block":Ljava/nio/ByteBuffer;
    invoke-static {v4, v0, v2}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->parseSigners(Ljava/nio/ByteBuffer;Ljava/util/Set;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 275
    .end local v3    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    .end local v4    # "apkSignatureSchemeV3Block":Ljava/nio/ByteBuffer;
    nop

    .line 277
    iget-object v3, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ne v3, v1, :cond_1

    .line 281
    iget-object v1, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    .line 282
    .local v1, "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->containsErrors()Z

    move-result v4

    if-nez v4, :cond_0

    .line 286
    iget-object v4, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    .line 287
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    iget-object v3, v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->contentDigests:Ljava/util/List;

    .line 288
    .local v3, "contentDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;>;"
    invoke-static {v3}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->pickBestDigest(Ljava/util/List;)[B

    move-result-object v4

    return-object v4

    .line 283
    .end local v3    # "contentDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;>;"
    :cond_0
    new-instance v3, Ljava/security/SignatureException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Parsing failed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->getErrors()Ljava/util/List;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 278
    .end local v1    # "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    :cond_1
    new-instance v1, Ljava/security/SignatureException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Should only have one signer, errors: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->getErrors()Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 273
    :catch_0
    move-exception v1

    .line 274
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/security/SignatureException;

    const-string v4, "Failed to extract and parse v3 block"

    invoke-direct {v3, v4, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public static getSuggestedSignatureAlgorithms(Ljava/security/PublicKey;IZZ)Ljava/util/List;
    .locals 5
    .param p0, "signingKey"    # Ljava/security/PublicKey;
    .param p1, "minSdkVersion"    # I
    .param p2, "apkSigningBlockPaddingSupported"    # Z
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
            "apkSigningBlockPaddingSupported",
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

    .line 97
    invoke-static {p0, p1, p2, p3}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->getSuggestedSignatureAlgorithms(Ljava/security/PublicKey;IZZ)Ljava/util/List;

    move-result-object v0

    .line 101
    .local v0, "algorithms":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/SignatureAlgorithm;>;"
    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/android/apksig/internal/apk/SignatureAlgorithm;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 102
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    .line 103
    .local v2, "algorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    invoke-virtual {v2}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getContentDigestAlgorithm()Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->isSupported(Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;Z)Z

    move-result v3

    if-nez v3, :cond_0

    .line 104
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 106
    .end local v2    # "algorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    :cond_0
    goto :goto_0

    .line 107
    .end local v1    # "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/android/apksig/internal/apk/SignatureAlgorithm;>;"
    :cond_1
    return-object v0
.end method

.method private static isSupported(Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;Z)Z
    .locals 2
    .param p0, "contentDigestAlgorithm"    # Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    .param p1, "forV3Digest"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x0
        }
        names = {
            "contentDigestAlgorithm",
            "forV3Digest"
        }
    .end annotation

    .line 370
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 371
    return v0

    .line 373
    :cond_0
    sget-object v1, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->CHUNKED_SHA256:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    if-eq p0, v1, :cond_2

    sget-object v1, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->CHUNKED_SHA512:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    if-eq p0, v1, :cond_2

    if-eqz p1, :cond_1

    sget-object v1, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->VERITY_CHUNKED_SHA256:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    if-ne p0, v1, :cond_1

    goto :goto_0

    .line 379
    :cond_1
    return v0

    .line 377
    :cond_2
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method private static pickBestDigest(Ljava/util/List;)[B
    .locals 7
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
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;",
            ">;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 329
    .local p0, "contentDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;>;"
    if-eqz p0, :cond_4

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 333
    const/4 v0, -0x1

    .line 334
    .local v0, "bestAlgorithmOrder":I
    const/4 v1, 0x0

    .line 335
    .local v1, "bestDigest":[B
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;

    .line 336
    .local v3, "contentDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    nop

    .line 337
    invoke-virtual {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;->getSignatureAlgorithmId()I

    move-result v4

    invoke-static {v4}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v4

    .line 338
    .local v4, "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    nop

    .line 339
    invoke-virtual {v4}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getContentDigestAlgorithm()Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    move-result-object v5

    .line 340
    .local v5, "contentDigestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    const/4 v6, 0x1

    invoke-static {v5, v6}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->isSupported(Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;Z)Z

    move-result v6

    if-nez v6, :cond_0

    .line 341
    goto :goto_0

    .line 343
    :cond_0
    invoke-static {v5}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->digestAlgorithmSortingOrder(Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;)I

    move-result v6

    .line 344
    .local v6, "algorithmOrder":I
    if-ge v0, v6, :cond_1

    .line 345
    move v0, v6

    .line 346
    invoke-virtual {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;->getValue()[B

    move-result-object v1

    .line 348
    .end local v3    # "contentDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    .end local v4    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v5    # "contentDigestAlgorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    .end local v6    # "algorithmOrder":I
    :cond_1
    goto :goto_0

    .line 349
    :cond_2
    if-eqz v1, :cond_3

    .line 352
    return-object v1

    .line 350
    :cond_3
    new-instance v2, Ljava/security/SignatureException;

    const-string v3, "Failed to find a supported digest in the source APK"

    invoke-direct {v2, v3}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 330
    .end local v0    # "bestAlgorithmOrder":I
    .end local v1    # "bestDigest":[B
    :cond_4
    new-instance v0, Ljava/security/SignatureException;

    const-string v1, "Should have at least one digest"

    invoke-direct {v0, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
