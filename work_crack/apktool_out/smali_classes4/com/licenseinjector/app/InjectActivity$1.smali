.class Lcom/licenseinjector/app/InjectActivity$1;
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


# direct methods
.method constructor <init>(Lcom/licenseinjector/app/InjectActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/licenseinjector/app/InjectActivity;

    .line 78
    iput-object p1, p0, Lcom/licenseinjector/app/InjectActivity$1;->this$0:Lcom/licenseinjector/app/InjectActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .line 81
    iget-object v0, p0, Lcom/licenseinjector/app/InjectActivity$1;->this$0:Lcom/licenseinjector/app/InjectActivity;

    const/16 v1, 0x3e9

    invoke-static {v0, v1}, Lcom/licenseinjector/app/InjectActivity;->access$000(Lcom/licenseinjector/app/InjectActivity;I)V

    .line 82
    return-void
.end method
