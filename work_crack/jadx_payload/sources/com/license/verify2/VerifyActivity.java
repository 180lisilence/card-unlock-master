package com.license.verify2;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.InputFilter;
import android.text.method.DigitsKeyListener;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

/* JADX INFO: loaded from: E:\gongxiangwenjianjia\com.licenseinjector.app\work_crack\dex_raw\assets\payload.dex */
public class VerifyActivity extends Activity {
    private static final int ACCENT = -10262799;
    private static final int ACCENT2 = -7643914;
    private static final int CHIP_BG = -920071;
    private static final int DANGER = -2349530;
    private static final int DEV_VALUE = -11581723;
    private static final int FIELD_BG = -920071;
    private static final int SUB_COLOR = -9735552;
    private static final int TITLE_COLOR = -14804149;
    private EditText cardInput;
    private String deviceCode;
    private String secretKey = "";
    private String targetActivity = "";

    private static class KeyBadgeView extends View {
        private final Paint paint;

        KeyBadgeView(Context context) {
            super(context);
            this.paint = new Paint(1);
        }

        @Override // android.view.View
        protected void onDraw(Canvas canvas) {
            int width = getWidth();
            int height = getHeight();
            float fMin = Math.min(width, height);
            float f = width / 2.0f;
            float f2 = height / 2.0f;
            float f3 = fMin / 2.0f;
            this.paint.setShader(new LinearGradient(f - f3, f2 - f3, f + f3, f2 + f3, VerifyActivity.ACCENT, VerifyActivity.ACCENT2, Shader.TileMode.CLAMP));
            canvas.drawCircle(f, f2, f3, this.paint);
            this.paint.setShader(null);
            this.paint.setColor(-1);
            this.paint.setStyle(Paint.Style.STROKE);
            this.paint.setStrokeWidth(0.055f * fMin);
            this.paint.setStrokeCap(Paint.Cap.ROUND);
            float f4 = fMin / 76.0f;
            float f5 = f - (14.0f * f4);
            float f6 = 8.0f * f4;
            canvas.drawCircle(f5, f2, f6, this.paint);
            Path path = new Path();
            path.moveTo(f5 + f6, f2);
            path.lineTo((18.0f * f4) + f, f2);
            canvas.drawPath(path, this.paint);
            Path path2 = new Path();
            float f7 = f + f6;
            path2.moveTo(f7, f2);
            path2.lineTo(f7, f6 + f2);
            float f8 = f + (16.0f * f4);
            path2.moveTo(f8, f2);
            path2.lineTo(f8, f2 + (f4 * 6.0f));
            canvas.drawPath(path2, this.paint);
        }
    }

    private Drawable appIcon() {
        try {
            return getApplicationInfo().loadIcon(getPackageManager());
        } catch (Exception e) {
            return null;
        }
    }

