.class public abstract Lcom/android/apksig/internal/apk/v2/V2SchemeVerifier;
.super Ljava/lang/Object;
.source "V2SchemeVerifier.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static parseSigner(Ljava/nio/ByteBuffer;Ljava/security/cert/CertificateFactory;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;Ljava/util/Set;Ljava/util/Map;Ljava/util/Set;II)V
    .locals 32
    .param p0, "signerBlock"    # Ljava/nio/ByteBuffer;
    .param p1, "certFactory"    # Ljava/security/cert/CertificateFactory;
    .param p2, "result"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    .param p6, "minSdkVersion"    # I
    .param p7, "maxSdkVersion"    # I
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
            "signerBlock",
            "certFactory",
            "result",
            "contentDigestsToVerify",
            "supportedApkSigSchemeNames",
            "foundApkSigSchemeIds",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            "Ljava/security/cert/CertificateFactory;",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;",
            "Ljava/util/Set<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;II)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 248
    .local p3, "contentDigestsToVerify":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    .local p4, "supportedApkSigSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    .local p5, "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    move-object/from16 v1, p2

    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 249
    .local v2, "signedData":Ljava/nio/ByteBuffer;
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    new-array v3, v0, [B

    .line 250
    .local v3, "signedDataBytes":[B
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 251
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 252
    iput-object v3, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signedData:[B

    .line 254
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 255
    .local v4, "signatures":Ljava/nio/ByteBuffer;
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v5

    .line 258
    .local v5, "publicKeyBytes":[B
    const/4 v0, 0x0

    .line 259
    .local v0, "signatureCount":I
    new-instance v6, Ljava/util/ArrayList;

    const/4 v7, 0x1

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    move v8, v0

    .line 260
    .end local v0    # "signatureCount":I
    .local v6, "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    .local v8, "signatureCount":I
    :goto_0
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    const/4 v9, 0x0

    if-eqz v0, :cond_1

    .line 261
    add-int/lit8 v8, v8, 0x1

    .line 263
    :try_start_0
    invoke-static {v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 264
    .local v0, "signature":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v10

    .line 265
    .local v10, "sigAlgorithmId":I
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v11

    .line 266
    .local v11, "sigBytes":[B
    iget-object v12, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signatures:Ljava/util/List;

    new-instance v13, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$Signature;

    invoke-direct {v13, v10, v11}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$Signature;-><init>(I[B)V

    invoke-interface {v12, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 269
    invoke-static {v10}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v12

    .line 270
    .local v12, "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    if-nez v12, :cond_0

    .line 271
    sget-object v13, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_UNKNOWN_SIG_ALGORITHM:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v14, v7, [Ljava/lang/Object;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v14, v9

    invoke-virtual {v1, v13, v14}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addWarning(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 272
    goto :goto_0

    .line 274
    :cond_0
    new-instance v9, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;

    invoke-direct {v9, v12, v11}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;-><init>(Lcom/android/apksig/internal/apk/SignatureAlgorithm;[B)V

    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    .line 279
    nop

    .end local v0    # "signature":Ljava/nio/ByteBuffer;
    .end local v10    # "sigAlgorithmId":I
    .end local v11    # "sigBytes":[B
    .end local v12    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    goto :goto_0

    .line 276
    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    .line 277
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    sget-object v7, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v1, v7, v9}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 278
    return-void

    .line 281
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    iget-object v0, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signatures:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 282
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v7, v9, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v7}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 283
    return-void

    .line 287
    :cond_2
    const/4 v10, 0x0

    .line 289
    .local v10, "signaturesToVerify":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    nop

    .line 290
    move/from16 v11, p6

    move/from16 v12, p7

    :try_start_1
    invoke-static {v6, v11, v12}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getSignaturesToVerify(Ljava/util/List;II)Ljava/util/List;

    move-result-object v0
    :try_end_1
    .catch Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$NoSupportedSignaturesException; {:try_start_1 .. :try_end_1} :catch_24

    move-object v10, v0

    .line 295
    nop

    .line 296
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;

    .line 297
    .local v13, "signature":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;
    iget-object v14, v13, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;->algorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    .line 298
    .local v14, "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    nop

    .line 299
    invoke-virtual {v14}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaSignatureAlgorithmAndParams()Lcom/android/apksig/internal/util/Pair;

    move-result-object v15

    invoke-virtual {v15}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 300
    .local v15, "jcaSignatureAlgorithm":Ljava/lang/String;
    nop

    .line 301
    invoke-virtual {v14}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaSignatureAlgorithmAndParams()Lcom/android/apksig/internal/util/Pair;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v7, v16

    check-cast v7, Ljava/security/spec/AlgorithmParameterSpec;

    .line 302
    .local v7, "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual {v14}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaKeyAlgorithm()Ljava/lang/String;

    move-result-object v16

    .line 305
    .local v16, "keyAlgorithm":Ljava/lang/String;
    nop

    .line 306
    :try_start_2
    invoke-static/range {v16 .. v16}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v9

    move-object/from16 v19, v0

    new-instance v0, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v0, v5}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    invoke-virtual {v9, v0}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_11

    move-object v9, v0

    .line 311
    .local v9, "publicKey":Ljava/security/PublicKey;
    nop

    .line 313
    :try_start_3
    invoke-static {v15}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v0

    .line 314
    .local v0, "sig":Ljava/security/Signature;
    invoke-virtual {v0, v9}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V
    :try_end_3
    .catch Ljava/security/InvalidKeyException; {:try_start_3 .. :try_end_3} :catch_10
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_3 .. :try_end_3} :catch_f
    .catch Ljava/security/SignatureException; {:try_start_3 .. :try_end_3} :catch_e

    .line 315
    if-eqz v7, :cond_3

    .line 316
    :try_start_4
    invoke-virtual {v0, v7}, Ljava/security/Signature;->setParameter(Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_4
    .catch Ljava/security/InvalidKeyException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/security/SignatureException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    .line 327
    .end local v0    # "sig":Ljava/security/Signature;
    :catch_2
    move-exception v0

    move-object/from16 v20, v3

    move-object/from16 v22, v4

    move-object/from16 v4, p3

    goto/16 :goto_6

    :catch_3
    move-exception v0

    move-object/from16 v20, v3

    move-object/from16 v22, v4

    move-object/from16 v4, p3

    goto/16 :goto_6

    :catch_4
    move-exception v0

    move-object/from16 v20, v3

    move-object/from16 v22, v4

    move-object/from16 v4, p3

    goto/16 :goto_6

    .line 318
    .restart local v0    # "sig":Ljava/security/Signature;
    :cond_3
    :goto_3
    move-object/from16 v20, v3

    const/4 v3, 0x0

    .end local v3    # "signedDataBytes":[B
    .local v20, "signedDataBytes":[B
    :try_start_5
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 319
    invoke-virtual {v0, v2}, Ljava/security/Signature;->update(Ljava/nio/ByteBuffer;)V

    .line 320
    iget-object v3, v13, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;->signature:[B

    .line 321
    .local v3, "sigBytes":[B
    invoke-virtual {v0, v3}, Ljava/security/Signature;->verify([B)Z

    move-result v21

    if-nez v21, :cond_4

    .line 322
    move-object/from16 v21, v0

    .end local v0    # "sig":Ljava/security/Signature;
    .local v21, "sig":Ljava/security/Signature;
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;
    :try_end_5
    .catch Ljava/security/InvalidKeyException; {:try_start_5 .. :try_end_5} :catch_d
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_5 .. :try_end_5} :catch_c
    .catch Ljava/security/SignatureException; {:try_start_5 .. :try_end_5} :catch_b

    move-object/from16 v22, v4

    .end local v4    # "signatures":Ljava/nio/ByteBuffer;
    .local v22, "signatures":Ljava/nio/ByteBuffer;
    :try_start_6
    filled-new-array {v14}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v0, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 323
    return-void

    .line 325
    .end local v21    # "sig":Ljava/security/Signature;
    .end local v22    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v0    # "sig":Ljava/security/Signature;
    .restart local v4    # "signatures":Ljava/nio/ByteBuffer;
    :cond_4
    move-object/from16 v21, v0

    move-object/from16 v22, v4

    .end local v0    # "sig":Ljava/security/Signature;
    .end local v4    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v21    # "sig":Ljava/security/Signature;
    .restart local v22    # "signatures":Ljava/nio/ByteBuffer;
    iget-object v0, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->verifiedSignatures:Ljava/util/Map;

    invoke-interface {v0, v14, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    invoke-virtual {v14}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getContentDigestAlgorithm()Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    move-result-object v0
    :try_end_6
    .catch Ljava/security/InvalidKeyException; {:try_start_6 .. :try_end_6} :catch_a
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/security/SignatureException; {:try_start_6 .. :try_end_6} :catch_8

    move-object/from16 v4, p3

    :try_start_7
    invoke-interface {v4, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_7
    .catch Ljava/security/InvalidKeyException; {:try_start_7 .. :try_end_7} :catch_7
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_7 .. :try_end_7} :catch_6
    .catch Ljava/security/SignatureException; {:try_start_7 .. :try_end_7} :catch_5

    .line 331
    nop

    .line 332
    .end local v3    # "sigBytes":[B
    .end local v7    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .end local v9    # "publicKey":Ljava/security/PublicKey;
    .end local v13    # "signature":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;
    .end local v14    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v15    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .end local v16    # "keyAlgorithm":Ljava/lang/String;
    .end local v21    # "sig":Ljava/security/Signature;
    move-object/from16 v0, v19

    move-object/from16 v3, v20

    move-object/from16 v4, v22

    const/4 v7, 0x1

    const/4 v9, 0x0

    goto/16 :goto_2

    .line 327
    .restart local v7    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .restart local v9    # "publicKey":Ljava/security/PublicKey;
    .restart local v13    # "signature":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;
    .restart local v14    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .restart local v15    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .restart local v16    # "keyAlgorithm":Ljava/lang/String;
    :catch_5
    move-exception v0

    goto :goto_6

    :catch_6
    move-exception v0

    goto :goto_6

    :catch_7
    move-exception v0

    goto :goto_6

    :catch_8
    move-exception v0

    move-object/from16 v4, p3

    goto :goto_6

    :catch_9
    move-exception v0

    move-object/from16 v4, p3

    goto :goto_6

    :catch_a
    move-exception v0

    move-object/from16 v4, p3

    goto :goto_6

    .end local v22    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v4    # "signatures":Ljava/nio/ByteBuffer;
    :catch_b
    move-exception v0

    goto :goto_4

    :catch_c
    move-exception v0

    goto :goto_4

    :catch_d
    move-exception v0

    :goto_4
    move-object/from16 v22, v4

    move-object/from16 v4, p3

    .end local v4    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v22    # "signatures":Ljava/nio/ByteBuffer;
    goto :goto_6

    .end local v20    # "signedDataBytes":[B
    .end local v22    # "signatures":Ljava/nio/ByteBuffer;
    .local v3, "signedDataBytes":[B
    .restart local v4    # "signatures":Ljava/nio/ByteBuffer;
    :catch_e
    move-exception v0

    goto :goto_5

    :catch_f
    move-exception v0

    goto :goto_5

    :catch_10
    move-exception v0

    :goto_5
    move-object/from16 v20, v3

    move-object/from16 v22, v4

    move-object/from16 v4, p3

    .line 329
    .end local v3    # "signedDataBytes":[B
    .end local v4    # "signatures":Ljava/nio/ByteBuffer;
    .local v0, "e":Ljava/security/GeneralSecurityException;
    .restart local v20    # "signedDataBytes":[B
    .restart local v22    # "signatures":Ljava/nio/ByteBuffer;
    :goto_6
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v14, v0}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 330
    return-void

    .line 308
    .end local v0    # "e":Ljava/security/GeneralSecurityException;
    .end local v9    # "publicKey":Ljava/security/PublicKey;
    .end local v20    # "signedDataBytes":[B
    .end local v22    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v3    # "signedDataBytes":[B
    .restart local v4    # "signatures":Ljava/nio/ByteBuffer;
    :catch_11
    move-exception v0

    move-object/from16 v20, v3

    move-object/from16 v22, v4

    .line 309
    .end local v3    # "signedDataBytes":[B
    .end local v4    # "signatures":Ljava/nio/ByteBuffer;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v20    # "signedDataBytes":[B
    .restart local v22    # "signatures":Ljava/nio/ByteBuffer;
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_PUBLIC_KEY:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 310
    return-void

    .line 335
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v7    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .end local v13    # "signature":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;
    .end local v14    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v15    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .end local v16    # "keyAlgorithm":Ljava/lang/String;
    .end local v20    # "signedDataBytes":[B
    .end local v22    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v3    # "signedDataBytes":[B
    .restart local v4    # "signatures":Ljava/nio/ByteBuffer;
    :cond_5
    move-object/from16 v20, v3

    move-object/from16 v22, v4

    .end local v3    # "signedDataBytes":[B
    .end local v4    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v20    # "signedDataBytes":[B
    .restart local v22    # "signatures":Ljava/nio/ByteBuffer;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 336
    invoke-static {v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 337
    .local v3, "digests":Ljava/nio/ByteBuffer;
    invoke-static {v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 338
    .local v4, "certificates":Ljava/nio/ByteBuffer;
    invoke-static {v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 341
    .local v7, "additionalAttributes":Ljava/nio/ByteBuffer;
    const/4 v0, -0x1

    move v9, v0

    .line 342
    .local v9, "certificateIndex":I
    :goto_7
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 343
    add-int/lit8 v9, v9, 0x1

    .line 344
    invoke-static {v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v13

    .line 347
    .local v13, "encodedCert":[B
    move-object/from16 v14, p1

    :try_start_8
    invoke-static {v13, v14}, Lcom/android/apksig/internal/util/X509CertificateUtils;->generateCertificate([BLjava/security/cert/CertificateFactory;)Ljava/security/cert/X509Certificate;

    move-result-object v0
    :try_end_8
    .catch Ljava/security/cert/CertificateException; {:try_start_8 .. :try_end_8} :catch_12

    .line 355
    .local v0, "certificate":Ljava/security/cert/X509Certificate;
    nop

    .line 360
    new-instance v15, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;

    invoke-direct {v15, v0, v13}, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;-><init>(Ljava/security/cert/X509Certificate;[B)V

    move-object v0, v15

    .line 361
    iget-object v15, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->certs:Ljava/util/List;

    invoke-interface {v15, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 362
    .end local v0    # "certificate":Ljava/security/cert/X509Certificate;
    .end local v13    # "encodedCert":[B
    goto :goto_7

    .line 348
    .restart local v13    # "encodedCert":[B
    :catch_12
    move-exception v0

    move-object v15, v0

    move-object v0, v15

    .line 349
    .local v0, "e":Ljava/security/cert/CertificateException;
    sget-object v15, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 351
    move-object/from16 v16, v2

    .end local v2    # "signedData":Ljava/nio/ByteBuffer;
    .local v16, "signedData":Ljava/nio/ByteBuffer;
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    add-int/lit8 v17, v9, 0x1

    .line 352
    move-object/from16 v19, v4

    .end local v4    # "certificates":Ljava/nio/ByteBuffer;
    .local v19, "certificates":Ljava/nio/ByteBuffer;
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v2, v4, v0}, [Ljava/lang/Object;

    move-result-object v2

    .line 349
    invoke-virtual {v1, v15, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 354
    return-void

    .line 364
    .end local v0    # "e":Ljava/security/cert/CertificateException;
    .end local v13    # "encodedCert":[B
    .end local v16    # "signedData":Ljava/nio/ByteBuffer;
    .end local v19    # "certificates":Ljava/nio/ByteBuffer;
    .restart local v2    # "signedData":Ljava/nio/ByteBuffer;
    .restart local v4    # "certificates":Ljava/nio/ByteBuffer;
    :cond_6
    move-object/from16 v14, p1

    move-object/from16 v16, v2

    move-object/from16 v19, v4

    .end local v2    # "signedData":Ljava/nio/ByteBuffer;
    .end local v4    # "certificates":Ljava/nio/ByteBuffer;
    .restart local v16    # "signedData":Ljava/nio/ByteBuffer;
    .restart local v19    # "certificates":Ljava/nio/ByteBuffer;
    iget-object v0, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->certs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 365
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_NO_CERTIFICATES:Lcom/android/apksig/ApkVerifier$Issue;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 366
    return-void

    .line 368
    :cond_7
    const/4 v2, 0x0

    iget-object v0, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->certs:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/security/cert/X509Certificate;

    .line 371
    .local v2, "mainCertificate":Ljava/security/cert/X509Certificate;
    nop

    .line 372
    :try_start_9
    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v0

    .line 371
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodePublicKey(Ljava/security/PublicKey;)[B

    move-result-object v0
    :try_end_9
    .catch Ljava/security/InvalidKeyException; {:try_start_9 .. :try_end_9} :catch_13

    .line 377
    .local v0, "certificatePublicKeyBytes":[B
    move-object v4, v0

    goto :goto_8

    .line 373
    .end local v0    # "certificatePublicKeyBytes":[B
    :catch_13
    move-exception v0

    .line 374
    .local v0, "e":Ljava/security/InvalidKeyException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Caught an exception encoding the public key: "

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v4, v13}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 375
    invoke-virtual {v0}, Ljava/security/InvalidKeyException;->printStackTrace()V

    .line 376
    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v4

    invoke-interface {v4}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v4

    .line 378
    .end local v0    # "e":Ljava/security/InvalidKeyException;
    .local v4, "certificatePublicKeyBytes":[B
    :goto_8
    invoke-static {v5, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_8

    .line 379
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

    .line 381
    invoke-static {v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->toHex([B)Ljava/lang/String;

    move-result-object v13

    .line 382
    invoke-static {v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->toHex([B)Ljava/lang/String;

    move-result-object v15

    filled-new-array {v13, v15}, [Ljava/lang/Object;

    move-result-object v13

    .line 379
    invoke-virtual {v1, v0, v13}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 383
    return-void

    .line 387
    :cond_8
    const/4 v0, 0x0

    move v13, v0

    .line 388
    .local v13, "digestCount":I
    :goto_9
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 389
    add-int/lit8 v13, v13, 0x1

    .line 391
    :try_start_a
    invoke-static {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 392
    .local v0, "digest":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v15

    .line 393
    .local v15, "sigAlgorithmId":I
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v21

    move-object/from16 v23, v21

    .line 394
    .local v23, "digestBytes":[B
    move-object/from16 v21, v0

    .end local v0    # "digest":Ljava/nio/ByteBuffer;
    .local v21, "digest":Ljava/nio/ByteBuffer;
    iget-object v0, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->contentDigests:Ljava/util/List;
    :try_end_a
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_a .. :try_end_a} :catch_19
    .catch Ljava/nio/BufferUnderflowException; {:try_start_a .. :try_end_a} :catch_18

    move-object/from16 v24, v2

    .end local v2    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .local v24, "mainCertificate":Ljava/security/cert/X509Certificate;
    :try_start_b
    new-instance v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    :try_end_b
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_b .. :try_end_b} :catch_17
    .catch Ljava/nio/BufferUnderflowException; {:try_start_b .. :try_end_b} :catch_16

    move-object/from16 v25, v3

    move-object/from16 v3, v23

    .end local v23    # "digestBytes":[B
    .local v3, "digestBytes":[B
    .local v25, "digests":Ljava/nio/ByteBuffer;
    :try_start_c
    invoke-direct {v2, v15, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;-><init>(I[B)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_c
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_c .. :try_end_c} :catch_15
    .catch Ljava/nio/BufferUnderflowException; {:try_start_c .. :try_end_c} :catch_14

    .line 400
    move-object/from16 v2, v24

    move-object/from16 v3, v25

    .end local v3    # "digestBytes":[B
    .end local v15    # "sigAlgorithmId":I
    .end local v21    # "digest":Ljava/nio/ByteBuffer;
    goto :goto_9

    .line 397
    :catch_14
    move-exception v0

    goto :goto_c

    :catch_15
    move-exception v0

    goto :goto_c

    .end local v25    # "digests":Ljava/nio/ByteBuffer;
    .local v3, "digests":Ljava/nio/ByteBuffer;
    :catch_16
    move-exception v0

    goto :goto_a

    :catch_17
    move-exception v0

    :goto_a
    move-object/from16 v25, v3

    .end local v3    # "digests":Ljava/nio/ByteBuffer;
    .restart local v25    # "digests":Ljava/nio/ByteBuffer;
    goto :goto_c

    .end local v24    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .end local v25    # "digests":Ljava/nio/ByteBuffer;
    .restart local v2    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .restart local v3    # "digests":Ljava/nio/ByteBuffer;
    :catch_18
    move-exception v0

    goto :goto_b

    :catch_19
    move-exception v0

    :goto_b
    move-object/from16 v24, v2

    move-object/from16 v25, v3

    .line 398
    .end local v2    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .end local v3    # "digests":Ljava/nio/ByteBuffer;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v24    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .restart local v25    # "digests":Ljava/nio/ByteBuffer;
    :goto_c
    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_DIGEST:Lcom/android/apksig/ApkVerifier$Issue;

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 399
    return-void

    .line 403
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v24    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .end local v25    # "digests":Ljava/nio/ByteBuffer;
    .restart local v2    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .restart local v3    # "digests":Ljava/nio/ByteBuffer;
    :cond_9
    move-object/from16 v24, v2

    move-object/from16 v25, v3

    .end local v2    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .end local v3    # "digests":Ljava/nio/ByteBuffer;
    .restart local v24    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .restart local v25    # "digests":Ljava/nio/ByteBuffer;
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signatures:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    move-object v2, v0

    .line 404
    .local v2, "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v0, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signatures:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$Signature;

    .line 405
    .local v3, "signature":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$Signature;
    invoke-virtual {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$Signature;->getAlgorithmId()I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-interface {v2, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 406
    .end local v3    # "signature":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$Signature;
    goto :goto_d

    .line 407
    :cond_a
    new-instance v0, Ljava/util/ArrayList;

    iget-object v3, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->contentDigests:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    move-object v3, v0

    .line 408
    .local v3, "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-object v0, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->contentDigests:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;

    .line 409
    .local v15, "digest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    invoke-virtual {v15}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;->getSignatureAlgorithmId()I

    move-result v21

    move-object/from16 v23, v0

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 410
    .end local v15    # "digest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    move-object/from16 v0, v23

    goto :goto_e

    .line 412
    :cond_b
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 413
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_SIG_ALG_MISMATCH_BETWEEN_SIGNATURES_AND_DIGESTS_RECORDS:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v1, v0, v15}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 417
    return-void

    .line 421
    :cond_c
    const/4 v0, 0x0

    .line 422
    .local v0, "additionalAttributeCount":I
    invoke-interface/range {p4 .. p4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v15

    .line 423
    .local v15, "supportedApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    move/from16 v21, v0

    .end local v0    # "additionalAttributeCount":I
    .local v21, "additionalAttributeCount":I
    new-instance v0, Ljava/util/HashSet;

    move-object/from16 v23, v2

    const/4 v2, 0x1

    .end local v2    # "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v23, "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-direct {v0, v2}, Ljava/util/HashSet;-><init>(I)V

    move-object v2, v0

    move/from16 v0, v21

    .line 424
    .end local v21    # "additionalAttributeCount":I
    .restart local v0    # "additionalAttributeCount":I
    .local v2, "supportedExpectedApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :goto_f
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v21

    if-eqz v21, :cond_e

    .line 425
    add-int/lit8 v21, v0, 0x1

    .line 427
    .end local v0    # "additionalAttributeCount":I
    .restart local v21    # "additionalAttributeCount":I
    nop

    .line 428
    :try_start_d
    invoke-static {v7}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 429
    .local v0, "attribute":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v26

    move/from16 v27, v26

    .line 430
    .local v27, "id":I
    invoke-static {v0}, Lcom/android/apksig/internal/util/ByteBufferUtils;->toByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v26

    move-object/from16 v28, v26

    .line 431
    .local v28, "value":[B
    move-object/from16 v26, v0

    .end local v0    # "attribute":Ljava/nio/ByteBuffer;
    .local v26, "attribute":Ljava/nio/ByteBuffer;
    iget-object v0, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->additionalAttributes:Ljava/util/List;
    :try_end_d
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_d .. :try_end_d} :catch_23
    .catch Ljava/nio/BufferUnderflowException; {:try_start_d .. :try_end_d} :catch_22

    move-object/from16 v29, v3

    .end local v3    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v29, "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :try_start_e
    new-instance v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$AdditionalAttribute;
    :try_end_e
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_e .. :try_end_e} :catch_21
    .catch Ljava/nio/BufferUnderflowException; {:try_start_e .. :try_end_e} :catch_20

    move-object/from16 v30, v4

    move/from16 v4, v27

    move-object/from16 v27, v5

    move-object/from16 v5, v28

    .end local v28    # "value":[B
    .local v4, "id":I
    .local v5, "value":[B
    .local v27, "publicKeyBytes":[B
    .local v30, "certificatePublicKeyBytes":[B
    :try_start_f
    invoke-direct {v3, v4, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$AdditionalAttribute;-><init>(I[B)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_f
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_f .. :try_end_f} :catch_1f
    .catch Ljava/nio/BufferUnderflowException; {:try_start_f .. :try_end_f} :catch_1e

    .line 433
    packed-switch v4, :pswitch_data_0

    .line 446
    move-object/from16 v28, v5

    move-object/from16 v31, v6

    .end local v5    # "value":[B
    .end local v6    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    .restart local v28    # "value":[B
    .local v31, "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    :try_start_10
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_UNKNOWN_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;
    :try_end_10
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_10 .. :try_end_10} :catch_1d
    .catch Ljava/nio/BufferUnderflowException; {:try_start_10 .. :try_end_10} :catch_1c

    goto :goto_11

    .line 436
    .end local v28    # "value":[B
    .end local v31    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    .restart local v5    # "value":[B
    .restart local v6    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    :pswitch_0
    :try_start_11
    invoke-static {v5}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 437
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 438
    .local v0, "foundId":I
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v15, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3
    :try_end_11
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_11 .. :try_end_11} :catch_1f
    .catch Ljava/nio/BufferUnderflowException; {:try_start_11 .. :try_end_11} :catch_1e

    if-eqz v3, :cond_d

    .line 439
    :try_start_12
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_12
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_12 .. :try_end_12} :catch_1b
    .catch Ljava/nio/BufferUnderflowException; {:try_start_12 .. :try_end_12} :catch_1a

    move-object/from16 v31, v6

    const/4 v3, 0x1

    const/16 v17, 0x0

    goto :goto_12

    .line 448
    .end local v0    # "foundId":I
    .end local v4    # "id":I
    .end local v5    # "value":[B
    .end local v26    # "attribute":Ljava/nio/ByteBuffer;
    :catch_1a
    move-exception v0

    goto :goto_10

    :catch_1b
    move-exception v0

    :goto_10
    move-object/from16 v31, v6

    goto :goto_16

    .line 441
    .restart local v0    # "foundId":I
    .restart local v4    # "id":I
    .restart local v5    # "value":[B
    .restart local v26    # "attribute":Ljava/nio/ByteBuffer;
    :cond_d
    :try_start_13
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_UNKNOWN_APK_SIG_SCHEME_ID:Lcom/android/apksig/ApkVerifier$Issue;

    move-object/from16 v28, v5

    .end local v5    # "value":[B
    .restart local v28    # "value":[B
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;
    :try_end_13
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_13 .. :try_end_13} :catch_1f
    .catch Ljava/nio/BufferUnderflowException; {:try_start_13 .. :try_end_13} :catch_1e

    move-object/from16 v31, v6

    .end local v6    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    .restart local v31    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    :try_start_14
    iget v6, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->index:I

    .line 442
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/16 v18, 0x0

    aput-object v6, v5, v18

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/16 v17, 0x1

    aput-object v6, v5, v17

    .line 441
    invoke-virtual {v1, v3, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addWarning(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 444
    const/4 v3, 0x1

    const/16 v17, 0x0

    goto :goto_12

    .line 446
    .end local v0    # "foundId":I
    :goto_11
    const/4 v3, 0x1

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/16 v17, 0x0

    aput-object v6, v5, v17

    invoke-virtual {v1, v0, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addWarning(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V
    :try_end_14
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_14 .. :try_end_14} :catch_1d
    .catch Ljava/nio/BufferUnderflowException; {:try_start_14 .. :try_end_14} :catch_1c

    .line 452
    .end local v4    # "id":I
    .end local v26    # "attribute":Ljava/nio/ByteBuffer;
    .end local v28    # "value":[B
    :goto_12
    move/from16 v0, v21

    move-object/from16 v5, v27

    move-object/from16 v3, v29

    move-object/from16 v4, v30

    move-object/from16 v6, v31

    goto/16 :goto_f

    .line 448
    :catch_1c
    move-exception v0

    goto :goto_16

    :catch_1d
    move-exception v0

    goto :goto_16

    .end local v31    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    .restart local v6    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    :catch_1e
    move-exception v0

    goto :goto_13

    :catch_1f
    move-exception v0

    :goto_13
    move-object/from16 v31, v6

    .end local v6    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    .restart local v31    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    goto :goto_16

    .end local v27    # "publicKeyBytes":[B
    .end local v30    # "certificatePublicKeyBytes":[B
    .end local v31    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    .local v4, "certificatePublicKeyBytes":[B
    .local v5, "publicKeyBytes":[B
    .restart local v6    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    :catch_20
    move-exception v0

    goto :goto_14

    :catch_21
    move-exception v0

    :goto_14
    move-object/from16 v30, v4

    move-object/from16 v27, v5

    move-object/from16 v31, v6

    .end local v4    # "certificatePublicKeyBytes":[B
    .end local v5    # "publicKeyBytes":[B
    .end local v6    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    .restart local v27    # "publicKeyBytes":[B
    .restart local v30    # "certificatePublicKeyBytes":[B
    .restart local v31    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    goto :goto_16

    .end local v27    # "publicKeyBytes":[B
    .end local v29    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v30    # "certificatePublicKeyBytes":[B
    .end local v31    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    .restart local v3    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v4    # "certificatePublicKeyBytes":[B
    .restart local v5    # "publicKeyBytes":[B
    .restart local v6    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    :catch_22
    move-exception v0

    goto :goto_15

    :catch_23
    move-exception v0

    :goto_15
    move-object/from16 v29, v3

    move-object/from16 v30, v4

    move-object/from16 v27, v5

    move-object/from16 v31, v6

    .line 449
    .end local v3    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v4    # "certificatePublicKeyBytes":[B
    .end local v5    # "publicKeyBytes":[B
    .end local v6    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    .local v0, "e":Ljava/lang/Exception;
    .restart local v27    # "publicKeyBytes":[B
    .restart local v29    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v30    # "certificatePublicKeyBytes":[B
    .restart local v31    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    :goto_16
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_ADDITIONAL_ATTRIBUTE:Lcom/android/apksig/ApkVerifier$Issue;

    .line 450
    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 449
    invoke-virtual {v1, v3, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 451
    return-void

    .line 456
    .end local v21    # "additionalAttributeCount":I
    .end local v27    # "publicKeyBytes":[B
    .end local v29    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v30    # "certificatePublicKeyBytes":[B
    .end local v31    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    .local v0, "additionalAttributeCount":I
    .restart local v3    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v4    # "certificatePublicKeyBytes":[B
    .restart local v5    # "publicKeyBytes":[B
    .restart local v6    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    :cond_e
    move-object/from16 v29, v3

    move-object/from16 v30, v4

    move-object/from16 v27, v5

    move-object/from16 v31, v6

    .end local v3    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v4    # "certificatePublicKeyBytes":[B
    .end local v5    # "publicKeyBytes":[B
    .end local v6    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    .restart local v27    # "publicKeyBytes":[B
    .restart local v29    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v30    # "certificatePublicKeyBytes":[B
    .restart local v31    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_17
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_10

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 457
    .local v4, "id":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v6, p5

    invoke-interface {v6, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_f

    .line 458
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v17, v2

    move-object/from16 v2, p4

    .end local v2    # "supportedExpectedApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .local v17, "supportedExpectedApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 459
    .local v5, "apkSigSchemeName":Ljava/lang/String;
    move/from16 v18, v0

    .end local v0    # "additionalAttributeCount":I
    .local v18, "additionalAttributeCount":I
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MISSING_APK_SIG_REFERENCED:Lcom/android/apksig/ApkVerifier$Issue;

    iget v2, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->index:I

    .line 461
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2, v5}, [Ljava/lang/Object;

    move-result-object v2

    .line 459
    invoke-virtual {v1, v0, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    goto :goto_18

    .line 457
    .end local v5    # "apkSigSchemeName":Ljava/lang/String;
    .end local v17    # "supportedExpectedApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v18    # "additionalAttributeCount":I
    .restart local v0    # "additionalAttributeCount":I
    .restart local v2    # "supportedExpectedApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_f
    move/from16 v18, v0

    move-object/from16 v17, v2

    .line 464
    .end local v0    # "additionalAttributeCount":I
    .end local v2    # "supportedExpectedApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v4    # "id":I
    .restart local v17    # "supportedExpectedApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .restart local v18    # "additionalAttributeCount":I
    :goto_18
    move-object/from16 v2, v17

    move/from16 v0, v18

    goto :goto_17

    .line 465
    .end local v17    # "supportedExpectedApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v18    # "additionalAttributeCount":I
    .restart local v0    # "additionalAttributeCount":I
    .restart local v2    # "supportedExpectedApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_10
    return-void

    .line 292
    .end local v0    # "additionalAttributeCount":I
    .end local v7    # "additionalAttributes":Ljava/nio/ByteBuffer;
    .end local v9    # "certificateIndex":I
    .end local v13    # "digestCount":I
    .end local v15    # "supportedApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v16    # "signedData":Ljava/nio/ByteBuffer;
    .end local v19    # "certificates":Ljava/nio/ByteBuffer;
    .end local v20    # "signedDataBytes":[B
    .end local v22    # "signatures":Ljava/nio/ByteBuffer;
    .end local v23    # "sigAlgsFromSignaturesRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v24    # "mainCertificate":Ljava/security/cert/X509Certificate;
    .end local v25    # "digests":Ljava/nio/ByteBuffer;
    .end local v27    # "publicKeyBytes":[B
    .end local v29    # "sigAlgsFromDigestsRecord":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v30    # "certificatePublicKeyBytes":[B
    .end local v31    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    .local v2, "signedData":Ljava/nio/ByteBuffer;
    .local v3, "signedDataBytes":[B
    .local v4, "signatures":Ljava/nio/ByteBuffer;
    .local v5, "publicKeyBytes":[B
    .restart local v6    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    :catch_24
    move-exception v0

    move-object/from16 v14, p1

    move-object/from16 v16, v2

    move-object/from16 v20, v3

    move-object/from16 v22, v4

    move-object/from16 v27, v5

    move-object/from16 v31, v6

    move-object/from16 v6, p5

    move-object v2, v0

    .end local v2    # "signedData":Ljava/nio/ByteBuffer;
    .end local v3    # "signedDataBytes":[B
    .end local v4    # "signatures":Ljava/nio/ByteBuffer;
    .end local v5    # "publicKeyBytes":[B
    .end local v6    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    .restart local v16    # "signedData":Ljava/nio/ByteBuffer;
    .restart local v20    # "signedDataBytes":[B
    .restart local v22    # "signatures":Ljava/nio/ByteBuffer;
    .restart local v27    # "publicKeyBytes":[B
    .restart local v31    # "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;>;"
    move-object v0, v2

    .line 293
    .local v0, "e":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$NoSupportedSignaturesException;
    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_NO_SUPPORTED_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 294
    return-void

    :pswitch_data_0
    .packed-switch -0x41100ff3
        :pswitch_0
    .end packed-switch
.end method

.method public static parseSigners(Ljava/nio/ByteBuffer;Ljava/util/Set;Ljava/util/Map;Ljava/util/Set;IILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V
    .locals 15
    .param p0, "apkSignatureSchemeV2Block"    # Ljava/nio/ByteBuffer;
    .param p4, "minSdkVersion"    # I
    .param p5, "maxSdkVersion"    # I
    .param p6, "result"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
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
            "apkSignatureSchemeV2Block",
            "contentDigestsToVerify",
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
            "Ljava/nio/ByteBuffer;",
            "Ljava/util/Set<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;II",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 185
    .local p1, "contentDigestsToVerify":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    .local p2, "supportedApkSigSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    .local p3, "foundApkSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    move-object/from16 v1, p6

    const/4 v2, 0x0

    :try_start_0
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_3

    move-object v3, v0

    .line 189
    .local v3, "signers":Ljava/nio/ByteBuffer;
    nop

    .line 190
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-nez v0, :cond_0

    .line 191
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_NO_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 192
    return-void

    .line 197
    :cond_0
    :try_start_1
    const-string v0, "X.509"

    invoke-static {v0}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v5
    :try_end_1
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_1} :catch_2

    .line 200
    .local v5, "certFactory":Ljava/security/cert/CertificateFactory;
    nop

    .line 201
    const/4 v0, 0x0

    .line 202
    .local v0, "signerCount":I
    :goto_0
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 203
    move v12, v0

    .line 204
    .local v12, "signerIndex":I
    add-int/lit8 v13, v0, 0x1

    .line 205
    .end local v0    # "signerCount":I
    .local v13, "signerCount":I
    new-instance v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    invoke-direct {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;-><init>()V

    move-object v14, v0

    .line 207
    .local v14, "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    iput v12, v14, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->index:I

    .line 208
    iget-object v0, v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v0, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    :try_start_2
    invoke-static {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 211
    .local v4, "signer":Ljava/nio/ByteBuffer;
    move-object v6, v14

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move/from16 v10, p4

    move/from16 v11, p5

    invoke-static/range {v4 .. v11}, Lcom/android/apksig/internal/apk/v2/V2SchemeVerifier;->parseSigner(Ljava/nio/ByteBuffer;Ljava/security/cert/CertificateFactory;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;Ljava/util/Set;Ljava/util/Map;Ljava/util/Set;II)V
    :try_end_2
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/nio/BufferUnderflowException; {:try_start_2 .. :try_end_2} :catch_0

    .line 223
    .end local v4    # "signer":Ljava/nio/ByteBuffer;
    nop

    .line 224
    .end local v12    # "signerIndex":I
    .end local v14    # "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    move v0, v13

    goto :goto_0

    .line 220
    .restart local v12    # "signerIndex":I
    .restart local v14    # "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    .line 221
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    sget-object v4, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_SIGNER:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v14, v4, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 222
    return-void

    .line 225
    .end local v12    # "signerIndex":I
    .end local v13    # "signerCount":I
    .end local v14    # "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    .local v0, "signerCount":I
    :cond_1
    return-void

    .line 198
    .end local v0    # "signerCount":I
    .end local v5    # "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_2
    move-exception v0

    .line 199
    .local v0, "e":Ljava/security/cert/CertificateException;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v4, "Failed to obtain X.509 CertificateFactory"

    invoke-direct {v2, v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 186
    .end local v0    # "e":Ljava/security/cert/CertificateException;
    .end local v3    # "signers":Ljava/nio/ByteBuffer;
    :catch_3
    move-exception v0

    move-object v3, v0

    move-object v0, v3

    .line 187
    .local v0, "e":Lcom/android/apksig/apk/ApkFormatException;
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V2_SIG_MALFORMED_SIGNERS:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v3, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 188
    return-void
.end method

.method public static verify(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;Ljava/util/Map;Ljava/util/Set;II)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .locals 17
    .param p0, "executor"    # Lcom/android/apksig/util/RunnablesExecutor;
    .param p1, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p2, "zipSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .param p5, "minSdkVersion"    # I
    .param p6, "maxSdkVersion"    # I
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
            "executor",
            "apk",
            "zipSections",
            "supportedApkSigSchemeNames",
            "foundSigSchemeIds",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/RunnablesExecutor;",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/apk/ApkUtils$ZipSections;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;II)",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/security/NoSuchAlgorithmException;,
            Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;
        }
    .end annotation

    .line 97
    .local p3, "supportedApkSigSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    .local p4, "foundSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    move-object/from16 v0, p1

    new-instance v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;-><init>(I)V

    .line 99
    .local v1, "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    nop

    .line 100
    const v2, 0x7109871a

    move-object/from16 v13, p2

    invoke-static {v0, v13, v2, v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Lcom/android/apksig/internal/apk/SignatureInfo;

    move-result-object v2

    .line 103
    .local v2, "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    const-wide/16 v3, 0x0

    iget-wide v5, v2, Lcom/android/apksig/internal/apk/SignatureInfo;->apkSigningBlockOffset:J

    invoke-interface {v0, v3, v4, v5, v6}, Lcom/android/apksig/util/DataSource;->slice(JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v14

    .line 104
    .local v14, "beforeApkSigningBlock":Lcom/android/apksig/util/DataSource;
    iget-wide v3, v2, Lcom/android/apksig/internal/apk/SignatureInfo;->centralDirOffset:J

    iget-wide v5, v2, Lcom/android/apksig/internal/apk/SignatureInfo;->eocdOffset:J

    iget-wide v7, v2, Lcom/android/apksig/internal/apk/SignatureInfo;->centralDirOffset:J

    sub-long/2addr v5, v7

    .line 105
    invoke-interface {v0, v3, v4, v5, v6}, Lcom/android/apksig/util/DataSource;->slice(JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v15

    .line 108
    .local v15, "centralDir":Lcom/android/apksig/util/DataSource;
    iget-object v12, v2, Lcom/android/apksig/internal/apk/SignatureInfo;->eocd:Ljava/nio/ByteBuffer;

    .line 110
    .local v12, "eocd":Ljava/nio/ByteBuffer;
    iget-object v5, v2, Lcom/android/apksig/internal/apk/SignatureInfo;->signatureBlock:Ljava/nio/ByteBuffer;

    move-object/from16 v3, p0

    move-object v4, v14

    move-object v6, v15

    move-object v7, v12

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    move/from16 v10, p5

    move/from16 v11, p6

    move-object/from16 v16, v12

    .end local v12    # "eocd":Ljava/nio/ByteBuffer;
    .local v16, "eocd":Ljava/nio/ByteBuffer;
    move-object v12, v1

    invoke-static/range {v3 .. v12}, Lcom/android/apksig/internal/apk/v2/V2SchemeVerifier;->verify(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Ljava/nio/ByteBuffer;Lcom/android/apksig/util/DataSource;Ljava/nio/ByteBuffer;Ljava/util/Map;Ljava/util/Set;IILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V

    .line 120
    return-object v1
.end method

.method private static verify(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Ljava/nio/ByteBuffer;Lcom/android/apksig/util/DataSource;Ljava/nio/ByteBuffer;Ljava/util/Map;Ljava/util/Set;IILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V
    .locals 14
    .param p0, "executor"    # Lcom/android/apksig/util/RunnablesExecutor;
    .param p1, "beforeApkSigningBlock"    # Lcom/android/apksig/util/DataSource;
    .param p2, "apkSignatureSchemeV2Block"    # Ljava/nio/ByteBuffer;
    .param p3, "centralDir"    # Lcom/android/apksig/util/DataSource;
    .param p4, "eocd"    # Ljava/nio/ByteBuffer;
    .param p7, "minSdkVersion"    # I
    .param p8, "maxSdkVersion"    # I
    .param p9, "result"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
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
            "beforeApkSigningBlock",
            "apkSignatureSchemeV2Block",
            "centralDir",
            "eocd",
            "supportedApkSigSchemeNames",
            "foundSigSchemeIds",
            "minSdkVersion",
            "maxSdkVersion",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/RunnablesExecutor;",
            "Lcom/android/apksig/util/DataSource;",
            "Ljava/nio/ByteBuffer;",
            "Lcom/android/apksig/util/DataSource;",
            "Ljava/nio/ByteBuffer;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;II",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 144
    .local p5, "supportedApkSigSchemeNames":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/lang/String;>;"
    .local p6, "foundSigSchemeIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    new-instance v1, Ljava/util/HashSet;

    const/4 v7, 0x1

    invoke-direct {v1, v7}, Ljava/util/HashSet;-><init>(I)V

    .line 145
    .local v1, "contentDigestsToVerify":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    move-object/from16 v0, p2

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    move/from16 v4, p7

    move/from16 v5, p8

    move-object/from16 v6, p9

    invoke-static/range {v0 .. v6}, Lcom/android/apksig/internal/apk/v2/V2SchemeVerifier;->parseSigners(Ljava/nio/ByteBuffer;Ljava/util/Set;Ljava/util/Map;Ljava/util/Set;IILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V

    .line 153
    invoke-virtual/range {p9 .. p9}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->containsErrors()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 154
    return-void

    .line 156
    :cond_0
    move-object v8, p0

    move-object v9, p1

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    move-object v12, v1

    move-object/from16 v13, p9

    invoke-static/range {v8 .. v13}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->verifyIntegrity(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/nio/ByteBuffer;Ljava/util/Set;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V

    .line 158
    invoke-virtual/range {p9 .. p9}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->containsErrors()Z

    move-result v0

    if-nez v0, :cond_1

    .line 159
    move-object/from16 v0, p9

    iput-boolean v7, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->verified:Z

    goto :goto_0

    .line 158
    :cond_1
    move-object/from16 v0, p9

    .line 161
    :goto_0
    return-void
.end method
