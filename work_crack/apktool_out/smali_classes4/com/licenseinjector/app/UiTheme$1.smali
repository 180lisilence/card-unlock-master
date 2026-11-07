.class Lcom/licenseinjector/app/UiTheme$1;
.super Ljava/lang/Object;
.source "UiTheme.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/licenseinjector/app/UiTheme;->styleButton(Landroid/widget/Button;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$d:Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;


# direct methods
.method constructor <init>(Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 74
    iput-object p1, p0, Lcom/licenseinjector/app/UiTheme$1;->val$d:Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 76
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 78
    iget-object v0, p0, Lcom/licenseinjector/app/UiTheme$1;->val$d:Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;

    invoke-virtual {v0}, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;->stop()V

    return-void
.end method
