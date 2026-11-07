.class public Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
.super Ljava/lang/Object;
.source "SigningCertificateLineage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/SigningCertificateLineage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SignerCapabilities"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;
    }
.end annotation


# instance fields
.field private final mCallerConfiguredFlags:I

.field private final mFlags:I


# direct methods
.method private constructor <init>(I)V
    .locals 1
    .param p1, "flags"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "flags"
        }
    .end annotation

    .line 756
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;-><init>(II)V

    .line 757
    return-void
.end method

.method private constructor <init>(II)V
    .locals 0
    .param p1, "flags"    # I
    .param p2, "callerConfiguredFlags"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "flags",
            "callerConfiguredFlags"
        }
    .end annotation

    .line 759
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 760
    iput p1, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->mFlags:I

    .line 761
    iput p2, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->mCallerConfiguredFlags:I

    .line 762
    return-void
.end method

.method synthetic constructor <init>(IILcom/android/apksig/SigningCertificateLineage$1;)V
    .locals 0
    .param p1, "x0"    # I
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/android/apksig/SigningCertificateLineage$1;

    .line 750
    invoke-direct {p0, p1, p2}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;-><init>(II)V

    return-void
.end method

.method static synthetic access$000(Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    .line 750
    invoke-direct {p0}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->getFlags()I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    .line 750
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->mCallerConfiguredFlags:I

    return v0
.end method

.method static synthetic access$300(Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    .line 750
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->mFlags:I

    return v0
.end method

.method private getFlags()I
    .locals 1

    .line 765
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->mFlags:I

    return v0
.end method


# virtual methods
.method public equals(Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)Z
    .locals 2
    .param p1, "other"    # Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "other"
        }
    .end annotation

    .line 773
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->mFlags:I

    iget v1, p1, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->mFlags:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasAuth()Z
    .locals 1

    .line 808
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->mFlags:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasInstalledData()Z
    .locals 2

    .line 780
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->mFlags:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public hasPermission()Z
    .locals 1

    .line 794
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->mFlags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasRollback()Z
    .locals 1

    .line 801
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->mFlags:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasSharedUid()Z
    .locals 1

    .line 787
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->mFlags:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
