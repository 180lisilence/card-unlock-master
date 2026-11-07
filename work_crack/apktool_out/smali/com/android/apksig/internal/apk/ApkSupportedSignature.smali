.class public Lcom/android/apksig/internal/apk/ApkSupportedSignature;
.super Ljava/lang/Object;
.source "ApkSupportedSignature.java"


# instance fields
.field public final algorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

.field public final signature:[B


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

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/android/apksig/internal/apk/ApkSupportedSignature;->algorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    .line 32
    iput-object p2, p0, Lcom/android/apksig/internal/apk/ApkSupportedSignature;->signature:[B

    .line 33
    return-void
.end method
