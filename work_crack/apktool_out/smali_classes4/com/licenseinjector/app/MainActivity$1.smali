.class Lcom/licenseinjector/app/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/licenseinjector/app/MainActivity;->buildUi()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/licenseinjector/app/MainActivity;


# direct methods
.method constructor <init>(Lcom/licenseinjector/app/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/licenseinjector/app/MainActivity;

    .line 64
    iput-object p1, p0, Lcom/licenseinjector/app/MainActivity$1;->this$0:Lcom/licenseinjector/app/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 67
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/licenseinjector/app/MainActivity$1;->this$0:Lcom/licenseinjector/app/MainActivity;

    const-class v2, Lcom/licenseinjector/app/GeneratorActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 68
    .local v0, "it":Landroid/content/Intent;
    iget-object v1, p0, Lcom/licenseinjector/app/MainActivity$1;->this$0:Lcom/licenseinjector/app/MainActivity;

    invoke-static {v1}, Lcom/licenseinjector/app/MainActivity;->access$000(Lcom/licenseinjector/app/MainActivity;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, "key"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    iget-object v1, p0, Lcom/licenseinjector/app/MainActivity$1;->this$0:Lcom/licenseinjector/app/MainActivity;

    invoke-virtual {v1, v0}, Lcom/licenseinjector/app/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 70
    return-void
.end method
