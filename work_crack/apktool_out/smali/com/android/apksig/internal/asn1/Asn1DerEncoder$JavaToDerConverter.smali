.class final Lcom/android/apksig/internal/asn1/Asn1DerEncoder$JavaToDerConverter;
.super Ljava/lang/Object;
.source "Asn1DerEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/asn1/Asn1DerEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "JavaToDerConverter"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 500
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static toDer(Ljava/lang/Object;Lcom/android/apksig/internal/asn1/Asn1Type;Lcom/android/apksig/internal/asn1/Asn1Type;)[B
    .locals 6
    .param p0, "source"    # Ljava/lang/Object;
    .param p1, "targetType"    # Lcom/android/apksig/internal/asn1/Asn1Type;
    .param p2, "targetElementType"    # Lcom/android/apksig/internal/asn1/Asn1Type;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "source",
            "targetType",
            "targetElementType"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/asn1/Asn1EncodingException;
        }
    .end annotation

    .line 504
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 505
    .local v0, "sourceType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 506
    move-object v1, p0

    check-cast v1, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    invoke-virtual {v1}, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;->getEncoded()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 507
    .local v1, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    new-array v2, v2, [B

    .line 508
    .local v2, "result":[B
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 509
    return-object v2

    .line 512
    .end local v1    # "buf":Ljava/nio/ByteBuffer;
    .end local v2    # "result":[B
    :cond_0
    if-eqz p1, :cond_7

    sget-object v1, Lcom/android/apksig/internal/asn1/Asn1Type;->ANY:Lcom/android/apksig/internal/asn1/Asn1Type;

    if-ne p1, v1, :cond_1

    goto/16 :goto_3

    .line 516
    :cond_1
    sget-object v1, Lcom/android/apksig/internal/asn1/Asn1DerEncoder$1;->$SwitchMap$com$android$apksig$internal$asn1$Asn1Type:[I

    invoke-virtual {p1}, Lcom/android/apksig/internal/asn1/Asn1Type;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_2

    .line 584
    :pswitch_1
    move-object v1, p0

    check-cast v1, Ljava/util/Collection;

    invoke-static {v1, p2}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->access$1100(Ljava/util/Collection;Lcom/android/apksig/internal/asn1/Asn1Type;)[B

    move-result-object v1

    return-object v1

    .line 582
    :pswitch_2
    move-object v1, p0

    check-cast v1, Ljava/util/Collection;

    invoke-static {v1, p2}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->access$1000(Ljava/util/Collection;Lcom/android/apksig/internal/asn1/Asn1Type;)[B

    move-result-object v1

    return-object v1

    .line 557
    :pswitch_3
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_6

    .line 558
    move-object v1, p0

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->access$700(Ljava/lang/String;)[B

    move-result-object v1

    return-object v1

    .line 551
    :pswitch_4
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_6

    .line 552
    nop

    .line 553
    invoke-static {p1}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->getTagNumber(Lcom/android/apksig/internal/asn1/Asn1Type;)I

    move-result v1

    new-array v2, v2, [[B

    move-object v4, p0

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    aput-object v4, v2, v3

    .line 552
    invoke-static {v3, v3, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->access$200(IZI[[B)[B

    move-result-object v1

    return-object v1

    .line 545
    :pswitch_5
    instance-of v1, p0, Ljava/lang/Boolean;

    if-eqz v1, :cond_6

    .line 546
    move-object v1, p0

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-static {v1}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->access$600(Z)[B

    move-result-object v1

    return-object v1

    .line 536
    :pswitch_6
    instance-of v1, p0, Ljava/lang/Integer;

    if-eqz v1, :cond_2

    .line 537
    move-object v1, p0

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->access$300(I)[B

    move-result-object v1

    return-object v1

    .line 538
    :cond_2
    instance-of v1, p0, Ljava/lang/Long;

    if-eqz v1, :cond_3

    .line 539
    move-object v1, p0

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->access$400(J)[B

    move-result-object v1

    return-object v1

    .line 540
    :cond_3
    instance-of v1, p0, Ljava/math/BigInteger;

    if-eqz v1, :cond_6

    .line 541
    move-object v1, p0

    check-cast v1, Ljava/math/BigInteger;

    invoke-static {v1}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->access$500(Ljava/math/BigInteger;)[B

    move-result-object v1

    return-object v1

    .line 519
    :pswitch_7
    const/4 v1, 0x0

    .line 520
    .local v1, "value":[B
    instance-of v4, p0, Ljava/nio/ByteBuffer;

    if-eqz v4, :cond_4

    .line 521
    move-object v4, p0

    check-cast v4, Ljava/nio/ByteBuffer;

    .line 522
    .local v4, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    new-array v1, v5, [B

    .line 523
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .end local v4    # "buf":Ljava/nio/ByteBuffer;
    goto :goto_0

    .line 524
    :cond_4
    instance-of v4, p0, [B

    if-eqz v4, :cond_5

    .line 525
    move-object v1, p0

    check-cast v1, [B

    goto :goto_1

    .line 524
    :cond_5
    :goto_0
    nop

    .line 527
    :goto_1
    if-eqz v1, :cond_6

    .line 528
    nop

    .line 531
    invoke-static {p1}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->getTagNumber(Lcom/android/apksig/internal/asn1/Asn1Type;)I

    move-result v4

    new-array v2, v2, [[B

    aput-object v1, v2, v3

    .line 528
    invoke-static {v3, v3, v4, v2}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->access$200(IZI[[B)[B

    move-result-object v2

    return-object v2

    .line 563
    .end local v1    # "value":[B
    :pswitch_8
    const-class v1, Lcom/android/apksig/internal/asn1/Asn1Class;

    .line 564
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/asn1/Asn1Class;

    .line 565
    .local v1, "containerAnnotation":Lcom/android/apksig/internal/asn1/Asn1Class;
    if-eqz v1, :cond_6

    .line 566
    invoke-interface {v1}, Lcom/android/apksig/internal/asn1/Asn1Class;->type()Lcom/android/apksig/internal/asn1/Asn1Type;

    move-result-object v2

    sget-object v3, Lcom/android/apksig/internal/asn1/Asn1Type;->SEQUENCE:Lcom/android/apksig/internal/asn1/Asn1Type;

    if-ne v2, v3, :cond_6

    .line 567
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->access$800(Ljava/lang/Object;)[B

    move-result-object v2

    return-object v2

    .line 573
    .end local v1    # "containerAnnotation":Lcom/android/apksig/internal/asn1/Asn1Class;
    :pswitch_9
    const-class v1, Lcom/android/apksig/internal/asn1/Asn1Class;

    .line 574
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/asn1/Asn1Class;

    .line 575
    .restart local v1    # "containerAnnotation":Lcom/android/apksig/internal/asn1/Asn1Class;
    if-eqz v1, :cond_6

    .line 576
    invoke-interface {v1}, Lcom/android/apksig/internal/asn1/Asn1Class;->type()Lcom/android/apksig/internal/asn1/Asn1Type;

    move-result-object v2

    sget-object v3, Lcom/android/apksig/internal/asn1/Asn1Type;->CHOICE:Lcom/android/apksig/internal/asn1/Asn1Type;

    if-ne v2, v3, :cond_6

    .line 577
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->access$900(Ljava/lang/Object;)[B

    move-result-object v2

    return-object v2

    .line 589
    .end local v1    # "containerAnnotation":Lcom/android/apksig/internal/asn1/Asn1Class;
    :cond_6
    :goto_2
    new-instance v1, Lcom/android/apksig/internal/asn1/Asn1EncodingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported conversion: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 590
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " to ASN.1 "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1EncodingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 513
    :cond_7
    :goto_3
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/Asn1DerEncoder;->encode(Ljava/lang/Object;)[B

    move-result-object v1

    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_0
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
