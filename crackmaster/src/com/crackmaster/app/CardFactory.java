package com.crackmaster.app;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/**
 * 卡密工厂 —— 与 com.license.verify2 的算法逐位对齐（1:1 移植）。
 *
 * 卡密结构（来自 LicenseVerify.getSegments / verifyInternal）：
 *   [类型位 1 位][设备指纹段][随机段 A][随机段 B][HMAC 校验段]
 *
 * 校验逻辑（verifyInternal）：
 *   s2 必须等于 deviceFingerprint(deviceCode, n, digitOnly)
 *   s5 必须等于 extract(HMAC(key, s1+s2+s3+s4 + deviceCode), m)
 */
public final class CardFactory {

    public static final String BASE36 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final Charset UTF8 = Charset.forName("UTF-8");
    private static final SecureRandom RND = new SecureRandom();

    public enum Format { DIGIT, ALPHA }
    public enum Length { L10, L16, L32 }

    /** 终身卡类型编号（CardType.LIFETIME_CARD.code = 8）。 */
    public static final int TYPE_LIFETIME = 8;

    private CardFactory() {}

    // ==================== CryptoUtil 1:1 移植 ====================

    public static String md5(String s) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] d = md.digest(s.getBytes(UTF8));
            StringBuilder sb = new StringBuilder(d.length * 2);
            for (byte b : d) sb.append(String.format("%02x", Integer.valueOf(b & 255)));
            return sb.toString();
        } catch (Exception e) {
            throw new RuntimeException("MD5 计算失败", e);
        }
    }

    private static String hmac(String alg, String key, String data) {
        try {
            Mac mac = Mac.getInstance(alg);
            mac.init(new SecretKeySpec(key.getBytes(UTF8), alg));
            byte[] d = mac.doFinal(data.getBytes(UTF8));
            StringBuilder sb = new StringBuilder(d.length * 2);
            for (byte b : d) sb.append(String.format("%02x", Integer.valueOf(b & 255)));
            return sb.toString();
        } catch (Exception e) {
            throw new RuntimeException(alg + " 计算失败", e);
        }
    }

    public static String hmacMd5(String key, String data) { return hmac("HmacMD5", key, data); }
    public static String hmacSha1(String key, String data) { return hmac("HmacSHA1", key, data); }
    public static String hmacSha256(String key, String data) { return hmac("HmacSHA256", key, data); }

    /** 与 CryptoUtil.extractDigits 完全一致：先取 hex 中数字字符，不足再映射 a-f。 */
    public static String extractDigits(String hex, int n) {
        StringBuilder sb = new StringBuilder();
        for (char c : hex.toCharArray()) {
            if (c >= '0' && c <= '9') {
                sb.append(c);
                if (sb.length() >= n) return sb.toString();
            }
        }
        for (char c : hex.toCharArray()) {
            if (sb.length() >= n) break;
            if (c >= 'a' && c <= 'f') sb.append((char) (((c - 'a') + 1) % 10 + '0'));
            else if (c >= 'A' && c <= 'F') sb.append((char) (((c - 'A') + 1) % 10 + '0'));
        }
        while (sb.length() < n) sb.append('0');
        return sb.toString();
    }

    /** 与 CryptoUtil.extractBase36 完全一致：BigInteger(hex,16) → base36 → 大写 → 左补零截取。 */
    public static String extractBase36(String hex, int n) {
        try {
            java.math.BigInteger bi = new java.math.BigInteger(hex, 16);
            String s = bi.toString(36).toUpperCase(Locale.US);
            while (s.length() < n) s = "0" + s;
            return s.substring(0, n);
        } catch (Exception e) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < n; i++) sb.append(BASE36.charAt(i % 36));
            return sb.toString();
        }
    }

    /** deviceFingerprint：md5(deviceCode + "::license_salt::" + deviceCode) 提取。 */
    public static String deviceFingerprint(String deviceCode, int n, boolean digitOnly) {
        String h = md5(deviceCode + "::license_salt::" + deviceCode);
        return digitOnly ? extractDigits(h, n) : extractBase36(h, n);
    }

    public static boolean isValidDeviceCode(String s) {
        if (s == null || s.length() != 16) return false;
        for (char c : s.toCharArray()) if (BASE36.indexOf(c) < 0) return false;
        return true;
    }

    // ==================== 分段表（与 LicenseVerify.getSegments 一致） ====================
    // 返回 {类型位长, 设备指纹长, 随机段B长, 随机段A长, 校验段长}

    public static int[] segments(Format format, Length length) {
        boolean digit = format == Format.DIGIT;
        switch (length) {
            case L10: return new int[]{1, 2, 1, 0, 6};
            case L16: return digit ? new int[]{1, 3, 3, 0, 9} : new int[]{1, 3, 2, 0, 10};
            case L32: return digit ? new int[]{1, 4, 6, 5, 16} : new int[]{1, 4, 4, 3, 20};
            default: throw new IllegalArgumentException("不支持的长度");
        }
    }

    private static String computeHash(String key, String data, Length length) {
        switch (length) {
            case L10: return hmacMd5(key, data);
            case L16: return hmacSha1(key, data);
            case L32: return hmacSha256(key, data);
            default: throw new IllegalArgumentException("不支持的长度");
        }
    }

    private static char randChar(boolean digit) {
        return digit ? (char) ('0' + RND.nextInt(10)) : BASE36.charAt(RND.nextInt(36));
    }

    private static char typeChar(int typeCode, Format format) {
        if (typeCode < 0 || typeCode > 9) throw new IllegalArgumentException("卡类型编号需在 0-9 之间");
        return format == Format.DIGIT ? (char) ('0' + typeCode) : BASE36.charAt(typeCode % 36);
    }

    /**
     * 生成一张卡密。与 Generator.generate 结构完全一致。
     *
     * @param key        共享密钥（注入时使用的密钥）
     * @param deviceCode 目标设备码（16 位大写字母+数字）
     * @param typeCode   卡类型编号，8 = 终身卡
     */
    public static String generate(String key, String deviceCode, int typeCode, Format format, Length length) {
        if (key == null || key.isEmpty()) throw new IllegalArgumentException("密钥不能为空");
        if (deviceCode == null || deviceCode.length() != 16) throw new IllegalArgumentException("设备码必须为 16 位");
        boolean digit = format == Format.DIGIT;
        int[] seg = segments(format, length);
        int typeLen = seg[0], fpLen = seg[1], randBLen = seg[2], randALen = seg[3], chkLen = seg[4];
        StringBuilder sb = new StringBuilder();
        sb.append(typeChar(typeCode, format));
        sb.append(deviceFingerprint(deviceCode, fpLen, digit));
        for (int i = 0; i < randALen; i++) sb.append(randChar(digit));
        for (int i = 0; i < randBLen; i++) sb.append(randChar(digit));
        String body = sb.toString();
        String hash = computeHash(key, body + deviceCode, length);
        sb.append(digit ? extractDigits(hash, chkLen) : extractBase36(hash, chkLen));
        return sb.toString();
    }

    /** 批量生成（去重）。 */
    public static List<String> generateBatch(String key, String deviceCode, int typeCode,
                                             Format format, Length length, int count) {
        List<String> out = new ArrayList<String>();
        int guard = count * 50 + 100;
        while (out.size() < count && guard-- > 0) {
            String c = generate(key, deviceCode, typeCode, format, length);
            if (!out.contains(c)) out.add(c);
        }
        if (out.size() < count) throw new IllegalStateException("生成数量不足，请调整格式/长度");
        return out;
    }

    /** 便捷方法：直接生成终身卡。 */
    public static List<String> generateLifetime(String key, String deviceCode,
                                                Format format, Length length, int count) {
        return generateBatch(key, deviceCode, TYPE_LIFETIME, format, length, count);
    }

    public static String typeName(int typeCode) {
        switch (typeCode) {
            case 0: return "分钟卡";
            case 1: return "小时卡";
            case 2: return "天卡";
            case 3: return "周卡";
            case 4: return "月卡";
            case 5: return "季卡";
            case 6: return "半年卡";
            case 7: return "年卡";
            case 8: return "终身卡";
            case 9: return "自定义卡";
            default: return "未知";
        }
    }
}
