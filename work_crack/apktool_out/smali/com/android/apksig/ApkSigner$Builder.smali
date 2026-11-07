.class public Lcom/android/apksig/ApkSigner$Builder;
.super Ljava/lang/Object;
.source "ApkSigner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/ApkSigner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mAlignFileSize:Z

.field private mCreatedBy:Ljava/lang/String;

.field private mDebuggableApkPermitted:Z

.field private mForceSourceStampOverwrite:Z

.field private mInputApkDataSource:Lcom/android/apksig/util/DataSource;

.field private mInputApkFile:Ljava/io/File;

.field private mMinSdkVersion:Ljava/lang/Integer;

.field private mOtherSignersSignaturesPreserved:Z

.field private mOutputApkDataSink:Lcom/android/apksig/util/DataSink;

.field private mOutputApkDataSource:Lcom/android/apksig/util/DataSource;

.field private mOutputApkFile:Ljava/io/File;

.field private mOutputV4File:Ljava/io/File;

.field private mRotationMinSdkVersion:I

.field private mRotationTargetsDevRelease:Z

.field private final mSignerConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkSigner$SignerConfig;",
            ">;"
        }
    .end annotation
.end field

.field private final mSignerEngine:Lcom/android/apksig/ApkSignerEngine;

.field private mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

.field private mSourceStampSignerConfig:Lcom/android/apksig/ApkSigner$SignerConfig;

.field private mSourceStampSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

.field private mSourceStampTimestampEnabled:Z

.field private mV1SigningEnabled:Z

.field private mV2SigningEnabled:Z

.field private mV3SigningEnabled:Z

.field private mV3SigningExplicitlyDisabled:Z

.field private mV3SigningExplicitlyEnabled:Z

.field private mV4ErrorReportingEnabled:Z

.field private mV4SigningEnabled:Z

.field private mVerityEnabled:Z


