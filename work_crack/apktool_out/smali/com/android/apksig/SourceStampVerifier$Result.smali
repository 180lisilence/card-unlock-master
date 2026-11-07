.class public Lcom/android/apksig/SourceStampVerifier$Result;
.super Ljava/lang/Object;
.source "SourceStampVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/SourceStampVerifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Result"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;,
        Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;
    }
.end annotation


# instance fields
.field private final mAllSchemeSigners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;",
            ">;>;"
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

.field private mSourceStampInfo:Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;

.field private final mV1SchemeSigners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mV2SchemeSigners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mV3SchemeSigners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mVerified:Z

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
    .locals 5

    .line 505
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 506
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mV1SchemeSigners:Ljava/util/List;

    .line 507
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mV2SchemeSigners:Ljava/util/List;

    .line 508
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mV3SchemeSigners:Ljava/util/List;

    .line 509
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/util/List;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mAllSchemeSigners:Ljava/util/List;

    .line 513
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mErrors:Ljava/util/List;

    .line 514
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mWarnings:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/android/apksig/SourceStampVerifier$Result;Lcom/android/apksig/internal/apk/ApkSigResult;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/apksig/SourceStampVerifier$Result;
    .param p1, "x1"    # Lcom/android/apksig/internal/apk/ApkSigResult;

    .line 505
    invoke-direct {p0, p1}, Lcom/android/apksig/SourceStampVerifier$Result;->mergeFrom(Lcom/android/apksig/internal/apk/ApkSigResult;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/apksig/SourceStampVerifier$Result;Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/apksig/SourceStampVerifier$Result;
    .param p1, "x1"    # Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;

    .line 505
    invoke-direct {p0, p1}, Lcom/android/apksig/SourceStampVerifier$Result;->addV2Signer(Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/apksig/SourceStampVerifier$Result;Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/apksig/SourceStampVerifier$Result;
    .param p1, "x1"    # Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;

    .line 505
    invoke-direct {p0, p1}, Lcom/android/apksig/SourceStampVerifier$Result;->addV3Signer(Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/apksig/SourceStampVerifier$Result;Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/apksig/SourceStampVerifier$Result;
    .param p1, "x1"    # Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;

    .line 505
    invoke-direct {p0, p1}, Lcom/android/apksig/SourceStampVerifier$Result;->addV1Signer(Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;)V

    return-void
.end method

.method private addV1Signer(Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;)V
    .locals 1
    .param p1, "signerInfo"    # Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signerInfo"
        }
    .end annotation

    .line 527
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mV1SchemeSigners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 528
    return-void
.end method

.method private addV2Signer(Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;)V
    .locals 1
    .param p1, "signerInfo"    # Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signerInfo"
        }
    .end annotation

    .line 531
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mV2SchemeSigners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 532
    return-void
.end method

.method private addV3Signer(Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;)V
    .locals 1
    .param p1, "signerInfo"    # Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signerInfo"
        }
    .end annotation

    .line 535
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mV3SchemeSigners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 536
    return-void
.end method

