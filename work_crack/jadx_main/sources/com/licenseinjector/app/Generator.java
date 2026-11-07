package com.licenseinjector.app;

import com.license.verify2.CryptoUtil;
import java.security.SecureRandom;
import java.util.LinkedHashSet;

/* JADX INFO: loaded from: classes4.dex */
public final class Generator {
    private static final String BASE36 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static final SecureRandom RND = new SecureRandom();

    /* JADX INFO: renamed from: com.licenseinjector.app.Generator$1 */
    static /* synthetic */ class C00351 {
        static final /* synthetic */ int[] $SwitchMap$com$licenseinjector$app$Generator$Length;

        static {
            int[] iArr = new int[Length.values().length];
            $SwitchMap$com$licenseinjector$app$Generator$Length = iArr;
            try {
                iArr[Length.L10.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$licenseinjector$app$Generator$Length[Length.L16.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$licenseinjector$app$Generator$Length[Length.L32.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    public enum Format {
        DIGIT,
        ALPHA
    }

    public enum Length {
        L10,
        L16,
        L32
    }

    private Generator() {
    }

    public static String generate(String str, String str2, int i, Format format, Length length) {
        String strHmacMd5;
        if (str == null || str.isEmpty()) {
            throw new IllegalArgumentException("密钥不能为空");
        }
        if (str2 == null || str2.length() != 16) {
            throw new IllegalArgumentException("设备码必须为 16 位");
        }
        if (i < 0 || i > 9) {
            throw new IllegalArgumentException("卡类型编号需在 0-9 之间");
        }
        boolean z = format == Format.DIGIT;
        int[] iArrSegments = segments(format, length);
        int i2 = iArrSegments[0];
        int i3 = iArrSegments[1];
        int i4 = iArrSegments[2];
        int i5 = iArrSegments[3];
        int i6 = iArrSegments[4];
        StringBuilder sb = new StringBuilder();
        sb.append(z ? String.valueOf(i) : String.valueOf(BASE36.charAt(i % 36)));
        sb.append(CryptoUtil.deviceFingerprint(str2, i3, z));
        for (int i7 = 0; i7 < i5; i7++) {
            sb.append(randChar(z));
        }
        for (int i8 = 0; i8 < i4; i8++) {
            sb.append(randChar(z));
        }
        String string = sb.toString();
        switch (C00351.$SwitchMap$com$licenseinjector$app$Generator$Length[length.ordinal()]) {
            case 1:
                strHmacMd5 = CryptoUtil.hmacMd5(str, string + str2);
                break;
            case 2:
                strHmacMd5 = CryptoUtil.hmacSha1(str, string + str2);
                break;
            case 3:
                strHmacMd5 = CryptoUtil.hmacSha256(str, string + str2);
                break;
            default:
                throw new IllegalArgumentException("不支持的长度");
        }
        sb.append(z ? CryptoUtil.extractDigits(strHmacMd5, i6) : CryptoUtil.extractBase36(strHmacMd5, i6));
        return sb.toString();
    }

    public static String[] generateBatch(String str, String str2, int i, Format format, Length length, int i2) {
        long jMaxUnique = maxUnique(format, length);
        if (i2 > jMaxUnique) {
            throw new IllegalArgumentException("该格式最多可生成 " + jMaxUnique + " 张不重复卡密");
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        int iMin = (int) Math.min(2147483647L, Math.max(i2, jMaxUnique) * 4);
        for (int i3 = 0; linkedHashSet.size() < i2 && i3 < iMin; i3++) {
            linkedHashSet.add(generate(str, str2, i, format, length));
        }
        if (linkedHashSet.size() >= i2) {
            return (String[]) linkedHashSet.toArray(new String[0]);
        }
        throw new IllegalStateException("该格式最多可生成 " + jMaxUnique + " 张不重复卡密");
    }

    public static boolean isValidDeviceCode(String str) {
        return CryptoUtil.isValidDeviceCode(str);
    }

    public static long maxUnique(Format format, Length length) {
        int[] iArrSegments = segments(format, length);
        int i = iArrSegments[2] + iArrSegments[3];
        long j = format == Format.DIGIT ? 10L : 36L;
        long j2 = 1;
        for (int i2 = 0; i2 < i; i2++) {
            j2 *= j;
        }
        return j2;
    }

    private static char randChar(boolean z) {
        return z ? (char) (RND.nextInt(10) + 48) : BASE36.charAt(RND.nextInt(36));
    }

    private static int[] segments(Format format, Length length) {
        boolean z = format == Format.DIGIT;
        switch (C00351.$SwitchMap$com$licenseinjector$app$Generator$Length[length.ordinal()]) {
            case 1:
                return new int[]{1, 2, 1, 0, 6};
            case 2:
                return z ? new int[]{1, 3, 3, 0, 9} : new int[]{1, 3, 2, 0, 10};
            case 3:
                return z ? new int[]{1, 4, 6, 5, 16} : new int[]{1, 4, 4, 3, 20};
            default:
                throw new IllegalArgumentException("不支持的长度");
        }
    }
}
