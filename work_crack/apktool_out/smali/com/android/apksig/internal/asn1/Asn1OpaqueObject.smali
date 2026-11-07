.class public Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;
.super Ljava/lang/Object;
.source "Asn1OpaqueObject.java"


# instance fields
.field private final mEncoded:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "encoded"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "encoded"
        }
    .end annotation

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;->mEncoded:Ljava/nio/ByteBuffer;

    .line 29
    return-void
.end method

.method public constructor <init>([B)V
    .locals 1
    .param p1, "encoded"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "encoded"
        }
    .end annotation

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;->mEncoded:Ljava/nio/ByteBuffer;

    .line 33
    return-void
.end method


# virtual methods
.method public getEncoded()Ljava/nio/ByteBuffer;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;->mEncoded:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method
