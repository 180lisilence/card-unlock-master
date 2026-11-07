.class public Lcom/android/apksig/internal/apk/ApkSignerInfo;
.super Ljava/lang/Object;
.source "ApkSignerInfo.java"


# instance fields
.field public certificateLineage:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation
.end field

.field public certs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation
.end field

.field public index:I

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

.field private final mWarnings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerificationIssue;",
            ">;"
        }
    .end annotation
.end field

.field public timestamp:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/internal/apk/ApkSignerInfo;->certs:Ljava/util/List;

    .line 32
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/internal/apk/ApkSignerInfo;->certificateLineage:Ljava/util/List;

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/internal/apk/ApkSignerInfo;->mInfoMessages:Ljava/util/List;

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/internal/apk/ApkSignerInfo;->mWarnings:Ljava/util/List;

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/internal/apk/ApkSignerInfo;->mErrors:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public varargs addError(I[Ljava/lang/Object;)V
    .locals 2
    .param p1, "issueId"    # I
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "issueId",
            "params"
        }
    .end annotation

    .line 43
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSignerInfo;->mErrors:Ljava/util/List;

    new-instance v1, Lcom/android/apksig/ApkVerificationIssue;

    invoke-direct {v1, p1, p2}, Lcom/android/apksig/ApkVerificationIssue;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    return-void
.end method

.method public varargs addInfoMessage(I[Ljava/lang/Object;)V
    .locals 2
    .param p1, "issueId"    # I
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "issueId",
            "params"
        }
    .end annotation

    .line 59
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSignerInfo;->mInfoMessages:Ljava/util/List;

    new-instance v1, Lcom/android/apksig/ApkVerificationIssue;

    invoke-direct {v1, p1, p2}, Lcom/android/apksig/ApkVerificationIssue;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    return-void
.end method

.method public varargs addWarning(I[Ljava/lang/Object;)V
    .locals 2
    .param p1, "issueId"    # I
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "issueId",
            "params"
        }
    .end annotation

    .line 51
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSignerInfo;->mWarnings:Ljava/util/List;

    new-instance v1, Lcom/android/apksig/ApkVerificationIssue;

    invoke-direct {v1, p1, p2}, Lcom/android/apksig/ApkVerificationIssue;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    return-void
.end method

.method public containsErrors()Z
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSignerInfo;->mErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public containsInfoMessages()Z
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSignerInfo;->mInfoMessages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public containsWarnings()Z
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSignerInfo;->mWarnings:Ljava/util/List;

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
            "+",
            "Lcom/android/apksig/ApkVerificationIssue;",
            ">;"
        }
    .end annotation

    .line 88
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSignerInfo;->mErrors:Ljava/util/List;

    return-object v0
.end method

.method public getInfoMessages()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/android/apksig/ApkVerificationIssue;",
            ">;"
        }
    .end annotation

    .line 102
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSignerInfo;->mInfoMessages:Ljava/util/List;

    return-object v0
.end method

.method public getWarnings()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/android/apksig/ApkVerificationIssue;",
            ">;"
        }
    .end annotation

    .line 95
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSignerInfo;->mWarnings:Ljava/util/List;

    return-object v0
.end method
