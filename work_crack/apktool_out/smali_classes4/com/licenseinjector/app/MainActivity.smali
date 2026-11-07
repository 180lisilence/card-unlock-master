.class public Lcom/licenseinjector/app/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# instance fields
.field private etKey:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/licenseinjector/app/MainActivity;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/licenseinjector/app/MainActivity;

    .line 15
    iget-object v0, p0, Lcom/licenseinjector/app/MainActivity;->etKey:Landroid/widget/EditText;

    return-object v0
.end method

.method private buildUi()V
    .locals 16

    .line 25
    move-object/from16 v0, p0

    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 26
    .local v1, "scroll":Landroid/widget/ScrollView;
    invoke-static {}, Lcom/licenseinjector/app/UiTheme;->pageGradient()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 27
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 28
    .local v2, "root":Landroid/widget/LinearLayout;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 29
    const/16 v4, 0x14

    invoke-direct {v0, v4}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v5

    .line 30
    .local v5, "p":I
    invoke-virtual {v2, v5, v5, v5, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 31
    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 33
    const-string v6, "\u5361\u5bc6\u5de5\u5177\u7bb1"

    const/16 v7, 0x1a

    const v8, -0xe0dcd0

    invoke-direct {v0, v6, v7, v8, v3}, Lcom/licenseinjector/app/MainActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v6

    .line 34
    .local v6, "title":Landroid/widget/TextView;
    const/16 v7, 0x11

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 35
    invoke-static {v6}, Lcom/licenseinjector/app/UiTheme;->shimmerText(Landroid/widget/TextView;)V

    .line 36
    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 38
    const-string v9, "\u751f\u6210\u5361\u5bc6 + \u6ce8\u5165 APK \u00b7 \u5408\u5e76\u7248"

    const/16 v10, 0xd

    const v11, -0x948d80

    const/4 v12, 0x0

    invoke-direct {v0, v9, v10, v11, v12}, Lcom/licenseinjector/app/MainActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v9

    .line 39
    .local v9, "sub":Landroid/widget/TextView;
    invoke-virtual {v9, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 40
    const/4 v7, 0x6

    invoke-direct {v0, v7}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v10

    invoke-direct {v0, v4}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v13

    invoke-virtual {v9, v12, v10, v12, v13}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 41
    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 43
    const-string v10, "\u5171\u4eab\u5bc6\u94a5\uff08\u751f\u6210\u4e0e\u6ce8\u5165\u987b\u4e00\u81f4\uff09"

    const v13, -0x9c990f

    invoke-direct {v0, v10, v13}, Lcom/licenseinjector/app/MainActivity;->fieldLabel(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v10

    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 44
    new-instance v10, Landroid/widget/EditText;

    invoke-direct {v10, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v10, v0, Lcom/licenseinjector/app/MainActivity;->etKey:Landroid/widget/EditText;

    .line 45
    const-string v13, "\u4f8b\u5982 ABCDEF012345"

    invoke-virtual {v10, v13}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 46
    iget-object v10, v0, Lcom/licenseinjector/app/MainActivity;->etKey:Landroid/widget/EditText;

    invoke-virtual {v10, v8}, Landroid/widget/EditText;->setTextColor(I)V

    .line 47
    iget-object v8, v0, Lcom/licenseinjector/app/MainActivity;->etKey:Landroid/widget/EditText;

    invoke-virtual {v8, v11}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 48
    iget-object v8, v0, Lcom/licenseinjector/app/MainActivity;->etKey:Landroid/widget/EditText;

    const/4 v10, -0x1

    invoke-virtual {v8, v10}, Landroid/widget/EditText;->setBackgroundColor(I)V

    .line 49
    iget-object v8, v0, Lcom/licenseinjector/app/MainActivity;->etKey:Landroid/widget/EditText;

    const/16 v13, 0xc

    invoke-direct {v0, v13}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v14

    invoke-direct {v0, v13}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v15

    invoke-direct {v0, v13}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v11

    invoke-direct {v0, v13}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v4

    invoke-virtual {v8, v14, v15, v11, v4}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 50
    iget-object v4, v0, Lcom/licenseinjector/app/MainActivity;->etKey:Landroid/widget/EditText;

    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 51
    iget-object v3, v0, Lcom/licenseinjector/app/MainActivity;->etKey:Landroid/widget/EditText;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 53
    const-string v3, "\u26a0\ufe0f \u8fd9\u628a\u300c\u5171\u4eab\u5bc6\u94a5\u300d\u4f1a\u540c\u65f6\u7528\u4e8e\u300c\u6ce8\u5165\u300d\u548c\u300c\u751f\u6210\u5361\u5bc6\u300d\uff0c\u4e24\u7aef\u5fc5\u987b\u586b\u5b8c\u5168\u76f8\u540c\u7684\u5185\u5bb9\uff0c\u5426\u5219\u751f\u6210\u7684\u5361\u5bc6\u6c38\u8fdc\u65e0\u6548\uff01"

    const v4, -0x13b767

    invoke-direct {v0, v3, v13, v4, v12}, Lcom/licenseinjector/app/MainActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v3

    .line 55
    .local v3, "keyWarn":Landroid/widget/TextView;
    invoke-direct {v0, v7}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v4

    const/4 v7, 0x4

    invoke-direct {v0, v7}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v7

    invoke-virtual {v3, v12, v4, v12, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 56
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 58
    new-instance v4, Landroid/widget/Button;

    invoke-direct {v4, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 59
    .local v4, "gen":Landroid/widget/Button;
    const-string v7, "\u2460 \u5361\u5bc6\u751f\u6210"

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 60
    invoke-static {v4}, Lcom/licenseinjector/app/UiTheme;->styleButton(Landroid/widget/Button;)V

    .line 61
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x2

    invoke-direct {v7, v10, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 62
    .local v7, "glp":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v11, 0x14

    invoke-direct {v0, v11}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v11

    iput v11, v7, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 63
    invoke-virtual {v4, v7}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    new-instance v11, Lcom/licenseinjector/app/MainActivity$1;

    invoke-direct {v11, v0}, Lcom/licenseinjector/app/MainActivity$1;-><init>(Lcom/licenseinjector/app/MainActivity;)V

    invoke-virtual {v4, v11}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 74
    new-instance v11, Landroid/widget/Button;

    invoke-direct {v11, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 75
    .local v11, "inj":Landroid/widget/Button;
    const-string v14, "\u2461 \u5361\u5bc6\u6ce8\u5165"

    invoke-virtual {v11, v14}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 76
    invoke-static {v11}, Lcom/licenseinjector/app/UiTheme;->styleButton(Landroid/widget/Button;)V

    .line 77
    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v14, v10, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 78
    .local v14, "ilp":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v15, 0xe

    invoke-direct {v0, v15}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v15

    iput v15, v14, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 79
    invoke-virtual {v11, v14}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    new-instance v15, Lcom/licenseinjector/app/MainActivity$2;

    invoke-direct {v15, v0}, Lcom/licenseinjector/app/MainActivity$2;-><init>(Lcom/licenseinjector/app/MainActivity;)V

    invoke-virtual {v11, v15}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    invoke-virtual {v2, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 90
    const-string v15, "\u63d0\u793a\uff1a\u5148\u7528\u300c\u5361\u5bc6\u751f\u6210\u300d\u6309\u8bbe\u5907\u7801\u53d1\u5361\uff0c\u518d\u7528\u300c\u5361\u5bc6\u6ce8\u5165\u300d\u628a\u9a8c\u8bc1\u6a21\u5757\u6253\u8fdb\u76ee\u6807 APK\uff0c\u4e24\u8005\u52a1\u5fc5\u4f7f\u7528\u540c\u4e00\u4e2a\u5bc6\u94a5\u3002"

    const v8, -0x948d80

    invoke-direct {v0, v15, v13, v8, v12}, Lcom/licenseinjector/app/MainActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v8

    .line 92
    .local v8, "tip":Landroid/widget/TextView;
    const/16 v13, 0x16

    invoke-direct {v0, v13}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v13

    invoke-virtual {v8, v12, v13, v12, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 93
    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 95
    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v13, -0x2

    invoke-direct {v12, v10, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    move-object v10, v12

    .line 96
    .local v10, "ucLp":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v12, 0x10

    invoke-direct {v0, v12}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v12

    iput v12, v10, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 97
    invoke-direct/range {p0 .. p0}, Lcom/licenseinjector/app/MainActivity;->usageCard()Landroid/widget/LinearLayout;

    move-result-object v12

    .line 98
    .local v12, "uc":Landroid/widget/LinearLayout;
    invoke-virtual {v12, v10}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 99
    invoke-virtual {v2, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 101
    invoke-virtual {v0, v1}, Lcom/licenseinjector/app/MainActivity;->setContentView(Landroid/view/View;)V

    .line 102
    return-void
.end method

.method private dp(I)I
    .locals 2
    .param p1, "i"    # I

    .line 162
    int-to-float v0, p1

    invoke-virtual {p0}, Lcom/licenseinjector/app/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method private fieldLabel(Ljava/lang/String;I)Landroid/widget/TextView;
    .locals 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "color"    # I

    .line 144
    const/16 v0, 0xd

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, p2, v1}, Lcom/licenseinjector/app/MainActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    .line 145
    .local v0, "t":Landroid/widget/TextView;
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 146
    .local v1, "lp":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v2, 0xe

    invoke-direct {p0, v2}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 147
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 148
    invoke-static {v0}, Lcom/licenseinjector/app/UiTheme;->shimmerText(Landroid/widget/TextView;)V

    .line 149
    return-object v0
.end method

.method private tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;
    .locals 3
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "size"    # I
    .param p3, "color"    # I
    .param p4, "bold"    # Z

    .line 153
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 154
    .local v0, "t":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    int-to-float v1, p2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 156
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 157
    if-eqz p4, :cond_0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 158
    :cond_0
    return-object v0
.end method

.method private usageCard()Landroid/widget/LinearLayout;
    .locals 11

    .line 106
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 107
    .local v0, "card":Landroid/widget/LinearLayout;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 108
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 109
    .local v2, "gd":Landroid/graphics/drawable/GradientDrawable;
    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 110
    const/16 v3, 0xe

    invoke-direct {p0, v3}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 111
    const/4 v4, 0x2

    invoke-direct {p0, v4}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v4

    const v5, -0x74a30a

    invoke-virtual {v2, v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 112
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 113
    invoke-direct {p0, v3}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v3

    .line 114
    .local v3, "cpad":I
    invoke-virtual {v0, v3, v3, v3, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 116
    const/16 v4, 0x10

    const v5, -0x9c990f

    const-string v6, "\ud83d\udcd6 \u4f7f\u7528\u8bf4\u660e\uff08\u5fc5\u8bfb\uff09"

    invoke-direct {p0, v6, v4, v5, v1}, Lcom/licenseinjector/app/MainActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v1

    .line 117
    .local v1, "h":Landroid/widget/TextView;
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 119
    const-string v4, "\u3010\u6838\u5fc3\u3011\u5171\u4eab\u5bc6\u94a5\u662f\u540c\u4e00\u628a\u300c\u4e3b\u5bc6\u94a5\u300d\uff1a\u5b83\u65e2\u7528\u4e8e\u300c\u6ce8\u5165\u65f6\u7ed9 App \u6253\u6807\u8bb0\u300d\uff0c\u4e5f\u7528\u4e8e\u300c\u751f\u6210\u5361\u5bc6\u300d\u3002\n\u6ce8\u5165\u65f6\u586b\u7684\u5bc6\u94a5 \u5fc5\u987b = \u751f\u6210\u5361\u5bc6\u65f6\u586b\u7684\u5bc6\u94a5\uff0c\u5426\u5219\u5361\u5bc6\u5fc5\u65e0\u6548\uff01"

    const-string v5, "\u3010\u8bbe\u5bc6\u94a5\uff08\u53ea\u9700\u4e00\u6b21\uff09\u3011\n\u5728\u9996\u9875\u9876\u90e8\u300c\u5171\u4eab\u5bc6\u94a5\u300d\u586b\u4efb\u610f\u4e00\u4e32\uff08\u5982 123456\uff09\u3002\u5b83\u4f1a\u88ab\u81ea\u52a8\u5e26\u8fdb \u2460 \u548c \u2461\uff0c\u65e0\u9700\u91cd\u590d\u8f93\u5165\u3002\n\uff08\u82e5\u4f60\u5728 \u2460 \u91cc\u5355\u72ec\u6539\u4e86\u5bc6\u94a5\uff0c\u8bb0\u5f97 \u2461 \u91cc\u4e5f\u8981\u586b\u4e00\u6a21\u4e00\u6837\u7684\u4e00\u4e32\u3002\uff09"

    const-string v6, "\u3010\u9996\u6b21\u6ce8\u5165\u3011\n\u76f4\u63a5\u8fdb\u300c\u2461 \u5361\u5bc6\u6ce8\u5165\u300d\u2192 \u300c\u5361\u5bc6\u5bc6\u94a5\u300d\u5df2\u81ea\u52a8\u5e26\u51fa 123456 \u2192 \u9009\u76ee\u6807 APK \u2192 \u6ce8\u5165\u5e76\u4fdd\u5b58\u3002"

    const-string v7, "\u3010\u751f\u6210\u5361\u5bc6\uff08\u6bcf\u6b21\u53d1\u7ed9\u7528\u6237\uff09\u3011\n\u2460 \u6253\u5f00\u88ab\u6ce8\u5165\u7684 App \u2192 \u5f39\u7a97\u91cc\u300c\u590d\u5236\u672c\u673a\u8bbe\u5907\u7801\u300d\u3002\n\u2461 \u8fdb\u300c\u2460 \u5361\u5bc6\u751f\u6210\u300d\u2192 \u5171\u4eab\u5bc6\u94a5\u5df2\u5e26\u51fa 123456 \u2192 \u7c98\u8d34\u8bbe\u5907\u7801 \u2192 \u9009\u5361\u7c7b\u578b/\u957f\u5ea6/\u6570\u91cf \u2192 \u70b9\u300c\u751f\u6210\u5361\u5bc6\u300d\u2192 \u590d\u5236\u7ed3\u679c\u3002"

    const-string v8, "\u3010\u7528\u6237\u9a8c\u8bc1\u3011\n\u628a\u5361\u5bc6\u53d1\u7ed9\u7528\u6237\uff0c\u7528\u6237\u5728\u5f39\u7a97\u7c98\u8d34 \u2192 \u9a8c\u8bc1\u901a\u8fc7\uff08\u5982\u300c\u7ec8\u8eab\u5361\u300d\uff09\u3002"

    const-string v9, "\u3010\u4e00\u53e5\u8bdd\u8bb0\u7262\u3011\n\u9996\u9875\u586b\u4e00\u6b21\u5171\u4eab\u5bc6\u94a5\uff0c\u2460\u548c\u2461\u81ea\u52a8\u540c\u6b65\uff1b\u6ce8\u5165\u5bc6\u94a5 = \u751f\u6210\u5bc6\u94a5 = \u540c\u4e00\u628a\u3002"

    filled-new-array/range {v4 .. v9}, [Ljava/lang/String;

    move-result-object v4

    .line 135
    .local v4, "steps":[Ljava/lang/String;
    array-length v5, v4

    const/4 v6, 0x0

    move v7, v6

    :goto_0
    if-ge v7, v5, :cond_0

    aget-object v8, v4, v7

    .line 136
    .local v8, "s":Ljava/lang/String;
    const/16 v9, 0xc

    const v10, -0xe0dcd0

    invoke-direct {p0, v8, v9, v10, v6}, Lcom/licenseinjector/app/MainActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v9

    .line 137
    .local v9, "p":Landroid/widget/TextView;
    const/16 v10, 0x8

    invoke-direct {p0, v10}, Lcom/licenseinjector/app/MainActivity;->dp(I)I

    move-result v10

    invoke-virtual {v9, v6, v10, v6, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 138
    invoke-virtual {v0, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 135
    .end local v8    # "s":Ljava/lang/String;
    .end local v9    # "p":Landroid/widget/TextView;
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 140
    :cond_0
    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "b"    # Landroid/os/Bundle;

    .line 20
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 21
    invoke-direct {p0}, Lcom/licenseinjector/app/MainActivity;->buildUi()V

    .line 22
    return-void
.end method
