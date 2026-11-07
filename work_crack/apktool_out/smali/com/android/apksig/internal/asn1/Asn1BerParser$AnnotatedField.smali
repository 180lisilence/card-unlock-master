.class final Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
.super Ljava/lang/Object;
.source "Asn1BerParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/asn1/Asn1BerParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AnnotatedField"
.end annotation


# instance fields
.field private final mAnnotation:Lcom/android/apksig/internal/asn1/Asn1Field;

.field private final mBerTagClass:I

.field private final mBerTagNumber:I

.field private final mDataType:Lcom/android/apksig/internal/asn1/Asn1Type;

.field private final mField:Ljava/lang/reflect/Field;

.field private final mOptional:Z

.field private final mTagClass:Lcom/android/apksig/internal/asn1/Asn1TagClass;

.field private final mTagging:Lcom/android/apksig/internal/asn1/Asn1Tagging;


# direct methods
.method public constructor <init>(Ljava/lang/reflect/Field;Lcom/android/apksig/internal/asn1/Asn1Field;)V
    .locals 6
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .param p2, "annotation"    # Lcom/android/apksig/internal/asn1/Asn1Field;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "field",
            "annotation"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 360
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 361
    iput-object p1, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mField:Ljava/lang/reflect/Field;

    .line 362
    iput-object p2, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mAnnotation:Lcom/android/apksig/internal/asn1/Asn1Field;

    .line 363
    invoke-interface {p2}, Lcom/android/apksig/internal/asn1/Asn1Field;->type()Lcom/android/apksig/internal/asn1/Asn1Type;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mDataType:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 365
    invoke-interface {p2}, Lcom/android/apksig/internal/asn1/Asn1Field;->cls()Lcom/android/apksig/internal/asn1/Asn1TagClass;

    move-result-object v1

    .line 366
    .local v1, "tagClass":Lcom/android/apksig/internal/asn1/Asn1TagClass;
    sget-object v2, Lcom/android/apksig/internal/asn1/Asn1TagClass;->AUTOMATIC:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    const/4 v3, -0x1

    if-ne v1, v2, :cond_1

    .line 367
    invoke-interface {p2}, Lcom/android/apksig/internal/asn1/Asn1Field;->tagNumber()I

    move-result v2

    if-eq v2, v3, :cond_0

    .line 368
    sget-object v1, Lcom/android/apksig/internal/asn1/Asn1TagClass;->CONTEXT_SPECIFIC:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    goto :goto_0

    .line 370
    :cond_0
    sget-object v1, Lcom/android/apksig/internal/asn1/Asn1TagClass;->UNIVERSAL:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    .line 373
    :cond_1
    :goto_0
    iput-object v1, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mTagClass:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    .line 374
    invoke-static {v1}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->getTagClass(Lcom/android/apksig/internal/asn1/Asn1TagClass;)I

    move-result v2

    iput v2, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mBerTagClass:I

    .line 377
    invoke-interface {p2}, Lcom/android/apksig/internal/asn1/Asn1Field;->tagNumber()I

    move-result v2

    if-eq v2, v3, :cond_2

    .line 378
    invoke-interface {p2}, Lcom/android/apksig/internal/asn1/Asn1Field;->tagNumber()I

    move-result v0

    .local v0, "tagNumber":I
    goto :goto_2

    .line 379
    .end local v0    # "tagNumber":I
    :cond_2
    sget-object v2, Lcom/android/apksig/internal/asn1/Asn1Type;->CHOICE:Lcom/android/apksig/internal/asn1/Asn1Type;

    if-eq v0, v2, :cond_4

    sget-object v2, Lcom/android/apksig/internal/asn1/Asn1Type;->ANY:Lcom/android/apksig/internal/asn1/Asn1Type;

    if-ne v0, v2, :cond_3

    goto :goto_1

    .line 382
    :cond_3
    invoke-static {v0}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->getTagNumber(Lcom/android/apksig/internal/asn1/Asn1Type;)I

    move-result v0

    .restart local v0    # "tagNumber":I
    goto :goto_2

    .line 380
    .end local v0    # "tagNumber":I
    :cond_4
    :goto_1
    const/4 v0, -0x1

    .line 384
    .restart local v0    # "tagNumber":I
    :goto_2
    iput v0, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mBerTagNumber:I

    .line 386
    invoke-interface {p2}, Lcom/android/apksig/internal/asn1/Asn1Field;->tagging()Lcom/android/apksig/internal/asn1/Asn1Tagging;

    move-result-object v2

    iput-object v2, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mTagging:Lcom/android/apksig/internal/asn1/Asn1Tagging;

    .line 387
    sget-object v4, Lcom/android/apksig/internal/asn1/Asn1Tagging;->EXPLICIT:Lcom/android/apksig/internal/asn1/Asn1Tagging;

    if-eq v2, v4, :cond_5

    sget-object v4, Lcom/android/apksig/internal/asn1/Asn1Tagging;->IMPLICIT:Lcom/android/apksig/internal/asn1/Asn1Tagging;

    if-ne v2, v4, :cond_6

    .line 388
    :cond_5
    invoke-interface {p2}, Lcom/android/apksig/internal/asn1/Asn1Field;->tagNumber()I

    move-result v4

    if-eq v4, v3, :cond_7

    .line 393
    :cond_6
    invoke-interface {p2}, Lcom/android/apksig/internal/asn1/Asn1Field;->optional()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mOptional:Z

    .line 394
    return-void

    .line 389
    :cond_7
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Tag number must be specified when tagging mode is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public getAnnotation()Lcom/android/apksig/internal/asn1/Asn1Field;
    .locals 1

    .line 401
    iget-object v0, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mAnnotation:Lcom/android/apksig/internal/asn1/Asn1Field;

    return-object v0
