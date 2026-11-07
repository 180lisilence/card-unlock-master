.class public Lcom/android/apksig/DefaultApkSignerEngine$Builder;
.super Ljava/lang/Object;
.source "DefaultApkSignerEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/DefaultApkSignerEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mCreatedBy:Ljava/lang/String;

.field private mDebuggableApkPermitted:Z

.field private final mMinSdkVersion:I

.field private mOtherSignersSignaturesPreserved:Z

.field private mRotationMinSdkVersion:I

.field private mRotationTargetsDevRelease:Z

.field private mSignerConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;",
            ">;"
        }
    .end annotation
.end field

.field private mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

.field private mSourceStampSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

.field private mSourceStampTimestampEnabled:Z

.field private mStampSignerConfig:Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

.field private mV1SigningEnabled:Z

.field private mV2SigningEnabled:Z

.field private mV3SigningEnabled:Z

.field private mV3SigningExplicitlyDisabled:Z

.field private mV3SigningExplicitlyEnabled:Z

.field private mVerityEnabled:Z


# direct methods
.method public constructor <init>(Ljava/util/List;I)V
    .locals 3
    .param p2, "minSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "signerConfigs",
            "minSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;",
            ">;I)V"
        }
    .end annotation

    .line 1763
    .local p1, "signerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1729
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mSourceStampTimestampEnabled:Z

    .line 1732
    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV1SigningEnabled:Z

    .line 1733
    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV2SigningEnabled:Z

    .line 1734
    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningEnabled:Z

    .line 1735
    const/16 v1, 0x21

    iput v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mRotationMinSdkVersion:I

    .line 1736
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mRotationTargetsDevRelease:Z

    .line 1737
    iput-boolean v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mVerityEnabled:Z

    .line 1738
    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mDebuggableApkPermitted:Z

    .line 1740
    const-string v2, "1.0 (Android)"

    iput-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mCreatedBy:Ljava/lang/String;

    .line 1750
    iput-boolean v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningExplicitlyDisabled:Z

    .line 1751
    iput-boolean v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningExplicitlyEnabled:Z

    .line 1764
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1767
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, v0, :cond_0

    .line 1771
    iput-boolean v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningEnabled:Z

    .line 1773
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mSignerConfigs:Ljava/util/List;

    .line 1774
    iput p2, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mMinSdkVersion:I

    .line 1775
    return-void

    .line 1765
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "At least one signer config must be provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public build()Lcom/android/apksig/DefaultApkSignerEngine;
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 1783
    move-object/from16 v1, p0

    iget-boolean v0, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningExplicitlyDisabled:Z

    if-eqz v0, :cond_1

    iget-boolean v2, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningExplicitlyEnabled:Z

    if-nez v2, :cond_0

    goto :goto_0

    .line 1784
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Builder configured to both enable and disable APK Signature Scheme v3 signing"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1788
    :cond_1
    :goto_0
    const/4 v2, 0x1

    if-eqz v0, :cond_2

    .line 1789
    const/4 v0, 0x0

    iput-boolean v0, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningEnabled:Z

    goto :goto_1

    .line 1790
    :cond_2
    iget-boolean v0, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningExplicitlyEnabled:Z

    if-eqz v0, :cond_3

    .line 1791
    iput-boolean v2, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningEnabled:Z

    .line 1795
    :cond_3
    :goto_1
    iget-object v0, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    if-eqz v0, :cond_6

    .line 1797
    :try_start_0
    iget-object v3, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mSignerConfigs:Ljava/util/List;

    invoke-virtual {v0, v3}, Lcom/android/apksig/SigningCertificateLineage;->sortSignerConfigs(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mSignerConfigs:Ljava/util/List;

    .line 1798
    iget-boolean v3, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningEnabled:Z

    if-nez v3, :cond_5

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gt v0, v2, :cond_4

    goto :goto_2

    .line 1803
    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Provided multiple signers which are part of the SigningCertificateLineage, but not signing with APK Signature Scheme v3"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1813
    :cond_5
    :goto_2
    goto :goto_3

    .line 1808
    :catch_0
    move-exception v0

    .line 1809
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Provided signer configs do not match the provided SigningCertificateLineage"

    invoke-direct {v2, v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 1814
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :cond_6
    iget-boolean v0, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningEnabled:Z

    if-eqz v0, :cond_8

    iget-object v0, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mSignerConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gt v0, v2, :cond_7

    goto :goto_3

    .line 1815
    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "Multiple signing certificates provided for use with APK Signature Scheme v3 without an accompanying SigningCertificateLineage"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1820
    :cond_8
    :goto_3
    new-instance v0, Lcom/android/apksig/DefaultApkSignerEngine;

    move-object v3, v0

    iget-object v4, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mSignerConfigs:Ljava/util/List;

    iget-object v5, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mStampSignerConfig:Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    iget-object v6, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mSourceStampSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    iget-boolean v7, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mSourceStampTimestampEnabled:Z

    iget v8, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mMinSdkVersion:I

    iget v9, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mRotationMinSdkVersion:I

    iget-boolean v10, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mRotationTargetsDevRelease:Z

    iget-boolean v11, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV1SigningEnabled:Z

    iget-boolean v12, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV2SigningEnabled:Z

    iget-boolean v13, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningEnabled:Z

    iget-boolean v14, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mVerityEnabled:Z

    iget-boolean v15, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mDebuggableApkPermitted:Z

    iget-boolean v2, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mOtherSignersSignaturesPreserved:Z

    move/from16 v16, v2

    iget-object v2, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mCreatedBy:Ljava/lang/String;

    move-object/from16 v17, v2

    iget-object v2, v1, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    move-object/from16 v18, v2

    const/16 v19, 0x0

    invoke-direct/range {v3 .. v19}, Lcom/android/apksig/DefaultApkSignerEngine;-><init>(Ljava/util/List;Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;Lcom/android/apksig/SigningCertificateLineage;ZIIZZZZZZZLjava/lang/String;Lcom/android/apksig/SigningCertificateLineage;Lcom/android/apksig/DefaultApkSignerEngine$1;)V

    return-object v0
.end method

.method public setCreatedBy(Ljava/lang/String;)Lcom/android/apksig/DefaultApkSignerEngine$Builder;
    .locals 1
    .param p1, "createdBy"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "createdBy"
        }
    .end annotation

    .line 1939
    if-eqz p1, :cond_0

    .line 1942
    iput-object p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mCreatedBy:Ljava/lang/String;

    .line 1943
    return-object p0

    .line 1940
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
.end method

.method public setDebuggableApkPermitted(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;
    .locals 0
    .param p1, "permitted"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "permitted"
        }
    .end annotation

    .line 1922
    iput-boolean p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mDebuggableApkPermitted:Z

    .line 1923
    return-object p0
.end method

.method public setMinSdkVersionForRotation(I)Lcom/android/apksig/DefaultApkSignerEngine$Builder;
    .locals 1
    .param p1, "minSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "minSdkVersion"
        }
    .end annotation

    .line 1976
    const/16 v0, 0x21

    if-ge p1, v0, :cond_0

    .line 1977
    const/16 v0, 0x1c

    iput v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mRotationMinSdkVersion:I

    goto :goto_0

    .line 1979
    :cond_0
    iput p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mRotationMinSdkVersion:I

    .line 1981
    :goto_0
    return-object p0
