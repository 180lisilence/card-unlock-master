.class Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;
.super Ljava/lang/Object;
.source "ApkSigningBlockUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ChunkDigests"
.end annotation


# instance fields
.field private final algorithm:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

.field private final concatOfDigestsOfChunks:[B

.field private final digestOutputSize:I


# direct methods
.method private constructor <init>(Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;I)V
    .locals 3
    .param p1, "algorithm"    # Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    .param p2, "chunkCount"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "algorithm",
            "chunkCount"
        }
    .end annotation

    .line 426
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 427
    iput-object p1, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->algorithm:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    .line 428
    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->getChunkDigestOutputSizeBytes()I

    move-result v0

    iput v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->digestOutputSize:I

    .line 429
    mul-int/2addr v0, p2

    add-int/lit8 v0, v0, 0x5

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->concatOfDigestsOfChunks:[B

    .line 433
    const/4 v1, 0x0

    const/16 v2, 0x5a

    aput-byte v2, v0, v1

    .line 434
    const/4 v1, 0x1

    invoke-static {p2, v0, v1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->access$500(I[BI)V

    .line 435
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$1;

    .line 421
    invoke-direct {p0, p1, p2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;-><init>(Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;I)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;

    .line 421
    iget v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->digestOutputSize:I

    return v0
.end method

.method static synthetic access$200(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;)Ljava/security/MessageDigest;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 421
    invoke-direct {p0}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->createMessageDigest()Ljava/security/MessageDigest;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;)Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;

    .line 421
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->algorithm:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;)[B
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;

    .line 421
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->concatOfDigestsOfChunks:[B

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;I)I
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;
    .param p1, "x1"    # I

    .line 421
    invoke-direct {p0, p1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->getOffset(I)I

    move-result v0

    return v0
.end method

.method private createMessageDigest()Ljava/security/MessageDigest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 438
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->algorithm:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->getJcaMessageDigestAlgorithm()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    return-object v0
.end method

.method private getOffset(I)I
    .locals 1
    .param p1, "chunkIndex"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "chunkIndex"
        }
    .end annotation

    .line 442
    iget v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkDigests;->digestOutputSize:I

    mul-int/2addr v0, p1

    add-int/lit8 v0, v0, 0x5

    return v0
.end method
