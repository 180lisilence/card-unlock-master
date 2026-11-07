.class public Lcom/android/apksig/SigningCertificateLineage;
.super Ljava/lang/Object;
.source "SigningCertificateLineage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/SigningCertificateLineage$SignerConfig;,
        Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;,
        Lcom/android/apksig/SigningCertificateLineage$Builder;
    }
.end annotation


# static fields
.field private static final CURRENT_VERSION:I = 0x1

.field private static final FIRST_VERSION:I = 0x1

.field public static final MAGIC:I = 0x3eff39d1

.field private static final PAST_CERT_AUTH:I = 0x10

.field private static final PAST_CERT_INSTALLED_DATA:I = 0x1

.field private static final PAST_CERT_PERMISSION:I = 0x4

.field private static final PAST_CERT_ROLLBACK:I = 0x8

.field private static final PAST_CERT_SHARED_USER_ID:I = 0x2


# instance fields
.field private final mMinSdkVersion:I

.field private final mSigningLineage:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(ILjava/util/List;)V
    .locals 0
    .param p1, "minSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "minSdkVersion",
            "list"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;",
            ">;)V"
        }
    .end annotation

    .line 110
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 111
    iput p1, p0, Lcom/android/apksig/SigningCertificateLineage;->mMinSdkVersion:I

    .line 112
    iput-object p2, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    .line 113
    return-void
.end method

.method static synthetic access$100()I
    .locals 1

    .line 72
    invoke-static {}, Lcom/android/apksig/SigningCertificateLineage;->calculateDefaultFlags()I

    move-result v0

    return v0
.end method

.method static synthetic access$600(ILcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;Lcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)Lcom/android/apksig/SigningCertificateLineage;
    .locals 1
    .param p0, "x0"    # I
    .param p1, "x1"    # Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
    .param p2, "x2"    # Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    .param p3, "x3"    # Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
    .param p4, "x4"    # Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 72
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/apksig/SigningCertificateLineage;->createSigningLineage(ILcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;Lcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v0

    return-object v0
.end method

.method private static calculateDefaultFlags()I
    .locals 1

    .line 660
    const/16 v0, 0x17

    return v0
.end method

.method private static calculateMinSdkVersion(Ljava/util/List;)I
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "nodes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;",
            ">;)I"
        }
    .end annotation

    .line 497
    .local p0, "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    if-eqz p0, :cond_2

    .line 500
    const/16 v0, 0x1c

    .line 501
    .local v0, "minSdkVersion":I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;

    .line 502
    .local v2, "node":Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    iget-object v3, v2, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->sigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    if-eqz v3, :cond_0

    .line 503
    iget-object v3, v2, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->sigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    invoke-virtual {v3}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getMinSdkVersion()I

    move-result v3

    .line 504
    .local v3, "nodeMinSdkVersion":I
    if-le v3, v0, :cond_0

    .line 505
    move v0, v3

    .line 508
    .end local v2    # "node":Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    .end local v3    # "nodeMinSdkVersion":I
    :cond_0
    goto :goto_0

    .line 509
    :cond_1
    return v0

    .line 498
    .end local v0    # "minSdkVersion":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Can\'t calculate minimum SDK version of null nodes"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static consolidateLineages(Ljava/util/List;)Lcom/android/apksig/SigningCertificateLineage;
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "lineages"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/SigningCertificateLineage;",
            ">;)",
            "Lcom/android/apksig/SigningCertificateLineage;"
        }
    .end annotation

    .line 706
    .local p0, "lineages":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/SigningCertificateLineage;>;"
    if-eqz p0, :cond_6

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_3

    .line 709
    :cond_0
    const/4 v0, 0x0

    .line 710
    .local v0, "largestIndex":I
    const/4 v1, 0x0

    .line 713
    .local v1, "maxSize":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 714
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/SigningCertificateLineage;

    invoke-virtual {v3}, Lcom/android/apksig/SigningCertificateLineage;->size()I

    move-result v3

    .line 715
    .local v3, "curSize":I
    if-le v3, v1, :cond_1

    .line 716
    move v0, v2

    .line 717
    move v1, v3

    .line 713
    .end local v3    # "curSize":I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 721
    .end local v2    # "i":I
    :cond_2
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/SigningCertificateLineage;

    iget-object v2, v2, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    .line 723
    .local v2, "largestList":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_5

    .line 724
    if-ne v3, v0, :cond_3

    .line 725
    goto :goto_2

    .line 727
    :cond_3
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/SigningCertificateLineage;

    iget-object v4, v4, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    .line 728
    .local v4, "underTest":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    const/4 v5, 0x0

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    invoke-interface {v2, v5, v6}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 723
    .end local v4    # "underTest":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 729
    .restart local v4    # "underTest":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    :cond_4
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Inconsistent SigningCertificateLineages. Not all lineages are subsets of each other."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 735
    .end local v3    # "i":I
    .end local v4    # "underTest":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    :cond_5
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/SigningCertificateLineage;

    return-object v3

    .line 707
    .end local v0    # "largestIndex":I
    .end local v1    # "maxSize":I
    .end local v2    # "largestList":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    :cond_6
    :goto_3
    const/4 v0, 0x0

    return-object v0
