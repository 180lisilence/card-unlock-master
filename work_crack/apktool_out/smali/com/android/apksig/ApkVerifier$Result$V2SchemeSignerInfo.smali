.class public Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;
.super Ljava/lang/Object;
.source "ApkVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/ApkVerifier$Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "V2SchemeSignerInfo"
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
    .locals 1
    .param p1, "result"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "result"
        }
    .end annotation

    .line 1523
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1524
    iget v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->index:I

    iput v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mIndex:I

    .line 1525
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->certs:Ljava/util/List;

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mCerts:Ljava/util/List;

    .line 1526
    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->getErrors()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mErrors:Ljava/util/List;

    .line 1527
    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->getWarnings()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mWarnings:Ljava/util/List;

    .line 1528
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;->contentDigests:Ljava/util/List;

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mContentDigests:Ljava/util/List;

    .line 1529
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    .param p2, "x1"    # Lcom/android/apksig/ApkVerifier$1;

    .line 1514
    invoke-direct {p0, p1}, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;-><init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;

    .line 1514
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mErrors:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$500(Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;
    .param p1, "x1"    # Lcom/android/apksig/ApkVerifier$Issue;
    .param p2, "x2"    # [Ljava/lang/Object;

    .line 1514
    invoke-direct {p0, p1, p2}, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;

    .line 1514
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mCerts:Ljava/util/List;

    return-object v0
.end method

.method private varargs addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V
    .locals 2
    .param p1, "msg"    # Lcom/android/apksig/ApkVerifier$Issue;
    .param p2, "parameters"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "msg",
            "parameters"
        }
    .end annotation

    .line 1560
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mErrors:Ljava/util/List;

    new-instance v1, Lcom/android/apksig/ApkVerifier$IssueWithParams;

    invoke-direct {v1, p1, p2}, Lcom/android/apksig/ApkVerifier$IssueWithParams;-><init>(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1561
    return-void
.end method


# virtual methods
.method public containsErrors()Z
    .locals 1

    .line 1564
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getCertificate()Ljava/security/cert/X509Certificate;
    .locals 2

    .line 1547
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mCerts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mCerts:Ljava/util/List;

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

    .line 1556
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mCerts:Ljava/util/List;

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

    .line 1576
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mContentDigests:Ljava/util/List;

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

    .line 1568
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mErrors:Ljava/util/List;

    return-object v0
.end method

.method public getIndex()I
    .locals 1

    .line 1536
    iget v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mIndex:I

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

    .line 1572
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->mWarnings:Ljava/util/List;

    return-object v0
.end method
