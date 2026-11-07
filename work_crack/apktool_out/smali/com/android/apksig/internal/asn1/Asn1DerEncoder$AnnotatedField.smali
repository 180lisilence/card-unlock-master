.class final Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
.super Ljava/lang/Object;
.source "Asn1DerEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/asn1/Asn1DerEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AnnotatedField"
.end annotation


# instance fields
.field private final mAnnotation:Lcom/android/apksig/internal/asn1/Asn1Field;

.field private final mDataType:Lcom/android/apksig/internal/asn1/Asn1Type;

.field private final mDerTagClass:I

.field private final mDerTagNumber:I

.field private final mElementDataType:Lcom/android/apksig/internal/asn1/Asn1Type;

.field private final mField:Ljava/lang/reflect/Field;

.field private final mObject:Ljava/lang/Object;

.field private final mOptional:Z

.field private final mTagClass:Lcom/android/apksig/internal/asn1/Asn1TagClass;

.field private final mTagging:Lcom/android/apksig/internal/asn1/Asn1Tagging;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/reflect/Field;Lcom/android/apksig/internal/asn1/Asn1Field;)V
    .locals 6
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "field"    # Ljava/lang/reflect/Field;
    .param p3, "annotation"    # Lcom/android/apksig/internal/asn1/Asn1Field;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "obj",
            "field",
            "annotation"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 359
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 360
    iput-object p1, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mObject:Ljava/lang/Object;

    .line 361
    iput-object p2, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mField:Ljava/lang/reflect/Field;

    .line 362
    iput-object p3, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mAnnotation:Lcom/android/apksig/internal/asn1/Asn1Field;

    .line 363
    invoke-interface {p3}, Lcom/android/apksig/internal/asn1/Asn1Field;->type()Lcom/android/apksig/internal/asn1/Asn1Type;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mDataType:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 364
    invoke-interface {p3}, Lcom/android/apksig/internal/asn1/Asn1Field;->elementType()Lcom/android/apksig/internal/asn1/Asn1Type;

    move-result-object v1

    iput-object v1, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mElementDataType:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 366
    invoke-interface {p3}, Lcom/android/apksig/internal/asn1/Asn1Field;->cls()Lcom/android/apksig/internal/asn1/Asn1TagClass;

    move-result-object v1

    .line 367
    .local v1, "tagClass":Lcom/android/apksig/internal/asn1/Asn1TagClass;
    sget-object v2, Lcom/android/apksig/internal/asn1/Asn1TagClass;->AUTOMATIC:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    const/4 v3, -0x1

    if-ne v1, v2, :cond_1

    .line 368
    invoke-interface {p3}, Lcom/android/apksig/internal/asn1/Asn1Field;->tagNumber()I

    move-result v2

    if-eq v2, v3, :cond_0

    .line 369
    sget-object v1, Lcom/android/apksig/internal/asn1/Asn1TagClass;->CONTEXT_SPECIFIC:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    goto :goto_0

    .line 371
    :cond_0
    sget-object v1, Lcom/android/apksig/internal/asn1/Asn1TagClass;->UNIVERSAL:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    .line 374
    :cond_1
    :goto_0
    iput-object v1, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mTagClass:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    .line 375
    invoke-static {v1}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->getTagClass(Lcom/android/apksig/internal/asn1/Asn1TagClass;)I

    move-result v2

    iput v2, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mDerTagClass:I

    .line 378
    invoke-interface {p3}, Lcom/android/apksig/internal/asn1/Asn1Field;->tagNumber()I

    move-result v2

    if-eq v2, v3, :cond_2

    .line 379
    invoke-interface {p3}, Lcom/android/apksig/internal/asn1/Asn1Field;->tagNumber()I

    move-result v0

    .local v0, "tagNumber":I
    goto :goto_2

    .line 380
    .end local v0    # "tagNumber":I
    :cond_2
    sget-object v2, Lcom/android/apksig/internal/asn1/Asn1Type;->CHOICE:Lcom/android/apksig/internal/asn1/Asn1Type;

    if-eq v0, v2, :cond_4

    sget-object v2, Lcom/android/apksig/internal/asn1/Asn1Type;->ANY:Lcom/android/apksig/internal/asn1/Asn1Type;

    if-ne v0, v2, :cond_3

    goto :goto_1

    .line 383
    :cond_3
    invoke-static {v0}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->getTagNumber(Lcom/android/apksig/internal/asn1/Asn1Type;)I

    move-result v0

    .restart local v0    # "tagNumber":I
    goto :goto_2

    .line 381
    .end local v0    # "tagNumber":I
    :cond_4
    :goto_1
    const/4 v0, -0x1

    .line 385
    .restart local v0    # "tagNumber":I
    :goto_2
    iput v0, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mDerTagNumber:I

    .line 387
    invoke-interface {p3}, Lcom/android/apksig/internal/asn1/Asn1Field;->tagging()Lcom/android/apksig/internal/asn1/Asn1Tagging;

    move-result-object v2

    iput-object v2, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mTagging:Lcom/android/apksig/internal/asn1/Asn1Tagging;

    .line 388
    sget-object v4, Lcom/android/apksig/internal/asn1/Asn1Tagging;->EXPLICIT:Lcom/android/apksig/internal/asn1/Asn1Tagging;

    if-eq v2, v4, :cond_5

    sget-object v4, Lcom/android/apksig/internal/asn1/Asn1Tagging;->IMPLICIT:Lcom/android/apksig/internal/asn1/Asn1Tagging;

    if-ne v2, v4, :cond_6

    .line 389
    :cond_5
    invoke-interface {p3}, Lcom/android/apksig/internal/asn1/Asn1Field;->tagNumber()I

    move-result v4

    if-eq v4, v3, :cond_7

    .line 394
    :cond_6
    invoke-interface {p3}, Lcom/android/apksig/internal/asn1/Asn1Field;->optional()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mOptional:Z

    .line 395
    return-void

    .line 390
    :cond_7
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Tag number must be specified when tagging mode is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public getAnnotation()Lcom/android/apksig/internal/asn1/Asn1Field;
    .locals 1

    .line 402
    iget-object v0, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mAnnotation:Lcom/android/apksig/internal/asn1/Asn1Field;

    return-object v0
