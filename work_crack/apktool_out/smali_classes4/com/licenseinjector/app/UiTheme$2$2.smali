.class Lcom/licenseinjector/app/UiTheme$2$2;
.super Ljava/lang/Object;
.source "UiTheme.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


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

.field final synthetic val$a:Landroid/animation/ValueAnimator;


# direct methods
.method constructor <init>(Lcom/licenseinjector/app/UiTheme$2;Landroid/animation/ValueAnimator;)V
    .locals 0
    .param p1, "this$0"    # Lcom/licenseinjector/app/UiTheme$2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 122
    iput-object p1, p0, Lcom/licenseinjector/app/UiTheme$2$2;->this$0:Lcom/licenseinjector/app/UiTheme$2;

    iput-object p2, p0, Lcom/licenseinjector/app/UiTheme$2$2;->val$a:Landroid/animation/ValueAnimator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 124
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 127
    iget-object v0, p0, Lcom/licenseinjector/app/UiTheme$2$2;->val$a:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 128
    return-void
.end method
