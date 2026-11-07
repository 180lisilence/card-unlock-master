.class public final enum Lcom/licenseinjector/app/Generator$Format;
.super Ljava/lang/Enum;
.source "Generator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/licenseinjector/app/Generator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Format"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/licenseinjector/app/Generator$Format;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/licenseinjector/app/Generator$Format;

.field public static final enum ALPHA:Lcom/licenseinjector/app/Generator$Format;

.field public static final enum DIGIT:Lcom/licenseinjector/app/Generator$Format;


# direct methods
.method private static synthetic $values()[Lcom/licenseinjector/app/Generator$Format;
    .locals 2

    .line 20
    sget-object v0, Lcom/licenseinjector/app/Generator$Format;->DIGIT:Lcom/licenseinjector/app/Generator$Format;

    sget-object v1, Lcom/licenseinjector/app/Generator$Format;->ALPHA:Lcom/licenseinjector/app/Generator$Format;

    filled-new-array {v0, v1}, [Lcom/licenseinjector/app/Generator$Format;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 20
    new-instance v0, Lcom/licenseinjector/app/Generator$Format;

    const-string v1, "DIGIT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/licenseinjector/app/Generator$Format;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/licenseinjector/app/Generator$Format;->DIGIT:Lcom/licenseinjector/app/Generator$Format;

    new-instance v0, Lcom/licenseinjector/app/Generator$Format;

    const-string v1, "ALPHA"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/licenseinjector/app/Generator$Format;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/licenseinjector/app/Generator$Format;->ALPHA:Lcom/licenseinjector/app/Generator$Format;

    invoke-static {}, Lcom/licenseinjector/app/Generator$Format;->$values()[Lcom/licenseinjector/app/Generator$Format;

    move-result-object v0

    sput-object v0, Lcom/licenseinjector/app/Generator$Format;->$VALUES:[Lcom/licenseinjector/app/Generator$Format;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 20
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/licenseinjector/app/Generator$Format;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 20
    const-class v0, Lcom/licenseinjector/app/Generator$Format;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/licenseinjector/app/Generator$Format;

    return-object v0
.end method

.method public static values()[Lcom/licenseinjector/app/Generator$Format;
    .locals 1

    .line 20
    sget-object v0, Lcom/licenseinjector/app/Generator$Format;->$VALUES:[Lcom/licenseinjector/app/Generator$Format;

    invoke-virtual {v0}, [Lcom/licenseinjector/app/Generator$Format;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/licenseinjector/app/Generator$Format;

    return-object v0
.end method
