package com.license.verify2;

import android.content.Context;
import android.content.SharedPreferences;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/* JADX INFO: loaded from: E:\gongxiangwenjianjia\com.licenseinjector.app\work_crack\dex_raw\assets\payload.dex */
public class LicenseVerify {
    public static final int DEVICE_CODE_LENGTH = 16;
    private static final String KEY_ACTIVATE_TIME = "activate_time";
    private static final String KEY_CARD_CODE = "card_code";
    private static final String KEY_DEVICE_CODE = "device_code";
    private static final String KEY_FIRST_PREFIX = "first_";
    public static final String MODULE_VERSION = "v5";
    private static final String PREFS_NAME = "license_verify_data";
    private static String secretKey = null;
    private static String cachedDeviceCode = null;

    public static VerifyResult activate(Context context, String str) {
        String deviceCode = getDeviceCode(context);
        VerifyResult verifyResultVerify = verify(str, deviceCode);
        if (!verifyResultVerify.success) {
            return verifyResultVerify;
        }
        long jCurrentTimeMillis = System.currentTimeMillis();
        SharedPreferences prefs = getPrefs(context);
        String str2 = KEY_FIRST_PREFIX + str;
        long j = prefs.getLong(str2, 0L);
        long j2 = prefs.getLong(KEY_ACTIVATE_TIME, 0L);
        String string = prefs.getString(KEY_CARD_CODE, null);
        boolean z = j != 0 || (str.equals(string) && j2 > 0);
        long[] jArrResolveActivationTime = resolveActivationTime(str, deviceCode, j, j2, string, jCurrentTimeMillis);
        if (jArrResolveActivationTime == null) {
            return VerifyResult.fail("卡密已过期");
        }
        prefs.edit().putLong(str2, jArrResolveActivationTime[0]).putLong(KEY_ACTIVATE_TIME, jArrResolveActivationTime[0]).putString(KEY_CARD_CODE, str).putString(KEY_DEVICE_CODE, deviceCode).apply();
        verifyResultVerify.expireTime = jArrResolveActivationTime[1];
        verifyResultVerify.message = "激活成功：" + verifyResultVerify.cardTypeName + (z ? "（沿用首次计时）" : "（首次激活）") + " 到期 " + formatExpireTime(jArrResolveActivationTime[1]);
        return verifyResultVerify;
    }

    public static long calculateExpireTime(String str, String str2, long j) {
        CardType cardType = parseCardType(str, str2);
        if (cardType.isLifetime()) {
            return Long.MAX_VALUE;
        }
        return j + cardType.getDurationMillis();
    }

    private static void checkInit() {
        if (secretKey == null) {
            throw new IllegalStateException("请先调用 LicenseVerify.init(secretKey)");
        }
    }

    public static void clearActivation(Context context) {
        getPrefs(context).edit().clear().apply();
    }

    private static String computeHash(String str, CardLength cardLength) {
        switch (cardLength) {
            case LEN_10:
                return CryptoUtil.hmacMd5(secretKey, str);
            case LEN_16:
                return CryptoUtil.hmacSha1(secretKey, str);
            case LEN_32:
                return CryptoUtil.hmacSha256(secretKey, str);
            default:
                throw new IllegalArgumentException("不支持的长度");
        }
    }

