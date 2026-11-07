.class Lcom/android/apksig/ApkVerifier$ByteArray;
.super Ljava/lang/Object;
.source "ApkVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/ApkVerifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ByteArray"
.end annotation


# instance fields
.field private final mArray:[B

.field private final mHashCode:I


# direct methods
.method private constructor <init>([B)V
    .locals 1
    .param p1, "arr"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "arr"
        }
    .end annotation

    .line 3131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3132
    iput-object p1, p0, Lcom/android/apksig/ApkVerifier$ByteArray;->mArray:[B

    .line 3133
    invoke-static {p1}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    iput v0, p0, Lcom/android/apksig/ApkVerifier$ByteArray;->mHashCode:I

    .line 3134
    return-void
.end method

.method synthetic constructor <init>([BLcom/android/apksig/ApkVerifier$1;)V
    .locals 0
    .param p1, "x0"    # [B
    .param p2, "x1"    # Lcom/android/apksig/ApkVerifier$1;

    .line 3127
    invoke-direct {p0, p1}, Lcom/android/apksig/ApkVerifier$ByteArray;-><init>([B)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    .line 3143
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 3144
    return v0

    .line 3146
    :cond_0
    instance-of v1, p1, Lcom/android/apksig/ApkVerifier$ByteArray;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 3147
    return v2

    .line 3149
    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/android/apksig/ApkVerifier$ByteArray;

    .line 3150
    .local v1, "other":Lcom/android/apksig/ApkVerifier$ByteArray;
    invoke-virtual {p0}, Lcom/android/apksig/ApkVerifier$ByteArray;->hashCode()I

    move-result v3

    invoke-virtual {v1}, Lcom/android/apksig/ApkVerifier$ByteArray;->hashCode()I

    move-result v4

    if-eq v3, v4, :cond_2

    .line 3151
    return v2

    .line 3153
    :cond_2
    iget-object v3, p0, Lcom/android/apksig/ApkVerifier$ByteArray;->mArray:[B

    iget-object v4, v1, Lcom/android/apksig/ApkVerifier$ByteArray;->mArray:[B

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-nez v3, :cond_3

    .line 3154
    return v2

    .line 3156
    :cond_3
    return v0
.end method

.method public hashCode()I
    .locals 1

    .line 3138
    iget v0, p0, Lcom/android/apksig/ApkVerifier$ByteArray;->mHashCode:I

    return v0
.end method
