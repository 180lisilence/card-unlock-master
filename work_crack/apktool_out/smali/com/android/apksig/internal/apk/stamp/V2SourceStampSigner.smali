.class public Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;
.super Ljava/lang/Object;
.source "V2SourceStampSigner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;,
        Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$SourceStampBlock;
    }
.end annotation


# static fields
.field public static final V2_SOURCE_STAMP_BLOCK_ID:I = 0x6dff800d


# instance fields
.field private final mSignatureSchemeDigestInfos:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;>;"
        }
    .end annotation
.end field

.field private final mSourceStampSignerConfig:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

.field private final mSourceStampTimestampEnabled:Z


# direct methods
.method private constructor <init>(Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;)V
    .locals 1
    .param p1, "builder"    # Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "builder"
        }
    .end annotation

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    invoke-static {p1}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;->access$000(Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->mSourceStampSignerConfig:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    .line 69
    invoke-static {p1}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;->access$100(Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->mSignatureSchemeDigestInfos:Ljava/util/Map;

    .line 70
    invoke-static {p1}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;->access$200(Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->mSourceStampTimestampEnabled:Z

    .line 71
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;
    .param p2, "x1"    # Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$1;

    .line 58
    invoke-direct {p0, p1}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;-><init>(Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;)V

    return-void
.end method

.method private static encodeStampAttributes(Ljava/util/Map;)[B
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stampAttributes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[B>;)[B"
        }
    .end annotation

    .line 195
    .local p0, "stampAttributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;[B>;"
    const/4 v0, 0x0

    .line 196
    .local v0, "payloadSize":I
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    .line 198
    .local v2, "attributeValue":[B
    array-length v3, v2

    add-int/lit8 v3, v3, 0x8

    add-int/2addr v0, v3

    .line 199
    .end local v2    # "attributeValue":[B
    goto :goto_0

    .line 205
    :cond_0
    add-int/lit8 v1, v0, 0x4

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 206
    .local v1, "result":Ljava/nio/ByteBuffer;
    sget-object v2, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 207
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 208
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 210
    .local v3, "stampAttribute":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;[B>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    array-length v4, v4

    add-int/lit8 v4, v4, 0x4

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 211
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 212
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 213
    .end local v3    # "stampAttribute":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;[B>;"
    goto :goto_1

    .line 214
    :cond_1
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    return-object v2
.end method

.method public static generateSourceStampBlock(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;Ljava/util/Map;)Lcom/android/apksig/internal/util/Pair;
    .locals 1
    .param p0, "sourceStampSignerConfig"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "sourceStampSignerConfig",
            "signatureSchemeDigestInfos"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;>;)",
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

    .line 77
    .local p1, "signatureSchemeDigestInfos":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    new-instance v0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;

    invoke-direct {v0, p0, p1}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;-><init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;Ljava/util/Map;)V

    .line 78
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;->build()Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->generateSourceStampBlock()Lcom/android/apksig/internal/util/Pair;

    move-result-object v0

    .line 77
    return-object v0
.end method

.method private generateStampAttributes(Lcom/android/apksig/SigningCertificateLineage;)Ljava/util/Map;
    .locals 6
    .param p1, "lineage"    # Lcom/android/apksig/SigningCertificateLineage;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "lineage"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/SigningCertificateLineage;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "[B>;"
        }
    .end annotation

    .line 218
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 220
    .local v0, "stampAttributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;[B>;"
    iget-boolean v1, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->mSourceStampTimestampEnabled:Z

    if-eqz v1, :cond_1

    .line 222
    invoke-static {}, Ljava/time/Instant;->now()Ljava/time/Instant;

    move-result-object v1

    invoke-virtual {v1}, Ljava/time/Instant;->getEpochSecond()J

    move-result-wide v1

    .line 223
    .local v1, "timestamp":J
    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-lez v3, :cond_0

    .line 224
    const/16 v3, 0x8

    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 225
    .local v3, "attributeBuffer":Ljava/nio/ByteBuffer;
    sget-object v4, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 226
    invoke-virtual {v3, v1, v2}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 227
    const v4, -0x1bc3a6ba

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 228
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    .line 227
    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    .end local v3    # "attributeBuffer":Ljava/nio/ByteBuffer;
    goto :goto_0

    .line 233
    :cond_0
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Received an invalid value from Instant#getTimestamp: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 238
    .end local v1    # "timestamp":J
    :cond_1
    :goto_0
    if-eqz p1, :cond_2

    .line 239
    const v1, -0x629cfc09

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 240
    invoke-virtual {p1}, Lcom/android/apksig/SigningCertificateLineage;->encodeSigningCertificateLineage()[B

    move-result-object v2

    .line 239
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    :cond_2
    return-object v0
.end method

.method private static getSignedDigestsFor(ILjava/util/Map;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;Ljava/util/List;)V
    .locals 6
    .param p0, "signatureSchemeVersion"    # I
    .param p2, "mSourceStampSignerConfig"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "signatureSchemeVersion",
            "mSignatureSchemeDigestInfos",
            "mSourceStampSignerConfig",
            "signatureSchemeDigests"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;>;",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/util/Pair<",
            "Ljava/lang/Integer;",
            "[B>;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 156
    .local p1, "mSignatureSchemeDigestInfos":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    .local p3, "signatureSchemeDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 157
    return-void

    .line 160
    :cond_0
    nop

    .line 161
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 162
    .local v0, "digestInfo":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 163
    .local v1, "digests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 164
    .local v3, "digest":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    invoke-virtual {v4}, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->getId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    invoke-static {v4, v5}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    .end local v3    # "digest":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    goto :goto_0

    .line 166
    :cond_1
    new-instance v2, Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v2}, Ljava/util/Comparator;->comparing(Ljava/util/function/Function;)Ljava/util/Comparator;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 172
    nop

    .line 173
    invoke-static {v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedPairsOfIntAndLengthPrefixedBytes(Ljava/util/List;)[B

    move-result-object v2

    .line 179
    .local v2, "digestBytes":[B
    nop

    .line 180
    invoke-static {p2, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->generateSignaturesOverData(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;[B)Ljava/util/List;

    move-result-object v3

    .line 187
    .local v3, "signedDigest":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    nop

    .line 189
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 190
    invoke-static {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedPairsOfIntAndLengthPrefixedBytes(Ljava/util/List;)[B

    move-result-object v5

    .line 188
    invoke-static {v4, v5}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v4

    .line 187
    invoke-interface {p3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    return-void
.end method


# virtual methods
.method public generateSourceStampBlock()Lcom/android/apksig/internal/util/Pair;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
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

    .line 83
    iget-object v0, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->mSourceStampSignerConfig:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    iget-object v0, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .local v0, "signatureSchemeDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    iget-object v1, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->mSignatureSchemeDigestInfos:Ljava/util/Map;

    iget-object v2, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->mSourceStampSignerConfig:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    const/4 v3, 0x3

    invoke-static {v3, v1, v2, v0}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->getSignedDigestsFor(ILjava/util/Map;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;Ljava/util/List;)V

    .line 94
    iget-object v1, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->mSignatureSchemeDigestInfos:Ljava/util/Map;

    iget-object v2, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->mSourceStampSignerConfig:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    const/4 v4, 0x2

    invoke-static {v4, v1, v2, v0}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->getSignedDigestsFor(ILjava/util/Map;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;Ljava/util/List;)V

    .line 99
    iget-object v1, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->mSignatureSchemeDigestInfos:Ljava/util/Map;

    iget-object v2, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->mSourceStampSignerConfig:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    const/4 v5, 0x1

    invoke-static {v5, v1, v2, v0}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->getSignedDigestsFor(ILjava/util/Map;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;Ljava/util/List;)V

    .line 104
    new-instance v1, Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/android/apksig/internal/apk/stamp/V1SourceStampSigner$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v1}, Ljava/util/Comparator;->comparing(Ljava/util/function/Function;)Ljava/util/Comparator;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 106
    new-instance v1, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$SourceStampBlock;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$SourceStampBlock;-><init>(Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$1;)V

    .line 109
    .local v1, "sourceStampBlock":Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$SourceStampBlock;
    :try_start_0
    iget-object v2, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->mSourceStampSignerConfig:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    iget-object v2, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    .line 110
    const/4 v6, 0x0

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/security/cert/X509Certificate;

    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v2

    iput-object v2, v1, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$SourceStampBlock;->stampCertificate:[B
    :try_end_0
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    nop

    .line 116
    iput-object v0, v1, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$SourceStampBlock;->signedDigests:Ljava/util/List;

    .line 118
    iget-object v2, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->mSourceStampSignerConfig:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    iget-object v2, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    .line 119
    invoke-direct {p0, v2}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->generateStampAttributes(Lcom/android/apksig/SigningCertificateLineage;)Ljava/util/Map;

    move-result-object v2

    .line 118
    invoke-static {v2}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->encodeStampAttributes(Ljava/util/Map;)[B

    move-result-object v2

    iput-object v2, v1, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$SourceStampBlock;->stampAttributes:[B

    .line 120
    iget-object v2, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->mSourceStampSignerConfig:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    iget-object v7, v1, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$SourceStampBlock;->stampAttributes:[B

    .line 121
    invoke-static {v2, v7}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->generateSignaturesOverData(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;[B)Ljava/util/List;

    move-result-object v2

    iput-object v2, v1, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$SourceStampBlock;->signedStampAttributes:Ljava/util/List;

    .line 133
    const/4 v2, 0x4

    new-array v2, v2, [[B

    iget-object v7, v1, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$SourceStampBlock;->stampCertificate:[B

    aput-object v7, v2, v6

    iget-object v6, v1, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$SourceStampBlock;->signedDigests:Ljava/util/List;

    .line 137
    invoke-static {v6}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedPairsOfIntAndLengthPrefixedBytes(Ljava/util/List;)[B

    move-result-object v6

    aput-object v6, v2, v5

    iget-object v5, v1, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$SourceStampBlock;->stampAttributes:[B

    aput-object v5, v2, v4

    iget-object v4, v1, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$SourceStampBlock;->signedStampAttributes:Ljava/util/List;

    .line 140
    invoke-static {v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedPairsOfIntAndLengthPrefixedBytes(Ljava/util/List;)[B

    move-result-object v4

    aput-object v4, v2, v3

    .line 134
    invoke-static {v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsSequenceOfLengthPrefixedElements([[B)[B

    move-result-object v2

    .line 146
    .local v2, "sourceStampSignerBlock":[B
    invoke-static {v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->encodeAsLengthPrefixedElement([B)[B

    move-result-object v3

    .line 147
    const v4, 0x6dff800d

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 146
    invoke-static {v3, v4}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v3

    return-object v3

    .line 111
    .end local v2    # "sourceStampSignerBlock":[B
    :catch_0
    move-exception v2

    .line 112
    .local v2, "e":Ljava/security/cert/CertificateEncodingException;
    new-instance v3, Ljava/security/SignatureException;

    const-string v4, "Retrieving the encoded form of the stamp certificate failed"

    invoke-direct {v3, v4, v2}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 84
    .end local v0    # "signatureSchemeDigests":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    .end local v1    # "sourceStampBlock":Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$SourceStampBlock;
    .end local v2    # "e":Ljava/security/cert/CertificateEncodingException;
    :cond_0
    new-instance v0, Ljava/security/SignatureException;

    const-string v1, "No certificates configured for signer"

    invoke-direct {v0, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