    public static String formatExpireTime(long j) {
        return j == Long.MAX_VALUE ? "永久" : new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault()).format(new Date(j));
    }

    public static long getActivateTime(Context context) {
        return getPrefs(context).getLong(KEY_ACTIVATE_TIME, 0L);
    }

    public static String getActivatedDeviceCode(Context context) {
        return getPrefs(context).getString(KEY_DEVICE_CODE, null);
    }

    public static String getAppName(Context context) {
        try {
            return context.getPackageManager().getApplicationLabel(context.getApplicationInfo()).toString();
        } catch (Exception e) {
            return "";
        }
    }

    public static String getCurrentCardCode(Context context) {
        return getPrefs(context).getString(KEY_CARD_CODE, null);
    }

    public static String getCurrentExpireText(Context context) {
        return !isActivated(context) ? "未激活" : formatExpireTime(calculateExpireTime(getCurrentCardCode(context), getDeviceCode(context), getActivateTime(context)));
    }

    public static String getCurrentRemainingText(Context context) {
        return !isActivated(context) ? "未激活" : getRemainingTimeText(getCurrentCardCode(context), getDeviceCode(context), getActivateTime(context), System.currentTimeMillis());
    }

    public static String getDeviceCode(Context context) {
        if (cachedDeviceCode != null) {
            return cachedDeviceCode;
        }
        cachedDeviceCode = CryptoUtil.generateAndroidDeviceCode(context);
        return cachedDeviceCode;
    }

    private static SharedPreferences getPrefs(Context context) {
        return context.getSharedPreferences(PREFS_NAME, 0);
    }

    public static String getRemainingTimeText(String str, String str2, long j, long j2) {
        if (parseCardType(str, str2).isLifetime()) {
            return "永久有效";
        }
        long jCalculateExpireTime = calculateExpireTime(str, str2, j) - j2;
        if (jCalculateExpireTime <= 0) {
            return "已过期";
        }
        long j3 = jCalculateExpireTime / 86400000;
        long j4 = (jCalculateExpireTime % 86400000) / 3600000;
        long j5 = (jCalculateExpireTime % 3600000) / 60000;
        if (j3 > 0) {
            return String.format(Locale.getDefault(), "还剩 %d天%d小时%d分", Long.valueOf(j3), Long.valueOf(j4), Long.valueOf(j5));
        }
        Locale locale = Locale.getDefault();
        return j4 > 0 ? String.format(locale, "还剩 %d小时%d分", Long.valueOf(j4), Long.valueOf(j5)) : String.format(locale, "还剩 %d分", Long.valueOf(j5));
    }

    private static int[] getSegments(CardFormat cardFormat, CardLength cardLength) {
        boolean z = cardFormat == CardFormat.DIGIT_ONLY;
        switch (cardLength) {
            case LEN_10:
                return new int[]{1, 2, 1, 0, 6};
            case LEN_16:
                return z ? new int[]{1, 3, 3, 0, 9} : new int[]{1, 3, 2, 0, 10};
            case LEN_32:
                return z ? new int[]{1, 4, 6, 5, 16} : new int[]{1, 4, 4, 3, 20};
            default:
                throw new IllegalArgumentException("不支持的长度");
        }
    }

    public static void init(String str) {
        if (str == null || str.trim().isEmpty()) {
            throw new IllegalArgumentException("密钥不能为空");
        }
        secretKey = str;
    }

    public static boolean isActivated(Context context) {
        return getPrefs(context).contains(KEY_ACTIVATE_TIME);
    }

    public static boolean isExpired(String str, String str2, long j, long j2) {
        return !parseCardType(str, str2).isLifetime() && j2 >= calculateExpireTime(str, str2, j);
    }

    public static boolean isInitialized() {
        return secretKey != null;
    }

    public static boolean isValid(Context context) {
        if (!isActivated(context)) {
            return false;
        }
        String currentCardCode = getCurrentCardCode(context);
        String activatedDeviceCode = getActivatedDeviceCode(context);
        String deviceCode = getDeviceCode(context);
        long activateTime = getActivateTime(context);
        if (currentCardCode == null || activateTime == 0) {
            return false;
        }
        if ((activatedDeviceCode == null || activatedDeviceCode.equals(deviceCode)) && validateFormat(currentCardCode, deviceCode)) {
            return !isExpired(currentCardCode, deviceCode, activateTime, System.currentTimeMillis());
        }
        return false;
    }

    public static CardType parseCardType(String str, String str2) {
        if (validateFormat(str, str2)) {
            return parseCardTypeInternal(str, CardFormat.detect(str));
        }
        throw new IllegalArgumentException("卡密无效");
    }

    private static CardType parseCardTypeInternal(String str, CardFormat cardFormat) {
        String strSubstring = str.substring(0, 1);
        return CardType.fromCode(cardFormat == CardFormat.DIGIT_ONLY ? Integer.parseInt(strSubstring) : (int) CryptoUtil.fromBase36(strSubstring));
    }

    public static long[] resolveActivationTime(String str, String str2, long j, long j2, String str3, long j3) {
        if (j == 0) {
            j = (!str.equals(str3) || j2 <= 0) ? j3 : j2;
        }
        long jCalculateExpireTime = calculateExpireTime(str, str2, j);
        if (parseCardType(str, str2).isLifetime() || j3 < jCalculateExpireTime) {
            return new long[]{j, jCalculateExpireTime};
        }
        return null;
    }

    public static String statusText(Context context) {
        if (!isActivated(context)) {
            return "许可模块 v5  ·  当前状态：未激活";
        }
        String currentCardCode = getCurrentCardCode(context);
        if (currentCardCode != null && currentCardCode.length() > 8) {
            currentCardCode = currentCardCode.substring(0, 8) + "…";
        }
        return "许可模块 v5  ·  上次卡密 " + currentCardCode + "  ·  " + getCurrentRemainingText(context) + "  ·  到期 " + getCurrentExpireText(context);
    }

    public static boolean validateFormat(String str, String str2) {
        if (str == null || !CryptoUtil.isValidDeviceCode(str2)) {
            return false;
        }
        CardFormat cardFormatDetect = CardFormat.detect(str);
        CardLength cardLengthFromLength = CardLength.fromLength(str.length());
        if (cardFormatDetect == null || cardLengthFromLength == null) {
            return false;
        }
        try {
            return verifyInternal(str, str2, cardFormatDetect, cardLengthFromLength);
        } catch (Exception e) {
            return false;
        }
    }

    public static VerifyResult verify(String str, String str2) {
        checkInit();
        if (str == null || str.isEmpty()) {
            return VerifyResult.fail("请输入卡密");
        }
        if (!CryptoUtil.isValidDeviceCode(str2)) {
            return VerifyResult.fail("设备码无效（应为16位大写字母和数字组合）");
        }
        CardFormat cardFormatDetect = CardFormat.detect(str);
        CardLength cardLengthFromLength = CardLength.fromLength(str.length());
        if (cardFormatDetect == null) {
            return VerifyResult.fail("卡密包含非法字符（仅支持纯数字或大写字母+数字）");
        }
        if (cardLengthFromLength == null) {
            return VerifyResult.fail("卡密长度应为10/16/32位，当前" + str.length() + "位");
        }
        try {
            if (!verifyInternal(str, str2, cardFormatDetect, cardLengthFromLength)) {
                return VerifyResult.fail("卡密无效、密钥错误或设备不匹配");
            }
            try {
                CardType cardTypeInternal = parseCardTypeInternal(str, cardFormatDetect);
                VerifyResult verifyResultOk = VerifyResult.ok("验证通过");
                verifyResultOk.cardTypeName = cardTypeInternal.getName();
                verifyResultOk.durationText = cardTypeInternal.getDurationText();
                verifyResultOk.boundDeviceCode = str2;
                verifyResultOk.durationMillis = cardTypeInternal.getDurationMillis();
                verifyResultOk.lifetime = cardTypeInternal.isLifetime();
                verifyResultOk.formatName = cardFormatDetect.getDisplayName();
                verifyResultOk.length = cardLengthFromLength.getLength();
                return verifyResultOk;
            } catch (Exception e) {
                return VerifyResult.fail("未知卡类型");
            }
        } catch (Exception e2) {
            return VerifyResult.fail("卡密验证异常: " + e2.getMessage());
        }
    }

    private static boolean verifyInternal(String str, String str2, CardFormat cardFormat, CardLength cardLength) {
        int[] segments = getSegments(cardFormat, cardLength);
        int i = segments[0];
        int i2 = segments[1];
        int i3 = segments[2];
        int i4 = segments[3];
        int i5 = segments[4];
        int i6 = i + 0;
        String strSubstring = str.substring(0, i6);
        int i7 = i6 + i2;
        String strSubstring2 = str.substring(i6, i7);
        String strSubstring3 = i4 > 0 ? str.substring(i7, i7 + i4) : "";
        int i8 = i7 + i4;
        String strSubstring4 = i3 > 0 ? str.substring(i8, i8 + i3) : "";
        String strSubstring5 = str.substring(i8 + i3);
        String str3 = strSubstring + strSubstring2 + strSubstring3 + strSubstring4;
        boolean z = cardFormat == CardFormat.DIGIT_ONLY;
        if (!CryptoUtil.deviceFingerprint(str2, i2, z).equals(strSubstring2)) {
            return false;
        }
        String strComputeHash = computeHash(str3 + str2, cardLength);
        return (z ? CryptoUtil.extractDigits(strComputeHash, i5) : CryptoUtil.extractBase36(strComputeHash, i5)).equals(strSubstring5);
    }
}
