.class Lcom/licenseinjector/app/InjectActivity$4;
.super Ljava/lang/Object;
.source "InjectActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/licenseinjector/app/InjectActivity;->log(Ljava/lang/String;)V
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

    .line 291
    iput-object p1, p0, Lcom/licenseinjector/app/InjectActivity$4;->this$0:Lcom/licenseinjector/app/InjectActivity;

    iput-object p2, p0, Lcom/licenseinjector/app/InjectActivity$4;->val$s:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 294
    iget-object v0, p0, Lcom/licenseinjector/app/InjectActivity$4;->this$0:Lcom/licenseinjector/app/InjectActivity;

    invoke-static {v0}, Lcom/licenseinjector/app/InjectActivity;->access$200(Lcom/licenseinjector/app/InjectActivity;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/licenseinjector/app/InjectActivity$4;->val$s:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 295
    return-void
.end method