.method private mergeFrom(Lcom/android/apksig/internal/apk/ApkSigResult;)V
    .locals 3
    .param p1, "source"    # Lcom/android/apksig/internal/apk/ApkSigResult;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "source"
        }
    .end annotation

    .line 546
    iget v0, p1, Lcom/android/apksig/internal/apk/ApkSigResult;->signatureSchemeVersion:I

    packed-switch v0, :pswitch_data_0

    .line 554
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ApkSigResult Signing Block Scheme Id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/android/apksig/internal/apk/ApkSigResult;->signatureSchemeVersion:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 548
    :pswitch_0
    iget-boolean v0, p1, Lcom/android/apksig/internal/apk/ApkSigResult;->verified:Z

    iput-boolean v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mVerified:Z

    .line 549
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigResult;->mSigners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 550
    new-instance v0, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;

    iget-object v1, p1, Lcom/android/apksig/internal/apk/ApkSigResult;->mSigners:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/apk/ApkSignerInfo;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;-><init>(Lcom/android/apksig/internal/apk/ApkSignerInfo;Lcom/android/apksig/SourceStampVerifier$1;)V

    iput-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mSourceStampInfo:Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;

    .line 558
    :cond_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
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

    .line 519
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mErrors:Ljava/util/List;

    new-instance v1, Lcom/android/apksig/ApkVerificationIssue;

    invoke-direct {v1, p1, p2}, Lcom/android/apksig/ApkVerificationIssue;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 520
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

    .line 523
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mWarnings:Ljava/util/List;

    new-instance v1, Lcom/android/apksig/ApkVerificationIssue;

    invoke-direct {v1, p1, p2}, Lcom/android/apksig/ApkVerificationIssue;-><init>(I[Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 524
    return-void
.end method

.method public containsErrors()Z
    .locals 6

    .line 599
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 600
    return v1

    .line 602
    :cond_0
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mAllSchemeSigners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 603
    .local v2, "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;

    .line 604
    .local v4, "signer":Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    invoke-virtual {v4}, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->containsErrors()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 605
    return v1

    .line 607
    .end local v4    # "signer":Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    :cond_1
    goto :goto_1

    .line 608
    .end local v2    # "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;>;"
    :cond_2
    goto :goto_0

    .line 609
    :cond_3
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mSourceStampInfo:Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;

    if-eqz v0, :cond_4

    .line 610
    invoke-virtual {v0}, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->containsErrors()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 611
    return v1

    .line 614
    :cond_4
    const/4 v0, 0x0

    return v0
.end method

.method public getAllErrors()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerificationIssue;",
            ">;"
        }
    .end annotation

    .line 636
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 637
    .local v0, "errors":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerificationIssue;>;"
    iget-object v1, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mErrors:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 639
    iget-object v1, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mAllSchemeSigners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 640
    .local v2, "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;

    .line 641
    .local v4, "signer":Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    invoke-virtual {v4}, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->getErrors()Ljava/util/List;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 642
    .end local v4    # "signer":Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    goto :goto_1

    .line 643
    .end local v2    # "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;>;"
    :cond_0
    goto :goto_0

    .line 644
    :cond_1
    iget-object v1, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mSourceStampInfo:Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;

    if-eqz v1, :cond_2

    .line 645
    invoke-virtual {v1}, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->getErrors()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 647
    :cond_2
    return-object v0
.end method

.method public getAllWarnings()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerificationIssue;",
            ">;"
        }
    .end annotation

    .line 655
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 656
    .local v0, "warnings":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerificationIssue;>;"
    iget-object v1, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mWarnings:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 658
    iget-object v1, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mAllSchemeSigners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 659
    .local v2, "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;

    .line 660
    .local v4, "signer":Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    invoke-virtual {v4}, Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;->getWarnings()Ljava/util/List;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 661
    .end local v4    # "signer":Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;
    goto :goto_1

    .line 662
    .end local v2    # "signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;>;"
    :cond_0
    goto :goto_0

    .line 663
    :cond_1
    iget-object v1, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mSourceStampInfo:Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;

    if-eqz v1, :cond_2

    .line 664
    invoke-virtual {v1}, Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;->getWarnings()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 666
    :cond_2
    return-object v0
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

    .line 621
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mErrors:Ljava/util/List;

    return-object v0
.end method

.method public getSourceStampInfo()Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;
    .locals 1

    .line 590
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mSourceStampInfo:Lcom/android/apksig/SourceStampVerifier$Result$SourceStampInfo;

    return-object v0
.end method

.method public getV1SchemeSigners()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;",
            ">;"
        }
    .end annotation

    .line 565
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mV1SchemeSigners:Ljava/util/List;

    return-object v0
.end method

.method public getV2SchemeSigners()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;",
            ">;"
        }
    .end annotation

    .line 573
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mV2SchemeSigners:Ljava/util/List;

    return-object v0
.end method

.method public getV3SchemeSigners()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/SourceStampVerifier$Result$SignerInfo;",
            ">;"
        }
    .end annotation

    .line 581
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mV3SchemeSigners:Ljava/util/List;

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

    .line 628
    iget-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mWarnings:Ljava/util/List;

    return-object v0
.end method

.method public isVerified()Z
    .locals 1

    .line 542
    iget-boolean v0, p0, Lcom/android/apksig/SourceStampVerifier$Result;->mVerified:Z

    return v0
.end method