# direct methods
.method public constructor <init>(Lcom/android/apksig/ApkSignerEngine;)V
    .locals 2
    .param p1, "signerEngine"    # Lcom/android/apksig/ApkSignerEngine;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signerEngine"
        }
    .end annotation

    .line 1202
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1134
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mForceSourceStampOverwrite:Z

    .line 1135
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/apksig/ApkSigner$Builder;->mSourceStampTimestampEnabled:Z

    .line 1136
    iput-boolean v1, p0, Lcom/android/apksig/ApkSigner$Builder;->mV1SigningEnabled:Z

    .line 1137
    iput-boolean v1, p0, Lcom/android/apksig/ApkSigner$Builder;->mV2SigningEnabled:Z

    .line 1138
    iput-boolean v1, p0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningEnabled:Z

    .line 1139
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mV4SigningEnabled:Z

    .line 1140
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mAlignFileSize:Z

    .line 1141
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mVerityEnabled:Z

    .line 1142
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mV4ErrorReportingEnabled:Z

    .line 1143
    iput-boolean v1, p0, Lcom/android/apksig/ApkSigner$Builder;->mDebuggableApkPermitted:Z

    .line 1147
    const/16 v1, 0x21

    iput v1, p0, Lcom/android/apksig/ApkSigner$Builder;->mRotationMinSdkVersion:I

    .line 1148
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mRotationTargetsDevRelease:Z

    .line 1169
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningExplicitlyDisabled:Z

    .line 1170
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningExplicitlyEnabled:Z

    .line 1203
    if-eqz p1, :cond_0

    .line 1206
    iput-object p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mSignerEngine:Lcom/android/apksig/ApkSignerEngine;

    .line 1207
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mSignerConfigs:Ljava/util/List;

    .line 1208
    return-void

    .line 1204
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "signerEngine == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signerConfigs"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkSigner$SignerConfig;",
            ">;)V"
        }
    .end annotation

    .line 1182
    .local p1, "signerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkSigner$SignerConfig;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1134
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mForceSourceStampOverwrite:Z

    .line 1135
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/apksig/ApkSigner$Builder;->mSourceStampTimestampEnabled:Z

    .line 1136
    iput-boolean v1, p0, Lcom/android/apksig/ApkSigner$Builder;->mV1SigningEnabled:Z

    .line 1137
    iput-boolean v1, p0, Lcom/android/apksig/ApkSigner$Builder;->mV2SigningEnabled:Z

    .line 1138
    iput-boolean v1, p0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningEnabled:Z

    .line 1139
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mV4SigningEnabled:Z

    .line 1140
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mAlignFileSize:Z

    .line 1141
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mVerityEnabled:Z

    .line 1142
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mV4ErrorReportingEnabled:Z

    .line 1143
    iput-boolean v1, p0, Lcom/android/apksig/ApkSigner$Builder;->mDebuggableApkPermitted:Z

    .line 1147
    const/16 v2, 0x21

    iput v2, p0, Lcom/android/apksig/ApkSigner$Builder;->mRotationMinSdkVersion:I

    .line 1148
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mRotationTargetsDevRelease:Z

    .line 1169
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningExplicitlyDisabled:Z

    .line 1170
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningExplicitlyEnabled:Z

    .line 1183
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1186
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, v1, :cond_0

    .line 1190
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningEnabled:Z

    .line 1192
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mSignerConfigs:Ljava/util/List;

    .line 1193
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mSignerEngine:Lcom/android/apksig/ApkSignerEngine;

    .line 1194
    return-void

    .line 1184
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "At least one signer config must be provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private checkInitializedWithoutEngine()V
    .locals 2

    .line 1611
    iget-object v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mSignerEngine:Lcom/android/apksig/ApkSignerEngine;

    if-nez v0, :cond_0

    .line 1615
    return-void

    .line 1612
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Operation is not available when builder initialized with an engine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public build()Lcom/android/apksig/ApkSigner;
    .locals 31

    .line 1636
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningExplicitlyDisabled:Z

    if-eqz v1, :cond_1

    iget-boolean v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningExplicitlyEnabled:Z

    if-nez v2, :cond_0

    goto :goto_0

    .line 1637
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Builder configured to both enable and disable APK Signature Scheme v3 signing"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1642
    :cond_1
    :goto_0
    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 1643
    iput-boolean v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningEnabled:Z

    .line 1646
    :cond_2
    iget-boolean v1, v0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningExplicitlyEnabled:Z

    if-eqz v1, :cond_3

    .line 1647
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningEnabled:Z

    .line 1652
    :cond_3
    iget-boolean v1, v0, Lcom/android/apksig/ApkSigner$Builder;->mV4SigningEnabled:Z

    if-eqz v1, :cond_5

    iget-boolean v1, v0, Lcom/android/apksig/ApkSigner$Builder;->mV2SigningEnabled:Z

    if-nez v1, :cond_5

    iget-boolean v1, v0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningEnabled:Z

    if-nez v1, :cond_5

    .line 1653
    iget-boolean v1, v0, Lcom/android/apksig/ApkSigner$Builder;->mV4ErrorReportingEnabled:Z

    if-nez v1, :cond_4

    .line 1654
    iput-boolean v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mV4SigningEnabled:Z

    goto :goto_1

    .line 1656
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "APK Signature Scheme v4 signing requires at least v2 or v3 signing to be enabled"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1664
    :cond_5
    :goto_1
    new-instance v1, Lcom/android/apksig/ApkSigner;

    move-object v3, v1

    iget-object v4, v0, Lcom/android/apksig/ApkSigner$Builder;->mSignerConfigs:Ljava/util/List;

    iget-object v5, v0, Lcom/android/apksig/ApkSigner$Builder;->mSourceStampSignerConfig:Lcom/android/apksig/ApkSigner$SignerConfig;

    iget-object v6, v0, Lcom/android/apksig/ApkSigner$Builder;->mSourceStampSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    iget-boolean v7, v0, Lcom/android/apksig/ApkSigner$Builder;->mForceSourceStampOverwrite:Z

    iget-boolean v8, v0, Lcom/android/apksig/ApkSigner$Builder;->mSourceStampTimestampEnabled:Z

    iget-object v9, v0, Lcom/android/apksig/ApkSigner$Builder;->mMinSdkVersion:Ljava/lang/Integer;

    iget v10, v0, Lcom/android/apksig/ApkSigner$Builder;->mRotationMinSdkVersion:I

    iget-boolean v11, v0, Lcom/android/apksig/ApkSigner$Builder;->mRotationTargetsDevRelease:Z

    iget-boolean v12, v0, Lcom/android/apksig/ApkSigner$Builder;->mV1SigningEnabled:Z

    iget-boolean v13, v0, Lcom/android/apksig/ApkSigner$Builder;->mV2SigningEnabled:Z

    iget-boolean v14, v0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningEnabled:Z

    iget-boolean v15, v0, Lcom/android/apksig/ApkSigner$Builder;->mV4SigningEnabled:Z

    iget-boolean v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mAlignFileSize:Z

    move/from16 v16, v2

    iget-boolean v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mVerityEnabled:Z

    move/from16 v17, v2

    iget-boolean v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mV4ErrorReportingEnabled:Z

    move/from16 v18, v2

    iget-boolean v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mDebuggableApkPermitted:Z

    move/from16 v19, v2

    iget-boolean v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mOtherSignersSignaturesPreserved:Z

    move/from16 v20, v2

    iget-object v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mCreatedBy:Ljava/lang/String;

    move-object/from16 v21, v2

    iget-object v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mSignerEngine:Lcom/android/apksig/ApkSignerEngine;

    move-object/from16 v22, v2

    iget-object v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mInputApkFile:Ljava/io/File;

    move-object/from16 v23, v2

    iget-object v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mInputApkDataSource:Lcom/android/apksig/util/DataSource;

    move-object/from16 v24, v2

    iget-object v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mOutputApkFile:Ljava/io/File;

    move-object/from16 v25, v2

    iget-object v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mOutputApkDataSink:Lcom/android/apksig/util/DataSink;

    move-object/from16 v26, v2

    iget-object v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mOutputApkDataSource:Lcom/android/apksig/util/DataSource;

    move-object/from16 v27, v2

    iget-object v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mOutputV4File:Ljava/io/File;

    move-object/from16 v28, v2

    iget-object v2, v0, Lcom/android/apksig/ApkSigner$Builder;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    move-object/from16 v29, v2

    const/16 v30, 0x0

    invoke-direct/range {v3 .. v30}, Lcom/android/apksig/ApkSigner;-><init>(Ljava/util/List;Lcom/android/apksig/ApkSigner$SignerConfig;Lcom/android/apksig/SigningCertificateLineage;ZZLjava/lang/Integer;IZZZZZZZZZZLjava/lang/String;Lcom/android/apksig/ApkSignerEngine;Ljava/io/File;Lcom/android/apksig/util/DataSource;Ljava/io/File;Lcom/android/apksig/util/DataSink;Lcom/android/apksig/util/DataSource;Ljava/io/File;Lcom/android/apksig/SigningCertificateLineage;Lcom/android/apksig/ApkSigner$1;)V

    return-object v1
