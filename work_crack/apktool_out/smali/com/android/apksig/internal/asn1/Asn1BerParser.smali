.class public final Lcom/android/apksig/internal/asn1/Asn1BerParser;
.super Ljava/lang/Object;
.source "Asn1BerParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/internal/asn1/Asn1BerParser$Asn1UnexpectedTagException;,
        Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;,
        Lcom/android/apksig/internal/asn1/Asn1BerParser$BerToJavaConverter;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/reflect/Field;)Ljava/lang/Class;
    .locals 1
    .param p0, "x0"    # Ljava/lang/reflect/Field;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 40
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->getElementType(Ljava/lang/reflect/Field;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    .param p1, "x1"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 40
    invoke-static {p0, p1}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parseSetOf(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Ljava/nio/ByteBuffer;)I
    .locals 1
    .param p0, "x0"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 40
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->integerToInt(Ljava/nio/ByteBuffer;)I

    move-result v0

    return v0
.end method

.method static synthetic access$300(Ljava/nio/ByteBuffer;)J
    .locals 2
    .param p0, "x0"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 40
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->integerToLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$400(Ljava/nio/ByteBuffer;)Ljava/math/BigInteger;
    .locals 1
    .param p0, "x0"    # Ljava/nio/ByteBuffer;

    .line 40
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->integerToBigInteger(Ljava/nio/ByteBuffer;)Ljava/math/BigInteger;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Ljava/nio/ByteBuffer;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 40
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->oidToString(Ljava/nio/ByteBuffer;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    .param p1, "x1"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 40
    invoke-static {p0, p1}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parseSequence(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    .param p1, "x1"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 40
    invoke-static {p0, p1}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parseChoice(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static decodeBase128UnsignedLong(Ljava/nio/ByteBuffer;)J
    .locals 5
    .param p0, "encoded"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "encoded"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 481
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-nez v0, :cond_0

    .line 482
    const-wide/16 v0, 0x0

    return-wide v0

    .line 484
    :cond_0
    const-wide/16 v0, 0x0

    .line 485
    .local v0, "result":J
    :goto_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 486
    const-wide v2, 0xffffffffffffffL

    cmp-long v2, v0, v2

    if-gtz v2, :cond_2

    .line 489
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    .line 490
    .local v2, "b":I
    const/4 v3, 0x7

    shl-long/2addr v0, v3

    .line 491
    and-int/lit8 v3, v2, 0x7f

    int-to-long v3, v3

    or-long/2addr v0, v3

    .line 492
    and-int/lit16 v3, v2, 0x80

    if-nez v3, :cond_1

    .line 493
    return-wide v0

    .line 495
    .end local v2    # "b":I
    :cond_1
    goto :goto_0

    .line 487
    :cond_2
    new-instance v2, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    const-string v3, "Base-128 number too large"

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 496
    :cond_3
    new-instance v2, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    const-string v3, "Truncated base-128 encoded input: missing terminating byte, with highest bit not set"

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static getAnnotatedFields(Ljava/lang/Class;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "containerClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 530
    .local p0, "containerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 531
    .local v0, "declaredFields":[Ljava/lang/reflect/Field;
    new-instance v1, Ljava/util/ArrayList;

    array-length v2, v0

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 532
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;>;"
    array-length v2, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v0, v3

    .line 533
    .local v4, "field":Ljava/lang/reflect/Field;
    const-class v5, Lcom/android/apksig/internal/asn1/Asn1Field;

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->getDeclaredAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lcom/android/apksig/internal/asn1/Asn1Field;

    .line 534
    .local v5, "annotation":Lcom/android/apksig/internal/asn1/Asn1Field;
    if-nez v5, :cond_0

    .line 535
    goto :goto_1

    .line 537
    :cond_0
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v6

    invoke-static {v6}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v6

    const-string v7, "."

    if-nez v6, :cond_1

    .line 545
    :try_start_0
    new-instance v6, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;

    invoke-direct {v6, v4, v5}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;-><init>(Ljava/lang/reflect/Field;Lcom/android/apksig/internal/asn1/Asn1Field;)V
    :try_end_0
    .catch Lcom/android/apksig/internal/asn1/Asn1DecodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 551
    .local v6, "annotatedField":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    nop

    .line 552
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 532
    .end local v4    # "field":Ljava/lang/reflect/Field;
    .end local v5    # "annotation":Lcom/android/apksig/internal/asn1/Asn1Field;
    .end local v6    # "annotatedField":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 546
    .restart local v4    # "field":Ljava/lang/reflect/Field;
    .restart local v5    # "annotation":Lcom/android/apksig/internal/asn1/Asn1Field;
    :catch_0
    move-exception v2

    .line 547
    .local v2, "e":Lcom/android/apksig/internal/asn1/Asn1DecodingException;
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Invalid ASN.1 annotation on "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 549
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6, v2}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 538
    .end local v2    # "e":Lcom/android/apksig/internal/asn1/Asn1DecodingException;
    :cond_1
    new-instance v2, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-class v6, Lcom/android/apksig/internal/asn1/Asn1Field;

    .line 539
    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, " used on a static field: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 540
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 554
    .end local v4    # "field":Ljava/lang/reflect/Field;
    .end local v5    # "annotation":Lcom/android/apksig/internal/asn1/Asn1Field;
    :cond_2
    return-object v1
.end method

.method private static getContainerAsn1Type(Ljava/lang/Class;)Lcom/android/apksig/internal/asn1/Asn1Type;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "containerClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/android/apksig/internal/asn1/Asn1Type;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 314
    .local p0, "containerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Lcom/android/apksig/internal/asn1/Asn1Class;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->getDeclaredAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/android/apksig/internal/asn1/Asn1Class;

    .line 315
    .local v0, "containerAnnotation":Lcom/android/apksig/internal/asn1/Asn1Class;
    if-eqz v0, :cond_0

    .line 321
    sget-object v1, Lcom/android/apksig/internal/asn1/Asn1BerParser$1;->$SwitchMap$com$android$apksig$internal$asn1$Asn1Type:[I

    invoke-interface {v0}, Lcom/android/apksig/internal/asn1/Asn1Class;->type()Lcom/android/apksig/internal/asn1/Asn1Type;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/apksig/internal/asn1/Asn1Type;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 327
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported ASN.1 container annotation type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 329
    invoke-interface {v0}, Lcom/android/apksig/internal/asn1/Asn1Class;->type()Lcom/android/apksig/internal/asn1/Asn1Type;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 325
    :pswitch_0
    invoke-interface {v0}, Lcom/android/apksig/internal/asn1/Asn1Class;->type()Lcom/android/apksig/internal/asn1/Asn1Type;

    move-result-object v1

    return-object v1

    .line 316
    :cond_0
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 317
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not annotated with "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-class v3, Lcom/android/apksig/internal/asn1/Asn1Class;

    .line 318
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static getElementType(Ljava/lang/reflect/Field;)Ljava/lang/Class;
    .locals 7
    .param p0, "field"    # Ljava/lang/reflect/Field;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "field"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Field;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 335
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/reflect/Type;->getTypeName()Ljava/lang/String;

    move-result-object v0

    .line 336
    .local v0, "type":Ljava/lang/String;
    const/16 v1, 0x3c

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 337
    .local v1, "delimiterIndex":I
    const-string v2, "Not a container type: "

    const/4 v3, -0x1

    if-eq v1, v3, :cond_1

    .line 340
    add-int/lit8 v4, v1, 0x1

    .line 341
    .local v4, "startIndex":I
    const/16 v5, 0x3e

    invoke-virtual {v0, v5, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    .line 343
    .local v5, "endIndex":I
    if-eq v5, v3, :cond_0

    .line 346
    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 347
    .local v2, "elementClassName":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    return-object v3

    .line 344
    .end local v2    # "elementClassName":Ljava/lang/String;
    :cond_0
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 338
    .end local v4    # "startIndex":I
    .end local v5    # "endIndex":I
    :cond_1
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private static integerToBigInteger(Ljava/nio/ByteBuffer;)Ljava/math/BigInteger;
    .locals 2
    .param p0, "encoded"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "encoded"
        }
    .end annotation

    .line 502
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-nez v0, :cond_0

    .line 503
    sget-object v0, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    return-object v0

    .line 505
    :cond_0
    new-instance v0, Ljava/math/BigInteger;

    invoke-static {p0}, Lcom/android/apksig/internal/util/ByteBufferUtils;->toByteArray(Ljava/nio/ByteBuffer;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>([B)V

    return-object v0
.end method

.method private static integerToInt(Ljava/nio/ByteBuffer;)I
    .locals 4
    .param p0, "encoded"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "encoded"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 509
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->integerToBigInteger(Ljava/nio/ByteBuffer;)Ljava/math/BigInteger;

    move-result-object v0

    .line 510
    .local v0, "value":Ljava/math/BigInteger;
    const-wide/32 v1, -0x80000000

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v1

    if-ltz v1, :cond_0

    .line 511
    const-wide/32 v1, 0x7fffffff

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v1

    if-gtz v1, :cond_0

    .line 515
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v1

    return v1

    .line 512
    :cond_0
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v2

    .line 513
    const-string v3, "INTEGER cannot be represented as int: %1$d (0x%1$x)"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static integerToLong(Ljava/nio/ByteBuffer;)J
    .locals 4
    .param p0, "encoded"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "encoded"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 519
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->integerToBigInteger(Ljava/nio/ByteBuffer;)Ljava/math/BigInteger;

    move-result-object v0

    .line 520
    .local v0, "value":Ljava/math/BigInteger;
    const-wide/high16 v1, -0x8000000000000000L

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v1

    if-ltz v1, :cond_0

    .line 521
    const-wide v1, 0x7fffffffffffffffL

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v1

    if-gtz v1, :cond_0

    .line 525
    invoke-virtual {v0}, Ljava/math/BigInteger;->longValue()J

    move-result-wide v1

    return-wide v1

    .line 522
    :cond_0
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v2

    .line 523
    const-string v3, "INTEGER cannot be represented as long: %1$d (0x%1$x)"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static synthetic lambda$parseSequence$0(Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;)I
    .locals 2
    .param p0, "f1"    # Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    .param p1, "f2"    # Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;

    .line 204
    invoke-virtual {p0}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->getAnnotation()Lcom/android/apksig/internal/asn1/Asn1Field;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/apksig/internal/asn1/Asn1Field;->index()I

    move-result v0

    invoke-virtual {p1}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->getAnnotation()Lcom/android/apksig/internal/asn1/Asn1Field;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/apksig/internal/asn1/Asn1Field;->index()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method private static oidToString(Ljava/nio/ByteBuffer;)Ljava/lang/String;
    .locals 11
    .param p0, "encodedOid"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "encodedOid"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 459
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 464
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->decodeBase128UnsignedLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v0

    .line 465
    .local v0, "firstComponent":J
    const-wide/16 v2, 0x28

    div-long v2, v0, v2

    const-wide/16 v4, 0x2

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v2, v2

    .line 466
    .local v2, "firstNode":I
    mul-int/lit8 v3, v2, 0x28

    int-to-long v3, v3

    sub-long v3, v0, v3

    .line 467
    .local v3, "secondNode":J
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 468
    .local v5, "result":Ljava/lang/StringBuilder;
    int-to-long v6, v2

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x2e

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 469
    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 472
    :goto_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 473
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->decodeBase128UnsignedLong(Ljava/nio/ByteBuffer;)J

    move-result-wide v8

    .line 474
    .local v8, "node":J
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 475
    .end local v8    # "node":J
    goto :goto_0

    .line 477
    :cond_0
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 460
    .end local v0    # "firstComponent":J
    .end local v2    # "firstNode":I
    .end local v3    # "secondNode":J
    .end local v5    # "result":Ljava/lang/StringBuilder;
    :cond_1
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    const-string v1, "Empty OBJECT IDENTIFIER"

    invoke-direct {v0, v1}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static parse(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 7
    .param p0, "container"    # Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "container",
            "containerClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/apksig/internal/asn1/ber/BerDataValue;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 112
    .local p1, "containerClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    if-eqz p0, :cond_2

    .line 115
    if-eqz p1, :cond_1

    .line 119
    invoke-static {p1}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->getContainerAsn1Type(Ljava/lang/Class;)Lcom/android/apksig/internal/asn1/Asn1Type;

    move-result-object v0

    .line 120
    .local v0, "dataType":Lcom/android/apksig/internal/asn1/Asn1Type;
    sget-object v1, Lcom/android/apksig/internal/asn1/Asn1BerParser$1;->$SwitchMap$com$android$apksig$internal$asn1$Asn1Type:[I

    invoke-virtual {v0}, Lcom/android/apksig/internal/asn1/Asn1Type;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 142
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Parsing container "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not supported"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 140
    :pswitch_0
    const/4 v1, 0x1

    invoke-static {p0, p1, v1}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parseSequence(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;Z)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 126
    :pswitch_1
    const/4 v1, 0x0

    .line 127
    .local v1, "expectedTagClass":I
    invoke-static {v0}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->getTagNumber(Lcom/android/apksig/internal/asn1/Asn1Type;)I

    move-result v2

    .line 128
    .local v2, "expectedTagNumber":I
    invoke-virtual {p0}, Lcom/android/apksig/internal/asn1/ber/BerDataValue;->getTagClass()I

    move-result v3

    if-ne v3, v1, :cond_0

    .line 129
    invoke-virtual {p0}, Lcom/android/apksig/internal/asn1/ber/BerDataValue;->getTagNumber()I

    move-result v3

    if-ne v3, v2, :cond_0

    .line 137
    invoke-static {p0, p1}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parseSequence(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 130
    :cond_0
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1BerParser$Asn1UnexpectedTagException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unexpected data value read as "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 131
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ". Expected "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 132
    invoke-static {v1, v2}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->tagClassAndNumberToString(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", but read: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 135
    invoke-virtual {p0}, Lcom/android/apksig/internal/asn1/ber/BerDataValue;->getTagClass()I

    move-result v5

    invoke-virtual {p0}, Lcom/android/apksig/internal/asn1/ber/BerDataValue;->getTagNumber()I

    move-result v6

    .line 134
    invoke-static {v5, v6}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->tagClassAndNumberToString(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/android/apksig/internal/asn1/Asn1BerParser$Asn1UnexpectedTagException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 122
    .end local v1    # "expectedTagClass":I
    .end local v2    # "expectedTagNumber":I
    :pswitch_2
    invoke-static {p0, p1}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parseChoice(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 116
    .end local v0    # "dataType":Lcom/android/apksig/internal/asn1/Asn1Type;
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "containerClass == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 113
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "container == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static parse(Ljava/nio/ByteBuffer;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 3
    .param p0, "encoded"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "encoded",
            "containerClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/nio/ByteBuffer;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 64
    .local p1, "containerClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_0
    new-instance v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;

    invoke-direct {v0, p0}, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-virtual {v0}, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->readDataValue()Lcom/android/apksig/internal/asn1/ber/BerDataValue;

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .local v0, "containerDataValue":Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    nop

    .line 68
    if-eqz v0, :cond_0

    .line 71
    invoke-static {v0, p1}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parse(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 69
    :cond_0
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    const-string v2, "Empty input"

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 65
    .end local v0    # "containerDataValue":Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    const-string v2, "Failed to decode top-level data value"

    invoke-direct {v1, v2, v0}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static parseChoice(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 12
    .param p0, "dataValue"    # Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dataValue",
            "containerClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/apksig/internal/asn1/ber/BerDataValue;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 148
    .local p1, "containerClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p1}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->getAnnotatedFields(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 149
    .local v0, "fields":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    .line 156
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_3

    .line 157
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;

    .line 158
    .local v2, "f1":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    invoke-virtual {v2}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->getBerTagNumber()I

    move-result v3

    .line 159
    .local v3, "tagNumber1":I
    invoke-virtual {v2}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->getBerTagClass()I

    move-result v4

    .line 160
    .local v4, "tagClass1":I
    add-int/lit8 v5, v1, 0x1

    .local v5, "j":I
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_2

    .line 161
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;

    .line 162
    .local v6, "f2":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    invoke-virtual {v6}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->getBerTagNumber()I

    move-result v7

    .line 163
    .local v7, "tagNumber2":I
    invoke-virtual {v6}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->getBerTagClass()I

    move-result v8

    .line 164
    .local v8, "tagClass2":I
    if-ne v3, v7, :cond_1

    if-eq v4, v8, :cond_0

    goto :goto_2

    .line 165
    :cond_0
    new-instance v9, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "CHOICE fields are indistinguishable because they have the same tag class and number: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 167
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 168
    invoke-virtual {v2}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->getField()Ljava/lang/reflect/Field;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " and ."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 169
    invoke-virtual {v6}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->getField()Ljava/lang/reflect/Field;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 160
    .end local v6    # "f2":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    .end local v7    # "tagNumber2":I
    .end local v8    # "tagClass2":I
    :cond_1
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 156
    .end local v2    # "f1":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    .end local v3    # "tagNumber1":I
    .end local v4    # "tagClass1":I
    .end local v5    # "j":I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 177
    .end local v1    # "i":I
    :cond_3
    const/4 v1, 0x0

    :try_start_0
    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {p1, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_1

    .line 180
    .local v1, "obj":Ljava/lang/Object;, "TT;"
    nop

    .line 182
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;

    .line 184
    .local v3, "field":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    :try_start_1
    invoke-virtual {v3, p0, v1}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->setValueFrom(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Object;)V
    :try_end_1
    .catch Lcom/android/apksig/internal/asn1/Asn1BerParser$Asn1UnexpectedTagException; {:try_start_1 .. :try_end_1} :catch_0

    .line 185
    return-object v1

    .line 186
    :catch_0
    move-exception v4

    .line 189
    .end local v3    # "field":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    goto :goto_3

    .line 191
    :cond_4
    new-instance v2, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "No options of CHOICE "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 192
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " matched"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 178
    .end local v1    # "obj":Ljava/lang/Object;, "TT;"
    :catch_1
    move-exception v1

    goto :goto_4

    :catch_2
    move-exception v1

    .line 179
    .local v1, "e":Ljava/lang/Exception;
    :goto_4
    new-instance v2, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to instantiate "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 150
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_5
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No fields annotated with "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-class v3, Lcom/android/apksig/internal/asn1/Asn1Field;

    .line 151
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " in CHOICE class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 152
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static parseImplicitSetOf(Ljava/nio/ByteBuffer;Ljava/lang/Class;)Ljava/util/List;
    .locals 3
    .param p0, "encoded"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "encoded",
            "elementClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/nio/ByteBuffer;",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 100
    .local p1, "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    :try_start_0
    new-instance v0, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;

    invoke-direct {v0, p0}, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;-><init>(Ljava/nio/ByteBuffer;)V

    invoke-virtual {v0}, Lcom/android/apksig/internal/asn1/ber/ByteBufferBerDataValueReader;->readDataValue()Lcom/android/apksig/internal/asn1/ber/BerDataValue;

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    .local v0, "containerDataValue":Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    nop

    .line 104
    if-eqz v0, :cond_0

    .line 107
    invoke-static {v0, p1}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parseSetOf(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    return-object v1

    .line 105
    :cond_0
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    const-string v2, "Empty input"

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 101
    .end local v0    # "containerDataValue":Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    :catch_0
    move-exception v0

    .line 102
    .local v0, "e":Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    const-string v2, "Failed to decode top-level data value"

    invoke-direct {v1, v2, v0}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static parseSequence(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 1
    .param p0, "container"    # Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "container",
            "containerClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/apksig/internal/asn1/ber/BerDataValue;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 197
    .local p1, "containerClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parseSequence(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static parseSequence(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;Z)Ljava/lang/Object;
    .locals 12
    .param p0, "container"    # Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    .param p2, "isUnencodedContainer"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "container",
            "containerClass",
            "isUnencodedContainer"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/apksig/internal/asn1/ber/BerDataValue;",
            "Ljava/lang/Class<",
            "TT;>;Z)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 202
    .local p1, "containerClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p1}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->getAnnotatedFields(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 203
    .local v0, "fields":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;>;"
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1BerParser$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/android/apksig/internal/asn1/Asn1BerParser$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 206
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    const-string v3, "."

    if-le v1, v2, :cond_2

    .line 207
    const/4 v1, 0x0

    .line 208
    .local v1, "lastField":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;

    .line 209
    .local v4, "field":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    if-eqz v1, :cond_1

    .line 210
    invoke-virtual {v1}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->getAnnotation()Lcom/android/apksig/internal/asn1/Asn1Field;

    move-result-object v5

    invoke-interface {v5}, Lcom/android/apksig/internal/asn1/Asn1Field;->index()I

    move-result v5

    invoke-virtual {v4}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->getAnnotation()Lcom/android/apksig/internal/asn1/Asn1Field;

    move-result-object v6

    invoke-interface {v6}, Lcom/android/apksig/internal/asn1/Asn1Field;->index()I

    move-result v6

    if-eq v5, v6, :cond_0

    goto :goto_1

    .line 211
    :cond_0
    new-instance v2, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Fields have the same index: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 212
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 213
    invoke-virtual {v1}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->getField()Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " and ."

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 214
    invoke-virtual {v4}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->getField()Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 216
    :cond_1
    :goto_1
    move-object v1, v4

    .line 217
    .end local v4    # "field":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    goto :goto_0

    .line 223
    .end local v1    # "lastField":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    :cond_2
    const/4 v1, 0x0

    :try_start_0
    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {p1, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_3

    .line 226
    .local v1, "t":Ljava/lang/Object;, "TT;"
    nop

    .line 229
    const/4 v2, 0x0

    .line 230
    .local v2, "nextUnreadFieldIndex":I
    invoke-virtual {p0}, Lcom/android/apksig/internal/asn1/ber/BerDataValue;->contentsReader()Lcom/android/apksig/internal/asn1/ber/BerDataValueReader;

    move-result-object v4

    .line 231
    .local v4, "elementsReader":Lcom/android/apksig/internal/asn1/ber/BerDataValueReader;
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-ge v2, v5, :cond_7

    .line 236
    if-eqz p2, :cond_3

    if-nez v2, :cond_3

    .line 237
    move-object v5, p0

    .local v5, "dataValue":Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    goto :goto_3

    .line 239
    .end local v5    # "dataValue":Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    :cond_3
    :try_start_1
    invoke-interface {v4}, Lcom/android/apksig/internal/asn1/ber/BerDataValueReader;->readDataValue()Lcom/android/apksig/internal/asn1/ber/BerDataValue;

    move-result-object v5
    :try_end_1
    .catch Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException; {:try_start_1 .. :try_end_1} :catch_2

    .line 243
    .restart local v5    # "dataValue":Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    :goto_3
    nop

    .line 244
    if-nez v5, :cond_4

    .line 245
    goto :goto_6

    .line 248
    :cond_4
    move v6, v2

    .local v6, "i":I
    :goto_4
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_6

    .line 249
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;

    .line 251
    .local v7, "field":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    :try_start_2
    invoke-virtual {v7}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->isOptional()Z

    move-result v8
    :try_end_2
    .catch Lcom/android/apksig/internal/asn1/Asn1DecodingException; {:try_start_2 .. :try_end_2} :catch_1

    if-eqz v8, :cond_5

    .line 255
    :try_start_3
    invoke-virtual {v7, v5, v1}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->setValueFrom(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Object;)V
    :try_end_3
    .catch Lcom/android/apksig/internal/asn1/Asn1BerParser$Asn1UnexpectedTagException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lcom/android/apksig/internal/asn1/Asn1DecodingException; {:try_start_3 .. :try_end_3} :catch_1

    .line 256
    add-int/lit8 v2, v6, 0x1

    .line 257
    goto :goto_5

    .line 258
    :catch_0
    move-exception v8

    .line 261
    .local v8, "e":Lcom/android/apksig/internal/asn1/Asn1BerParser$Asn1UnexpectedTagException;
    nop

    .line 248
    .end local v7    # "field":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    .end local v8    # "e":Lcom/android/apksig/internal/asn1/Asn1BerParser$Asn1UnexpectedTagException;
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 266
    .restart local v7    # "field":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    :cond_5
    :try_start_4
    invoke-virtual {v7, v5, v1}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->setValueFrom(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Object;)V
    :try_end_4
    .catch Lcom/android/apksig/internal/asn1/Asn1DecodingException; {:try_start_4 .. :try_end_4} :catch_1

    .line 267
    add-int/lit8 v2, v6, 0x1

    .line 268
    goto :goto_5

    .line 270
    :catch_1
    move-exception v8

    .line 271
    .local v8, "e":Lcom/android/apksig/internal/asn1/Asn1DecodingException;
    new-instance v9, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Failed to parse "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    .line 272
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 273
    invoke-virtual {v7}, Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;->getField()Ljava/lang/reflect/Field;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v9, v3, v8}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 277
    .end local v5    # "dataValue":Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    .end local v6    # "i":I
    .end local v7    # "field":Lcom/android/apksig/internal/asn1/Asn1BerParser$AnnotatedField;
    .end local v8    # "e":Lcom/android/apksig/internal/asn1/Asn1DecodingException;
    :cond_6
    :goto_5
    goto :goto_2

    .line 241
    :catch_2
    move-exception v3

    .line 242
    .local v3, "e":Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
    new-instance v5, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    const-string v6, "Malformed data value"

    invoke-direct {v5, v6, v3}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 279
    .end local v3    # "e":Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
    :cond_7
    :goto_6
    return-object v1

    .line 224
    .end local v1    # "t":Ljava/lang/Object;, "TT;"
    .end local v2    # "nextUnreadFieldIndex":I
    .end local v4    # "elementsReader":Lcom/android/apksig/internal/asn1/ber/BerDataValueReader;
    :catch_3
    move-exception v1

    goto :goto_7

    :catch_4
    move-exception v1

    .line 225
    .local v1, "e":Ljava/lang/Exception;
    :goto_7
    new-instance v2, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to instantiate "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static parseSetOf(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;)Ljava/util/List;
    .locals 5
    .param p0, "container"    # Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "container",
            "elementClass"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/apksig/internal/asn1/ber/BerDataValue;",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1DecodingException;
        }
    .end annotation

    .line 287
    .local p1, "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 288
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-virtual {p0}, Lcom/android/apksig/internal/asn1/ber/BerDataValue;->contentsReader()Lcom/android/apksig/internal/asn1/ber/BerDataValueReader;

    move-result-object v1

    .line 292
    .local v1, "elementsReader":Lcom/android/apksig/internal/asn1/ber/BerDataValueReader;
    :goto_0
    :try_start_0
    invoke-interface {v1}, Lcom/android/apksig/internal/asn1/ber/BerDataValueReader;->readDataValue()Lcom/android/apksig/internal/asn1/ber/BerDataValue;

    move-result-object v2
    :try_end_0
    .catch Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 295
    .local v2, "dataValue":Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    nop

    .line 296
    if-nez v2, :cond_0

    .line 297
    nop

    .line 309
    .end local v2    # "dataValue":Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    return-object v0

    .line 300
    .restart local v2    # "dataValue":Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    :cond_0
    const-class v3, Ljava/nio/ByteBuffer;

    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 301
    invoke-virtual {v2}, Lcom/android/apksig/internal/asn1/ber/BerDataValue;->getEncodedContents()Ljava/nio/ByteBuffer;

    move-result-object v3

    .local v3, "element":Ljava/lang/Object;, "TT;"
    goto :goto_1

    .line 302
    .end local v3    # "element":Ljava/lang/Object;, "TT;"
    :cond_1
    const-class v3, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 303
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    invoke-virtual {v2}, Lcom/android/apksig/internal/asn1/ber/BerDataValue;->getEncoded()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;-><init>(Ljava/nio/ByteBuffer;)V

    .restart local v3    # "element":Ljava/lang/Object;, "TT;"
    goto :goto_1

    .line 305
    .end local v3    # "element":Ljava/lang/Object;, "TT;"
    :cond_2
    invoke-static {v2, p1}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parse(Lcom/android/apksig/internal/asn1/ber/BerDataValue;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    .line 307
    .restart local v3    # "element":Ljava/lang/Object;, "TT;"
    :goto_1
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 308
    .end local v2    # "dataValue":Lcom/android/apksig/internal/asn1/ber/BerDataValue;
    .end local v3    # "element":Ljava/lang/Object;, "TT;"
    goto :goto_0

    .line 293
    :catch_0
    move-exception v2

    .line 294
    .local v2, "e":Lcom/android/apksig/internal/asn1/ber/BerDataValueFormatException;
    new-instance v3, Lcom/android/apksig/internal/asn1/Asn1DecodingException;

    const-string v4, "Malformed data value"

    invoke-direct {v3, v4, v2}, Lcom/android/apksig/internal/asn1/Asn1DecodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method
