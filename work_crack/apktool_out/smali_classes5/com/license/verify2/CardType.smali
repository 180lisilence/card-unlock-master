.class public final enum Lcom/license/verify2/CardType;
.super Ljava/lang/Enum;
.source "CardType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/license/verify2/CardType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/license/verify2/CardType;

.field public static final enum CUSTOM_CARD:Lcom/license/verify2/CardType;

.field public static final enum DAY_CARD:Lcom/license/verify2/CardType;

.field public static final enum HALF_YEAR_CARD:Lcom/license/verify2/CardType;

.field public static final enum HOUR_CARD:Lcom/license/verify2/CardType;

.field public static final enum LIFETIME_CARD:Lcom/license/verify2/CardType;

.field public static final enum MINUTE_CARD:Lcom/license/verify2/CardType;

.field public static final enum MONTH_CARD:Lcom/license/verify2/CardType;

.field public static final enum QUARTER_CARD:Lcom/license/verify2/CardType;

.field public static final enum WEEK_CARD:Lcom/license/verify2/CardType;

.field public static final enum YEAR_CARD:Lcom/license/verify2/CardType;


# instance fields
.field private final code:I

.field private final durationMillis:J

.field private final durationText:Ljava/lang/String;

.field private final name:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/license/verify2/CardType;
    .locals 10

    .line 4
    sget-object v0, Lcom/license/verify2/CardType;->MINUTE_CARD:Lcom/license/verify2/CardType;

    sget-object v1, Lcom/license/verify2/CardType;->HOUR_CARD:Lcom/license/verify2/CardType;

    sget-object v2, Lcom/license/verify2/CardType;->DAY_CARD:Lcom/license/verify2/CardType;

    sget-object v3, Lcom/license/verify2/CardType;->WEEK_CARD:Lcom/license/verify2/CardType;

    sget-object v4, Lcom/license/verify2/CardType;->MONTH_CARD:Lcom/license/verify2/CardType;

    sget-object v5, Lcom/license/verify2/CardType;->QUARTER_CARD:Lcom/license/verify2/CardType;

    sget-object v6, Lcom/license/verify2/CardType;->HALF_YEAR_CARD:Lcom/license/verify2/CardType;

    sget-object v7, Lcom/license/verify2/CardType;->YEAR_CARD:Lcom/license/verify2/CardType;

    sget-object v8, Lcom/license/verify2/CardType;->LIFETIME_CARD:Lcom/license/verify2/CardType;

    sget-object v9, Lcom/license/verify2/CardType;->CUSTOM_CARD:Lcom/license/verify2/CardType;

    filled-new-array/range {v0 .. v9}, [Lcom/license/verify2/CardType;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 17

    .line 5
    new-instance v8, Lcom/license/verify2/CardType;

    const-string v1, "MINUTE_CARD"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-string v4, "\u5206\u949f\u5361"

    const-string v5, "1\u5206\u949f"

    const-wide/32 v6, 0xea60

    move-object v0, v8

    invoke-direct/range {v0 .. v7}, Lcom/license/verify2/CardType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;J)V

    sput-object v8, Lcom/license/verify2/CardType;->MINUTE_CARD:Lcom/license/verify2/CardType;

    .line 6
    new-instance v0, Lcom/license/verify2/CardType;

    const-string v10, "HOUR_CARD"

    const/4 v11, 0x1

    const/4 v12, 0x1

    const-string v13, "\u5c0f\u65f6\u5361"

    const-string v14, "1\u5c0f\u65f6"

    const-wide/32 v15, 0x36ee80

    move-object v9, v0

    invoke-direct/range {v9 .. v16}, Lcom/license/verify2/CardType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;J)V

    sput-object v0, Lcom/license/verify2/CardType;->HOUR_CARD:Lcom/license/verify2/CardType;

    .line 7
    new-instance v0, Lcom/license/verify2/CardType;

    const-string v2, "DAY_CARD"

    const/4 v3, 0x2

    const/4 v4, 0x2

    const-string v5, "\u5929\u5361"

    const-string v6, "1\u5929"

    const-wide/32 v7, 0x5265c00

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Lcom/license/verify2/CardType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;J)V

    sput-object v0, Lcom/license/verify2/CardType;->DAY_CARD:Lcom/license/verify2/CardType;

    .line 8
    new-instance v0, Lcom/license/verify2/CardType;

    const-string v10, "WEEK_CARD"

    const/4 v11, 0x3

    const/4 v12, 0x3

    const-string v13, "\u5468\u5361"

    const-string v14, "7\u5929"

    const-wide/32 v15, 0x240c8400

    move-object v9, v0

    invoke-direct/range {v9 .. v16}, Lcom/license/verify2/CardType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;J)V

    sput-object v0, Lcom/license/verify2/CardType;->WEEK_CARD:Lcom/license/verify2/CardType;

    .line 9
    new-instance v0, Lcom/license/verify2/CardType;

    const-string v2, "MONTH_CARD"

    const/4 v3, 0x4

    const/4 v4, 0x4

    const-string v5, "\u6708\u5361"

    const-string v6, "30\u5929"

    const-wide v7, 0x9a7ec800L

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Lcom/license/verify2/CardType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;J)V

    sput-object v0, Lcom/license/verify2/CardType;->MONTH_CARD:Lcom/license/verify2/CardType;

    .line 10
    new-instance v0, Lcom/license/verify2/CardType;

    const-string v10, "QUARTER_CARD"

    const/4 v11, 0x5

    const/4 v12, 0x5

    const-string v13, "\u5b63\u5361"

    const-string v14, "90\u5929"

    const-wide v15, 0x1cf7c5800L

    move-object v9, v0

    invoke-direct/range {v9 .. v16}, Lcom/license/verify2/CardType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;J)V

    sput-object v0, Lcom/license/verify2/CardType;->QUARTER_CARD:Lcom/license/verify2/CardType;

    .line 11
    new-instance v0, Lcom/license/verify2/CardType;

    const-string v2, "HALF_YEAR_CARD"

    const/4 v3, 0x6

    const/4 v4, 0x6

    const-string v5, "\u534a\u5e74\u5361"

    const-string v6, "180\u5929"

    const-wide v7, 0x39ef8b000L

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Lcom/license/verify2/CardType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;J)V

    sput-object v0, Lcom/license/verify2/CardType;->HALF_YEAR_CARD:Lcom/license/verify2/CardType;

    .line 12
    new-instance v0, Lcom/license/verify2/CardType;

    const-string v10, "YEAR_CARD"

    const/4 v11, 0x7

    const/4 v12, 0x7

    const-string v13, "\u5e74\u5361"

    const-string v14, "365\u5929"

    const-wide v15, 0x757b12c00L

    move-object v9, v0

    invoke-direct/range {v9 .. v16}, Lcom/license/verify2/CardType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;J)V

    sput-object v0, Lcom/license/verify2/CardType;->YEAR_CARD:Lcom/license/verify2/CardType;

    .line 13
    new-instance v0, Lcom/license/verify2/CardType;

    const-string v2, "LIFETIME_CARD"

    const/16 v3, 0x8

    const/16 v4, 0x8

    const-string v5, "\u7ec8\u8eab\u5361"

    const-string v6, "\u6c38\u4e45"

    const-wide/16 v7, -0x1

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Lcom/license/verify2/CardType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;J)V

    sput-object v0, Lcom/license/verify2/CardType;->LIFETIME_CARD:Lcom/license/verify2/CardType;

    .line 14
    new-instance v0, Lcom/license/verify2/CardType;

    const-string v10, "CUSTOM_CARD"

    const/16 v11, 0x9

    const/16 v12, 0x9

    const-string v13, "\u81ea\u5b9a\u4e49\u5361"

    const-string v14, "\u81ea\u5b9a\u4e49"

    const-wide/16 v15, -0x2

    move-object v9, v0

    invoke-direct/range {v9 .. v16}, Lcom/license/verify2/CardType;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;J)V

    sput-object v0, Lcom/license/verify2/CardType;->CUSTOM_CARD:Lcom/license/verify2/CardType;

    .line 4
    invoke-static {}, Lcom/license/verify2/CardType;->$values()[Lcom/license/verify2/CardType;

    move-result-object v0

    sput-object v0, Lcom/license/verify2/CardType;->$VALUES:[Lcom/license/verify2/CardType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .param p3, "i"    # I
    .param p4, "str"    # Ljava/lang/String;
    .param p5, "str2"    # Ljava/lang/String;
    .param p6, "j"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J)V"
        }
    .end annotation

    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 22
    iput p3, p0, Lcom/license/verify2/CardType;->code:I

    .line 23
    iput-object p4, p0, Lcom/license/verify2/CardType;->name:Ljava/lang/String;

    .line 24
    iput-object p5, p0, Lcom/license/verify2/CardType;->durationText:Ljava/lang/String;

    .line 25
    iput-wide p6, p0, Lcom/license/verify2/CardType;->durationMillis:J

    .line 26
    return-void
