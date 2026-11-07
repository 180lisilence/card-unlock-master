.class public final enum Lcom/android/apksig/internal/asn1/Asn1TagClass;
.super Ljava/lang/Enum;
.source "Asn1TagClass.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/android/apksig/internal/asn1/Asn1TagClass;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/apksig/internal/asn1/Asn1TagClass;

.field public static final enum APPLICATION:Lcom/android/apksig/internal/asn1/Asn1TagClass;

.field public static final enum AUTOMATIC:Lcom/android/apksig/internal/asn1/Asn1TagClass;

.field public static final enum CONTEXT_SPECIFIC:Lcom/android/apksig/internal/asn1/Asn1TagClass;

.field public static final enum PRIVATE:Lcom/android/apksig/internal/asn1/Asn1TagClass;

.field public static final enum UNIVERSAL:Lcom/android/apksig/internal/asn1/Asn1TagClass;


# direct methods
.method private static synthetic $values()[Lcom/android/apksig/internal/asn1/Asn1TagClass;
    .locals 5

    .line 19
    sget-object v0, Lcom/android/apksig/internal/asn1/Asn1TagClass;->UNIVERSAL:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    sget-object v1, Lcom/android/apksig/internal/asn1/Asn1TagClass;->APPLICATION:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    sget-object v2, Lcom/android/apksig/internal/asn1/Asn1TagClass;->CONTEXT_SPECIFIC:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    sget-object v3, Lcom/android/apksig/internal/asn1/Asn1TagClass;->PRIVATE:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    sget-object v4, Lcom/android/apksig/internal/asn1/Asn1TagClass;->AUTOMATIC:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/android/apksig/internal/asn1/Asn1TagClass;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 20
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1TagClass;

    const-string v1, "UNIVERSAL"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1TagClass;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1TagClass;->UNIVERSAL:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    .line 21
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1TagClass;

    const-string v1, "APPLICATION"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1TagClass;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1TagClass;->APPLICATION:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    .line 22
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1TagClass;

    const-string v1, "CONTEXT_SPECIFIC"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1TagClass;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1TagClass;->CONTEXT_SPECIFIC:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    .line 23
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1TagClass;

    const-string v1, "PRIVATE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1TagClass;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1TagClass;->PRIVATE:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    .line 29
    new-instance v0, Lcom/android/apksig/internal/asn1/Asn1TagClass;

    const-string v1, "AUTOMATIC"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/internal/asn1/Asn1TagClass;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1TagClass;->AUTOMATIC:Lcom/android/apksig/internal/asn1/Asn1TagClass;

    .line 19
    invoke-static {}, Lcom/android/apksig/internal/asn1/Asn1TagClass;->$values()[Lcom/android/apksig/internal/asn1/Asn1TagClass;

    move-result-object v0

    sput-object v0, Lcom/android/apksig/internal/asn1/Asn1TagClass;->$VALUES:[Lcom/android/apksig/internal/asn1/Asn1TagClass;

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

.method public static valueOf(Ljava/lang/String;)Lcom/android/apksig/internal/asn1/Asn1TagClass;
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
    const-class v0, Lcom/android/apksig/internal/asn1/Asn1TagClass;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/apksig/internal/asn1/Asn1TagClass;

    return-object v0
.end method

.method public static values()[Lcom/android/apksig/internal/asn1/Asn1TagClass;
    .locals 1

    .line 19
    sget-object v0, Lcom/android/apksig/internal/asn1/Asn1TagClass;->$VALUES:[Lcom/android/apksig/internal/asn1/Asn1TagClass;

    invoke-virtual {v0}, [Lcom/android/apksig/internal/asn1/Asn1TagClass;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/apksig/internal/asn1/Asn1TagClass;

    return-object v0
.end method
