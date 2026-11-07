.class public Lcom/android/apksig/apk/ApkUtilsLite$ApkSigningBlock;
.super Ljava/lang/Object;
.source "ApkUtilsLite.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/apk/ApkUtilsLite;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ApkSigningBlock"
.end annotation


# instance fields
.field private final mContents:Lcom/android/apksig/util/DataSource;

.field private final mStartOffsetInApk:J


# direct methods
.method public constructor <init>(JLcom/android/apksig/util/DataSource;)V
    .locals 0
    .param p1, "startOffsetInApk"    # J
    .param p3, "contents"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "startOffsetInApk",
            "contents"
        }
    .end annotation

    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 169
    iput-wide p1, p0, Lcom/android/apksig/apk/ApkUtilsLite$ApkSigningBlock;->mStartOffsetInApk:J

    .line 170
    iput-object p3, p0, Lcom/android/apksig/apk/ApkUtilsLite$ApkSigningBlock;->mContents:Lcom/android/apksig/util/DataSource;

    .line 171
    return-void
.end method


# virtual methods
.method public getContents()Lcom/android/apksig/util/DataSource;
    .locals 1

    .line 185
    iget-object v0, p0, Lcom/android/apksig/apk/ApkUtilsLite$ApkSigningBlock;->mContents:Lcom/android/apksig/util/DataSource;

    return-object v0
.end method

.method public getStartOffset()J
    .locals 2

    .line 177
    iget-wide v0, p0, Lcom/android/apksig/apk/ApkUtilsLite$ApkSigningBlock;->mStartOffsetInApk:J

    return-wide v0
.end method
