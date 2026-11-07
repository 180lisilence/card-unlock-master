package com.licenseinjector.app;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.DocumentsContract;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import com.license.verify2.CryptoUtil;
import com.licenseinjector.app.core.Injector;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

/* JADX INFO: loaded from: classes4.dex */
public class InjectActivity extends Activity {
    private static final int REQ_IN = 1001;
    private static final int REQ_OUT = 1002;
    private EditText etKey;
    private Uri outUri;
    private Uri targetUri;
    private TextView tvLog;
    private TextView tvTarget;

    /* JADX INFO: renamed from: ui */
    private final Handler f20ui = new Handler(Looper.getMainLooper());
    private String targetName = "";
    private String pendingKey = "";

    private void buildUi() {
        ScrollView scrollView = new ScrollView(this);
        scrollView.setBackground(UiTheme.pageGradient());
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(1);
        int iM6dp = m6dp(20);
        linearLayout.setPadding(iM6dp, iM6dp, iM6dp, iM6dp);
        scrollView.addView(linearLayout);
        TextView textViewM7tv = m7tv("卡密注入器", 24, UiTheme.TEXT, true);
        textViewM7tv.setGravity(17);
        UiTheme.shimmerText(textViewM7tv);
        linearLayout.addView(textViewM7tv);
        TextView textViewM7tv2 = m7tv("选择目标 APK，注入卡密弹窗模块并自动重签名（payload v5）", 13, UiTheme.SUB, false);
        textViewM7tv2.setGravity(17);
        textViewM7tv2.setPadding(0, m6dp(6), 0, m6dp(18));
        linearLayout.addView(textViewM7tv2);
        Button button = new Button(this);
        button.setText("① 选择目标 APK");
        UiTheme.styleButton(button);
        button.setOnClickListener(new View.OnClickListener() { // from class: com.licenseinjector.app.InjectActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                InjectActivity.this.pickFile(InjectActivity.REQ_IN);
            }
        });
        linearLayout.addView(button);
        TextView textViewM7tv3 = m7tv("未选择文件", 13, UiTheme.SUB, false);
        this.tvTarget = textViewM7tv3;
        textViewM7tv3.setPadding(m6dp(4), m6dp(10), m6dp(4), m6dp(18));
        linearLayout.addView(this.tvTarget);
        linearLayout.addView(fieldLabel("卡密密钥（须与发卡器一致）", UiTheme.ACCENT1));
        EditText editText = new EditText(this);
        this.etKey = editText;
        editText.setText(this.pendingKey);
        this.etKey.setHint("例如 ABCDEF012345");
        this.etKey.setTextColor(UiTheme.TEXT);
        this.etKey.setHintTextColor(UiTheme.SUB);
        this.etKey.setBackgroundColor(-1);
        this.etKey.setPadding(m6dp(12), m6dp(12), m6dp(12), m6dp(12));
        this.etKey.setSingleLine(true);
        linearLayout.addView(this.etKey);
        TextView textViewM7tv4 = m7tv("（须与「卡密生成」里填的共享密钥完全一致，否则生成的卡密必无效）", 11, UiTheme.ACCENT3, false);
        textViewM7tv4.setPadding(0, m6dp(4), 0, m6dp(4));
        linearLayout.addView(textViewM7tv4);
        linearLayout.addView(fieldLabel("③ 本机设备码（自动识别，复制后去「卡密生成」用）", UiTheme.ACCENT3));
        final String strGenerateAndroidDeviceCode = CryptoUtil.generateAndroidDeviceCode(this);
        TextView textViewM7tv5 = m7tv(strGenerateAndroidDeviceCode.isEmpty() ? "获取失败" : strGenerateAndroidDeviceCode, 20, UiTheme.ACCENT1, true);
        textViewM7tv5.setBackgroundColor(-1);
        textViewM7tv5.setGravity(17);
        textViewM7tv5.setPadding(m6dp(12), m6dp(16), m6dp(12), m6dp(16));
        UiTheme.shimmerText(textViewM7tv5);
        linearLayout.addView(textViewM7tv5);
        Button button2 = new Button(this);
        button2.setText("复制设备码");
        UiTheme.styleButton(button2);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.topMargin = m6dp(10);
        button2.setLayoutParams(layoutParams);
        button2.setOnClickListener(new View.OnClickListener() { // from class: com.licenseinjector.app.InjectActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (strGenerateAndroidDeviceCode.isEmpty()) {
                    Toast.makeText(InjectActivity.this, "设备码获取失败", 0).show();
                    return;
                }
                ClipboardManager clipboardManager = (ClipboardManager) InjectActivity.this.getSystemService("clipboard");
                if (clipboardManager != null) {
                    clipboardManager.setPrimaryClip(ClipData.newPlainText("devcode", strGenerateAndroidDeviceCode));
                }
                Toast.makeText(InjectActivity.this, "已复制设备码", 0).show();
            }
        });
        linearLayout.addView(button2);
        TextView textViewM7tv6 = m7tv("说明：设备码由本机 android_id + 机型指纹生成。若本工具箱与注入后的 APK 用同一签名密钥（inject.p12）打包，两者显示的设备码一致。", 12, UiTheme.SUB, false);
        textViewM7tv6.setPadding(m6dp(2), m6dp(8), m6dp(2), m6dp(10));
        linearLayout.addView(textViewM7tv6);
        Button button3 = new Button(this);
        button3.setText("② 注入并保存");
        UiTheme.styleButton(button3);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, -2);
        layoutParams2.topMargin = m6dp(18);
        button3.setLayoutParams(layoutParams2);
        button3.setOnClickListener(new View.OnClickListener() { // from class: com.licenseinjector.app.InjectActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                InjectActivity.this.onInject();
            }
        });
        linearLayout.addView(button3);
        TextView textViewM7tv7 = m7tv("", 12, UiTheme.SUB, false);
        this.tvLog = textViewM7tv7;
        textViewM7tv7.setTextIsSelectable(true);
        this.tvLog.setPadding(m6dp(4), m6dp(16), m6dp(4), m6dp(4));
        linearLayout.addView(this.tvLog);
        setContentView(scrollView);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void copy(Uri uri, File file) throws Exception {
        InputStream inputStreamOpenInputStream = getContentResolver().openInputStream(uri);
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        byte[] bArr = new byte[65536];
        while (true) {
            int i = inputStreamOpenInputStream.read(bArr);
            if (i <= 0) {
                inputStreamOpenInputStream.close();
                fileOutputStream.close();
                return;
            }
            fileOutputStream.write(bArr, 0, i);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void copyOut(File file, Uri uri) throws Exception {
        OutputStream outputStreamOpenOutputStream = getContentResolver().openOutputStream(uri, "wt");
        FileInputStream fileInputStream = new FileInputStream(file);
        byte[] bArr = new byte[65536];
        while (true) {
            int i = fileInputStream.read(bArr);
            if (i <= 0) {
                fileInputStream.close();
                outputStreamOpenOutputStream.flush();
                outputStreamOpenOutputStream.close();
                return;
            }
            outputStreamOpenOutputStream.write(bArr, 0, i);
        }
    }

    /* JADX INFO: renamed from: dp */
    private int m6dp(int i) {
        return (int) ((i * getResources().getDisplayMetrics().density) + 0.5f);
    }

    private TextView fieldLabel(String str, int i) {
        TextView textViewM7tv = m7tv(str, 13, i, false);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.topMargin = m6dp(14);
        textViewM7tv.setLayoutParams(layoutParams);
        UiTheme.shimmerText(textViewM7tv);
        return textViewM7tv;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void log(final String str) {
        this.f20ui.post(new Runnable() { // from class: com.licenseinjector.app.InjectActivity.4
            @Override // java.lang.Runnable
            public void run() {
                InjectActivity.this.tvLog.append(str + "\n");
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onInject() {
        if (this.targetUri == null) {
            Toast.makeText(this, "请先选择目标 APK", 0).show();
            return;
        }
        Uri uriTryCreateSibling = tryCreateSibling();
        if (uriTryCreateSibling == null) {
            pickOutFile();
        } else {
            this.outUri = uriTryCreateSibling;
            startInject();
        }
    }

    private Uri parentOf(Uri uri) {
        try {
            String documentId = DocumentsContract.getDocumentId(uri);
            int iLastIndexOf = documentId.lastIndexOf(47);
            if (iLastIndexOf <= 0) {
                return null;
            }
            return DocumentsContract.buildDocumentUri(uri.getAuthority(), documentId.substring(0, iLastIndexOf));
        } catch (Throwable th) {
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void pickFile(int i) {
        Intent intent = new Intent("android.intent.action.OPEN_DOCUMENT");
        intent.addCategory("android.intent.category.OPENABLE");
        intent.setType("*/*");
        intent.putExtra("android.intent.extra.MIME_TYPES", new String[]{"application/vnd.android.package-archive", "application/octet-stream", "*/*"});
        startActivityForResult(intent, i);
    }

    private void pickOutFile() {
        Intent intent = new Intent("android.intent.action.CREATE_DOCUMENT");
        intent.addCategory("android.intent.category.OPENABLE");
        intent.setType("application/vnd.android.package-archive");
        intent.putExtra("android.intent.extra.TITLE", this.targetName.isEmpty() ? "injected.apk" : stripExt(this.targetName) + "_injected.apk");
        Uri uriParentOf = parentOf(this.targetUri);
        if (uriParentOf != null) {
            intent.putExtra("android.provider.extra.INITIAL_URI", uriParentOf);
        }
        startActivityForResult(intent, REQ_OUT);
    }

    private String queryName(Uri uri) {
        int columnIndex;
        Cursor cursorQuery = null;
        try {
            cursorQuery = getContentResolver().query(uri, null, null, null, null);
            if (cursorQuery != null && cursorQuery.moveToFirst() && (columnIndex = cursorQuery.getColumnIndex("_display_name")) >= 0) {
                return cursorQuery.getString(columnIndex);
            }
            if (cursorQuery == null) {
                return "target.apk";
            }
        } catch (Exception e) {
            if (cursorQuery == null) {
                return "target.apk";
            }
        } finally {
            if (cursorQuery != null) {
                cursorQuery.close();
            }
        }
        return "target.apk";
    }

    /* JADX INFO: Access modifiers changed from: private */
    public byte[] readAsset(String str) throws Exception {
        InputStream inputStreamOpen = getAssets().open(str);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] bArr = new byte[8192];
        while (true) {
            int i = inputStreamOpen.read(bArr);
            if (i <= 0) {
                inputStreamOpen.close();
                return byteArrayOutputStream.toByteArray();
            }
            byteArrayOutputStream.write(bArr, 0, i);
        }
    }

    private void startInject() {
        final String strTrim = this.etKey.getText().toString().trim();
        final Uri uri = this.targetUri;
        final Uri uri2 = this.outUri;
        this.tvLog.setText("");
        new Thread(new Runnable() { // from class: com.licenseinjector.app.InjectActivity.5
            @Override // java.lang.Runnable
            public void run() {
                File file = new File(InjectActivity.this.getCacheDir(), "target_in.apk");
                File file2 = new File(InjectActivity.this.getCacheDir(), "target_out.apk");
                try {
                    InjectActivity.this.copy(uri, file);
                    byte[] asset = InjectActivity.this.readAsset("payload.dex");
                    byte[] asset2 = InjectActivity.this.readAsset("inject.p12");
                    InjectActivity.this.log("[*] 目标: " + InjectActivity.this.targetName);
                    InjectActivity.this.log("[*] 密钥: " + (strTrim.isEmpty() ? "(空)" : strTrim));
                    Injector.inject(file, file2, asset, strTrim, asset2, new Injector.Log() { // from class: com.licenseinjector.app.InjectActivity.5.1
                        @Override // com.licenseinjector.app.core.Injector.Log
                        public void log(String str) {
                            InjectActivity.this.log(str);
                        }
                    });
                    InjectActivity.this.copyOut(file2, uri2);
                    InjectActivity.this.log("[✓] 已保存到所选位置");
                    InjectActivity.this.toast("注入完成");
                } catch (Throwable th) {
                    try {
                        InjectActivity.this.log("[!] 失败: " + th);
                        InjectActivity.this.toast("失败: " + th.getMessage());
                    } finally {
                        file.delete();
                        file2.delete();
                    }
                }
            }
        }).start();
    }

    private static String stripExt(String str) {
        int iLastIndexOf = str.lastIndexOf(46);
        return iLastIndexOf > 0 ? str.substring(0, iLastIndexOf) : str;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void toast(final String str) {
        this.f20ui.post(new Runnable() { // from class: com.licenseinjector.app.InjectActivity.6
            @Override // java.lang.Runnable
            public void run() {
                Toast.makeText(InjectActivity.this, str, 1).show();
            }
        });
    }

    private Uri tryCreateSibling() {
        Uri uriParentOf = parentOf(this.targetUri);
        if (uriParentOf == null) {
            return null;
        }
        try {
            return DocumentsContract.createDocument(getContentResolver(), uriParentOf, "application/vnd.android.package-archive", (this.targetName.isEmpty() ? "app" : stripExt(this.targetName)) + "_injected.apk");
        } catch (Throwable th) {
            return null;
        }
    }

    /* JADX INFO: renamed from: tv */
    private TextView m7tv(String str, int i, int i2, boolean z) {
        TextView textView = new TextView(this);
        textView.setText(str);
        textView.setTextSize(i);
        textView.setTextColor(i2);
        if (z) {
            textView.setTypeface(null, 1);
        }
        return textView;
    }

    @Override // android.app.Activity
    protected void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i2 != -1 || intent == null || intent.getData() == null) {
            return;
        }
        if (i == REQ_IN) {
            Uri data = intent.getData();
            this.targetUri = data;
            this.targetName = queryName(data);
            this.tvTarget.setText("已选择: " + this.targetName);
            return;
        }
        if (i == REQ_OUT) {
            this.outUri = intent.getData();
            startInject();
        }
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (getIntent() != null) {
            String stringExtra = getIntent().getStringExtra("key");
            this.pendingKey = stringExtra != null ? stringExtra : "";
        }
        buildUi();
    }
}
