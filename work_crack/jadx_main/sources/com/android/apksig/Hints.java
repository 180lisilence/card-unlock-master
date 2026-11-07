package com.android.apksig;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes.dex */
public final class Hints {
    public static final String PIN_BYTE_RANGE_ZIP_ENTRY_NAME = "pinlist.meta";
    public static final String PIN_HINT_ASSET_ZIP_ENTRY_NAME = "assets/com.android.hints.pins.txt";

    public static final class ByteRange {
        final long end;
        final long start;

        public ByteRange(long j, long j2) {
            this.start = j;
            this.end = j2;
        }
    }

    public static final class PatternWithRange {
        final long offset;
        final Pattern pattern;
        final long size;

        public PatternWithRange(String str) {
            this.pattern = Pattern.compile(str);
            this.offset = 0L;
            this.size = Long.MAX_VALUE;
        }

        public PatternWithRange(String str, long j, long j2) {
            this.pattern = Pattern.compile(str);
            this.offset = j;
            this.size = j2;
        }

        public ByteRange ClampToAbsoluteByteRange(ByteRange byteRange) {
            if (byteRange.end - byteRange.start < this.offset) {
                return null;
            }
            long j = byteRange.start + this.offset;
            return new ByteRange(j, j + Math.min(byteRange.end - j, this.size));
        }

        public Matcher matcher(CharSequence charSequence) {
            return this.pattern.matcher(charSequence);
        }
    }

    private static int clampToInt(long j) {
        return (int) Math.max(0L, Math.min(j, 2147483647L));
    }

    public static byte[] encodeByteRangeList(List<ByteRange> list) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(list.size() * 8);
        DataOutputStream dataOutputStream = new DataOutputStream(byteArrayOutputStream);
        try {
            for (ByteRange byteRange : list) {
                dataOutputStream.writeInt(clampToInt(byteRange.start));
                dataOutputStream.writeInt(clampToInt(byteRange.end - byteRange.start));
            }
            return byteArrayOutputStream.toByteArray();
        } catch (IOException e) {
            throw new AssertionError("impossible", e);
        }
    }

    public static ArrayList<PatternWithRange> parsePinPatterns(byte[] bArr) {
        ArrayList<PatternWithRange> arrayList = new ArrayList<>();
        try {
            try {
                String[] strArrSplit = new String(bArr, "UTF-8").split("\n");
                int length = strArrSplit.length;
                char c = 0;
                int i = 0;
                while (i < length) {
                    String strReplaceFirst = strArrSplit[i].replaceFirst("#.*", "");
                    String[] strArrSplit2 = strReplaceFirst.split(" ");
                    if (strArrSplit2.length == 1) {
                        arrayList.add(new PatternWithRange(strArrSplit2[c]));
                    } else {
                        if (strArrSplit2.length != 3) {
                            throw new AssertionError("bad pin pattern line " + strReplaceFirst);
                        }
                        long j = Long.parseLong(strArrSplit2[1]);
                        arrayList.add(new PatternWithRange(strArrSplit2[c], j, Long.parseLong(strArrSplit2[2]) - j));
                    }
                    i++;
                    c = 0;
                }
                return arrayList;
            } catch (UnsupportedEncodingException e) {
                e = e;
                throw new RuntimeException("UTF-8 must be supported", e);
            }
        } catch (UnsupportedEncodingException e2) {
            e = e2;
        }
    }
}
