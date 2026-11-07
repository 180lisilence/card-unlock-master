.class public Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SupportedSignature;
.super Lcom/android/apksig/internal/apk/ApkSupportedSignature;
.source "ApkSigningBlockUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SupportedSignature"
.end annotation


# direct methods
.method public constructor <init>(Lcom/android/apksig/internal/apk/SignatureAlgorithm;[B)V
    .locals 0
    .param p1, "algorithm"    # Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .param p2, "signature"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "algorithm",
            "signature"
        }
    .end annotation

    .line 1428
    invoke-direct {p0, p1, p2}, Lcom/android/apksig/internal/apk/ApkSupportedSignature;-><init>(Lcom/android/apksig/internal/apk/SignatureAlgorithm;[B)V

    .line 1429
    return-void
.end method
