.class Lcom/licenseinjector/app/InjectActivity$2;
.super Ljava/lang/Object;
.source "InjectActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/licenseinjector/app/InjectActivity;->buildUi()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/licenseinjector/app/InjectActivity;

.field final synthetic val$devCode:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/licenseinjector/app/InjectActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 121
    iput-object p1, p0, Lcom/licenseinjector/app/InjectActivity$2;->this$0:Lcom/licenseinjector/app/InjectActivity;

    iput-object p2, p0, Lcom/licenseinjector/app/InjectActivity$2;->val$devCode:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .line 124
    iget-object v0, p0, Lcom/licenseinjector/app/InjectActivity$2;->val$devCode:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 125
    iget-object v0, p0, Lcom/licenseinjector/app/InjectActivity$2;->this$0:Lcom/licenseinjector/app/InjectActivity;

    const-string v2, "\u8bbe\u5907\u7801\u83b7\u53d6\u5931\u8d25"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 126
    return-void

    .line 128
    :cond_0
    iget-object v0, p0, Lcom/licenseinjector/app/InjectActivity$2;->this$0:Lcom/licenseinjector/app/InjectActivity;

    const-string v2, "clipboard"

    invoke-virtual {v0, v2}, Lcom/licenseinjector/app/InjectActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    .line 129
    .local v0, "cm":Landroid/content/ClipboardManager;
    if-eqz v0, :cond_1

    const-string v2, "devcode"

    iget-object v3, p0, Lcom/licenseinjector/app/InjectActivity$2;->val$devCode:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 130
    :cond_1
    iget-object v2, p0, Lcom/licenseinjector/app/InjectActivity$2;->this$0:Lcom/licenseinjector/app/InjectActivity;

    const-string v3, "\u5df2\u590d\u5236\u8bbe\u5907\u7801"

    invoke-static {v2, v3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 131
    return-void
.end method
