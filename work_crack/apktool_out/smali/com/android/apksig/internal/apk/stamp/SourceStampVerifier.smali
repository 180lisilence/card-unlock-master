.class Lcom/android/apksig/internal/apk/stamp/SourceStampVerifier;
.super Ljava/lang/Object;
.source "SourceStampVerifier.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    return-void
.end method

.method private static parseStampAttributes(Ljava/nio/ByteBuffer;Ljava/security/cert/X509Certificate;Lcom/android/apksig/internal/apk/ApkSignerInfo;)V
    .locals 12
    .param p0, "stampAttributeData"    # Ljava/nio/ByteBuffer;
    .param p1, "sourceStampCertificate"    # Ljava/security/cert/X509Certificate;
    .param p2, "result"    # Lcom/android/apksig/internal/apk/ApkSignerInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "stampAttributeData",
            "sourceStampCertificate",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 311
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 312
    .local v0, "stampAttributes":Ljava/nio/ByteBuffer;
    const/4 v1, 0x0

    .line 313
    .local v1, "stampAttributeCount":I
    :goto_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 314
    add-int/lit8 v1, v1, 0x1

    .line 316
    :try_start_0
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 317
    .local v2, "attribute":Ljava/nio/ByteBuffer;
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    .line 318
    .local v3, "id":I
    invoke-static {v2}, Lcom/android/apksig/internal/util/ByteBufferUtils;->toByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v4

    .line 319
    .local v4, "value":[B
    const v5, -0x629cfc09

    if-ne v3, v5, :cond_0

    .line 320
    invoke-static {v4, p1, p2}, Lcom/android/apksig/internal/apk/stamp/SourceStampVerifier;->readStampCertificateLineage([BLjava/security/cert/X509Certificate;Lcom/android/apksig/internal/apk/ApkSignerInfo;)V

    goto :goto_2

    .line 321
    :cond_0
    const v5, -0x1bc3a6ba

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-ne v3, v5, :cond_2

    .line 322
    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v5

    sget-object v8, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v5, v8}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 323
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v8

    .line 324
    .local v8, "timestamp":J
    const-wide/16 v10, 0x0

    cmp-long v5, v8, v10

    if-lez v5, :cond_1

    .line 325
    iput-wide v8, p2, Lcom/android/apksig/internal/apk/ApkSignerInfo;->timestamp:J

    goto :goto_1

    .line 327
    :cond_1
    new-array v5, v7, [Ljava/lang/Object;

    .line 328
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    .line 327
    const/16 v6, 0x26

    invoke-virtual {p2, v6, v5}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addWarning(I[Ljava/lang/Object;)V

    .line 330
    .end local v8    # "timestamp":J
    :goto_1
    goto :goto_2

    .line 331
    :cond_2
    new-array v5, v7, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/16 v6, 0x20

    invoke-virtual {p2, v6, v5}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addInfoMessage(I[Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    .line 337
    .end local v2    # "attribute":Ljava/nio/ByteBuffer;
    .end local v3    # "id":I
    .end local v4    # "value":[B
    :goto_2
    goto :goto_0

    .line 333
    :catch_0
    move-exception v2

    goto :goto_3

    :catch_1
    move-exception v2

    .line 334
    .local v2, "e":Ljava/lang/Exception;
    :goto_3
    nop

    .line 335
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 334
    const/16 v4, 0x1f

    invoke-virtual {p2, v4, v3}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addWarning(I[Ljava/lang/Object;)V

    .line 336
    return-void

    .line 339
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_3
    return-void
.end method

.method private static readStampCertificateLineage([BLjava/security/cert/X509Certificate;Lcom/android/apksig/internal/apk/ApkSignerInfo;)V
    .locals 6
    .param p0, "lineageBytes"    # [B
    .param p1, "sourceStampCertificate"    # Ljava/security/cert/X509Certificate;
    .param p2, "result"    # Lcom/android/apksig/internal/apk/ApkSignerInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "lineageBytes",
            "sourceStampCertificate",
            "result"
        }
    .end annotation

    .line 345
    nop

    .line 347
    const/16 v0, 0x22

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 346
    invoke-static {v2}, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage;->readSigningCertificateLineage(Ljava/nio/ByteBuffer;)Ljava/util/List;

    move-result-object v2

    .line 348
    .local v2, "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 349
    iget-object v4, p2, Lcom/android/apksig/internal/apk/ApkSignerInfo;->certificateLineage:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;

    iget-object v5, v5, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->signingCert:Ljava/security/cert/X509Certificate;

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 348
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 352
    .end local v3    # "i":I
    :cond_0
    iget-object v3, p2, Lcom/android/apksig/internal/apk/ApkSignerInfo;->certificateLineage:Ljava/util/List;

    iget-object v4, p2, Lcom/android/apksig/internal/apk/ApkSignerInfo;->certificateLineage:Ljava/util/List;

    .line 353
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 352
    invoke-virtual {p1, v3}, Ljava/security/cert/X509Certificate;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 354
    new-array v3, v1, [Ljava/lang/Object;

    invoke-virtual {p2, v0, v3}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addWarning(I[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 360
    .end local v2    # "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;>;"
    :catch_0
    move-exception v0

    .line 361
    .local v0, "e":Ljava/lang/Exception;
    const/16 v2, 0x21

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p2, v2, v1}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addWarning(I[Ljava/lang/Object;)V

    goto :goto_2

    .line 358
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    .line 359
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p2, v0, v1}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addWarning(I[Ljava/lang/Object;)V

    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    goto :goto_1

    .line 356
    :catch_2
    move-exception v0

    .line 357
    .local v0, "e":Ljava/lang/SecurityException;
    const/16 v2, 0x23

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p2, v2, v1}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addWarning(I[Ljava/lang/Object;)V

    .line 362
    .end local v0    # "e":Ljava/lang/SecurityException;
    :cond_1
    :goto_1
    nop

    .line 363
    :goto_2
    return-void
.end method

.method private static verifySourceStampCertificate(Ljava/nio/ByteBuffer;Ljava/security/cert/CertificateFactory;[BLcom/android/apksig/internal/apk/ApkSignerInfo;)Ljava/security/cert/X509Certificate;
    .locals 7
    .param p0, "sourceStampBlockData"    # Ljava/nio/ByteBuffer;
    .param p1, "certFactory"    # Ljava/security/cert/CertificateFactory;
    .param p2, "sourceStampCertificateDigest"    # [B
    .param p3, "result"    # Lcom/android/apksig/internal/apk/ApkSignerInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "sourceStampBlockData",
            "certFactory",
            "sourceStampCertificateDigest",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 189
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v0

    .line 192
    .local v0, "sourceStampEncodedCertificate":[B
    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {p1, v2}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v2

    check-cast v2, Ljava/security/cert/X509Certificate;
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    .local v2, "sourceStampCertificate":Ljava/security/cert/X509Certificate;
    nop

    .line 202
    new-instance v3, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;

    invoke-direct {v3, v2, v0}, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;-><init>(Ljava/security/cert/X509Certificate;[B)V

    move-object v2, v3

    .line 205
    iget-object v3, p3, Lcom/android/apksig/internal/apk/ApkSignerInfo;->certs:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 208
    const-string v3, "SHA-256"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    .line 209
    .local v3, "messageDigest":Ljava/security/MessageDigest;
    invoke-virtual {v3, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 210
    invoke-virtual {v3}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    .line 211
    .local v4, "sourceStampBlockCertificateDigest":[B
    invoke-static {p2, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v5

    if-nez v5, :cond_0

    .line 212
    nop

    .line 215
    invoke-static {v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->toHex([B)Ljava/lang/String;

    move-result-object v5

    .line 216
    invoke-static {p2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->toHex([B)Ljava/lang/String;

    move-result-object v6

    filled-new-array {v5, v6}, [Ljava/lang/Object;

    move-result-object v5

    .line 212
    const/16 v6, 0x1b

    invoke-virtual {p3, v6, v5}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addWarning(I[Ljava/lang/Object;)V

    .line 217
    return-object v1

    .line 219
    :cond_0
    return-object v2

    .line 194
    .end local v2    # "sourceStampCertificate":Ljava/security/cert/X509Certificate;
    .end local v3    # "messageDigest":Ljava/security/MessageDigest;
    .end local v4    # "sourceStampBlockCertificateDigest":[B
    :catch_0
    move-exception v2

    .line 195
    .local v2, "e":Ljava/security/cert/CertificateException;
    const/16 v3, 0x12

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p3, v3, v4}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addWarning(I[Ljava/lang/Object;)V

    .line 196
    return-object v1
.end method

.method private static verifySourceStampSignature([BIILjava/security/cert/X509Certificate;Ljava/nio/ByteBuffer;Lcom/android/apksig/internal/apk/ApkSignerInfo;)V
    .locals 16
    .param p0, "data"    # [B
    .param p1, "minSdkVersion"    # I
    .param p2, "maxSdkVersion"    # I
    .param p3, "sourceStampCertificate"    # Ljava/security/cert/X509Certificate;
    .param p4, "signatures"    # Ljava/nio/ByteBuffer;
    .param p5, "result"    # Lcom/android/apksig/internal/apk/ApkSignerInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "data",
            "minSdkVersion",
            "maxSdkVersion",
            "sourceStampCertificate",
            "signatures",
            "result"
        }
    .end annotation

    .line 230
    move-object/from16 v1, p5

    const/4 v0, 0x0

    .line 231
    .local v0, "signatureCount":I
    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    move v4, v0

    .line 232
    .end local v0    # "signatureCount":I
    .local v2, "supportedSignatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSupportedSignature;>;"
    .local v4, "signatureCount":I
    :goto_0
    invoke-virtual/range {p4 .. p4}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    const/4 v5, 0x0

    if-eqz v0, :cond_1

    .line 233
    add-int/lit8 v4, v4, 0x1

    .line 235
    :try_start_0
    invoke-static/range {p4 .. p4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 236
    .local v0, "signature":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v6

    .line 237
    .local v6, "sigAlgorithmId":I
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v7

    .line 238
    .local v7, "sigBytes":[B
    invoke-static {v6}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v8

    .line 239
    .local v8, "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    if-nez v8, :cond_0

    .line 240
    new-array v9, v3, [Ljava/lang/Object;

    .line 242
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v5

    .line 240
    const/16 v5, 0x13

    invoke-virtual {v1, v5, v9}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addInfoMessage(I[Ljava/lang/Object;)V

    .line 243
    goto :goto_0

    .line 245
    :cond_0
    new-instance v5, Lcom/android/apksig/internal/apk/ApkSupportedSignature;

    invoke-direct {v5, v8, v7}, Lcom/android/apksig/internal/apk/ApkSupportedSignature;-><init>(Lcom/android/apksig/internal/apk/SignatureAlgorithm;[B)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    .line 251
    nop

    .end local v0    # "signature":Ljava/nio/ByteBuffer;
    .end local v6    # "sigAlgorithmId":I
    .end local v7    # "sigBytes":[B
    .end local v8    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    goto :goto_0

    .line 247
    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    .line 248
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    nop

    .line 249
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 248
    const/16 v5, 0x14

    invoke-virtual {v1, v5, v3}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addWarning(I[Ljava/lang/Object;)V

    .line 250
    return-void

    .line 253
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 254
    const/16 v0, 0x11

    new-array v3, v5, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addWarning(I[Ljava/lang/Object;)V

    .line 255
    return-void

    .line 260
    :cond_2
    nop

    .line 261
    move/from16 v5, p1

    move/from16 v6, p2

    :try_start_1
    invoke-static {v2, v5, v6, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getSignaturesToVerify(Ljava/util/List;IIZ)Ljava/util/List;

    move-result-object v0
    :try_end_1
    .catch Lcom/android/apksig/internal/apk/NoApkSupportedSignaturesException; {:try_start_1 .. :try_end_1} :catch_a

    move-object v3, v0

    .line 276
    .local v3, "signaturesToVerify":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSupportedSignature;>;"
    nop

    .line 277
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/apksig/internal/apk/ApkSupportedSignature;

    .line 278
    .local v7, "signature":Lcom/android/apksig/internal/apk/ApkSupportedSignature;
    iget-object v8, v7, Lcom/android/apksig/internal/apk/ApkSupportedSignature;->algorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    .line 279
    .restart local v8    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    nop

    .line 280
    invoke-virtual {v8}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaSignatureAlgorithmAndParams()Lcom/android/apksig/internal/util/Pair;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 281
    .local v9, "jcaSignatureAlgorithm":Ljava/lang/String;
    nop

    .line 282
    invoke-virtual {v8}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaSignatureAlgorithmAndParams()Lcom/android/apksig/internal/util/Pair;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/security/spec/AlgorithmParameterSpec;

    .line 283
    .local v10, "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual/range {p3 .. p3}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v11

    .line 285
    .local v11, "publicKey":Ljava/security/PublicKey;
    :try_start_2
    invoke-static {v9}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v12

    .line 286
    .local v12, "sig":Ljava/security/Signature;
    invoke-virtual {v12, v11}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 287
    if-eqz v10, :cond_3

    .line 288
    invoke-virtual {v12, v10}, Ljava/security/Signature;->setParameter(Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_2
    .catch Ljava/security/InvalidKeyException; {:try_start_2 .. :try_end_2} :catch_9
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_2 .. :try_end_2} :catch_8
    .catch Ljava/security/SignatureException; {:try_start_2 .. :try_end_2} :catch_7
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_6

    .line 290
    :cond_3
    move-object/from16 v13, p0

    :try_start_3
    invoke-virtual {v12, v13}, Ljava/security/Signature;->update([B)V

    .line 291
    iget-object v14, v7, Lcom/android/apksig/internal/apk/ApkSupportedSignature;->signature:[B

    .line 292
    .local v14, "sigBytes":[B
    invoke-virtual {v12, v14}, Ljava/security/Signature;->verify([B)Z

    move-result v15

    if-nez v15, :cond_4

    .line 293
    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v0

    const/16 v15, 0x15

    invoke-virtual {v1, v15, v0}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addWarning(I[Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/security/InvalidKeyException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/security/SignatureException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_3} :catch_2

    .line 295
    return-void

    .line 304
    .end local v12    # "sig":Ljava/security/Signature;
    .end local v14    # "sigBytes":[B
    :cond_4
    nop

    .line 305
    .end local v7    # "signature":Lcom/android/apksig/internal/apk/ApkSupportedSignature;
    .end local v8    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v9    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .end local v10    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .end local v11    # "publicKey":Ljava/security/PublicKey;
    goto :goto_2

    .line 297
    .restart local v7    # "signature":Lcom/android/apksig/internal/apk/ApkSupportedSignature;
    .restart local v8    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .restart local v9    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .restart local v10    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .restart local v11    # "publicKey":Ljava/security/PublicKey;
    :catch_2
    move-exception v0

    goto :goto_4

    :catch_3
    move-exception v0

    goto :goto_4

    :catch_4
    move-exception v0

    goto :goto_4

    :catch_5
    move-exception v0

    goto :goto_4

    :catch_6
    move-exception v0

    goto :goto_3

    :catch_7
    move-exception v0

    goto :goto_3

    :catch_8
    move-exception v0

    goto :goto_3

    :catch_9
    move-exception v0

    :goto_3
    move-object/from16 v13, p0

    .line 301
    .local v0, "e":Ljava/security/GeneralSecurityException;
    :goto_4
    const/16 v12, 0x16

    filled-new-array {v8, v0}, [Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v1, v12, v14}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addWarning(I[Ljava/lang/Object;)V

    .line 303
    return-void

    .line 306
    .end local v0    # "e":Ljava/security/GeneralSecurityException;
    .end local v7    # "signature":Lcom/android/apksig/internal/apk/ApkSupportedSignature;
    .end local v8    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v9    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .end local v10    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .end local v11    # "publicKey":Ljava/security/PublicKey;
    :cond_5
    move-object/from16 v13, p0

    return-void

    .line 263
    .end local v3    # "signaturesToVerify":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSupportedSignature;>;"
    :catch_a
    move-exception v0

    move-object/from16 v13, p0

    move-object v3, v0

    move-object v0, v3

    .line 266
    .local v0, "e":Lcom/android/apksig/internal/apk/NoApkSupportedSignaturesException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 267
    .local v3, "signatureAlgorithms":Ljava/lang/StringBuilder;
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/apksig/internal/apk/ApkSupportedSignature;

    .line 268
    .local v8, "supportedSignature":Lcom/android/apksig/internal/apk/ApkSupportedSignature;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    if-lez v9, :cond_6

    .line 269
    const-string v9, ", "

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    :cond_6
    iget-object v9, v8, Lcom/android/apksig/internal/apk/ApkSupportedSignature;->algorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 272
    .end local v8    # "supportedSignature":Lcom/android/apksig/internal/apk/ApkSupportedSignature;
    goto :goto_5

    .line 273
    :cond_7
    nop

    .line 274
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    filled-new-array {v7, v0}, [Ljava/lang/Object;

    move-result-object v7

    .line 273
    const/16 v8, 0x1a

    invoke-virtual {v1, v8, v7}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addWarning(I[Ljava/lang/Object;)V

    .line 275
    return-void
.end method

.method public static verifyV1SourceStamp(Ljava/nio/ByteBuffer;Ljava/security/cert/CertificateFactory;Lcom/android/apksig/internal/apk/ApkSignerInfo;[B[BII)V
    .locals 8
    .param p0, "sourceStampBlockData"    # Ljava/nio/ByteBuffer;
    .param p1, "certFactory"    # Ljava/security/cert/CertificateFactory;
    .param p2, "result"    # Lcom/android/apksig/internal/apk/ApkSignerInfo;
    .param p3, "apkDigest"    # [B
    .param p4, "sourceStampCertificateDigest"    # [B
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
            "sourceStampBlockData",
            "certFactory",
            "result",
            "apkDigest",
            "sourceStampCertificateDigest",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 87
    nop

    .line 88
    invoke-static {p0, p1, p4, p2}, Lcom/android/apksig/internal/apk/stamp/SourceStampVerifier;->verifySourceStampCertificate(Ljava/nio/ByteBuffer;Ljava/security/cert/CertificateFactory;[BLcom/android/apksig/internal/apk/ApkSignerInfo;)Ljava/security/cert/X509Certificate;

    move-result-object v6

    .line 90
    .local v6, "sourceStampCertificate":Ljava/security/cert/X509Certificate;
    invoke-virtual {p2}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->containsWarnings()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p2}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->containsErrors()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 94
    :cond_0
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 95
    .local v7, "apkDigestSignatures":Ljava/nio/ByteBuffer;
    move-object v0, p3

    move v1, p5

    move v2, p6

    move-object v3, v6

    move-object v4, v7

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lcom/android/apksig/internal/apk/stamp/SourceStampVerifier;->verifySourceStampSignature([BIILjava/security/cert/X509Certificate;Ljava/nio/ByteBuffer;Lcom/android/apksig/internal/apk/ApkSignerInfo;)V

    .line 102
    return-void

    .line 91
    .end local v7    # "apkDigestSignatures":Ljava/nio/ByteBuffer;
    :cond_1
    :goto_0
    return-void
.end method

.method public static verifyV2SourceStamp(Ljava/nio/ByteBuffer;Ljava/security/cert/CertificateFactory;Lcom/android/apksig/internal/apk/ApkSignerInfo;Ljava/util/Map;[BII)V
    .locals 16
    .param p0, "sourceStampBlockData"    # Ljava/nio/ByteBuffer;
    .param p1, "certFactory"    # Ljava/security/cert/CertificateFactory;
    .param p2, "result"    # Lcom/android/apksig/internal/apk/ApkSignerInfo;
    .param p4, "sourceStampCertificateDigest"    # [B
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
            "sourceStampBlockData",
            "certFactory",
            "result",
            "signatureSchemeApkDigests",
            "sourceStampCertificateDigest",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            "Ljava/security/cert/CertificateFactory;",
            "Lcom/android/apksig/internal/apk/ApkSignerInfo;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[B>;[BII)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 122
    .local p3, "signatureSchemeApkDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[B>;"
    move-object/from16 v6, p2

    .line 123
    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p4

    invoke-static {v7, v8, v9, v6}, Lcom/android/apksig/internal/apk/stamp/SourceStampVerifier;->verifySourceStampCertificate(Ljava/nio/ByteBuffer;Ljava/security/cert/CertificateFactory;[BLcom/android/apksig/internal/apk/ApkSignerInfo;)Ljava/security/cert/X509Certificate;

    move-result-object v10

    .line 125
    .local v10, "sourceStampCertificate":Ljava/security/cert/X509Certificate;
    invoke-virtual/range {p2 .. p2}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->containsWarnings()Z

    move-result v0

    if-nez v0, :cond_a

    invoke-virtual/range {p2 .. p2}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->containsErrors()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_5

    .line 130
    :cond_0
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v11

    .line 131
    .local v11, "signedSignatureSchemes":Ljava/nio/ByteBuffer;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v12, v0

    .line 132
    .local v12, "signedSignatureSchemeData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/nio/ByteBuffer;>;"
    :goto_0
    invoke-virtual {v11}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 133
    invoke-static {v11}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 134
    .local v0, "signedSignatureScheme":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    .line 135
    .local v1, "signatureSchemeId":I
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 136
    .local v2, "apkDigestSignatures":Ljava/nio/ByteBuffer;
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v12, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    .end local v0    # "signedSignatureScheme":Ljava/nio/ByteBuffer;
    .end local v1    # "signatureSchemeId":I
    .end local v2    # "apkDigestSignatures":Ljava/nio/ByteBuffer;
    goto :goto_0

    .line 140
    :cond_1
    invoke-interface/range {p3 .. p3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Ljava/util/Map$Entry;

    .line 144
    .local v14, "signatureSchemeApkDigest":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;[B>;"
    invoke-interface {v14}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x1f

    if-ne v0, v1, :cond_2

    .line 146
    goto :goto_1

    .line 148
    :cond_2
    invoke-interface {v14}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v12, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 149
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const/16 v1, 0x11

    invoke-virtual {v6, v1, v0}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addWarning(I[Ljava/lang/Object;)V

    .line 150
    return-void

    .line 152
    :cond_3
    nop

    .line 153
    invoke-interface {v14}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 157
    invoke-interface {v14}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v12, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Ljava/nio/ByteBuffer;

    .line 152
    move/from16 v1, p5

    move/from16 v2, p6

    move-object v3, v10

    move-object/from16 v5, p2

    invoke-static/range {v0 .. v5}, Lcom/android/apksig/internal/apk/stamp/SourceStampVerifier;->verifySourceStampSignature([BIILjava/security/cert/X509Certificate;Ljava/nio/ByteBuffer;Lcom/android/apksig/internal/apk/ApkSignerInfo;)V

    .line 159
    invoke-virtual/range {p2 .. p2}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->containsWarnings()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual/range {p2 .. p2}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->containsErrors()Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_2

    .line 162
    .end local v14    # "signatureSchemeApkDigest":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;[B>;"
    :cond_4
    goto :goto_1

    .line 160
    .restart local v14    # "signatureSchemeApkDigest":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;[B>;"
    :cond_5
    :goto_2
    return-void

    .line 164
    .end local v14    # "signatureSchemeApkDigest":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;[B>;"
    :cond_6
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 166
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v13

    .line 167
    .local v13, "stampAttributeData":Ljava/nio/ByteBuffer;
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v14

    .line 169
    .local v14, "stampAttributeDataSignatures":Ljava/nio/ByteBuffer;
    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    new-array v15, v0, [B

    .line 170
    .local v15, "stampAttributeBytes":[B
    invoke-virtual {v13, v15}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 171
    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 173
    move-object v0, v15

    move/from16 v1, p5

    move/from16 v2, p6

    move-object v3, v10

    move-object v4, v14

    move-object/from16 v5, p2

    invoke-static/range {v0 .. v5}, Lcom/android/apksig/internal/apk/stamp/SourceStampVerifier;->verifySourceStampSignature([BIILjava/security/cert/X509Certificate;Ljava/nio/ByteBuffer;Lcom/android/apksig/internal/apk/ApkSignerInfo;)V

    .line 175
    invoke-virtual/range {p2 .. p2}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->containsErrors()Z

    move-result v0

    if-nez v0, :cond_8

    invoke-virtual/range {p2 .. p2}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->containsWarnings()Z

    move-result v0

    if-eqz v0, :cond_7

    goto :goto_3

    .line 178
    :cond_7
    invoke-static {v13, v10, v6}, Lcom/android/apksig/internal/apk/stamp/SourceStampVerifier;->parseStampAttributes(Ljava/nio/ByteBuffer;Ljava/security/cert/X509Certificate;Lcom/android/apksig/internal/apk/ApkSignerInfo;)V

    goto :goto_4

    .line 176
    :cond_8
    :goto_3
    return-void

    .line 180
    .end local v13    # "stampAttributeData":Ljava/nio/ByteBuffer;
    .end local v14    # "stampAttributeDataSignatures":Ljava/nio/ByteBuffer;
    .end local v15    # "stampAttributeBytes":[B
    :cond_9
    :goto_4
    return-void

    .line 126
    .end local v11    # "signedSignatureSchemes":Ljava/nio/ByteBuffer;
    .end local v12    # "signedSignatureSchemeData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/nio/ByteBuffer;>;"
    :cond_a
    :goto_5
    return-void
.end method
