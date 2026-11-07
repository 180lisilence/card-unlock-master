package com.android.apksig.internal.jar;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.jar.Attributes;

/* JADX INFO: loaded from: classes.dex */
public class ManifestParser {
    private static final byte[] EMPTY_BYTE_ARRAY = new byte[0];
    private byte[] mBufferedLine;
    private int mEndOffset;
    private final byte[] mManifest;
    private int mOffset;

    public static class Attribute {
        private final String mName;
        private final String mValue;

        public Attribute(String str, String str2) {
            this.mName = str;
            this.mValue = str2;
        }

        public String getName() {
            return this.mName;
        }

        public String getValue() {
            return this.mValue;
        }
    }

    public static class Section {
        private final List<Attribute> mAttributes;
        private final String mName;
        private final int mSizeBytes;
        private final int mStartOffset;

        public Section(int i, int i2, List<Attribute> list) {
            this.mStartOffset = i;
            this.mSizeBytes = i2;
            String value = null;
            if (!list.isEmpty()) {
                Attribute attribute = list.get(0);
                if ("Name".equalsIgnoreCase(attribute.getName())) {
                    value = attribute.getValue();
                }
            }
            this.mName = value;
            this.mAttributes = Collections.unmodifiableList(new ArrayList(list));
        }

        public String getAttributeValue(String str) {
            for (Attribute attribute : this.mAttributes) {
                if (attribute.getName().equalsIgnoreCase(str)) {
                    return attribute.getValue();
                }
            }
            return null;
        }

        public String getAttributeValue(Attributes.Name name) {
            return getAttributeValue(name.toString());
        }

        public List<Attribute> getAttributes() {
            return this.mAttributes;
        }

        public String getName() {
            return this.mName;
        }

        public int getSizeBytes() {
            return this.mSizeBytes;
        }

        public int getStartOffset() {
            return this.mStartOffset;
        }
    }

    public ManifestParser(byte[] bArr) {
        this(bArr, 0, bArr.length);
    }

    public ManifestParser(byte[] bArr, int i, int i2) {
        this.mManifest = bArr;
        this.mOffset = i;
        this.mEndOffset = i + i2;
    }

    private static byte[] concat(byte[] bArr, byte[] bArr2, int i, int i2) {
        byte[] bArr3 = new byte[bArr.length + i2];
        System.arraycopy(bArr, 0, bArr3, 0, bArr.length);
        System.arraycopy(bArr2, i, bArr3, bArr.length, i2);
        return bArr3;
    }

    private static Attribute parseAttr(String str) {
        int iIndexOf = str.indexOf(": ");
        return iIndexOf == -1 ? new Attribute(str, "") : new Attribute(str.substring(0, iIndexOf), str.substring(": ".length() + iIndexOf));
    }

    private String readAttribute() {
        byte[] attributeBytes = readAttributeBytes();
        if (attributeBytes == null) {
            return null;
        }
        return attributeBytes.length == 0 ? "" : new String(attributeBytes, StandardCharsets.UTF_8);
    }

    private byte[] readAttributeBytes() {
        byte[] bArrConcat;
        byte[] bArr = this.mBufferedLine;
        if (bArr != null && bArr.length == 0) {
            this.mBufferedLine = null;
            return EMPTY_BYTE_ARRAY;
        }
        byte[] line = readLine();
        if (line == null) {
            if (this.mBufferedLine == null) {
                return null;
            }
            byte[] bArr2 = this.mBufferedLine;
            this.mBufferedLine = null;
            return bArr2;
        }
        if (line.length == 0) {
            if (this.mBufferedLine == null) {
                return EMPTY_BYTE_ARRAY;
            }
            byte[] bArr3 = this.mBufferedLine;
            this.mBufferedLine = EMPTY_BYTE_ARRAY;
            return bArr3;
        }
        if (this.mBufferedLine == null) {
            bArrConcat = line;
        } else {
            if (line.length == 0 || line[0] != 32) {
                byte[] bArr4 = this.mBufferedLine;
                this.mBufferedLine = line;
                return bArr4;
            }
            byte[] bArr5 = this.mBufferedLine;
            this.mBufferedLine = null;
            bArrConcat = concat(bArr5, line, 1, line.length - 1);
        }
        while (true) {
            byte[] line2 = readLine();
            if (line2 == null) {
                return bArrConcat;
            }
            if (line2.length == 0) {
                this.mBufferedLine = EMPTY_BYTE_ARRAY;
                return bArrConcat;
            }
            if (line2[0] != 32) {
                this.mBufferedLine = line2;
                return bArrConcat;
            }
            bArrConcat = concat(bArrConcat, line2, 1, line2.length - 1);
        }
    }

    private byte[] readLine() {
        if (this.mOffset >= this.mEndOffset) {
            return null;
        }
        int i = this.mOffset;
        int i2 = -1;
        int i3 = -1;
        int i4 = i;
        while (true) {
            int i5 = this.mEndOffset;
            if (i4 >= i5) {
                break;
            }
            byte[] bArr = this.mManifest;
            byte b = bArr[i4];
            if (b == 13) {
                i2 = i4;
                int i6 = i4 + 1;
                if (i6 < i5 && bArr[i6] == 10) {
                    i3 = i6 + 1;
                    break;
                }
                i3 = i6;
                break;
            }
            if (b == 10) {
                i2 = i4;
                i3 = i4 + 1;
                break;
            }
            i4++;
        }
        if (i2 == -1) {
            i2 = this.mEndOffset;
            i3 = this.mEndOffset;
        }
        this.mOffset = i3;
        return i2 == i ? EMPTY_BYTE_ARRAY : Arrays.copyOfRange(this.mManifest, i, i2);
    }

    public List<Section> readAllSections() {
        ArrayList arrayList = new ArrayList();
        while (true) {
            Section section = readSection();
            if (section == null) {
                return arrayList;
            }
            arrayList.add(section);
        }
    }

    public Section readSection() {
        int i;
        String attribute;
        do {
            i = this.mOffset;
            attribute = readAttribute();
            if (attribute == null) {
                return null;
            }
        } while (attribute.length() == 0);
        ArrayList arrayList = new ArrayList();
        arrayList.add(parseAttr(attribute));
        while (true) {
            String attribute2 = readAttribute();
            if (attribute2 == null || attribute2.length() == 0) {
                break;
            }
            arrayList.add(parseAttr(attribute2));
        }
        return new Section(i, this.mOffset - i, arrayList);
    }
}
