.class public Lcom/android/apksig/internal/apk/ApkSigResult;
.super Ljava/lang/Object;
.source "ApkSigResult.java"


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

.field public final mSigners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSignerInfo;",
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

.field public final signatureSchemeVersion:I

.field public verified:Z


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "signatureSchemeVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signatureSchemeVersion"
        }
    .end annotation

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigResult;->mSigners:Ljava/util/List;

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigResult;->mWarnings:Ljava/util/List;

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigResult;->mErrors:Ljava/util/List;

    .line 38
    iput p1, p0, Lcom/android/apksig/internal/apk/ApkSigResult;->signatureSchemeVersion:I

    .line 39
    return-void
.end method


# virtual methods
.method public varargs addError(I[Ljava/lang/Object;)V
    .locals 2
    .param p1, "issueId"    # I
    .param p2, "parameters"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "issueId",
            "parameters"
        }
    .end annotation

    .line 80
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigResult;->mErrors:Ljava/util/List;

    new-instance v1, Lcom/android/apksig/ApkVerificationIssue;

    invoke-direct {v1, p1, p2}, Lcom/android/apksig/ApkVerificationIssue;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    return-void
.end method

.method public varargs addWarning(I[Ljava/lang/Object;)V
    .locals 2
    .param p1, "issueId"    # I
    .param p2, "parameters"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "issueId",
            "parameters"
        }
    .end annotation

    .line 88
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigResult;->mWarnings:Ljava/util/List;

    new-instance v1, Lcom/android/apksig/ApkVerificationIssue;

    invoke-direct {v1, p1, p2}, Lcom/android/apksig/ApkVerificationIssue;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    return-void
.end method

.method public containsErrors()Z
    .locals 4

    .line 45
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigResult;->mErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 46
    return v1

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigResult;->mSigners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 49
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigResult;->mSigners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/ApkSignerInfo;

    .line 50
    .local v2, "signer":Lcom/android/apksig/internal/apk/ApkSignerInfo;
    invoke-virtual {v2}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->containsErrors()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 51
    return v1

    .line 53
    .end local v2    # "signer":Lcom/android/apksig/internal/apk/ApkSignerInfo;
    :cond_1
    goto :goto_0

    .line 55
    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method public containsWarnings()Z
    .locals 4

    .line 62
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigResult;->mWarnings:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 63
    return v1

    .line 65
    :cond_0
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigResult;->mSigners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 66
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigResult;->mSigners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/ApkSignerInfo;

    .line 67
    .local v2, "signer":Lcom/android/apksig/internal/apk/ApkSignerInfo;
    invoke-virtual {v2}, Lcom/android/apksig/internal/apk/ApkSignerInfo;->containsWarnings()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 68
    return v1

    .line 70
    .end local v2    # "signer":Lcom/android/apksig/internal/apk/ApkSignerInfo;
    :cond_1
    goto :goto_0

    .line 72
    :cond_2
    const/4 v0, 0x0

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

    .line 95
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigResult;->mErrors:Ljava/util/List;

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

    .line 102
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigResult;->mWarnings:Ljava/util/List;

    return-object v0
.end method