.end method

.method public setAlignFileSize(Z)Lcom/android/apksig/ApkSigner$Builder;
    .locals 0
    .param p1, "alignFileSize"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "alignFileSize"
        }
    .end annotation

    .line 1538
    invoke-direct {p0}, Lcom/android/apksig/ApkSigner$Builder;->checkInitializedWithoutEngine()V

    .line 1539
    iput-boolean p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mAlignFileSize:Z

    .line 1540
    return-object p0
.end method

.method public setCreatedBy(Ljava/lang/String;)Lcom/android/apksig/ApkSigner$Builder;
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

    .line 1602
    invoke-direct {p0}, Lcom/android/apksig/ApkSigner$Builder;->checkInitializedWithoutEngine()V

    .line 1603
    if-eqz p1, :cond_0

    .line 1606
    iput-object p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mCreatedBy:Ljava/lang/String;

    .line 1607
    return-object p0

    .line 1604
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0
.end method

.method public setDebuggableApkPermitted(Z)Lcom/android/apksig/ApkSigner$Builder;
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

    .line 1569
    invoke-direct {p0}, Lcom/android/apksig/ApkSigner$Builder;->checkInitializedWithoutEngine()V

    .line 1570
    iput-boolean p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mDebuggableApkPermitted:Z

    .line 1571
    return-object p0
.end method

.method public setForceSourceStampOverwrite(Z)Lcom/android/apksig/ApkSigner$Builder;
    .locals 0
    .param p1, "force"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "force"
        }
    .end annotation

    .line 1232
    iput-boolean p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mForceSourceStampOverwrite:Z

    .line 1233
    return-object p0
.end method

