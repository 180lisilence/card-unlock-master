.class Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable$1;
.super Ljava/lang/Object;
.source "UiTheme.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;-><init>(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;


# direct methods
.method constructor <init>(Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;

    .line 151
    iput-object p1, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable$1;->this$0:Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 4
    .param p1, "a"    # Landroid/animation/ValueAnimator;

    .line 154
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 155
    .local v0, "f":F
    iget-object v1, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable$1;->this$0:Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;

    invoke-static {v1}, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->access$200(Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;)Landroid/graphics/Matrix;

    move-result-object v1

    neg-float v2, v0

    const/high16 v3, 0x44480000    # 800.0f

    mul-float/2addr v2, v3

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 156
    iget-object v1, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable$1;->this$0:Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;

    invoke-static {v1}, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->access$300(Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;)Landroid/graphics/LinearGradient;

    move-result-object v1

    iget-object v2, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable$1;->this$0:Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;

    invoke-static {v2}, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->access$200(Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;)Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/LinearGradient;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 157
    iget-object v1, p0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable$1;->this$0:Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;

    invoke-virtual {v1}, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->invalidateSelf()V

    .line 158
    return-void
.end method
