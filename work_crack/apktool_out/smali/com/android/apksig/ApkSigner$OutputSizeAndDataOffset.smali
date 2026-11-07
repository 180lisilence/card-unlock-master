.class Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;
.super Ljava/lang/Object;
.source "ApkSigner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/ApkSigner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OutputSizeAndDataOffset"
.end annotation


# instance fields
.field public dataOffsetBytes:J

.field public outputBytes:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 0
    .param p1, "outputBytes"    # J
    .param p3, "dataOffsetBytes"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "outputBytes",
            "dataOffsetBytes"
        }
    .end annotation

    .line 733
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 734
    iput-wide p1, p0, Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;->outputBytes:J

    .line 735
    iput-wide p3, p0, Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;->dataOffsetBytes:J

    .line 736
    return-void
.end method