.method public setInputApk(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/ApkSigner$Builder;
    .locals 2
    .param p1, "inputApk"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "inputApk"
        }
    .end annotation

    .line 1265
    if-eqz p1, :cond_0

    .line 1268
    iput-object p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mInputApkDataSource:Lcom/android/apksig/util/DataSource;

    .line 1269
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mInputApkFile:Ljava/io/File;

    .line 1270
    return-object p0

    .line 1266
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "inputApk == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setInputApk(Ljava/io/File;)Lcom/android/apksig/ApkSigner$Builder;
    .locals 2
    .param p1, "inputApk"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "inputApk"
        }
    .end annotation

    .line 1251
    if-eqz p1, :cond_0

    .line 1254
    iput-object p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mInputApkFile:Ljava/io/File;

    .line 1255
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mInputApkDataSource:Lcom/android/apksig/util/DataSource;

    .line 1256
    return-object p0

    .line 1252
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "inputApk == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setMinSdkVersion(I)Lcom/android/apksig/ApkSigner$Builder;
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

    .line 1360
    invoke-direct {p0}, Lcom/android/apksig/ApkSigner$Builder;->checkInitializedWithoutEngine()V

    .line 1361
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mMinSdkVersion:Ljava/lang/Integer;

    .line 1362
    return-object p0
.end method

.method public setMinSdkVersionForRotation(I)Lcom/android/apksig/ApkSigner$Builder;
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

    .line 1382
    invoke-direct {p0}, Lcom/android/apksig/ApkSigner$Builder;->checkInitializedWithoutEngine()V

    .line 1385
    const/16 v0, 0x21

    if-ge p1, v0, :cond_0

    .line 1386
    const/16 v0, 0x1c

    iput v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mRotationMinSdkVersion:I

    goto :goto_0

    .line 1388
    :cond_0
    iput p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mRotationMinSdkVersion:I

    .line 1390
    :goto_0
    return-object p0
.end method

.method public setOtherSignersSignaturesPreserved(Z)Lcom/android/apksig/ApkSigner$Builder;
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

    .line 1587
    invoke-direct {p0}, Lcom/android/apksig/ApkSigner$Builder;->checkInitializedWithoutEngine()V

    .line 1588
    iput-boolean p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mOtherSignersSignaturesPreserved:Z

    .line 1589
    return-object p0
.end method

.method public setOutputApk(Lcom/android/apksig/util/DataSink;Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/ApkSigner$Builder;
    .locals 2
    .param p1, "outputApkOut"    # Lcom/android/apksig/util/DataSink;
    .param p2, "outputApkIn"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "outputApkOut",
            "outputApkIn"
        }
    .end annotation

    .line 1320
    if-eqz p1, :cond_1

    .line 1323
    if-eqz p2, :cond_0

    .line 1326
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mOutputApkFile:Ljava/io/File;

    .line 1327
    iput-object p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mOutputApkDataSink:Lcom/android/apksig/util/DataSink;

    .line 1328
    iput-object p2, p0, Lcom/android/apksig/ApkSigner$Builder;->mOutputApkDataSource:Lcom/android/apksig/util/DataSource;

    .line 1329
    return-object p0

    .line 1324
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "outputApkIn == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1321
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "outputApkOut == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setOutputApk(Lcom/android/apksig/util/ReadableDataSink;)Lcom/android/apksig/ApkSigner$Builder;
    .locals 2
    .param p1, "outputApk"    # Lcom/android/apksig/util/ReadableDataSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "outputApk"
        }
    .end annotation

    .line 1303
    if-eqz p1, :cond_0

    .line 1306
    invoke-virtual {p0, p1, p1}, Lcom/android/apksig/ApkSigner$Builder;->setOutputApk(Lcom/android/apksig/util/DataSink;Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/ApkSigner$Builder;

    move-result-object v0

    return-object v0

    .line 1304
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "outputApk == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setOutputApk(Ljava/io/File;)Lcom/android/apksig/ApkSigner$Builder;
    .locals 2
    .param p1, "outputApk"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "outputApk"
        }
    .end annotation

    .line 1281
    if-eqz p1, :cond_0

    .line 1284
    iput-object p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mOutputApkFile:Ljava/io/File;

    .line 1285
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mOutputApkDataSink:Lcom/android/apksig/util/DataSink;

    .line 1286
    iput-object v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mOutputApkDataSource:Lcom/android/apksig/util/DataSource;

    .line 1287
    return-object p0

    .line 1282
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "outputApk == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRotationTargetsDevRelease(Z)Lcom/android/apksig/ApkSigner$Builder;
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

    .line 1412
    invoke-direct {p0}, Lcom/android/apksig/ApkSigner$Builder;->checkInitializedWithoutEngine()V

    .line 1413
    iput-boolean p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mRotationTargetsDevRelease:Z

    .line 1414
    return-object p0
.end method

