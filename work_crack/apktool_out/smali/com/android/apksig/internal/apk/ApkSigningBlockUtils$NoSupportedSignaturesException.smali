.class public Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$NoSupportedSignaturesException;
.super Lcom/android/apksig/internal/apk/NoApkSupportedSignaturesException;
.source "ApkSigningBlockUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NoSupportedSignaturesException"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "message"
        }
    .end annotation

    .line 1115
    invoke-direct {p0, p1}, Lcom/android/apksig/internal/apk/NoApkSupportedSignaturesException;-><init>(Ljava/lang/String;)V

    .line 1116
    return-void
.end method
