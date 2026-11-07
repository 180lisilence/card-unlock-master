.class public Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;
.super Ljava/lang/Object;
.source "V3SchemeSigner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private final mBeforeCentralDir:Lcom/android/apksig/util/DataSource;

.field private mBlockId:I

.field private final mCentralDir:Lcom/android/apksig/util/DataSource;

.field private final mEocd:Lcom/android/apksig/util/DataSource;

.field private mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

.field private mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

.field private mRotationTargetsDevRelease:Z

.field private final mSignerConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/util/List;)V
    .locals 1
    .param p1, "beforeCentralDir"    # Lcom/android/apksig/util/DataSource;
    .param p2, "centralDir"    # Lcom/android/apksig/util/DataSource;
    .param p3, "eocd"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "beforeCentralDir",
            "centralDir",
            "eocd",
            "signerConfigs"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/util/DataSource;",
            "Lcom/android/apksig/util/DataSource;",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            ">;)V"
        }
    .end annotation

    .line 438
    .local p4, "signerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 427
    sget-object v0, Lcom/android/apksig/util/RunnablesExecutor;->MULTI_THREADED:Lcom/android/apksig/util/RunnablesExecutor;

    iput-object v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    .line 428
    const v0, -0xfac9740

    iput v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mBlockId:I

    .line 429
    invoke-static {}, Ljava/util/OptionalInt;->empty()Ljava/util/OptionalInt;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    .line 430
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mRotationTargetsDevRelease:Z

    .line 439
    iput-object p1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mBeforeCentralDir:Lcom/android/apksig/util/DataSource;

    .line 440
    iput-object p2, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mCentralDir:Lcom/android/apksig/util/DataSource;

    .line 441
    iput-object p3, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mEocd:Lcom/android/apksig/util/DataSource;

    .line 442
    iput-object p4, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mSignerConfigs:Ljava/util/List;

    .line 443
    return-void
.end method


# virtual methods
.method public build()Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;
    .locals 11

    .line 502
    new-instance v10, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;

    iget-object v1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mBeforeCentralDir:Lcom/android/apksig/util/DataSource;

    iget-object v2, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mCentralDir:Lcom/android/apksig/util/DataSource;

    iget-object v3, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mEocd:Lcom/android/apksig/util/DataSource;

    iget-object v4, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mSignerConfigs:Ljava/util/List;

    iget-object v5, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    iget v6, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mBlockId:I

    iget-object v7, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    iget-boolean v8, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mRotationTargetsDevRelease:Z

    const/4 v9, 0x0

    move-object v0, v10

    invoke-direct/range {v0 .. v9}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;-><init>(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/util/List;Lcom/android/apksig/util/RunnablesExecutor;ILjava/util/OptionalInt;ZLcom/android/apksig/internal/apk/v3/V3SchemeSigner$1;)V

    return-object v10
.end method

.method public setBlockId(I)Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;
    .locals 0
    .param p1, "blockId"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "blockId"
        }
    .end annotation

    .line 461
    iput p1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mBlockId:I

    .line 462
    return-object p0
.end method

.method public setRotationMinSdkVersion(I)Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;
    .locals 1
    .param p1, "rotationMinSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rotationMinSdkVersion"
        }
    .end annotation

    .line 473
    invoke-static {p1}, Ljava/util/OptionalInt;->of(I)Ljava/util/OptionalInt;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    .line 474
    return-object p0
.end method

.method public setRotationTargetsDevRelease(Z)Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;
    .locals 0
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "enabled"
        }
    .end annotation

    .line 493
    iput-boolean p1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mRotationTargetsDevRelease:Z

    .line 494
    return-object p0
.end method

.method public setRunnablesExecutor(Lcom/android/apksig/util/RunnablesExecutor;)Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;
    .locals 0
    .param p1, "executor"    # Lcom/android/apksig/util/RunnablesExecutor;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "executor"
        }
    .end annotation

    .line 449
    iput-object p1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    .line 450
    return-object p0
.end method
