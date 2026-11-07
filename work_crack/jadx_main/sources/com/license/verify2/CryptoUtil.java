package com.license.verify2;

import android.content.Context;
import android.os.Build;
import android.provider.Settings;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/* JADX WARN: Classes with same name are omitted, all sources:
  assets/payload.dex
  classes5.dex
 */
/* JADX INFO: loaded from: classes5.dex */
public class CryptoUtil {
    private static final String BASE36_CHARS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    private static String bytesToHex(byte[] bArr) {
        StringBuilder sb = new StringBuilder(bArr.length * 2);
        for (byte b : bArr) {
            sb.append(String.format("%02x", Integer.valueOf(b & 255)));
        }
        return sb.toString();
    }

    public static String deviceFingerprint(String str, int i, boolean z) {
        String strMd5 = md5(str + "::license_salt::" + str);
        return z ? extractDigits(strMd5, i) : extractBase36(strMd5, i);
    }

    public static String extractBase36(String str, int i) {
        try {
            String upperCase = new BigInteger(str, 16).toString(36).toUpperCase();
            while (upperCase.length() < i) {
                upperCase = "0" + upperCase;
            }
            return upperCase.substring(0, i);
        } catch (Exception e) {
            StringBuilder sb = new StringBuilder();
            for (int i2 = 0; i2 < i; i2++) {
                sb.append(BASE36_CHARS.charAt(i2 % 36));
            }
            return sb.toString();
        }
    }

    public static String extractDigits(String str, int i) {
        StringBuilder sb = new StringBuilder();
        for (char c : str.toCharArray()) {
            if (c >= '0' && c <= '9') {
                sb.append(c);
                if (sb.length() >= i) {
                    return sb.toString();
                }
            }
        }
        for (char c2 : str.toCharArray()) {
            if (sb.length() >= i) {
                break;
            }
            if (c2 >= 'a' && c2 <= 'f') {
                sb.append(((c2 - 'a') + 1) % 10);
            } else if (c2 >= 'A' && c2 <= 'F') {
                sb.append(((c2 - 'A') + 1) % 10);
            }
        }
        while (sb.length() < i) {
            sb.append('0');
        }
        return sb.toString();
    }

    public static long fromBase36(String str) {
        return Long.parseLong(str, 36);
    }

    public static String generateAndroidDeviceCode(Context context) {
        try {
            String string = Settings.Secure.getString(context.getContentResolver(), "android_id");
            if (string == null) {
                string = "";
            }
            StringBuilder sb = new StringBuilder();
            sb.append(string).append('|').append(Build.FINGERPRINT).append('|').append(Build.BOARD).append('|').append(Build.BRAND).append('|').append(Build.DEVICE).append('|').append(Build.MODEL).append('|').append(Build.PRODUCT).append('|').append(getSerialSafe());
            return extractBase36(md5(sb.toString()), 16);
        } catch (Exception e) {
            return extractBase36(md5(Build.FINGERPRINT + Build.MODEL), 16);
        }
    }

    private static String getSerialSafe() {
        try {
            return Build.getSerial();
        } catch (Exception e) {
            return "unknown";
        }
    }

    private static String hmac(String str, String str2, String str3) {
        try {
            Mac mac = Mac.getInstance(str);
            mac.init(new SecretKeySpec(str2.getBytes(StandardCharsets.UTF_8), str));
            return bytesToHex(mac.doFinal(str3.getBytes(StandardCharsets.UTF_8)));
        } catch (Exception e) {
            throw new RuntimeException(str + " 计算失败", e);
        }
    }

    public static String hmacMd5(String str, String str2) {
        return hmac("HmacMD5", str, str2);
    }

    public static String hmacSha1(String str, String str2) {
        return hmac("HmacSHA1", str, str2);
    }

    public static String hmacSha256(String str, String str2) {
        return hmac("HmacSHA256", str, str2);
    }

    public static boolean isValidDeviceCode(String str) {
        if (str == null || str.length() != 16) {
            return false;
        }
        for (char c : str.toCharArray()) {
            if (BASE36_CHARS.indexOf(c) < 0) {
                return false;
            }
        }
        return true;
    }

    public static String md5(String str) {
        try {
            return bytesToHex(MessageDigest.getInstance("MD5").digest(str.getBytes(StandardCharsets.UTF_8)));
        } catch (Exception e) {
            throw new RuntimeException("MD5 计算失败", e);
        }
    }

    public static String toBase36(long j, int i) {
        String upperCase = Long.toString(j, 36).toUpperCase();
        while (upperCase.length() < i) {
            upperCase = "0" + upperCase;
        }
        return upperCase.substring(upperCase.length() - i);
    }
}
