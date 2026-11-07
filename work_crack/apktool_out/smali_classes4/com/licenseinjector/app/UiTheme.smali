.class public final Lcom/licenseinjector/app/UiTheme;
.super Ljava/lang/Object;
.source "UiTheme.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;
    }
.end annotation


# static fields
.field public static final ACCENT1:I = -0x9c990f

.field public static final ACCENT2:I = -0x74a30a

.field public static final ACCENT3:I = -0x13b767

.field public static final BG_A:I = -0x110d01

.field public static final BG_B:I = -0x162a01

.field public static final CARD:I = -0x1

.field private static final SHIMMER:[I

.field public static final SUB:I = -0x948d80

.field public static final TEXT:I = -0xe0dcd0


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/licenseinjector/app/UiTheme;->SHIMMER:[I

    return-void

    nop

    :array_0
    .array-data 4
        -0x9c990f
        -0x74a30a
        -0x13b767
        -0xf9492c
        -0xdd3aa2
        -0xa61f5
        -0x9c990f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()[I
    .locals 1

    .line 26
    sget-object v0, Lcom/licenseinjector/app/UiTheme;->SHIMMER:[I

    return-object v0
.end method

.method static synthetic access$100(F)F
    .locals 1
    .param p0, "x0"    # F

    .line 26
    invoke-static {p0}, Lcom/licenseinjector/app/UiTheme;->dp(F)F

    move-result v0

    return v0
.end method

.method private static dp(F)F
    .locals 2
    .param p0, "v"    # F

    .line 52
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p0

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    return v0
.end method

.method public static pageGradient()Landroid/graphics/drawable/GradientDrawable;
    .locals 4

    .line 57
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    const v2, -0x110d01

    const v3, -0x162a01

    filled-new-array {v2, v3}, [I

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 60
    .local v0, "g":Landroid/graphics/drawable/GradientDrawable;
    return-object v0
.end method

.method public static shimmerText(Landroid/widget/TextView;)V
    .locals 2
    .param p0, "t"    # Landroid/widget/TextView;

    .line 87
    invoke-virtual {p0}, Landroid/widget/TextView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/licenseinjector/app/UiTheme$2;

    invoke-direct {v1, p0}, Lcom/licenseinjector/app/UiTheme$2;-><init>(Landroid/widget/TextView;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 132
    return-void
.end method

.method public static styleButton(Landroid/widget/Button;)V
    .locals 3
    .param p0, "b"    # Landroid/widget/Button;

    .line 68
    new-instance v0, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;

    const/high16 v1, 0x41600000    # 14.0f

    invoke-direct {v0, v1}, Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;-><init>(F)V

    .line 69
    .local v0, "d":Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;
    invoke-virtual {p0, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 70
    const/4 v1, -0x1

    invoke-virtual {p0, v1}, Landroid/widget/Button;->setTextColor(I)V

    .line 71
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 72
    const/high16 v2, 0x41500000    # 13.0f

    invoke-static {v2}, Lcom/licenseinjector/app/UiTheme;->dp(F)F

    move-result v2

    float-to-int v2, v2

    .line 73
    .local v2, "pad":I
    invoke-virtual {p0, v1, v2, v1, v2}, Landroid/widget/Button;->setPadding(IIII)V

    .line 74
    new-instance v1, Lcom/licenseinjector/app/UiTheme$1;

    invoke-direct {v1, v0}, Lcom/licenseinjector/app/UiTheme$1;-><init>(Lcom/licenseinjector/app/UiTheme$ShimmerBgDrawable;)V

    invoke-virtual {p0, v1}, Landroid/widget/Button;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 80
    return-void
.end method
