.class public Lcom/android/apksig/internal/zip/ZipUtils$DeflateResult;
.super Ljava/lang/Object;
.source "ZipUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/zip/ZipUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DeflateResult"
.end annotation


# instance fields
.field public final inputCrc32:J

.field public final inputSizeBytes:I

.field public final output:[B


# direct methods
.method public constructor <init>(IJ[B)V
    .locals 0
    .param p1, "inputSizeBytes"    # I
    .param p2, "inputCrc32"    # J
    .param p4, "output"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "inputSizeBytes",
            "inputCrc32",
            "output"
        }
    .end annotation

    .line 379
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 380
    iput p1, p0, Lcom/android/apksig/internal/zip/ZipUtils$DeflateResult;->inputSizeBytes:I

    .line 381
    iput-wide p2, p0, Lcom/android/apksig/internal/zip/ZipUtils$DeflateResult;->inputCrc32:J

    .line 382
    iput-object p4, p0, Lcom/android/apksig/internal/zip/ZipUtils$DeflateResult;->output:[B

    .line 383
    return-void
.end method
