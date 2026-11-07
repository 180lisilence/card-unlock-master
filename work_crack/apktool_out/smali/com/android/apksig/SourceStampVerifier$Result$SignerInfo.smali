.class public Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
.super Ljava/lang/Object;
.source "SourceStampVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/SourceStampVerifier$Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SignerInfo"
.end annotation


# instance fields
.field private final mErrors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerificationIssue;",
            ">;"
        }
    .end annotation
.end field

.field private mSigningCertificate:Ljava/security/cert/X509Certificate;

.field private final mWarnings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerificationIssue;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 673
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 675
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->mErrors:Ljava/util/List;

    .line 676
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->mWarnings:Ljava/util/List;

    return-void
.end method


# virtual methods
.method varargs addVerificationError(I[Ljava/lang/Object;)V
    .locals 2
    .param p1, "errorId"    # I
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "errorId",
            "params"
        }
    .end annotation

    .line 683
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->mErrors:Ljava/util/List;

    new-instance v1, Lcom/android/apksig/ApkVerificationIssue;

    invoke-direct {v1, p1, p2}, Lcom/android/apksig/ApkVerificationIssue;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 684
    return-void
.end method

.method varargs addVerificationWarning(I[Ljava/lang/Object;)V
    .locals 2
    .param p1, "warningId"    # I
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "warningId",
            "params"
        }
    .end annotation

    .line 687
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->mWarnings:Ljava/util/List;

    new-instance v1, Lcom/android/apksig/ApkVerificationIssue;

    invoke-direct {v1, p1, p2}, Lcom/android/apksig/ApkVerificationIssue;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 688
    return-void
.end method

.method public containsErrors()Z
    .locals 1

    .line 718
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->mErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getErrors()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerificationIssue;",
            ">;"
        }
    .end annotation

    .line 702
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->mErrors:Ljava/util/List;

    return-object v0
.end method

.method public getSigningCertificate()Ljava/security/cert/X509Certificate;
    .locals 1

    .line 694
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->mSigningCertificate:Ljava/security/cert/X509Certificate;

    return-object v0
.end method

.method public getWarnings()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerificationIssue;",
            ">;"
        }
    .end annotation

    .line 710
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->mWarnings:Ljava/util/List;

    return-object v0
.end method

.method setSigningCertificate(Ljava/security/cert/X509Certificate;)V
    .locals 0
    .param p1, "signingCertificate"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signingCertificate"
        }
    .end annotation

    .line 679
    iput-object p1, p0, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->mSigningCertificate:Ljava/security/cert/X509Certificate;

    .line 680
    return-void
.end method
