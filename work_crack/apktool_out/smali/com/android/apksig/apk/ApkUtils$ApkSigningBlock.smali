.class public Lcom/android/apksig/apk/ApkUtils$ApkSigningBlock;
.super Lcom/android/apksig/apk/ApkUtilsLite$ApkSigningBlock;
.source "ApkUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/apk/ApkUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ApkSigningBlock"
.end annotation


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

    .line 159
    invoke-direct {p0, p1, p2, p3}, Lcom/android/apksig/apk/ApkUtilsLite$ApkSigningBlock;-><init>(JLcom/android/apksig/util/DataSource;)V

    .line 160
    return-void
.end method