    private void buildUI() {
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(1);
        linearLayout.setGravity(17);
        linearLayout.setBackgroundDrawable(verticalGradient(-1117441, -1452545));
        int iDp = dp(26);
        linearLayout.setPadding(iDp, dp(36), iDp, dp(36));
        LinearLayout linearLayout2 = new LinearLayout(this);
        linearLayout2.setOrientation(1);
        linearLayout2.setGravity(1);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setColor(-1);
        gradientDrawable.setCornerRadius(dp(28));
        linearLayout2.setBackgroundDrawable(gradientDrawable);
        linearLayout2.setPadding(dp(24), dp(30), dp(24), dp(24));
        linearLayout2.setElevation(dp(14));
        linearLayout2.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
        linearLayout.addView(linearLayout2);
        FrameLayout frameLayout = new FrameLayout(this);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(dp(76), dp(76));
        layoutParams.bottomMargin = dp(14);
        frameLayout.setLayoutParams(layoutParams);
        Drawable drawableAppIcon = appIcon();
        if (drawableAppIcon != null) {
            ImageView imageView = new ImageView(this);
            imageView.setImageDrawable(drawableAppIcon);
            imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
            FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(-1, -1);
            layoutParams2.setMargins(dp(8), dp(8), dp(8), dp(8));
            frameLayout.addView(imageView, layoutParams2);
        } else {
            frameLayout.addView(new KeyBadgeView(this), new FrameLayout.LayoutParams(-1, -1));
        }
        linearLayout2.addView(frameLayout);
        String appName = LicenseVerify.getAppName(this);
        if (appName == null || appName.isEmpty()) {
            appName = "应用";
        }
        TextView textView = new TextView(this);
        textView.setText(appName);
        textView.setTextSize(23.0f);
        textView.setTypeface(Typeface.DEFAULT_BOLD);
        textView.setTextColor(TITLE_COLOR);
        textView.setGravity(17);
        linearLayout2.addView(textView);
        TextView textView2 = new TextView(this);
        textView2.setText("请输入卡密解锁使用  ·  模块 v5");
        textView2.setTextSize(13.5f);
        textView2.setTextColor(SUB_COLOR);
        textView2.setGravity(17);
        textView2.setPadding(0, dp(8), 0, dp(22));
        linearLayout2.addView(textView2);
        LinearLayout linearLayout3 = new LinearLayout(this);
        linearLayout3.setOrientation(0);
        linearLayout3.setGravity(16);
        linearLayout3.setPadding(dp(16), dp(12), dp(8), dp(12));
        GradientDrawable gradientDrawable2 = new GradientDrawable();
        gradientDrawable2.setColor(-920071);
        gradientDrawable2.setCornerRadius(dp(16));
        linearLayout3.setBackgroundDrawable(gradientDrawable2);
        linearLayout2.addView(linearLayout3, new LinearLayout.LayoutParams(-1, -2));
        TextView textView3 = new TextView(this);
        textView3.setText("设备码");
        textView3.setTextSize(14.0f);
        textView3.setTextColor(SUB_COLOR);
        linearLayout3.addView(textView3);
        TextView textView4 = new TextView(this);
        textView4.setText(this.deviceCode);
        textView4.setTextSize(14.0f);
        textView4.setTypeface(Typeface.MONOSPACE, 1);
        textView4.setTextColor(DEV_VALUE);
        textView4.setSingleLine(true);
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(0, -2, 1.0f);
        layoutParams3.leftMargin = dp(10);
        linearLayout3.addView(textView4, layoutParams3);
        TextView textView5 = new TextView(this);
        textView5.setText("复制");
        textView5.setTextSize(13.5f);
        textView5.setTextColor(ACCENT);
        textView5.setTypeface(Typeface.DEFAULT_BOLD);
        textView5.setPadding(dp(14), dp(6), dp(14), dp(6));
        textView5.setOnClickListener(new View.OnClickListener() { // from class: com.license.verify2.VerifyActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                VerifyActivity.this.copyToClipboard(VerifyActivity.this.deviceCode);
                Toast.makeText(VerifyActivity.this, "设备码已复制", 0).show();
            }
        });
        linearLayout3.addView(textView5);
        linearLayout2.addView(spacer(0, dp(16)));
        EditText editText = new EditText(this);
        this.cardInput = editText;
        editText.setHint("请输入卡密（长按自动粘贴）");
        editText.setTextSize(16.0f);
        editText.setTextColor(TITLE_COLOR);
        editText.setHintTextColor(-7035976);
        GradientDrawable gradientDrawable3 = new GradientDrawable();
        gradientDrawable3.setColor(-920071);
        gradientDrawable3.setCornerRadius(dp(16));
        editText.setBackgroundDrawable(gradientDrawable3);
        editText.setPadding(dp(16), dp(16), dp(16), dp(16));
        editText.setSingleLine(true);
        editText.setGravity(17);
        editText.setKeyListener(DigitsKeyListener.getInstance("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"));
        editText.setFilters(new InputFilter[]{new InputFilter.LengthFilter(32), new InputFilter.AllCaps()});
        editText.setOnLongClickListener(new View.OnLongClickListener() { // from class: com.license.verify2.VerifyActivity.2
            @Override // android.view.View.OnLongClickListener
            public boolean onLongClick(View view) {
                CharSequence charSequenceCoerceToText;
                ClipboardManager clipboardManager = (ClipboardManager) VerifyActivity.this.getSystemService("clipboard");
                if (clipboardManager == null || clipboardManager.getPrimaryClip() == null || clipboardManager.getPrimaryClip().getItemCount() <= 0 || (charSequenceCoerceToText = clipboardManager.getPrimaryClip().getItemAt(0).coerceToText(VerifyActivity.this)) == null) {
                    return false;
                }
                VerifyActivity.this.cardInput.setText(charSequenceCoerceToText.toString().trim().toUpperCase());
                VerifyActivity.this.cardInput.setSelection(VerifyActivity.this.cardInput.getText().length());
                Toast.makeText(VerifyActivity.this, "已粘贴", 0).show();
                return true;
            }
        });
        linearLayout2.addView(editText, new LinearLayout.LayoutParams(-1, -2));
        linearLayout2.addView(spacer(0, dp(20)));
        LinearLayout linearLayout4 = new LinearLayout(this);
        linearLayout4.setOrientation(0);
        linearLayout2.addView(linearLayout4, new LinearLayout.LayoutParams(-1, -2));
        Button button = new Button(this);
        button.setText("退出");
        button.setTextSize(16.5f);
        button.setTypeface(Typeface.DEFAULT_BOLD);
        button.setTextColor(DANGER);
        button.setAllCaps(false);
        GradientDrawable gradientDrawable4 = new GradientDrawable();
        gradientDrawable4.setColor(-68878);
        gradientDrawable4.setCornerRadius(dp(16));
        button.setBackgroundDrawable(gradientDrawable4);
        button.setPadding(0, dp(13), 0, dp(13));
        LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(0, -2, 1.0f);
        layoutParams4.rightMargin = dp(10);
        button.setLayoutParams(layoutParams4);
        button.setOnClickListener(new View.OnClickListener() { // from class: com.license.verify2.VerifyActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                VerifyActivity.this.finish();
            }
        });
        linearLayout4.addView(button);
        Button button2 = new Button(this);
        button2.setText("验证");
        button2.setTextSize(16.5f);
        button2.setTypeface(Typeface.DEFAULT_BOLD);
        button2.setTextColor(-1);
        button2.setAllCaps(false);
        GradientDrawable gradientDrawable5 = new GradientDrawable(GradientDrawable.Orientation.LEFT_RIGHT, new int[]{ACCENT, ACCENT2});
        gradientDrawable5.setCornerRadius(dp(16));
        button2.setBackgroundDrawable(gradientDrawable5);
        button2.setPadding(0, dp(13), 0, dp(13));
        button2.setLayoutParams(new LinearLayout.LayoutParams(0, -2, 1.0f));
        button2.setOnClickListener(new View.OnClickListener() { // from class: com.license.verify2.VerifyActivity.4
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                VerifyActivity.this.handleVerify();
            }
        });
        linearLayout4.addView(button2);
        TextView textView6 = new TextView(this);
        textView6.setText(LicenseVerify.statusText(this));
        textView6.setTextSize(11.5f);
        textView6.setTextColor(-7035976);
        textView6.setGravity(17);
        textView6.setPadding(0, dp(16), 0, 0);
        linearLayout.addView(textView6);
        setContentView(linearLayout);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void copyToClipboard(String str) {
        ClipboardManager clipboardManager = (ClipboardManager) getSystemService("clipboard");
        if (clipboardManager != null) {
            clipboardManager.setPrimaryClip(ClipData.newPlainText("设备码", str));
        }
    }

    private int dp(int i) {
        return (int) ((i * getResources().getDisplayMetrics().density) + 0.5f);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleVerify() {
        String upperCase = this.cardInput.getText().toString().trim().toUpperCase();
        if (upperCase.isEmpty()) {
            Toast.makeText(this, "请输入卡密", 0).show();
            return;
        }
        VerifyResult verifyResultActivate = LicenseVerify.activate(this, upperCase);
        if (!verifyResultActivate.success) {
            Toast.makeText(this, verifyResultActivate.message, 1).show();
            this.cardInput.setText("");
            return;
        }
        String str = "验证成功：" + verifyResultActivate.cardTypeName + " (" + verifyResultActivate.durationText + ")";
        if (verifyResultActivate.lifetime) {
            str = "验证成功：终身卡";
        }
        Toast.makeText(this, str, 0).show();
        new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.license.verify2.VerifyActivity.5
            @Override // java.lang.Runnable
            public void run() {
                VerifyActivity.this.jumpToTarget();
            }
        }, 800L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void jumpToTarget() {
        try {
            if (this.targetActivity != null && !this.targetActivity.isEmpty()) {
                Intent intent = new Intent();
                intent.setClassName(getPackageName(), this.targetActivity);
                intent.addFlags(268468224);
                startActivity(intent);
                finish();
                return;
            }
            Toast.makeText(this, "未配置跳转目标", 1).show();
            finish();
        } catch (Exception e) {
            Toast.makeText(this, "跳转失败，请检查 TARGET_ACTIVITY 配置: " + e.getMessage(), 1).show();
        }
    }

    private void loadConfig() {
        InputStream inputStreamOpen = null;
        try {
            try {
                inputStreamOpen = getAssets().open("license_cfg.txt");
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStreamOpen, "UTF-8"));
                while (true) {
                    String line = bufferedReader.readLine();
                    if (line == null) {
                        break;
                    }
                    int iIndexOf = line.indexOf(61);
                    if (iIndexOf > 0) {
                        String strTrim = line.substring(0, iIndexOf).trim();
                        String strTrim2 = line.substring(iIndexOf + 1).trim();
                        if ("key".equals(strTrim)) {
                            this.secretKey = strTrim2;
                        } else if ("target".equals(strTrim)) {
                            this.targetActivity = strTrim2;
                        }
                    }
                }
                bufferedReader.close();
                if (inputStreamOpen != null) {
                    inputStreamOpen.close();
                }
            } catch (Exception e) {
                if (inputStreamOpen != null) {
                    inputStreamOpen.close();
                }
            } catch (Throwable th) {
                if (inputStreamOpen != null) {
                    try {
                        inputStreamOpen.close();
                    } catch (Exception e2) {
                    }
                }
                throw th;
            }
        } catch (Exception e3) {
        }
    }

    private View spacer(int i, int i2) {
        View view = new View(this);
        view.setLayoutParams(new LinearLayout.LayoutParams(i, i2));
        return view;
    }

    private GradientDrawable verticalGradient(int i, int i2) {
        return new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{i, i2});
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        GateGuard.start(this);
        loadConfig();
        try {
            LicenseVerify.init(this.secretKey);
            if (LicenseVerify.isValid(this)) {
                jumpToTarget();
            } else {
                this.deviceCode = LicenseVerify.getDeviceCode(this);
                buildUI();
            }
        } catch (Exception e) {
            Toast.makeText(this, "密钥配置错误: " + e.getMessage(), 1).show();
            finish();
        }
    }

    @Override // android.app.Activity
    protected void onPause() {
        GateGuard.setGateVisible(false);
        super.onPause();
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        GateGuard.setGateVisible(true);
    }
}
