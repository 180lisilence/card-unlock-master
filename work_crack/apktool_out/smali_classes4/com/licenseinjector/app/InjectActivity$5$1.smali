.class Lcom/licenseinjector/app/InjectActivity$5$1;
.super Ljava/lang/Object;
.source "InjectActivity.java"

# interfaces
.implements Lcom/licenseinjector/app/core/Injector$Log;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/licenseinjector/app/InjectActivity$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/licenseinjector/app/InjectActivity$5;


# direct methods
.method constructor <init>(Lcom/licenseinjector/app/InjectActivity$5;)V
    .locals 0
    .param p1, "this$1"    # Lcom/licenseinjector/app/InjectActivity$5;

    .line 315
    iput-object p1, p0, Lcom/licenseinjector/app/InjectActivity$5$1;->this$1:Lcom/licenseinjector/app/InjectActivity$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public log(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .line 318
    iget-object v0, p0, Lcom/licenseinjector/app/InjectActivity$5$1;->this$1:Lcom/licenseinjector/app/InjectActivity$5;

    iget-object v0, v0, Lcom/licenseinjector/app/InjectActivity$5;->this$0:Lcom/licenseinjector/app/InjectActivity;

    invoke-static {v0, p1}, Lcom/licenseinjector/app/InjectActivity;->access$600(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)V

    .line 319
    return-void
.end method
