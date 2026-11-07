package com.crackmaster.app;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.InputFilter;
import android.text.Spanned;
import android.text.method.DigitsKeyListener;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

/**
 * 解卡大师主界面。
 *
 * 方式 A（一键发卡）：从被锁 APK 提取注入密钥 → 按设备码生成终身卡密，
 *                    回目标 App 粘贴即永久激活（不修改目标 APK）。
 * 方式 B（一键破解）：直接 patch 验证 dex 让 isValid/verifyInternal/isExpired 恒真，
 *                    重打包重签名后输出可直接安装的破解版 APK。
 */
public class MainActivity extends Activity {

    private static final int REQ_PICK = 1001;
    private static final String KS_ASSET = "crack.keystore";
    private static final String KS_PASS = "crack2026";

    private static final int C_TITLE = Color.parseColor("#1A1A2E");
    private static final int C_SUB = Color.parseColor("#6B7280");
    private static final int C_ACCENT = Color.parseColor("#4F46E5");
    private static final int C_ACCENT2 = Color.parseColor("#7C3AED");
    private static final int C_DANGER = Color.parseColor("#DC2626");
    private static final int C_WARN = Color.parseColor("#D97706");
    private static final int C_OK = Color.parseColor("#059669");
    private static final int C_CARD = Color.parseColor("#FFFFFF");
    private static final int C_PAGE = Color.parseColor("#F3F4F6");
    private static final int C_FIELD = Color.parseColor("#EEF0F4");

    private EditText etKey;
    private EditText etDevice;
    private Spinner spFormat;
    private Spinner spLength;
    private Spinner spCount;
    private TextView tvReport;
    private TextView tvCards;
    private TextView tvLog;
    private TextView tvCrackResult;
    private TextView tvOriginal;
    private Button btnInstall;
    private Button btnUninstall;
    private File pickedApk;
    private File crackedApk;
    private String pickedPkg;        // 从二进制 manifest 解析出的原版包名
    private String pickedLabel;
    private byte[] keystore;
    private final Handler ui = new Handler(Looper.getMainLooper());

    @Override
    protected void onCreate(Bundle b) {
        super.onCreate(b);
        try {
            keystore = readAsset(KS_ASSET);
        } catch (Exception e) {
            keystore = null;
        }
        buildUi();
    }

