.class public Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage;
.super Ljava/lang/Object;
.source "V3SigningCertificateLineage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    }
.end annotation


# static fields
.field private static final CURRENT_VERSION:I = 0x1

.field private static final FIRST_VERSION:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static encodeSignedData(Ljava/security/cert/X509Certificate;I)[B
    .locals 4
    .param p0, "certificate"    # Ljava/security/cert/X509Certificate;
    .param p1, "flags"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "certificate",
            "flags"
        }
    .end annotation

    .line 229
    :try_start_0
    invoke-virtual {p0}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v0

    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsLengthPrefixedElement([B)[B

    move-result-object v0

    .line 230
    .local v0, "prefixedCertificate":[B
    array-length v1, v0

    add-int/lit8 v1, v1, 0x4

    .line 231
    .local v1, "payloadSize":I
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 232
    .local v2, "result":Ljava/nio/ByteBuffer;
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 233
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 234
    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 235
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    invoke-static {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsLengthPrefixedElement([B)[B

    move-result-object v3
    :try_end_0
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 236
    .end local v0    # "prefixedCertificate":[B
    .end local v1    # "payloadSize":I
    .end local v2    # "result":Ljava/nio/ByteBuffer;
    :catch_0
    move-exception v0

    .line 237
    .local v0, "e":Ljava/security/cert/CertificateEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Failed to encode V3SigningCertificateLineage certificate"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static encodeSigningCertificateLineage(Ljava/util/List;)[B
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signingCertificateLineage"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;",
            ">;)[B"
        }
    .end annotation

    .line 184
    .local p0, "signingCertificateLineage":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 185
    .local v0, "nodes":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;

    .line 186
    .local v2, "node":Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    invoke-static {v2}, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage;->encodeSigningCertificateNode(Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;)[B

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    .end local v2    # "node":Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    goto :goto_0

    .line 188
    :cond_0
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedElements(Ljava/util/List;)[B

    move-result-object v1

    .line 191
    .local v1, "encodedSigningCertificateLineage":[B
    array-length v2, v1

    add-int/lit8 v2, v2, 0x4

    .line 192
    .local v2, "payloadSize":I
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 193
    .local v3, "encodedWithVersion":Ljava/nio/ByteBuffer;
    sget-object v4, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 194
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 195
    invoke-virtual {v3, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 196
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    return-object v4
.end method

.method public static encodeSigningCertificateNode(Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;)[B
    .locals 7
    .param p0, "node"    # Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "node"
        }
    .end annotation

    .line 207
    const/4 v0, 0x0

    .line 208
    .local v0, "parentSigAlgorithmId":I
    iget-object v1, p0, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->parentSigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    if-eqz v1, :cond_0

    .line 209
    iget-object v1, p0, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->parentSigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getId()I

    move-result v0

    .line 211
    :cond_0
    const/4 v1, 0x0

    .line 212
    .local v1, "sigAlgorithmId":I
    iget-object v2, p0, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->sigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    if-eqz v2, :cond_1

    .line 213
    iget-object v2, p0, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->sigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    invoke-virtual {v2}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getId()I

    move-result v1

    .line 215
    :cond_1
    iget-object v2, p0, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->signingCert:Ljava/security/cert/X509Certificate;

    invoke-static {v2, v0}, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage;->encodeSignedData(Ljava/security/cert/X509Certificate;I)[B

    move-result-object v2

    .line 216
    .local v2, "prefixedSignedData":[B
    iget-object v3, p0, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->signature:[B

    invoke-static {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsLengthPrefixedElement([B)[B

    move-result-object v3

    .line 217
    .local v3, "prefixedSignature":[B
    array-length v4, v2

    add-int/lit8 v4, v4, 0x4

    add-int/lit8 v4, v4, 0x4

    array-length v5, v3

    add-int/2addr v4, v5

    .line 218
    .local v4, "payloadSize":I
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 219
    .local v5, "result":Ljava/nio/ByteBuffer;
    sget-object v6, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 220
    invoke-virtual {v5, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 221
    iget v6, p0, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->flags:I

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 222
    invoke-virtual {v5, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 223
    invoke-virtual {v5, v3}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 224
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v6

    return-object v6
.end method

.method public static readSigningCertificateLineage(Ljava/nio/ByteBuffer;)Ljava/util/List;
    .locals 22
    .param p0, "inputBytes"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "inputBytes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    const-string v1, " when parsing V3SigningCertificateLineage object"

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    const/4 v3, 0x0

    .line 80
    .local v3, "nodeCount":I
    if-eqz p0, :cond_9

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    if-nez v4, :cond_0

    goto/16 :goto_10

    .line 84
    :cond_0
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->checkByteOrderLittleEndian(Ljava/nio/ByteBuffer;)V

    .line 96
    const/4 v4, 0x0

    .line 97
    .local v4, "lastCert":Ljava/security/cert/X509Certificate;
    const/4 v5, 0x0

    .line 100
    .local v5, "lastSigAlgorithmId":I
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v6

    .line 101
    .local v6, "version":I
    const/4 v7, 0x1

    if-ne v6, v7, :cond_8

    .line 106
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_22
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_21
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_20
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_1f
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_1e
    .catch Ljava/security/SignatureException; {:try_start_0 .. :try_end_0} :catch_1d
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_1c

    .line 107
    .local v7, "certHistorySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/security/cert/X509Certificate;>;"
    :goto_0
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v8

    if-eqz v8, :cond_7

    .line 108
    add-int/lit8 v3, v3, 0x1

    .line 109
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v8

    .line 110
    .local v8, "nodeBytes":Ljava/nio/ByteBuffer;
    invoke-static {v8}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v9

    .line 111
    .local v9, "signedData":Ljava/nio/ByteBuffer;
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v15

    .line 112
    .local v15, "flags":I
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v10

    move/from16 v16, v10

    .line 113
    .local v16, "sigAlgorithmId":I
    invoke-static {v5}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v10

    move-object/from16 v17, v10

    .line 114
    .local v17, "sigAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    invoke-static {v8}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v10
    :try_end_1
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_1 .. :try_end_1} :catch_1b
    .catch Ljava/nio/BufferUnderflowException; {:try_start_1 .. :try_end_1} :catch_1a
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_19
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_18
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_1 .. :try_end_1} :catch_17
    .catch Ljava/security/SignatureException; {:try_start_1 .. :try_end_1} :catch_16
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_1} :catch_15

    move-object v14, v10

    .line 116
    .local v14, "signature":[B
    const-string v10, " when verifying V3SigningCertificateLineage object"

    if-eqz v4, :cond_3

    .line 118
    nop

    .line 119
    :try_start_2
    invoke-virtual/range {v17 .. v17}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaSignatureAlgorithmAndParams()Lcom/android/apksig/internal/util/Pair;

    move-result-object v11

    invoke-virtual {v11}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 120
    .local v11, "jcaSignatureAlgorithm":Ljava/lang/String;
    nop

    .line 121
    invoke-virtual/range {v17 .. v17}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaSignatureAlgorithmAndParams()Lcom/android/apksig/internal/util/Pair;

    move-result-object v12

    invoke-virtual {v12}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/security/spec/AlgorithmParameterSpec;

    .line 122
    .local v12, "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v13

    .line 123
    .local v13, "publicKey":Ljava/security/PublicKey;
    invoke-static {v11}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v18

    move-object/from16 v19, v18

    .line 124
    .local v19, "sig":Ljava/security/Signature;
    move/from16 v18, v6

    move-object/from16 v6, v19

    .end local v19    # "sig":Ljava/security/Signature;
    .local v6, "sig":Ljava/security/Signature;
    .local v18, "version":I
    invoke-virtual {v6, v13}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 125
    if-eqz v12, :cond_1

    .line 126
    invoke-virtual {v6, v12}, Ljava/security/Signature;->setParameter(Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 128
    :cond_1
    invoke-virtual {v6, v9}, Ljava/security/Signature;->update(Ljava/nio/ByteBuffer;)V

    .line 129
    invoke-virtual {v6, v14}, Ljava/security/Signature;->verify([B)Z

    move-result v19

    if-eqz v19, :cond_2

    goto :goto_1

    .line 130
    :cond_2
    move-object/from16 v19, v6

    .end local v6    # "sig":Ljava/security/Signature;
    .restart local v19    # "sig":Ljava/security/Signature;
    new-instance v6, Ljava/lang/SecurityException;

    move-object/from16 v20, v12

    .end local v12    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .local v20, "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v21, v13

    .end local v13    # "publicKey":Ljava/security/PublicKey;
    .local v21, "publicKey":Ljava/security/PublicKey;
    const-string v13, "Unable to verify signature of certificate #"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " using "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v6, v10}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    .end local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    .end local v3    # "nodeCount":I
    .end local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local v5    # "lastSigAlgorithmId":I
    .end local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    throw v6
    :try_end_2
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_2 .. :try_end_2} :catch_22
    .catch Ljava/nio/BufferUnderflowException; {:try_start_2 .. :try_end_2} :catch_21
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_20
    .catch Ljava/security/InvalidKeyException; {:try_start_2 .. :try_end_2} :catch_1f
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_2 .. :try_end_2} :catch_1e
    .catch Ljava/security/SignatureException; {:try_start_2 .. :try_end_2} :catch_1d
    .catch Ljava/security/cert/CertificateException; {:try_start_2 .. :try_end_2} :catch_1c

    .line 116
    .end local v11    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .end local v18    # "version":I
    .end local v19    # "sig":Ljava/security/Signature;
    .end local v20    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .end local v21    # "publicKey":Ljava/security/PublicKey;
    .restart local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    .restart local v3    # "nodeCount":I
    .restart local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v5    # "lastSigAlgorithmId":I
    .local v6, "version":I
    .restart local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    :cond_3
    move/from16 v18, v6

    .line 136
    .end local v6    # "version":I
    .restart local v18    # "version":I
    :goto_1
    :try_start_3
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 137
    invoke-static {v9}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v6

    .line 138
    .local v6, "encodedCert":[B
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v11

    move v13, v11

    .line 139
    .local v13, "signedSigAlgorithm":I
    if-eqz v4, :cond_5

    if-ne v5, v13, :cond_4

    move-object/from16 v19, v4

    goto :goto_2

    .line 140
    :cond_4
    new-instance v11, Ljava/lang/SecurityException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_3
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_3 .. :try_end_3} :catch_1b
    .catch Ljava/nio/BufferUnderflowException; {:try_start_3 .. :try_end_3} :catch_1a
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_3} :catch_19
    .catch Ljava/security/InvalidKeyException; {:try_start_3 .. :try_end_3} :catch_18
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_3 .. :try_end_3} :catch_17
    .catch Ljava/security/SignatureException; {:try_start_3 .. :try_end_3} :catch_16
    .catch Ljava/security/cert/CertificateException; {:try_start_3 .. :try_end_3} :catch_15

    move-object/from16 v19, v4

    .end local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .local v19, "lastCert":Ljava/security/cert/X509Certificate;
    :try_start_4
    const-string v4, "Signing algorithm ID mismatch for certificate #"

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v11, v4}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    .end local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    .end local v3    # "nodeCount":I
    .end local v5    # "lastSigAlgorithmId":I
    .end local v19    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    throw v11

    .line 139
    .restart local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    .restart local v3    # "nodeCount":I
    .restart local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v5    # "lastSigAlgorithmId":I
    .restart local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    :cond_5
    move-object/from16 v19, v4

    .line 143
    .end local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v19    # "lastCert":Ljava/security/cert/X509Certificate;
    :goto_2
    invoke-static {v6}, Lcom/android/apksig/internal/util/X509CertificateUtils;->generateCertificate([B)Ljava/security/cert/X509Certificate;

    move-result-object v4
    :try_end_4
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_4 .. :try_end_4} :catch_14
    .catch Ljava/nio/BufferUnderflowException; {:try_start_4 .. :try_end_4} :catch_13
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_4 .. :try_end_4} :catch_12
    .catch Ljava/security/InvalidKeyException; {:try_start_4 .. :try_end_4} :catch_11
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_4 .. :try_end_4} :catch_10
    .catch Ljava/security/SignatureException; {:try_start_4 .. :try_end_4} :catch_f
    .catch Ljava/security/cert/CertificateException; {:try_start_4 .. :try_end_4} :catch_e

    .line 144
    .end local v19    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    :try_start_5
    new-instance v10, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;

    invoke-direct {v10, v4, v6}, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;-><init>(Ljava/security/cert/X509Certificate;[B)V
    :try_end_5
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_5 .. :try_end_5} :catch_22
    .catch Ljava/nio/BufferUnderflowException; {:try_start_5 .. :try_end_5} :catch_21
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_5 .. :try_end_5} :catch_20
    .catch Ljava/security/InvalidKeyException; {:try_start_5 .. :try_end_5} :catch_1f
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_5 .. :try_end_5} :catch_1e
    .catch Ljava/security/SignatureException; {:try_start_5 .. :try_end_5} :catch_1d
    .catch Ljava/security/cert/CertificateException; {:try_start_5 .. :try_end_5} :catch_1c

    move-object v4, v10

    .line 145
    :try_start_6
    invoke-virtual {v7, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_6

    .line 150
    invoke-virtual {v7, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 151
    move/from16 v5, v16

    .line 152
    new-instance v12, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;

    .line 153
    invoke-static {v13}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v19

    .line 154
    invoke-static/range {v16 .. v16}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v20
    :try_end_6
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_6 .. :try_end_6} :catch_d
    .catch Ljava/nio/BufferUnderflowException; {:try_start_6 .. :try_end_6} :catch_c
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_6 .. :try_end_6} :catch_b
    .catch Ljava/security/InvalidKeyException; {:try_start_6 .. :try_end_6} :catch_a
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/security/SignatureException; {:try_start_6 .. :try_end_6} :catch_8
    .catch Ljava/security/cert/CertificateException; {:try_start_6 .. :try_end_6} :catch_7

    move-object v10, v12

    move-object v11, v4

    move-object/from16 v21, v4

    move-object v4, v12

    .end local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .local v21, "lastCert":Ljava/security/cert/X509Certificate;
    move-object/from16 v12, v19

    move/from16 v19, v13

    .end local v13    # "signedSigAlgorithm":I
    .local v19, "signedSigAlgorithm":I
    move-object/from16 v13, v20

    move-object/from16 v20, v14

    .end local v14    # "signature":[B
    .local v20, "signature":[B
    :try_start_7
    invoke-direct/range {v10 .. v15}, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;-><init>(Ljava/security/cert/X509Certificate;Lcom/android/apksig/internal/apk/SignatureAlgorithm;Lcom/android/apksig/internal/apk/SignatureAlgorithm;[BI)V

    .line 152
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    move/from16 v6, v18

    move-object/from16 v4, v21

    .end local v6    # "encodedCert":[B
    .end local v8    # "nodeBytes":Ljava/nio/ByteBuffer;
    .end local v9    # "signedData":Ljava/nio/ByteBuffer;
    .end local v15    # "flags":I
    .end local v16    # "sigAlgorithmId":I
    .end local v17    # "sigAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v19    # "signedSigAlgorithm":I
    .end local v20    # "signature":[B
    goto/16 :goto_0

    .line 146
    .end local v21    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v6    # "encodedCert":[B
    .restart local v8    # "nodeBytes":Ljava/nio/ByteBuffer;
    .restart local v9    # "signedData":Ljava/nio/ByteBuffer;
    .restart local v13    # "signedSigAlgorithm":I
    .restart local v14    # "signature":[B
    .restart local v15    # "flags":I
    .restart local v16    # "sigAlgorithmId":I
    .restart local v17    # "sigAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    :cond_6
    move-object/from16 v21, v4

    move/from16 v19, v13

    move-object/from16 v20, v14

    .end local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local v13    # "signedSigAlgorithm":I
    .end local v14    # "signature":[B
    .restart local v19    # "signedSigAlgorithm":I
    .restart local v20    # "signature":[B
    .restart local v21    # "lastCert":Ljava/security/cert/X509Certificate;
    new-instance v4, Ljava/lang/SecurityException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Encountered duplicate entries in SigningCertificateLineage at certificate #"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ".  All signing certificates should be unique"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v4, v10}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    .end local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    .end local v3    # "nodeCount":I
    .end local v5    # "lastSigAlgorithmId":I
    .end local v21    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    throw v4
    :try_end_7
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_7 .. :try_end_7} :catch_6
    .catch Ljava/nio/BufferUnderflowException; {:try_start_7 .. :try_end_7} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/security/InvalidKeyException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/security/SignatureException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/security/cert/CertificateException; {:try_start_7 .. :try_end_7} :catch_0

    .line 163
    .end local v6    # "encodedCert":[B
    .end local v7    # "certHistorySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/security/cert/X509Certificate;>;"
    .end local v8    # "nodeBytes":Ljava/nio/ByteBuffer;
    .end local v9    # "signedData":Ljava/nio/ByteBuffer;
    .end local v15    # "flags":I
    .end local v16    # "sigAlgorithmId":I
    .end local v17    # "sigAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v18    # "version":I
    .end local v19    # "signedSigAlgorithm":I
    .end local v20    # "signature":[B
    .restart local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    .restart local v3    # "nodeCount":I
    .restart local v5    # "lastSigAlgorithmId":I
    .restart local v21    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    :catch_0
    move-exception v0

    move-object v6, v0

    move-object/from16 v4, v21

    goto/16 :goto_b

    .line 158
    :catch_1
    move-exception v0

    goto :goto_3

    :catch_2
    move-exception v0

    goto :goto_3

    :catch_3
    move-exception v0

    goto :goto_3

    :catch_4
    move-exception v0

    :goto_3
    move-object v6, v0

    move-object/from16 v4, v21

    goto/16 :goto_d

    .line 156
    :catch_5
    move-exception v0

    goto :goto_4

    :catch_6
    move-exception v0

    :goto_4
    move-object v1, v0

    move-object/from16 v4, v21

    goto/16 :goto_f

    .line 163
    .end local v21    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    :catch_7
    move-exception v0

    move-object/from16 v21, v4

    move-object v6, v0

    .end local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v21    # "lastCert":Ljava/security/cert/X509Certificate;
    goto/16 :goto_b

    .line 158
    .end local v21    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    :catch_8
    move-exception v0

    goto :goto_5

    :catch_9
    move-exception v0

    goto :goto_5

    :catch_a
    move-exception v0

    goto :goto_5

    :catch_b
    move-exception v0

    :goto_5
    move-object/from16 v21, v4

    move-object v6, v0

    .end local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v21    # "lastCert":Ljava/security/cert/X509Certificate;
    goto/16 :goto_d

    .line 156
    .end local v21    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    :catch_c
    move-exception v0

    goto :goto_6

    :catch_d
    move-exception v0

    :goto_6
    move-object/from16 v21, v4

    move-object v1, v0

    .end local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v21    # "lastCert":Ljava/security/cert/X509Certificate;
    goto/16 :goto_f

    .line 163
    .end local v21    # "lastCert":Ljava/security/cert/X509Certificate;
    .local v19, "lastCert":Ljava/security/cert/X509Certificate;
    :catch_e
    move-exception v0

    move-object v6, v0

    move-object/from16 v4, v19

    goto :goto_b

    .line 158
    :catch_f
    move-exception v0

    goto :goto_7

    :catch_10
    move-exception v0

    goto :goto_7

    :catch_11
    move-exception v0

    goto :goto_7

    :catch_12
    move-exception v0

    :goto_7
    move-object v6, v0

    move-object/from16 v4, v19

    goto/16 :goto_d

    .line 156
    :catch_13
    move-exception v0

    goto :goto_8

    :catch_14
    move-exception v0

    :goto_8
    move-object v1, v0

    move-object/from16 v4, v19

    goto/16 :goto_f

    .line 107
    .end local v19    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .local v6, "version":I
    .restart local v7    # "certHistorySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/security/cert/X509Certificate;>;"
    :cond_7
    move-object/from16 v19, v4

    move/from16 v18, v6

    .line 166
    .end local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local v6    # "version":I
    .end local v7    # "certHistorySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/security/cert/X509Certificate;>;"
    .restart local v19    # "lastCert":Ljava/security/cert/X509Certificate;
    nop

    .line 167
    return-object v2

    .line 163
    .end local v19    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    :catch_15
    move-exception v0

    move-object/from16 v19, v4

    move-object v6, v0

    .end local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v19    # "lastCert":Ljava/security/cert/X509Certificate;
    goto :goto_b

    .line 158
    .end local v19    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    :catch_16
    move-exception v0

    goto :goto_9

    :catch_17
    move-exception v0

    goto :goto_9

    :catch_18
    move-exception v0

    goto :goto_9

    :catch_19
    move-exception v0

    :goto_9
    move-object/from16 v19, v4

    move-object v6, v0

    .end local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v19    # "lastCert":Ljava/security/cert/X509Certificate;
    goto :goto_d

    .line 156
    .end local v19    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    :catch_1a
    move-exception v0

    goto :goto_a

    :catch_1b
    move-exception v0

    :goto_a
    move-object/from16 v19, v4

    move-object v1, v0

    .end local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v19    # "lastCert":Ljava/security/cert/X509Certificate;
    goto :goto_f

    .line 103
    .end local v19    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v6    # "version":I
    :cond_8
    move/from16 v18, v6

    .end local v6    # "version":I
    .restart local v18    # "version":I
    :try_start_8
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "Encoded SigningCertificateLineage has a version different than any of which we are aware"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    .end local v3    # "nodeCount":I
    .end local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local v5    # "lastSigAlgorithmId":I
    .end local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    throw v6
    :try_end_8
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_8 .. :try_end_8} :catch_22
    .catch Ljava/nio/BufferUnderflowException; {:try_start_8 .. :try_end_8} :catch_21
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_8 .. :try_end_8} :catch_20
    .catch Ljava/security/InvalidKeyException; {:try_start_8 .. :try_end_8} :catch_1f
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_8 .. :try_end_8} :catch_1e
    .catch Ljava/security/SignatureException; {:try_start_8 .. :try_end_8} :catch_1d
    .catch Ljava/security/cert/CertificateException; {:try_start_8 .. :try_end_8} :catch_1c

    .line 163
    .end local v18    # "version":I
    .restart local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    .restart local v3    # "nodeCount":I
    .restart local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v5    # "lastSigAlgorithmId":I
    .restart local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    :catch_1c
    move-exception v0

    move-object v6, v0

    .line 164
    .local v6, "e":Ljava/security/cert/CertificateException;
    :goto_b
    new-instance v7, Ljava/lang/SecurityException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to decode certificate #"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v1, v6}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 158
    .end local v6    # "e":Ljava/security/cert/CertificateException;
    :catch_1d
    move-exception v0

    goto :goto_c

    :catch_1e
    move-exception v0

    goto :goto_c

    :catch_1f
    move-exception v0

    goto :goto_c

    :catch_20
    move-exception v0

    :goto_c
    move-object v6, v0

    .line 160
    .local v6, "e":Ljava/security/GeneralSecurityException;
    :goto_d
    new-instance v7, Ljava/lang/SecurityException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to verify signature over signed data for certificate #"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v1, v6}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 156
    .end local v6    # "e":Ljava/security/GeneralSecurityException;
    :catch_21
    move-exception v0

    goto :goto_e

    :catch_22
    move-exception v0

    :goto_e
    move-object v1, v0

    .line 157
    .local v1, "e":Ljava/lang/Exception;
    :goto_f
    new-instance v6, Ljava/io/IOException;

    const-string v7, "Failed to parse V3SigningCertificateLineage object"

    invoke-direct {v6, v7, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 81
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v4    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local v5    # "lastSigAlgorithmId":I
    :cond_9
    :goto_10
    const/4 v1, 0x0

    return-object v1
.end method
