.class Lcom/licenseinjector/app/InjectActivity$6;
.super Ljava/lang/Object;
.source "InjectActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/licenseinjector/app/InjectActivity;->toast(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/licenseinjector/app/InjectActivity;

.field final synthetic val$s:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/licenseinjector/app/InjectActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 336
    iput-object p1, p0, Lcom/licenseinjector/app/InjectActivity$6;->this$0:Lcom/licenseinjector/app/InjectActivity;

    iput-object p2, p0, Lcom/licenseinjector/app/InjectActivity$6;->val$s:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 339
    iget-object v0, p0, Lcom/licenseinjector/app/InjectActivity$6;->this$0:Lcom/licenseinjector/app/InjectActivity;

    iget-object v1, p0, Lcom/licenseinjector/app/InjectActivity$6;->val$s:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 340
    return-void
.end method
