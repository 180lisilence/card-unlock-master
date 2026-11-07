package com.licenseinjector.app;

import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/* JADX INFO: loaded from: classes4.dex */
public class MainActivity extends Activity {
    private EditText etKey;

    private void buildUi() {
        ScrollView scrollView = new ScrollView(this);
        scrollView.setBackground(UiTheme.pageGradient());
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(1);
        int iM8dp = m8dp(20);
        linearLayout.setPadding(iM8dp, iM8dp, iM8dp, iM8dp);
        scrollView.addView(linearLayout);
        TextView textViewM9tv = m9tv("卡密工具箱", 26, UiTheme.TEXT, true);
        textViewM9tv.setGravity(17);
        UiTheme.shimmerText(textViewM9tv);
        linearLayout.addView(textViewM9tv);
        TextView textViewM9tv2 = m9tv("生成卡密 + 注入 APK · 合并版", 13, UiTheme.SUB, false);
        textViewM9tv2.setGravity(17);
        textViewM9tv2.setPadding(0, m8dp(6), 0, m8dp(20));
        linearLayout.addView(textViewM9tv2);
        linearLayout.addView(fieldLabel("共享密钥（生成与注入须一致）", UiTheme.ACCENT1));
        EditText editText = new EditText(this);
        this.etKey = editText;
        editText.setHint("例如 ABCDEF012345");
        this.etKey.setTextColor(UiTheme.TEXT);
        this.etKey.setHintTextColor(UiTheme.SUB);
        this.etKey.setBackgroundColor(-1);
        this.etKey.setPadding(m8dp(12), m8dp(12), m8dp(12), m8dp(12));
        this.etKey.setSingleLine(true);
        linearLayout.addView(this.etKey);
        TextView textViewM9tv3 = m9tv("⚠️ 这把「共享密钥」会同时用于「注入」和「生成卡密」，两端必须填完全相同的内容，否则生成的卡密永远无效！", 12, UiTheme.ACCENT3, false);
        textViewM9tv3.setPadding(0, m8dp(6), 0, m8dp(4));
        linearLayout.addView(textViewM9tv3);
        Button button = new Button(this);
        button.setText("① 卡密生成");
        UiTheme.styleButton(button);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.topMargin = m8dp(20);
        button.setLayoutParams(layoutParams);
        button.setOnClickListener(new View.OnClickListener() { // from class: com.licenseinjector.app.MainActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, (Class<?>) GeneratorActivity.class);
                intent.putExtra("key", MainActivity.this.etKey.getText().toString().trim());
                MainActivity.this.startActivity(intent);
            }
        });
        linearLayout.addView(button);
        Button button2 = new Button(this);
        button2.setText("② 卡密注入");
        UiTheme.styleButton(button2);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams2.topMargin = m8dp(14);
        button2.setLayoutParams(layoutParams2);
        button2.setOnClickListener(new View.OnClickListener() { // from class: com.licenseinjector.app.MainActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, (Class<?>) InjectActivity.class);
                intent.putExtra("key", MainActivity.this.etKey.getText().toString().trim());
                MainActivity.this.startActivity(intent);
            }
        });
        linearLayout.addView(button2);
        TextView textViewM9tv4 = m9tv("提示：先用「卡密生成」按设备码发卡，再用「卡密注入」把验证模块打进目标 APK，两者务必使用同一个密钥。", 12, UiTheme.SUB, false);
        textViewM9tv4.setPadding(0, m8dp(22), 0, 0);
        linearLayout.addView(textViewM9tv4);
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams3.topMargin = m8dp(16);
        LinearLayout linearLayoutUsageCard = usageCard();
        linearLayoutUsageCard.setLayoutParams(layoutParams3);
        linearLayout.addView(linearLayoutUsageCard);
        setContentView(scrollView);
    }

    /* JADX INFO: renamed from: dp */
    private int m8dp(int i) {
        return (int) ((i * getResources().getDisplayMetrics().density) + 0.5f);
    }

    private TextView fieldLabel(String str, int i) {
        TextView textViewM9tv = m9tv(str, 13, i, false);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.topMargin = m8dp(14);
        textViewM9tv.setLayoutParams(layoutParams);
        UiTheme.shimmerText(textViewM9tv);
        return textViewM9tv;
    }

    /* JADX INFO: renamed from: tv */
    private TextView m9tv(String str, int i, int i2, boolean z) {
        TextView textView = new TextView(this);
        textView.setText(str);
        textView.setTextSize(i);
        textView.setTextColor(i2);
        if (z) {
            textView.setTypeface(null, 1);
        }
        return textView;
    }

    private LinearLayout usageCard() {
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(1);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setColor(-1);
        gradientDrawable.setCornerRadius(m8dp(14));
        gradientDrawable.setStroke(m8dp(2), UiTheme.ACCENT2);
        linearLayout.setBackground(gradientDrawable);
        int iM8dp = m8dp(14);
        linearLayout.setPadding(iM8dp, iM8dp, iM8dp, iM8dp);
        linearLayout.addView(m9tv("📖 使用说明（必读）", 16, UiTheme.ACCENT1, true));
        for (String str : new String[]{"【核心】共享密钥是同一把「主密钥」：它既用于「注入时给 App 打标记」，也用于「生成卡密」。\n注入时填的密钥 必须 = 生成卡密时填的密钥，否则卡密必无效！", "【设密钥（只需一次）】\n在首页顶部「共享密钥」填任意一串（如 123456）。它会被自动带进 ① 和 ②，无需重复输入。\n（若你在 ① 里单独改了密钥，记得 ② 里也要填一模一样的一串。）", "【首次注入】\n直接进「② 卡密注入」→ 「卡密密钥」已自动带出 123456 → 选目标 APK → 注入并保存。", "【生成卡密（每次发给用户）】\n① 打开被注入的 App → 弹窗里「复制本机设备码」。\n② 进「① 卡密生成」→ 共享密钥已带出 123456 → 粘贴设备码 → 选卡类型/长度/数量 → 点「生成卡密」→ 复制结果。", "【用户验证】\n把卡密发给用户，用户在弹窗粘贴 → 验证通过（如「终身卡」）。", "【一句话记牢】\n首页填一次共享密钥，①和②自动同步；注入密钥 = 生成密钥 = 同一把。"}) {
            TextView textViewM9tv = m9tv(str, 12, UiTheme.TEXT, false);
            textViewM9tv.setPadding(0, m8dp(8), 0, 0);
            linearLayout.addView(textViewM9tv);
        }
        return linearLayout;
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        buildUi();
    }
}
