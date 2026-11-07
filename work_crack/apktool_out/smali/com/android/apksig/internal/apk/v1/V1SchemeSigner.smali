.class public abstract Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;
.super Ljava/lang/Object;
.source "V1SchemeSigner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;,
        Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;
    }
.end annotation


# static fields
.field private static final ATTRIBUTE_NAME_CREATED_BY:Ljava/util/jar/Attributes$Name;

.field private static final ATTRIBUTE_VALUE_MANIFEST_VERSION:Ljava/lang/String; = "1.0"

.field private static final ATTRIBUTE_VALUE_SIGNATURE_VERSION:Ljava/lang/String; = "1.0"

.field public static final MANIFEST_ENTRY_NAME:Ljava/lang/String; = "META-INF/MANIFEST.MF"

.field private static final SF_ATTRIBUTE_NAME_ANDROID_APK_SIGNED_NAME:Ljava/util/jar/Attributes$Name;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 65
    new-instance v0, Ljava/util/jar/Attributes$Name;

    const-string v1, "Created-By"

    invoke-direct {v0, v1}, Ljava/util/jar/Attributes$Name;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->ATTRIBUTE_NAME_CREATED_BY:Ljava/util/jar/Attributes$Name;

    .line 70
    new-instance v0, Ljava/util/jar/Attributes$Name;

    const-string v1, "X-Android-APK-Signed"

    invoke-direct {v0, v1}, Ljava/util/jar/Attributes$Name;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->SF_ATTRIBUTE_NAME_ANDROID_APK_SIGNED_NAME:Ljava/util/jar/Attributes$Name;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static checkEntryNameValid(Ljava/lang/String;)V
    .locals 5
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 401
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-char v3, v0, v2

    .line 402
    .local v3, "c":C
    const/16 v4, 0xd

    if-eq v3, v4, :cond_0

    const/16 v4, 0xa

    if-eq v3, v4, :cond_0

    if-eqz v3, :cond_0

    .line 401
    .end local v3    # "c":C
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 403
    .restart local v3    # "c":C
    :cond_0
    new-instance v0, Lcom/android/apksig/apk/ApkFormatException;

    .line 406
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1, p0}, [Ljava/lang/Object;

    move-result-object v1

    .line 404
    const-string v2, "Unsupported character 0x%1$02x in ZIP entry name \"%2$s\""

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 410
    .end local v3    # "c":C
    :cond_1
    return-void
.end method

.method public static generateManifestFile(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;Ljava/util/Map;[B)Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;
    .locals 13
    .param p0, "jarEntryDigestAlgorithm"    # Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;
    .param p2, "sourceManifestBytes"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "jarEntryDigestAlgorithm",
            "jarEntryDigests",
            "sourceManifestBytes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;[B)",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 340
    .local p1, "jarEntryDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;[B>;"
    const-string v0, "Failed to write in-memory MANIFEST.MF"

    const/4 v1, 0x0

    .line 341
    .local v1, "sourceManifest":Ljava/util/jar/Manifest;
    if-eqz p2, :cond_0

    .line 343
    :try_start_0
    new-instance v2, Ljava/util/jar/Manifest;

    new-instance v3, Ljava/io/ByteArrayInputStream;

    invoke-direct {v3, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v2, v3}, Ljava/util/jar/Manifest;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v2

    .line 346
    goto :goto_0

    .line 344
    :catch_0
    move-exception v0

    .line 345
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lcom/android/apksig/apk/ApkFormatException;

    const-string v3, "Malformed source META-INF/MANIFEST.MF"

    invoke-direct {v2, v3, v0}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 348
    .end local v0    # "e":Ljava/io/IOException;
    :cond_0
    :goto_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 349
    .local v2, "manifestOut":Ljava/io/ByteArrayOutputStream;
    new-instance v3, Ljava/util/jar/Attributes;

    invoke-direct {v3}, Ljava/util/jar/Attributes;-><init>()V

    .line 354
    .local v3, "mainAttrs":Ljava/util/jar/Attributes;
    if-eqz v1, :cond_1

    .line 355
    invoke-virtual {v1}, Ljava/util/jar/Manifest;->getMainAttributes()Ljava/util/jar/Attributes;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/jar/Attributes;->putAll(Ljava/util/Map;)V

    goto :goto_1

    .line 357
    :cond_1
    sget-object v4, Ljava/util/jar/Attributes$Name;->MANIFEST_VERSION:Ljava/util/jar/Attributes$Name;

    const-string v5, "1.0"

    invoke-virtual {v3, v4, v5}, Ljava/util/jar/Attributes;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    :goto_1
    :try_start_1
    invoke-static {v2, v3}, Lcom/android/apksig/internal/jar/ManifestWriter;->writeMainSection(Ljava/io/OutputStream;Ljava/util/jar/Attributes;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 364
    nop

    .line 366
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 367
    .local v4, "sortedEntryNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {v4}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 368
    new-instance v5, Ljava/util/TreeMap;

    invoke-direct {v5}, Ljava/util/TreeMap;-><init>()V

    .line 369
    .local v5, "invidualSectionsContents":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/String;[B>;"
    invoke-static {p0}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->getEntryDigestAttributeName(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;)Ljava/lang/String;

    move-result-object v6

    .line 370
    .local v6, "entryDigestAttributeName":Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 371
    .local v8, "entryName":Ljava/lang/String;
    invoke-static {v8}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->checkEntryNameValid(Ljava/lang/String;)V

    .line 372
    invoke-interface {p1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [B

    .line 373
    .local v9, "entryDigest":[B
    new-instance v10, Ljava/util/jar/Attributes;

    invoke-direct {v10}, Ljava/util/jar/Attributes;-><init>()V

    .line 374
    .local v10, "entryAttrs":Ljava/util/jar/Attributes;
    nop

    .line 376
    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object v11

    .line 374
    invoke-virtual {v10, v6, v11}, Ljava/util/jar/Attributes;->putValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 377
    new-instance v11, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v11}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 380
    .local v11, "sectionOut":Ljava/io/ByteArrayOutputStream;
    :try_start_2
    invoke-static {v11, v8, v10}, Lcom/android/apksig/internal/jar/ManifestWriter;->writeIndividualSection(Ljava/io/OutputStream;Ljava/lang/String;Ljava/util/jar/Attributes;)V

    .line 381
    invoke-virtual {v11}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v12

    .line 382
    .local v12, "sectionBytes":[B
    invoke-virtual {v2, v12}, Ljava/io/ByteArrayOutputStream;->write([B)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 385
    nop

    .line 386
    invoke-interface {v5, v8, v12}, Ljava/util/SortedMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 387
    .end local v8    # "entryName":Ljava/lang/String;
    .end local v9    # "entryDigest":[B
    .end local v10    # "entryAttrs":Ljava/util/jar/Attributes;
    .end local v11    # "sectionOut":Ljava/io/ByteArrayOutputStream;
    .end local v12    # "sectionBytes":[B
    goto :goto_2

    .line 383
    .restart local v8    # "entryName":Ljava/lang/String;
    .restart local v9    # "entryDigest":[B
    .restart local v10    # "entryAttrs":Ljava/util/jar/Attributes;
    .restart local v11    # "sectionOut":Ljava/io/ByteArrayOutputStream;
    :catch_1
    move-exception v7

    .line 384
    .local v7, "e":Ljava/io/IOException;
    new-instance v12, Ljava/lang/RuntimeException;

    invoke-direct {v12, v0, v7}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v12

    .line 389
    .end local v7    # "e":Ljava/io/IOException;
    .end local v8    # "entryName":Ljava/lang/String;
    .end local v9    # "entryDigest":[B
    .end local v10    # "entryAttrs":Ljava/util/jar/Attributes;
    .end local v11    # "sectionOut":Ljava/io/ByteArrayOutputStream;
    :cond_2
    new-instance v0, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;

    invoke-direct {v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;-><init>()V

    .line 390
    .local v0, "result":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    iput-object v7, v0, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;->contents:[B

    .line 391
    iput-object v3, v0, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;->mainSectionAttributes:Ljava/util/jar/Attributes;

    .line 392
    iput-object v5, v0, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;->individualSectionsContents:Ljava/util/SortedMap;

    .line 393
    return-object v0

    .line 362
    .end local v0    # "result":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;
    .end local v4    # "sortedEntryNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "invidualSectionsContents":Ljava/util/SortedMap;, "Ljava/util/SortedMap<Ljava/lang/String;[B>;"
    .end local v6    # "entryDigestAttributeName":Ljava/lang/String;
    :catch_2
    move-exception v4

    .line 363
    .local v4, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v0, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method private static generateSignatureBlock(Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;[B)[B
    .locals 12
    .param p0, "signerConfig"    # Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;
    .param p1, "signatureFileBytes"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "signerConfig",
            "signatureFileBytes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/cert/CertificateException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 499
    const-string v0, " signature using public key from certificate"

    const-string v1, "Failed to verify generated "

    const-string v2, "Failed to sign using "

    iget-object v3, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;->certificates:Ljava/util/List;

    .line 500
    .local v3, "signerCerts":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/security/cert/X509Certificate;

    .line 501
    .local v4, "signingCert":Ljava/security/cert/X509Certificate;
    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v5

    .line 502
    .local v5, "publicKey":Ljava/security/PublicKey;
    iget-object v6, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;->signatureDigestAlgorithm:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    .line 503
    .local v6, "digestAlgorithm":Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;
    iget-boolean v7, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;->deterministicDsaSigning:Z

    .line 504
    invoke-static {v5, v6, v7}, Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;->getSignerInfoSignatureAlgorithm(Ljava/security/PublicKey;Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;Z)Lcom/android/apksig/internal/util/Pair;

    move-result-object v7

    .line 506
    .local v7, "signatureAlgs":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;>;"
    invoke-virtual {v7}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 511
    .local v8, "jcaSignatureAlgorithm":Ljava/lang/String;
    :try_start_0
    invoke-static {v8}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v9

    .line 512
    .local v9, "signature":Ljava/security/Signature;
    iget-object v10, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;->privateKey:Ljava/security/PrivateKey;

    invoke-virtual {v9, v10}, Ljava/security/Signature;->initSign(Ljava/security/PrivateKey;)V

    .line 513
    invoke-virtual {v9, p1}, Ljava/security/Signature;->update([B)V

    .line 514
    invoke-virtual {v9}, Ljava/security/Signature;->sign()[B

    move-result-object v2
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/security/SignatureException; {:try_start_0 .. :try_end_0} :catch_4

    .line 519
    .end local v9    # "signature":Ljava/security/Signature;
    .local v2, "signatureBytes":[B
    nop

    .line 523
    :try_start_1
    invoke-static {v8}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v9

    .line 524
    .restart local v9    # "signature":Ljava/security/Signature;
    invoke-virtual {v9, v5}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    .line 525
    invoke-virtual {v9, p1}, Ljava/security/Signature;->update([B)V

    .line 526
    invoke-virtual {v9, v2}, Ljava/security/Signature;->verify([B)Z

    move-result v10
    :try_end_1
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/security/SignatureException; {:try_start_1 .. :try_end_1} :catch_2

    if-eqz v10, :cond_0

    .line 539
    .end local v9    # "signature":Ljava/security/Signature;
    nop

    .line 541
    nop

    .line 542
    invoke-static {v6}, Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;->getSignerInfoDigestAlgorithmOid(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;)Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;

    move-result-object v0

    .line 543
    .local v0, "digestAlgorithmId":Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;
    invoke-virtual {v7}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;

    .line 545
    .local v1, "signatureAlgorithmId":Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;
    const/4 v9, 0x0

    :try_start_2
    invoke-static {v2, v9, v3, v0, v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->generatePkcs7DerEncodedMessage([BLjava/nio/ByteBuffer;Ljava/util/List;Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;)[B

    move-result-object v9
    :try_end_2
    .catch Lcom/android/apksig/internal/asn1/Asn1EncodingException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_2 .. :try_end_2} :catch_0

    return-object v9

    .line 550
    :catch_0
    move-exception v9

    goto :goto_0

    :catch_1
    move-exception v9

    .line 551
    .local v9, "ex":Ljava/lang/Exception;
    :goto_0
    new-instance v10, Ljava/security/SignatureException;

    const-string v11, "Failed to encode signature block"

    invoke-direct {v10, v11}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 527
    .end local v0    # "digestAlgorithmId":Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;
    .end local v1    # "signatureAlgorithmId":Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;
    .local v9, "signature":Ljava/security/Signature;
    :cond_0
    :try_start_3
    new-instance v10, Ljava/security/SignatureException;

    const-string v11, "Signature did not verify"

    invoke-direct {v10, v11}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    .end local v2    # "signatureBytes":[B
    .end local v3    # "signerCerts":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .end local v4    # "signingCert":Ljava/security/cert/X509Certificate;
    .end local v5    # "publicKey":Ljava/security/PublicKey;
    .end local v6    # "digestAlgorithm":Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;
    .end local v7    # "signatureAlgs":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;>;"
    .end local v8    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .end local p0    # "signerConfig":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;
    .end local p1    # "signatureFileBytes":[B
    throw v10
    :try_end_3
    .catch Ljava/security/InvalidKeyException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/security/SignatureException; {:try_start_3 .. :try_end_3} :catch_2

    .line 534
    .end local v9    # "signature":Ljava/security/Signature;
    .restart local v2    # "signatureBytes":[B
    .restart local v3    # "signerCerts":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .restart local v4    # "signingCert":Ljava/security/cert/X509Certificate;
    .restart local v5    # "publicKey":Ljava/security/PublicKey;
    .restart local v6    # "digestAlgorithm":Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;
    .restart local v7    # "signatureAlgs":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;Lcom/android/apksig/internal/pkcs7/AlgorithmIdentifier;>;"
    .restart local v8    # "jcaSignatureAlgorithm":Ljava/lang/String;
    .restart local p0    # "signerConfig":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;
    .restart local p1    # "signatureFileBytes":[B
    :catch_2
    move-exception v9

    .line 535
    .local v9, "e":Ljava/security/SignatureException;
    new-instance v10, Ljava/security/SignatureException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v10, v0, v9}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 529
    .end local v9    # "e":Ljava/security/SignatureException;
    :catch_3
    move-exception v9

    .line 530
    .local v9, "e":Ljava/security/InvalidKeyException;
    new-instance v10, Ljava/security/InvalidKeyException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v10, v0, v9}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 517
    .end local v2    # "signatureBytes":[B
    .end local v9    # "e":Ljava/security/InvalidKeyException;
    :catch_4
    move-exception v0

    .line 518
    .local v0, "e":Ljava/security/SignatureException;
    new-instance v1, Ljava/security/SignatureException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 515
    .end local v0    # "e":Ljava/security/SignatureException;
    :catch_5
    move-exception v0

    .line 516
    .local v0, "e":Ljava/security/InvalidKeyException;
    new-instance v1, Ljava/security/InvalidKeyException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static generateSignatureFile(Ljava/util/List;Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;Ljava/lang/String;Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;)[B
    .locals 15
    .param p1, "manifestDigestAlgorithm"    # Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;
    .param p2, "createdBy"    # Ljava/lang/String;
    .param p3, "manifest"    # Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "apkSignatureSchemeIds",
            "manifestDigestAlgorithm",
            "createdBy",
            "manifest"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;",
            "Ljava/lang/String;",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;",
            ")[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 423
    .local p0, "apkSignatureSchemeIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move-object/from16 v1, p3

    const-string v2, "Failed to write in-memory .SF file"

    new-instance v0, Ljava/util/jar/Manifest;

    invoke-direct {v0}, Ljava/util/jar/Manifest;-><init>()V

    move-object v3, v0

    .line 424
    .local v3, "sf":Ljava/util/jar/Manifest;
    invoke-virtual {v3}, Ljava/util/jar/Manifest;->getMainAttributes()Ljava/util/jar/Attributes;

    move-result-object v4

    .line 425
    .local v4, "mainAttrs":Ljava/util/jar/Attributes;
    sget-object v0, Ljava/util/jar/Attributes$Name;->SIGNATURE_VERSION:Ljava/util/jar/Attributes$Name;

    const-string v5, "1.0"

    invoke-virtual {v4, v0, v5}, Ljava/util/jar/Attributes;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 426
    sget-object v0, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->ATTRIBUTE_NAME_CREATED_BY:Ljava/util/jar/Attributes$Name;

    move-object/from16 v5, p2

    invoke-virtual {v4, v0, v5}, Ljava/util/jar/Attributes;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 427
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 433
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 434
    .local v0, "attrValue":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 435
    .local v7, "id":I
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v8

    if-lez v8, :cond_0

    .line 436
    const-string v8, ", "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 438
    :cond_0
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 439
    .end local v7    # "id":I
    goto :goto_0

    .line 440
    :cond_1
    sget-object v6, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->SF_ATTRIBUTE_NAME_ANDROID_APK_SIGNED_NAME:Ljava/util/jar/Attributes$Name;

    .line 442
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 440
    invoke-virtual {v4, v6, v7}, Ljava/util/jar/Attributes;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 446
    .end local v0    # "attrValue":Ljava/lang/StringBuilder;
    :cond_2
    invoke-static/range {p1 .. p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->getMessageDigestInstance(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;)Ljava/security/MessageDigest;

    move-result-object v6

    .line 447
    .local v6, "md":Ljava/security/MessageDigest;
    nop

    .line 448
    invoke-static/range {p1 .. p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->getManifestDigestAttributeName(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;)Ljava/lang/String;

    move-result-object v0

    .line 449
    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object v7

    iget-object v8, v1, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;->contents:[B

    invoke-virtual {v6, v8}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object v7

    .line 447
    invoke-virtual {v4, v0, v7}, Ljava/util/jar/Attributes;->putValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 450
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    move-object v7, v0

    .line 452
    .local v7, "out":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    invoke-static {v7, v4}, Lcom/android/apksig/internal/jar/SignatureFileWriter;->writeMainSection(Ljava/io/OutputStream;Ljava/util/jar/Attributes;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 455
    nop

    .line 456
    invoke-static/range {p1 .. p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->getEntryDigestAttributeName(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;)Ljava/lang/String;

    move-result-object v8

    .line 458
    .local v8, "entryDigestAttributeName":Ljava/lang/String;
    iget-object v0, v1, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;->individualSectionsContents:Ljava/util/SortedMap;

    invoke-interface {v0}, Ljava/util/SortedMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 459
    .local v9, "manifestSection":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[B>;"
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 460
    .local v10, "sectionName":Ljava/lang/String;
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [B

    .line 461
    .local v11, "sectionContents":[B
    invoke-virtual {v6, v11}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v12

    .line 462
    .local v12, "sectionDigest":[B
    new-instance v13, Ljava/util/jar/Attributes;

    invoke-direct {v13}, Ljava/util/jar/Attributes;-><init>()V

    .line 463
    .local v13, "attrs":Ljava/util/jar/Attributes;
    nop

    .line 465
    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object v14

    .line 463
    invoke-virtual {v13, v8, v14}, Ljava/util/jar/Attributes;->putValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 468
    :try_start_1
    invoke-static {v7, v10, v13}, Lcom/android/apksig/internal/jar/SignatureFileWriter;->writeIndividualSection(Ljava/io/OutputStream;Ljava/lang/String;Ljava/util/jar/Attributes;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 471
    nop

    .line 472
    .end local v9    # "manifestSection":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[B>;"
    .end local v10    # "sectionName":Ljava/lang/String;
    .end local v11    # "sectionContents":[B
    .end local v12    # "sectionDigest":[B
    .end local v13    # "attrs":Ljava/util/jar/Attributes;
    goto :goto_1

    .line 469
    .restart local v9    # "manifestSection":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[B>;"
    .restart local v10    # "sectionName":Ljava/lang/String;
    .restart local v11    # "sectionContents":[B
    .restart local v12    # "sectionDigest":[B
    .restart local v13    # "attrs":Ljava/util/jar/Attributes;
    :catch_0
    move-exception v0

    move-object v14, v0

    move-object v0, v14

    .line 470
    .local v0, "e":Ljava/io/IOException;
    new-instance v14, Ljava/lang/RuntimeException;

    invoke-direct {v14, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v14

    .line 477
    .end local v0    # "e":Ljava/io/IOException;
    .end local v9    # "manifestSection":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[B>;"
    .end local v10    # "sectionName":Ljava/lang/String;
    .end local v11    # "sectionContents":[B
    .end local v12    # "sectionDigest":[B
    .end local v13    # "attrs":Ljava/util/jar/Attributes;
    :cond_3
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    if-lez v0, :cond_4

    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    rem-int/lit16 v0, v0, 0x400

    if-nez v0, :cond_4

    .line 479
    :try_start_2
    invoke-static {v7}, Lcom/android/apksig/internal/jar/SignatureFileWriter;->writeSectionDelimiter(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 482
    goto :goto_2

    .line 480
    :catch_1
    move-exception v0

    move-object v2, v0

    move-object v0, v2

    .line 481
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v9, "Failed to write to ByteArrayOutputStream"

    invoke-direct {v2, v9, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 485
    .end local v0    # "e":Ljava/io/IOException;
    :cond_4
    :goto_2
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0

    .line 453
    .end local v8    # "entryDigestAttributeName":Ljava/lang/String;
    :catch_2
    move-exception v0

    move-object v8, v0

    move-object v0, v8

    .line 454
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v8, Ljava/lang/RuntimeException;

    invoke-direct {v8, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8
.end method

.method private static getEntryDigestAttributeName(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;)Ljava/lang/String;
    .locals 3
    .param p0, "digestAlgorithm"    # Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "digestAlgorithm"
        }
    .end annotation

    .line 558
    sget-object v0, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$1;->$SwitchMap$com$android$apksig$internal$apk$v1$DigestAlgorithm:[I

    invoke-virtual {p0}, Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 564
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected content digest algorithm: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 562
    :pswitch_0
    const-string v0, "SHA-256-Digest"

    return-object v0

    .line 560
    :pswitch_1
    const-string v0, "SHA1-Digest"

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getJcaMessageDigestAlgorithm(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;)Ljava/lang/String;
    .locals 1
    .param p0, "digestAlgorithm"    # Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "digestAlgorithm"
        }
    .end annotation

    .line 179
    invoke-virtual {p0}, Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;->getJcaMessageDigestAlgorithm()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getManifestDigestAttributeName(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;)Ljava/lang/String;
    .locals 3
    .param p0, "digestAlgorithm"    # Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "digestAlgorithm"
        }
    .end annotation

    .line 570
    sget-object v0, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$1;->$SwitchMap$com$android$apksig$internal$apk$v1$DigestAlgorithm:[I

    invoke-virtual {p0}, Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 576
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected content digest algorithm: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 574
    :pswitch_0
    const-string v0, "SHA-256-Digest-Manifest"

    return-object v0

    .line 572
    :pswitch_1
    const-string v0, "SHA1-Digest-Manifest"

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getMessageDigestInstance(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;)Ljava/security/MessageDigest;
    .locals 2
    .param p0, "digestAlgorithm"    # Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "digestAlgorithm"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 170
    invoke-virtual {p0}, Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;->getJcaMessageDigestAlgorithm()Ljava/lang/String;

    move-result-object v0

    .line 171
    .local v0, "jcaAlgorithm":Ljava/lang/String;
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    return-object v1
.end method

.method public static getOutputEntryNames(Ljava/util/List;)Ljava/util/Set;
    .locals 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signerConfigs"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;",
            ">;)",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 318
    .local p0, "signerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 319
    .local v0, "result":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;

    .line 320
    .local v2, "signerConfig":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;
    iget-object v3, v2, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;->name:Ljava/lang/String;

    .line 321
    .local v3, "signerName":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "META-INF/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ".SF"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 322
    iget-object v4, v2, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;->certificates:Ljava/util/List;

    const/4 v6, 0x0

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/security/cert/X509Certificate;

    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v4

    .line 323
    .local v4, "publicKey":Ljava/security/PublicKey;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 325
    invoke-interface {v4}, Ljava/security/PublicKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v6

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 326
    .local v5, "signatureBlockFileName":Ljava/lang/String;
    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 327
    .end local v2    # "signerConfig":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;
    .end local v3    # "signerName":Ljava/lang/String;
    .end local v4    # "publicKey":Ljava/security/PublicKey;
    .end local v5    # "signatureBlockFileName":Ljava/lang/String;
    goto :goto_0

    .line 328
    :cond_0
    const-string v1, "META-INF/MANIFEST.MF"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 329
    return-object v0
.end method

.method public static getSafeSignerName(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 143
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 150
    .local v0, "result":Ljava/lang/StringBuilder;
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 151
    .local v1, "nameCharsUpperCase":[C
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    const/16 v4, 0x8

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    if-ge v2, v3, :cond_4

    .line 152
    aget-char v3, v1, v2

    .line 153
    .local v3, "c":C
    const/16 v4, 0x41

    if-lt v3, v4, :cond_0

    const/16 v4, 0x5a

    if-le v3, v4, :cond_3

    :cond_0
    const/16 v4, 0x30

    if-lt v3, v4, :cond_1

    const/16 v4, 0x39

    if-le v3, v4, :cond_3

    :cond_1
    const/16 v4, 0x2d

    if-eq v3, v4, :cond_3

    const/16 v4, 0x5f

    if-ne v3, v4, :cond_2

    goto :goto_1

    .line 159
    :cond_2
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 157
    :cond_3
    :goto_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 151
    .end local v3    # "c":C
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 162
    .end local v2    # "i":I
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 144
    .end local v0    # "result":Ljava/lang/StringBuilder;
    .end local v1    # "nameCharsUpperCase":[C
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Empty name"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getSuggestedSignatureDigestAlgorithm(Ljava/security/PublicKey;I)Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;
    .locals 4
    .param p0, "signingKey"    # Ljava/security/PublicKey;
    .param p1, "minSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "signingKey",
            "minSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 114
    invoke-interface {p0}, Ljava/security/PublicKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v0

    .line 115
    .local v0, "keyAlgorithm":Ljava/lang/String;
    const-string v1, "RSA"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    const/16 v2, 0x12

    if-nez v1, :cond_5

    const-string v1, "1.2.840.113549.1.1.1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 121
    :cond_0
    const-string v1, "DSA"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 123
    const/16 v1, 0x15

    if-ge p1, v1, :cond_1

    .line 124
    sget-object v1, Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;->SHA1:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    return-object v1

    .line 126
    :cond_1
    sget-object v1, Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;->SHA256:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    return-object v1

    .line 128
    :cond_2
    const-string v1, "EC"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 129
    if-lt p1, v2, :cond_3

    .line 133
    sget-object v1, Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;->SHA256:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    return-object v1

    .line 130
    :cond_3
    new-instance v1, Ljava/security/InvalidKeyException;

    const-string v2, "ECDSA signatures only supported for minSdkVersion 18 and higher"

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 135
    :cond_4
    new-instance v1, Ljava/security/InvalidKeyException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported key algorithm: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 117
    :cond_5
    :goto_0
    if-ge p1, v2, :cond_6

    .line 118
    sget-object v1, Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;->SHA1:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    return-object v1

    .line 120
    :cond_6
    sget-object v1, Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;->SHA256:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    return-object v1
.end method

.method public static isJarEntryDigestNeededInManifest(Ljava/lang/String;)Z
    .locals 5
    .param p0, "entryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entryName"
        }
    .end annotation

    .line 190
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 191
    return v1

    .line 195
    :cond_0
    const-string v0, "META-INF/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_1

    .line 196
    return v3

    .line 199
    :cond_1
    const/16 v2, 0x2f

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {p0, v2, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    const/4 v4, -0x1

    if-eq v2, v4, :cond_2

    .line 200
    return v3

    .line 210
    :cond_2
    nop

    .line 211
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 212
    .local v0, "fileNameLowerCase":Ljava/lang/String;
    const-string v2, "manifest.mf"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 213
    const-string v2, ".sf"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 214
    const-string v2, ".rsa"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 215
    const-string v2, ".dsa"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 216
    const-string v2, ".ec"

    invoke-virtual {v0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 217
    const-string v2, "sig-"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_0

    .line 220
    :cond_3
    return v3

    .line 218
    :cond_4
    :goto_0
    return v1
.end method

.method public static sign(Ljava/util/List;Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;Ljava/util/Map;Ljava/util/List;[BLjava/lang/String;)Ljava/util/List;
    .locals 2
    .param p1, "jarEntryDigestAlgorithm"    # Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;
    .param p4, "sourceManifestBytes"    # [B
    .param p5, "createdBy"    # Ljava/lang/String;
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
            "signerConfigs",
            "jarEntryDigestAlgorithm",
            "jarEntryDigests",
            "apkSigningSchemeIds",
            "sourceManifestBytes",
            "createdBy"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;",
            ">;",
            "Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;[B",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/util/Pair<",
            "Ljava/lang/String;",
            "[B>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/cert/CertificateException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 247
    .local p0, "signerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;>;"
    .local p2, "jarEntryDigests":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;[B>;"
    .local p3, "apkSigningSchemeIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 250
    nop

    .line 251
    invoke-static {p1, p2, p4}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->generateManifestFile(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;Ljava/util/Map;[B)Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;

    move-result-object v0

    .line 254
    .local v0, "manifest":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;
    invoke-static {p0, p1, p3, p5, v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->signManifest(Ljava/util/List;Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;Ljava/util/List;Ljava/lang/String;Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;)Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 248
    .end local v0    # "manifest":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "At least one signer config must be provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static signManifest(Ljava/util/List;Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;Ljava/util/List;Ljava/lang/String;Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;)Ljava/util/List;
    .locals 16
    .param p1, "digestAlgorithm"    # Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;
    .param p3, "createdBy"    # Ljava/lang/String;
    .param p4, "manifest"    # Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "signerConfigs",
            "digestAlgorithm",
            "apkSigningSchemeIds",
            "createdBy",
            "manifest"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;",
            ">;",
            "Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/util/Pair<",
            "Ljava/lang/String;",
            "[B>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/cert/CertificateException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 278
    .local p0, "signerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;>;"
    .local p2, "apkSigningSchemeIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move-object/from16 v1, p4

    const-string v2, "\""

    const-string v3, "Failed to sign using signer \""

    invoke-interface/range {p0 .. p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 283
    new-instance v0, Ljava/util/ArrayList;

    .line 284
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->size()I

    move-result v4

    mul-int/lit8 v4, v4, 0x2

    add-int/lit8 v4, v4, 0x1

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    move-object v4, v0

    .line 285
    .local v4, "signatureJarEntries":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;[B>;>;"
    nop

    .line 286
    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    invoke-static {v6, v5, v7, v1}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->generateSignatureFile(Ljava/util/List;Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;Ljava/lang/String;Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;)[B

    move-result-object v8

    .line 287
    .local v8, "sfBytes":[B
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;

    .line 288
    .local v9, "signerConfig":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;
    iget-object v10, v9, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;->name:Ljava/lang/String;

    .line 291
    .local v10, "signerName":Ljava/lang/String;
    :try_start_0
    invoke-static {v9, v8}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->generateSignatureBlock(Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;[B)[B

    move-result-object v11
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/SignatureException; {:try_start_0 .. :try_end_0} :catch_0

    .line 301
    .local v11, "signatureBlock":[B
    nop

    .line 302
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "META-INF/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v14, ".SF"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12, v8}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v12

    invoke-interface {v4, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 303
    iget-object v12, v9, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;->certificates:Ljava/util/List;

    const/4 v14, 0x0

    invoke-interface {v12, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/security/cert/X509Certificate;

    invoke-virtual {v12}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v12

    .line 304
    .local v12, "publicKey":Ljava/security/PublicKey;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    .line 306
    invoke-interface {v12}, Ljava/security/PublicKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v14

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v14, v15}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 307
    .local v13, "signatureBlockFileName":Ljava/lang/String;
    nop

    .line 308
    invoke-static {v13, v11}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v14

    .line 307
    invoke-interface {v4, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 309
    .end local v9    # "signerConfig":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;
    .end local v10    # "signerName":Ljava/lang/String;
    .end local v11    # "signatureBlock":[B
    .end local v12    # "publicKey":Ljava/security/PublicKey;
    .end local v13    # "signatureBlockFileName":Ljava/lang/String;
    goto :goto_0

    .line 298
    .restart local v9    # "signerConfig":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;
    .restart local v10    # "signerName":Ljava/lang/String;
    :catch_0
    move-exception v0

    move-object v11, v0

    move-object v0, v11

    .line 299
    .local v0, "e":Ljava/security/SignatureException;
    new-instance v11, Ljava/security/SignatureException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v11, v2, v0}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 295
    .end local v0    # "e":Ljava/security/SignatureException;
    :catch_1
    move-exception v0

    move-object v11, v0

    move-object v0, v11

    .line 296
    .local v0, "e":Ljava/security/cert/CertificateException;
    new-instance v11, Ljava/security/cert/CertificateException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v11, v2, v0}, Ljava/security/cert/CertificateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 292
    .end local v0    # "e":Ljava/security/cert/CertificateException;
    :catch_2
    move-exception v0

    move-object v11, v0

    move-object v0, v11

    .line 293
    .local v0, "e":Ljava/security/InvalidKeyException;
    new-instance v11, Ljava/security/InvalidKeyException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v11, v2, v0}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 310
    .end local v0    # "e":Ljava/security/InvalidKeyException;
    .end local v9    # "signerConfig":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;
    .end local v10    # "signerName":Ljava/lang/String;
    :cond_0
    const-string v0, "META-INF/MANIFEST.MF"

    iget-object v2, v1, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;->contents:[B

    invoke-static {v0, v2}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 311
    return-object v4

    .line 279
    .end local v4    # "signatureJarEntries":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;[B>;>;"
    .end local v8    # "sfBytes":[B
    :cond_1
    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "At least one signer config must be provided"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
