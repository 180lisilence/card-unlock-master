.class public final Lcom/licenseinjector/app/Generator;
.super Ljava/lang/Object;
.source "Generator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/licenseinjector/app/Generator$Format;,
        Lcom/licenseinjector/app/Generator$Length;
    }
.end annotation


# static fields
.field private static final BASE36:Ljava/lang/String; = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

.field private static final RND:Ljava/security/SecureRandom;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 24
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    sput-object v0, Lcom/licenseinjector/app/Generator;->RND:Ljava/security/SecureRandom;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static generate(Ljava/lang/String;Ljava/lang/String;ILcom/licenseinjector/app/Generator$Format;Lcom/licenseinjector/app/Generator$Length;)Ljava/lang/String;
    .locals 16
    .param p0, "secretKey"    # Ljava/lang/String;
    .param p1, "deviceCode"    # Ljava/lang/String;
    .param p2, "cardTypeCode"    # I
    .param p3, "format"    # Lcom/licenseinjector/app/Generator$Format;
    .param p4, "length"    # Lcom/licenseinjector/app/Generator$Length;

    .line 40
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    if-eqz v0, :cond_7

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_7

    .line 41
    if-eqz v1, :cond_6

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x10

    if-ne v3, v4, :cond_6

    .line 42
    if-ltz v2, :cond_5

    const/16 v3, 0x9

    if-gt v2, v3, :cond_5

    .line 43
    sget-object v3, Lcom/licenseinjector/app/Generator$Format;->DIGIT:Lcom/licenseinjector/app/Generator$Format;

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object/from16 v6, p3

    if-ne v6, v3, :cond_0

    move v3, v5

    goto :goto_0

    :cond_0
    move v3, v4

    .line 44
    .local v3, "digit":Z
    :goto_0
    invoke-static/range {p3 .. p4}, Lcom/licenseinjector/app/Generator;->segments(Lcom/licenseinjector/app/Generator$Format;Lcom/licenseinjector/app/Generator$Length;)[I

    move-result-object v7

    .line 45
    .local v7, "s":[I
    aget v4, v7, v4

    .local v4, "pLen":I
    aget v5, v7, v5

    .local v5, "dLen":I
    const/4 v8, 0x2

    aget v8, v7, v8

    .local v8, "tLen":I
    const/4 v9, 0x3

    aget v9, v7, v9

    .local v9, "rLen":I
    const/4 v10, 0x4

    aget v10, v7, v10

    .line 47
    .local v10, "cLen":I
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .local v11, "sb":Ljava/lang/StringBuilder;
    if-eqz v3, :cond_1

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    goto :goto_1

    :cond_1
    rem-int/lit8 v12, v2, 0x24

    const-string v13, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    invoke-virtual {v13, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v12

    :goto_1
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    invoke-static {v1, v5, v3}, Lcom/license/verify2/CryptoUtil;->deviceFingerprint(Ljava/lang/String;IZ)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_2
    if-ge v12, v9, :cond_2

    invoke-static {v3}, Lcom/licenseinjector/app/Generator;->randChar(Z)C

    move-result v13

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v12, v12, 0x1

    goto :goto_2

    .line 51
    .end local v12    # "i":I
    :cond_2
    const/4 v12, 0x0

    .restart local v12    # "i":I
    :goto_3
    if-ge v12, v8, :cond_3

    invoke-static {v3}, Lcom/licenseinjector/app/Generator;->randChar(Z)C

    move-result v13

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v12, v12, 0x1

    goto :goto_3

    .line 52
    .end local v12    # "i":I
    :cond_3
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 55
    .local v12, "str3":Ljava/lang/String;
    sget-object v13, Lcom/licenseinjector/app/Generator$1;->$SwitchMap$com$licenseinjector$app$Generator$Length:[I

    invoke-virtual/range {p4 .. p4}, Lcom/licenseinjector/app/Generator$Length;->ordinal()I

    move-result v14

    aget v13, v13, v14

    packed-switch v13, :pswitch_data_0

    .line 59
    new-instance v13, Ljava/lang/IllegalArgumentException;

    const-string v14, "\u4e0d\u652f\u6301\u7684\u957f\u5ea6"

    invoke-direct {v13, v14}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 58
    :pswitch_0
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v0, v13}, Lcom/license/verify2/CryptoUtil;->hmacSha256(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .local v13, "hash":Ljava/lang/String;
    goto :goto_4

    .line 57
    .end local v13    # "hash":Ljava/lang/String;
    :pswitch_1
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v0, v13}, Lcom/license/verify2/CryptoUtil;->hmacSha1(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .restart local v13    # "hash":Ljava/lang/String;
    goto :goto_4

    .line 56
    .end local v13    # "hash":Ljava/lang/String;
    :pswitch_2
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v0, v13}, Lcom/license/verify2/CryptoUtil;->hmacMd5(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 61
    .restart local v13    # "hash":Ljava/lang/String;
    :goto_4
    if-eqz v3, :cond_4

    invoke-static {v13, v10}, Lcom/license/verify2/CryptoUtil;->extractDigits(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v14

    goto :goto_5

    :cond_4
    invoke-static {v13, v10}, Lcom/license/verify2/CryptoUtil;->extractBase36(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v14

    .line 62
    .local v14, "checksum":Ljava/lang/String;
    :goto_5
    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    return-object v15

    .line 42
    .end local v3    # "digit":Z
    .end local v4    # "pLen":I
    .end local v5    # "dLen":I
    .end local v7    # "s":[I
    .end local v8    # "tLen":I
    .end local v9    # "rLen":I
    .end local v10    # "cLen":I
    .end local v11    # "sb":Ljava/lang/StringBuilder;
    .end local v12    # "str3":Ljava/lang/String;
    .end local v13    # "hash":Ljava/lang/String;
    .end local v14    # "checksum":Ljava/lang/String;
    :cond_5
    move-object/from16 v6, p3

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\u5361\u7c7b\u578b\u7f16\u53f7\u9700\u5728 0-9 \u4e4b\u95f4"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 41
    :cond_6
    move-object/from16 v6, p3

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\u8bbe\u5907\u7801\u5fc5\u987b\u4e3a 16 \u4f4d"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 40
    :cond_7
    move-object/from16 v6, p3

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\u5bc6\u94a5\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static generateBatch(Ljava/lang/String;Ljava/lang/String;ILcom/licenseinjector/app/Generator$Format;Lcom/licenseinjector/app/Generator$Length;I)[Ljava/lang/String;
    .locals 9
    .param p0, "secretKey"    # Ljava/lang/String;
    .param p1, "deviceCode"    # Ljava/lang/String;
    .param p2, "cardTypeCode"    # I
    .param p3, "format"    # Lcom/licenseinjector/app/Generator$Format;
    .param p4, "length"    # Lcom/licenseinjector/app/Generator$Length;
    .param p5, "n"    # I

    .line 77
    invoke-static {p3, p4}, Lcom/licenseinjector/app/Generator;->maxUnique(Lcom/licenseinjector/app/Generator$Format;Lcom/licenseinjector/app/Generator$Length;)J

    move-result-wide v0

    .line 78
    .local v0, "cap":J
    int-to-long v2, p5

    cmp-long v2, v2, v0

    const-string v3, " \u5f20\u4e0d\u91cd\u590d\u5361\u5bc6"

    const-string v4, "\u8be5\u683c\u5f0f\u6700\u591a\u53ef\u751f\u6210 "

    if-gtz v2, :cond_2

    .line 79
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    .line 80
    .local v2, "set":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    int-to-long v5, p5

    invoke-static {v5, v6, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    const-wide/16 v7, 0x4

    mul-long/2addr v5, v7

    const-wide/32 v7, 0x7fffffff

    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v5, v5

    .line 81
    .local v5, "limit":I
    const/4 v6, 0x0

    .line 82
    .local v6, "attempts":I
    :goto_0
    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->size()I

    move-result v7

    if-ge v7, p5, :cond_0

    if-ge v6, v5, :cond_0

    .line 83
    invoke-static {p0, p1, p2, p3, p4}, Lcom/licenseinjector/app/Generator;->generate(Ljava/lang/String;Ljava/lang/String;ILcom/licenseinjector/app/Generator$Format;Lcom/licenseinjector/app/Generator$Length;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 84
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 86
    :cond_0
    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->size()I

    move-result v7

    if-lt v7, p5, :cond_1

    .line 87
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/LinkedHashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    return-object v3

    .line 86
    :cond_1
    new-instance v7, Ljava/lang/IllegalStateException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v7, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 78
    .end local v2    # "set":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    .end local v5    # "limit":I
    .end local v6    # "attempts":I
    :cond_2
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static isValidDeviceCode(Ljava/lang/String;)Z
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .line 96
    invoke-static {p0}, Lcom/license/verify2/CryptoUtil;->isValidDeviceCode(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static maxUnique(Lcom/licenseinjector/app/Generator$Format;Lcom/licenseinjector/app/Generator$Length;)J
    .locals 7
    .param p0, "format"    # Lcom/licenseinjector/app/Generator$Format;
    .param p1, "length"    # Lcom/licenseinjector/app/Generator$Length;

    .line 67
    invoke-static {p0, p1}, Lcom/licenseinjector/app/Generator;->segments(Lcom/licenseinjector/app/Generator$Format;Lcom/licenseinjector/app/Generator$Length;)[I

    move-result-object v0

    .line 68
    .local v0, "s":[I
    const/4 v1, 0x2

    aget v1, v0, v1

    const/4 v2, 0x3

    aget v2, v0, v2

    add-int/2addr v1, v2

    .line 69
    .local v1, "free":I
    sget-object v2, Lcom/licenseinjector/app/Generator$Format;->DIGIT:Lcom/licenseinjector/app/Generator$Format;

    if-ne p0, v2, :cond_0

    const-wide/16 v2, 0xa

    goto :goto_0

    :cond_0
    const-wide/16 v2, 0x24

    .line 70
    .local v2, "base":J
    :goto_0
    const-wide/16 v4, 0x1

    .line 71
    .local v4, "cap":J
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    if-ge v6, v1, :cond_1

    mul-long/2addr v4, v2

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 72
    .end local v6    # "i":I
    :cond_1
    return-wide v4
.end method

.method private static randChar(Z)C
    .locals 2
    .param p0, "digit"    # Z

    .line 91
    if-eqz p0, :cond_0

    sget-object v0, Lcom/licenseinjector/app/Generator;->RND:Ljava/security/SecureRandom;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x30

    int-to-char v0, v0

    return v0

    .line 92
    :cond_0
    sget-object v0, Lcom/licenseinjector/app/Generator;->RND:Ljava/security/SecureRandom;

    const/16 v1, 0x24

    invoke-virtual {v0, v1}, Ljava/security/SecureRandom;->nextInt(I)I

    move-result v0

    const-string v1, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method private static segments(Lcom/licenseinjector/app/Generator$Format;Lcom/licenseinjector/app/Generator$Length;)[I
    .locals 7
    .param p0, "f"    # Lcom/licenseinjector/app/Generator$Format;
    .param p1, "len"    # Lcom/licenseinjector/app/Generator$Length;

    .line 29
    sget-object v0, Lcom/licenseinjector/app/Generator$Format;->DIGIT:Lcom/licenseinjector/app/Generator$Format;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p0, v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    .line 30
    .local v0, "digit":Z
    :goto_0
    sget-object v3, Lcom/licenseinjector/app/Generator$1;->$SwitchMap$com$licenseinjector$app$Generator$Length:[I

    invoke-virtual {p1}, Lcom/licenseinjector/app/Generator$Length;->ordinal()I

    move-result v4

    aget v3, v3, v4

    const/4 v4, 0x6

    const/4 v5, 0x2

    const/4 v6, 0x3

    packed-switch v3, :pswitch_data_0

    .line 34
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\u4e0d\u652f\u6301\u7684\u957f\u5ea6"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 33
    :pswitch_0
    const/4 v1, 0x4

    if-eqz v0, :cond_1

    const/4 v3, 0x5

    const/16 v5, 0x10

    filled-new-array {v2, v1, v4, v3, v5}, [I

    move-result-object v1

    goto :goto_1

    :cond_1
    const/16 v3, 0x14

    filled-new-array {v2, v1, v1, v6, v3}, [I

    move-result-object v1

    :goto_1
    return-object v1

    .line 32
    :pswitch_1
    if-eqz v0, :cond_2

    const/16 v3, 0x9

    filled-new-array {v2, v6, v6, v1, v3}, [I

    move-result-object v1

    goto :goto_2

    :cond_2
    const/16 v3, 0xa

    filled-new-array {v2, v6, v5, v1, v3}, [I

    move-result-object v1

    :goto_2
    return-object v1

    .line 31
    :pswitch_2
    filled-new-array {v2, v5, v2, v1, v4}, [I

    move-result-object v1

    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
