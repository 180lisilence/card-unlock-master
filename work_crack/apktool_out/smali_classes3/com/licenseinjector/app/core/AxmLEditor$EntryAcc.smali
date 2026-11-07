.class final Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;
.super Ljava/lang/Object;
.source "AxmLEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/licenseinjector/app/core/AxmLEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "EntryAcc"
.end annotation


# instance fields
.field alias:Z

.field launchMode:Ljava/lang/String;

.field launcher:Z

.field main:Z

.field final name:Ljava/lang/String;

.field noHistory:Z

.field process:Ljava/lang/String;

.field target:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .line 370
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 371
    iput-object p1, p0, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->name:Ljava/lang/String;

    .line 372
    return-void
.end method


# virtual methods
.method toEntry()Lcom/licenseinjector/app/core/AxmLEditor$Entry;
    .locals 10

    .line 375
    new-instance v9, Lcom/licenseinjector/app/core/AxmLEditor$Entry;

    iget-object v1, p0, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->name:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->launcher:Z

    iget-boolean v3, p0, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->main:Z

    iget-boolean v4, p0, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->alias:Z

    iget-object v5, p0, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->target:Ljava/lang/String;

    iget-boolean v6, p0, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->noHistory:Z

    iget-object v7, p0, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->launchMode:Ljava/lang/String;

    iget-object v8, p0, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->process:Ljava/lang/String;

    move-object v0, v9

    invoke-direct/range {v0 .. v8}, Lcom/licenseinjector/app/core/AxmLEditor$Entry;-><init>(Ljava/lang/String;ZZZLjava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-object v9
.end method
