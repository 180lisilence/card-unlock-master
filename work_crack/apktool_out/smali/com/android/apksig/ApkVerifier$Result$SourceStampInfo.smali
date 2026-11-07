.class public Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;
.super Ljava/lang/Object;
.source "ApkVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/ApkVerifier$Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SourceStampInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;
    }
.end annotation


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
            "Lcom/android/apksig/ApkVerifier$IssueWithParams;",
            ">;"
        }
    .end annotation
.end field

.field private final mInfoMessages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$IssueWithParams;",
            ">;"
        }
    .end annotation
.end field

.field private final mSourceStampVerificationStatus:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

.field private final mTimestamp:J

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
.method constructor <init>(Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;)V
    .locals 2
    .param p1, "sourceStampVerificationStatus"    # Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sourceStampVerificationStatus"
        }
    .end annotation

    .line 1794
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1795
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mCertificates:Ljava/util/List;

    .line 1796
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mCertificateLineage:Ljava/util/List;

    .line 1797
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mErrors:Ljava/util/List;

    .line 1798
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mWarnings:Ljava/util/List;

    .line 1799
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mInfoMessages:Ljava/util/List;

    .line 1800
    iput-object p1, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mSourceStampVerificationStatus:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

    .line 1801
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mTimestamp:J

    .line 1802
    return-void
.end method

.method private constructor <init>(Lcom/android/apksig/internal/apk/ApkSignerInfo;)V
    .locals 3
    .param p1, "result"    # Lcom/android/apksig/internal/apk/ApkSignerInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "result"
        }
    .end annotation

    .line 1776
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1777
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSignerInfo;->certs:Ljava/util/List;

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mCertificates:Ljava/util/List;

    .line 1778
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSignerInfo;->certificateLineage:Ljava/util/List;

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mCertificateLineage:Ljava/util/List;

    .line 1779
    nop

    .line 1780
    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->getErrors()Ljava/util/List;

    move-result-object v0

    .line 1779
    invoke-static {v0}, Lcom/android/apksig/ApkVerifier$ApkVerificationIssueAdapter;->getIssuesFromVerificationIssues(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mErrors:Ljava/util/List;

    .line 1781
    nop

    .line 1782
    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->getWarnings()Ljava/util/List;

    move-result-object v1

    .line 1781
    invoke-static {v1}, Lcom/android/apksig/ApkVerifier$ApkVerificationIssueAdapter;->getIssuesFromVerificationIssues(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mWarnings:Ljava/util/List;

    .line 1783
    nop

    .line 1784
    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->getInfoMessages()Ljava/util/List;

    move-result-object v2

    .line 1783
    invoke-static {v2}, Lcom/android/apksig/ApkVerifier$ApkVerificationIssueAdapter;->getIssuesFromVerificationIssues(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    iput-object v2, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mInfoMessages:Ljava/util/List;

    .line 1785
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1786
    sget-object v0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;->STAMP_VERIFIED:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mSourceStampVerificationStatus:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

    goto :goto_0

    .line 1788
    :cond_0
    sget-object v0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;->STAMP_VERIFICATION_FAILED:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mSourceStampVerificationStatus:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

    .line 1791
    :goto_0
    iget-wide v0, p1, Lcom/android/apksig/internal/apk/ApkSignerInfo;->timestamp:J

    iput-wide v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mTimestamp:J

    .line 1792
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/apksig/internal/apk/ApkSignerInfo;Lcom/android/apksig/ApkVerifier$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/apksig/internal/apk/ApkSignerInfo;
    .param p2, "x1"    # Lcom/android/apksig/ApkVerifier$1;

    .line 1749
    invoke-direct {p0, p1}, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;-><init>(Lcom/android/apksig/internal/apk/ApkSignerInfo;)V

    return-void
.end method


# virtual methods
.method public containsErrors()Z
    .locals 1

    .line 1823
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public containsInfoMessages()Z
    .locals 1

    .line 1831
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mInfoMessages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getCertificate()Ljava/security/cert/X509Certificate;
    .locals 2

    .line 1812
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mCertificates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mCertificates:Ljava/util/List;

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

    .line 1819
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mCertificateLineage:Ljava/util/List;

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

    .line 1835
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mErrors:Ljava/util/List;

    return-object v0
.end method

.method public getInfoMessages()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$IssueWithParams;",
            ">;"
        }
    .end annotation

    .line 1847
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mInfoMessages:Ljava/util/List;

    return-object v0
.end method

.method public getSourceStampVerificationStatus()Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;
    .locals 1

    .line 1855
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mSourceStampVerificationStatus:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo$SourceStampVerificationStatus;

    return-object v0
.end method

.method public getTimestampEpochSeconds()J
    .locals 2

    .line 1863
    iget-wide v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mTimestamp:J

    return-wide v0
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

    .line 1839
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->mWarnings:Ljava/util/List;

    return-object v0
.end method
