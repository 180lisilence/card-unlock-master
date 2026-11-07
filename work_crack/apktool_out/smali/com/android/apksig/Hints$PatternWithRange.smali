.class public final Lcom/android/apksig/Hints$PatternWithRange;
.super Ljava/lang/Object;
.source "Hints.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/Hints;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PatternWithRange"
.end annotation


# instance fields
.field final offset:J

.field final pattern:Ljava/util/regex/Pattern;

.field final size:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "pattern"
        }
    .end annotation

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/Hints$PatternWithRange;->pattern:Ljava/util/regex/Pattern;

    .line 58
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/apksig/Hints$PatternWithRange;->offset:J

    .line 59
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lcom/android/apksig/Hints$PatternWithRange;->size:J

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JJ)V
    .locals 1
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "offset"    # J
    .param p4, "size"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "pattern",
            "offset",
            "size"
        }
    .end annotation

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/Hints$PatternWithRange;->pattern:Ljava/util/regex/Pattern;

    .line 64
    iput-wide p2, p0, Lcom/android/apksig/Hints$PatternWithRange;->offset:J

    .line 65
    iput-wide p4, p0, Lcom/android/apksig/Hints$PatternWithRange;->size:J

    .line 66
    return-void
.end method


# virtual methods
.method public ClampToAbsoluteByteRange(Lcom/android/apksig/Hints$ByteRange;)Lcom/android/apksig/Hints$ByteRange;
    .locals 7
    .param p1, "rangeIn"    # Lcom/android/apksig/Hints$ByteRange;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rangeIn"
        }
    .end annotation

    .line 73
    iget-wide v0, p1, Lcom/android/apksig/Hints$ByteRange;->end:J

    iget-wide v2, p1, Lcom/android/apksig/Hints$ByteRange;->start:J

    sub-long/2addr v0, v2

    iget-wide v2, p0, Lcom/android/apksig/Hints$PatternWithRange;->offset:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 74
    const/4 v0, 0x0

    return-object v0

    .line 76
    :cond_0
    iget-wide v0, p1, Lcom/android/apksig/Hints$ByteRange;->start:J

    iget-wide v2, p0, Lcom/android/apksig/Hints$PatternWithRange;->offset:J

    add-long/2addr v0, v2

    .line 77
    .local v0, "rangeOutStart":J
    iget-wide v2, p1, Lcom/android/apksig/Hints$ByteRange;->end:J

    sub-long/2addr v2, v0

    iget-wide v4, p0, Lcom/android/apksig/Hints$PatternWithRange;->size:J

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    .line 79
    .local v2, "rangeOutSize":J
    new-instance v4, Lcom/android/apksig/Hints$ByteRange;

    add-long v5, v0, v2

    invoke-direct {v4, v0, v1, v5, v6}, Lcom/android/apksig/Hints$ByteRange;-><init>(JJ)V

    return-object v4
.end method

.method public matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    .locals 1
    .param p1, "input"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lcom/android/apksig/Hints$PatternWithRange;->pattern:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    return-object v0
.end method
