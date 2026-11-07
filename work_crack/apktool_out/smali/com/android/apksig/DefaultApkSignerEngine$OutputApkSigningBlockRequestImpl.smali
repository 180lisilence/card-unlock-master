.class Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;
.super Ljava/lang/Object;
.source "DefaultApkSignerEngine.java"

# interfaces
.implements Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest;
.implements Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/DefaultApkSignerEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OutputApkSigningBlockRequestImpl"
.end annotation


# instance fields
.field private final mApkSigningBlock:[B

.field private volatile mDone:Z

.field private final mPaddingBeforeApkSigningBlock:I


# direct methods
.method private constructor <init>([BI)V
    .locals 1
    .param p1, "apkSigingBlock"    # [B
    .param p2, "paddingBefore"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apkSigingBlock",
            "paddingBefore"
        }
    .end annotation

    .line 1411
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1412
    invoke-virtual {p1}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;->mApkSigningBlock:[B

    .line 1413
    iput p2, p0, Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;->mPaddingBeforeApkSigningBlock:I

    .line 1414
    return-void
.end method

.method synthetic constructor <init>([BILcom/android/apksig/DefaultApkSignerEngine$1;)V
    .locals 0
    .param p1, "x0"    # [B
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/android/apksig/DefaultApkSignerEngine$1;

    .line 1405
    invoke-direct {p0, p1, p2}, Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;-><init>([BI)V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;

    .line 1405
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;->isDone()Z

    move-result v0

    return v0
.end method

.method private isDone()Z
    .locals 1

    .line 1427
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;->mDone:Z

    return v0
.end method


# virtual methods
.method public done()V
    .locals 1

    .line 1423
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;->mDone:Z

    .line 1424
    return-void
.end method

.method public getApkSigningBlock()[B
    .locals 1

    .line 1418
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;->mApkSigningBlock:[B

    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method public getPaddingSizeBeforeApkSigningBlock()I
    .locals 1

    .line 1432
    iget v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;->mPaddingBeforeApkSigningBlock:I

    return v0
.end method
