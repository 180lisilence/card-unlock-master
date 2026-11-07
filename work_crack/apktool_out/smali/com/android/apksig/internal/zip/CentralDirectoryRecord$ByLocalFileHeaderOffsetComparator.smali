.class Lcom/android/apksig/internal/zip/CentralDirectoryRecord$ByLocalFileHeaderOffsetComparator;
.super Ljava/lang/Object;
.source "CentralDirectoryRecord.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ByLocalFileHeaderOffsetComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/android/apksig/internal/zip/CentralDirectoryRecord;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 289
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/apksig/internal/zip/CentralDirectoryRecord$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/apksig/internal/zip/CentralDirectoryRecord$1;

    .line 289
    invoke-direct {p0}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord$ByLocalFileHeaderOffsetComparator;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/android/apksig/internal/zip/CentralDirectoryRecord;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;)I
    .locals 5
    .param p1, "r1"    # Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .param p2, "r2"    # Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "r1",
            "r2"
        }
    .end annotation

    .line 293
    invoke-virtual {p1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getLocalFileHeaderOffset()J

    move-result-wide v0

    .line 294
    .local v0, "offset1":J
    invoke-virtual {p2}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getLocalFileHeaderOffset()J

    move-result-wide v2

    .line 295
    .local v2, "offset2":J
    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    .line 296
    const/4 v4, 0x1

    return v4

    .line 297
    :cond_0
    cmp-long v4, v0, v2

    if-gez v4, :cond_1

    .line 298
    const/4 v4, -0x1

    return v4

    .line 300
    :cond_1
    const/4 v4, 0x0

    return v4
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "r1",
            "r2"
        }
    .end annotation

    .line 289
    check-cast p1, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    check-cast p2, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    invoke-virtual {p0, p1, p2}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord$ByLocalFileHeaderOffsetComparator;->compare(Lcom/android/apksig/internal/zip/CentralDirectoryRecord;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;)I

    move-result p1

    return p1
.end method