.end method

.method public getBerTagClass()I
    .locals 1

    .line 409
    iget v0, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mBerTagClass:I

    return v0
.end method

.method public getBerTagNumber()I
    .locals 1

    .line 413
    iget v0, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mBerTagNumber:I

    return v0
.end method

.method public getField()Ljava/lang/reflect/Field;
    .locals 1

    .line 397
    iget-object v0, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mField:Ljava/lang/reflect/Field;

    return-object v0
.end method

.method public isOptional()Z
    .locals 1

    .line 405
    iget-boolean v0, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mOptional:Z

    return v0
.end method

.method public setValueFrom(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Object;)V
    .locals 7
    .param p1, "dataValue"    # Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    .param p2, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dataValue",
            "obj"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 417
    invoke-virtual {p1}, Lcom/android/apksig/internal/asn1/ber/BerDataValue;->getTagClass()I

    move-result v0

    .line 418
    .local v0, "readTagClass":I
    iget v1, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mBerTagNumber:I

    const/4 v2, -0x1

    const-string v3, ", but found "

    if-eq v1, v2, :cond_1

    .line 419
    invoke-virtual {p1}, Lcom/android/apksig/internal/asn1/ber/BerDataValue;->getTagNumber()I

    move-result v1

    .line 420
    .local v1, "readTagNumber":I
    iget v2, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mBerTagClass:I

    if-ne v0, v2, :cond_0

    iget v2, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mBerTagNumber:I

    if-ne v1, v2, :cond_0

    .line 427
    .end local v1    # "readTagNumber":I
    goto :goto_0

    .line 421
    .restart local v1    # "readTagNumber":I
    :cond_0
    new-instance v2, Lcom/android/apksig/internal/asn1/Asn1BerParser$Asn1UnexpectedTagException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Tag mismatch. Expected: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mBerTagClass:I

    iget v6, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mBerTagNumber:I

    .line 423
    invoke-static {v5, v6}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->tagClassAndNumberToString(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 425
    invoke-static {v0, v1}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->tagClassAndNumberToString(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/asn1/Asn1BerParser$Asn1UnexpectedTagException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 428
    .end local v1    # "readTagNumber":I
    :cond_1
    iget v1, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mBerTagClass:I

    if-ne v0, v1, :cond_3

    .line 437
    :goto_0
    iget-object v1, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mTagging:Lcom/android/apksig/internal/asn1/Asn1Tagging;

    sget-object v2, Lcom/android/apksig/internal/asn1/Asn1Tagging;->EXPLICIT:Lcom/android/apksig/internal/asn1/Asn1Tagging;

    if-ne v1, v2, :cond_2

    .line 439
    :try_start_0
    invoke-virtual {p1}, Lcom/android/apksig/internal/asn1/ber/BerDataValue;->contentsReader()Lcom/android/apksig/internal/asn1/ber/BerDataValueReader;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/apksig/internal/asn1/ber/BerDataValueReader;->readDataValue()Lcom/android/apksig/internal/asn1/ber/BerDataValue;

    move-result-object v1
    :try_end_0
    .catch Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-object p1, v1

    .line 443
    goto :goto_1

    .line 440
    :catch_0
    move-exception v1

    .line 441
    .local v1, "e":Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
    new-instance v2, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    const-string v3, "Failed to read contents of EXPLICIT data value"

    invoke-direct {v2, v3, v1}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 446
    .end local v1    # "e":Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mField:Ljava/lang/reflect/Field;

    iget-object v2, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mDataType:Lcom/android/apksig/internal/asn1/Asn1Type;

    invoke-static {p2, v1, v2, p1}, Lcom/android/apksig/internal/asn1/Asn1BerParser$BerToJavaConverter;->setFieldValue(Ljava/lang/Object;Ljava/lang/reflect/Field;Lcom/android/apksig/internal/asn1/Asn1Type;Lcom/android/apksig/internal/asn1/ber/BerDataValue;)V

    .line 447
    return-void

    .line 429
    :cond_3
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1BerParser$Asn1UnexpectedTagException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tag mismatch. Expected class: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v4, p0, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->mBerTagClass:I

    .line 431
    invoke-static {v4}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->tagClassToString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 433
    invoke-static {v0}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->tagClassToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1BerParser$Asn1UnexpectedTagException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
