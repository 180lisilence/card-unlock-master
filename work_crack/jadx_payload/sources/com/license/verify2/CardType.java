package com.license.verify2;

/* JADX INFO: loaded from: E:\gongxiangwenjianjia\com.licenseinjector.app\work_crack\dex_raw\assets\payload.dex */
public enum CardType {
    MINUTE_CARD(0, "分钟卡", "1分钟", 60000),
    HOUR_CARD(1, "小时卡", "1小时", 3600000),
    DAY_CARD(2, "天卡", "1天", 86400000),
    WEEK_CARD(3, "周卡", "7天", 604800000),
    MONTH_CARD(4, "月卡", "30天", 2592000000L),
    QUARTER_CARD(5, "季卡", "90天", 7776000000L),
    HALF_YEAR_CARD(6, "半年卡", "180天", 15552000000L),
    YEAR_CARD(7, "年卡", "365天", 31536000000L),
    LIFETIME_CARD(8, "终身卡", "永久", -1),
    CUSTOM_CARD(9, "自定义卡", "自定义", -2);

    private final int code;
    private final long durationMillis;
    private final String durationText;
    private final String name;

    CardType(int i, String str, String str2, long j) {
        this.code = i;
        this.name = str;
        this.durationText = str2;
        this.durationMillis = j;
    }

    public static CardType fromCode(int i) {
        for (CardType cardType : values()) {
            if (cardType.code == i) {
                return cardType;
            }
        }
        throw new IllegalArgumentException("未知卡类型编号: " + i);
    }

    public int getCode() {
        return this.code;
    }

    public long getDurationMillis() {
        return this.durationMillis;
    }

    public String getDurationText() {
        return this.durationText;
    }

    public String getName() {
        return this.name;
    }

    public boolean isLifetime() {
        return this.durationMillis == -1;
    }
}