.end method

.method public getField()Ljava/lang/reflect/Field;
    .locals 1

    .line 398
    iget-object v0, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mField:Ljava/lang/reflect/Field;

    return-object v0
.end method

.method public toDer()[B
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 406
    iget-object v0, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mObject:Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mField:Ljava/lang/reflect/Field;

    invoke-static {v0, v1}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->access$100(Ljava/lang/Object;Ljava/lang/reflect/Field;)Ljava/lang/Object;

    move-result-object v0

    .line 407
    .local v0, "fieldValue":Ljava/lang/Object;
    if-nez v0, :cond_1

    .line 408
    iget-boolean v1, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mOptional:Z

    if-eqz v1, :cond_0

    .line 409
    const/4 v1, 0x0

    return-object v1

    .line 411
    :cond_0
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    const-string v2, "Required field not set"

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 414
    :cond_1
    iget-object v1, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mDataType:Lcom/android/apksig/internal/asn1/Asn1Type;

    iget-object v2, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mElementDataType:Lcom/android/apksig/internal/asn1/Asn1Type;

    invoke-static {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$JavaToDerConverter;->toDer(Ljava/lang/Object;Lcom/android/apksig/internal/asn1/Asn1Type;Lcom/android/apksig/internal/asn1/Asn1Type;)[B

    move-result-object v1

    .line 415
    .local v1, "encoded":[B
    sget-object v2, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$1;->$SwitchMap$com$android$apksig$internal$asn1$Asn1Tagging:[I

    iget-object v3, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mTagging:Lcom/android/apksig/internal/asn1/Asn1Tagging;

    invoke-virtual {v3}, Lcom/android/apksig/internal/asn1/Asn1Tagging;->ordinal()I

    move-result v3

    aget v2, v2, v3

    const/4 v3, 0x0

    packed-switch v2, :pswitch_data_0

    .line 433
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown tagging mode: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mTagging:Lcom/android/apksig/internal/asn1/Asn1Tagging;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 421
    :pswitch_0
    aget-byte v2, v1, v3

    invoke-static {v2}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->getTagNumber(B)I

    move-result v2

    .line 422
    .local v2, "originalTagNumber":I
    const/16 v4, 0x1f

    if-eq v2, v4, :cond_3

    .line 425
    iget v5, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mDerTagNumber:I

    if-ge v5, v4, :cond_2

    .line 429
    aget-byte v4, v1, v3

    invoke-static {v4, v5}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->setTagNumber(BI)B

    move-result v4

    aput-byte v4, v1, v3

    .line 430
    aget-byte v4, v1, v3

    iget v5, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mDerTagClass:I

    invoke-static {v4, v5}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->setTagClass(BI)B

    move-result v4

    aput-byte v4, v1, v3

    .line 431
    return-object v1

    .line 426
    :cond_2
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unsupported high tag number: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mDerTagNumber:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 423
    :cond_3
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    const-string v4, "High-tag-number form not supported"

    invoke-direct {v3, v4}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 419
    .end local v2    # "originalTagNumber":I
    :pswitch_1
    iget v2, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mDerTagClass:I

    iget v4, p0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->mDerTagNumber:I

    const/4 v5, 0x1

    new-array v6, v5, [[B

    aput-object v1, v6, v3

    invoke-static {v2, v5, v4, v6}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->access$200(IZI[[B)[B

    move-result-object v2

    return-object v2

    .line 417
    :pswitch_2
    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
