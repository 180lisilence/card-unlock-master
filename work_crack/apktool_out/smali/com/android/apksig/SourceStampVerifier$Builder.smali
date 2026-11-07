.class public Lcom/android/apksig/SourceStampVerifier$Builder;
.super Ljava/lang/Object;
.source "SourceStampVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/SourceStampVerifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private final mApkDataSource:Lcom/android/apksig/util/DataSource;

.field private final mApkFile:Ljava/io/File;

.field private mMaxSdkVersion:I

.field private mMinSdkVersion:I


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

    .line 860
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 841
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/apksig/SourceStampVerifier$Builder;->mMinSdkVersion:I

    .line 842
    const v0, 0x7fffffff

    iput v0, p0, Lcom/android/apksig/SourceStampVerifier$Builder;->mMaxSdkVersion:I

    .line 861
    if-eqz p1, :cond_0

    .line 864
    iput-object p1, p0, Lcom/android/apksig/SourceStampVerifier$Builder;->mApkDataSource:Lcom/android/apksig/util/DataSource;

    .line 865
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Builder;->mApkFile:Ljava/io/File;

    .line 866
    return-void

    .line 862
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

    .line 848
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 841
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/apksig/SourceStampVerifier$Builder;->mMinSdkVersion:I

    .line 842
    const v0, 0x7fffffff

    iput v0, p0, Lcom/android/apksig/SourceStampVerifier$Builder;->mMaxSdkVersion:I

    .line 849
    if-eqz p1, :cond_0

    .line 852
    iput-object p1, p0, Lcom/android/apksig/SourceStampVerifier$Builder;->mApkFile:Ljava/io/File;

    .line 853
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/SourceStampVerifier$Builder;->mApkDataSource:Lcom/android/apksig/util/DataSource;

    .line 854
    return-void

    .line 850
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "apk == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public build()Lcom/android/apksig/SourceStampVerifier;
    .locals 7

    .line 904
    new-instance v6, Lcom/android/apksig/SourceStampVerifier;

    iget-object v1, p0, Lcom/android/apksig/SourceStampVerifier$Builder;->mApkFile:Ljava/io/File;

    iget-object v2, p0, Lcom/android/apksig/SourceStampVerifier$Builder;->mApkDataSource:Lcom/android/apksig/util/DataSource;

    iget v3, p0, Lcom/android/apksig/SourceStampVerifier$Builder;->mMinSdkVersion:I

    iget v4, p0, Lcom/android/apksig/SourceStampVerifier$Builder;->mMaxSdkVersion:I

    const/4 v5, 0x0

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/android/apksig/SourceStampVerifier;-><init>(Ljava/io/File;Lcom/android/apksig/util/DataSource;IILcom/android/apksig/SourceStampVerifier$1;)V

    return-object v6
.end method

.method public setMaxCheckedPlatformVersion(I)Lcom/android/apksig/SourceStampVerifier$Builder;
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

    .line 895
    iput p1, p0, Lcom/android/apksig/SourceStampVerifier$Builder;->mMaxSdkVersion:I

    .line 896
    return-object p0
.end method

.method public setMinCheckedPlatformVersion(I)Lcom/android/apksig/SourceStampVerifier$Builder;
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

    .line 879
    iput p1, p0, Lcom/android/apksig/SourceStampVerifier$Builder;->mMinSdkVersion:I

    .line 880
    return-object p0
.end method
