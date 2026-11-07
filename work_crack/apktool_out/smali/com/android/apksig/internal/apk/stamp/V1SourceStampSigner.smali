.class public abstract Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner;
.super Ljava/lang/Object;
.source "V1SourceStampSigner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$SourceStampBlock;
    }
.end annotation


# static fields
.field public static final V1_SOURCE_STAMP_BLOCK_ID:I = 0x2b09189e


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static generateSourceStampBlock(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;Ljava/util/Map;)Lcom/android/apksig/internal/util/Pair;
    .locals 6
    .param p0, "sourceStampSignerConfig"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "sourceStampSignerConfig",
            "digestInfo"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
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
            Ljava/security/SignatureException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 60
    .local p1, "digestInfo":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 64
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .local v0, "digests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

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

    .line 66
    .local v2, "digest":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
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

    .line 67
    .end local v2    # "digest":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    goto :goto_0

    .line 68
    :cond_0
    new-instance v1, Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v1}, Ljava/util/Comparator;->comparing(Ljava/util/function/Function;)Ljava/util/Comparator;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 70
    new-instance v1, Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$SourceStampBlock;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$SourceStampBlock;-><init>(Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$1;)V

    .line 73
    .local v1, "sourceStampBlock":Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$SourceStampBlock;
    :try_start_0
    iget-object v2, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    .line 74
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/security/cert/X509Certificate;

    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v2

    iput-object v2, v1, Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$SourceStampBlock;->stampCertificate:[B
    :try_end_0
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    nop

    .line 80
    nop

    .line 81
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedPairsOfIntAndLengthPrefixedBytes(Ljava/util/List;)[B

    move-result-object v2

    .line 82
    .local v2, "digestBytes":[B
    nop

    .line 83
    invoke-static {p0, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->generateSignaturesOverData(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;[B)Ljava/util/List;

    move-result-object v4

    iput-object v4, v1, Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$SourceStampBlock;->signedDigests:Ljava/util/List;

    .line 91
    const/4 v4, 0x2

    new-array v4, v4, [[B

    iget-object v5, v1, Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$SourceStampBlock;->stampCertificate:[B

    aput-object v5, v4, v3

    iget-object v3, v1, Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$SourceStampBlock;->signedDigests:Ljava/util/List;

    .line 95
    invoke-static {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedPairsOfIntAndLengthPrefixedBytes(Ljava/util/List;)[B

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v4, v5

    .line 92
    invoke-static {v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedElements([[B)[B

    move-result-object v3

    .line 101
    .local v3, "sourceStampSignerBlock":[B
    invoke-static {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsLengthPrefixedElement([B)[B

    move-result-object v4

    .line 102
    const v5, 0x2b09189e

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 101
    invoke-static {v4, v5}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v4

    return-object v4

    .line 75
    .end local v2    # "digestBytes":[B
    .end local v3    # "sourceStampSignerBlock":[B
    :catch_0
    move-exception v2

    .line 76
    .local v2, "e":Ljava/security/cert/CertificateEncodingException;
    new-instance v3, Ljava/security/SignatureException;

    const-string v4, "Retrieving the encoded form of the stamp certificate failed"

    invoke-direct {v3, v4, v2}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 61
    .end local v0    # "digests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    .end local v1    # "sourceStampBlock":Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$SourceStampBlock;
    .end local v2    # "e":Ljava/security/cert/CertificateEncodingException;
    :cond_1
    new-instance v0, Ljava/security/SignatureException;

    const-string v1, "No certificates configured for signer"

    invoke-direct {v0, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
