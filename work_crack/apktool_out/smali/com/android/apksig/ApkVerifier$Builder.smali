.class public Lcom/android/apksig/ApkVerifier$Builder;
.super Ljava/lang/Object;
.source "ApkVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/ApkVerifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private final mApkDataSource:Lcom/android/apksig/util/DataSource;

.field private final mApkFile:Ljava/io/File;

.field private mMaxSdkVersion:I

.field private mMinSdkVersion:Ljava/lang/Integer;

.field private mV4SignatureFile:Ljava/io/File;


# direct methods
.method public constructor <init>(Lcom/android/apksig/util/DataSource;)V
    .locals 2
    .param p1, "apk"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apk"
        }
    .end annotation

    .line 3190
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3174
    const v0, 0x7fffffff

    iput v0, p0, Lcom/android/apksig/ApkVerifier$Builder;->mMaxSdkVersion:I

    .line 3191
    if-eqz p1, :cond_0

    .line 3194
    iput-object p1, p0, Lcom/android/apksig/ApkVerifier$Builder;->mApkDataSource:Lcom/android/apksig/util/DataSource;

    .line 3195
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Builder;->mApkFile:Ljava/io/File;

    .line 3196
    return-void

    .line 3192
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "apk == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 2
    .param p1, "apk"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apk"
        }
    .end annotation

    .line 3179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3174
    const v0, 0x7fffffff

    iput v0, p0, Lcom/android/apksig/ApkVerifier$Builder;->mMaxSdkVersion:I

    .line 3180
    if-eqz p1, :cond_0

    .line 3183
    iput-object p1, p0, Lcom/android/apksig/ApkVerifier$Builder;->mApkFile:Ljava/io/File;

    .line 3184
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Builder;->mApkDataSource:Lcom/android/apksig/util/DataSource;

    .line 3185
    return-void

    .line 3181
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "apk == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public build()Lcom/android/apksig/ApkVerifier;
    .locals 8

    .line 3242
    new-instance v7, Lcom/android/apksig/ApkVerifier;

    iget-object v1, p0, Lcom/android/apksig/ApkVerifier$Builder;->mApkFile:Ljava/io/File;

    iget-object v2, p0, Lcom/android/apksig/ApkVerifier$Builder;->mApkDataSource:Lcom/android/apksig/util/DataSource;

    iget-object v3, p0, Lcom/android/apksig/ApkVerifier$Builder;->mV4SignatureFile:Ljava/io/File;

    iget-object v4, p0, Lcom/android/apksig/ApkVerifier$Builder;->mMinSdkVersion:Ljava/lang/Integer;

    iget v5, p0, Lcom/android/apksig/ApkVerifier$Builder;->mMaxSdkVersion:I

    const/4 v6, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/android/apksig/ApkVerifier;-><init>(Ljava/io/File;Lcom/android/apksig/util/DataSource;Ljava/io/File;Ljava/lang/Integer;ILcom/android/apksig/ApkVerifier$1;)V

    return-object v7
.end method

.method public setMaxCheckedPlatformVersion(I)Lcom/android/apksig/ApkVerifier$Builder;
    .locals 0
    .param p1, "maxSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "maxSdkVersion"
        }
    .end annotation

    .line 3228
    iput p1, p0, Lcom/android/apksig/ApkVerifier$Builder;->mMaxSdkVersion:I

    .line 3229
    return-object p0
.end method

.method public setMinCheckedPlatformVersion(I)Lcom/android/apksig/ApkVerifier$Builder;
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

    .line 3213
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Builder;->mMinSdkVersion:Ljava/lang/Integer;

    .line 3214
    return-object p0
.end method

.method public setV4SignatureFile(Ljava/io/File;)Lcom/android/apksig/ApkVerifier$Builder;
    .locals 0
    .param p1, "v4SignatureFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v4SignatureFile"
        }
    .end annotation

    .line 3233
    iput-object p1, p0, Lcom/android/apksig/ApkVerifier$Builder;->mV4SignatureFile:Ljava/io/File;

    .line 3234
    return-object p0
.end method
