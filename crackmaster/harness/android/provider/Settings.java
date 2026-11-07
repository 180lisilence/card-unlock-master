package android.provider;

import android.content.ContentResolver;

/** JVM 测试桩。 */
public class Settings {
    public static class Secure {
        public static String getString(ContentResolver cr, String key) { return "stub_android_id"; }
    }
}
