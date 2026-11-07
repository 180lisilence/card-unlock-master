.class public final enum Lcom/android/apksig/internal/asn1/Asn1Type;
.super Ljava/lang/Enum;
.source "Asn1Type.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/apksig/internal/asn1/Asn1Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/apksig/internal/asn1/Asn1Type;

.field public static final enum ANY:Lcom/android/apksig/internal/asn1/Asn1Type;

.field public static final enum BIT_STRING:Lcom/android/apksig/internal/asn1/Asn1Type;

.field public static final enum BOOLEAN:Lcom/android/apksig/internal/asn1/Asn1Type;

.field public static final enum CHOICE:Lcom/android/apksig/internal/asn1/Asn1Type;

.field public static final enum GENERALIZED_TIME:Lcom/android/apksig/internal/asn1/Asn1Type;

.field public static final enum INTEGER:Lcom/android/apksig/internal/asn1/Asn1Type;

.field public static final enum OBJECT_IDENTIFIER:Lcom/android/apksig/internal/asn1/Asn1Type;

.field public static final enum OCTET_STRING:Lcom/android/apksig/internal/asn1/Asn1Type;

.field public static final enum SEQUENCE:Lcom/android/apksig/internal/asn1/Asn1Type;

.field public static final enum SEQUENCE_OF:Lcom/android/apksig/internal/asn1/Asn1Type;

.field public static final enum SET_OF:Lcom/android/apksig/internal/asn1/Asn1Type;

.field public static final enum UNENCODED_CONTAINER:Lcom/android/apksig/internal/asn1/Asn1Type;

.field public static final enum UTC_TIME:Lcom/android/apksig/internal/asn1/Asn1Type;


# direct methods
.method private static synthetic $values()[Lcom/android/apksig/internal/asn1/Asn1Type;
    .locals 13

    .line 19
    sget-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->ANY:Lcom/android/apksig/internal/asn1/Asn1Type;

    sget-object v1, Lcom/android/apksig/internal/asn1/Asn1Type;->CHOICE:Lcom/android/apksig/internal/asn1/Asn1Type;

    sget-object v2, Lcom/android/apksig/internal/asn1/Asn1Type;->INTEGER:Lcom/android/apksig/internal/asn1/Asn1Type;

    sget-object v3, Lcom/android/apksig/internal/asn1/Asn1Type;->OBJECT_IDENTIFIER:Lcom/android/apksig/internal/asn1/Asn1Type;

    sget-object v4, Lcom/android/apksig/internal/asn1/Asn1Type;->OCTET_STRING:Lcom/android/apksig/internal/asn1/Asn1Type;

    sget-object v5, Lcom/android/apksig/internal/asn1/Asn1Type;->SEQUENCE:Lcom/android/apksig/internal/asn1/Asn1Type;

    sget-object v6, Lcom/android/apksig/internal/asn1/Asn1Type;->SEQUENCE_OF:Lcom/android/apksig/internal/asn1/Asn1Type;

    sget-object v7, Lcom/android/apksig/internal/asn1/Asn1Type;->SET_OF:Lcom/android/apksig/internal/asn1/Asn1Type;

    sget-object v8, Lcom/android/apksig/internal/asn1/Asn1Type;->BIT_STRING:Lcom/android/apksig/internal/asn1/Asn1Type;

    sget-object v9, Lcom/android/apksig/internal/asn1/Asn1Type;->UTC_TIME:Lcom/android/apksig/internal/asn1/Asn1Type;

    sget-object v10, Lcom/android/apksig/internal/asn1/Asn1Type;->GENERALIZED_TIME:Lcom/android/apksig/internal/asn1/Asn1Type;

    sget-object v11, Lcom/android/apksig/internal/asn1/Asn1Type;->BOOLEAN:Lcom/android/apksig/internal/asn1/Asn1Type;

    sget-object v12, Lcom/android/apksig/internal/asn1/Asn1Type;->UNENCODED_CONTAINER:Lcom/android/apksig/internal/asn1/Asn1Type;

    filled-new-array/range {v0 .. v12}, [Lcom/android/apksig/internal/asn1/Asn1Type;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 20
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1Type;

    const-string v1, "ANY"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->ANY:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 21
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1Type;

    const-string v1, "CHOICE"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->CHOICE:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 22
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1Type;

    const-string v1, "INTEGER"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->INTEGER:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 23
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1Type;

    const-string v1, "OBJECT_IDENTIFIER"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->OBJECT_IDENTIFIER:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 24
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1Type;

    const-string v1, "OCTET_STRING"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->OCTET_STRING:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 25
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1Type;

    const-string v1, "SEQUENCE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->SEQUENCE:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 26
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1Type;

    const-string v1, "SEQUENCE_OF"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->SEQUENCE_OF:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 27
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1Type;

    const-string v1, "SET_OF"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->SET_OF:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 28
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1Type;

    const-string v1, "BIT_STRING"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->BIT_STRING:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 29
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1Type;

    const-string v1, "UTC_TIME"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->UTC_TIME:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 30
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1Type;

    const-string v1, "GENERALIZED_TIME"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->GENERALIZED_TIME:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 31
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1Type;

    const-string v1, "BOOLEAN"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->BOOLEAN:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 34
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1Type;

    const-string v1, "UNENCODED_CONTAINER"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->UNENCODED_CONTAINER:Lcom/android/apksig/internal/asn1/Asn1Type;

    .line 19
    invoke-static {}, Lcom/android/apksig/internal/asn1/Asn1Type;->$values()[Lcom/android/apksig/internal/asn1/Asn1Type;

    move-result-object v0

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->$VALUES:[Lcom/android/apksig/internal/asn1/Asn1Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "$enum$name",
            "$enum$ordinal"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/apksig/internal/asn1/Asn1Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 19
    const-class v0, Lcom/android/apksig/internal/asn1/Asn1Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/apksig/internal/asn1/Asn1Type;

    return-object v0
.end method

.method public static values()[Lcom/android/apksig/internal/asn1/Asn1Type;
    .locals 1

    .line 19
    sget-object v0, Lcom/android/apksig/internal/asn1/Asn1Type;->$VALUES:[Lcom/android/apksig/internal/asn1/Asn1Type;

    invoke-virtual {v0}, [Lcom/android/apksig/internal/asn1/Asn1Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/apksig/internal/asn1/Asn1Type;

    return-object v0
.end method
