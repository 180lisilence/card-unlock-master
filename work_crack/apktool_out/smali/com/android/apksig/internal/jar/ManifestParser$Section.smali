.class public Lcom/android/apksig/internal/jar/ManifestParser$Section;
.super Ljava/lang/Object;
.source "ManifestParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/jar/ManifestParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Section"
.end annotation


# instance fields
.field private final mAttributes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/jar/ManifestParser$Attribute;",
            ">;"
        }
    .end annotation
.end field

.field private final mName:Ljava/lang/String;

.field private final mSizeBytes:I

.field private final mStartOffset:I


# direct methods
.method public constructor <init>(IILjava/util/List;)V
    .locals 4
    .param p1, "startOffset"    # I
    .param p2, "sizeBytes"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "startOffset",
            "sizeBytes",
            "attrs"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/jar/ManifestParser$Attribute;",
            ">;)V"
        }
    .end annotation

    .line 301
    .local p3, "attrs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/jar/ManifestParser$Attribute;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 302
    iput p1, p0, Lcom/android/apksig/internal/jar/ManifestParser$Section;->mStartOffset:I

    .line 303
    iput p2, p0, Lcom/android/apksig/internal/jar/ManifestParser$Section;->mSizeBytes:I

    .line 304
    const/4 v0, 0x0

    .line 305
    .local v0, "sectionName":Ljava/lang/String;
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 306
    const/4 v1, 0x0

    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/jar/ManifestParser$Attribute;

    .line 307
    .local v1, "firstAttr":Lcom/android/apksig/internal/jar/ManifestParser$Attribute;
    const-string v2, "Name"

    invoke-virtual {v1}, Lcom/android/apksig/internal/jar/ManifestParser$Attribute;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 308
    invoke-virtual {v1}, Lcom/android/apksig/internal/jar/ManifestParser$Attribute;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 311
    .end local v1    # "firstAttr":Lcom/android/apksig/internal/jar/ManifestParser$Attribute;
    :cond_0
    iput-object v0, p0, Lcom/android/apksig/internal/jar/ManifestParser$Section;->mName:Ljava/lang/String;

    .line 312
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/android/apksig/internal/jar/ManifestParser$Section;->mAttributes:Ljava/util/List;

    .line 313
    return-void
.end method


# virtual methods
.method public getAttributeValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 355
    iget-object v0, p0, Lcom/android/apksig/internal/jar/ManifestParser$Section;->mAttributes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/jar/ManifestParser$Attribute;

    .line 356
    .local v1, "attr":Lcom/android/apksig/internal/jar/ManifestParser$Attribute;
    invoke-virtual {v1}, Lcom/android/apksig/internal/jar/ManifestParser$Attribute;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 357
    invoke-virtual {v1}, Lcom/android/apksig/internal/jar/ManifestParser$Attribute;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 359
    .end local v1    # "attr":Lcom/android/apksig/internal/jar/ManifestParser$Attribute;
    :cond_0
    goto :goto_0

    .line 360
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAttributeValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;
    .locals 1
    .param p1, "name"    # Ljava/util/jar/Attributes$Name;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "name"
        }
    .end annotation

    .line 345
    invoke-virtual {p1}, Ljava/util/jar/Attributes$Name;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/apksig/internal/jar/ManifestParser$Section;->getAttributeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAttributes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/jar/ManifestParser$Attribute;",
            ">;"
        }
    .end annotation

    .line 337
    iget-object v0, p0, Lcom/android/apksig/internal/jar/ManifestParser$Section;->mAttributes:Ljava/util/List;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 316
    iget-object v0, p0, Lcom/android/apksig/internal/jar/ManifestParser$Section;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getSizeBytes()I
    .locals 1

    .line 330
    iget v0, p0, Lcom/android/apksig/internal/jar/ManifestParser$Section;->mSizeBytes:I

    return v0
.end method

.method public getStartOffset()I
    .locals 1

    .line 323
    iget v0, p0, Lcom/android/apksig/internal/jar/ManifestParser$Section;->mStartOffset:I

    return v0
.end method
