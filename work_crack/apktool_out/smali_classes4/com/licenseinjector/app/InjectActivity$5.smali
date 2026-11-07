.class Lcom/licenseinjector/app/InjectActivity$5;
.super Ljava/lang/Object;
.source "InjectActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/licenseinjector/app/InjectActivity;->startInject()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/licenseinjector/app/InjectActivity;

.field final synthetic val$in:Landroid/net/Uri;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$out:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/licenseinjector/app/InjectActivity;Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;)V
    .locals 0
    .param p1, "this$0"    # Lcom/licenseinjector/app/InjectActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 304
    iput-object p1, p0, Lcom/licenseinjector/app/InjectActivity$5;->this$0:Lcom/licenseinjector/app/InjectActivity;

    iput-object p2, p0, Lcom/licenseinjector/app/InjectActivity$5;->val$in:Landroid/net/Uri;

    iput-object p3, p0, Lcom/licenseinjector/app/InjectActivity$5;->val$key:Ljava/lang/String;

    iput-object p4, p0, Lcom/licenseinjector/app/InjectActivity$5;->val$out:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 307
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/licenseinjector/app/InjectActivity$5;->this$0:Lcom/licenseinjector/app/InjectActivity;

    invoke-virtual {v1}, Lcom/licenseinjector/app/InjectActivity;->getCacheDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "target_in.apk"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 308
    .local v0, "inTmp":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/licenseinjector/app/InjectActivity$5;->this$0:Lcom/licenseinjector/app/InjectActivity;

    invoke-virtual {v2}, Lcom/licenseinjector/app/InjectActivity;->getCacheDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "target_out.apk"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 310
    .local v1, "outTmp":Ljava/io/File;
    :try_start_0
    iget-object v2, p0, Lcom/licenseinjector/app/InjectActivity$5;->this$0:Lcom/licenseinjector/app/InjectActivity;

    iget-object v3, p0, Lcom/licenseinjector/app/InjectActivity$5;->val$in:Landroid/net/Uri;

    invoke-static {v2, v3, v0}, Lcom/licenseinjector/app/InjectActivity;->access$300(Lcom/licenseinjector/app/InjectActivity;Landroid/net/Uri;Ljava/io/File;)V

    .line 311
    iget-object v2, p0, Lcom/licenseinjector/app/InjectActivity$5;->this$0:Lcom/licenseinjector/app/InjectActivity;

    const-string v3, "payload.dex"

    invoke-static {v2, v3}, Lcom/licenseinjector/app/InjectActivity;->access$400(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)[B

    move-result-object v5

    .line 312
    .local v5, "payload":[B
    iget-object v2, p0, Lcom/licenseinjector/app/InjectActivity$5;->this$0:Lcom/licenseinjector/app/InjectActivity;

    const-string v3, "inject.p12"

    invoke-static {v2, v3}, Lcom/licenseinjector/app/InjectActivity;->access$400(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)[B

    move-result-object v7

    .line 313
    .local v7, "ks":[B
    iget-object v2, p0, Lcom/licenseinjector/app/InjectActivity$5;->this$0:Lcom/licenseinjector/app/InjectActivity;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[*] \u76ee\u6807: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/licenseinjector/app/InjectActivity$5;->this$0:Lcom/licenseinjector/app/InjectActivity;

    invoke-static {v4}, Lcom/licenseinjector/app/InjectActivity;->access$500(Lcom/licenseinjector/app/InjectActivity;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/licenseinjector/app/InjectActivity;->access$600(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)V

    .line 314
    iget-object v2, p0, Lcom/licenseinjector/app/InjectActivity$5;->this$0:Lcom/licenseinjector/app/InjectActivity;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[*] \u5bc6\u94a5: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/licenseinjector/app/InjectActivity$5;->val$key:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "(\u7a7a)"

    goto :goto_0

    :cond_0
    iget-object v4, p0, Lcom/licenseinjector/app/InjectActivity$5;->val$key:Ljava/lang/String;

    :goto_0
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/licenseinjector/app/InjectActivity;->access$600(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)V

    .line 315
    iget-object v6, p0, Lcom/licenseinjector/app/InjectActivity$5;->val$key:Ljava/lang/String;

    new-instance v8, Lcom/licenseinjector/app/InjectActivity$5$1;

    invoke-direct {v8, p0}, Lcom/licenseinjector/app/InjectActivity$5$1;-><init>(Lcom/licenseinjector/app/InjectActivity$5;)V

    move-object v3, v0

    move-object v4, v1

    invoke-static/range {v3 .. v8}, Lcom/licenseinjector/app/core/Injector;->inject(Ljava/io/File;Ljava/io/File;[BLjava/lang/String;[BLcom/licenseinjector/app/core/Injector$Log;)V

    .line 321
    iget-object v2, p0, Lcom/licenseinjector/app/InjectActivity$5;->this$0:Lcom/licenseinjector/app/InjectActivity;

    iget-object v3, p0, Lcom/licenseinjector/app/InjectActivity$5;->val$out:Landroid/net/Uri;

    invoke-static {v2, v1, v3}, Lcom/licenseinjector/app/InjectActivity;->access$700(Lcom/licenseinjector/app/InjectActivity;Ljava/io/File;Landroid/net/Uri;)V

    .line 322
    iget-object v2, p0, Lcom/licenseinjector/app/InjectActivity$5;->this$0:Lcom/licenseinjector/app/InjectActivity;

    const-string v3, "[\u2713] \u5df2\u4fdd\u5b58\u5230\u6240\u9009\u4f4d\u7f6e"

    invoke-static {v2, v3}, Lcom/licenseinjector/app/InjectActivity;->access$600(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)V

    .line 323
    iget-object v2, p0, Lcom/licenseinjector/app/InjectActivity$5;->this$0:Lcom/licenseinjector/app/InjectActivity;

    const-string v3, "\u6ce8\u5165\u5b8c\u6210"

    invoke-static {v2, v3}, Lcom/licenseinjector/app/InjectActivity;->access$800(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v5    # "payload":[B
    .end local v7    # "ks":[B
    goto :goto_1

    .line 324
    :catchall_0
    move-exception v2

    .line 325
    .local v2, "t":Ljava/lang/Throwable;
    :try_start_1
    iget-object v3, p0, Lcom/licenseinjector/app/InjectActivity$5;->this$0:Lcom/licenseinjector/app/InjectActivity;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[!] \u5931\u8d25: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/licenseinjector/app/InjectActivity;->access$600(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)V

    .line 326
    iget-object v3, p0, Lcom/licenseinjector/app/InjectActivity$5;->this$0:Lcom/licenseinjector/app/InjectActivity;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u5931\u8d25: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/licenseinjector/app/InjectActivity;->access$800(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 328
    .end local v2    # "t":Ljava/lang/Throwable;
    :goto_1
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 329
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 330
    nop

    .line 331
    return-void

    .line 328
    :catchall_1
    move-exception v2

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 329
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 330
    throw v2
.end method
