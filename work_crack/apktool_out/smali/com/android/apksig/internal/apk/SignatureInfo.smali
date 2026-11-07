.class public Lcom/android/apksig/internal/apk/SignatureInfo;
.super Ljava/lang/Object;
.source "SignatureInfo.java"


# instance fields
.field public final apkSigningBlockOffset:J

.field public final centralDirOffset:J

.field public final eocd:Ljava/nio/ByteBuffer;

.field public final eocdOffset:J

.field public final signatureBlock:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;JJJLjava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "signatureBlock"    # Ljava/nio/ByteBuffer;
    .param p2, "apkSigningBlockOffset"    # J
    .param p4, "centralDirOffset"    # J
    .param p6, "eocdOffset"    # J
    .param p8, "eocd"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "signatureBlock",
            "apkSigningBlockOffset",
            "centralDirOffset",
            "eocdOffset",
            "eocd"
        }
    .end annotation

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/android/apksig/internal/apk/SignatureInfo;->signatureBlock:Ljava/nio/ByteBuffer;

    .line 48
    iput-wide p2, p0, Lcom/android/apksig/internal/apk/SignatureInfo;->apkSigningBlockOffset:J

    .line 49
    iput-wide p4, p0, Lcom/android/apksig/internal/apk/SignatureInfo;->centralDirOffset:J

    .line 50
    iput-wide p6, p0, Lcom/android/apksig/internal/apk/SignatureInfo;->eocdOffset:J

    .line 51
    iput-object p8, p0, Lcom/android/apksig/internal/apk/SignatureInfo;->eocd:Ljava/nio/ByteBuffer;

    .line 52
    return-void
.end method
