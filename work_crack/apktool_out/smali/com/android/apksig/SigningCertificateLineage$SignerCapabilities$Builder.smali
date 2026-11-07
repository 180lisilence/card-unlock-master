.class public Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;
.super Ljava/lang/Object;
.source "SigningCertificateLineage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mCallerConfiguredFlags:I

.field private mFlags:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 822
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 823
    invoke-static {}, Lcom/android/apksig/SigningCertificateLineage;->access$100()I

    move-result v0

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    .line 824
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "flags"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "flags"
        }
    .end annotation

    .line 830
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 831
    iput p1, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    .line 832
    return-void
.end method


# virtual methods
.method public build()Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    .locals 4

    .line 946
    new-instance v0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    iget v1, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    iget v2, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mCallerConfiguredFlags:I

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;-><init>(IILcom/android/apksig/SigningCertificateLineage$1;)V

    return-object v0
.end method

.method public setAuth(Z)Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;
    .locals 1
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "enabled"
        }
    .end annotation

    .line 916
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mCallerConfiguredFlags:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mCallerConfiguredFlags:I

    .line 917
    if-eqz p1, :cond_0

    .line 918
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    goto :goto_0

    .line 920
    :cond_0
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    .line 922
    :goto_0
    return-object p0
.end method

.method public setCallerConfiguredCapabilities(Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;
    .locals 3
    .param p1, "capabilities"    # Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "capabilities"
        }
    .end annotation

    .line 936
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    invoke-static {p1}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->access$200(Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)I

    move-result v1

    not-int v1, v1

    and-int/2addr v0, v1

    .line 937
    invoke-static {p1}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->access$300(Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)I

    move-result v1

    invoke-static {p1}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;->access$200(Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)I

    move-result v2

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    .line 938
    return-object p0
.end method

.method public setInstalledData(Z)Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;
    .locals 1
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "enabled"
        }
    .end annotation

    .line 845
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mCallerConfiguredFlags:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mCallerConfiguredFlags:I

    .line 846
    if-eqz p1, :cond_0

    .line 847
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    goto :goto_0

    .line 849
    :cond_0
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    .line 851
    :goto_0
    return-object p0
.end method

.method public setPermission(Z)Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;
    .locals 1
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "enabled"
        }
    .end annotation

    .line 881
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mCallerConfiguredFlags:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mCallerConfiguredFlags:I

    .line 882
    if-eqz p1, :cond_0

    .line 883
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    goto :goto_0

    .line 885
    :cond_0
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    .line 887
    :goto_0
    return-object p0
.end method

.method public setRollback(Z)Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;
    .locals 1
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "enabled"
        }
    .end annotation

    .line 901
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mCallerConfiguredFlags:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mCallerConfiguredFlags:I

    .line 902
    if-eqz p1, :cond_0

    .line 903
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    goto :goto_0

    .line 905
    :cond_0
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    .line 907
    :goto_0
    return-object p0
.end method

.method public setSharedUid(Z)Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;
    .locals 1
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "enabled"
        }
    .end annotation

    .line 862
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mCallerConfiguredFlags:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mCallerConfiguredFlags:I

    .line 863
    if-eqz p1, :cond_0

    .line 864
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    goto :goto_0

    .line 866
    :cond_0
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->mFlags:I

    .line 868
    :goto_0
    return-object p0
.end method
