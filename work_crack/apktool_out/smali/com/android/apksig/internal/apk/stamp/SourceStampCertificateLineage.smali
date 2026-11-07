.class public Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage;
.super Ljava/lang/Object;
.source "SourceStampCertificateLineage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;
    }
.end annotation


# static fields
.field private static final CURRENT_VERSION:I = 0x1

.field private static final FIRST_VERSION:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static readSigningCertificateLineage(Ljava/nio/ByteBuffer;)Ljava/util/List;
    .locals 23
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
            "Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 58
    const-string v1, " when parsing SourceStampCertificateLineage object"

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;>;"
    const/4 v3, 0x0

    .line 60
    .local v3, "nodeCount":I
    if-eqz p0, :cond_9

    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    if-nez v4, :cond_0

    goto/16 :goto_d

    .line 64
    :cond_0
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->checkByteOrderLittleEndian(Ljava/nio/ByteBuffer;)V

    .line 68
    :try_start_0
    const-string v4, "X.509"

    invoke-static {v4}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v4
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_31

    .line 71
    .local v4, "certFactory":Ljava/security/cert/CertificateFactory;
    nop

    .line 83
    const/4 v5, 0x0

    .line 84
    .local v5, "lastCert":Ljava/security/cert/X509Certificate;
    const/4 v6, 0x0

    .line 87
    .local v6, "lastSigAlgorithmId":I
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v7

    .line 88
    .local v7, "version":I
    const/4 v8, 0x1

    if-ne v7, v8, :cond_8

    .line 93
    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V
    :try_end_1
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_1 .. :try_end_1} :catch_30
    .catch Ljava/nio/BufferUnderflowException; {:try_start_1 .. :try_end_1} :catch_2f
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_2e
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_2d
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_1 .. :try_end_1} :catch_2c
    .catch Ljava/security/SignatureException; {:try_start_1 .. :try_end_1} :catch_2b
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_1} :catch_2a

    .line 94
    .local v8, "certHistorySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/security/cert/X509Certificate;>;"
    :goto_0
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 95
    add-int/lit8 v3, v3, 0x1

    .line 96
    invoke-static/range {p0 .. p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v9

    .line 97
    .local v9, "nodeBytes":Ljava/nio/ByteBuffer;
    invoke-static {v9}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v10

    .line 98
    .local v10, "signedData":Ljava/nio/ByteBuffer;
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v16

    .line 99
    .local v16, "flags":I
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v11

    move/from16 v17, v11

    .line 100
    .local v17, "sigAlgorithmId":I
    invoke-static {v6}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v11

    move-object/from16 v18, v11

    .line 101
    .local v18, "sigAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    invoke-static {v9}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v11
    :try_end_2
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_2 .. :try_end_2} :catch_22
    .catch Ljava/nio/BufferUnderflowException; {:try_start_2 .. :try_end_2} :catch_21
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_20
    .catch Ljava/security/InvalidKeyException; {:try_start_2 .. :try_end_2} :catch_1f
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_2 .. :try_end_2} :catch_1e
    .catch Ljava/security/SignatureException; {:try_start_2 .. :try_end_2} :catch_1d
    .catch Ljava/security/cert/CertificateException; {:try_start_2 .. :try_end_2} :catch_1c

    move-object v15, v11

    .line 103
    .local v15, "signature":[B
    const-string v11, " when verifying SourceStampCertificateLineage object"

    if-eqz v5, :cond_3

    .line 105
    nop

    .line 106
    :try_start_3
    invoke-virtual/range {v18 .. v18}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaSignatureAlgorithmAndParams()Lcom/android/apksig/internal/util/Pair;

    move-result-object v12

    invoke-virtual {v12}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 107
    .local v12, "jcaSignatureAlgorithm":Ljava/lang/String;
    nop

    .line 108
    invoke-virtual/range {v18 .. v18}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getJcaSignatureAlgorithmAndParams()Lcom/android/apksig/internal/util/Pair;

    move-result-object v13

    invoke-virtual {v13}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/security/spec/AlgorithmParameterSpec;

    .line 109
    .local v13, "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual {v5}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v14

    .line 110
    .local v14, "publicKey":Ljava/security/PublicKey;
    invoke-static {v12}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v19

    move-object/from16 v20, v19

    .line 111
    .local v20, "sig":Ljava/security/Signature;
    move/from16 v19, v7

    move-object/from16 v7, v20

    .end local v20    # "sig":Ljava/security/Signature;
    .local v7, "sig":Ljava/security/Signature;
    .local v19, "version":I
    invoke-virtual {v7, v14}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 112
    if-eqz v13, :cond_1

    .line 113
    invoke-virtual {v7, v13}, Ljava/security/Signature;->setParameter(Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 115
    :cond_1
    invoke-virtual {v7, v10}, Ljava/security/Signature;->update(Ljava/nio/ByteBuffer;)V

    .line 116
    invoke-virtual {v7, v15}, Ljava/security/Signature;->verify([B)Z

    move-result v20

    if-eqz v20, :cond_2

    goto :goto_2

    .line 117
    :cond_2
    move-object/from16 v20, v7

    .end local v7    # "sig":Ljava/security/Signature;
    .restart local v20    # "sig":Ljava/security/Signature;
    new-instance v7, Ljava/lang/SecurityException;

    move-object/from16 v21, v13

    .end local v13    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .local v21, "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v22, v14

    .end local v14    # "publicKey":Ljava/security/PublicKey;
    .local v22, "publicKey":Ljava/security/PublicKey;
    const-string v14, "Unable to verify signature of certificate #"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " using "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v7, v11}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    .end local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;>;"
    .end local v3    # "nodeCount":I
    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .end local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local v6    # "lastSigAlgorithmId":I
    .end local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    throw v7
    :try_end_3
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_3 .. :try_end_3} :catch_6
    .catch Ljava/nio/BufferUnderflowException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/security/InvalidKeyException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/security/SignatureException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/security/cert/CertificateException; {:try_start_3 .. :try_end_3} :catch_0

    .line 151
    .end local v8    # "certHistorySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/security/cert/X509Certificate;>;"
    .end local v9    # "nodeBytes":Ljava/nio/ByteBuffer;
    .end local v10    # "signedData":Ljava/nio/ByteBuffer;
    .end local v12    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .end local v15    # "signature":[B
    .end local v16    # "flags":I
    .end local v17    # "sigAlgorithmId":I
    .end local v18    # "sigAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v19    # "version":I
    .end local v20    # "sig":Ljava/security/Signature;
    .end local v21    # "jcaSignatureAlgorithmParams":Ljava/security/spec/AlgorithmParameterSpec;
    .end local v22    # "publicKey":Ljava/security/PublicKey;
    .restart local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;>;"
    .restart local v3    # "nodeCount":I
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v6    # "lastSigAlgorithmId":I
    .restart local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    :catch_0
    move-exception v0

    move-object/from16 v22, v4

    move-object v4, v0

    goto/16 :goto_a

    .line 146
    :catch_1
    move-exception v0

    move-object/from16 v22, v4

    move-object v4, v0

    goto/16 :goto_b

    :catch_2
    move-exception v0

    move-object/from16 v22, v4

    move-object v4, v0

    goto/16 :goto_b

    :catch_3
    move-exception v0

    move-object/from16 v22, v4

    move-object v4, v0

    goto/16 :goto_b

    :catch_4
    move-exception v0

    move-object/from16 v22, v4

    move-object v4, v0

    goto/16 :goto_b

    .line 144
    :catch_5
    move-exception v0

    goto :goto_1

    :catch_6
    move-exception v0

    :goto_1
    move-object v1, v0

    move-object/from16 v22, v4

    goto/16 :goto_c

    .line 103
    .local v7, "version":I
    .restart local v8    # "certHistorySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/security/cert/X509Certificate;>;"
    .restart local v9    # "nodeBytes":Ljava/nio/ByteBuffer;
    .restart local v10    # "signedData":Ljava/nio/ByteBuffer;
    .restart local v15    # "signature":[B
    .restart local v16    # "flags":I
    .restart local v17    # "sigAlgorithmId":I
    .restart local v18    # "sigAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    :cond_3
    move/from16 v19, v7

    .line 123
    .end local v7    # "version":I
    .restart local v19    # "version":I
    :goto_2
    :try_start_4
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 124
    invoke-static {v10}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->readLengthPrefixedByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v7

    .line 125
    .local v7, "encodedCert":[B
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v12
    :try_end_4
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_4 .. :try_end_4} :catch_22
    .catch Ljava/nio/BufferUnderflowException; {:try_start_4 .. :try_end_4} :catch_21
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_4 .. :try_end_4} :catch_20
    .catch Ljava/security/InvalidKeyException; {:try_start_4 .. :try_end_4} :catch_1f
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_4 .. :try_end_4} :catch_1e
    .catch Ljava/security/SignatureException; {:try_start_4 .. :try_end_4} :catch_1d
    .catch Ljava/security/cert/CertificateException; {:try_start_4 .. :try_end_4} :catch_1c

    move v14, v12

    .line 126
    .local v14, "signedSigAlgorithm":I
    if-eqz v5, :cond_5

    if-ne v6, v14, :cond_4

    move-object/from16 v20, v5

    goto/16 :goto_6

    .line 127
    :cond_4
    :try_start_5
    new-instance v12, Ljava/lang/SecurityException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_5
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_5 .. :try_end_5} :catch_14
    .catch Ljava/nio/BufferUnderflowException; {:try_start_5 .. :try_end_5} :catch_13
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_5 .. :try_end_5} :catch_12
    .catch Ljava/security/InvalidKeyException; {:try_start_5 .. :try_end_5} :catch_11
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_5 .. :try_end_5} :catch_10
    .catch Ljava/security/SignatureException; {:try_start_5 .. :try_end_5} :catch_f
    .catch Ljava/security/cert/CertificateException; {:try_start_5 .. :try_end_5} :catch_e

    move-object/from16 v20, v5

    .end local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .local v20, "lastCert":Ljava/security/cert/X509Certificate;
    :try_start_6
    const-string v5, "Signing algorithm ID mismatch for certificate #"

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v12, v5}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    .end local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;>;"
    .end local v3    # "nodeCount":I
    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .end local v6    # "lastSigAlgorithmId":I
    .end local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    throw v12
    :try_end_6
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_6 .. :try_end_6} :catch_d
    .catch Ljava/nio/BufferUnderflowException; {:try_start_6 .. :try_end_6} :catch_c
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_6 .. :try_end_6} :catch_b
    .catch Ljava/security/InvalidKeyException; {:try_start_6 .. :try_end_6} :catch_a
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/security/SignatureException; {:try_start_6 .. :try_end_6} :catch_8
    .catch Ljava/security/cert/CertificateException; {:try_start_6 .. :try_end_6} :catch_7

    .line 151
    .end local v7    # "encodedCert":[B
    .end local v8    # "certHistorySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/security/cert/X509Certificate;>;"
    .end local v9    # "nodeBytes":Ljava/nio/ByteBuffer;
    .end local v10    # "signedData":Ljava/nio/ByteBuffer;
    .end local v14    # "signedSigAlgorithm":I
    .end local v15    # "signature":[B
    .end local v16    # "flags":I
    .end local v17    # "sigAlgorithmId":I
    .end local v18    # "sigAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v19    # "version":I
    .restart local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;>;"
    .restart local v3    # "nodeCount":I
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v6    # "lastSigAlgorithmId":I
    .restart local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    :catch_7
    move-exception v0

    move-object/from16 v22, v4

    move-object/from16 v5, v20

    move-object v4, v0

    goto/16 :goto_a

    .line 146
    :catch_8
    move-exception v0

    move-object/from16 v22, v4

    move-object/from16 v5, v20

    move-object v4, v0

    goto/16 :goto_b

    :catch_9
    move-exception v0

    move-object/from16 v22, v4

    move-object/from16 v5, v20

    move-object v4, v0

    goto/16 :goto_b

    :catch_a
    move-exception v0

    move-object/from16 v22, v4

    move-object/from16 v5, v20

    move-object v4, v0

    goto/16 :goto_b

    :catch_b
    move-exception v0

    move-object/from16 v22, v4

    move-object/from16 v5, v20

    move-object v4, v0

    goto/16 :goto_b

    .line 144
    :catch_c
    move-exception v0

    goto :goto_3

    :catch_d
    move-exception v0

    :goto_3
    move-object v1, v0

    move-object/from16 v22, v4

    move-object/from16 v5, v20

    goto/16 :goto_c

    .line 151
    .end local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    :catch_e
    move-exception v0

    move-object/from16 v20, v5

    move-object/from16 v22, v4

    move-object v4, v0

    .end local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    goto/16 :goto_a

    .line 146
    .end local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    :catch_f
    move-exception v0

    goto :goto_4

    :catch_10
    move-exception v0

    goto :goto_4

    :catch_11
    move-exception v0

    goto :goto_4

    :catch_12
    move-exception v0

    :goto_4
    move-object/from16 v20, v5

    move-object/from16 v22, v4

    move-object v4, v0

    .end local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    goto/16 :goto_b

    .line 144
    .end local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    :catch_13
    move-exception v0

    goto :goto_5

    :catch_14
    move-exception v0

    :goto_5
    move-object/from16 v20, v5

    move-object v1, v0

    move-object/from16 v22, v4

    .end local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    goto/16 :goto_c

    .line 126
    .end local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v7    # "encodedCert":[B
    .restart local v8    # "certHistorySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/security/cert/X509Certificate;>;"
    .restart local v9    # "nodeBytes":Ljava/nio/ByteBuffer;
    .restart local v10    # "signedData":Ljava/nio/ByteBuffer;
    .restart local v14    # "signedSigAlgorithm":I
    .restart local v15    # "signature":[B
    .restart local v16    # "flags":I
    .restart local v17    # "sigAlgorithmId":I
    .restart local v18    # "sigAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .restart local v19    # "version":I
    :cond_5
    move-object/from16 v20, v5

    .line 130
    .end local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    :goto_6
    :try_start_7
    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-direct {v5, v7}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {v4, v5}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v5

    check-cast v5, Ljava/security/cert/X509Certificate;
    :try_end_7
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_7 .. :try_end_7} :catch_1b
    .catch Ljava/nio/BufferUnderflowException; {:try_start_7 .. :try_end_7} :catch_1a
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_7 .. :try_end_7} :catch_19
    .catch Ljava/security/InvalidKeyException; {:try_start_7 .. :try_end_7} :catch_18
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_7 .. :try_end_7} :catch_17
    .catch Ljava/security/SignatureException; {:try_start_7 .. :try_end_7} :catch_16
    .catch Ljava/security/cert/CertificateException; {:try_start_7 .. :try_end_7} :catch_15

    .line 132
    .end local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    :try_start_8
    new-instance v11, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;

    invoke-direct {v11, v5, v7}, Lcom/android/apksig/internal/util/GuaranteedEncodedFormX509Certificate;-><init>(Ljava/security/cert/X509Certificate;[B)V

    move-object v5, v11

    .line 133
    invoke-virtual {v8, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_6

    .line 138
    invoke-virtual {v8, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 139
    move/from16 v6, v17

    .line 140
    new-instance v13, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;

    .line 141
    invoke-static {v14}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v20

    .line 142
    invoke-static/range {v17 .. v17}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v21
    :try_end_8
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_8 .. :try_end_8} :catch_30
    .catch Ljava/nio/BufferUnderflowException; {:try_start_8 .. :try_end_8} :catch_2f
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_8 .. :try_end_8} :catch_2e
    .catch Ljava/security/InvalidKeyException; {:try_start_8 .. :try_end_8} :catch_2d
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_8 .. :try_end_8} :catch_2c
    .catch Ljava/security/SignatureException; {:try_start_8 .. :try_end_8} :catch_2b
    .catch Ljava/security/cert/CertificateException; {:try_start_8 .. :try_end_8} :catch_2a

    move-object v11, v13

    move-object v12, v5

    move-object/from16 v22, v4

    move-object v4, v13

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .local v22, "certFactory":Ljava/security/cert/CertificateFactory;
    move-object/from16 v13, v20

    move/from16 v20, v14

    .end local v14    # "signedSigAlgorithm":I
    .local v20, "signedSigAlgorithm":I
    move-object/from16 v14, v21

    move-object/from16 v21, v15

    .end local v15    # "signature":[B
    .local v21, "signature":[B
    :try_start_9
    invoke-direct/range {v11 .. v16}, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;-><init>(Ljava/security/cert/X509Certificate;Lcom/android/apksig/internal/apk/SignatureAlgorithm;Lcom/android/apksig/internal/apk/SignatureAlgorithm;[BI)V

    .line 140
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    move/from16 v7, v19

    move-object/from16 v4, v22

    .end local v7    # "encodedCert":[B
    .end local v9    # "nodeBytes":Ljava/nio/ByteBuffer;
    .end local v10    # "signedData":Ljava/nio/ByteBuffer;
    .end local v16    # "flags":I
    .end local v17    # "sigAlgorithmId":I
    .end local v18    # "sigAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v20    # "signedSigAlgorithm":I
    .end local v21    # "signature":[B
    goto/16 :goto_0

    .line 134
    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v7    # "encodedCert":[B
    .restart local v9    # "nodeBytes":Ljava/nio/ByteBuffer;
    .restart local v10    # "signedData":Ljava/nio/ByteBuffer;
    .restart local v14    # "signedSigAlgorithm":I
    .restart local v15    # "signature":[B
    .restart local v16    # "flags":I
    .restart local v17    # "sigAlgorithmId":I
    .restart local v18    # "sigAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    :cond_6
    move-object/from16 v22, v4

    move/from16 v20, v14

    move-object/from16 v21, v15

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .end local v14    # "signedSigAlgorithm":I
    .end local v15    # "signature":[B
    .restart local v20    # "signedSigAlgorithm":I
    .restart local v21    # "signature":[B
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    new-instance v4, Ljava/lang/SecurityException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Encountered duplicate entries in SigningCertificateLineage at certificate #"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".  All signing certificates should be unique"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v4, v11}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    .end local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;>;"
    .end local v3    # "nodeCount":I
    .end local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local v6    # "lastSigAlgorithmId":I
    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .end local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    throw v4

    .line 151
    .end local v7    # "encodedCert":[B
    .end local v8    # "certHistorySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/security/cert/X509Certificate;>;"
    .end local v9    # "nodeBytes":Ljava/nio/ByteBuffer;
    .end local v10    # "signedData":Ljava/nio/ByteBuffer;
    .end local v16    # "flags":I
    .end local v17    # "sigAlgorithmId":I
    .end local v18    # "sigAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v19    # "version":I
    .end local v21    # "signature":[B
    .restart local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;>;"
    .restart local v3    # "nodeCount":I
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v6    # "lastSigAlgorithmId":I
    .local v20, "lastCert":Ljava/security/cert/X509Certificate;
    .restart local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    :catch_15
    move-exception v0

    move-object/from16 v22, v4

    move-object v4, v0

    move-object/from16 v5, v20

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    goto/16 :goto_a

    .line 146
    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_16
    move-exception v0

    move-object/from16 v22, v4

    move-object v4, v0

    move-object/from16 v5, v20

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    goto/16 :goto_b

    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_17
    move-exception v0

    move-object/from16 v22, v4

    move-object v4, v0

    move-object/from16 v5, v20

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    goto/16 :goto_b

    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_18
    move-exception v0

    move-object/from16 v22, v4

    move-object v4, v0

    move-object/from16 v5, v20

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    goto/16 :goto_b

    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_19
    move-exception v0

    move-object/from16 v22, v4

    move-object v4, v0

    move-object/from16 v5, v20

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    goto/16 :goto_b

    .line 144
    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_1a
    move-exception v0

    move-object/from16 v22, v4

    move-object v1, v0

    move-object/from16 v5, v20

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    goto/16 :goto_c

    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_1b
    move-exception v0

    move-object/from16 v22, v4

    move-object v1, v0

    move-object/from16 v5, v20

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    goto/16 :goto_c

    .line 94
    .end local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .local v7, "version":I
    .restart local v8    # "certHistorySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/security/cert/X509Certificate;>;"
    :cond_7
    move-object/from16 v22, v4

    move-object/from16 v20, v5

    move/from16 v19, v7

    .line 154
    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .end local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local v7    # "version":I
    .end local v8    # "certHistorySet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/security/cert/X509Certificate;>;"
    .restart local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    nop

    .line 155
    return-object v2

    .line 151
    .end local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    :catch_1c
    move-exception v0

    move-object/from16 v22, v4

    move-object/from16 v20, v5

    move-object v4, v0

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .end local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    goto :goto_a

    .line 146
    .end local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    :catch_1d
    move-exception v0

    goto :goto_7

    :catch_1e
    move-exception v0

    goto :goto_7

    :catch_1f
    move-exception v0

    goto :goto_7

    :catch_20
    move-exception v0

    :goto_7
    move-object/from16 v22, v4

    move-object/from16 v20, v5

    move-object v4, v0

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .end local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    goto/16 :goto_b

    .line 144
    .end local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    :catch_21
    move-exception v0

    goto :goto_8

    :catch_22
    move-exception v0

    :goto_8
    move-object/from16 v22, v4

    move-object/from16 v20, v5

    move-object v1, v0

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .end local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    goto/16 :goto_c

    .line 90
    .end local v20    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v7    # "version":I
    :cond_8
    move-object/from16 v22, v4

    move/from16 v19, v7

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .end local v7    # "version":I
    .restart local v19    # "version":I
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v7, "Encoded SigningCertificateLineage has a version different than any of which we are aware"

    invoke-direct {v4, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;>;"
    .end local v3    # "nodeCount":I
    .end local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local v6    # "lastSigAlgorithmId":I
    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .end local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    throw v4
    :try_end_9
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_9 .. :try_end_9} :catch_29
    .catch Ljava/nio/BufferUnderflowException; {:try_start_9 .. :try_end_9} :catch_28
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_9 .. :try_end_9} :catch_27
    .catch Ljava/security/InvalidKeyException; {:try_start_9 .. :try_end_9} :catch_26
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_9 .. :try_end_9} :catch_25
    .catch Ljava/security/SignatureException; {:try_start_9 .. :try_end_9} :catch_24
    .catch Ljava/security/cert/CertificateException; {:try_start_9 .. :try_end_9} :catch_23

    .line 151
    .end local v19    # "version":I
    .restart local v2    # "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;>;"
    .restart local v3    # "nodeCount":I
    .restart local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .restart local v6    # "lastSigAlgorithmId":I
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local p0    # "inputBytes":Ljava/nio/ByteBuffer;
    :catch_23
    move-exception v0

    move-object v4, v0

    goto :goto_a

    .line 146
    :catch_24
    move-exception v0

    move-object v4, v0

    goto :goto_b

    :catch_25
    move-exception v0

    move-object v4, v0

    goto :goto_b

    :catch_26
    move-exception v0

    move-object v4, v0

    goto :goto_b

    :catch_27
    move-exception v0

    move-object v4, v0

    goto :goto_b

    .line 144
    :catch_28
    move-exception v0

    goto :goto_9

    :catch_29
    move-exception v0

    :goto_9
    move-object v1, v0

    goto :goto_c

    .line 151
    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_2a
    move-exception v0

    move-object/from16 v22, v4

    move-object v4, v0

    .line 152
    .local v4, "e":Ljava/security/cert/CertificateException;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    :goto_a
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

    invoke-direct {v7, v1, v4}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 146
    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .local v4, "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_2b
    move-exception v0

    move-object/from16 v22, v4

    move-object v4, v0

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    goto :goto_b

    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_2c
    move-exception v0

    move-object/from16 v22, v4

    move-object v4, v0

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    goto :goto_b

    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_2d
    move-exception v0

    move-object/from16 v22, v4

    move-object v4, v0

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    goto :goto_b

    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_2e
    move-exception v0

    move-object/from16 v22, v4

    move-object v4, v0

    .line 148
    .local v4, "e":Ljava/security/GeneralSecurityException;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    :goto_b
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

    invoke-direct {v7, v1, v4}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 144
    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .local v4, "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_2f
    move-exception v0

    move-object/from16 v22, v4

    move-object v1, v0

    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    goto :goto_c

    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    .restart local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_30
    move-exception v0

    move-object/from16 v22, v4

    move-object v1, v0

    .line 145
    .end local v4    # "certFactory":Ljava/security/cert/CertificateFactory;
    .local v1, "e":Ljava/lang/Exception;
    .restart local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    :goto_c
    new-instance v4, Ljava/io/IOException;

    const-string v7, "Failed to parse SourceStampCertificateLineage object"

    invoke-direct {v4, v7, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 69
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v5    # "lastCert":Ljava/security/cert/X509Certificate;
    .end local v6    # "lastSigAlgorithmId":I
    .end local v22    # "certFactory":Ljava/security/cert/CertificateFactory;
    :catch_31
    move-exception v0

    move-object v1, v0

    .line 70
    .local v1, "e":Ljava/security/cert/CertificateException;
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "Failed to obtain X.509 CertificateFactory"

    invoke-direct {v4, v5, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 61
    .end local v1    # "e":Ljava/security/cert/CertificateException;
    :cond_9
    :goto_d
    const/4 v1, 0x0

    return-object v1
.end method