.method public setSigningCertificateLineage(Lcom/android/apksig/SigningCertificateLineage;)Lcom/android/apksig/ApkSigner$Builder;
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

    .line 1624
    if-eqz p1, :cond_0

    .line 1625
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningEnabled:Z

    .line 1626
    iput-object p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    .line 1628
    :cond_0
    return-object p0
.end method

.method public setSourceStampSignerConfig(Lcom/android/apksig/ApkSigner$SignerConfig;)Lcom/android/apksig/ApkSigner$Builder;
    .locals 0
    .param p1, "sourceStampSignerConfig"    # Lcom/android/apksig/ApkSigner$SignerConfig;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sourceStampSignerConfig"
        }
    .end annotation

    .line 1212
    iput-object p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mSourceStampSignerConfig:Lcom/android/apksig/ApkSigner$SignerConfig;

    .line 1213
    return-object p0
.end method

.method public setSourceStampSigningCertificateLineage(Lcom/android/apksig/SigningCertificateLineage;)Lcom/android/apksig/ApkSigner$Builder;
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

    .line 1222
    iput-object p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mSourceStampSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    .line 1223
    return-object p0
.end method

.method public setSourceStampTimestampEnabled(Z)Lcom/android/apksig/ApkSigner$Builder;
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

    .line 1241
    iput-boolean p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mSourceStampTimestampEnabled:Z

    .line 1242
    return-object p0
.end method

.method public setV1SigningEnabled(Z)Lcom/android/apksig/ApkSigner$Builder;
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

    .line 1437
    invoke-direct {p0}, Lcom/android/apksig/ApkSigner$Builder;->checkInitializedWithoutEngine()V

    .line 1438
    iput-boolean p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mV1SigningEnabled:Z

    .line 1439
    return-object p0
.end method

.method public setV2SigningEnabled(Z)Lcom/android/apksig/ApkSigner$Builder;
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

    .line 1461
    invoke-direct {p0}, Lcom/android/apksig/ApkSigner$Builder;->checkInitializedWithoutEngine()V

    .line 1462
    iput-boolean p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mV2SigningEnabled:Z

    .line 1463
    return-object p0
.end method

.method public setV3SigningEnabled(Z)Lcom/android/apksig/ApkSigner$Builder;
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

    .line 1486
    invoke-direct {p0}, Lcom/android/apksig/ApkSigner$Builder;->checkInitializedWithoutEngine()V

    .line 1487
    iput-boolean p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningEnabled:Z

    .line 1488
    const/4 v0, 0x1

    if-eqz p1, :cond_0

    .line 1489
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningExplicitlyEnabled:Z

    goto :goto_0

    .line 1491
    :cond_0
    iput-boolean v0, p0, Lcom/android/apksig/ApkSigner$Builder;->mV3SigningExplicitlyDisabled:Z

    .line 1493
    :goto_0
    return-object p0
.end method

.method public setV4ErrorReportingEnabled(Z)Lcom/android/apksig/ApkSigner$Builder;
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

    .line 1523
    invoke-direct {p0}, Lcom/android/apksig/ApkSigner$Builder;->checkInitializedWithoutEngine()V

    .line 1524
    iput-boolean p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mV4ErrorReportingEnabled:Z

    .line 1525
    return-object p0
.end method

.method public setV4SignatureOutputFile(Ljava/io/File;)Lcom/android/apksig/ApkSigner$Builder;
    .locals 2
    .param p1, "v4SignatureOutputFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v4SignatureOutputFile"
        }
    .end annotation

    .line 1337
    if-eqz p1, :cond_0

    .line 1340
    iput-object p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mOutputV4File:Ljava/io/File;

    .line 1341
    return-object p0

    .line 1338
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "v4HashRootOutputFile == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setV4SigningEnabled(Z)Lcom/android/apksig/ApkSigner$Builder;
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

    .line 1505
    invoke-direct {p0}, Lcom/android/apksig/ApkSigner$Builder;->checkInitializedWithoutEngine()V

    .line 1506
    iput-boolean p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mV4SigningEnabled:Z

    .line 1507
    iput-boolean p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mV4ErrorReportingEnabled:Z

    .line 1508
    return-object p0
.end method

.method public setVerityEnabled(Z)Lcom/android/apksig/ApkSigner$Builder;
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

    .line 1551
    invoke-direct {p0}, Lcom/android/apksig/ApkSigner$Builder;->checkInitializedWithoutEngine()V

    .line 1552
    iput-boolean p1, p0, Lcom/android/apksig/ApkSigner$Builder;->mVerityEnabled:Z

    .line 1553
    return-object p0
.end method