.end method

.method public setOtherSignersSignaturesPreserved(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;
    .locals 0
    .param p1, "preserved"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "preserved"
        }
    .end annotation

    .line 1933
    iput-boolean p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mOtherSignersSignaturesPreserved:Z

    .line 1934
    return-object p0
.end method

.method public setRotationTargetsDevRelease(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;
    .locals 0
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "enabled"
        }
    .end annotation

    .line 2000
    iput-boolean p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mRotationTargetsDevRelease:Z

    .line 2001
    return-object p0
.end method

.method public setSigningCertificateLineage(Lcom/android/apksig/SigningCertificateLineage;)Lcom/android/apksig/DefaultApkSignerEngine$Builder;
    .locals 1
    .param p1, "signingCertificateLineage"    # Lcom/android/apksig/SigningCertificateLineage;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signingCertificateLineage"
        }
    .end annotation

    .line 1953
    if-eqz p1, :cond_0

    .line 1954
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningEnabled:Z

    .line 1955
    iput-object p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    .line 1957
    :cond_0
    return-object p0
.end method

.method public setSourceStampSigningCertificateLineage(Lcom/android/apksig/SigningCertificateLineage;)Lcom/android/apksig/DefaultApkSignerEngine$Builder;
    .locals 0
    .param p1, "sourceStampSigningCertificateLineage"    # Lcom/android/apksig/SigningCertificateLineage;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sourceStampSigningCertificateLineage"
        }
    .end annotation

    .line 1850
    iput-object p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mSourceStampSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    .line 1851
    return-object p0
.end method

.method public setSourceStampTimestampEnabled(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;
    .locals 0
    .param p1, "value"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 1859
    iput-boolean p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mSourceStampTimestampEnabled:Z

    .line 1860
    return-object p0
.end method

.method public setStampSignerConfig(Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;)Lcom/android/apksig/DefaultApkSignerEngine$Builder;
    .locals 0
    .param p1, "stampSignerConfig"    # Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stampSignerConfig"
        }
    .end annotation

    .line 1840
    iput-object p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mStampSignerConfig:Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    .line 1841
    return-object p0
.end method

.method public setV1SigningEnabled(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;
    .locals 0
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "enabled"
        }
    .end annotation

    .line 1869
    iput-boolean p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV1SigningEnabled:Z

    .line 1870
    return-object p0
.end method

.method public setV2SigningEnabled(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;
    .locals 0
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "enabled"
        }
    .end annotation

    .line 1880
    iput-boolean p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV2SigningEnabled:Z

    .line 1881
    return-object p0
.end method

.method public setV3SigningEnabled(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;
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

    .line 1891
    iput-boolean p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningEnabled:Z

    .line 1892
    const/4 v0, 0x1

    if-eqz p1, :cond_0

    .line 1893
    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningExplicitlyEnabled:Z

    goto :goto_0

    .line 1895
    :cond_0
    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mV3SigningExplicitlyDisabled:Z

    .line 1897
    :goto_0
    return-object p0
.end method

.method public setVerityEnabled(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;
    .locals 0
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "enabled"
        }
    .end annotation

    .line 1908
    iput-boolean p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->mVerityEnabled:Z

    .line 1909
    return-object p0
.end method