    private byte[] readAsset(String name) throws Exception {
        InputStream in = getAssets().open(name);
        try {
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) > 0) bos.write(buf, 0, n);
            return bos.toByteArray();
        } finally {
            in.close();
        }
    }

    // ==================== UI ====================

    private int dp(int v) {
        return (int) (v * getResources().getDisplayMetrics().density + 0.5f);
    }

    private GradientDrawable round(int color, int radius) {
        GradientDrawable g = new GradientDrawable();
        g.setColor(color);
        g.setCornerRadius(radius);
        return g;
    }

    private TextView tv(String text, int size, int color, boolean bold) {
        TextView t = new TextView(this);
        t.setText(text);
        t.setTextSize(size);
        t.setTextColor(color);
        if (bold) t.setTypeface(Typeface.DEFAULT_BOLD);
        t.setPadding(0, dp(4), 0, dp(4));
        return t;
    }

    /** 输入自动转大写（等价于隐藏 API android.text.AllCapsFilter，此处自实现以兼容 SDK）。 */
    private static class UpperCaseFilter implements InputFilter {
        @Override
        public CharSequence filter(CharSequence s, int start, int end, Spanned spanned,
                                  int dstart, int dend) {
            return s.toString().toUpperCase();
        }
    }

    private EditText field(String hint, boolean digitsOnly) {
        EditText e = new EditText(this);
        e.setHint(hint);
        e.setTextSize(15);
        e.setTextColor(C_TITLE);
        e.setHintTextColor(C_SUB);
        e.setBackgroundDrawable(round(C_FIELD, dp(12)));
        e.setPadding(dp(14), dp(12), dp(14), dp(12));
        e.setSingleLine(true);
        if (digitsOnly) {
            e.setKeyListener(DigitsKeyListener.getInstance("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"));
            e.setFilters(new InputFilter[]{new UpperCaseFilter(), new InputFilter.LengthFilter(16)});
        }
        return e;
    }

    private Button button(String text, int bg, View.OnClickListener l) {
        Button btn = new Button(this);
        btn.setText(text);
        btn.setTextSize(15);
        btn.setAllCaps(false);
        btn.setTypeface(Typeface.DEFAULT_BOLD);
        btn.setTextColor(Color.WHITE);
        btn.setBackgroundDrawable(round(bg, dp(14)));
        btn.setOnClickListener(l);
        return btn;
    }

    private void buildUi() {
        ScrollView scroll = new ScrollView(this);
        scroll.setBackgroundColor(C_PAGE);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        int p = dp(18);
        root.setPadding(p, dp(28), p, dp(28));
        scroll.addView(root, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView title = tv("解卡大师", 26, C_TITLE, true);
        title.setGravity(Gravity.CENTER);
        root.addView(title);
        root.addView(tv("针对 verify2 卡密模块 · 发卡 + 破解双模式", 13, C_SUB, false));

        // ---- 第一步：选择 APK ----
        root.addView(tv("第一步 · 选择被锁 APK", 16, C_ACCENT, true));
        root.addView(button("选择 APK 文件", C_ACCENT, new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent i = new Intent(Intent.ACTION_OPEN_DOCUMENT);
                i.addCategory(Intent.CATEGORY_OPENABLE);
                i.setType("*/*");
                startActivityForResult(i, REQ_PICK);
            }
        }));
        tvReport = tv("尚未选择文件", 13, C_SUB, false);
        root.addView(tvReport);

        // ---- 方式 A ----
        root.addView(tv("方式 A · 一键发卡（终身卡）", 16, C_ACCENT, true));
        root.addView(tv("从 APK 自动提取共享密钥；填入目标 App 弹窗显示的 16 位设备码，生成终身卡密。",
                12, C_SUB, false));
        etKey = field("共享密钥（自动提取，可手改）", false);
        root.addView(etKey);
        etDevice = field("目标设备码（16 位）", true);
        etDevice.setFilters(new InputFilter[]{new InputFilter.LengthFilter(16)});
        root.addView(etDevice);

        spFormat = spinner(root, new String[]{"字母+数字(32位推荐)", "字母+数字(16位)", "纯数字(16位)", "纯数字(10位)", "纯数字(32位)"});
        spLength = spinner(root, new String[]{"32 位", "16 位", "10 位"});
        spCount = spinner(root, new String[]{"生成 1 张", "生成 3 张", "生成 5 张", "生成 10 张"});

        root.addView(button("生成终身卡密", C_OK, new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                doGenerate();
            }
        }));
        tvCards = tv("", 13, C_TITLE, false);
        tvCards.setTextIsSelectable(true);
        tvCards.setTypeface(Typeface.MONOSPACE);
        tvCards.setBackgroundDrawable(round(C_CARD, dp(12)));
        tvCards.setPadding(dp(12), dp(12), dp(12), dp(12));
        tvCards.setVisibility(View.GONE);
        root.addView(tvCards);
        Button btnCopy = button("复制全部卡密", C_ACCENT2, new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                copyText(tvCards.getText().toString());
                Toast.makeText(MainActivity.this, "已复制，去目标 App 粘贴即可", Toast.LENGTH_SHORT).show();
            }
        });
        root.addView(btnCopy);

        // ---- 方式 B ----
        root.addView(tv("方式 B · 一键破解（免卡密）", 16, C_DANGER, true));
        root.addView(tv("直接修补验证模块：isValid / verifyInternal / isExpired 恒为真，"
                + "重打包并签名，输出破解版 APK。安装后点开直达原功能，无需任何卡密。", 12, C_SUB, false));
        root.addView(button("开始破解并输出 APK", C_DANGER, new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                doCrack();
            }
        }));
        tvCrackResult = tv("", 13, C_SUB, false);
        root.addView(tvCrackResult);
        tvOriginal = tv("", 12, C_SUB, false);
        root.addView(tvOriginal);
        btnUninstall = button("卸载原版", C_WARN, new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                confirmUninstall();
            }
        });
        btnUninstall.setVisibility(View.GONE);
        root.addView(btnUninstall);
        btnInstall = button("安装破解版", C_ACCENT, new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                installCracked();
            }
        });
        btnInstall.setVisibility(View.GONE);
        root.addView(btnInstall);

        // ---- 日志 ----
        root.addView(tv("运行日志", 16, C_TITLE, true));
        tvLog = tv("", 11, C_SUB, false);
        tvLog.setTypeface(Typeface.MONOSPACE);
        tvLog.setBackgroundDrawable(round(C_CARD, dp(12)));
        tvLog.setPadding(dp(12), dp(12), dp(12), dp(12));
        root.addView(tvLog);

        setContentView(scroll);
    }

    private Spinner spinner(LinearLayout parent, String[] items) {
        Spinner s = new Spinner(this);
        ArrayAdapter<String> ad = new ArrayAdapter<String>(this,
                android.R.layout.simple_spinner_item, items);
        ad.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        s.setAdapter(ad);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.topMargin = dp(8);
        parent.addView(s, lp);
        return s;
    }

    private void log(final String s) {
        ui.post(new Runnable() {
            @Override
            public void run() {
                tvLog.append(s + "\n");
            }
        });
    }

    private void copyText(String s) {
        ClipboardManager cm = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
        cm.setPrimaryClip(ClipData.newPlainText("卡密", s));
    }

    // ==================== 方式 A：发卡 ====================

    private CardFactory.Format currentFormat() {
        switch (spFormat.getSelectedItemPosition()) {
            case 1: return CardFactory.Format.ALPHA;
            case 2: return CardFactory.Format.DIGIT;
            case 3: return CardFactory.Format.DIGIT;
            case 4: return CardFactory.Format.DIGIT;
            default: return CardFactory.Format.ALPHA;
        }
    }

    private CardFactory.Length currentLength() {
        switch (spLength.getSelectedItemPosition()) {
            case 1: return CardFactory.Length.L16;
            case 2: return CardFactory.Length.L10;
            default: return CardFactory.Length.L32;
        }
    }

    private int currentCount() {
        switch (spCount.getSelectedItemPosition()) {
            case 0: return 1;
            case 1: return 3;
            case 2: return 5;
            default: return 10;
        }
    }

    private void doGenerate() {
        final String key = etKey.getText().toString().trim();
        final String dev = etDevice.getText().toString().trim().toUpperCase();
        if (key.isEmpty()) {
            Toast.makeText(this, "请先选择 APK 提取密钥，或手动输入共享密钥", Toast.LENGTH_SHORT).show();
            return;
        }
        if (!CardFactory.isValidDeviceCode(dev)) {
            Toast.makeText(this, "设备码必须为 16 位大写字母/数字", Toast.LENGTH_SHORT).show();
            return;
        }
        tvCards.setVisibility(View.VISIBLE);
        tvCards.setText("生成中 ...");
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    final List<String> cards = CardFactory.generateLifetime(
                            key, dev, currentFormat(), currentLength(), currentCount());
                    ui.post(new Runnable() {
                        @Override
                        public void run() {
                            StringBuilder sb = new StringBuilder();
                            sb.append("终身卡（类型 8 · 永久有效）\n");
                            for (String c : cards) sb.append(c).append("\n");
                            tvCards.setText(sb.toString().trim());
                            log("生成 " + cards.size() + " 张终身卡，设备码 " + dev);
                        }
                    });
                } catch (final Exception e) {
                    ui.post(new Runnable() {
                        @Override
                        public void run() {
                            tvCards.setText("生成失败: " + e.getMessage());
                            log("生成失败: " + e);
                        }
                    });
                }
            }
        }).start();
    }

    // ==================== 方式 B：破解 ====================

    private void doCrack() {
        if (pickedApk == null) {
            Toast.makeText(this, "请先选择被锁 APK", Toast.LENGTH_SHORT).show();
            return;
        }
        if (keystore == null) {
            Toast.makeText(this, "签名密钥库缺失，无法重签名", Toast.LENGTH_SHORT).show();
            return;
        }
        btnInstall.setVisibility(View.GONE);
        tvCrackResult.setText("破解中，请稍候 ...");
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    File dir = getExternalFilesDir(null);
                    String name = pickedApk.getName();
                    int dot = name.lastIndexOf('.');
                    String base = dot > 0 ? name.substring(0, dot) : name;
                    final File out = new File(dir, base + "_cracked.apk");
                    CrackEngine.crack(pickedApk, out, keystore, KS_PASS, new CrackEngine.Log() {
                        @Override
                        public void log(String s) {
                            MainActivity.this.log(s);
                        }
                    });
                    crackedApk = out;
                    ui.post(new Runnable() {
                        @Override
                        public void run() {
                            tvCrackResult.setText("破解完成:\n" + out.getAbsolutePath()
                                    + "\n(" + out.length() + " 字节)");
                            btnInstall.setVisibility(View.VISIBLE);
                            refreshOriginalState();
                        }
                    });
                } catch (final Throwable t) {
                    ui.post(new Runnable() {
                        @Override
                        public void run() {
                            tvCrackResult.setText("破解失败: " + t.getMessage());
                            log("破解失败: " + t);
                        }
                    });
                }
            }
        }).start();
    }

    // ==================== 原版卸载 ====================

    /**
     * 刷新原版安装状态：显示是否已装、label / 版本，并决定「卸载原版」按钮是否可见。
     */
    private void refreshOriginalState() {
        if (pickedPkg == null || pickedPkg.length() == 0) {
            tvOriginal.setText("未能从 APK 读出包名，无法提供卸载功能");
            btnUninstall.setVisibility(View.GONE);
            return;
        }
        OriginalApp.Info info = OriginalApp.probe(this, pickedPkg);
        info.matchesPickedApk = !pickedPkg.equals(getPackageName());
        if (info.installed) {
            String name = (info.label != null && info.label.length() > 0)
                    ? info.label : (pickedLabel != null ? pickedLabel : pickedPkg);
            StringBuilder sb = new StringBuilder();
            sb.append("检测到原版已安装\n");
            sb.append("应用名: ").append(name).append('\n');
            sb.append("包名: ").append(info.pkg).append('\n');
            sb.append("版本: ").append(info.versionName == null ? "?" : info.versionName)
              .append(" (code ").append(info.versionCode).append(')');
            tvOriginal.setText(sb.toString());
            btnUninstall.setText("卸载原版 · " + name);
            btnUninstall.setVisibility(View.VISIBLE);
        } else {
            tvOriginal.setText("包名: " + pickedPkg + "\n未检测到原版（可能已卸载）");
            btnUninstall.setVisibility(View.GONE);
        }
    }

    /** 点「卸载原版」：先弹自绘确认框，再拉起系统卸载页做二次确认。 */
    private void confirmUninstall() {
        if (pickedPkg == null) {
            Toast.makeText(this, "未读出包名，无法卸载", Toast.LENGTH_SHORT).show();
            return;
        }
        final OriginalApp.Info info = OriginalApp.probe(this, pickedPkg);
        final String title = title(info);

        new AlertDialog.Builder(this)
                .setTitle("确认卸载原版？")
                .setMessage("即将卸载：\n\n"
                        + "应用名：" + title + "\n"
                        + "包名：" + pickedPkg + "\n"
                        + (info.installed ? "版本：" + info.versionName : "") + "\n\n"
                        + "注意：\n"
                        + "· 卸载会删除该 App 的全部数据，不可恢复\n"
                        + "· 破解版与原版签名不同，不卸载无法安装\n"
                        + "· 建议先点「安装破解版」试装，被拒绝再卸载\n\n"
                        + "点击「去卸载」后将弹出系统确认页，在那里点「卸载」才会真正执行。")
                .setPositiveButton("去卸载", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface d, int which) {
                        launchUninstall(info);
                    }
                })
                .setNegativeButton("取消", null)
                .setNeutralButton("先卸载并安装", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface d, int which) {
                        launchUninstall(info);
                        // 稍后拉起安装器，让系统卸载页先行
                        ui.postDelayed(new Runnable() {
                            @Override
                            public void run() {
                                if (crackedApk != null) installCracked();
                            }
                        }, 1200);
                    }
                })
                .show();
    }

    private void launchUninstall(OriginalApp.Info info) {
        // 重新探测：确认框打开的这段时间里用户可能已在别处卸载
        if (info.installed) {
            OriginalApp.Info fresh = OriginalApp.probe(this, pickedPkg);
            if (!fresh.installed) {
                log("原版已不存在，跳过卸载");
                Toast.makeText(this, "原版已卸载", Toast.LENGTH_SHORT).show();
                refreshOriginalState();
                return;
            }
        }
        if (info.installed) {
            boolean ok = OriginalApp.requestUninstall(this, pickedPkg);
            if (ok) {
                log("已拉起系统卸载页: " + pickedPkg + "（请在系统页点「卸载」确认）");
                Toast.makeText(this, "请在系统页面点「卸载」", Toast.LENGTH_LONG).show();
            } else {
                log("拉起卸载页失败: " + pickedPkg);
                Toast.makeText(this, "无法拉起卸载界面，请到系统设置里手动卸载 "
                        + title(info), Toast.LENGTH_LONG).show();
            }
        } else {
            // 未检测到安装，可能是刚卸载完，直接推进到安装
            log("原版未安装，跳过卸载");
            if (crackedApk != null) {
                Toast.makeText(this, "原版未安装，可直接安装破解版", Toast.LENGTH_SHORT).show();
                installCracked();
            }
        }
    }

    private String title(OriginalApp.Info info) {
        if (info != null && info.label != null) return info.label;
        if (pickedLabel != null && pickedLabel.length() > 0) return pickedLabel;
        return pickedPkg;
    }

    private void installCracked() {
        if (crackedApk == null) return;
        // 守卫：原版仍在装时，安装必然被系统拒绝（签名不同），先引导卸载
        if (pickedPkg != null) {
            OriginalApp.Info info = OriginalApp.probe(this, pickedPkg);
            if (info.installed) {
                new AlertDialog.Builder(this)
                        .setTitle("需要先卸载原版")
                        .setMessage("检测到原版仍在安装：\n\n"
                                + title(info) + "\n" + pickedPkg + "\n\n"
                                + "破解版与原版签名不同，Android 不允许覆盖安装，"
                                + "直接安装会失败（提示「应用未安装」或签名冲突）。\n\n"
                                + "是否现在去卸载原版？卸载后再点「安装破解版」。")
                        .setPositiveButton("去卸载", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface d, int which) {
                                confirmUninstall();
                            }
                        })
                        .setNegativeButton("我已手动卸载", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface d, int which) {
                                refreshOriginalState();
                                doInstallNow();
                            }
                        })
                        .setNeutralButton("取消", null)
                        .show();
                return;
            }
        }
        doInstallNow();
    }

    private void doInstallNow() {
        try {
            Uri u = Uri.parse("content://" + CrackProvider.AUTHORITY + "/" + crackedApk.getName());
            Intent i = new Intent(Intent.ACTION_VIEW);
            i.setDataAndType(u, "application/vnd.android.package-archive");
            i.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            startActivity(i);
            log("已拉起安装器: " + crackedApk.getName());
        } catch (Exception e) {
            Toast.makeText(this, "无法启动安装器: " + e.getMessage(), Toast.LENGTH_LONG).show();
            log("安装失败: " + e);
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        // 从系统卸载页返回时，原版状态可能已变，刷新一次
        if (pickedPkg != null) refreshOriginalState();
    }

    // ==================== 文件选择 ====================

    @Override
    protected void onActivityResult(int req, int res, Intent data) {
        super.onActivityResult(req, res, data);
        if (req != REQ_PICK || res != RESULT_OK || data == null || data.getData() == null) return;
        final Uri uri = data.getData();
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    File cache = new File(getCacheDir(), "picked.apk");
                    InputStream in = getContentResolver().openInputStream(uri);
                    try {
                        FileOutputStream out = new FileOutputStream(cache);
                        try {
                            byte[] buf = new byte[8192];
                            int n;
                            while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
                        } finally {
                            out.close();
                        }
                    } finally {
                        in.close();
                    }
                    pickedApk = cache;
                    final ApkAnalyzer.Report r = ApkAnalyzer.scan(cache);
                    ui.post(new Runnable() {
                        @Override
                        public void run() {
                            StringBuilder sb = new StringBuilder();
                            sb.append("已选择: ").append(uri.getLastPathSegment()).append('\n');
                            sb.append("dex: ").append(r.allDexes).append('\n');
                            sb.append("卡密模块 dex: ").append(r.licenseDexes.isEmpty() ? "未检测到" : r.licenseDexes).append('\n');
                            sb.append("manifest 含验证页: ").append(r.hasGateInManifest).append('\n');
                            pickedPkg = r.pkgName;
                            pickedLabel = r.appLabel;
                            if (r.pkgName != null) {
                                sb.append("包名: ").append(r.pkgName).append('\n');
                                sb.append("应用名: ").append(r.appLabel == null ? "(取不到)" : r.appLabel).append('\n');
                                sb.append("版本: ").append(r.versionName == null ? "?" : r.versionName)
                                  .append(" (code ").append(r.versionCode).append(")\n");
                            }
                            if (r.cfgKey != null) {
                                sb.append("提取到共享密钥: ").append(r.cfgKey).append('\n');
                                etKey.setText(r.cfgKey);
                            } else {
                                sb.append("未找到 license_cfg.txt（可手动输入密钥）\n");
                            }
                            if (!r.licenseDexes.isEmpty()) {
                                sb.append("状态: 已识别为被注入应用，可发卡或直接破解");
                            } else {
                                sb.append("状态: 未识别到 verify2 模块（可能非本工具注入）");
                            }
                            tvReport.setText(sb.toString());
                            log("已加载 APK: " + cache.getAbsolutePath() + " (" + r.apkSize + " 字节)");
                            refreshOriginalState();
                        }
                    });
                } catch (final Throwable t) {
                    ui.post(new Runnable() {
                        @Override
                        public void run() {
                            tvReport.setText("读取失败: " + t.getMessage());
                        }
                    });
                }
            }
        }).start();
    }
}
