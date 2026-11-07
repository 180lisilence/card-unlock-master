.class Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;
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
    name = "GetJarEntryDataRequest"
.end annotation


# instance fields
.field private mDataSink:Lcom/android/apksig/util/DataSink;

.field private mDataSinkBuf:Ljava/io/ByteArrayOutputStream;

.field private mDone:Z

.field private final mEntryName:Ljava/lang/String;

.field private final mLock:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "entryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entryName"
        }
    .end annotation

    .line 1445
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1439
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mLock:Ljava/lang/Object;

    .line 1446
    iput-object p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mEntryName:Ljava/lang/String;

    .line 1447
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/android/apksig/DefaultApkSignerEngine$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lcom/android/apksig/DefaultApkSignerEngine$1;

    .line 1437
    invoke-direct {p0, p1}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    .line 1437
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->isDone()Z

    move-result v0

    return v0
.end method

.method static synthetic access$700(Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;)[B
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    .line 1437
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->getData()[B

    move-result-object v0

    return-object v0
.end method

.method private checkNotDone()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1485
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1486
    :try_start_0
    iget-boolean v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mDone:Z

    if-nez v1, :cond_0

    .line 1489
    monitor-exit v0

    .line 1490
    return-void

    .line 1487
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Already done"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1489
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getData()[B
    .locals 3

    .line 1493
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1494
    :try_start_0
    iget-boolean v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mDone:Z

    if-eqz v1, :cond_1

    .line 1497
    iget-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mDataSinkBuf:Ljava/io/ByteArrayOutputStream;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    new-array v1, v1, [B

    :goto_0
    monitor-exit v0

    return-object v1

    .line 1495
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Not yet done"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1498
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private isDone()Z
    .locals 2

    .line 1479
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1480
    :try_start_0
    iget-boolean v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mDone:Z

    monitor-exit v0

    return v1

    .line 1481
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public done()V
    .locals 2

    .line 1470
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1471
    :try_start_0
    iget-boolean v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mDone:Z

    if-eqz v1, :cond_0

    .line 1472
    monitor-exit v0

    return-void

    .line 1474
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mDone:Z

    .line 1475
    monitor-exit v0

    .line 1476
    return-void

    .line 1475
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getDataSink()Lcom/android/apksig/util/DataSink;
    .locals 2

    .line 1456
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 1457
    :try_start_0
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->checkNotDone()V

    .line 1458
    iget-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mDataSinkBuf:Ljava/io/ByteArrayOutputStream;

    if-nez v1, :cond_0

    .line 1459
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mDataSinkBuf:Ljava/io/ByteArrayOutputStream;

    .line 1461
    :cond_0
    iget-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mDataSink:Lcom/android/apksig/util/DataSink;

    if-nez v1, :cond_1

    .line 1462
    iget-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mDataSinkBuf:Ljava/io/ByteArrayOutputStream;

    invoke-static {v1}, Lcom/android/apksig/util/DataSinks;->asDataSink(Ljava/io/OutputStream;)Lcom/android/apksig/util/DataSink;

    move-result-object v1

    iput-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mDataSink:Lcom/android/apksig/util/DataSink;

    .line 1464
    :cond_1
    iget-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mDataSink:Lcom/android/apksig/util/DataSink;

    monitor-exit v0

    return-object v1

    .line 1465
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getEntryName()Ljava/lang/String;
    .locals 1

    .line 1451
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->mEntryName:Ljava/lang/String;

    return-object v0
.end method
