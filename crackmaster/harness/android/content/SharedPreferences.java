package android.content;

/** JVM 测试桩。 */
public interface SharedPreferences {
    long getLong(String key, long def);
    String getString(String key, String def);
    boolean contains(String key);
    Editor edit();

    interface Editor {
        Editor putLong(String key, long value);
        Editor putString(String key, String value);
        Editor clear();
        void apply();
    }
}
