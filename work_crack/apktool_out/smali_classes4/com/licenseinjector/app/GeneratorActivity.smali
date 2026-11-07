.class public Lcom/licenseinjector/app/GeneratorActivity;
.super Landroid/app/Activity;
.source "GeneratorActivity.java"


# instance fields
.field private etCount:Landroid/widget/EditText;

.field private etDev:Landroid/widget/EditText;

.field private etKey:Landroid/widget/EditText;

.field private pendingKey:Ljava/lang/String;

.field private spFmt:Landroid/widget/Spinner;

.field private spLen:Landroid/widget/Spinner;

.field private spType:Landroid/widget/Spinner;

.field private tvCap:Landroid/widget/TextView;

.field private tvOut:Landroid/widget/TextView;

.field private final ui:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 24
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 25
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/licenseinjector/app/GeneratorActivity;->ui:Landroid/os/Handler;

    .line 40
    const-string v0, ""

    iput-object v0, p0, Lcom/licenseinjector/app/GeneratorActivity;->pendingKey:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/licenseinjector/app/GeneratorActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/licenseinjector/app/GeneratorActivity;

    .line 24
    invoke-direct {p0}, Lcom/licenseinjector/app/GeneratorActivity;->updateCap()V

    return-void
.end method

.method private buildUi()V
    .locals 20

    .line 43
    move-object/from16 v0, p0

    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 44
    .local v1, "scroll":Landroid/widget/ScrollView;
    invoke-static {}, Lcom/licenseinjector/app/UiTheme;->pageGradient()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 45
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 46
    .local v2, "root":Landroid/widget/LinearLayout;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 47
    const/16 v4, 0x14

    invoke-direct {v0, v4}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v4

    .line 48
    .local v4, "p":I
    invoke-virtual {v2, v4, v4, v4, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 49
    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 51
    const-string v5, "\u5361\u5bc6\u751f\u6210\u5668"

    const/16 v6, 0x18

    const v7, -0xe0dcd0

    invoke-direct {v0, v5, v6, v7, v3}, Lcom/licenseinjector/app/GeneratorActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v5

    .line 52
    .local v5, "title":Landroid/widget/TextView;
    const/16 v6, 0x11

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 53
    invoke-static {v5}, Lcom/licenseinjector/app/UiTheme;->shimmerText(Landroid/widget/TextView;)V

    .line 54
    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 56
    const-string v8, "\u8f93\u5165\u8bbe\u5907\u7801\uff08\u4e0e\u7aef\u4e0a\u9a8c\u8bc1\u9875\u4e00\u81f4\uff09\u4e0e\u5bc6\u94a5\uff0c\u751f\u6210\u5361\u5bc6"

    const/16 v9, 0xd

    const v10, -0x948d80

    const/4 v11, 0x0

    invoke-direct {v0, v8, v9, v10, v11}, Lcom/licenseinjector/app/GeneratorActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v8

    .line 57
    .local v8, "sub":Landroid/widget/TextView;
    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 58
    const/4 v6, 0x6

    invoke-direct {v0, v6}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v9

    const/16 v12, 0x12

    invoke-direct {v0, v12}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v13

    invoke-virtual {v8, v11, v9, v11, v13}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 59
    invoke-virtual {v2, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 61
    const-string v9, "\u5171\u4eab\u5bc6\u94a5\uff08\u987b\u4e0e\u6ce8\u5165\u65f6\u4e00\u81f4\uff09"

    const v13, -0x9c990f

    invoke-direct {v0, v9, v13}, Lcom/licenseinjector/app/GeneratorActivity;->fieldLabel(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v9

    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 62
    iget-object v9, v0, Lcom/licenseinjector/app/GeneratorActivity;->pendingKey:Ljava/lang/String;

    const-string v14, "\u4f8b\u5982 ABCDEF012345"

    invoke-direct {v0, v9, v14}, Lcom/licenseinjector/app/GeneratorActivity;->editText(Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v9

    iput-object v9, v0, Lcom/licenseinjector/app/GeneratorActivity;->etKey:Landroid/widget/EditText;

    .line 63
    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 65
    const-string v9, "\u8bbe\u5907\u7801\uff0816 \u4f4d\u5927\u5199\u5b57\u6bcd+\u6570\u5b57\uff09"

    invoke-direct {v0, v9, v13}, Lcom/licenseinjector/app/GeneratorActivity;->fieldLabel(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v9

    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 66
    const-string v9, "\u7aef\u4e0a\u9a8c\u8bc1\u9875\u663e\u793a\u7684 16 \u4f4d\u8bbe\u5907\u7801"

    const-string v14, ""

    invoke-direct {v0, v14, v9}, Lcom/licenseinjector/app/GeneratorActivity;->editText(Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v9

    iput-object v9, v0, Lcom/licenseinjector/app/GeneratorActivity;->etDev:Landroid/widget/EditText;

    .line 67
    invoke-virtual {v9, v3}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 68
    iget-object v9, v0, Lcom/licenseinjector/app/GeneratorActivity;->etDev:Landroid/widget/EditText;

    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 70
    const-string v9, "\u8bf4\u660e\uff1a\u8bbe\u5907\u7801\u6765\u81ea\u7aef\u4e0a\u9a8c\u8bc1\u9875\u663e\u793a\u7684 16 \u4f4d\u7801\uff0c\u4ec5\u5728\u300c\u751f\u6210\u5361\u5bc6\u300d\u65f6\u9700\u8981\uff1b\u82e5\u53ea\u662f\u5148\u6765\u8bbe\u5171\u4eab\u5bc6\u94a5\uff08\u9996\u6b21\u6ce8\u5165\u7528\uff09\uff0c\u8bbe\u5907\u7801\u53ef\u7559\u7a7a\u3001\u4e0d\u7528\u70b9\u751f\u6210\u3002"

    const/16 v15, 0xb

    invoke-direct {v0, v9, v15, v10, v11}, Lcom/licenseinjector/app/GeneratorActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v9

    .line 72
    .local v9, "devHint":Landroid/widget/TextView;
    const/4 v15, 0x4

    invoke-direct {v0, v15}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v15

    invoke-direct {v0, v6}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v6

    invoke-virtual {v9, v11, v15, v11, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 73
    invoke-virtual {v2, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 75
    const-string v6, "\u5361\u7c7b\u578b"

    const v15, -0x74a30a

    invoke-direct {v0, v6, v15}, Lcom/licenseinjector/app/GeneratorActivity;->fieldLabel(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 76
    new-instance v6, Landroid/widget/Spinner;

    invoke-direct {v6, v0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    iput-object v6, v0, Lcom/licenseinjector/app/GeneratorActivity;->spType:Landroid/widget/Spinner;

    .line 77
    const/16 v6, 0xa

    new-array v7, v6, [Ljava/lang/String;

    .line 78
    .local v7, "types":[Ljava/lang/String;
    const/4 v6, 0x2

    .line 79
    .local v6, "sel":I
    invoke-static {}, Lcom/license/verify2/CardType;->values()[Lcom/license/verify2/CardType;

    move-result-object v13

    array-length v12, v13

    move v10, v11

    :goto_0
    if-ge v10, v12, :cond_0

    aget-object v18, v13, v10

    .line 80
    .local v18, "t":Lcom/license/verify2/CardType;
    invoke-virtual/range {v18 .. v18}, Lcom/license/verify2/CardType;->getCode()I

    move-result v19

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v18 .. v18}, Lcom/license/verify2/CardType;->getCode()I

    move-result v11

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v11, " - "

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {v18 .. v18}, Lcom/license/verify2/CardType;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v7, v19

    .line 79
    .end local v18    # "t":Lcom/license/verify2/CardType;
    add-int/lit8 v10, v10, 0x1

    const/4 v3, 0x1

    const/4 v11, 0x0

    goto :goto_0

    .line 82
    :cond_0
    new-instance v3, Landroid/widget/ArrayAdapter;

    const v10, 0x1090008

    invoke-direct {v3, v0, v10, v7}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 83
    .local v3, "ta":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    const v10, 0x1090009

    invoke-virtual {v3, v10}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 84
    iget-object v10, v0, Lcom/licenseinjector/app/GeneratorActivity;->spType:Landroid/widget/Spinner;

    invoke-virtual {v10, v3}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 85
    iget-object v10, v0, Lcom/licenseinjector/app/GeneratorActivity;->spType:Landroid/widget/Spinner;

    invoke-virtual {v10, v6}, Landroid/widget/Spinner;->setSelection(I)V

    .line 86
    iget-object v10, v0, Lcom/licenseinjector/app/GeneratorActivity;->spType:Landroid/widget/Spinner;

    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 88
    const-string v10, "\u5b57\u7b26\u96c6"

    invoke-direct {v0, v10, v15}, Lcom/licenseinjector/app/GeneratorActivity;->fieldLabel(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v10

    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 89
    const-string v10, "\u7eaf\u6570\u5b57"

    const-string v11, "\u5927\u5199\u5b57\u6bcd+\u6570\u5b57"

    filled-new-array {v10, v11}, [Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-direct {v0, v10, v11}, Lcom/licenseinjector/app/GeneratorActivity;->spinner([Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object v10

    iput-object v10, v0, Lcom/licenseinjector/app/GeneratorActivity;->spFmt:Landroid/widget/Spinner;

    .line 90
    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 92
    const-string v10, "\u957f\u5ea6"

    invoke-direct {v0, v10, v15}, Lcom/licenseinjector/app/GeneratorActivity;->fieldLabel(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v10

    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 93
    const-string v10, "16\u4f4d"

    const-string v11, "32\u4f4d"

    const-string v12, "10\u4f4d"

    filled-new-array {v12, v10, v11}, [Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x1

    invoke-direct {v0, v10, v11}, Lcom/licenseinjector/app/GeneratorActivity;->spinner([Ljava/lang/String;I)Landroid/widget/Spinner;

    move-result-object v10

    iput-object v10, v0, Lcom/licenseinjector/app/GeneratorActivity;->spLen:Landroid/widget/Spinner;

    .line 94
    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 96
    const-string v10, "\u6570\u91cf\uff08\u6279\u91cf\u751f\u6210\uff0c\u81ea\u52a8\u53bb\u91cd\uff09"

    const v11, -0x13b767

    invoke-direct {v0, v10, v11}, Lcom/licenseinjector/app/GeneratorActivity;->fieldLabel(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v10

    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 97
    const-string v10, "1"

    invoke-direct {v0, v10, v10}, Lcom/licenseinjector/app/GeneratorActivity;->editText(Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;

    move-result-object v10

    iput-object v10, v0, Lcom/licenseinjector/app/GeneratorActivity;->etCount:Landroid/widget/EditText;

    .line 98
    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 99
    iget-object v10, v0, Lcom/licenseinjector/app/GeneratorActivity;->etCount:Landroid/widget/EditText;

    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 101
    const/16 v10, 0xc

    const v11, -0x948d80

    const/4 v12, 0x0

    invoke-direct {v0, v14, v10, v11, v12}, Lcom/licenseinjector/app/GeneratorActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v11

    iput-object v11, v0, Lcom/licenseinjector/app/GeneratorActivity;->tvCap:Landroid/widget/TextView;

    .line 102
    invoke-virtual {v2, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 103
    invoke-direct/range {p0 .. p0}, Lcom/licenseinjector/app/GeneratorActivity;->updateCap()V

    .line 105
    new-instance v11, Lcom/licenseinjector/app/GeneratorActivity$1;

    invoke-direct {v11, v0}, Lcom/licenseinjector/app/GeneratorActivity$1;-><init>(Lcom/licenseinjector/app/GeneratorActivity;)V

    .line 109
    .local v11, "capListener":Landroid/widget/AdapterView$OnItemSelectedListener;
    iget-object v12, v0, Lcom/licenseinjector/app/GeneratorActivity;->spFmt:Landroid/widget/Spinner;

    invoke-virtual {v12, v11}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 110
    iget-object v12, v0, Lcom/licenseinjector/app/GeneratorActivity;->spLen:Landroid/widget/Spinner;

    invoke-virtual {v12, v11}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 112
    new-instance v12, Landroid/widget/Button;

    invoke-direct {v12, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 113
    .local v12, "gen":Landroid/widget/Button;
    const-string v13, "\u751f\u6210\u5361\u5bc6"

    invoke-virtual {v12, v13}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 114
    invoke-static {v12}, Lcom/licenseinjector/app/UiTheme;->styleButton(Landroid/widget/Button;)V

    .line 115
    new-instance v13, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v15, -0x1

    const/4 v10, -0x2

    invoke-direct {v13, v15, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 116
    .local v13, "glp":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v10, 0x12

    invoke-direct {v0, v10}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v10

    iput v10, v13, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 117
    invoke-virtual {v12, v13}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 118
    new-instance v10, Lcom/licenseinjector/app/GeneratorActivity$$ExternalSyntheticLambda1;

    invoke-direct {v10, v0}, Lcom/licenseinjector/app/GeneratorActivity$$ExternalSyntheticLambda1;-><init>(Lcom/licenseinjector/app/GeneratorActivity;)V

    invoke-virtual {v12, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 119
    invoke-virtual {v2, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 121
    const-string v10, "\u751f\u6210\u7ed3\u679c\uff08\u6bcf\u884c\u4e00\u5f20\uff0c\u53ef\u590d\u5236\uff09"

    const v15, -0x9c990f

    invoke-direct {v0, v10, v15}, Lcom/licenseinjector/app/GeneratorActivity;->fieldLabel(Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v10

    invoke-virtual {v2, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 122
    const/16 v10, 0xe

    move-object/from16 v16, v3

    const/4 v3, 0x0

    const v15, -0xe0dcd0

    .end local v3    # "ta":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    .local v16, "ta":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    invoke-direct {v0, v14, v10, v15, v3}, Lcom/licenseinjector/app/GeneratorActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v3

    iput-object v3, v0, Lcom/licenseinjector/app/GeneratorActivity;->tvOut:Landroid/widget/TextView;

    .line 123
    const/4 v10, 0x1

    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    .line 124
    iget-object v3, v0, Lcom/licenseinjector/app/GeneratorActivity;->tvOut:Landroid/widget/TextView;

    const/4 v10, -0x1

    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 125
    iget-object v3, v0, Lcom/licenseinjector/app/GeneratorActivity;->tvOut:Landroid/widget/TextView;

    const/16 v10, 0xc

    invoke-direct {v0, v10}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v14

    invoke-direct {v0, v10}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v15

    move/from16 v17, v4

    .end local v4    # "p":I
    .local v17, "p":I
    invoke-direct {v0, v10}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v4

    invoke-direct {v0, v10}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v10

    invoke-virtual {v3, v14, v15, v4, v10}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 126
    iget-object v3, v0, Lcom/licenseinjector/app/GeneratorActivity;->tvOut:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 128
    new-instance v3, Landroid/widget/Button;

    invoke-direct {v3, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 129
    .local v3, "copy":Landroid/widget/Button;
    const-string v4, "\u590d\u5236\u5168\u90e8"

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 130
    invoke-static {v3}, Lcom/licenseinjector/app/UiTheme;->styleButton(Landroid/widget/Button;)V

    .line 131
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v10, -0x2

    const/4 v14, -0x1

    invoke-direct {v4, v14, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 132
    .local v4, "clp":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v10, 0xa

    invoke-direct {v0, v10}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v10

    iput v10, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 133
    invoke-virtual {v3, v4}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 134
    new-instance v10, Lcom/licenseinjector/app/GeneratorActivity$$ExternalSyntheticLambda2;

    invoke-direct {v10, v0}, Lcom/licenseinjector/app/GeneratorActivity$$ExternalSyntheticLambda2;-><init>(Lcom/licenseinjector/app/GeneratorActivity;)V

    invoke-virtual {v3, v10}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 139
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 141
    invoke-virtual {v0, v1}, Lcom/licenseinjector/app/GeneratorActivity;->setContentView(Landroid/view/View;)V

    .line 142
    return-void
.end method

.method private dp(I)I
    .locals 2
    .param p1, "i"    # I

    .line 220
    int-to-float v0, p1

    invoke-virtual {p0}, Lcom/licenseinjector/app/GeneratorActivity;->getResources()Landroid/content/res/Resources;

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

.method private editText(Ljava/lang/String;Ljava/lang/String;)Landroid/widget/EditText;
    .locals 5
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "hint"    # Ljava/lang/String;

    .line 191
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 192
    .local v0, "e":Landroid/widget/EditText;
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 193
    invoke-virtual {v0, p2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 194
    const v1, -0xe0dcd0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setTextColor(I)V

    .line 195
    const v1, -0x948d80

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 196
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundColor(I)V

    .line 197
    const/16 v1, 0xc

    invoke-direct {p0, v1}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v1}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v1}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v4

    invoke-direct {p0, v1}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v1

    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 198
    return-object v0
.end method

.method private fieldLabel(Ljava/lang/String;I)Landroid/widget/TextView;
    .locals 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "color"    # I

    .line 182
    const/16 v0, 0xd

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, p2, v1}, Lcom/licenseinjector/app/GeneratorActivity;->tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;

    move-result-object v0

    .line 183
    .local v0, "t":Landroid/widget/TextView;
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 184
    .local v1, "lp":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v2, 0xe

    invoke-direct {p0, v2}, Lcom/licenseinjector/app/GeneratorActivity;->dp(I)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 185
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 186
    invoke-static {v0}, Lcom/licenseinjector/app/UiTheme;->shimmerText(Landroid/widget/TextView;)V

    .line 187
    return-object v0
.end method

.method private onGenerate()V
    .locals 13

    .line 153
    iget-object v0, p0, Lcom/licenseinjector/app/GeneratorActivity;->etKey:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 154
    .local v0, "key":Ljava/lang/String;
    iget-object v1, p0, Lcom/licenseinjector/app/GeneratorActivity;->etDev:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v7

    .line 155
    .local v7, "dev":Ljava/lang/String;
    iget-object v1, p0, Lcom/licenseinjector/app/GeneratorActivity;->spType:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, " - "

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v8, 0x0

    aget-object v1, v1, v8

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .line 156
    .local v9, "code":I
    iget-object v1, p0, Lcom/licenseinjector/app/GeneratorActivity;->spFmt:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/licenseinjector/app/Generator$Format;->DIGIT:Lcom/licenseinjector/app/Generator$Format;

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/licenseinjector/app/Generator$Format;->ALPHA:Lcom/licenseinjector/app/Generator$Format;

    :goto_0
    move-object v10, v1

    .line 157
    .local v10, "f":Lcom/licenseinjector/app/Generator$Format;
    iget-object v1, p0, Lcom/licenseinjector/app/GeneratorActivity;->spLen:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    const/4 v2, 0x1

    if-nez v1, :cond_1

    sget-object v1, Lcom/licenseinjector/app/Generator$Length;->L10:Lcom/licenseinjector/app/Generator$Length;

    goto :goto_1

    .line 158
    :cond_1
    iget-object v1, p0, Lcom/licenseinjector/app/GeneratorActivity;->spLen:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    if-ne v1, v2, :cond_2

    sget-object v1, Lcom/licenseinjector/app/Generator$Length;->L16:Lcom/licenseinjector/app/Generator$Length;

    goto :goto_1

    :cond_2
    sget-object v1, Lcom/licenseinjector/app/Generator$Length;->L32:Lcom/licenseinjector/app/Generator$Length;

    :goto_1
    move-object v11, v1

    .line 159
    .local v11, "l":Lcom/licenseinjector/app/Generator$Length;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "\u8bf7\u586b\u5199\u5171\u4eab\u5bc6\u94a5"

    invoke-direct {p0, v1}, Lcom/licenseinjector/app/GeneratorActivity;->toast(Ljava/lang/String;)V

    return-void

    .line 160
    :cond_3
    invoke-static {v7}, Lcom/licenseinjector/app/Generator;->isValidDeviceCode(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "\u8bbe\u5907\u7801\u987b\u4e3a 16 \u4f4d\u5927\u5199\u5b57\u6bcd+\u6570\u5b57"

    invoke-direct {p0, v1}, Lcom/licenseinjector/app/GeneratorActivity;->toast(Ljava/lang/String;)V

    return-void

    .line 161
    :cond_4
    const/4 v1, 0x1

    .line 162
    .local v1, "n":I
    :try_start_0
    iget-object v3, p0, Lcom/licenseinjector/app/GeneratorActivity;->etCount:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v1, v3

    goto :goto_2

    :catch_0
    move-exception v3

    .line 163
    :goto_2
    if-ge v1, v2, :cond_5

    const/4 v1, 0x1

    :cond_5
    move v12, v1

    .line 167
    .end local v1    # "n":I
    .local v12, "n":I
    if-ne v12, v2, :cond_6

    :try_start_1
    new-array v1, v2, [Ljava/lang/String;

    invoke-static {v0, v7, v9, v10, v11}, Lcom/licenseinjector/app/Generator;->generate(Ljava/lang/String;Ljava/lang/String;ILcom/licenseinjector/app/Generator$Format;Lcom/licenseinjector/app/Generator$Length;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v8

    .local v1, "cards":[Ljava/lang/String;
    goto :goto_3

    .line 168
    .end local v1    # "cards":[Ljava/lang/String;
    :cond_6
    move-object v1, v0

    move-object v2, v7

    move v3, v9

    move-object v4, v10

    move-object v5, v11

    move v6, v12

    invoke-static/range {v1 .. v6}, Lcom/licenseinjector/app/Generator;->generateBatch(Ljava/lang/String;Ljava/lang/String;ILcom/licenseinjector/app/Generator$Format;Lcom/licenseinjector/app/Generator$Length;I)[Ljava/lang/String;

    move-result-object v1

    .line 169
    .restart local v1    # "cards":[Ljava/lang/String;
    :goto_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 170
    .local v2, "sb":Ljava/lang/StringBuilder;
    array-length v3, v1

    :goto_4
    if-ge v8, v3, :cond_7

    aget-object v4, v1, v8

    .local v4, "c":Ljava/lang/String;
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .end local v4    # "c":Ljava/lang/String;
    add-int/lit8 v8, v8, 0x1

    goto :goto_4

    .line 171
    :cond_7
    iget-object v3, p0, Lcom/licenseinjector/app/GeneratorActivity;->tvOut:Landroid/widget/TextView;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 174
    .end local v1    # "cards":[Ljava/lang/String;
    .end local v2    # "sb":Ljava/lang/StringBuilder;
    goto :goto_5

    .line 172
    :catch_1
    move-exception v1

    .line 173
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u751f\u6210\u5931\u8d25: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/licenseinjector/app/GeneratorActivity;->toast(Ljava/lang/String;)V

    .line 175
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_5
    return-void
.end method

.method private spinner([Ljava/lang/String;I)Landroid/widget/Spinner;
    .locals 3
    .param p1, "items"    # [Ljava/lang/String;
    .param p2, "sel"    # I

    .line 202
    new-instance v0, Landroid/widget/Spinner;

    invoke-direct {v0, p0}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    .line 203
    .local v0, "s":Landroid/widget/Spinner;
    new-instance v1, Landroid/widget/ArrayAdapter;

    const v2, 0x1090008

    invoke-direct {v1, p0, v2, p1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 204
    .local v1, "a":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    const v2, 0x1090009

    invoke-virtual {v1, v2}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 205
    invoke-virtual {v0, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 206
    invoke-virtual {v0, p2}, Landroid/widget/Spinner;->setSelection(I)V

    .line 207
    return-object v0
.end method

.method private toast(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 178
    iget-object v0, p0, Lcom/licenseinjector/app/GeneratorActivity;->ui:Landroid/os/Handler;

    new-instance v1, Lcom/licenseinjector/app/GeneratorActivity$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/licenseinjector/app/GeneratorActivity$$ExternalSyntheticLambda0;-><init>(Lcom/licenseinjector/app/GeneratorActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 179
    return-void
.end method

.method private tv(Ljava/lang/String;IIZ)Landroid/widget/TextView;
    .locals 3
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "size"    # I
    .param p3, "color"    # I
    .param p4, "bold"    # Z

    .line 211
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 212
    .local v0, "t":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 213
    int-to-float v1, p2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 214
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 215
    if-eqz p4, :cond_0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 216
    :cond_0
    return-object v0
.end method

.method private updateCap()V
    .locals 6

    .line 145
    iget-object v0, p0, Lcom/licenseinjector/app/GeneratorActivity;->spFmt:Landroid/widget/Spinner;

    invoke-virtual {v0}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/licenseinjector/app/Generator$Format;->DIGIT:Lcom/licenseinjector/app/Generator$Format;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/licenseinjector/app/Generator$Format;->ALPHA:Lcom/licenseinjector/app/Generator$Format;

    .line 146
    .local v0, "f":Lcom/licenseinjector/app/Generator$Format;
    :goto_0
    iget-object v1, p0, Lcom/licenseinjector/app/GeneratorActivity;->spLen:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Lcom/licenseinjector/app/Generator$Length;->L10:Lcom/licenseinjector/app/Generator$Length;

    goto :goto_1

    .line 147
    :cond_1
    iget-object v1, p0, Lcom/licenseinjector/app/GeneratorActivity;->spLen:Landroid/widget/Spinner;

    invoke-virtual {v1}, Landroid/widget/Spinner;->getSelectedItemPosition()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    sget-object v1, Lcom/licenseinjector/app/Generator$Length;->L16:Lcom/licenseinjector/app/Generator$Length;

    goto :goto_1

    :cond_2
    sget-object v1, Lcom/licenseinjector/app/Generator$Length;->L32:Lcom/licenseinjector/app/Generator$Length;

    :goto_1
    nop

    .line 148
    .local v1, "l":Lcom/licenseinjector/app/Generator$Length;
    iget-object v2, p0, Lcom/licenseinjector/app/GeneratorActivity;->tvCap:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u8be5\u683c\u5f0f\u6700\u5927\u4e0d\u91cd\u590d\u6570\uff1a"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v0, v1}, Lcom/licenseinjector/app/Generator;->maxUnique(Lcom/licenseinjector/app/Generator$Format;Lcom/licenseinjector/app/Generator$Length;)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\uff08\u77ed\u683c\u5f0f\u6709\u9650\uff0c\u5927\u6279\u91cf\u8bf7\u7528 32 \u4f4d/\u5b57\u6bcd\u6570\u5b57\uff09"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    return-void
.end method


# virtual methods
.method synthetic lambda$buildUi$0$com-licenseinjector-app-GeneratorActivity(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .line 118
    invoke-direct {p0}, Lcom/licenseinjector/app/GeneratorActivity;->onGenerate()V

    return-void
.end method

.method synthetic lambda$buildUi$1$com-licenseinjector-app-GeneratorActivity(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 135
    const-string v0, "clipboard"

    invoke-virtual {p0, v0}, Lcom/licenseinjector/app/GeneratorActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    .line 136
    .local v0, "cm":Landroid/content/ClipboardManager;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/licenseinjector/app/GeneratorActivity;->tvOut:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    const-string v2, "cards"

    invoke-static {v2, v1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 137
    :cond_0
    const-string v1, "\u5df2\u590d\u5236"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 138
    return-void
.end method

.method synthetic lambda$toast$2$com-licenseinjector-app-GeneratorActivity(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .line 178
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "b"    # Landroid/os/Bundle;

    .line 32
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 33
    invoke-virtual {p0}, Lcom/licenseinjector/app/GeneratorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 34
    invoke-virtual {p0}, Lcom/licenseinjector/app/GeneratorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "key"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 35
    .local v0, "k":Ljava/lang/String;
    if-eqz v0, :cond_0

    iput-object v0, p0, Lcom/licenseinjector/app/GeneratorActivity;->pendingKey:Ljava/lang/String;

    .line 37
    .end local v0    # "k":Ljava/lang/String;
    :cond_0
    invoke-direct {p0}, Lcom/licenseinjector/app/GeneratorActivity;->buildUi()V

    .line 38
    return-void
.end method
