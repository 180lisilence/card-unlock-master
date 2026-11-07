.class public final Lcom/android/apksig/internal/asn1/Asn1DerEncoder;
.super Ljava/lang/Object;
.source "Asn1DerEncoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;,
        Lcom/android/apksig/internal/asn1/Asn1DerEncoder$JavaToDerConverter;,
        Lcom/android/apksig/internal/asn1/Asn1DerEncoder$ByteArrayLexicographicComparator;
    }
.end annotation


# static fields
.field public static final ASN1_DER_NULL:Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 594
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    const/4 v1, 0x2

    new-array v1, v1, [B

    fill-array-data v1, :array_0

    invoke-direct {v0, v1}, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;-><init>([B)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->ASN1_DER_NULL:Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    return-void

    :array_0
    .array-data 1
        0x5t
        0x0t
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100(Ljava/lang/Object;Ljava/lang/reflect/Field;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Ljava/lang/Object;
    .param p1, "x1"    # Ljava/lang/reflect/Field;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 38
    invoke-static {p0, p1}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->getMemberFieldValue(Ljava/lang/Object;Ljava/lang/reflect/Field;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000(Ljava/util/Collection;Lcom/android/apksig/internal/asn1/Asn1Type;)[B
    .locals 1
    .param p0, "x0"    # Ljava/util/Collection;
    .param p1, "x1"    # Lcom/android/apksig/internal/asn1/Asn1Type;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 38
    invoke-static {p0, p1}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toSetOf(Ljava/util/Collection;Lcom/android/apksig/internal/asn1/Asn1Type;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1100(Ljava/util/Collection;Lcom/android/apksig/internal/asn1/Asn1Type;)[B
    .locals 1
    .param p0, "x0"    # Ljava/util/Collection;
    .param p1, "x1"    # Lcom/android/apksig/internal/asn1/Asn1Type;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 38
    invoke-static {p0, p1}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toSequenceOf(Ljava/util/Collection;Lcom/android/apksig/internal/asn1/Asn1Type;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(IZI[[B)[B
    .locals 1
    .param p0, "x0"    # I
    .param p1, "x1"    # Z
    .param p2, "x2"    # I
    .param p3, "x3"    # [[B

    .line 38
    invoke-static {p0, p1, p2, p3}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->createTag(IZI[[B)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(I)[B
    .locals 1
    .param p0, "x0"    # I

    .line 38
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toInteger(I)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(J)[B
    .locals 1
    .param p0, "x0"    # J

    .line 38
    invoke-static {p0, p1}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toInteger(J)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Ljava/math/BigInteger;)[B
    .locals 1
    .param p0, "x0"    # Ljava/math/BigInteger;

    .line 38
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toInteger(Ljava/math/BigInteger;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Z)[B
    .locals 1
    .param p0, "x0"    # Z

    .line 38
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toBoolean(Z)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Ljava/lang/String;)[B
    .locals 1
    .param p0, "x0"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 38
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toOid(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$800(Ljava/lang/Object;)[B
    .locals 1
    .param p0, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 38
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toSequence(Ljava/lang/Object;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$900(Ljava/lang/Object;)[B
    .locals 1
    .param p0, "x0"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 38
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toChoice(Ljava/lang/Object;)[B

    move-result-object v0

    return-object v0
.end method

.method private static varargs createTag(IZI[[B)[B
    .locals 11
    .param p0, "tagClass"    # I
    .param p1, "constructed"    # Z
    .param p2, "tagNumber"    # I
    .param p3, "contents"    # [[B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "tagClass",
            "constructed",
            "tagNumber",
            "contents"
        }
    .end annotation

    .line 440
    const/16 v0, 0x1f

    if-ge p2, v0, :cond_7

    .line 444
    shl-int/lit8 v0, p0, 0x6

    .line 445
    const/4 v1, 0x0

    if-eqz p1, :cond_0

    const/16 v2, 0x20

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    or-int/2addr v0, v2

    or-int/2addr v0, p2

    int-to-byte v0, v0

    .line 447
    .local v0, "firstIdentifierByte":B
    const/4 v2, 0x0

    .line 448
    .local v2, "contentsLength":I
    array-length v3, p3

    move v4, v1

    :goto_1
    if-ge v4, v3, :cond_1

    aget-object v5, p3, v4

    .line 449
    .local v5, "c":[B
    array-length v6, v5

    add-int/2addr v2, v6

    .line 448
    .end local v5    # "c":[B
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 453
    :cond_1
    const/16 v3, 0x80

    const/4 v4, 0x1

    if-ge v2, v3, :cond_2

    .line 455
    const/4 v3, 0x2

    .line 456
    .local v3, "contentsPosInResult":I
    add-int v5, v3, v2

    new-array v5, v5, [B

    .line 457
    .local v5, "result":[B
    aput-byte v0, v5, v1

    .line 458
    int-to-byte v6, v2

    aput-byte v6, v5, v4

    goto/16 :goto_3

    .line 463
    .end local v3    # "contentsPosInResult":I
    .end local v5    # "result":[B
    :cond_2
    const/4 v3, 0x2

    const/16 v5, 0xff

    if-gt v2, v5, :cond_3

    .line 464
    const/4 v5, 0x3

    .line 465
    .local v5, "contentsPosInResult":I
    add-int v6, v5, v2

    new-array v6, v6, [B

    .line 466
    .local v6, "result":[B
    const/16 v7, -0x7f

    aput-byte v7, v6, v4

    .line 467
    int-to-byte v4, v2

    aput-byte v4, v6, v3

    move v3, v5

    move-object v5, v6

    goto :goto_2

    .line 468
    .end local v5    # "contentsPosInResult":I
    .end local v6    # "result":[B
    :cond_3
    const v6, 0xffff

    const/4 v7, 0x3

    if-gt v2, v6, :cond_4

    .line 469
    const/4 v5, 0x4

    .line 470
    .restart local v5    # "contentsPosInResult":I
    add-int v6, v5, v2

    new-array v6, v6, [B

    .line 471
    .restart local v6    # "result":[B
    const/16 v8, -0x7e

    aput-byte v8, v6, v4

    .line 472
    shr-int/lit8 v4, v2, 0x8

    int-to-byte v4, v4

    aput-byte v4, v6, v3

    .line 473
    and-int/lit16 v3, v2, 0xff

    int-to-byte v3, v3

    aput-byte v3, v6, v7

    move v3, v5

    move-object v5, v6

    goto :goto_2

    .line 474
    .end local v5    # "contentsPosInResult":I
    .end local v6    # "result":[B
    :cond_4
    const v6, 0xffffff

    const/4 v8, 0x4

    if-gt v2, v6, :cond_5

    .line 475
    const/4 v6, 0x5

    .line 476
    .local v6, "contentsPosInResult":I
    add-int v9, v6, v2

    new-array v9, v9, [B

    .line 477
    .local v9, "result":[B
    const/16 v10, -0x7d

    aput-byte v10, v9, v4

    .line 478
    shr-int/lit8 v4, v2, 0x10

    int-to-byte v4, v4

    aput-byte v4, v9, v3

    .line 479
    shr-int/lit8 v3, v2, 0x8

    and-int/2addr v3, v5

    int-to-byte v3, v3

    aput-byte v3, v9, v7

    .line 480
    and-int/lit16 v3, v2, 0xff

    int-to-byte v3, v3

    aput-byte v3, v9, v8

    move v3, v6

    move-object v5, v9

    goto :goto_2

    .line 482
    .end local v6    # "contentsPosInResult":I
    .end local v9    # "result":[B
    :cond_5
    const/4 v6, 0x6

    .line 483
    .restart local v6    # "contentsPosInResult":I
    add-int v9, v6, v2

    new-array v9, v9, [B

    .line 484
    .restart local v9    # "result":[B
    const/16 v10, -0x7c

    aput-byte v10, v9, v4

    .line 485
    shr-int/lit8 v4, v2, 0x18

    int-to-byte v4, v4

    aput-byte v4, v9, v3

    .line 486
    shr-int/lit8 v3, v2, 0x10

    and-int/2addr v3, v5

    int-to-byte v3, v3

    aput-byte v3, v9, v7

    .line 487
    shr-int/lit8 v3, v2, 0x8

    and-int/2addr v3, v5

    int-to-byte v3, v3

    aput-byte v3, v9, v8

    .line 488
    and-int/lit16 v3, v2, 0xff

    int-to-byte v3, v3

    const/4 v4, 0x5

    aput-byte v3, v9, v4

    move v3, v6

    move-object v5, v9

    .line 490
    .end local v6    # "contentsPosInResult":I
    .end local v9    # "result":[B
    .restart local v3    # "contentsPosInResult":I
    .local v5, "result":[B
    :goto_2
    aput-byte v0, v5, v1

    .line 492
    :goto_3
    array-length v4, p3

    move v6, v1

    :goto_4
    if-ge v6, v4, :cond_6

    aget-object v7, p3, v6

    .line 493
    .local v7, "c":[B
    array-length v8, v7

    invoke-static {v7, v1, v5, v3, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 494
    array-length v8, v7

    add-int/2addr v3, v8

    .line 492
    .end local v7    # "c":[B
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 496
    :cond_6
    return-object v5

    .line 441
    .end local v0    # "firstIdentifierByte":B
    .end local v2    # "contentsLength":I
    .end local v3    # "contentsPosInResult":I
    .end local v5    # "result":[B
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "High tag numbers not supported: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static encode(Ljava/lang/Object;)[B
    .locals 6
    .param p0, "container"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "container"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 55
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 56
    .local v0, "containerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Lcom/android/apksig/internal/asn1/Asn1Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/asn1/Asn1Class;

    .line 57
    .local v1, "containerAnnotation":Lcom/android/apksig/internal/asn1/Asn1Class;
    if-eqz v1, :cond_0

    .line 62
    invoke-interface {v1}, Lcom/android/apksig/internal/asn1/Asn1Class;->type()Lcom/android/apksig/internal/asn1/Asn1Type;

    move-result-object v2

    .line 63
    .local v2, "containerType":Lcom/android/apksig/internal/asn1/Asn1Type;
    sget-object v3, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$1;->$SwitchMap$com$android$apksig$internal$asn1$Asn1Type:[I

    invoke-virtual {v2}, Lcom/android/apksig/internal/asn1/Asn1Type;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 71
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unsupported container type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 69
    :pswitch_0
    const/4 v3, 0x1

    invoke-static {p0, v3}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toSequence(Ljava/lang/Object;Z)[B

    move-result-object v3

    return-object v3

    .line 67
    :pswitch_1
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toSequence(Ljava/lang/Object;)[B

    move-result-object v3

    return-object v3

    .line 65
    :pswitch_2
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toChoice(Ljava/lang/Object;)[B

    move-result-object v3

    return-object v3

    .line 58
    .end local v2    # "containerType":Lcom/android/apksig/internal/asn1/Asn1Type;
    :cond_0
    new-instance v2, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " not annotated with "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-class v4, Lcom/android/apksig/internal/asn1/Asn1Class;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getAnnotatedFields(Ljava/lang/Object;)Ljava/util/List;
    .locals 10
    .param p0, "container"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "container"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 215
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 216
    .local v0, "containerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    .line 217
    .local v1, "declaredFields":[Ljava/lang/reflect/Field;
    new-instance v2, Ljava/util/ArrayList;

    array-length v3, v1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 218
    .local v2, "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;>;"
    array-length v3, v1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_2

    aget-object v5, v1, v4

    .line 219
    .local v5, "field":Ljava/lang/reflect/Field;
    const-class v6, Lcom/android/apksig/internal/asn1/Asn1Field;

    invoke-virtual {v5, v6}, Ljava/lang/reflect/Field;->getDeclaredAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/internal/asn1/Asn1Field;

    .line 220
    .local v6, "annotation":Lcom/android/apksig/internal/asn1/Asn1Field;
    if-nez v6, :cond_0

    .line 221
    goto :goto_1

    .line 223
    :cond_0
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v7

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v7

    const-string v8, "."

    if-nez v7, :cond_1

    .line 231
    :try_start_0
    new-instance v7, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;

    invoke-direct {v7, p0, v5, v6}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;-><init>(Ljava/lang/Object;Ljava/lang/reflect/Field;Lcom/android/apksig/internal/asn1/Asn1Field;)V
    :try_end_0
    .catch Lcom/android/apksig/internal/asn1/Asn1EncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 237
    .local v7, "annotatedField":Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
    nop

    .line 238
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    .end local v5    # "field":Ljava/lang/reflect/Field;
    .end local v6    # "annotation":Lcom/android/apksig/internal/asn1/Asn1Field;
    .end local v7    # "annotatedField":Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 232
    .restart local v5    # "field":Ljava/lang/reflect/Field;
    .restart local v6    # "annotation":Lcom/android/apksig/internal/asn1/Asn1Field;
    :catch_0
    move-exception v3

    .line 233
    .local v3, "e":Lcom/android/apksig/internal/asn1/Asn1EncodingException;
    new-instance v4, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Invalid ASN.1 annotation on "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 235
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v7, v3}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 224
    .end local v3    # "e":Lcom/android/apksig/internal/asn1/Asn1EncodingException;
    :cond_1
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-class v7, Lcom/android/apksig/internal/asn1/Asn1Field;

    .line 225
    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v7, " used on a static field: "

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 226
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 240
    .end local v5    # "field":Ljava/lang/reflect/Field;
    .end local v6    # "annotation":Lcom/android/apksig/internal/asn1/Asn1Field;
    :cond_2
    return-object v2
.end method

.method private static getMemberFieldValue(Ljava/lang/Object;Ljava/lang/reflect/Field;)Ljava/lang/Object;
    .locals 4
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "field"    # Ljava/lang/reflect/Field;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "obj",
            "field"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 339
    :try_start_0
    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 340
    :catch_0
    move-exception v0

    .line 341
    .local v0, "e":Ljava/lang/ReflectiveOperationException;
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to read "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 342
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method static synthetic lambda$toSequence$0(Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;)I
    .locals 2
    .param p0, "f1"    # Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
    .param p1, "f2"    # Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;

    .line 115
    invoke-virtual {p0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->getAnnotation()Lcom/android/apksig/internal/asn1/Asn1Field;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/apksig/internal/asn1/Asn1Field;->index()I

    move-result v0

    invoke-virtual {p1}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->getAnnotation()Lcom/android/apksig/internal/asn1/Asn1Field;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/apksig/internal/asn1/Asn1Field;->index()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method private static toBoolean(Z)[B
    .locals 4
    .param p0, "value"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 260
    const/4 v0, 0x1

    new-array v1, v0, [B

    .line 261
    .local v1, "result":[B
    const/4 v2, 0x0

    if-nez p0, :cond_0

    .line 262
    aput-byte v2, v1, v2

    goto :goto_0

    .line 264
    :cond_0
    aput-byte v0, v1, v2

    .line 266
    :goto_0
    new-array v3, v0, [[B

    aput-object v1, v3, v2

    invoke-static {v2, v2, v0, v3}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->createTag(IZI[[B)[B

    move-result-object v0

    return-object v0
.end method

.method private static toChoice(Ljava/lang/Object;)[B
    .locals 8
    .param p0, "container"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "container"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 76
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 77
    .local v0, "containerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->getAnnotatedFields(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 78
    .local v1, "fields":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    .line 84
    const/4 v2, 0x0

    .line 85
    .local v2, "resultField":Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;

    .line 86
    .local v4, "field":Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
    invoke-virtual {v4}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->getField()Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->getMemberFieldValue(Ljava/lang/Object;Ljava/lang/reflect/Field;)Ljava/lang/Object;

    move-result-object v5

    .line 87
    .local v5, "fieldValue":Ljava/lang/Object;
    if-eqz v5, :cond_1

    .line 88
    if-nez v2, :cond_0

    .line 94
    move-object v2, v4

    goto :goto_1

    .line 89
    :cond_0
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Multiple non-null fields in CHOICE class "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 90
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 91
    invoke-virtual {v2}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->getField()Ljava/lang/reflect/Field;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 92
    invoke-virtual {v4}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->getField()Ljava/lang/reflect/Field;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 96
    .end local v4    # "field":Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
    .end local v5    # "fieldValue":Ljava/lang/Object;
    :cond_1
    :goto_1
    goto :goto_0

    .line 98
    :cond_2
    if-eqz v2, :cond_3

    .line 103
    invoke-virtual {v2}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->toDer()[B

    move-result-object v3

    return-object v3

    .line 99
    :cond_3
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No non-null fields in CHOICE class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 100
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 79
    .end local v2    # "resultField":Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
    :cond_4
    new-instance v2, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No fields annotated with "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-class v4, Lcom/android/apksig/internal/asn1/Asn1Field;

    .line 80
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " in CHOICE class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 81
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static toInteger(I)[B
    .locals 2
    .param p0, "value"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 244
    int-to-long v0, p0

    invoke-static {v0, v1}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toInteger(J)[B

    move-result-object v0

    return-object v0
.end method

.method private static toInteger(J)[B
    .locals 1
    .param p0, "value"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 248
    invoke-static {p0, p1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    invoke-static {v0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toInteger(Ljava/math/BigInteger;)[B

    move-result-object v0

    return-object v0
.end method

.method private static toInteger(Ljava/math/BigInteger;)[B
    .locals 3
    .param p0, "value"    # Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 252
    const/4 v0, 0x1

    new-array v0, v0, [[B

    .line 254
    invoke-virtual {p0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 252
    const/4 v1, 0x2

    invoke-static {v2, v2, v1, v0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->createTag(IZI[[B)[B

    move-result-object v0

    return-object v0
.end method

.method private static toOid(Ljava/lang/String;)[B
    .locals 14
    .param p0, "oid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "oid"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 270
    const-string v0, "Node #"

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 271
    .local v1, "encodedValue":Ljava/io/ByteArrayOutputStream;
    const-string v2, "\\."

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 272
    .local v2, "nodes":[Ljava/lang/String;
    array-length v3, v2

    const/4 v4, 0x2

    if-lt v3, v4, :cond_8

    .line 278
    const/4 v3, 0x0

    :try_start_0
    aget-object v4, v2, v3

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_2

    .line 281
    .local v4, "firstNode":I
    nop

    .line 282
    const/4 v5, 0x6

    if-gt v4, v5, :cond_7

    if-ltz v4, :cond_7

    .line 288
    const/4 v6, 0x1

    :try_start_1
    aget-object v7, v2, v6

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 291
    .local v7, "secondNode":I
    nop

    .line 292
    const/16 v8, 0x28

    if-ge v7, v8, :cond_6

    if-ltz v7, :cond_6

    .line 295
    mul-int/lit8 v8, v4, 0x28

    add-int/2addr v8, v7

    .line 296
    .local v8, "firstByte":I
    const/16 v9, 0xff

    if-gt v8, v9, :cond_5

    .line 301
    invoke-virtual {v1, v8}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 302
    const/4 v9, 0x2

    .local v9, "i":I
    :goto_0
    array-length v10, v2

    if-ge v9, v10, :cond_4

    .line 303
    aget-object v10, v2, v9

    .line 306
    .local v10, "nodeString":Ljava/lang/String;
    :try_start_2
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 309
    .local v11, "node":I
    nop

    .line 310
    if-ltz v11, :cond_3

    .line 313
    const/16 v12, 0x7f

    if-gt v11, v12, :cond_0

    .line 314
    invoke-virtual {v1, v11}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 315
    goto :goto_1

    .line 317
    :cond_0
    const/16 v13, 0x4000

    if-ge v11, v13, :cond_1

    .line 318
    shr-int/lit8 v12, v11, 0x7

    or-int/lit16 v12, v12, 0x80

    invoke-virtual {v1, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 319
    and-int/lit8 v12, v11, 0x7f

    invoke-virtual {v1, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 320
    goto :goto_1

    .line 322
    :cond_1
    const/high16 v13, 0x200000

    if-ge v11, v13, :cond_2

    .line 323
    shr-int/lit8 v13, v11, 0xe

    or-int/lit16 v13, v13, 0x80

    invoke-virtual {v1, v13}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 324
    shr-int/lit8 v13, v11, 0x7

    and-int/2addr v12, v13

    or-int/lit16 v12, v12, 0x80

    invoke-virtual {v1, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 325
    and-int/lit8 v12, v11, 0x7f

    invoke-virtual {v1, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 326
    nop

    .line 302
    .end local v10    # "nodeString":Ljava/lang/String;
    .end local v11    # "node":I
    :goto_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 328
    .restart local v10    # "nodeString":Ljava/lang/String;
    .restart local v11    # "node":I
    :cond_2
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/lit8 v5, v9, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, " too large: "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 311
    :cond_3
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid value for node #"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v5, v9, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ": "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 307
    .end local v11    # "node":I
    :catch_0
    move-exception v3

    .line 308
    .local v3, "e":Ljava/lang/NumberFormatException;
    new-instance v5, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/lit8 v6, v9, 0x1

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, " not numeric: "

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v0}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 331
    .end local v3    # "e":Ljava/lang/NumberFormatException;
    .end local v9    # "i":I
    .end local v10    # "nodeString":Ljava/lang/String;
    :cond_4
    new-array v0, v6, [[B

    .line 333
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    aput-object v6, v0, v3

    .line 331
    invoke-static {v3, v3, v5, v0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->createTag(IZI[[B)[B

    move-result-object v0

    return-object v0

    .line 297
    :cond_5
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "First two nodes out of range: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "."

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 293
    .end local v8    # "firstByte":I
    :cond_6
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid value for node #2: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 289
    .end local v7    # "secondNode":I
    :catch_1
    move-exception v0

    .line 290
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Node #2 not numeric: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v2, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 283
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_7
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid value for node #1: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 279
    .end local v4    # "firstNode":I
    :catch_2
    move-exception v0

    .line 280
    .restart local v0    # "e":Ljava/lang/NumberFormatException;
    new-instance v4, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Node #1 not numeric: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v3, v2, v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 273
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_8
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "OBJECT IDENTIFIER must contain at least two nodes: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static toSequence(Ljava/lang/Object;)[B
    .locals 1
    .param p0, "container"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "container"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 107
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toSequence(Ljava/lang/Object;Z)[B

    move-result-object v0

    return-object v0
.end method

.method private static toSequence(Ljava/lang/Object;Z)[B
    .locals 10
    .param p0, "container"    # Ljava/lang/Object;
    .param p1, "omitTag"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "container",
            "omitTag"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 112
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 113
    .local v0, "containerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->getAnnotatedFields(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 114
    .local v1, "fields":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;>;"
    new-instance v2, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 116
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const-string v3, "."

    const/4 v4, 0x1

    if-le v2, v4, :cond_2

    .line 117
    const/4 v2, 0x0

    .line 118
    .local v2, "lastField":Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;

    .line 119
    .local v6, "field":Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
    if-eqz v2, :cond_1

    .line 120
    invoke-virtual {v2}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->getAnnotation()Lcom/android/apksig/internal/asn1/Asn1Field;

    move-result-object v7

    invoke-interface {v7}, Lcom/android/apksig/internal/asn1/Asn1Field;->index()I

    move-result v7

    invoke-virtual {v6}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->getAnnotation()Lcom/android/apksig/internal/asn1/Asn1Field;

    move-result-object v8

    invoke-interface {v8}, Lcom/android/apksig/internal/asn1/Asn1Field;->index()I

    move-result v8

    if-eq v7, v8, :cond_0

    goto :goto_1

    .line 121
    :cond_0
    new-instance v4, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Fields have the same index: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 122
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 123
    invoke-virtual {v2}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->getField()Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " and ."

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 124
    invoke-virtual {v6}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->getField()Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 126
    :cond_1
    :goto_1
    move-object v2, v6

    .line 127
    .end local v6    # "field":Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
    goto :goto_0

    .line 130
    .end local v2    # "lastField":Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 131
    .local v2, "serializedFields":Ljava/util/List;, "Ljava/util/List<[B>;"
    const/4 v5, 0x0

    .line 132
    .local v5, "contentLen":I
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;

    .line 135
    .local v7, "field":Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
    :try_start_0
    invoke-virtual {v7}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->toDer()[B

    move-result-object v8
    :try_end_0
    .catch Lcom/android/apksig/internal/asn1/Asn1EncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    .local v8, "serializedField":[B
    nop

    .line 142
    if-eqz v8, :cond_3

    .line 143
    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    array-length v9, v8

    add-int/2addr v5, v9

    .line 146
    .end local v7    # "field":Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
    .end local v8    # "serializedField":[B
    :cond_3
    goto :goto_2

    .line 136
    .restart local v7    # "field":Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
    :catch_0
    move-exception v4

    .line 137
    .local v4, "e":Lcom/android/apksig/internal/asn1/Asn1EncodingException;
    new-instance v6, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to encode "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 138
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 139
    invoke-virtual {v7}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;->getField()Ljava/lang/reflect/Field;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v6, v3, v4}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 148
    .end local v4    # "e":Lcom/android/apksig/internal/asn1/Asn1EncodingException;
    .end local v7    # "field":Lcom/android/apksig/internal/asn1/Asn1DerEncoder$AnnotatedField;
    :cond_4
    const/4 v3, 0x0

    if-eqz p1, :cond_6

    .line 149
    new-array v4, v5, [B

    .line 150
    .local v4, "unencodedResult":[B
    const/4 v6, 0x0

    .line 151
    .local v6, "index":I
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_5

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [B

    .line 152
    .restart local v8    # "serializedField":[B
    array-length v9, v8

    invoke-static {v8, v3, v4, v6, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 153
    array-length v9, v8

    add-int/2addr v6, v9

    .line 154
    .end local v8    # "serializedField":[B
    goto :goto_3

    .line 155
    :cond_5
    return-object v4

    .line 157
    .end local v4    # "unencodedResult":[B
    .end local v6    # "index":I
    :cond_6
    new-array v6, v3, [[B

    .line 159
    invoke-interface {v2, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [[B

    .line 157
    const/16 v7, 0x10

    invoke-static {v3, v4, v7, v6}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->createTag(IZI[[B)[B

    move-result-object v3

    return-object v3
.end method

.method private static toSequenceOf(Ljava/util/Collection;Lcom/android/apksig/internal/asn1/Asn1Type;)[B
    .locals 1
    .param p1, "elementType"    # Lcom/android/apksig/internal/asn1/Asn1Type;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "values",
            "elementType"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;",
            "Lcom/android/apksig/internal/asn1/Asn1Type;",
            ")[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 168
    .local p0, "values":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toSequenceOrSetOf(Ljava/util/Collection;Lcom/android/apksig/internal/asn1/Asn1Type;Z)[B

    move-result-object v0

    return-object v0
.end method

.method private static toSequenceOrSetOf(Ljava/util/Collection;Lcom/android/apksig/internal/asn1/Asn1Type;Z)[B
    .locals 5
    .param p1, "elementType"    # Lcom/android/apksig/internal/asn1/Asn1Type;
    .param p2, "toSet"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "values",
            "elementType",
            "toSet"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;",
            "Lcom/android/apksig/internal/asn1/Asn1Type;",
            "Z)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 173
    .local p0, "values":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 174
    .local v0, "serializedValues":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 175
    .local v2, "value":Ljava/lang/Object;
    const/4 v3, 0x0

    invoke-static {v2, p1, v3}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$JavaToDerConverter;->toDer(Ljava/lang/Object;Lcom/android/apksig/internal/asn1/Asn1Type;Lcom/android/apksig/internal/asn1/Asn1Type;)[B

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    .end local v2    # "value":Ljava/lang/Object;
    goto :goto_0

    .line 178
    :cond_0
    const/4 v1, 0x1

    if-eqz p2, :cond_2

    .line 179
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, v1, :cond_1

    .line 180
    invoke-static {}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$ByteArrayLexicographicComparator;->access$000()Lcom/android/apksig/internal/asn1/Asn1DerEncoder$ByteArrayLexicographicComparator;

    move-result-object v2

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 182
    :cond_1
    const/16 v2, 0x11

    .local v2, "tagNumber":I
    goto :goto_1

    .line 184
    .end local v2    # "tagNumber":I
    :cond_2
    const/16 v2, 0x10

    .line 186
    .restart local v2    # "tagNumber":I
    :goto_1
    const/4 v3, 0x0

    new-array v4, v3, [[B

    .line 188
    invoke-interface {v0, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[B

    .line 186
    invoke-static {v3, v1, v2, v4}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->createTag(IZI[[B)[B

    move-result-object v1

    return-object v1
.end method

.method private static toSetOf(Ljava/util/Collection;Lcom/android/apksig/internal/asn1/Asn1Type;)[B
    .locals 1
    .param p1, "elementType"    # Lcom/android/apksig/internal/asn1/Asn1Type;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "values",
            "elementType"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;",
            "Lcom/android/apksig/internal/asn1/Asn1Type;",
            ")[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 164
    .local p0, "values":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->toSequenceOrSetOf(Ljava/util/Collection;Lcom/android/apksig/internal/asn1/Asn1Type;Z)[B

    move-result-object v0

    return-object v0
.end method
