.class public Lcom/android/apksig/apk/ApkUtils$ZipSections;
.super Lcom/android/apksig/zip/ZipSections;
.source "ApkUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/apk/ApkUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ZipSections"
.end annotation


# direct methods
.method public constructor <init>(JJIJLjava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "centralDirectoryOffset"    # J
    .param p3, "centralDirectorySizeBytes"    # J
    .param p5, "centralDirectoryRecordCount"    # I
    .param p6, "eocdOffset"    # J
    .param p8, "eocd"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "centralDirectoryOffset",
            "centralDirectorySizeBytes",
            "centralDirectoryRecordCount",
            "eocdOffset",
            "eocd"
        }
    .end annotation

    .line 79
    invoke-direct/range {p0 .. p8}, Lcom/android/apksig/zip/ZipSections;-><init>(JJIJLjava/nio/ByteBuffer;)V

    .line 81
    return-void
.end method
