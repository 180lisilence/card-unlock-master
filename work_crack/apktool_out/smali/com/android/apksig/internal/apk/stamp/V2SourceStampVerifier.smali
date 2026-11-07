.class public abstract Lcom/android/apksig/internal/apk/stamp/V2SourceStampVerifier;
.super Ljava/lang/Object;
.source "V2SourceStampVerifier.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 56
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

    .line 146
    .local p0, "apkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 148
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

    .line 149
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

    .line 150
    .end local v2    # "apkContentDigest":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    goto :goto_0

    .line 151
    :cond_0
    new-instance v1, Lcom/android/apksig/internal/apk/stamp/V2SourceStampVerifier$1;

    invoke-direct {v1}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampVerifier$1;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 157
    return-object v0
.end method

.method private static getSignatureSchemeDigests(Ljava/util/Map;)Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signatureSchemeApkContentDigests"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;>;)",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[B>;"
        }
    .end annotation

    .line 132
    .local p0, "signatureSchemeApkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 134
    .local v0, "digests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[B>;"
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

    .line 135
    .local v2, "signatureSchemeApkContentDigest":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    nop

    .line 136
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-static {v3}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampVerifier;->getApkDigests(Ljava/util/Map;)Ljava/util/List;

    move-result-object v3

    .line 137
    .local v3, "apkDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    nop

    .line 138
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 139
    invoke-static {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->encodeAsSequenceOfLengthPrefixedPairsOfIntAndLengthPrefixedBytes(Ljava/util/List;)[B

    move-result-object v5

    .line 137
    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .end local v2    # "signatureSchemeApkContentDigest":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    .end local v3    # "apkDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    goto :goto_0

    .line 141
    :cond_0
    return-object v0
.end method

.method public static verify(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/zip/ZipSections;[BLjava/util/Map;II)Lcom/android/apksig/internal/apk/ApkSigResult;
    .locals 8
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "zipSections"    # Lcom/android/apksig/zip/ZipSections;
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
            "signatureSchemeApkContentDigests",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/zip/ZipSections;",
            "[B",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;>;II)",
            "Lcom/android/apksig/internal/apk/ApkSigResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;,
            Lcom/android/apksig/internal/apk/SignatureNotFoundException;
        }
    .end annotation

    .line 78
    .local p3, "signatureSchemeApkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    new-instance v0, Lcom/android/apksig/internal/apk/ApkSigResult;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/apksig/internal/apk/ApkSigResult;-><init>(I)V

    .line 80
    .local v0, "result":Lcom/android/apksig/internal/apk/ApkSigResult;
    nop

    .line 81
    const v1, 0x6dff800d

    invoke-static {p0, p1, v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/zip/ZipSections;I)Lcom/android/apksig/internal/apk/SignatureInfo;

    move-result-object v1

    .line 84
    .local v1, "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    iget-object v2, v1, Lcom/android/apksig/internal/apk/SignatureInfo;->signatureBlock:Ljava/nio/ByteBuffer;

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move v6, p5

    move-object v7, v0

    invoke-static/range {v2 .. v7}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampVerifier;->verify(Ljava/nio/ByteBuffer;[BLjava/util/Map;IILcom/android/apksig/internal/apk/ApkSigResult;)V

    .line 91
    return-object v0
.end method

.method private static verify(Ljava/nio/ByteBuffer;[BLjava/util/Map;IILcom/android/apksig/internal/apk/ApkSigResult;)V
    .locals 9
    .param p0, "sourceStampBlock"    # Ljava/nio/ByteBuffer;
    .param p1, "sourceStampCertificateDigest"    # [B
    .param p3, "minSdkVersion"    # I
    .param p4, "maxSdkVersion"    # I
    .param p5, "result"    # Lcom/android/apksig/internal/apk/ApkSigResult;
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
            "signatureSchemeApkContentDigests",
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
            "Ljava/lang/Integer;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;>;II",
            "Lcom/android/apksig/internal/apk/ApkSigResult;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 108
    .local p2, "signatureSchemeApkContentDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    new-instance v0, Lcom/android/apksig/internal/apk/ApkSignerInfo;

    invoke-direct {v0}, Lcom/android/apksig/internal/apk/ApkSignerInfo;-><init>()V

    .line 109
    .local v0, "signerInfo":Lcom/android/apksig/internal/apk/ApkSignerInfo;
    iget-object v1, p5, Lcom/android/apksig/internal/apk/ApkSigResult;->mSigners:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    const/4 v8, 0x0

    :try_start_0
    const-string v1, "X.509"

    invoke-static {v1}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v2

    .line 112
    .local v2, "certFactory":Ljava/security/cert/CertificateFactory;
    nop

    .line 113
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 114
    .local v1, "sourceStampBlockData":Ljava/nio/ByteBuffer;
    nop

    .line 118
    invoke-static {p2}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampVerifier;->getSignatureSchemeDigests(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    .line 114
    move-object v3, v0

    move-object v5, p1

    move v6, p3

    move v7, p4

    invoke-static/range {v1 .. v7}, Lcom/android/apksig/internal/apk/stamp/SourceStampVerifier;->verifyV2SourceStamp(Ljava/nio/ByteBuffer;Ljava/security/cert/CertificateFactory;Lcom/android/apksig/internal/apk/ApkSignerInfo;Ljava/util/Map;[BII)V

    .line 122
    invoke-virtual {p5}, Lcom/android/apksig/internal/apk/ApkSigResult;->containsErrors()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {p5}, Lcom/android/apksig/internal/apk/ApkSigResult;->containsWarnings()Z

    move-result v3

    if-nez v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    move v3, v8

    :goto_0
    iput-boolean v3, p5, Lcom/android/apksig/internal/apk/ApkSigResult;->verified:Z
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .end local v1    # "sourceStampBlockData":Ljava/nio/ByteBuffer;
    .end local v2    # "certFactory":Ljava/security/cert/CertificateFactory;
    goto :goto_2

    .line 125
    :catch_0
    move-exception v1

    goto :goto_1

    :catch_1
    move-exception v1

    .line 126
    .local v1, "e":Ljava/lang/Exception;
    :goto_1
    const/16 v2, 0x14

    new-array v3, v8, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->addWarning(I[Ljava/lang/Object;)V

    .line 128
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_2
    return-void

    .line 123
    :catch_2
    move-exception v1

    .line 124
    .local v1, "e":Ljava/security/cert/CertificateException;
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Failed to obtain X.509 CertificateFactory"

    invoke-direct {v2, v3, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