.end method

.method private static createSigningLineage(ILcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;Lcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)Lcom/android/apksig/SigningCertificateLineage;
    .locals 2
    .param p0, "minSdkVersion"    # I
    .param p1, "parent"    # Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
    .param p2, "parentCapabilities"    # Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    .param p3, "child"    # Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
    .param p4, "childCapabilities"    # Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "minSdkVersion",
            "parent",
            "parentCapabilities",
            "child",
            "childCapabilities"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 120
    new-instance v0, Lcom/android/apksig/SigningCertificateLineage;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/android/apksig/SigningCertificateLineage;-><init>(ILjava/util/List;)V

    .line 122
    .local v0, "signingCertificateLineage":Lcom/android/apksig/SigningCertificateLineage;
    nop

    .line 123
    invoke-direct {v0, p1, p2}, Lcom/android/apksig/SigningCertificateLineage;->spawnFirstDescendant(Lcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v0

    .line 124
    invoke-virtual {v0, p1, p3, p4}, Lcom/android/apksig/SigningCertificateLineage;->spawnDescendant(Lcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v1

    return-object v1
.end method

.method private getSignatureAlgorithm(Lcom/android/apksig/SigningCertificateLineage$SignerConfig;)Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .locals 3
    .param p1, "parent"    # Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "parent"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 431
    invoke-virtual {p1}, Lcom/android/apksig/SigningCertificateLineage$SignerConfig;->getCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v0

    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v0

    .line 434
    .local v0, "publicKey":Ljava/security/PublicKey;
    iget v1, p0, Lcom/android/apksig/SigningCertificateLineage;->mMinSdkVersion:I

    const/4 v2, 0x0

    invoke-static {v0, v1, v2, v2}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->getSuggestedSignatureAlgorithms(Ljava/security/PublicKey;IZZ)Ljava/util/List;

    move-result-object v1

    .line 437
    .local v1, "algorithms":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/SignatureAlgorithm;>;"
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    return-object v2
.end method

.method private static read(Ljava/nio/ByteBuffer;)Lcom/android/apksig/SigningCertificateLineage;
    .locals 2
    .param p0, "inputByteBuffer"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "inputByteBuffer"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 462
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->checkByteOrderLittleEndian(Ljava/nio/ByteBuffer;)V

    .line 463
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/16 v1, 0x8

    if-lt v0, v1, :cond_1

    .line 468
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    const v1, 0x3eff39d1

    if-ne v0, v1, :cond_0

    .line 472
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    invoke-static {p0, v0}, Lcom/android/apksig/SigningCertificateLineage;->read(Ljava/nio/ByteBuffer;I)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v0

    return-object v0

    .line 469
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Improper SigningCertificateLineage format: MAGIC header mismatch."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 464
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Improper SigningCertificateLineage format: insufficient data for header."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static read(Ljava/nio/ByteBuffer;I)Lcom/android/apksig/SigningCertificateLineage;
    .locals 3
    .param p0, "inputByteBuffer"    # Ljava/nio/ByteBuffer;
    .param p1, "version"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "inputByteBuffer",
            "version"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 477
    packed-switch p1, :pswitch_data_0

    .line 491
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Improper SigningCertificateLineage format: unrecognized version."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 480
    :pswitch_0
    nop

    .line 482
    :try_start_0
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 481
    invoke-static {v0}, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage;->readSigningCertificateLineage(Ljava/nio/ByteBuffer;)Ljava/util/List;

    move-result-object v0

    .line 483
    .local v0, "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    invoke-static {v0}, Lcom/android/apksig/SigningCertificateLineage;->calculateMinSdkVersion(Ljava/util/List;)I

    move-result v1

    .line 484
    .local v1, "minSdkVersion":I
    new-instance v2, Lcom/android/apksig/SigningCertificateLineage;

    invoke-direct {v2, v1, v0}, Lcom/android/apksig/SigningCertificateLineage;-><init>(ILjava/util/List;)V
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 485
    .end local v0    # "nodes":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    .end local v1    # "minSdkVersion":I
    :catch_0
    move-exception v0

    .line 487
    .local v0, "e":Lcom/android/apksig/apk/ApkFormatException;
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Unable to read list of signing certificate nodes in SigningCertificateLineage"

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public static readFromApkDataSource(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/SigningCertificateLineage;
    .locals 10
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apk"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 196
    :try_start_0
    invoke-static {p0}, Lcom/android/apksig/apk/ApkUtils;->findZipSections(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/apk/ApkUtils$ZipSections;

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_3

    .line 199
    .local v0, "zipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    nop

    .line 201
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 203
    .local v1, "signatureInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/SignatureInfo;>;"
    :try_start_1
    new-instance v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    const/16 v3, 0x1f

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;-><init>(I)V

    .line 205
    .local v2, "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    nop

    .line 206
    const v3, 0x1b93ad61

    invoke-static {p0, v0, v3, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Lcom/android/apksig/internal/apk/SignatureInfo;

    move-result-object v3

    .line 205
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 211
    nop

    .end local v2    # "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    goto :goto_0

    .line 209
    :catch_0
    move-exception v2

    .line 213
    :goto_0
    :try_start_2
    new-instance v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    const/4 v3, 0x3

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;-><init>(I)V

    .line 215
    .restart local v2    # "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    nop

    .line 216
    const v3, -0xfac9740

    invoke-static {p0, v0, v3, v2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->findSignature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Lcom/android/apksig/internal/apk/SignatureInfo;

    move-result-object v3

    .line 215
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignatureNotFoundException; {:try_start_2 .. :try_end_2} :catch_1

    .line 221
    nop

    .end local v2    # "result":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    goto :goto_1

    .line 219
    :catch_1
    move-exception v2

    .line 222
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    .line 227
    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 228
    .local v2, "lineages":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/SigningCertificateLineage;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/apksig/internal/apk/SignatureInfo;

    .line 236
    .local v5, "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    iget-object v6, v5, Lcom/android/apksig/internal/apk/SignatureInfo;->signatureBlock:Ljava/nio/ByteBuffer;

    invoke-static {v6}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 237
    .local v6, "signers":Ljava/nio/ByteBuffer;
    :goto_3
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 238
    invoke-static {v6}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 239
    .local v7, "signer":Ljava/nio/ByteBuffer;
    invoke-static {v7}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v8

    .line 241
    .local v8, "signedData":Ljava/nio/ByteBuffer;
    :try_start_3
    invoke-static {v8}, Lcom/android/apksig/SigningCertificateLineage;->readFromSignedData(Ljava/nio/ByteBuffer;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v9

    .line 242
    .local v9, "lineage":Lcom/android/apksig/SigningCertificateLineage;
    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_2

    .line 246
    nop

    .end local v9    # "lineage":Lcom/android/apksig/SigningCertificateLineage;
    goto :goto_4

    .line 243
    :catch_2
    move-exception v9

    .line 247
    .end local v7    # "signer":Ljava/nio/ByteBuffer;
    .end local v8    # "signedData":Ljava/nio/ByteBuffer;
    :goto_4
    goto :goto_3

    .line 248
    .end local v5    # "signatureInfo":Lcom/android/apksig/internal/apk/SignatureInfo;
    .end local v6    # "signers":Ljava/nio/ByteBuffer;
    :cond_0
    goto :goto_2

    .line 251
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 254
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-le v4, v3, :cond_2

    .line 255
    invoke-static {v2}, Lcom/android/apksig/SigningCertificateLineage;->consolidateLineages(Ljava/util/List;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v3

    .local v3, "result":Lcom/android/apksig/SigningCertificateLineage;
    goto :goto_5

    .line 257
    .end local v3    # "result":Lcom/android/apksig/SigningCertificateLineage;
    :cond_2
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/SigningCertificateLineage;

    .line 259
    .restart local v3    # "result":Lcom/android/apksig/SigningCertificateLineage;
    :goto_5
    return-object v3

    .line 252
    .end local v3    # "result":Lcom/android/apksig/SigningCertificateLineage;
    :cond_3
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "The provided APK does not contain a valid lineage."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 223
    .end local v2    # "lineages":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/SigningCertificateLineage;>;"
    :cond_4
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The provided APK does not contain a valid V3 signature block."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 197
    .end local v0    # "zipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .end local v1    # "signatureInfoList":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/SignatureInfo;>;"
    :catch_3
    move-exception v0

    .line 198
    .local v0, "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v1, Lcom/android/apksig/apk/ApkFormatException;

    invoke-virtual {v0}, Lcom/android/apksig/zip/ZipFormatException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static readFromApkFile(Ljava/io/File;)Lcom/android/apksig/SigningCertificateLineage;
    .locals 5
    .param p0, "apkFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apkFile"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 179
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "r"

    invoke-direct {v0, p0, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 180
    .local v0, "f":Ljava/io/RandomAccessFile;
    :try_start_0
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    invoke-static {v0, v3, v4, v1, v2}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/io/RandomAccessFile;JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v1

    .line 181
    .local v1, "apk":Lcom/android/apksig/util/DataSource;
    invoke-static {v1}, Lcom/android/apksig/SigningCertificateLineage;->readFromApkDataSource(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 182
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 181
    return-object v2

    .line 179
    .end local v1    # "apk":Lcom/android/apksig/util/DataSource;
    :catchall_0
    move-exception v1

    :try_start_1
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {v1, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_0
    throw v1
.end method

.method public static readFromBytes([B)Lcom/android/apksig/SigningCertificateLineage;
    .locals 1
    .param p0, "lineageBytes"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "lineageBytes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 129
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {v0}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/nio/ByteBuffer;)Lcom/android/apksig/util/DataSource;

    move-result-object v0

    invoke-static {v0}, Lcom/android/apksig/SigningCertificateLineage;->readFromDataSource(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v0

    return-object v0
.end method

.method public static readFromDataSource(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/SigningCertificateLineage;
    .locals 3
    .param p0, "dataSource"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dataSource"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 143
    if-eqz p0, :cond_0

    .line 146
    invoke-interface {p0}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v0

    long-to-int v0, v0

    const-wide/16 v1, 0x0

    invoke-interface {p0, v1, v2, v0}, Lcom/android/apksig/util/DataSource;->getByteBuffer(JI)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 147
    .local v0, "inBuff":Ljava/nio/ByteBuffer;
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 148
    invoke-static {v0}, Lcom/android/apksig/SigningCertificateLineage;->read(Ljava/nio/ByteBuffer;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v1

    return-object v1

    .line 144
    .end local v0    # "inBuff":Ljava/nio/ByteBuffer;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "dataSource == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static readFromFile(Ljava/io/File;)Lcom/android/apksig/SigningCertificateLineage;
    .locals 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "file"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 134
    if-eqz p0, :cond_0

    .line 137
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "r"

    invoke-direct {v0, p0, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 138
    .local v0, "inputFile":Ljava/io/RandomAccessFile;
    invoke-static {v0}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/io/RandomAccessFile;)Lcom/android/apksig/util/DataSource;

    move-result-object v1

    invoke-static {v1}, Lcom/android/apksig/SigningCertificateLineage;->readFromDataSource(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v1

    return-object v1

    .line 135
    .end local v0    # "inputFile":Ljava/io/RandomAccessFile;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "file == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static readFromSignedData(Ljava/nio/ByteBuffer;)Lcom/android/apksig/SigningCertificateLineage;
    .locals 7
    .param p0, "signedData"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signedData"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 283
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 284
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 285
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 286
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    .line 288
    invoke-static {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 289
    .local v0, "additionalAttributes":Ljava/nio/ByteBuffer;
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 290
    .local v1, "lineages":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/SigningCertificateLineage;>;"
    :goto_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 291
    invoke-static {v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getLengthPrefixedSlice(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 292
    .local v3, "attribute":Ljava/nio/ByteBuffer;
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    .line 293
    .local v4, "id":I
    const v5, 0x3ba06f8c

    if-ne v4, v5, :cond_0

    .line 294
    invoke-static {v3}, Lcom/android/apksig/internal/util/ByteBufferUtils;->toByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v5

    .line 295
    .local v5, "value":[B
    invoke-static {v5}, Lcom/android/apksig/SigningCertificateLineage;->readFromV3AttributeValue([B)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v6

    .line 296
    .local v6, "lineage":Lcom/android/apksig/SigningCertificateLineage;
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 298
    .end local v3    # "attribute":Ljava/nio/ByteBuffer;
    .end local v4    # "id":I
    .end local v5    # "value":[B
    .end local v6    # "lineage":Lcom/android/apksig/SigningCertificateLineage;
    :cond_0
    goto :goto_0

    .line 302
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 304
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-le v3, v2, :cond_2

    .line 305
    invoke-static {v1}, Lcom/android/apksig/SigningCertificateLineage;->consolidateLineages(Ljava/util/List;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v2

    .local v2, "result":Lcom/android/apksig/SigningCertificateLineage;
    goto :goto_1

    .line 307
    .end local v2    # "result":Lcom/android/apksig/SigningCertificateLineage;
    :cond_2
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/SigningCertificateLineage;

    .line 309
    .restart local v2    # "result":Lcom/android/apksig/SigningCertificateLineage;
    :goto_1
    return-object v2

    .line 303
    .end local v2    # "result":Lcom/android/apksig/SigningCertificateLineage;
    :cond_3
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The signed data does not contain a valid lineage."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static readFromV3AttributeValue([B)Lcom/android/apksig/SigningCertificateLineage;
    .locals 3
    .param p0, "attrValue"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "attrValue"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 163
    nop

    .line 164
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 165
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 164
    invoke-static {v0}, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage;->readSigningCertificateLineage(Ljava/nio/ByteBuffer;)Ljava/util/List;

    move-result-object v0

    .line 166
    .local v0, "parsedLineage":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    invoke-static {v0}, Lcom/android/apksig/SigningCertificateLineage;->calculateMinSdkVersion(Ljava/util/List;)I

    move-result v1

    .line 167
    .local v1, "minSdkVersion":I
    new-instance v2, Lcom/android/apksig/SigningCertificateLineage;

    invoke-direct {v2, v1, v0}, Lcom/android/apksig/SigningCertificateLineage;-><init>(ILjava/util/List;)V

    return-object v2
.end method

.method private spawnFirstDescendant(Lcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)Lcom/android/apksig/SigningCertificateLineage;
    .locals 7
    .param p1, "parent"    # Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
    .param p2, "signerCapabilities"    # Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "parent",
            "signerCapabilities"
        }
    .end annotation

    .line 442
    iget-object v0, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 448
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/apksig/SigningCertificateLineage;->getSignatureAlgorithm(Lcom/android/apksig/SigningCertificateLineage$SignerConfig;)Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    .line 452
    nop

    .line 455
    new-instance v0, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;

    .line 456
    invoke-virtual {p1}, Lcom/android/apksig/SigningCertificateLineage$SignerConfig;->getCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v1, 0x0

    new-array v5, v1, [B

    invoke-static {p2}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->access$000(Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)I

    move-result v6

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;-><init>(Ljava/security/cert/X509Certificate;Lcom/android/apksig/internal/apk/SignatureAlgorithm;Lcom/android/apksig/internal/apk/SignatureAlgorithm;[BI)V

    .line 457
    .local v0, "firstNode":Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    new-instance v1, Lcom/android/apksig/SigningCertificateLineage;

    iget v2, p0, Lcom/android/apksig/SigningCertificateLineage;->mMinSdkVersion:I

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/android/apksig/SigningCertificateLineage;-><init>(ILjava/util/List;)V

    return-object v1

    .line 449
    .end local v0    # "firstNode":Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    :catch_0
    move-exception v0

    .line 450
    .local v0, "e":Ljava/security/InvalidKeyException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Algorithm associated with first signing certificate invalid on desired platform versions"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 443
    .end local v0    # "e":Ljava/security/InvalidKeyException;
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "SigningCertificateLineage already has its first node"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private write()Ljava/nio/ByteBuffer;
    .locals 4

    .line 513
    iget-object v0, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    .line 514
    invoke-static {v0}, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage;->encodeSigningCertificateLineage(Ljava/util/List;)[B

    move-result-object v0

    .line 515
    .local v0, "encodedLineage":[B
    array-length v1, v0

    add-int/lit8 v1, v1, 0xc

    .line 516
    .local v1, "payloadSize":I
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 517
    .local v2, "result":Ljava/nio/ByteBuffer;
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 518
    const v3, 0x3eff39d1

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 519
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 520
    array-length v3, v0

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 521
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 522
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 523
    return-object v2
.end method


# virtual methods
.method public encodeSigningCertificateLineage()[B
    .locals 1

    .line 527
    iget-object v0, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-static {v0}, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage;->encodeSigningCertificateLineage(Ljava/util/List;)[B

    move-result-object v0

    return-object v0
.end method

.method public getBytes()[B
    .locals 1

    .line 313
    invoke-direct {p0}, Lcom/android/apksig/SigningCertificateLineage;->write()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    return-object v0
.end method

.method public getCertificatesInLineage()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation

    .line 623
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 624
    .local v0, "certs":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 625
    iget-object v2, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;

    iget-object v2, v2, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->signingCert:Ljava/security/cert/X509Certificate;

    .line 626
    .local v2, "cert":Ljava/security/cert/X509Certificate;
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 624
    .end local v2    # "cert":Ljava/security/cert/X509Certificate;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 628
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method public getSignerCapabilities(Lcom/android/apksig/SigningCertificateLineage$SignerConfig;)Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    .locals 2
    .param p1, "config"    # Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "config"
        }
    .end annotation

    .line 562
    if-eqz p1, :cond_0

    .line 566
    invoke-virtual {p1}, Lcom/android/apksig/SigningCertificateLineage$SignerConfig;->getCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v0

    .line 567
    .local v0, "cert":Ljava/security/cert/X509Certificate;
    invoke-virtual {p0, v0}, Lcom/android/apksig/SigningCertificateLineage;->getSignerCapabilities(Ljava/security/cert/X509Certificate;)Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    move-result-object v1

    return-object v1

    .line 563
    .end local v0    # "cert":Ljava/security/cert/X509Certificate;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "config == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSignerCapabilities(Ljava/security/cert/X509Certificate;)Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    .locals 4
    .param p1, "cert"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cert"
        }
    .end annotation

    .line 575
    if-eqz p1, :cond_2

    .line 579
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 580
    iget-object v1, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;

    .line 581
    .local v1, "lineageNode":Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    iget-object v2, v1, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->signingCert:Ljava/security/cert/X509Certificate;

    invoke-virtual {v2, p1}, Ljava/security/cert/X509Certificate;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 582
    iget v2, v1, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->flags:I

    .line 583
    .local v2, "flags":I
    new-instance v3, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;

    invoke-direct {v3, v2}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;-><init>(I)V

    invoke-virtual {v3}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->build()Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    move-result-object v3

    return-object v3

    .line 579
    .end local v1    # "lineageNode":Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    .end local v2    # "flags":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 588
    .end local v0    # "i":I
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Certificate ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") not found in the SigningCertificateLineage"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 576
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "cert == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getSubLineage(Ljava/security/cert/X509Certificate;)Lcom/android/apksig/SigningCertificateLineage;
    .locals 7
    .param p1, "x509Certificate"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "x509Certificate"
        }
    .end annotation

    .line 677
    if-eqz p1, :cond_2

    .line 680
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 681
    iget-object v1, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;

    iget-object v1, v1, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->signingCert:Ljava/security/cert/X509Certificate;

    invoke-virtual {v1, p1}, Ljava/security/cert/X509Certificate;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 682
    new-instance v1, Lcom/android/apksig/SigningCertificateLineage;

    iget v2, p0, Lcom/android/apksig/SigningCertificateLineage;->mMinSdkVersion:I

    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    add-int/lit8 v5, v0, 0x1

    .line 683
    const/4 v6, 0x0

    invoke-interface {v4, v6, v5}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {v1, v2, v3}, Lcom/android/apksig/SigningCertificateLineage;-><init>(ILjava/util/List;)V

    .line 682
    return-object v1

    .line 680
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 688
    .end local v0    # "i":I
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Certificate not found in SigningCertificateLineage"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 678
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "x509Certificate == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isCertificateInLineage(Ljava/security/cert/X509Certificate;)Z
    .locals 2
    .param p1, "cert"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cert"
        }
    .end annotation

    .line 647
    if-eqz p1, :cond_2

    .line 651
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 652
    iget-object v1, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;

    iget-object v1, v1, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->signingCert:Ljava/security/cert/X509Certificate;

    invoke-virtual {v1, p1}, Ljava/security/cert/X509Certificate;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 653
    const/4 v1, 0x1

    return v1

    .line 651
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 656
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    return v0

    .line 648
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "cert == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isSignerInLineage(Lcom/android/apksig/SigningCertificateLineage$SignerConfig;)Z
    .locals 2
    .param p1, "config"    # Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "config"
        }
    .end annotation

    .line 635
    if-eqz p1, :cond_0

    .line 639
    invoke-virtual {p1}, Lcom/android/apksig/SigningCertificateLineage$SignerConfig;->getCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v0

    .line 640
    .local v0, "cert":Ljava/security/cert/X509Certificate;
    invoke-virtual {p0, v0}, Lcom/android/apksig/SigningCertificateLineage;->isCertificateInLineage(Ljava/security/cert/X509Certificate;)Z

    move-result v1

    return v1

    .line 636
    .end local v0    # "cert":Ljava/security/cert/X509Certificate;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "config == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public size()I
    .locals 1

    .line 426
    iget-object v0, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public sortSignerConfigs(Ljava/util/List;)Ljava/util/List;
    .locals 7
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
            "Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;",
            ">;"
        }
    .end annotation

    .line 532
    .local p1, "signerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;>;"
    if-eqz p1, :cond_4

    .line 539
    new-instance v0, Ljava/util/ArrayList;

    .line 540
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 541
    .local v0, "sortedSignerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 542
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 543
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    .line 544
    .local v3, "config":Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    iget-object v4, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;

    iget-object v4, v4, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->signingCert:Ljava/security/cert/X509Certificate;

    invoke-virtual {v3}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->getCertificates()Ljava/util/List;

    move-result-object v5

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/security/cert/X509Certificate;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 545
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 546
    goto :goto_2

    .line 542
    .end local v3    # "config":Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 541
    .end local v2    # "j":I
    :cond_1
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 550
    .end local v1    # "i":I
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ne v1, v2, :cond_3

    .line 554
    return-object v0

    .line 551
    :cond_3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "SignerConfigs supplied which are not present in the SigningCertificateLineage"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 533
    .end local v0    # "sortedSignerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;>;"
    :cond_4
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "signerConfigs == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public spawnDescendant(Lcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerConfig;)Lcom/android/apksig/SigningCertificateLineage;
    .locals 2
    .param p1, "parent"    # Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
    .param p2, "child"    # Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "parent",
            "child"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 342
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 345
    new-instance v0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;

    invoke-direct {v0}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->build()Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    move-result-object v0

    .line 346
    .local v0, "signerCapabilities":Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/apksig/SigningCertificateLineage;->spawnDescendant(Lcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v1

    return-object v1

    .line 343
    .end local v0    # "signerCapabilities":Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "can\'t add new descendant to lineage with null inputs"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public spawnDescendant(Lcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)Lcom/android/apksig/SigningCertificateLineage;
    .locals 18
    .param p1, "parent"    # Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
    .param p2, "child"    # Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
    .param p3, "childCapabilities"    # Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "parent",
            "child",
            "childCapabilities"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 361
    move-object/from16 v0, p0

    if-eqz p1, :cond_4

    .line 364
    if-eqz p2, :cond_3

    .line 367
    if-eqz p3, :cond_2

    .line 370
    iget-object v1, v0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 376
    iget-object v1, v0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;

    .line 377
    .local v1, "currentGeneration":Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    iget-object v2, v1, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->signingCert:Ljava/security/cert/X509Certificate;

    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v2

    .line 378
    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/SigningCertificateLineage$SignerConfig;->getCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v4

    invoke-virtual {v4}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v4

    .line 377
    invoke-static {v2, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 385
    invoke-direct/range {p0 .. p1}, Lcom/android/apksig/SigningCertificateLineage;->getSignatureAlgorithm(Lcom/android/apksig/SigningCertificateLineage$SignerConfig;)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v2

    .line 386
    .local v2, "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    nop

    .line 388
    invoke-virtual/range {p2 .. p2}, Lcom/android/apksig/SigningCertificateLineage$SignerConfig;->getCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v4

    invoke-virtual {v2}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getId()I

    move-result v5

    .line 387
    invoke-static {v4, v5}, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage;->encodeSignedData(Ljava/security/cert/X509Certificate;I)[B

    move-result-object v4

    .line 386
    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 389
    .local v4, "prefixedSignedData":Ljava/nio/ByteBuffer;
    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 390
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 391
    .local v5, "signedDataBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {v5, v4}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 392
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v6

    .line 395
    .local v6, "signedData":[B
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, v3}, Ljava/util/ArrayList;-><init>(I)V

    move-object v3, v7

    .line 396
    .local v3, "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/SigningCertificateLineage$SignerConfig;->getCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v7

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 397
    new-instance v7, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    invoke-direct {v7}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;-><init>()V

    .line 399
    .local v7, "newSignerConfig":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    invoke-virtual/range {p1 .. p1}, Lcom/android/apksig/SigningCertificateLineage$SignerConfig;->getPrivateKey()Ljava/security/PrivateKey;

    move-result-object v8

    iput-object v8, v7, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->privateKey:Ljava/security/PrivateKey;

    .line 400
    iput-object v3, v7, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    .line 401
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    iput-object v8, v7, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->signatureAlgorithms:Ljava/util/List;

    .line 404
    nop

    .line 405
    invoke-static {v7, v6}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->generateSignaturesOverData(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;[B)Ljava/util/List;

    move-result-object v8

    .line 408
    .local v8, "signatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    const/4 v9, 0x0

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/apksig/internal/util/Pair;

    invoke-virtual {v10}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-static {v10}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->findById(I)Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    move-result-object v10

    .line 409
    .local v10, "sigAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/apksig/internal/util/Pair;

    invoke-virtual {v9}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [B

    .line 410
    .local v9, "signature":[B
    iput-object v10, v1, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->sigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    .line 411
    new-instance v17, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;

    .line 413
    invoke-virtual/range {p2 .. p2}, Lcom/android/apksig/SigningCertificateLineage$SignerConfig;->getCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v12

    const/4 v14, 0x0

    .line 414
    invoke-static/range {p3 .. p3}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->access$000(Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)I

    move-result v16

    move-object/from16 v11, v17

    move-object v13, v10

    move-object v15, v9

    invoke-direct/range {v11 .. v16}, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;-><init>(Ljava/security/cert/X509Certificate;Lcom/android/apksig/internal/apk/SignatureAlgorithm;Lcom/android/apksig/internal/apk/SignatureAlgorithm;[BI)V

    .line 415
    .local v11, "childNode":Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    new-instance v12, Ljava/util/ArrayList;

    iget-object v13, v0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-direct {v12, v13}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 416
    .local v12, "lineageCopy":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    invoke-interface {v12, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 417
    new-instance v13, Lcom/android/apksig/SigningCertificateLineage;

    iget v14, v0, Lcom/android/apksig/SigningCertificateLineage;->mMinSdkVersion:I

    invoke-direct {v13, v14, v12}, Lcom/android/apksig/SigningCertificateLineage;-><init>(ILjava/util/List;)V

    return-object v13

    .line 379
    .end local v2    # "signatureAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v3    # "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .end local v4    # "prefixedSignedData":Ljava/nio/ByteBuffer;
    .end local v5    # "signedDataBuffer":Ljava/nio/ByteBuffer;
    .end local v6    # "signedData":[B
    .end local v7    # "newSignerConfig":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .end local v8    # "signatures":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/Integer;[B>;>;"
    .end local v9    # "signature":[B
    .end local v10    # "sigAlgorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v11    # "childNode":Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    .end local v12    # "lineageCopy":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;>;"
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "SignerConfig Certificate containing private key to sign the new SigningCertificateLineage record does not match the existing most recent record"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 371
    .end local v1    # "currentGeneration":Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Cannot spawn descendant signing certificate on an empty SigningCertificateLineage: no parent node"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 368
    :cond_2
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "childCapabilities == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 365
    :cond_3
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "child == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 362
    :cond_4
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "parent == null"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public updateSignerCapabilities(Lcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)V
    .locals 6
    .param p1, "config"    # Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
    .param p2, "capabilities"    # Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "config",
            "capabilities"
        }
    .end annotation

    .line 598
    if-eqz p1, :cond_2

    .line 602
    invoke-virtual {p1}, Lcom/android/apksig/SigningCertificateLineage$SignerConfig;->getCertificate()Ljava/security/cert/X509Certificate;

    move-result-object v0

    .line 603
    .local v0, "cert":Ljava/security/cert/X509Certificate;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 604
    iget-object v2, p0, Lcom/android/apksig/SigningCertificateLineage;->mSigningLineage:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;

    .line 605
    .local v2, "lineageNode":Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    iget-object v3, v2, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->signingCert:Ljava/security/cert/X509Certificate;

    invoke-virtual {v3, v0}, Ljava/security/cert/X509Certificate;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 606
    iget v3, v2, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->flags:I

    .line 607
    .local v3, "flags":I
    new-instance v4, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;

    invoke-direct {v4, v3}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;-><init>(I)V

    .line 608
    invoke-virtual {v4, p2}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->setCallerConfiguredCapabilities(Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->build()Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    move-result-object v4

    .line 609
    .local v4, "newCapabilities":Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    invoke-static {v4}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->access$000(Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)I

    move-result v5

    iput v5, v2, Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;->flags:I

    .line 610
    return-void

    .line 603
    .end local v2    # "lineageNode":Lcom/android/apksig/internal/apk/v3/V3SigningCertificateLineage$SigningCertificateNode;
    .end local v3    # "flags":I
    .end local v4    # "newCapabilities":Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 615
    .end local v1    # "i":I
    :cond_1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Certificate ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") not found in the SigningCertificateLineage"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 599
    .end local v0    # "cert":Ljava/security/cert/X509Certificate;
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "config == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public writeToDataSink(Lcom/android/apksig/util/DataSink;)V
    .locals 2
    .param p1, "dataSink"    # Lcom/android/apksig/util/DataSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dataSink"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 325
    if-eqz p1, :cond_0

    .line 328
    invoke-direct {p0}, Lcom/android/apksig/SigningCertificateLineage;->write()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/android/apksig/util/DataSink;->consume(Ljava/nio/ByteBuffer;)V

    .line 329
    return-void

    .line 326
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "dataSink == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public writeToFile(Ljava/io/File;)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "file"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 317
    if-eqz p1, :cond_0

    .line 320
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "rw"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 321
    .local v0, "outputFile":Ljava/io/RandomAccessFile;
    new-instance v1, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;

    invoke-direct {v1, v0}, Lcom/android/apksig/internal/util/RandomAccessFileDataSink;-><init>(Ljava/io/RandomAccessFile;)V

    invoke-virtual {p0, v1}, Lcom/android/apksig/SigningCertificateLineage;->writeToDataSink(Lcom/android/apksig/util/DataSink;)V

    .line 322
    return-void

    .line 318
    .end local v0    # "outputFile":Ljava/io/RandomAccessFile;
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "file == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
