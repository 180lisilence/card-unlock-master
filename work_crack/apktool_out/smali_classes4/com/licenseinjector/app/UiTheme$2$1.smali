.class Lcom/licenseinjector/app/UiTheme$2$1;
.super Ljava/lang/Object;
.source "UiTheme.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/licenseinjector/app/UiTheme$2;->onGlobalLayout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/licenseinjector/app/UiTheme$2;

.field final synthetic val$grad:Landroid/graphics/LinearGradient;

.field final synthetic val$m:Landroid/graphics/Matrix;

.field final synthetic val$tileW:F


# direct methods
.method constructor <init>(Lcom/licenseinjector/app/UiTheme$2;Landroid/graphics/Matrix;FLandroid/graphics/LinearGradient;)V
    .locals 0
    .param p1, "this$0"    # Lcom/licenseinjector/app/UiTheme$2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 110
    iput-object p1, p0, Lcom/licenseinjector/app/UiTheme$2$1;->this$0:Lcom/licenseinjector/app/UiTheme$2;

    iput-object p2, p0, Lcom/licenseinjector/app/UiTheme$2$1;->val$m:Landroid/graphics/Matrix;

    iput p3, p0, Lcom/licenseinjector/app/UiTheme$2$1;->val$tileW:F

    iput-object p4, p0, Lcom/licenseinjector/app/UiTheme$2$1;->val$grad:Landroid/graphics/LinearGradient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 4
    .param p1, "animation"    # Landroid/animation/ValueAnimator;

    .line 113
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 114
    .local v0, "f":F
    iget-object v1, p0, Lcom/licenseinjector/app/UiTheme$2$1;->val$m:Landroid/graphics/Matrix;

    neg-float v2, v0

    iget v3, p0, Lcom/licenseinjector/app/UiTheme$2$1;->val$tileW:F

    mul-float/2addr v2, v3

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 115
    iget-object v1, p0, Lcom/licenseinjector/app/UiTheme$2$1;->val$grad:Landroid/graphics/LinearGradient;

    iget-object v2, p0, Lcom/licenseinjector/app/UiTheme$2$1;->val$m:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/LinearGradient;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 116
    iget-object v1, p0, Lcom/licenseinjector/app/UiTheme$2$1;->this$0:Lcom/licenseinjector/app/UiTheme$2;

    iget-object v1, v1, Lcom/licenseinjector/app/UiTheme$2;->val$t:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->invalidate()V

    .line 117
    return-void
.end method
