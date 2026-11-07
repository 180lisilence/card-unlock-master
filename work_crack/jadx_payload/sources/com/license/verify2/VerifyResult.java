package com.license.verify2;

/* JADX INFO: loaded from: E:\gongxiangwenjianjia\com.licenseinjector.app\work_crack\dex_raw\assets\payload.dex */
public class VerifyResult {
    public String boundDeviceCode;
    public String cardTypeName;
    public long durationMillis;
    public String durationText;
    public long expireTime;
    public String formatName;
    public int length;
    public boolean lifetime;
    public String message;
    public boolean success;

    public VerifyResult() {
    }

    public VerifyResult(boolean z, String str) {
        this.success = z;
        this.message = str;
    }

    public static VerifyResult fail(String str) {
        return new VerifyResult(false, str);
    }

    public static VerifyResult ok(String str) {
        return new VerifyResult(true, str);
    }

    public String toString() {
        return "VerifyResult{success=" + this.success + ", message='" + this.message + "', cardType='" + this.cardTypeName + "', duration='" + this.durationText + "', format='" + this.formatName + "', length=" + this.length + "}";
    }
}
