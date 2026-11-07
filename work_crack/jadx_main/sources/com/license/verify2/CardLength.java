package com.license.verify2;

/* JADX INFO: loaded from: assets/payload.dex */
public enum CardLength {
    LEN_10(10, "10位"),
    LEN_16(16, "16位"),
    LEN_32(32, "32位");

    private final String displayName;
    private final int length;

    CardLength(int i, String str) {
        this.length = i;
        this.displayName = str;
    }

    public static CardLength fromLength(int i) {
        for (CardLength cardLength : values()) {
            if (cardLength.length == i) {
                return cardLength;
            }
        }
        return null;
    }

    public String getDisplayName() {
        return this.displayName;
    }

    public int getLength() {
        return this.length;
    }
}