.end method

.method public static fromCode(I)Lcom/license/verify2/CardType;
    .locals 5
    .param p0, "i"    # I

    .line 49
    invoke-static {}, Lcom/license/verify2/CardType;->values()[Lcom/license/verify2/CardType;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 50
    .local v3, "cardType":Lcom/license/verify2/CardType;
    iget v4, v3, Lcom/license/verify2/CardType;->code:I

    if-ne v4, p0, :cond_0

    .line 51
    return-object v3

    .line 49
    .end local v3    # "cardType":Lcom/license/verify2/CardType;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 54
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u672a\u77e5\u5361\u7c7b\u578b\u7f16\u53f7: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/license/verify2/CardType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 4
    const-class v0, Lcom/license/verify2/CardType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/license/verify2/CardType;

    return-object v0
.end method

.method public static values()[Lcom/license/verify2/CardType;
    .locals 1

    .line 4
    sget-object v0, Lcom/license/verify2/CardType;->$VALUES:[Lcom/license/verify2/CardType;

    invoke-virtual {v0}, [Lcom/license/verify2/CardType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/license/verify2/CardType;

    return-object v0
.end method


# virtual methods
.method public getCode()I
    .locals 1

    .line 29
    iget v0, p0, Lcom/license/verify2/CardType;->code:I

    return v0
.end method

.method public getDurationMillis()J
    .locals 2

    .line 41
    iget-wide v0, p0, Lcom/license/verify2/CardType;->durationMillis:J

    return-wide v0
.end method

.method public getDurationText()Ljava/lang/String;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/license/verify2/CardType;->durationText:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/license/verify2/CardType;->name:Ljava/lang/String;

    return-object v0
.end method

.method public isLifetime()Z
    .locals 4

    .line 45
    iget-wide v0, p0, Lcom/license/verify2/CardType;->durationMillis:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
