.class final Lcom/licenseinjector/app/core/ZipRewriter$E;
.super Ljava/lang/Object;
.source "ZipRewriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/licenseinjector/app/core/ZipRewriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "E"
.end annotation


# instance fields
.field centralExtra:[B

.field comment:[B

.field compSize:J

.field crc:I

.field dataOff:J

.field date:I

.field flags:I

.field localExtra:[B

.field localExtraLen:I

.field localOff:J

.field method:I

.field name:Ljava/lang/String;

.field nameBytes:[B

.field remove:Z

.field replace:[B

.field replaceCrc:I

.field replaceUncomp:J

.field time:I

.field uncompSize:J


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    new-array v1, v0, [B

    iput-object v1, p0, Lcom/licenseinjector/app/core/ZipRewriter$E;->localExtra:[B

    .line 45
    new-array v1, v0, [B

    iput-object v1, p0, Lcom/licenseinjector/app/core/ZipRewriter$E;->centralExtra:[B

    .line 46
    new-array v0, v0, [B

    iput-object v0, p0, Lcom/licenseinjector/app/core/ZipRewriter$E;->comment:[B

    .line 47
    return-void
.end method

.method synthetic constructor <init>(Lcom/licenseinjector/app/core/ZipRewriter$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/licenseinjector/app/core/ZipRewriter$1;

    .line 22
    invoke-direct {p0}, Lcom/licenseinjector/app/core/ZipRewriter$E;-><init>()V

    return-void
.end method
