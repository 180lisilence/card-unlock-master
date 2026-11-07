.class public Lcom/android/apksig/SigningCertificateLineage$Builder;
.super Ljava/lang/Object;
.source "SigningCertificateLineage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/SigningCertificateLineage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mMinSdkVersion:I

.field private mNewCapabilities:Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

.field private final mNewSignerConfig:Lcom/android/apksig/SigningCertificateLineage$SignerConfig;

.field private mOriginalCapabilities:Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

.field private final mOriginalSignerConfig:Lcom/android/apksig/SigningCertificateLineage$SignerConfig;


# direct methods
.method public constructor <init>(Lcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerConfig;)V
    .locals 2
    .param p1, "originalSignerConfig"    # Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
    .param p2, "newSignerConfig"    # Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "originalSignerConfig",
            "newSignerConfig"
        }
    .end annotation

    .line 1033
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1034
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 1038
    iput-object p1, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mOriginalSignerConfig:Lcom/android/apksig/SigningCertificateLineage$SignerConfig;

    .line 1039
    iput-object p2, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mNewSignerConfig:Lcom/android/apksig/SigningCertificateLineage$SignerConfig;

    .line 1040
    return-void

    .line 1035
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Can\'t pass null SignerConfigs when constructing a new SigningCertificateLineage"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public build()Lcom/android/apksig/SigningCertificateLineage;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateEncodingException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 1089
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mMinSdkVersion:I

    const/16 v1, 0x1c

    if-ge v0, v1, :cond_0

    .line 1090
    iput v1, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mMinSdkVersion:I

    .line 1093
    :cond_0
    iget-object v0, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mOriginalCapabilities:Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    if-nez v0, :cond_1

    .line 1094
    new-instance v0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;

    invoke-direct {v0}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->build()Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mOriginalCapabilities:Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    .line 1097
    :cond_1
    iget-object v0, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mNewCapabilities:Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    if-nez v0, :cond_2

    .line 1098
    new-instance v0, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;

    invoke-direct {v0}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities$Builder;->build()Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mNewCapabilities:Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    .line 1101
    :cond_2
    iget v0, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mMinSdkVersion:I

    iget-object v1, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mOriginalSignerConfig:Lcom/android/apksig/SigningCertificateLineage$SignerConfig;

    iget-object v2, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mOriginalCapabilities:Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    iget-object v3, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mNewSignerConfig:Lcom/android/apksig/SigningCertificateLineage$SignerConfig;

    iget-object v4, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mNewCapabilities:Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/apksig/SigningCertificateLineage;->access$600(ILcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;Lcom/android/apksig/SigningCertificateLineage$SignerConfig;Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v0

    return-object v0
.end method

.method public setMinSdkVersion(I)Lcom/android/apksig/SigningCertificateLineage$Builder;
    .locals 0
    .param p1, "minSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "minSdkVersion"
        }
    .end annotation

    .line 1053
    iput p1, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mMinSdkVersion:I

    .line 1054
    return-object p0
.end method

.method public setNewCapabilities(Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)Lcom/android/apksig/SigningCertificateLineage$Builder;
    .locals 2
    .param p1, "signerCapabilities"    # Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signerCapabilities"
        }
    .end annotation

    .line 1079
    if-eqz p1, :cond_0

    .line 1082
    iput-object p1, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mNewCapabilities:Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    .line 1083
    return-object p0

    .line 1080
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "signerCapabilities == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setOriginalCapabilities(Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;)Lcom/android/apksig/SigningCertificateLineage$Builder;
    .locals 2
    .param p1, "signerCapabilities"    # Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signerCapabilities"
        }
    .end annotation

    .line 1063
    if-eqz p1, :cond_0

    .line 1066
    iput-object p1, p0, Lcom/android/apksig/SigningCertificateLineage$Builder;->mOriginalCapabilities:Lcom/android/apksig/SigningCertificateLineage$SignerCapabilities;

    .line 1067
    return-object p0

    .line 1064
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "signerCapabilities == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
