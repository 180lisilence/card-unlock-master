.class Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;
.super Ljava/lang/Object;
.source "DefaultApkSignerEngine.java"

# interfaces
.implements Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/DefaultApkSignerEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CompoundInspectJarEntryRequest"
.end annotation


# instance fields
.field private final mEntryName:Ljava/lang/String;

.field private final mLock:Ljava/lang/Object;

.field private final mRequests:[Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;

.field private mSink:Lcom/android/apksig/util/DataSink;


# direct methods
.method private varargs constructor <init>(Ljava/lang/String;[Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;)V
    .locals 1
    .param p1, "entryName"    # Ljava/lang/String;
    .param p2, "requests"    # [Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "entryName",
            "requests"
        }
    .end annotation

    .line 1594
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1589
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;->mLock:Ljava/lang/Object;

    .line 1595
    iput-object p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;->mEntryName:Ljava/lang/String;

    .line 1596
    iput-object p2, p0, Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;->mRequests:[Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;

    .line 1597
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;[Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;Lcom/android/apksig/DefaultApkSignerEngine$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # [Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    .param p3, "x2"    # Lcom/android/apksig/DefaultApkSignerEngine$1;

    .line 1586
    invoke-direct {p0, p1, p2}, Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;-><init>(Ljava/lang/String;[Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;)V

    return-void
.end method


# virtual methods
.method public done()V
    .locals 4

    .line 1620
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;->mRequests:[Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 1621
    .local v3, "request":Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    invoke-interface {v3}, Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;->done()V

    .line 1620
    .end local v3    # "request":Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1623
    :cond_0
    return-void
.end method

.method public getDataSink()Lcom/android/apksig/util/DataSink;
    .locals 4

    .line 1606
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1607
    :try_start_0
    iget-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;->mSink:Lcom/android/apksig/util/DataSink;

    if-nez v1, :cond_1

    .line 1608
    iget-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;->mRequests:[Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;

    array-length v1, v1

    new-array v1, v1, [Lcom/android/apksig/util/DataSink;

    .line 1609
    .local v1, "sinks":[Lcom/android/apksig/util/DataSink;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    .line 1610
    iget-object v3, p0, Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;->mRequests:[Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;

    aget-object v3, v3, v2

    invoke-interface {v3}, Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;->getDataSink()Lcom/android/apksig/util/DataSink;

    move-result-object v3

    aput-object v3, v1, v2

    .line 1609
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1612
    .end local v2    # "i":I
    :cond_0
    new-instance v2, Lcom/android/apksig/internal/util/TeeDataSink;

    invoke-direct {v2, v1}, Lcom/android/apksig/internal/util/TeeDataSink;-><init>([Lcom/android/apksig/util/DataSink;)V

    iput-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;->mSink:Lcom/android/apksig/util/DataSink;

    .line 1614
    .end local v1    # "sinks":[Lcom/android/apksig/util/DataSink;
    :cond_1
    iget-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;->mSink:Lcom/android/apksig/util/DataSink;

    monitor-exit v0

    return-object v1

    .line 1615
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getEntryName()Ljava/lang/String;
    .locals 1

    .line 1601
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;->mEntryName:Ljava/lang/String;

    return-object v0
.end method
