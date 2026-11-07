.class public Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;
.super Ljava/lang/Object;
.source "ApkVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/ApkVerifier$Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "V3SchemeSignerInfo"
.end annotation


# instance fields
.field private final mCerts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation
.end field

.field private final mContentDigests:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;",
            ">;"
        }
    .end annotation
.end field

.field private final mErrors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$IssueWithParams;",
            ">;"
        }
    .end annotation
.end field

.field private final mIndex:I

.field private final mMaxSdkVersion:I

.field private final mMinSdkVersion:I

.field private final mRotationTargetsDevRelease:Z

.field private final mWarnings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$IssueWithParams;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;)V
    .locals 2
    .param p1, "result"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "result"
        }
    .end annotation

    .line 1595
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1596
    iget v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->index:I

    iput v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mIndex:I

    .line 1597
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->certs:Ljava/util/List;

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mCerts:Ljava/util/List;

    .line 1598
    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->getErrors()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mErrors:Ljava/util/List;

    .line 1599
    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->getWarnings()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mWarnings:Ljava/util/List;

    .line 1600
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->contentDigests:Ljava/util/List;

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mContentDigests:Ljava/util/List;

    .line 1601
    iget v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->minSdkVersion:I

    iput v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mMinSdkVersion:I

    .line 1602
    iget v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->maxSdkVersion:I

    iput v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mMaxSdkVersion:I

    .line 1603
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->additionalAttributes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo$$ExternalSyntheticLambda0;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    move-result-object v0

    new-instance v1, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo$$ExternalSyntheticLambda1;-><init>()V

    .line 1604
    invoke-interface {v0, v1}, Ljava/util/stream/IntStream;->anyMatch(Ljava/util/function/IntPredicate;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mRotationTargetsDevRelease:Z

    .line 1606
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    .param p2, "x1"    # Lcom/android/apksig/ApkVerifier$1;

    .line 1583
    invoke-direct {p0, p1}, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;-><init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;

    .line 1583
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mErrors:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;

    .line 1583
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mCerts:Ljava/util/List;

    return-object v0
.end method

.method static synthetic lambda$new$0(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$AdditionalAttribute;)I
    .locals 1
    .param p0, "attribute"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$AdditionalAttribute;

    .line 1604
    invoke-virtual {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$AdditionalAttribute;->getId()I

    move-result v0

    return v0
.end method

.method static synthetic lambda$new$1(I)Z
    .locals 1
    .param p0, "attrId"    # I

    .line 1605
    const v0, -0x3d594c46

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public containsErrors()Z
    .locals 1

    .line 1637
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getCertificate()Ljava/security/cert/X509Certificate;
    .locals 2

    .line 1624
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mCerts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mCerts:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    :goto_0
    return-object v0
.end method

.method public getCertificates()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation

    .line 1633
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mCerts:Ljava/util/List;

    return-object v0
.end method

.method public getContentDigests()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo$ContentDigest;",
            ">;"
        }
    .end annotation

    .line 1649
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mContentDigests:Ljava/util/List;

    return-object v0
.end method

.method public getErrors()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$IssueWithParams;",
            ">;"
        }
    .end annotation

    .line 1641
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mErrors:Ljava/util/List;

    return-object v0
.end method

.method public getIndex()I
    .locals 1

    .line 1613
    iget v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mIndex:I

    return v0
.end method

.method public getMaxSdkVersion()I
    .locals 1

    .line 1663
    iget v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mMaxSdkVersion:I

    return v0
.end method

.method public getMinSdkVersion()I
    .locals 1

    .line 1656
    iget v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mMinSdkVersion:I

    return v0
.end method

.method public getRotationTargetsDevRelease()Z
    .locals 1

    .line 1676
    iget-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mRotationTargetsDevRelease:Z

    return v0
.end method

.method public getWarnings()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$IssueWithParams;",
            ">;"
        }
    .end annotation

    .line 1645
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->mWarnings:Ljava/util/List;

    return-object v0
.end method
