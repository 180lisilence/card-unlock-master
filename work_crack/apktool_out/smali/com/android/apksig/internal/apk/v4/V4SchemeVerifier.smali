.class public abstract Lcom/android/apksig/internal/apk/v4/V4SchemeVerifier;
.super Ljava/lang/Object;
.source "V4SchemeVerifier.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    return-void
.end method

.method private static parseAndVerifySignatureBlock(Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;[B)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    .locals 16
    .param p0, "signingInfo"    # Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;
    .param p1, "signedData"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x10
        }
        names = {
            "signingInfo",
            "signedData"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 141
    move-object/from16 v1, p0

    new-instance v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    invoke-direct {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;-><init>()V

    move-object v2, v0

    .line 143
    .local v2, "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    const/4 v3, 0x0

    iput v3, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->index:I

    .line 145
    iget v4, v1, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->signatureAlgorithmId:I

    .line 146
    .local v4, "sigAlgorithmId":I
    iget-object v5, v1, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->signature:[B

    .line 147
    .local v5, "sigBytes":[B
    iget-object v0, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->signatures:Ljava/util/List;

    new-instance v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$Signature;

    invoke-direct {v6, v4, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$Signature;-><init>(I[B)V

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    invoke-static {v4}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v6

    .line 151
    .local v6, "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    if-nez v6, :cond_0

    .line 152
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_UNKNOWN_SIG_ALGORITHM:Lcom/android/apksig/ApkVerifier$Issue;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 153
    return-object v2

    .line 156
    :cond_0
    nop

    .line 157
    invoke-virtual {v6}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaSignatureAlgorithmAndParams()Lcom/android/apksig/internal/util/Pair;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Ljava/lang/String;

    .line 158
    .local v7, "jcaSignatureAlgorithm":Ljava/lang/String;
    nop

    .line 159
    invoke-virtual {v6}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaSignatureAlgorithmAndParams()Lcom/android/apksig/internal/util/Pair;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Ljava/security/spec/AlgorithmParameterSpec;

    .line 161
    .local v8, "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual {v6}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaKeyAlgorithm()Ljava/lang/String;

    move-result-object v9

    .line 163
    .local v9, "keyAlgorithm":Ljava/lang/String;
    iget-object v10, v1, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->publicKey:[B

    .line 166
    .local v10, "publicKeyBytes":[B
    :try_start_0
    invoke-static {v9}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v0

    new-instance v11, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v11, v10}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    invoke-virtual {v0, v11}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_8

    move-object v11, v0

    .line 171
    .local v11, "publicKey":Ljava/security/PublicKey;
    nop

    .line 174
    :try_start_1
    invoke-static {v7}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v0

    .line 175
    .local v0, "sig":Ljava/security/Signature;
    invoke-virtual {v0, v11}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 176
    if-eqz v8, :cond_1

    .line 177
    invoke-virtual {v0, v8}, Ljava/security/Signature;->setParameter(Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_1
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_7
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_1 .. :try_end_1} :catch_6
    .catch Ljava/security/SignatureException; {:try_start_1 .. :try_end_1} :catch_5

    .line 179
    :cond_1
    move-object/from16 v12, p1

    :try_start_2
    invoke-virtual {v0, v12}, Ljava/security/Signature;->update([B)V

    .line 180
    invoke-virtual {v0, v5}, Ljava/security/Signature;->verify([B)Z

    move-result v13

    if-nez v13, :cond_2

    .line 181
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v2, v3, v13}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 182
    return-object v2

    .line 184
    :cond_2
    iget-object v13, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->verifiedSignatures:Ljava/util/Map;

    invoke-interface {v13, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/security/InvalidKeyException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/security/SignatureException; {:try_start_2 .. :try_end_2} :catch_2

    .line 189
    nop

    .line 191
    .end local v0    # "sig":Ljava/security/Signature;
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->certificate:[B

    if-nez v0, :cond_3

    .line 192
    sget-object v0, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_NO_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 193
    return-object v2

    .line 202
    :cond_3
    :try_start_3
    new-instance v0, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;

    iget-object v13, v1, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->certificate:[B

    .line 203
    invoke-static {v13}, Lcom/android/apksig/internal/util/X509CertificateUtils;->generateCertificate([B)Ljava/security/cert/X509Certificate;

    move-result-object v13

    iget-object v14, v1, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->certificate:[B

    invoke-direct {v0, v13, v14}, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;-><init>(Ljava/security/cert/X509Certificate;[B)V
    :try_end_3
    .catch Ljava/security/cert/CertificateException; {:try_start_3 .. :try_end_3} :catch_1

    move-object v13, v0

    .line 208
    .local v13, "certificate":Ljava/security/cert/X509Certificate;
    nop

    .line 209
    iget-object v0, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->certs:Ljava/util/List;

    invoke-interface {v0, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 213
    nop

    .line 214
    :try_start_4
    invoke-virtual {v13}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v0

    .line 213
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodePublicKey(Ljava/security/PublicKey;)[B

    move-result-object v0
    :try_end_4
    .catch Ljava/security/InvalidKeyException; {:try_start_4 .. :try_end_4} :catch_0

    .line 219
    .local v0, "certificatePublicKeyBytes":[B
    goto :goto_0

    .line 215
    .end local v0    # "certificatePublicKeyBytes":[B
    :catch_0
    move-exception v0

    .line 216
    .local v0, "e":Ljava/security/InvalidKeyException;
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Caught an exception encoding the public key: "

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v14, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 217
    invoke-virtual {v0}, Ljava/security/InvalidKeyException;->printStackTrace()V

    .line 218
    invoke-virtual {v13}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v3

    invoke-interface {v3}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v3

    move-object v0, v3

    .line 220
    .local v0, "certificatePublicKeyBytes":[B
    :goto_0
    invoke-static {v10, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-nez v3, :cond_4

    .line 221
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_PUBLIC_KEY_MISMATCH_BETWEEN_CERTIFICATE_AND_SIGNATURES_RECORD:Lcom/android/apksig/ApkVerifier$Issue;

    .line 223
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->toHex([B)Ljava/lang/String;

    move-result-object v14

    .line 224
    invoke-static {v10}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->toHex([B)Ljava/lang/String;

    move-result-object v15

    filled-new-array {v14, v15}, [Ljava/lang/Object;

    move-result-object v14

    .line 221
    invoke-virtual {v2, v3, v14}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 225
    return-object v2

    .line 229
    :cond_4
    new-instance v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;

    iget-object v14, v1, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->apkDigest:[B

    const/4 v15, 0x0

    invoke-direct {v3, v15, v14}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;-><init>(I[B)V

    .line 232
    .local v3, "contentDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    iget-object v14, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->contentDigests:Ljava/util/List;

    invoke-interface {v14, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 234
    return-object v2

    .line 205
    .end local v0    # "certificatePublicKeyBytes":[B
    .end local v3    # "contentDigest":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;
    .end local v13    # "certificate":Ljava/security/cert/X509Certificate;
    :catch_1
    move-exception v0

    .line 206
    .local v0, "e":Ljava/security/cert/CertificateException;
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_MALFORMED_CERTIFICATE:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v2, v3, v13}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 207
    return-object v2

    .line 185
    .end local v0    # "e":Ljava/security/cert/CertificateException;
    :catch_2
    move-exception v0

    goto :goto_2

    :catch_3
    move-exception v0

    goto :goto_2

    :catch_4
    move-exception v0

    goto :goto_2

    :catch_5
    move-exception v0

    goto :goto_1

    :catch_6
    move-exception v0

    goto :goto_1

    :catch_7
    move-exception v0

    :goto_1
    move-object/from16 v12, p1

    .line 187
    .local v0, "e":Ljava/security/GeneralSecurityException;
    :goto_2
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_VERIFY_EXCEPTION:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v6, v0}, [Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v2, v3, v13}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 188
    return-object v2

    .line 168
    .end local v0    # "e":Ljava/security/GeneralSecurityException;
    .end local v11    # "publicKey":Ljava/security/PublicKey;
    :catch_8
    move-exception v0

    move-object/from16 v12, p1

    .line 169
    .local v0, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_MALFORMED_PUBLIC_KEY:Lcom/android/apksig/ApkVerifier$Issue;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v2, v3, v11}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 170
    return-object v2
.end method

.method public static verify(Lcom/android/apksig/util/DataSource;Ljava/io/File;)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .locals 14
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "v4SignatureFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apk",
            "v4SignatureFile"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 72
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 73
    .local v0, "input":Ljava/io/InputStream;
    :try_start_0
    invoke-static {v0}, Lcom/android/apksig/internal/apk/v4/V4Signature;->readFrom(Ljava/io/InputStream;)Lcom/android/apksig/internal/apk/v4/V4Signature;

    move-result-object v1

    .line 74
    .local v1, "signature":Lcom/android/apksig/internal/apk/v4/V4Signature;
    invoke-static {v0}, Lcom/android/apksig/internal/apk/v4/V4Signature;->readBytes(Ljava/io/InputStream;)[B

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    .local v2, "tree":[B
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 77
    .end local v0    # "input":Ljava/io/InputStream;
    new-instance v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    const/4 v3, 0x4

    invoke-direct {v0, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;-><init>(I)V

    .line 80
    .local v0, "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    if-nez v1, :cond_0

    .line 81
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_NO_SIGNATURES:Lcom/android/apksig/ApkVerifier$Issue;

    const-string v4, "Signature file does not contain a v4 signature."

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 83
    return-object v0

    .line 86
    :cond_0
    iget v3, v1, Lcom/android/apksig/internal/apk/v4/V4Signature;->version:I

    const/4 v4, 0x2

    if-eq v3, v4, :cond_1

    .line 87
    sget-object v3, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_VERSION_NOT_CURRENT:Lcom/android/apksig/ApkVerifier$Issue;

    iget v5, v1, Lcom/android/apksig/internal/apk/v4/V4Signature;->version:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 88
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v5, v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 87
    invoke-virtual {v0, v3, v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->addWarning(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 91
    :cond_1
    iget-object v3, v1, Lcom/android/apksig/internal/apk/v4/V4Signature;->hashingInfo:[B

    invoke-static {v3}, Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;->fromByteArray([B)Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;

    move-result-object v3

    .line 94
    .local v3, "hashingInfo":Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;
    iget-object v4, v1, Lcom/android/apksig/internal/apk/v4/V4Signature;->signingInfos:[B

    invoke-static {v4}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;->fromByteArray([B)Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;

    move-result-object v4

    .line 101
    .local v4, "signingInfos":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;
    iget-object v5, v4, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;->signingInfo:Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;

    .line 102
    .local v5, "signingInfo":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;
    invoke-interface {p0}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v6

    invoke-static {v6, v7, v3, v5}, Lcom/android/apksig/internal/apk/v4/V4Signature;->getSignedData(JLcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;)[B

    move-result-object v6

    .line 104
    .local v6, "signedData":[B
    invoke-static {v5, v6}, Lcom/android/apksig/internal/apk/v4/V4SchemeVerifier;->parseAndVerifySignatureBlock(Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;[B)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    move-result-object v7

    .line 105
    .local v7, "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    iget-object v8, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->containsErrors()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 107
    return-object v0

    .line 112
    .end local v5    # "signingInfo":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;
    .end local v6    # "signedData":[B
    :cond_2
    iget-object v5, v4, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;->signingInfoBlocks:[Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;

    array-length v6, v5

    const/4 v8, 0x0

    :goto_0
    if-ge v8, v6, :cond_4

    aget-object v9, v5, v8

    .line 113
    .local v9, "signingInfoBlock":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;
    iget-object v10, v9, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;->signingInfo:[B

    invoke-static {v10}, Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;->fromByteArray([B)Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;

    move-result-object v10

    .line 115
    .local v10, "signingInfo":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;
    invoke-interface {p0}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v11

    invoke-static {v11, v12, v3, v10}, Lcom/android/apksig/internal/apk/v4/V4Signature;->getSignedData(JLcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;)[B

    move-result-object v11

    .line 117
    .local v11, "signedData":[B
    iget-object v12, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-static {v10, v11}, Lcom/android/apksig/internal/apk/v4/V4SchemeVerifier;->parseAndVerifySignatureBlock(Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;[B)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    move-result-object v13

    invoke-interface {v12, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->containsErrors()Z

    move-result v12

    if-eqz v12, :cond_3

    .line 119
    return-object v0

    .line 112
    .end local v9    # "signingInfoBlock":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfoBlock;
    .end local v10    # "signingInfo":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfo;
    .end local v11    # "signedData":[B
    :cond_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 124
    :cond_4
    iget-object v5, v3, Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;->rawRootHash:[B

    invoke-static {p0, v7, v5, v2}, Lcom/android/apksig/internal/apk/v4/V4SchemeVerifier;->verifyRootHashAndTree(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;[B[B)V

    .line 125
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->containsErrors()Z

    move-result v5

    if-nez v5, :cond_5

    .line 126
    const/4 v5, 0x1

    iput-boolean v5, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->verified:Z

    .line 129
    :cond_5
    return-object v0

    .line 72
    .end local v1    # "signature":Lcom/android/apksig/internal/apk/v4/V4Signature;
    .end local v2    # "tree":[B
    .end local v3    # "hashingInfo":Lcom/android/apksig/internal/apk/v4/V4Signature$HashingInfo;
    .end local v4    # "signingInfos":Lcom/android/apksig/internal/apk/v4/V4Signature$SigningInfos;
    .end local v7    # "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    .local v0, "input":Ljava/io/InputStream;
    :catchall_0
    move-exception v1

    :try_start_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw v1
.end method

.method private static verifyRootHashAndTree(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;[B[B)V
    .locals 7
    .param p0, "apkContent"    # Lcom/android/apksig/util/DataSource;
    .param p1, "signerInfo"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    .param p2, "expectedDigest"    # [B
    .param p3, "expectedTree"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "apkContent",
            "signerInfo",
            "expectedDigest",
            "expectedTree"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 240
    nop

    .line 241
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->computeChunkVerityTreeAndDigest(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$VerityTreeAndDigest;

    move-result-object v0

    .line 243
    .local v0, "actualContentDigestInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$VerityTreeAndDigest;
    iget-object v1, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$VerityTreeAndDigest;->contentDigestAlgorithm:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    .line 244
    .local v1, "algorithm":Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    iget-object v2, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$VerityTreeAndDigest;->rootHash:[B

    .line 245
    .local v2, "actualDigest":[B
    iget-object v3, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$VerityTreeAndDigest;->tree:[B

    .line 247
    .local v3, "actualTree":[B
    invoke-static {p2, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v4

    if-nez v4, :cond_0

    .line 248
    sget-object v4, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_APK_ROOT_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 251
    invoke-static {p2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->toHex([B)Ljava/lang/String;

    move-result-object v5

    .line 252
    invoke-static {v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->toHex([B)Ljava/lang/String;

    move-result-object v6

    filled-new-array {v1, v5, v6}, [Ljava/lang/Object;

    move-result-object v5

    .line 248
    invoke-virtual {p1, v4, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 253
    return-void

    .line 256
    :cond_0
    if-eqz p3, :cond_1

    invoke-static {p3, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v4

    if-nez v4, :cond_1

    .line 257
    sget-object v4, Lcom/android/apksig/ApkVerifier$Issue;->V4_SIG_APK_TREE_DID_NOT_VERIFY:Lcom/android/apksig/ApkVerifier$Issue;

    .line 260
    invoke-static {p2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->toHex([B)Ljava/lang/String;

    move-result-object v5

    .line 261
    invoke-static {v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->toHex([B)Ljava/lang/String;

    move-result-object v6

    filled-new-array {v1, v5, v6}, [Ljava/lang/Object;

    move-result-object v5

    .line 257
    invoke-virtual {p1, v4, v5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 262
    return-void

    .line 265
    :cond_1
    iget-object v4, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->verifiedContentDigests:Ljava/util/Map;

    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    return-void
.end method
