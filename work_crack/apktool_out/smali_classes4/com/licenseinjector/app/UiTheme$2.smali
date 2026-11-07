.class Lcom/licenseinjector/app/UiTheme$2;
.super Ljava/lang/Object;
.source "UiTheme.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/licenseinjector/app/UiTheme;->shimmerText(Landroid/widget/TextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$t:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 88
    iput-object p1, p0, Lcom/licenseinjector/app/UiTheme$2;->val$t:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 11

    .line 91
    iget-object v0, p0, Lcom/licenseinjector/app/UiTheme$2;->val$t:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 92
    iget-object v0, p0, Lcom/licenseinjector/app/UiTheme$2;->val$t:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getWidth()I

    move-result v0

    .line 93
    .local v0, "w":I
    if-gtz v0, :cond_0

    .line 95
    iget-object v1, p0, Lcom/licenseinjector/app/UiTheme$2;->val$t:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v1

    new-instance v10, Landroid/graphics/LinearGradient;

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v2, p0, Lcom/licenseinjector/app/UiTheme$2;->val$t:Landroid/widget/TextView;

    .line 96
    invoke-virtual {v2}, Landroid/widget/TextView;->getTextSize()F

    move-result v2

    iget-object v5, p0, Lcom/licenseinjector/app/UiTheme$2;->val$t:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v2, v5

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {v5, v2}, Ljava/lang/Math;->max(FF)F

    move-result v5

    const/4 v6, 0x0

    .line 97
    invoke-static {}, Lcom/licenseinjector/app/UiTheme;->access$000()[I

    move-result-object v7

    const/4 v8, 0x0

    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move-object v2, v10

    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 95
    invoke-virtual {v1, v10}, Landroid/text/TextPaint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 98
    iget-object v1, p0, Lcom/licenseinjector/app/UiTheme$2;->val$t:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->invalidate()V

    .line 99
    return-void

    .line 101
    :cond_0
    int-to-float v1, v0

    .line 102
    .local v1, "tileW":F
    new-instance v10, Landroid/graphics/LinearGradient;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    .line 103
    invoke-static {}, Lcom/licenseinjector/app/UiTheme;->access$000()[I

    move-result-object v7

    const/4 v8, 0x0

    sget-object v9, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    move-object v2, v10

    move v5, v1

    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 104
    .local v2, "grad":Landroid/graphics/LinearGradient;
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    .line 105
    .local v3, "m":Landroid/graphics/Matrix;
    iget-object v4, p0, Lcom/licenseinjector/app/UiTheme$2;->val$t:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/text/TextPaint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 106
    const/4 v4, 0x2

    new-array v5, v4, [F

    fill-array-data v5, :array_0

    invoke-static {v5}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v5

    .line 107
    .local v5, "a":Landroid/animation/ValueAnimator;
    const-wide/16 v6, 0xbb8

    invoke-virtual {v5, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 108
    const/4 v6, -0x1

    invoke-virtual {v5, v6}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 109
    invoke-virtual {v5, v4}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 110
    new-instance v4, Lcom/licenseinjector/app/UiTheme$2$1;

    invoke-direct {v4, p0, v3, v1, v2}, Lcom/licenseinjector/app/UiTheme$2$1;-><init>(Lcom/licenseinjector/app/UiTheme$2;Landroid/graphics/Matrix;FLandroid/graphics/LinearGradient;)V

    invoke-virtual {v5, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 119
    invoke-virtual {v5}, Landroid/animation/ValueAnimator;->start()V

    .line 121
    iget-object v4, p0, Lcom/licenseinjector/app/UiTheme$2;->val$t:Landroid/widget/TextView;

    new-instance v6, Lcom/licenseinjector/app/UiTheme$2$2;

    invoke-direct {v6, p0, v5}, Lcom/licenseinjector/app/UiTheme$2$2;-><init>(Lcom/licenseinjector/app/UiTheme$2;Landroid/animation/ValueAnimator;)V

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 130
    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
