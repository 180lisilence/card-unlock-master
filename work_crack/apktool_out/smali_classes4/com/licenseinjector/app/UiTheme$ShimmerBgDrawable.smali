.class public Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "UiTheme.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/licenseinjector/app/UiTheme;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ShimmerBgDrawable"
.end annotation


# instance fields
.field private final anim:Landroid/animation/ValueAnimator;

.field private final grad:Landroid/graphics/LinearGradient;

.field private final m:Landroid/graphics/Matrix;

.field private final paint:Landroid/graphics/Paint;

.field private final radius:F

.field private final rect:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(F)V
    .locals 10
    .param p1, "radiusDp"    # F

    .line 143
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 136
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->paint:Landroid/graphics/Paint;

    .line 139
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->m:Landroid/graphics/Matrix;

    .line 141
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->rect:Landroid/graphics/RectF;

    .line 144
    invoke-static {p1}, Lcom/licenseinjector/app/UiTheme;->access$100(F)F

    move-result v1

    iput v1, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->radius:F

    .line 145
    new-instance v1, Landroid/graphics/LinearGradient;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/high16 v5, 0x44480000    # 800.0f

    const/4 v6, 0x0

    invoke-static {}, Lcom/licenseinjector/app/UiTheme;->access$000()[I

    move-result-object v7

    const/4 v8, 0x0

    sget-object v9, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    move-object v2, v1

    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v1, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->grad:Landroid/graphics/LinearGradient;

    .line 146
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 147
    const/4 v0, 0x2

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->anim:Landroid/animation/ValueAnimator;

    .line 148
    const-wide/16 v2, 0xbb8

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 149
    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 150
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 151
    new-instance v0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable$1;

    invoke-direct {v0, p0}, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable$1;-><init>(Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;)V

    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 160
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    .line 161
    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method static synthetic access$200(Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;)Landroid/graphics/Matrix;
    .locals 1
    .param p0, "x0"    # Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;

    .line 135
    iget-object v0, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->m:Landroid/graphics/Matrix;

    return-object v0
.end method

.method static synthetic access$300(Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;)Landroid/graphics/LinearGradient;
    .locals 1
    .param p0, "x0"    # Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;

    .line 135
    iget-object v0, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->grad:Landroid/graphics/LinearGradient;

    return-object v0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 170
    iget-object v0, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->rect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->radius:F

    iget-object v2, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v1, v2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 171
    return-void
.end method

.method public getOpacity()I
    .locals 1

    .line 185
    const/4 v0, -0x3

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .line 165
    iget-object v0, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->rect:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 166
    return-void
.end method

.method public setAlpha(I)V
    .locals 1
    .param p1, "alpha"    # I

    .line 175
    iget-object v0, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 176
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .param p1, "colorFilter"    # Landroid/graphics/ColorFilter;

    .line 180
    iget-object v0, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 181
    return-void
.end method

.method public stop()V
    .locals 1

    .line 189
    iget-object v0, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->anim:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 190
    return-void
.end method
