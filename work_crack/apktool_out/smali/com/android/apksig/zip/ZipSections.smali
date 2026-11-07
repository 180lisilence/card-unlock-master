.class public Lcom/android/apksig/zip/ZipSections;
.super Ljava/lang/Object;
.source "ZipSections.java"


# instance fields
.field private final mCentralDirectoryOffset:J

.field private final mCentralDirectoryRecordCount:I

.field private final mCentralDirectorySizeBytes:J

.field private final mEocd:Ljava/nio/ByteBuffer;

.field private final mEocdOffset:J


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

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-wide p1, p0, Lcom/android/apksig/zip/ZipSections;->mCentralDirectoryOffset:J

    .line 41
    iput-wide p3, p0, Lcom/android/apksig/zip/ZipSections;->mCentralDirectorySizeBytes:J

    .line 42
    iput p5, p0, Lcom/android/apksig/zip/ZipSections;->mCentralDirectoryRecordCount:I

    .line 43
    iput-wide p6, p0, Lcom/android/apksig/zip/ZipSections;->mEocdOffset:J

    .line 44
    iput-object p8, p0, Lcom/android/apksig/zip/ZipSections;->mEocd:Ljava/nio/ByteBuffer;

    .line 45
    return-void
.end method


# virtual methods
.method public getZipCentralDirectoryOffset()J
    .locals 2

    .line 52
    iget-wide v0, p0, Lcom/android/apksig/zip/ZipSections;->mCentralDirectoryOffset:J

    return-wide v0
.end method

.method public getZipCentralDirectoryRecordCount()I
    .locals 1

    .line 68
    iget v0, p0, Lcom/android/apksig/zip/ZipSections;->mCentralDirectoryRecordCount:I

    return v0
.end method

.method public getZipCentralDirectorySizeBytes()J
    .locals 2

    .line 60
    iget-wide v0, p0, Lcom/android/apksig/zip/ZipSections;->mCentralDirectorySizeBytes:J

    return-wide v0
.end method

.method public getZipEndOfCentralDirectory()Ljava/nio/ByteBuffer;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/android/apksig/zip/ZipSections;->mEocd:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public getZipEndOfCentralDirectoryOffset()J
    .locals 2

    .line 76
    iget-wide v0, p0, Lcom/android/apksig/zip/ZipSections;->mEocdOffset:J

    return-wide v0
.end method
