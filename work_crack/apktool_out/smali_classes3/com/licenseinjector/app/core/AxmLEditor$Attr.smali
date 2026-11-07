.class final Lcom/licenseinjector/app/core/AxmLEditor$Attr;
.super Ljava/lang/Object;
.source "AxmLEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/licenseinjector/app/core/AxmLEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Attr"
.end annotation


# instance fields
.field final data:I

.field final nameIdx:I

.field final nsIdx:I

.field final type:I


# direct methods
.method constructor <init>(IIII)V
    .locals 0
    .param p1, "nsIdx"    # I
    .param p2, "nameIdx"    # I
    .param p3, "type"    # I
    .param p4, "data"    # I

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    iput p1, p0, Lcom/licenseinjector/app/core/AxmLEditor$Attr;->nsIdx:I

    .line 123
    iput p2, p0, Lcom/licenseinjector/app/core/AxmLEditor$Attr;->nameIdx:I

    .line 124
    iput p3, p0, Lcom/licenseinjector/app/core/AxmLEditor$Attr;->type:I

    .line 125
    iput p4, p0, Lcom/licenseinjector/app/core/AxmLEditor$Attr;->data:I

    .line 126
    return-void
.end method
