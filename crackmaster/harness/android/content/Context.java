package android.content;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;

/** JVM 测试桩。 */
public abstract class Context {
    public abstract SharedPreferences getSharedPreferences(String name, int mode);
    public PackageManager getPackageManager() { return new PackageManager(); }
    public ApplicationInfo getApplicationInfo() { return new ApplicationInfo(); }
    public ContentResolver getContentResolver() { return new ContentResolver(); }
}
