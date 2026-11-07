.class public Lcom/android/apksig/internal/jar/ManifestParser$Attribute;
.super Ljava/lang/Object;
.source "ManifestParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/jar/ManifestParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Attribute"
.end annotation


# instance fields
.field private final mName:Ljava/lang/String;

.field private final mValue:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "name",
            "value"
        }
    .end annotation

    .line 265
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 266
    iput-object p1, p0, Lcom/android/apksig/internal/jar/ManifestParser$Attribute;->mName:Ljava/lang/String;

    .line 267
    iput-object p2, p0, Lcom/android/apksig/internal/jar/ManifestParser$Attribute;->mValue:Ljava/lang/String;

    .line 268
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .line 274
    iget-object v0, p0, Lcom/android/apksig/internal/jar/ManifestParser$Attribute;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .line 281
    iget-object v0, p0, Lcom/android/apksig/internal/jar/ManifestParser$Attribute;->mValue:Ljava/lang/String;

    return-object v0
.end method
