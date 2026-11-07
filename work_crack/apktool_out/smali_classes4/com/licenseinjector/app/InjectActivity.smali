.class public Lcom/licenseinjector/app/InjectActivity;
.super Landroid/app/Activity;
.source "InjectActivity.java"


# static fields
.field private static final REQ_IN:I = 0x3e9

.field private static final REQ_OUT:I = 0x3ea


# instance fields
.field private etKey:Landroid/widget/EditText;

.field private outUri:Landroid/net/Uri;

.field private pendingKey:Ljava/lang/String;

.field private targetName:Ljava/lang/String;

.field private targetUri:Landroid/net/Uri;

.field private tvLog:Landroid/widget/TextView;

.field private tvTarget:Landroid/widget/TextView;

.field private final ui:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 32
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 36
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/licenseinjector/app/InjectActivity;->ui:Landroid/os/Handler;

    .line 42
    const-string v0, ""

    iput-object v0, p0, Lcom/licenseinjector/app/InjectActivity;->targetName:Ljava/lang/String;

    .line 54
    iput-object v0, p0, Lcom/licenseinjector/app/InjectActivity;->pendingKey:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/licenseinjector/app/InjectActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/licenseinjector/app/InjectActivity;
    .param p1, "x1"    # I

    .line 32
    invoke-direct {p0, p1}, Lcom/licenseinjector/app/InjectActivity;->pickFile(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/licenseinjector/app/InjectActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/licenseinjector/app/InjectActivity;

    .line 32
    invoke-direct {p0}, Lcom/licenseinjector/app/InjectActivity;->onInject()V

    return-void
.end method

.method static synthetic access$200(Lcom/licenseinjector/app/InjectActivity;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/licenseinjector/app/InjectActivity;

    .line 32
    iget-object v0, p0, Lcom/licenseinjector/app/InjectActivity;->tvLog:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$300(Lcom/licenseinjector/app/InjectActivity;Landroid/net/Uri;Ljava/io/File;)V
    .locals 0
    .param p0, "x0"    # Lcom/licenseinjector/app/InjectActivity;
    .param p1, "x1"    # Landroid/net/Uri;
    .param p2, "x2"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2}, Lcom/licenseinjector/app/InjectActivity;->copy(Landroid/net/Uri;Ljava/io/File;)V

    return-void
.end method

.method static synthetic access$400(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)[B
    .locals 1
    .param p0, "x0"    # Lcom/licenseinjector/app/InjectActivity;
    .param p1, "x1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1}, Lcom/licenseinjector/app/InjectActivity;->readAsset(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/licenseinjector/app/InjectActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/licenseinjector/app/InjectActivity;

    .line 32
    iget-object v0, p0, Lcom/licenseinjector/app/InjectActivity;->targetName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/licenseinjector/app/InjectActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .line 32
    invoke-direct {p0, p1}, Lcom/licenseinjector/app/InjectActivity;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/licenseinjector/app/InjectActivity;Ljava/io/File;Landroid/net/Uri;)V
    .locals 0
    .param p0, "x0"    # Lcom/licenseinjector/app/InjectActivity;
    .param p1, "x1"    # Ljava/io/File;
    .param p2, "x2"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 32
    invoke-direct {p0, p1, p2}, Lcom/licenseinjector/app/InjectActivity;->copyOut(Ljava/io/File;Landroid/net/Uri;)V

    return-void
.end method

.method static synthetic access$800(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/licenseinjector/app/InjectActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .line 32
    invoke-direct {p0, p1}, Lcom/licenseinjector/app/InjectActivity;->toast(Ljava/lang/String;)V

    return-void
.end method

.method private buildUi()V
    .locals 20

    .line 57
    move-object/from16 v0, p0

    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 58
    .local v1, "scroll":Landroid/widget/ScrollView;
    invoke-static {}, Lcom/licenseinjector/app/UiTheme;->pageGradient()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 59
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 60
    .local v2, "root":Landroid/widget/LinearLayout;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 61
    const/16 v4, 0x14

    invoke-direct {v0, v4}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v5

    .line 62
    .local v5, "p":I
    invoke-virtual {v2, v5, v5, v5, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 63
    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 65
    const-string v6, "\u5361\u5bc6\u6ce8\u5165\u5668"

    const/16 v7, 0x18

    const v8, -0xe0dcd0

    invoke-direct {v0, v6, v7, v8, v3}, Lcom/licenseinjector/app/InjectActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v6

    .line 66
    .local v6, "title":Landroid/widget/TextView;
    const/16 v7, 0x11

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 67
    invoke-static {v6}, Lcom/licenseinjector/app/UiTheme;->shimmerText(Landroid/widget/TextView;)V

    .line 68
    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 70
    const-string v9, "\u9009\u62e9\u76ee\u6807 APK\uff0c\u6ce8\u5165\u5361\u5bc6\u5f39\u7a97\u6a21\u5757\u5e76\u81ea\u52a8\u91cd\u7b7e\u540d\uff08payload v5\uff09"

    const/16 v10, 0xd

    const v11, -0x948d80

    const/4 v12, 0x0

    invoke-direct {v0, v9, v10, v11, v12}, Lcom/licenseinjector/app/InjectActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v9

    .line 71
    .local v9, "sub":Landroid/widget/TextView;
    invoke-virtual {v9, v7}, Landroid/widget/TextView;->setGravity(I)V

    .line 72
    const/4 v13, 0x6

    invoke-direct {v0, v13}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v13

    const/16 v14, 0x12

    invoke-direct {v0, v14}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v15

    invoke-virtual {v9, v12, v13, v12, v15}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 73
    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 75
    new-instance v13, Landroid/widget/Button;

    invoke-direct {v13, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 76
    .local v13, "pick":Landroid/widget/Button;
    const-string v15, "\u2460 \u9009\u62e9\u76ee\u6807 APK"

    invoke-virtual {v13, v15}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 77
    invoke-static {v13}, Lcom/licenseinjector/app/UiTheme;->styleButton(Landroid/widget/Button;)V

    .line 78
    new-instance v15, Lcom/licenseinjector/app/InjectActivity$1;

    invoke-direct {v15, v0}, Lcom/licenseinjector/app/InjectActivity$1;-><init>(Lcom/licenseinjector/app/InjectActivity;)V

    invoke-virtual {v13, v15}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    invoke-virtual {v2, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 86
    const-string v15, "\u672a\u9009\u62e9\u6587\u4ef6"

    invoke-direct {v0, v15, v10, v11, v12}, Lcom/licenseinjector/app/InjectActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v10

    iput-object v10, v0, Lcom/licenseinjector/app/InjectActivity;->tvTarget:Landroid/widget/TextView;

    .line 87
    const/4 v15, 0x4

    invoke-direct {v0, v15}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v7

    const/16 v4, 0xa

    invoke-direct {v0, v4}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v12

    invoke-direct {v0, v15}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v4

    invoke-direct {v0, v14}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v15

    invoke-virtual {v10, v7, v12, v4, v15}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 88
    iget-object v4, v0, Lcom/licenseinjector/app/InjectActivity;->tvTarget:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 90
    const-string v4, "\u5361\u5bc6\u5bc6\u94a5\uff08\u987b\u4e0e\u53d1\u5361\u5668\u4e00\u81f4\uff09"

    const v7, -0x9c990f

    invoke-direct {v0, v4, v7}, Lcom/licenseinjector/app/InjectActivity;->fieldLabel(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 91
    new-instance v4, Landroid/widget/EditText;

    invoke-direct {v4, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v4, v0, Lcom/licenseinjector/app/InjectActivity;->etKey:Landroid/widget/EditText;

    .line 92
    iget-object v10, v0, Lcom/licenseinjector/app/InjectActivity;->pendingKey:Ljava/lang/String;

    invoke-virtual {v4, v10}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 93
    iget-object v4, v0, Lcom/licenseinjector/app/InjectActivity;->etKey:Landroid/widget/EditText;

    const-string v10, "\u4f8b\u5982 ABCDEF012345"

    invoke-virtual {v4, v10}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 94
    iget-object v4, v0, Lcom/licenseinjector/app/InjectActivity;->etKey:Landroid/widget/EditText;

    invoke-virtual {v4, v8}, Landroid/widget/EditText;->setTextColor(I)V

    .line 95
    iget-object v4, v0, Lcom/licenseinjector/app/InjectActivity;->etKey:Landroid/widget/EditText;

    invoke-virtual {v4, v11}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 96
    iget-object v4, v0, Lcom/licenseinjector/app/InjectActivity;->etKey:Landroid/widget/EditText;

    const/4 v8, -0x1

    invoke-virtual {v4, v8}, Landroid/widget/EditText;->setBackgroundColor(I)V

    .line 97
    iget-object v4, v0, Lcom/licenseinjector/app/InjectActivity;->etKey:Landroid/widget/EditText;

    const/16 v10, 0xc

    invoke-direct {v0, v10}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v12

    invoke-direct {v0, v10}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v15

    invoke-direct {v0, v10}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v14

    invoke-direct {v0, v10}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v11

    invoke-virtual {v4, v12, v15, v14, v11}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 98
    iget-object v4, v0, Lcom/licenseinjector/app/InjectActivity;->etKey:Landroid/widget/EditText;

    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 99
    iget-object v4, v0, Lcom/licenseinjector/app/InjectActivity;->etKey:Landroid/widget/EditText;

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 101
    const-string v4, "\uff08\u987b\u4e0e\u300c\u5361\u5bc6\u751f\u6210\u300d\u91cc\u586b\u7684\u5171\u4eab\u5bc6\u94a5\u5b8c\u5168\u4e00\u81f4\uff0c\u5426\u5219\u751f\u6210\u7684\u5361\u5bc6\u5fc5\u65e0\u6548\uff09"

    const/16 v11, 0xb

    const v12, -0x13b767

    const/4 v14, 0x0

    invoke-direct {v0, v4, v11, v12, v14}, Lcom/licenseinjector/app/InjectActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v4

    .line 102
    .local v4, "keyHint":Landroid/widget/TextView;
    const/4 v11, 0x4

    invoke-direct {v0, v11}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v15

    invoke-direct {v0, v11}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v10

    invoke-virtual {v4, v14, v15, v14, v10}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 103
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 106
    const-string v10, "\u2462 \u672c\u673a\u8bbe\u5907\u7801\uff08\u81ea\u52a8\u8bc6\u522b\uff0c\u590d\u5236\u540e\u53bb\u300c\u5361\u5bc6\u751f\u6210\u300d\u7528\uff09"

    invoke-direct {v0, v10, v12}, Lcom/licenseinjector/app/InjectActivity;->fieldLabel(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v10

    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 107
    invoke-static/range {p0 .. p0}, Lcom/license/verify2/CryptoUtil;->generateAndroidDeviceCode(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    .line 108
    .local v10, "devCode":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_0

    const-string v11, "\u83b7\u53d6\u5931\u8d25"

    goto :goto_0

    :cond_0
    move-object v11, v10

    :goto_0
    const/16 v12, 0x14

    invoke-direct {v0, v11, v12, v7, v3}, Lcom/licenseinjector/app/InjectActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v7

    .line 109
    .local v7, "tvDev":Landroid/widget/TextView;
    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 110
    const/16 v11, 0x11

    invoke-virtual {v7, v11}, Landroid/widget/TextView;->setGravity(I)V

    .line 111
    const/16 v11, 0xc

    invoke-direct {v0, v11}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v12

    const/16 v14, 0x10

    invoke-direct {v0, v14}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v15

    invoke-direct {v0, v11}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v3

    invoke-direct {v0, v14}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v11

    invoke-virtual {v7, v12, v15, v3, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 112
    invoke-static {v7}, Lcom/licenseinjector/app/UiTheme;->shimmerText(Landroid/widget/TextView;)V

    .line 113
    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 115
    new-instance v3, Landroid/widget/Button;

    invoke-direct {v3, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 116
    .local v3, "copyDev":Landroid/widget/Button;
    const-string v11, "\u590d\u5236\u8bbe\u5907\u7801"

    invoke-virtual {v3, v11}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 117
    invoke-static {v3}, Lcom/licenseinjector/app/UiTheme;->styleButton(Landroid/widget/Button;)V

    .line 118
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x2

    invoke-direct {v11, v8, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 119
    .local v11, "cdlp":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v15, 0xa

    invoke-direct {v0, v15}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v14

    iput v14, v11, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 120
    invoke-virtual {v3, v11}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 121
    new-instance v14, Lcom/licenseinjector/app/InjectActivity$2;

    invoke-direct {v14, v0, v10}, Lcom/licenseinjector/app/InjectActivity$2;-><init>(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)V

    invoke-virtual {v3, v14}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 133
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 135
    const-string v14, "\u8bf4\u660e\uff1a\u8bbe\u5907\u7801\u7531\u672c\u673a android_id + \u673a\u578b\u6307\u7eb9\u751f\u6210\u3002\u82e5\u672c\u5de5\u5177\u7bb1\u4e0e\u6ce8\u5165\u540e\u7684 APK \u7528\u540c\u4e00\u7b7e\u540d\u5bc6\u94a5\uff08inject.p12\uff09\u6253\u5305\uff0c\u4e24\u8005\u663e\u793a\u7684\u8bbe\u5907\u7801\u4e00\u81f4\u3002"

    const/4 v8, 0x0

    const/16 v12, 0xc

    const v15, -0x948d80

    invoke-direct {v0, v14, v12, v15, v8}, Lcom/licenseinjector/app/InjectActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v14

    .line 137
    .local v14, "devHint":Landroid/widget/TextView;
    const/4 v8, 0x2

    invoke-direct {v0, v8}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v12

    const/16 v15, 0x8

    invoke-direct {v0, v15}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v15

    invoke-direct {v0, v8}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v8

    move-object/from16 v19, v3

    const/16 v3, 0xa

    .end local v3    # "copyDev":Landroid/widget/Button;
    .local v19, "copyDev":Landroid/widget/Button;
    invoke-direct {v0, v3}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v3

    invoke-virtual {v14, v12, v15, v8, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 138
    invoke-virtual {v2, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 140
    new-instance v3, Landroid/widget/Button;

    invoke-direct {v3, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 141
    .local v3, "go":Landroid/widget/Button;
    const-string v8, "\u2461 \u6ce8\u5165\u5e76\u4fdd\u5b58"

    invoke-virtual {v3, v8}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 142
    invoke-static {v3}, Lcom/licenseinjector/app/UiTheme;->styleButton(Landroid/widget/Button;)V

    .line 143
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x2

    const/4 v15, -0x1

    invoke-direct {v8, v15, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 144
    .local v8, "goLp":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v12, 0x12

    invoke-direct {v0, v12}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v12

    iput v12, v8, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 145
    invoke-virtual {v3, v8}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    new-instance v12, Lcom/licenseinjector/app/InjectActivity$3;

    invoke-direct {v12, v0}, Lcom/licenseinjector/app/InjectActivity$3;-><init>(Lcom/licenseinjector/app/InjectActivity;)V

    invoke-virtual {v3, v12}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 152
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 154
    const-string v12, ""

    move-object/from16 v17, v3

    move-object/from16 v18, v4

    const/4 v3, 0x0

    const/16 v4, 0xc

    const v15, -0x948d80

    .end local v3    # "go":Landroid/widget/Button;
    .end local v4    # "keyHint":Landroid/widget/TextView;
    .local v17, "go":Landroid/widget/Button;
    .local v18, "keyHint":Landroid/widget/TextView;
    invoke-direct {v0, v12, v4, v15, v3}, Lcom/licenseinjector/app/InjectActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v3

    iput-object v3, v0, Lcom/licenseinjector/app/InjectActivity;->tvLog:Landroid/widget/TextView;

    .line 155
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    .line 156
    iget-object v3, v0, Lcom/licenseinjector/app/InjectActivity;->tvLog:Landroid/widget/TextView;

    const/4 v4, 0x4

    invoke-direct {v0, v4}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v12

    const/16 v15, 0x10

    invoke-direct {v0, v15}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v15

    move/from16 v16, v5

    .end local v5    # "p":I
    .local v16, "p":I
    invoke-direct {v0, v4}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v5

    invoke-direct {v0, v4}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v4

    invoke-virtual {v3, v12, v15, v5, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 157
    iget-object v3, v0, Lcom/licenseinjector/app/InjectActivity;->tvLog:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 159
    invoke-virtual {v0, v1}, Lcom/licenseinjector/app/InjectActivity;->setContentView(Landroid/view/View;)V

    .line 160
    return-void
.end method

.method private copy(Landroid/net/Uri;Ljava/io/File;)V
    .locals 5
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "dst"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 345
    invoke-virtual {p0}, Lcom/licenseinjector/app/InjectActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v0

    .line 346
    .local v0, "in":Ljava/io/InputStream;
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 347
    .local v1, "fos":Ljava/io/FileOutputStream;
    const/high16 v2, 0x10000

    new-array v2, v2, [B

    .line 349
    .local v2, "b":[B
    :goto_0
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    move v4, v3

    .local v4, "n":I
    if-lez v3, :cond_0

    .line 350
    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    .line 352
    :cond_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 353
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 354
    return-void
.end method

.method private copyOut(Ljava/io/File;Landroid/net/Uri;)V
    .locals 5
    .param p1, "src"    # Ljava/io/File;
    .param p2, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 357
    invoke-virtual {p0}, Lcom/licenseinjector/app/InjectActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "wt"

    invoke-virtual {v0, p2, v1}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;Ljava/lang/String;)Ljava/io/OutputStream;

    move-result-object v0

    .line 358
    .local v0, "os":Ljava/io/OutputStream;
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 359
    .local v1, "in":Ljava/io/InputStream;
    const/high16 v2, 0x10000

    new-array v2, v2, [B

    .line 361
    .local v2, "b":[B
    :goto_0
    invoke-virtual {v1, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    move v4, v3

    .local v4, "n":I
    if-lez v3, :cond_0

    .line 362
    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v4}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 364
    :cond_0
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 365
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 366
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 367
    return-void
.end method

.method private dp(I)I
    .locals 2
    .param p1, "i"    # I

    .line 183
    int-to-float v0, p1

    invoke-virtual {p0}, Lcom/licenseinjector/app/InjectActivity;->getResources()Landroid/content/res/Resources;

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

    .line 163
    const/16 v0, 0xd

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, p2, v1}, Lcom/licenseinjector/app/InjectActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    .line 164
    .local v0, "t":Landroid/widget/TextView;
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 165
    .local v1, "lp":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v2, 0xe

    invoke-direct {p0, v2}, Lcom/licenseinjector/app/InjectActivity;->dp(I)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 166
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 167
    invoke-static {v0}, Lcom/licenseinjector/app/UiTheme;->shimmerText(Landroid/widget/TextView;)V

    .line 168
    return-object v0
.end method

.method private log(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 291
    iget-object v0, p0, Lcom/licenseinjector/app/InjectActivity;->ui:Landroid/os/Handler;

    new-instance v1, Lcom/licenseinjector/app/InjectActivity$4;

    invoke-direct {v1, p0, p1}, Lcom/licenseinjector/app/InjectActivity$4;-><init>(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 297
    return-void
.end method

.method private onInject()V
    .locals 2

    .line 196
    iget-object v0, p0, Lcom/licenseinjector/app/InjectActivity;->targetUri:Landroid/net/Uri;

    if-nez v0, :cond_0

    .line 197
    const-string v0, "\u8bf7\u5148\u9009\u62e9\u76ee\u6807 APK"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 198
    return-void

    .line 200
    :cond_0
    invoke-direct {p0}, Lcom/licenseinjector/app/InjectActivity;->tryCreateSibling()Landroid/net/Uri;

    move-result-object v0

    .line 201
    .local v0, "sibling":Landroid/net/Uri;
    if-eqz v0, :cond_1

    .line 202
    iput-object v0, p0, Lcom/licenseinjector/app/InjectActivity;->outUri:Landroid/net/Uri;

    .line 203
    invoke-direct {p0}, Lcom/licenseinjector/app/InjectActivity;->startInject()V

    goto :goto_0

    .line 205
    :cond_1
    invoke-direct {p0}, Lcom/licenseinjector/app/InjectActivity;->pickOutFile()V

    .line 207
    :goto_0
    return-void
.end method

.method private parentOf(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 5
    .param p1, "docUri"    # Landroid/net/Uri;

    .line 225
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 226
    .local v1, "docId":Ljava/lang/String;
    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 227
    .local v2, "slash":I
    if-gtz v2, :cond_0

    .line 228
    return-object v0

    .line 230
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 231
    .local v3, "pid":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v3}, Landroid/provider/DocumentsContract;->buildDocumentUri(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    .line 232
    .end local v1    # "docId":Ljava/lang/String;
    .end local v2    # "slash":I
    .end local v3    # "pid":Ljava/lang/String;
    :catchall_0
    move-exception v1

    .line 233
    .local v1, "t":Ljava/lang/Throwable;
    return-object v0
.end method

.method private pickFile(I)V
    .locals 4
    .param p1, "req"    # I

    .line 187
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 188
    .local v0, "it":Landroid/content/Intent;
    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 189
    const-string v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 190
    const-string v2, "application/vnd.android.package-archive"

    const-string v3, "application/octet-stream"

    filled-new-array {v2, v3, v1}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.intent.extra.MIME_TYPES"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 192
    invoke-virtual {p0, v0, p1}, Lcom/licenseinjector/app/InjectActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 193
    return-void
.end method

.method private pickOutFile()V
    .locals 4

    .line 238
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CREATE_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 239
    .local v0, "it":Landroid/content/Intent;
    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 240
    const-string v1, "application/vnd.android.package-archive"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 241
    iget-object v1, p0, Lcom/licenseinjector/app/InjectActivity;->targetName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "injected.apk"

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/licenseinjector/app/InjectActivity;->targetName:Ljava/lang/String;

    invoke-static {v2}, Lcom/licenseinjector/app/InjectActivity;->stripExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "_injected.apk"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 242
    .local v1, "base":Ljava/lang/String;
    :goto_0
    const-string v2, "android.intent.extra.TITLE"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 243
    iget-object v2, p0, Lcom/licenseinjector/app/InjectActivity;->targetUri:Landroid/net/Uri;

    invoke-direct {p0, v2}, Lcom/licenseinjector/app/InjectActivity;->parentOf(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v2

    .line 244
    .local v2, "parent":Landroid/net/Uri;
    if-eqz v2, :cond_1

    .line 245
    const-string v3, "android.provider.extra.INITIAL_URI"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 247
    :cond_1
    const/16 v3, 0x3ea

    invoke-virtual {p0, v0, v3}, Lcom/licenseinjector/app/InjectActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 248
    return-void
.end method

.method private queryName(Landroid/net/Uri;)Ljava/lang/String;
    .locals 7
    .param p1, "uri"    # Landroid/net/Uri;

    .line 272
    const/4 v0, 0x0

    .line 274
    .local v0, "c":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/licenseinjector/app/InjectActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    move-object v0, v1

    .line 275
    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 276
    const-string v1, "_display_name"

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    .line 277
    .local v1, "idx":I
    if-ltz v1, :cond_1

    .line 278
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 283
    if-eqz v0, :cond_0

    .line 284
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 278
    :cond_0
    return-object v2

    .line 283
    .end local v1    # "idx":I
    :cond_1
    if-eqz v0, :cond_3

    .line 284
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 283
    :catchall_0
    move-exception v1

    if-eqz v0, :cond_2

    .line 284
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 286
    :cond_2
    throw v1

    .line 281
    :catch_0
    move-exception v1

    .line 283
    if-eqz v0, :cond_3

    .line 284
    goto :goto_0

    .line 287
    :cond_3
    :goto_1
    const-string v1, "target.apk"

    return-object v1
.end method

.method private readAsset(Ljava/lang/String;)[B
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 370
    invoke-virtual {p0}, Lcom/licenseinjector/app/InjectActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 371
    .local v0, "in":Ljava/io/InputStream;
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 372
    .local v1, "bo":Ljava/io/ByteArrayOutputStream;
    const/16 v2, 0x2000

    new-array v2, v2, [B

    .line 374
    .local v2, "b":[B
    :goto_0
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    move v4, v3

    .local v4, "n":I
    if-lez v3, :cond_0

    .line 375
    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 377
    :cond_0
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 378
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3
.end method

.method private startInject()V
    .locals 5

    .line 300
    iget-object v0, p0, Lcom/licenseinjector/app/InjectActivity;->etKey:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 301
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Lcom/licenseinjector/app/InjectActivity;->targetUri:Landroid/net/Uri;

    .line 302
    .local v1, "in":Landroid/net/Uri;
    iget-object v2, p0, Lcom/licenseinjector/app/InjectActivity;->outUri:Landroid/net/Uri;

    .line 303
    .local v2, "out":Landroid/net/Uri;
    iget-object v3, p0, Lcom/licenseinjector/app/InjectActivity;->tvLog:Landroid/widget/TextView;

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 304
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/licenseinjector/app/InjectActivity$5;

    invoke-direct {v4, p0, v1, v0, v2}, Lcom/licenseinjector/app/InjectActivity$5;-><init>(Lcom/licenseinjector/app/InjectActivity;Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 332
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 333
    return-void
.end method

.method private static stripExt(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "n"    # Ljava/lang/String;

    .line 251
    const/16 v0, 0x2e

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 252
    .local v0, "i":I
    if-lez v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, p0

    :goto_0
    return-object v1
.end method

.method private toast(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 336
    iget-object v0, p0, Lcom/licenseinjector/app/InjectActivity;->ui:Landroid/os/Handler;

    new-instance v1, Lcom/licenseinjector/app/InjectActivity$6;

    invoke-direct {v1, p0, p1}, Lcom/licenseinjector/app/InjectActivity$6;-><init>(Lcom/licenseinjector/app/InjectActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 342
    return-void
.end method

.method private tryCreateSibling()Landroid/net/Uri;
    .locals 5

    .line 210
    iget-object v0, p0, Lcom/licenseinjector/app/InjectActivity;->targetUri:Landroid/net/Uri;

    invoke-direct {p0, v0}, Lcom/licenseinjector/app/InjectActivity;->parentOf(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v0

    .line 211
    .local v0, "parent":Landroid/net/Uri;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 212
    return-object v1

    .line 215
    :cond_0
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/licenseinjector/app/InjectActivity;->targetName:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "app"

    goto :goto_0

    :cond_1
    iget-object v3, p0, Lcom/licenseinjector/app/InjectActivity;->targetName:Ljava/lang/String;

    invoke-static {v3}, Lcom/licenseinjector/app/InjectActivity;->stripExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_0
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_injected.apk"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 216
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/licenseinjector/app/InjectActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "application/vnd.android.package-archive"

    invoke-static {v3, v0, v4, v2}, Landroid/provider/DocumentsContract;->createDocument(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v1

    .line 218
    .end local v2    # "name":Ljava/lang/String;
    :catchall_0
    move-exception v2

    .line 219
    .local v2, "t":Ljava/lang/Throwable;
    return-object v1
.end method

.method private tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;
    .locals 3
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "size"    # I
    .param p3, "color"    # I
    .param p4, "bold"    # Z

    .line 172
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 173
    .local v0, "t":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    int-to-float v1, p2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 175
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 176
    if-eqz p4, :cond_0

    .line 177
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 179
    :cond_0
    return-object v0
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "req"    # I
    .param p2, "result"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .line 257
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 258
    const/4 v0, -0x1

    if-ne p2, v0, :cond_3

    if-eqz p3, :cond_3

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 261
    :cond_0
    const/16 v0, 0x3e9

    if-ne p1, v0, :cond_1

    .line 262
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/licenseinjector/app/InjectActivity;->targetUri:Landroid/net/Uri;

    .line 263
    invoke-direct {p0, v0}, Lcom/licenseinjector/app/InjectActivity;->queryName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/licenseinjector/app/InjectActivity;->targetName:Ljava/lang/String;

    .line 264
    iget-object v0, p0, Lcom/licenseinjector/app/InjectActivity;->tvTarget:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5df2\u9009\u62e9: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/licenseinjector/app/InjectActivity;->targetName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 265
    :cond_1
    const/16 v0, 0x3ea

    if-ne p1, v0, :cond_2

    .line 266
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/licenseinjector/app/InjectActivity;->outUri:Landroid/net/Uri;

    .line 267
    invoke-direct {p0}, Lcom/licenseinjector/app/InjectActivity;->startInject()V

    .line 269
    :cond_2
    :goto_0
    return-void

    .line 259
    :cond_3
    :goto_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "bundle"    # Landroid/os/Bundle;

    .line 46
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 47
    invoke-virtual {p0}, Lcom/licenseinjector/app/InjectActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 48
    invoke-virtual {p0}, Lcom/licenseinjector/app/InjectActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "key"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, "k":Ljava/lang/String;
    if-eqz v0, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    iput-object v1, p0, Lcom/licenseinjector/app/InjectActivity;->pendingKey:Ljava/lang/String;

    .line 51
    .end local v0    # "k":Ljava/lang/String;
    :cond_1
    invoke-direct {p0}, Lcom/licenseinjector/app/InjectActivity;->buildUi()V

    .line 52
    return-void
.end method
