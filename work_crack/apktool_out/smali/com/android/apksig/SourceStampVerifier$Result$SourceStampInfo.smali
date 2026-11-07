.class public Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;
.super Ljava/lang/Object;
.source "SourceStampVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/SourceStampVerifier$Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SourceStampInfo"
.end annotation


# static fields
.field private static final mWarningsAsErrors:Z = true


# instance fields
.field private final mCertificateLineage:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation
.end field

.field private final mCertificates:Ljava/util/List;
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
            "Lcom/android/apksig/ApkVerificationIssue;",
            ">;"
        }
    .end annotation
.end field

.field private final mInfoMessages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerificationIssue;",
            ">;"
        }
    .end annotation
.end field

.field private final mTimestamp:J

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
.method private constructor <init>(Lcom/android/apksig/internal/apk/ApkSignerInfo;)V
    .locals 4
    .param p1, "result"    # Lcom/android/apksig/internal/apk/ApkSignerInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "result"
        }
    .end annotation

    .line 745
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 730
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mErrors:Ljava/util/List;

    .line 731
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mWarnings:Ljava/util/List;

    .line 732
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mInfoMessages:Ljava/util/List;

    .line 746
    iget-object v3, p1, Lcom/android/apksig/internal/apk/ApkSignerInfo;->certs:Ljava/util/List;

    iput-object v3, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mCertificates:Ljava/util/List;

    .line 747
    iget-object v3, p1, Lcom/android/apksig/internal/apk/ApkSignerInfo;->certificateLineage:Ljava/util/List;

    iput-object v3, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mCertificateLineage:Ljava/util/List;

    .line 748
    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->getErrors()Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 749
    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->getWarnings()Ljava/util/List;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 750
    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->getInfoMessages()Ljava/util/List;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 751
    iget-wide v0, p1, Lcom/android/apksig/internal/apk/ApkSignerInfo;->timestamp:J

    iput-wide v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mTimestamp:J

    .line 752
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/apksig/internal/apk/ApkSignerInfo;Lcom/android/apksig/SourceStampVerifier$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/apksig/internal/apk/ApkSignerInfo;
    .param p2, "x1"    # Lcom/android/apksig/SourceStampVerifier$1;

    .line 726
    invoke-direct {p0, p1}, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;-><init>(Lcom/android/apksig/internal/apk/ApkSignerInfo;)V

    return-void
.end method


# virtual methods
.method public containsErrors()Z
    .locals 1

    .line 778
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mWarnings:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public containsInfoMessages()Z
    .locals 1

    .line 786
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mInfoMessages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getCertificate()Ljava/security/cert/X509Certificate;
    .locals 2

    .line 762
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mCertificates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mCertificates:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    :goto_0
    return-object v0
.end method

.method public getCertificatesInLineage()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation

    .line 771
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mCertificateLineage:Ljava/util/List;

    return-object v0
.end method

.method public getErrors()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerificationIssue;",
            ">;"
        }
    .end annotation

    .line 797
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 798
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerificationIssue;>;"
    iget-object v1, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mErrors:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 799
    iget-object v1, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mWarnings:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 800
    return-object v0
.end method

.method public getInfoMessages()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerificationIssue;",
            ">;"
        }
    .end annotation

    .line 816
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mInfoMessages:Ljava/util/List;

    return-object v0
.end method

.method public getTimestampEpochSeconds()J
    .locals 2

    .line 824
    iget-wide v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mTimestamp:J

    return-wide v0
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

    .line 808
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->mWarnings:Ljava/util/List;

    return-object v0
.end method
