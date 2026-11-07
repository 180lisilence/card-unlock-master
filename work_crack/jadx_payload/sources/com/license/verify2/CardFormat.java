package com.license.verify2;

/* JADX INFO: loaded from: E:\gongxiangwenjianjia\com.licenseinjector.app\work_crack\dex_raw\assets\payload.dex */
public enum CardFormat {
    DIGIT_ONLY("纯数字", "0123456789"),
    ALPHA_NUMERIC("大写字母+数字", "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ");

    private final String charset;
    private final String displayName;

    CardFormat(String str, String str2) {
        this.displayName = str;
        this.charset = str2;
    }

    public static CardFormat detect(String str) {
        if (str == null) {
            return null;
        }
        if (DIGIT_ONLY.matches(str)) {
            return DIGIT_ONLY;
        }
        if (ALPHA_NUMERIC.matches(str)) {
            return ALPHA_NUMERIC;
        }
        return null;
    }

    public String getCharset() {
        return this.charset;
    }

    public String getDisplayName() {
        return this.displayName;
    }

    public boolean matches(String str) {
        if (str == null || str.isEmpty()) {
            return false;
        }
        for (char c : str.toCharArray()) {
            if (this.charset.indexOf(c) < 0) {
                return false;
            }
        }
        return true;
    }
}
