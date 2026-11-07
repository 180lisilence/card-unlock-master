.class public Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;
.super Ljava/lang/Object;
.source "ApkVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/ApkVerifier$Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "V1SchemeSignerInfo"
.end annotation


# instance fields
.field private final mCertChain:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
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

.field private final mName:Ljava/lang/String;

.field private final mSignatureBlockFileName:Ljava/lang/String;

.field private final mSignatureFileName:Ljava/lang/String;

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
.method private constructor <init>(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;)V
    .locals 1
    .param p1, "result"    # Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "result"
        }
    .end annotation

    .line 1431
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1432
    iget-object v0, p1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mName:Ljava/lang/String;

    .line 1433
    iget-object v0, p1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->certChain:Ljava/util/List;

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mCertChain:Ljava/util/List;

    .line 1434
    iget-object v0, p1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->signatureBlockFileName:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mSignatureBlockFileName:Ljava/lang/String;

    .line 1435
    iget-object v0, p1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->signatureFileName:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mSignatureFileName:Ljava/lang/String;

    .line 1436
    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->getErrors()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mErrors:Ljava/util/List;

    .line 1437
    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;->getWarnings()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mWarnings:Ljava/util/List;

    .line 1438
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;
    .param p2, "x1"    # Lcom/android/apksig/ApkVerifier$1;

    .line 1422
    invoke-direct {p0, p1}, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;-><init>(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;

    .line 1422
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mErrors:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;
    .param p1, "x1"    # Lcom/android/apksig/ApkVerifier$Issue;
    .param p2, "x2"    # [Ljava/lang/Object;

    .line 1422
    invoke-direct {p0, p1, p2}, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$600(Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;

    .line 1422
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mCertChain:Ljava/util/List;

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

    .line 1507
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mErrors:Ljava/util/List;

    new-instance v1, Lcom/android/apksig/ApkVerifier$IssueWithParams;

    invoke-direct {v1, p1, p2}, Lcom/android/apksig/ApkVerifier$IssueWithParams;-><init>(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1508
    return-void
.end method


# virtual methods
.method public containsErrors()Z
    .locals 1

    .line 1487
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getCertificate()Ljava/security/cert/X509Certificate;
    .locals 2

    .line 1469
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mCertChain:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mCertChain:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    :goto_0
    return-object v0
.end method

.method public getCertificateChain()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation

    .line 1479
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mCertChain:Ljava/util/List;

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

    .line 1495
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mErrors:Ljava/util/List;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 1444
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getSignatureBlockFileName()Ljava/lang/String;
    .locals 1

    .line 1451
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mSignatureBlockFileName:Ljava/lang/String;

    return-object v0
.end method

.method public getSignatureFileName()Ljava/lang/String;
    .locals 1

    .line 1458
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mSignatureFileName:Ljava/lang/String;

    return-object v0
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

    .line 1503
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->mWarnings:Ljava/util/List;

    return-object v0
.end method
