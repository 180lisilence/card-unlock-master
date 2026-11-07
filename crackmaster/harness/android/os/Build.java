package android.os;

/** JVM 测试桩。 */
public class Build {
    public static final String FINGERPRINT = "test/fingerprint/1";
    public static final String BOARD = "testboard";
    public static final String BRAND = "testbrand";
    public static final String DEVICE = "testdevice";
    public static final String MODEL = "testmodel";
    public static final String PRODUCT = "testproduct";
    public static String SERIAL = "testserial";

    public static class VERSION {
        public static final int SDK_INT = 33;
    }

    public static String getSerial() { return SERIAL; }
}
