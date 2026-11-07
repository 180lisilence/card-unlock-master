.class public Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest$JarEntry;
.super Ljava/lang/Object;
.source "ApkSignerEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "JarEntry"
.end annotation


# instance fields
.field private final mData:[B

.field private final mName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "name",
            "data"
        }
    .end annotation

    .line 470
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 471
    iput-object p1, p0, Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest$JarEntry;->mName:Ljava/lang/String;

    .line 472
    invoke-virtual {p2}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    iput-object v0, p0, Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest$JarEntry;->mData:[B

    .line 473
    return-void
.end method


# virtual methods
.method public getData()[B
    .locals 1

    .line 486
    iget-object v0, p0, Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest$JarEntry;->mData:[B

    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 479
    iget-object v0, p0, Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest$JarEntry;->mName:Ljava/lang/String;

    return-object v0
.end method
