.class public abstract Lcom/android/apksig/internal/apk/stamp/V1SourceStampVerifier;
.super Ljava/lang/Object;
.source "V1SourceStampVerifier.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getApkDigests(Ljava/util/Map;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apkContentDigests"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;)",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/util/Pair<",
            "Ljava/lang/Integer;",
            "[B>;>;"
        }
    .end annotation

    .line 131
    .local p0, "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 133
    .local v0, "digests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 134
    .local v2, "apkContentDigest":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    invoke-virtual {v3}, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    invoke-static {v3, v4}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    .end local v2    # "apkContentDigest":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    goto :goto_0

    .line 136
    :cond_0
    new-instance v1, Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v1}, Ljava/util/Comparator;->comparing(Ljava/util/function/Function;)Ljava/util/Comparator;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 137
    return-object v0
.end method

.method public static verify(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;[BLjava/util/Map;II)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .locals 8
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "zipSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .param p2, "sourceStampCertificateDigest"    # [B
    .param p4, "minSdkVersion"    # I
    .param p5, "maxSdkVersion"    # I
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
            "apk",
            "zipSections",
            "sourceStampCertificateDigest",
            "apkContentDigests",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/apk/ApkUtils$ZipSections;",
            "[B",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;II)",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;,
            Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException;
        }
    .end annotation

    .line 73
    .local p3, "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    new-instance v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;-><init>(I)V

    .line 75
    .local v0, "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    nop

    .line 76
    const v1, 0x2b09189e

    invoke-static {p0, p1, v1, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Lcom/android/apksig/internal/apk/SignatureInfo;

    move-result-object v1

    .line 79
    .local v1, "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    iget-object v2, v1, Lcom/android/apksig/internal/apk/SignatureInfo;->signatureBlock:Ljava/nio/ByteBuffer;

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    move-object v7, v0

    invoke-static/range {v2 .. v7}, Lcom/android/apksig/internal/apk/stamp/V1SourceStampVerifier;->verify(Ljava/nio/ByteBuffer;[BLjava/util/Map;IILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V

    .line 86
    return-object v0
.end method

.method private static verify(Ljava/nio/ByteBuffer;[BLjava/util/Map;IILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V
    .locals 9
    .param p0, "sourceStampBlock"    # Ljava/nio/ByteBuffer;
    .param p1, "sourceStampCertificateDigest"    # [B
    .param p3, "minSdkVersion"    # I
    .param p4, "maxSdkVersion"    # I
    .param p5, "result"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
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
            "sourceStampBlock",
            "sourceStampCertificateDigest",
            "apkContentDigests",
            "minSdkVersion",
            "maxSdkVersion",
            "result"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            "[B",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;II",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 103
    .local p2, "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    new-instance v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    invoke-direct {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;-><init>()V

    .line 105
    .local v0, "signerInfo":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    iget-object v1, p5, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    const/4 v8, 0x0

    :try_start_0
    const-string v1, "X.509"

    invoke-static {v1}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v2

    .line 108
    .local v2, "certFactory":Ljava/security/cert/CertificateFactory;
    nop

    .line 109
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 110
    .local v1, "sourceStampBlockData":Ljava/nio/ByteBuffer;
    nop

    .line 112
    invoke-static {p2}, Lcom/android/apksig/internal/apk/stamp/V1SourceStampVerifier;->getApkDigests(Ljava/util/Map;)Ljava/util/List;

    move-result-object v3

    .line 111
    invoke-static {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedPairsOfIntAndLengthPrefixedBytes(Ljava/util/List;)[B

    move-result-object v4

    .line 113
    .local v4, "digestBytes":[B
    move-object v3, v0

    move-object v5, p1

    move v6, p3

    move v7, p4

    invoke-static/range {v1 .. v7}, Lcom/android/apksig/internal/apk/stamp/SourceStampVerifier;->verifyV1SourceStamp(Ljava/nio/ByteBuffer;Ljava/security/cert/CertificateFactory;Lcom/android/apksig/internal/apk/ApkSignerInfo;[B[BII)V

    .line 121
    invoke-virtual {p5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->containsErrors()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {p5}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->containsWarnings()Z

    move-result v3

    if-nez v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    move v3, v8

    :goto_0
    iput-boolean v3, p5, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->verified:Z
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    .line 126
    .end local v1    # "sourceStampBlockData":Ljava/nio/ByteBuffer;
    .end local v2    # "certFactory":Ljava/security/cert/CertificateFactory;
    .end local v4    # "digestBytes":[B
    goto :goto_2

    .line 124
    :catch_0
    move-exception v1

    goto :goto_1

    :catch_1
    move-exception v1

    .line 125
    .local v1, "e":Ljava/lang/Exception;
    :goto_1
    sget-object v2, Lcom/android/apksig/ApkVerifier$Issue;->SOURCE_STAMP_MALFORMED_SIGNATURE:Lcom/android/apksig/ApkVerifier$Issue;

    new-array v3, v8, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->addWarning(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    .line 127
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_2
    return-void

    .line 122
    :catch_2
    move-exception v1

    .line 123
    .local v1, "e":Ljava/security/cert/CertificateException;
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Failed to obtain X.509 CertificateFactory"

    invoke-direct {v2, v3, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
