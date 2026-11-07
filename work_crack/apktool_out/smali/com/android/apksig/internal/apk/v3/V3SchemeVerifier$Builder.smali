.class public Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;
.super Ljava/lang/Object;
.source "V3SchemeVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mApk:Lcom/android/apksig/util/DataSource;

.field private mApkSignatureSchemeV3Block:Ljava/nio/ByteBuffer;

.field private mBlockId:I

.field private mContentDigestsToVerify:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            ">;"
        }
    .end annotation
.end field

.field private mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

.field private mFullVerification:Z

.field private mMaxSdkVersion:I

.field private mMinSdkVersion:I

.field private mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

.field private mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

.field private mZipSections:Lcom/android/apksig/apk/ApkUtils$ZipSections;


# direct methods
.method public constructor <init>(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;II)V
    .locals 1
    .param p1, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p2, "zipSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .param p3, "minSdkVersion"    # I
    .param p4, "maxSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "apk",
            "zipSections",
            "minSdkVersion",
            "maxSdkVersion"
        }
    .end annotation

    .line 629
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 611
    sget-object v0, Lcom/android/apksig/util/RunnablesExecutor;->SINGLE_THREADED:Lcom/android/apksig/util/RunnablesExecutor;

    iput-object v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    .line 619
    const v0, -0xfac9740

    iput v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mBlockId:I

    .line 620
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mFullVerification:Z

    .line 621
    invoke-static {}, Ljava/util/OptionalInt;->empty()Ljava/util/OptionalInt;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    .line 630
    iput-object p1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mApk:Lcom/android/apksig/util/DataSource;

    .line 631
    iput-object p2, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mZipSections:Lcom/android/apksig/apk/ApkUtils$ZipSections;

    .line 632
    iput p3, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mMinSdkVersion:I

    .line 633
    iput p4, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mMaxSdkVersion:I

    .line 634
    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "apkSignatureSchemeV3Block"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apkSignatureSchemeV3Block"
        }
    .end annotation

    .line 644
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 611
    sget-object v0, Lcom/android/apksig/util/RunnablesExecutor;->SINGLE_THREADED:Lcom/android/apksig/util/RunnablesExecutor;

    iput-object v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    .line 619
    const v0, -0xfac9740

    iput v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mBlockId:I

    .line 620
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mFullVerification:Z

    .line 621
    invoke-static {}, Ljava/util/OptionalInt;->empty()Ljava/util/OptionalInt;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    .line 645
    iput-object p1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mApkSignatureSchemeV3Block:Ljava/nio/ByteBuffer;

    .line 646
    return-void
.end method


# virtual methods
.method public build()Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;
    .locals 15

    .line 725
    iget v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mBlockId:I

    sparse-switch v0, :sswitch_data_0

    .line 739
    new-instance v0, Ljava/lang/IllegalArgumentException;

    iget v1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mBlockId:I

    .line 741
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 740
    const-string v2, "Unsupported APK Signature Scheme V3 block ID: 0x%08x"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 732
    :sswitch_0
    const/16 v0, 0x1f

    .line 736
    .local v0, "sigSchemeVersion":I
    iget v1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mMaxSdkVersion:I

    iput v1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mMinSdkVersion:I

    .line 737
    goto :goto_0

    .line 727
    .end local v0    # "sigSchemeVersion":I
    :sswitch_1
    const/4 v0, 0x3

    .line 728
    .restart local v0    # "sigSchemeVersion":I
    iget v1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mMinSdkVersion:I

    const/16 v2, 0x1c

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mMinSdkVersion:I

    .line 730
    nop

    .line 743
    :goto_0
    iget-object v1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    if-nez v1, :cond_0

    .line 744
    new-instance v1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    invoke-direct {v1, v0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;-><init>(I)V

    iput-object v1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    .line 746
    :cond_0
    iget-object v1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mContentDigestsToVerify:Ljava/util/Set;

    if-nez v1, :cond_1

    .line 747
    new-instance v1, Ljava/util/HashSet;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(I)V

    iput-object v1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mContentDigestsToVerify:Ljava/util/Set;

    .line 750
    :cond_1
    new-instance v1, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;

    iget-object v4, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    iget-object v5, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mApk:Lcom/android/apksig/util/DataSource;

    iget-object v6, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mZipSections:Lcom/android/apksig/apk/ApkUtils$ZipSections;

    iget-object v7, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mContentDigestsToVerify:Ljava/util/Set;

    iget-object v8, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    iget v9, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mMinSdkVersion:I

    iget v10, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mMaxSdkVersion:I

    iget v11, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mBlockId:I

    iget-object v12, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    iget-boolean v13, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mFullVerification:Z

    const/4 v14, 0x0

    move-object v3, v1

    invoke-direct/range {v3 .. v14}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;-><init>(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;Ljava/util/Set;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;IIILjava/util/OptionalInt;ZLcom/android/apksig/internal/apk/v3/V3SchemeVerifier$1;)V

    .line 761
    .local v1, "verifier":Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;
    iget-object v2, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mApkSignatureSchemeV3Block:Ljava/nio/ByteBuffer;

    if-eqz v2, :cond_2

    .line 762
    invoke-static {v1, v2}, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;->access$102(Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 764
    :cond_2
    return-object v1

    :sswitch_data_0
    .sparse-switch
        -0xfac9740 -> :sswitch_1
        0x1b93ad61 -> :sswitch_0
    .end sparse-switch
.end method

.method public setBlockId(I)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;
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

    .line 664
    iput p1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mBlockId:I

    .line 665
    return-object p0
.end method

.method public setContentDigestsToVerify(Ljava/util/Set;)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "contentDigestsToVerify"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            ">;)",
            "Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;"
        }
    .end annotation

    .line 701
    .local p1, "contentDigestsToVerify":Ljava/util/Set;, "Ljava/util/Set<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;>;"
    iput-object p1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mContentDigestsToVerify:Ljava/util/Set;

    .line 702
    return-object p0
.end method

.method public setFullVerification(Z)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;
    .locals 0
    .param p1, "fullVerification"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "fullVerification"
        }
    .end annotation

    .line 715
    iput-boolean p1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mFullVerification:Z

    .line 716
    return-object p0
.end method

.method public setResult(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;
    .locals 0
    .param p1, "result"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "result"
        }
    .end annotation

    .line 689
    iput-object p1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mResult:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    .line 690
    return-object p0
.end method

.method public setRotationMinSdkVersion(I)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;
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

    .line 677
    invoke-static {p1}, Ljava/util/OptionalInt;->of(I)Ljava/util/OptionalInt;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mOptionalRotationMinSdkVersion:Ljava/util/OptionalInt;

    .line 678
    return-object p0
.end method

.method public setRunnablesExecutor(Lcom/android/apksig/util/RunnablesExecutor;)Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;
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

    .line 652
    iput-object p1, p0, Lcom/android/apksig/internal/apk/v3/V3SchemeVerifier$Builder;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    .line 653
    return-object p0
.end method
