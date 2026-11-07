.class public final Lcom/licenseinjector/app/core/AxmLEditor$Entry;
.super Ljava/lang/Object;
.source "AxmLEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/licenseinjector/app/core/AxmLEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Entry"
.end annotation


# instance fields
.field public final alias:Z

.field public final launchMode:Ljava/lang/String;

.field public final launcher:Z

.field public final main:Z

.field public final name:Ljava/lang/String;

.field public final noHistory:Z

.field public final process:Ljava/lang/String;

.field public final target:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;ZZZLjava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "launcher"    # Z
    .param p3, "main"    # Z
    .param p4, "alias"    # Z
    .param p5, "target"    # Ljava/lang/String;
    .param p6, "noHistory"    # Z
    .param p7, "launchMode"    # Ljava/lang/String;
    .param p8, "process"    # Ljava/lang/String;

    .line 317
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 318
    iput-object p1, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->name:Ljava/lang/String;

    .line 319
    iput-boolean p2, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->launcher:Z

    .line 320
    iput-boolean p3, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->main:Z

    .line 321
    iput-boolean p4, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->alias:Z

    .line 322
    iput-object p5, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->target:Ljava/lang/String;

    .line 323
    iput-boolean p6, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->noHistory:Z

    .line 324
    iput-object p7, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->launchMode:Ljava/lang/String;

    .line 325
    iput-object p8, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->process:Ljava/lang/String;

    .line 326
    return-void
.end method


# virtual methods
.method public isEntry()Z
    .locals 1

    .line 329
    iget-boolean v0, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->launcher:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->main:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public kindText()Ljava/lang/String;
    .locals 1

    .line 338
    iget-boolean v0, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->launcher:Z

    if-eqz v0, :cond_0

    .line 339
    const-string v0, "\u684c\u9762\u5165\u53e3 \u00b7 LAUNCHER"

    return-object v0

    .line 341
    :cond_0
    iget-boolean v0, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->main:Z

    if-eqz v0, :cond_1

    const-string v0, "MAIN \u5165\u53e3 \u00b7 ACTION_MAIN"

    goto :goto_0

    :cond_1
    const-string v0, "\u666e\u901a\u754c\u9762 \u00b7 \u65e0\u5165\u53e3\u8fc7\u6ee4\u5668"

    :goto_0
    return-object v0
.end method

.method public label()Ljava/lang/String;
    .locals 3

    .line 346
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 347
    .local v0, "sbAppend":Ljava/lang/StringBuilder;
    iget-boolean v1, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->launcher:Z

    if-eqz v1, :cond_0

    .line 348
    const-string v1, "  [\u684c\u9762\u5165\u53e3]"

    .local v1, "str":Ljava/lang/String;
    goto :goto_0

    .line 350
    .end local v1    # "str":Ljava/lang/String;
    :cond_0
    iget-boolean v1, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->main:Z

    if-eqz v1, :cond_1

    const-string v1, "  [MAIN]"

    goto :goto_0

    :cond_1
    const-string v1, "  [\u754c\u9762]"

    .line 352
    .restart local v1    # "str":Ljava/lang/String;
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public realClass()Ljava/lang/String;
    .locals 2

    .line 334
    iget-boolean v0, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->alias:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->target:Ljava/lang/String;

    move-object v1, v0

    .local v1, "str":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->target:Ljava/lang/String;

    goto :goto_1

    .end local v1    # "str":Ljava/lang/String;
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->name:Ljava/lang/String;

    :goto_1
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 356
    invoke-virtual {p0}, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->label()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
