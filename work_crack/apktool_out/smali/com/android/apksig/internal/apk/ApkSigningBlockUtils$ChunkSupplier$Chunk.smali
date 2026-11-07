.class Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;
.super Ljava/lang/Object;
.source "ApkSigningBlockUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Chunk"
.end annotation


# instance fields
.field private final chunkIndex:I

.field private final data:Ljava/nio/ByteBuffer;

.field private final size:I


# direct methods
.method private constructor <init>(ILjava/nio/ByteBuffer;I)V
    .locals 0
    .param p1, "chunkIndex"    # I
    .param p2, "data"    # Ljava/nio/ByteBuffer;
    .param p3, "size"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "chunkIndex",
            "data",
            "size"
        }
    .end annotation

    .line 588
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 589
    iput p1, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;->chunkIndex:I

    .line 590
    iput-object p2, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;->data:Ljava/nio/ByteBuffer;

    .line 591
    iput p3, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;->size:I

    .line 592
    return-void
.end method

.method synthetic constructor <init>(ILjava/nio/ByteBuffer;ILcom/android/apksig/internal/apk/ApkSigningBlockUtils$1;)V
    .locals 0
    .param p1, "x0"    # I
    .param p2, "x1"    # Ljava/nio/ByteBuffer;
    .param p3, "x2"    # I
    .param p4, "x3"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$1;

    .line 583
    invoke-direct {p0, p1, p2, p3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;-><init>(ILjava/nio/ByteBuffer;I)V

    return-void
.end method

.method static synthetic access$600(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;

    .line 583
    iget v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;->size:I

    return v0
.end method

.method static synthetic access$700(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;)Ljava/nio/ByteBuffer;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;

    .line 583
    iget-object v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;->data:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method static synthetic access$800(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;

    .line 583
    iget v0, p0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$ChunkSupplier$Chunk;->chunkIndex:I

    return v0
.end method
