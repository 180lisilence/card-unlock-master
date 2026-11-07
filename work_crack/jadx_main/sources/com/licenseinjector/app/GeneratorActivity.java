package com.licenseinjector.app;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import android.widget.Toast;
import com.license.verify2.CardType;

/* JADX INFO: loaded from: classes4.dex */
public class GeneratorActivity extends Activity {
    private EditText etCount;
    private EditText etDev;
    private EditText etKey;
    private Spinner spFmt;
    private Spinner spLen;
    private Spinner spType;
    private TextView tvCap;
    private TextView tvOut;

    /* JADX INFO: renamed from: ui */
    private final Handler f19ui = new Handler(Looper.getMainLooper());
    private String pendingKey = "";

    private void buildUi() {
        ScrollView scrollView = new ScrollView(this);
        scrollView.setBackground(UiTheme.pageGradient());
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(1);
        int iM4dp = m4dp(20);
        linearLayout.setPadding(iM4dp, iM4dp, iM4dp, iM4dp);
        scrollView.addView(linearLayout);
        TextView textViewM5tv = m5tv("卡密生成器", 24, UiTheme.TEXT, true);
        textViewM5tv.setGravity(17);
        UiTheme.shimmerText(textViewM5tv);
        linearLayout.addView(textViewM5tv);
        TextView textViewM5tv2 = m5tv("输入设备码（与端上验证页一致）与密钥，生成卡密", 13, UiTheme.SUB, false);
        textViewM5tv2.setGravity(17);
        textViewM5tv2.setPadding(0, m4dp(6), 0, m4dp(18));
        linearLayout.addView(textViewM5tv2);
        linearLayout.addView(fieldLabel("共享密钥（须与注入时一致）", UiTheme.ACCENT1));
        EditText editText = editText(this.pendingKey, "例如 ABCDEF012345");
        this.etKey = editText;
        linearLayout.addView(editText);
        linearLayout.addView(fieldLabel("设备码（16 位大写字母+数字）", UiTheme.ACCENT1));
        EditText editText2 = editText("", "端上验证页显示的 16 位设备码");
        this.etDev = editText2;
        editText2.setSingleLine(true);
        linearLayout.addView(this.etDev);
        TextView textViewM5tv3 = m5tv("说明：设备码来自端上验证页显示的 16 位码，仅在「生成卡密」时需要；若只是先来设共享密钥（首次注入用），设备码可留空、不用点生成。", 11, UiTheme.SUB, false);
        textViewM5tv3.setPadding(0, m4dp(4), 0, m4dp(6));
        linearLayout.addView(textViewM5tv3);
        linearLayout.addView(fieldLabel("卡类型", UiTheme.ACCENT2));
        this.spType = new Spinner(this);
        String[] strArr = new String[10];
        for (CardType cardType : CardType.values()) {
            strArr[cardType.getCode()] = cardType.getCode() + " - " + cardType.getName();
        }
        ArrayAdapter arrayAdapter = new ArrayAdapter(this, android.R.layout.simple_spinner_item, strArr);
        arrayAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        this.spType.setAdapter((SpinnerAdapter) arrayAdapter);
        this.spType.setSelection(2);
        linearLayout.addView(this.spType);
        linearLayout.addView(fieldLabel("字符集", UiTheme.ACCENT2));
        Spinner spinner = spinner(new String[]{"纯数字", "大写字母+数字"}, 0);
        this.spFmt = spinner;
        linearLayout.addView(spinner);
        linearLayout.addView(fieldLabel("长度", UiTheme.ACCENT2));
        Spinner spinner2 = spinner(new String[]{"10位", "16位", "32位"}, 1);
        this.spLen = spinner2;
        linearLayout.addView(spinner2);
        linearLayout.addView(fieldLabel("数量（批量生成，自动去重）", UiTheme.ACCENT3));
        EditText editText3 = editText("1", "1");
        this.etCount = editText3;
        editText3.setSingleLine(true);
        linearLayout.addView(this.etCount);
        TextView textViewM5tv4 = m5tv("", 12, UiTheme.SUB, false);
        this.tvCap = textViewM5tv4;
        linearLayout.addView(textViewM5tv4);
        updateCap();
        AdapterView.OnItemSelectedListener onItemSelectedListener = new AdapterView.OnItemSelectedListener() { // from class: com.licenseinjector.app.GeneratorActivity.1
            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onItemSelected(AdapterView<?> adapterView, View view, int i, long j) {
                GeneratorActivity.this.updateCap();
            }

            @Override // android.widget.AdapterView.OnItemSelectedListener
            public void onNothingSelected(AdapterView<?> adapterView) {
            }
        };
        this.spFmt.setOnItemSelectedListener(onItemSelectedListener);
        this.spLen.setOnItemSelectedListener(onItemSelectedListener);
        Button button = new Button(this);
        button.setText("生成卡密");
        UiTheme.styleButton(button);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.topMargin = m4dp(18);
        button.setLayoutParams(layoutParams);
        button.setOnClickListener(new View.OnClickListener() { // from class: com.licenseinjector.app.GeneratorActivity$$ExternalSyntheticLambda1
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m11lambda$buildUi$0$comlicenseinjectorappGeneratorActivity(view);
            }
        });
        linearLayout.addView(button);
        linearLayout.addView(fieldLabel("生成结果（每行一张，可复制）", UiTheme.ACCENT1));
        TextView textViewM5tv5 = m5tv("", 14, UiTheme.TEXT, false);
        this.tvOut = textViewM5tv5;
        textViewM5tv5.setTextIsSelectable(true);
        this.tvOut.setBackgroundColor(-1);
        this.tvOut.setPadding(m4dp(12), m4dp(12), m4dp(12), m4dp(12));
        linearLayout.addView(this.tvOut);
        Button button2 = new Button(this);
        button2.setText("复制全部");
        UiTheme.styleButton(button2);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams2.topMargin = m4dp(10);
        button2.setLayoutParams(layoutParams2);
        button2.setOnClickListener(new View.OnClickListener() { // from class: com.licenseinjector.app.GeneratorActivity$$ExternalSyntheticLambda2
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.f$0.m12lambda$buildUi$1$comlicenseinjectorappGeneratorActivity(view);
            }
        });
        linearLayout.addView(button2);
        setContentView(scrollView);
    }

    /* JADX INFO: renamed from: dp */
    private int m4dp(int i) {
        return (int) ((i * getResources().getDisplayMetrics().density) + 0.5f);
    }

    private EditText editText(String str, String str2) {
        EditText editText = new EditText(this);
        editText.setText(str);
        editText.setHint(str2);
        editText.setTextColor(UiTheme.TEXT);
        editText.setHintTextColor(UiTheme.SUB);
        editText.setBackgroundColor(-1);
        editText.setPadding(m4dp(12), m4dp(12), m4dp(12), m4dp(12));
        return editText;
    }

    private TextView fieldLabel(String str, int i) {
        TextView textViewM5tv = m5tv(str, 13, i, false);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.topMargin = m4dp(14);
        textViewM5tv.setLayoutParams(layoutParams);
        UiTheme.shimmerText(textViewM5tv);
        return textViewM5tv;
    }

    private void onGenerate() {
        String strTrim = this.etKey.getText().toString().trim();
        String upperCase = this.etDev.getText().toString().trim().toUpperCase();
        int i = Integer.parseInt(((String) this.spType.getSelectedItem()).split(" - ")[0]);
        Generator.Format format = this.spFmt.getSelectedItemPosition() == 0 ? Generator.Format.DIGIT : Generator.Format.ALPHA;
        Generator.Length length = this.spLen.getSelectedItemPosition() == 0 ? Generator.Length.L10 : this.spLen.getSelectedItemPosition() == 1 ? Generator.Length.L16 : Generator.Length.L32;
        if (strTrim.isEmpty()) {
            toast("请填写共享密钥");
            return;
        }
        if (!Generator.isValidDeviceCode(upperCase)) {
            toast("设备码须为 16 位大写字母+数字");
            return;
        }
        int i2 = 1;
        try {
            i2 = Integer.parseInt(this.etCount.getText().toString().trim());
        } catch (Exception e) {
        }
        if (i2 < 1) {
            i2 = 1;
        }
        int i3 = i2;
        try {
            String[] strArrGenerateBatch = i3 == 1 ? new String[]{Generator.generate(strTrim, upperCase, i, format, length)} : Generator.generateBatch(strTrim, upperCase, i, format, length, i3);
            StringBuilder sb = new StringBuilder();
            for (String str : strArrGenerateBatch) {
                sb.append(str).append("\n");
            }
            this.tvOut.setText(sb.toString().trim());
        } catch (Exception e2) {
            toast("生成失败: " + e2.getMessage());
        }
    }

    private Spinner spinner(String[] strArr, int i) {
        Spinner spinner = new Spinner(this);
        ArrayAdapter arrayAdapter = new ArrayAdapter(this, android.R.layout.simple_spinner_item, strArr);
        arrayAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter((SpinnerAdapter) arrayAdapter);
        spinner.setSelection(i);
        return spinner;
    }

    private void toast(final String str) {
        this.f19ui.post(new Runnable() { // from class: com.licenseinjector.app.GeneratorActivity$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                this.f$0.m13lambda$toast$2$comlicenseinjectorappGeneratorActivity(str);
            }
        });
    }

    /* JADX INFO: renamed from: tv */
    private TextView m5tv(String str, int i, int i2, boolean z) {
        TextView textView = new TextView(this);
        textView.setText(str);
        textView.setTextSize(i);
        textView.setTextColor(i2);
        if (z) {
            textView.setTypeface(null, 1);
        }
        return textView;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateCap() {
        Generator.Length length;
        Generator.Format format = this.spFmt.getSelectedItemPosition() == 0 ? Generator.Format.DIGIT : Generator.Format.ALPHA;
        if (this.spLen.getSelectedItemPosition() == 0) {
            length = Generator.Length.L10;
        } else {
            length = this.spLen.getSelectedItemPosition() == 1 ? Generator.Length.L16 : Generator.Length.L32;
        }
        this.tvCap.setText("该格式最大不重复数：" + Generator.maxUnique(format, length) + "（短格式有限，大批量请用 32 位/字母数字）");
    }

    /* JADX INFO: renamed from: lambda$buildUi$0$com-licenseinjector-app-GeneratorActivity, reason: not valid java name */
    /* synthetic */ void m11lambda$buildUi$0$comlicenseinjectorappGeneratorActivity(View view) {
        onGenerate();
    }

    /* JADX INFO: renamed from: lambda$buildUi$1$com-licenseinjector-app-GeneratorActivity, reason: not valid java name */
    /* synthetic */ void m12lambda$buildUi$1$comlicenseinjectorappGeneratorActivity(View view) {
        ClipboardManager clipboardManager = (ClipboardManager) getSystemService("clipboard");
        if (clipboardManager != null) {
            clipboardManager.setPrimaryClip(ClipData.newPlainText("cards", this.tvOut.getText()));
        }
        Toast.makeText(this, "已复制", 0).show();
    }

    /* JADX INFO: renamed from: lambda$toast$2$com-licenseinjector-app-GeneratorActivity, reason: not valid java name */
    /* synthetic */ void m13lambda$toast$2$comlicenseinjectorappGeneratorActivity(String str) {
        Toast.makeText(this, str, 0).show();
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        String stringExtra;
        super.onCreate(bundle);
        if (getIntent() != null && (stringExtra = getIntent().getStringExtra("key")) != null) {
            this.pendingKey = stringExtra;
        }
        buildUi();
    }
}
