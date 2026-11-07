package com.crackmaster.app;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;

/**
 * 原版应用管理：检测是否已安装、按包名发起卸载。
 *
 * <p>破解版与原版签名不同，Android 不允许直接覆盖安装，所以装破解版前
 * 必须先卸载原版。本类负责：
 * <ol>
 *   <li>按包名查已安装应用（拿label / versionName 做二次确认展示）；</li>
 *   <li>调起系统卸载界面（{@code ACTION_DELETE} + {@code package:} URI），
 *       让用户在系统弹窗里二次确认，符合 Android 的卸载语义。</li>
 * </ol>
 *
 * <p>卸载动作本身始终由用户在系统弹窗点「卸载」完成，本类不静默卸载。
 */
public final class OriginalApp {

    /** 被检出的原版应用信息；未安装时 {@link #installed} 为 false。 */
    public static class Info {
        public boolean installed;
        public String pkg;
        public String label;        // 桌面显示名，取不到时为 null
        public String versionName;
        public long versionCode;
        /** 与手上这份 APK 相比是否同包（用于确认确实是同一个 App）。 */
        public boolean matchesPickedApk;
    }

    private OriginalApp() {}

    /** 按包名查询已安装应用。查不到或无权限时返回 installed=false，不抛异常。 */
    public static Info probe(Context ctx, String pkg) {
        Info info = new Info();
        info.pkg = pkg;
        if (ctx == null || pkg == null || pkg.length() == 0) return info;
        try {
            PackageManager pm = ctx.getPackageManager();
            PackageInfo pi = pm.getPackageInfo(pkg, 0);
            info.installed = true;
            info.versionName = pi.versionName;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                info.versionCode = pi.getLongVersionCode();
            } else {
                info.versionCode = pi.versionCode;
            }
            ApplicationInfo ai = pi.applicationInfo;
            if (ai != null && ai.loadLabel(pm) != null) {
                CharSequence cs = ai.loadLabel(pm);
                info.label = cs == null ? null : cs.toString();
            }
        } catch (Throwable t) {
            info.installed = false;
        }
        return info;
    }

    /**
     * 组装卸载 Intent。
     *
     * <p>用 {@code ACTION_DELETE} 而不是直接 {@code ACTION_UNINSTALL_PACKAGE}，
     * 前者是官方推荐路径（后者已在 API 24 标记废弃），二者最终都弹系统卸载确认页。
     *
     * @return 可启动的 Intent；pkg 非法时返回 null
     */
    public static Intent uninstallIntent(String pkg) {
        if (pkg == null || pkg.length() == 0) return null;
        Intent i = new Intent(Intent.ACTION_DELETE, Uri.parse("package:" + pkg));
        i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        return i;
    }

    /** 拉起系统卸载界面，用户在系统弹窗里点确认后才会真正卸载。 */
    public static boolean requestUninstall(Context ctx, String pkg) {
        Intent i = uninstallIntent(pkg);
        if (i == null || ctx == null) return false;
        try {
            ctx.startActivity(i);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }
}