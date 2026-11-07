package com.licenseinjector.app.core;

import com.android.apksig.internal.apk.ApkSigningBlockUtils;
import java.io.ByteArrayOutputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes3.dex */
public final class AxmLEditor {
    private static final int CHUNK_END_EL = 259;
    private static final int CHUNK_RES_MAP = 384;
    private static final int CHUNK_START_EL = 258;
    private static final int CHUNK_START_NS = 256;
    private static final int CHUNK_STRING_POOL = 1;
    private static final int CHUNK_XML = 3;
    private static final int NO_INDEX = -1;
    static final int RES_EXPORTED = 16842768;
    static final int RES_NAME = 16842755;
    private static final int TYPE_INT_BOOL = 18;
    private static final int TYPE_INT_DEC = 16;
    private static final int TYPE_INT_HEX = 17;
    private static final int TYPE_STRING = 3;
    private static final Charset UTF_16LE = Charset.forName("UTF-16LE");
    private static final Charset UTF_8 = Charset.forName("UTF-8");
    public String discoveredLauncher;
    public String downgradedLaunchers;
    private String pkgName;
    private boolean pkgParsed;
    public String resolvedEntry;
    private final byte[] src;
    private int stringCount;
    private int[] stringOffsets;
    private int stringPoolOff;
    private int stringPoolSize;
    private int stringsStart;
    private boolean utf8Pool;
    private int resMapOff = -1;
    private int resMapSize = 0;
    private int[] resMap = new int[0];
    private int androidNsIndex = -1;
    private final List<String> strings = new ArrayList();
    private final Map<String, Integer> stringIndex = new HashMap();
    private final List<int[]> resMapAdds = new ArrayList();

    private static final class Attr {
        final int data;
        final int nameIdx;
        final int nsIdx;
        final int type;

        Attr(int i, int i2, int i3, int i4) {
            this.nsIdx = i;
            this.nameIdx = i2;
            this.type = i3;
            this.data = i4;
        }
    }

    public static final class Entry {
        public final boolean alias;
        public final String launchMode;
        public final boolean launcher;
        public final boolean main;
        public final String name;
        public final boolean noHistory;
        public final String process;
        public final String target;

        Entry(String str, boolean z, boolean z2, boolean z3, String str2, boolean z4, String str3, String str4) {
            this.name = str;
            this.launcher = z;
            this.main = z2;
            this.alias = z3;
            this.target = str2;
            this.noHistory = z4;
            this.launchMode = str3;
            this.process = str4;
        }

        public boolean isEntry() {
            return this.launcher || this.main;
        }

        public String kindText() {
            if (this.launcher) {
                return "桌面入口 · LAUNCHER";
            }
            return this.main ? "MAIN 入口 · ACTION_MAIN" : "普通界面 · 无入口过滤器";
        }

        public String label() {
            String str;
            StringBuilder sbAppend = new StringBuilder().append(this.name);
            if (this.launcher) {
                str = "  [桌面入口]";
            } else {
                str = this.main ? "  [MAIN]" : "  [界面]";
            }
            return sbAppend.append(str).toString();
        }

        public String realClass() {
            String str;
            return (!this.alias || (str = this.target) == null || str.length() <= 0) ? this.name : this.target;
        }

        public String toString() {
            return label();
        }
    }

    private static final class EntryAcc {
        boolean alias;
        String launchMode;
        boolean launcher;
        boolean main;
        final String name;
        boolean noHistory;
        String process;
        String target;

        EntryAcc(String str) {
            this.name = str;
        }

        Entry toEntry() {
            return new Entry(this.name, this.launcher, this.main, this.alias, this.target, this.noHistory, this.launchMode, this.process);
        }
    }

    public AxmLEditor(byte[] bArr) {
        this.src = bArr;
        parse();
    }

    private static void addAcc(List<EntryAcc> list, EntryAcc entryAcc) {
        for (EntryAcc entryAcc2 : list) {
            if (entryAcc2.name.equals(entryAcc.name)) {
                entryAcc2.launcher |= entryAcc.launcher;
                entryAcc2.main |= entryAcc.main;
                entryAcc2.alias |= entryAcc.alias;
                entryAcc2.noHistory |= entryAcc.noHistory;
                if (entryAcc2.target == null) {
                    entryAcc2.target = entryAcc.target;
                }
                if (entryAcc2.launchMode == null) {
                    entryAcc2.launchMode = entryAcc.launchMode;
                }
                if (entryAcc2.process == null) {
                    entryAcc2.process = entryAcc.process;
                    return;
                }
                return;
            }
        }
        list.add(entryAcc);
    }

    private static void append(ByteArrayOutputStream byteArrayOutputStream, byte[] bArr) {
        byteArrayOutputStream.write(bArr, 0, bArr.length);
    }

    private int appendDuplicate(String str) {
        int size = this.strings.size();
        this.strings.add(str);
        return size;
    }

    private int attrNameIndex(String str, int i) {
        int i2;
        Integer num = this.stringIndex.get(str);
        if (num == null) {
            int size = this.strings.size();
            this.strings.add(str);
            this.stringIndex.put(str, Integer.valueOf(size));
            ensureResMap(size, i);
            return size;
        }
        int iIntValue = num.intValue();
        int[] iArr = this.resMap;
        if (iIntValue < iArr.length && (i2 = iArr[iIntValue]) != 0 && i2 != i) {
            iIntValue = appendDuplicate(str);
        }
        ensureResMap(iIntValue, i);
        return iIntValue;
    }

    private byte[] buildActivityTree(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, int i10) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(CHUNK_START_NS);
        ArrayList arrayList = new ArrayList();
        arrayList.add(new Attr(i, i6, 3, i8));
        arrayList.add(new Attr(i, i7, 18, -1));
        append(byteArrayOutputStream, startElement(i2, arrayList));
        append(byteArrayOutputStream, startElement(i3, new ArrayList()));
        ArrayList arrayList2 = new ArrayList();
        arrayList2.add(new Attr(i, i6, 3, i9));
        append(byteArrayOutputStream, startElement(i4, arrayList2));
        append(byteArrayOutputStream, endElement(i4));
        ArrayList arrayList3 = new ArrayList();
        arrayList3.add(new Attr(i, i6, 3, i10));
        append(byteArrayOutputStream, startElement(i5, arrayList3));
        append(byteArrayOutputStream, endElement(i5));
        append(byteArrayOutputStream, endElement(i3));
        append(byteArrayOutputStream, endElement(i2));
        return byteArrayOutputStream.toByteArray();
    }

    private byte[] buildResMap() {
        int i;
        int length = this.resMap.length;
        Iterator<int[]> it = this.resMapAdds.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            length = Math.max(length, it.next()[0] + 1);
        }
        if (length == 0) {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(8);
            writeU16(byteArrayOutputStream, 384);
            writeU16(byteArrayOutputStream, 8);
            writeU32(byteArrayOutputStream, 8);
            return byteArrayOutputStream.toByteArray();
        }
        int[] iArr = new int[length];
        int[] iArr2 = this.resMap;
        System.arraycopy(iArr2, 0, iArr, 0, iArr2.length);
        for (int[] iArr3 : this.resMapAdds) {
            setAt(iArr, iArr3[0], iArr3[1]);
        }
        ByteArrayOutputStream byteArrayOutputStream2 = new ByteArrayOutputStream((length * 4) + 8);
        writeU16(byteArrayOutputStream2, 384);
        writeU16(byteArrayOutputStream2, 8);
        writeU32(byteArrayOutputStream2, (length * 4) + 8);
        for (int i2 : iArr) {
            writeU32(byteArrayOutputStream2, i2);
        }
        return byteArrayOutputStream2.toByteArray();
    }

    private byte[] buildStringPool() {
        int size = this.strings.size();
        int i = (size * 4) + 28;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        int[] iArr = new int[size];
        for (int i2 = 0; i2 < size; i2++) {
            iArr[i2] = byteArrayOutputStream.size();
            byte[] bytes = this.strings.get(i2).getBytes(UTF_16LE);
            writeU16(byteArrayOutputStream, bytes.length / 2);
            byteArrayOutputStream.write(bytes, 0, bytes.length);
            writeU16(byteArrayOutputStream, 0);
        }
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        int length = byteArray.length + i;
        int i3 = (4 - (length % 4)) % 4;
        ByteArrayOutputStream byteArrayOutputStream2 = new ByteArrayOutputStream(length + i3);
        writeU16(byteArrayOutputStream2, 1);
        writeU16(byteArrayOutputStream2, 28);
        writeU32(byteArrayOutputStream2, length + i3);
        writeU32(byteArrayOutputStream2, size);
        writeU32(byteArrayOutputStream2, 0);
        writeU32(byteArrayOutputStream2, 0);
        writeU32(byteArrayOutputStream2, i);
        writeU32(byteArrayOutputStream2, 0);
        for (int i4 = 0; i4 < size; i4++) {
            writeU32(byteArrayOutputStream2, iArr[i4]);
        }
        byteArrayOutputStream2.write(byteArray, 0, byteArray.length);
        for (int i5 = 0; i5 < i3; i5++) {
            byteArrayOutputStream2.write(0);
        }
        return byteArrayOutputStream2.toByteArray();
    }

    private boolean csvContains(String str, String str2) {
        if (str == null || str2 == null) {
            return false;
        }
        for (String str3 : str.split(",")) {
            if (sameClass(str2, str3.trim())) {
                return true;
            }
        }
        return false;
    }

    private byte[] endElement(int i) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(24);
        writeU16(byteArrayOutputStream, 259);
        writeU16(byteArrayOutputStream, 16);
        writeU32(byteArrayOutputStream, 24);
        writeU32(byteArrayOutputStream, 0);
        writeU32(byteArrayOutputStream, -1);
        writeU32(byteArrayOutputStream, -1);
        writeU32(byteArrayOutputStream, i);
        return byteArrayOutputStream.toByteArray();
    }

    private int ensureAndroidNs() {
        int i = this.androidNsIndex;
        if (i != -1 && i < this.strings.size()) {
            return this.androidNsIndex;
        }
        int iValueIndex = valueIndex("http://schemas.android.com/apk/res/android");
        this.androidNsIndex = iValueIndex;
        return iValueIndex;
    }

    private void ensureResMap(int i, int i2) {
        int[] iArr = this.resMap;
        if (i < iArr.length && iArr[i] == 0) {
            this.resMap = setAt(iArr, i, i2);
        }
        this.resMapAdds.add(new int[]{i, i2});
    }

    private static String launchModeName(String str) {
        if (str == null) {
            return null;
        }
        if ("0".equals(str) || "standard".equals(str)) {
            return "standard";
        }
        if ("1".equals(str) || "singleTop".equals(str)) {
            return "singleTop";
        }
        if ("2".equals(str) || "singleTask".equals(str)) {
            return "singleTask";
        }
        return ("3".equals(str) || "singleInstance".equals(str)) ? "singleInstance" : str;
    }

    private int nameIndex(String str) {
        return valueIndex(str);
    }

    private String packageName() {
        if (this.pkgParsed) {
            return this.pkgName;
        }
        this.pkgParsed = true;
        int iIndexOf = this.strings.indexOf("package");
        if (iIndexOf < 0) {
            return null;
        }
        int i = this.stringPoolOff + this.stringPoolSize;
        int i2 = this.resMapOff;
        int iMax = Math.max(i, i2 >= 0 ? this.resMapSize + i2 : 0);
        int i3 = iMax;
        while (i3 + 8 <= this.src.length) {
            int iU16 = u16(i3);
            int iU32 = (int) u32(i3 + 4);
            if (iU32 <= 0) {
                return null;
            }
            if (iU16 == 258) {
                int iU17 = u16(i3 + 2);
                int iU18 = u16(i3 + 24);
                int iU19 = u16(i3 + 28);
                int i4 = i3 + iU17 + iU18;
                int i5 = 0;
                while (i5 < iU19) {
                    int i6 = (i5 * 20) + i4;
                    int i7 = i;
                    int iU33 = (int) u32(i6);
                    int i8 = i2;
                    int iU34 = (int) u32(i6 + 4);
                    int i9 = this.src[i6 + 15] & 255;
                    int i10 = iMax;
                    int i11 = iU17;
                    int i12 = iU18;
                    int iU35 = (int) u32(i6 + 16);
                    if ((iU33 < 0 || iU33 == 0) && iU34 == iIndexOf && i9 == 3 && iU35 >= 0 && iU35 < this.strings.size()) {
                        String str = this.strings.get(iU35);
                        this.pkgName = str;
                        return str;
                    }
                    i5++;
                    iMax = i10;
                    i = i7;
                    i2 = i8;
                    iU17 = i11;
                    iU18 = i12;
                }
                return null;
            }
            i3 += iU32;
        }
        return null;
    }

    private void parse() {
        int iU16 = u16(0);
        if (iU16 != 3) {
            throw new IllegalArgumentException("非法 AXML：type=0x" + Integer.toHexString(iU16));
        }
        int iU17 = u16(2);
        while (iU17 + 8 <= this.src.length) {
            int iU18 = u16(iU17);
            int iU32 = (int) u32(iU17 + 4);
            if (iU32 <= 0) {
                return;
            }
            if (iU18 == 1) {
                parseStringPool(iU17, iU32);
            } else if (iU18 == 384) {
                this.resMapOff = iU17;
                this.resMapSize = iU32;
                int i = (iU32 - 8) / 4;
                this.resMap = new int[i];
                for (int i2 = 0; i2 < i; i2++) {
                    this.resMap[i2] = (int) u32(iU17 + 8 + (i2 * 4));
                }
            } else if (iU18 == CHUNK_START_NS) {
                int iU33 = (int) u32(iU17 + 20);
                if (this.androidNsIndex == -1) {
                    this.androidNsIndex = iU33;
                }
            }
            iU17 += iU32;
        }
    }

    private void parseStringPool(int i, int i2) {
        this.stringPoolOff = i;
        this.stringPoolSize = i2;
        this.stringCount = (int) u32(i + 8);
        int iU32 = (int) u32(i + 12);
        int iU33 = (int) u32(i + 16);
        this.stringsStart = (int) u32(i + 20);
        this.utf8Pool = (iU33 & CHUNK_START_NS) != 0;
        if (iU32 != 0) {
            throw new IllegalArgumentException("暂不支持带样式的字符串池 styleCount=" + iU32);
        }
        this.stringOffsets = new int[this.stringCount];
        for (int i3 = 0; i3 < this.stringCount; i3++) {
            this.stringOffsets[i3] = (int) u32(i + 28 + (i3 * 4));
        }
        int i4 = this.stringsStart + i;
        for (int i5 = 0; i5 < this.stringCount; i5++) {
            String utf8 = this.utf8Pool ? readUtf8(this.stringOffsets[i5] + i4) : readUtf16(this.stringOffsets[i5] + i4);
            this.strings.add(utf8);
            if (!this.stringIndex.containsKey(utf8)) {
                this.stringIndex.put(utf8, Integer.valueOf(i5));
            }
        }
    }

    private static void putU32(byte[] bArr, int i, int i2) {
        bArr[i] = (byte) (i2 & 255);
        bArr[i + 1] = (byte) ((i2 >> 8) & 255);
        bArr[i + 2] = (byte) ((i2 >> 16) & 255);
        bArr[i + 3] = (byte) ((i2 >> 24) & 255);
    }

    private String readAndroidAttr(int i, int i2, int i3) {
        if (i2 < 0) {
            return null;
        }
        int iU16 = u16(i + 2);
        int iU17 = u16(i + 24);
        int iU18 = u16(i + 28);
        int i4 = i + iU16 + iU17;
        for (int i5 = 0; i5 < iU18; i5++) {
            int i6 = (i5 * 20) + i4;
            int iU32 = (int) u32(i6);
            if (((int) u32(i6 + 4)) == i2 && (iU32 == i3 || iU32 == -1)) {
                int i7 = this.src[i6 + 15] & 255;
                int iU33 = (int) u32(i6 + 16);
                if (i7 == 3) {
                    if (iU33 < 0 || iU33 >= this.strings.size()) {
                        return null;
                    }
                    return this.strings.get(iU33);
                }
                if (i7 == 18) {
                    return iU33 != 0 ? "true" : "false";
                }
                if (i7 == 16) {
                    return String.valueOf(iU33);
                }
                if (i7 == 17) {
                    return "0x" + Integer.toHexString(iU33);
                }
                return null;
            }
        }
        return null;
    }

    private String readAndroidName(int i, int i2) {
        int iU16 = u16(i + 2);
        int iU17 = u16(i + 24);
        int iU18 = u16(i + 28);
        int i3 = i + iU16 + iU17;
        for (int i4 = 0; i4 < iU18; i4++) {
            int i5 = (i4 * 20) + i3;
            int iU32 = (int) u32(i5 + 4);
            int i6 = this.src[i5 + 15] & 255;
            int iU33 = (int) u32(i5 + 16);
            if (iU32 == i2 && i6 == 3 && iU33 >= 0 && iU33 < this.strings.size()) {
                return this.strings.get(iU33);
            }
        }
        return null;
    }

    private String readUtf16(int i) {
        return new String(this.src, i + 2, u16(i) * 2, UTF_16LE);
    }

    private String readUtf8(int i) {
        byte[] bArr = this.src;
        int i2 = i + 1;
        if ((bArr[i] & 255 & 128) != 0) {
            i2++;
        }
        int i3 = bArr[i2] & 255;
        int i4 = i2 + 1;
        if ((i3 & 128) != 0) {
            i3 = ((i3 & 127) << 8) | (bArr[i4] & 255);
            i4++;
        }
        return new String(this.src, i4, i3, UTF_8);
    }

    private static int[] setAt(int[] iArr, int i, int i2) {
        if (i < iArr.length) {
            iArr[i] = i2;
            return iArr;
        }
        int[] iArr2 = new int[i + 1];
        System.arraycopy(iArr, 0, iArr2, 0, iArr.length);
        iArr2[i] = i2;
        return iArr2;
    }

    private byte[] startElement(int i, List<Attr> list) {
        int size = list.size();
        int i2 = (size * 20) + 36;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(i2);
        writeU16(byteArrayOutputStream, 258);
        writeU16(byteArrayOutputStream, 16);
        writeU32(byteArrayOutputStream, i2);
        writeU32(byteArrayOutputStream, 0);
        writeU32(byteArrayOutputStream, -1);
        writeU32(byteArrayOutputStream, -1);
        writeU32(byteArrayOutputStream, i);
        writeU16(byteArrayOutputStream, 20);
        writeU16(byteArrayOutputStream, 20);
        writeU16(byteArrayOutputStream, size);
        writeU16(byteArrayOutputStream, 0);
        writeU16(byteArrayOutputStream, 0);
        writeU16(byteArrayOutputStream, 0);
        for (Attr attr : list) {
            writeU32(byteArrayOutputStream, attr.nsIdx);
            writeU32(byteArrayOutputStream, attr.nameIdx);
            writeU32(byteArrayOutputStream, attr.type == 3 ? attr.data : -1);
            writeU16(byteArrayOutputStream, 8);
            byteArrayOutputStream.write(0);
            byteArrayOutputStream.write(attr.type);
            writeU32(byteArrayOutputStream, attr.data);
        }
        return byteArrayOutputStream.toByteArray();
    }

    private int u16(int i) {
        byte[] bArr = this.src;
        return ((bArr[i + 1] & 255) << 8) | (bArr[i] & 255);
    }

    private long u32(int i) {
        byte[] bArr = this.src;
        return (((long) bArr[i]) & 255) | ((((long) bArr[i + 1]) & 255) << 8) | ((((long) bArr[i + 2]) & 255) << 16) | ((255 & ((long) bArr[i + 3])) << 24);
    }

    private int valueIndex(String str) {
        Integer num = this.stringIndex.get(str);
        if (num != null) {
            return num.intValue();
        }
        int size = this.strings.size();
        this.strings.add(str);
        this.stringIndex.put(str, Integer.valueOf(size));
        return size;
    }

    private static void writeU16(ByteArrayOutputStream byteArrayOutputStream, int i) {
        byteArrayOutputStream.write(i & 255);
        byteArrayOutputStream.write((i >> 8) & 255);
    }

    private static void writeU32(ByteArrayOutputStream byteArrayOutputStream, int i) {
        byteArrayOutputStream.write(i & 255);
        byteArrayOutputStream.write((i >> 8) & 255);
        byteArrayOutputStream.write((i >> 16) & 255);
        byteArrayOutputStream.write((i >> 24) & 255);
    }

    public String fullName(String str) {
        String strPackageName;
        if (str == null || str.length() == 0 || (strPackageName = packageName()) == null || strPackageName.length() == 0) {
            return str;
        }
        if (str.charAt(0) == '.') {
            return strPackageName + str;
        }
        return str.indexOf(46) < 0 ? strPackageName + "." + str : str;
    }

    public boolean hasComponent(String str) {
        int iIndexOf;
        if (str == null || str.isEmpty() || (iIndexOf = this.strings.indexOf("name")) < 0) {
            return false;
        }
        int i = this.stringPoolOff + this.stringPoolSize;
        int i2 = this.resMapOff;
        int iMax = Math.max(i, i2 >= 0 ? this.resMapSize + i2 : 0);
        while (iMax + 8 <= this.src.length) {
            int iU16 = u16(iMax);
            int iU32 = (int) u32(iMax + 4);
            if (iU32 <= 0) {
                break;
            }
            if (iU16 == 258 && sameClass(str, readAndroidName(iMax, iIndexOf))) {
                return true;
            }
            iMax += iU32;
        }
        return false;
    }

    public byte[] injectLauncher(String str) {
        return injectLauncher(str, null);
    }

    /* JADX WARN: Code duplicated, block: B:104:0x0370  */
    /* JADX WARN: Code duplicated, block: B:107:0x03a7  */
    /* JADX WARN: Code duplicated, block: B:133:0x0196 A[EDGE_INSN: B:133:0x0196->B:53:0x0196 BREAK  A[LOOP:4: B:38:0x0148->B:52:0x018d], SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:33:0x0117  */
    /* JADX WARN: Code duplicated, block: B:36:0x0128  */
    /* JADX WARN: Code duplicated, block: B:37:0x0131  */
    /* JADX WARN: Code duplicated, block: B:40:0x0150  */
    /* JADX WARN: Code duplicated, block: B:51:0x018b  */
    /* JADX WARN: Code duplicated, block: B:56:0x0211  */
    /* JADX WARN: Code duplicated, block: B:59:0x021c  */
    /* JADX WARN: Code duplicated, block: B:62:0x0230  */
    /* JADX WARN: Code duplicated, block: B:65:0x0237 A[LOOP:3: B:63:0x0231->B:65:0x0237, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:67:0x025c  */
    /* JADX WARN: Code duplicated, block: B:91:0x02e4  */
    /* JADX WARN: Code duplicated, block: B:93:0x0310  */
    /* JADX WARN: Code duplicated, block: B:95:0x0342 A[ADDED_TO_REGION] */
    public byte[] injectLauncher(String str, String str2) {
        int i;
        int i2;
        int i3;
        int i4;
        ArrayList arrayList;
        String str3;
        String strFullName;
        ArrayList arrayList2;
        boolean z;
        int i5;
        boolean z2;
        ArrayList arrayList3;
        String strFullName2;
        int i6;
        ArrayList arrayList4;
        byte[] bArrBuildActivityTree;
        int i7;
        int length;
        int length2;
        ByteArrayOutputStream byteArrayOutputStream;
        byte[] byteArray;
        int i8;
        int i9;
        int i10;
        int i11;
        int i12;
        ArrayList arrayList5;
        ArrayList arrayList6;
        int i13;
        int i14;
        int i15;
        ArrayList arrayList7;
        int i16;
        int i17;
        int i18;
        int i19;
        int i20;
        String str4;
        int i21;
        int i22;
        int iU16;
        int iU17;
        int iU18;
        int i23;
        ArrayList arrayList8;
        ArrayList arrayList9;
        int iEnsureAndroidNs = ensureAndroidNs();
        nameIndex("application");
        int iNameIndex = nameIndex("activity");
        int iNameIndex2 = nameIndex("intent-filter");
        int iNameIndex3 = nameIndex("action");
        int iNameIndex4 = nameIndex("category");
        int iAttrNameIndex = attrNameIndex("name", 16842755);
        int iAttrNameIndex2 = attrNameIndex("exported", 16842768);
        int iValueIndex = valueIndex(str);
        int iValueIndex2 = valueIndex("android.intent.action.MAIN");
        String str5 = "android.intent.category.LAUNCHER";
        int iValueIndex3 = valueIndex("android.intent.category.LAUNCHER");
        int iValueIndex4 = valueIndex("android.intent.category.DEFAULT");
        int iIndexOf = this.strings.indexOf("application");
        if (iIndexOf < 0) {
            throw new IllegalStateException("清单中未找到 <application>");
        }
        int i24 = this.stringPoolOff + this.stringPoolSize;
        int i25 = this.resMapOff;
        int iMax = Math.max(i24, i25 >= 0 ? this.resMapSize + i25 : 0);
        ArrayList arrayList10 = new ArrayList();
        ArrayList arrayList11 = new ArrayList();
        ArrayList arrayList12 = new ArrayList();
        int i26 = iEnsureAndroidNs;
        int iIndexOf2 = this.strings.indexOf("activity-alias");
        int i27 = iMax;
        ArrayList arrayList13 = new ArrayList();
        String str6 = null;
        int i28 = -1;
        int i29 = iIndexOf2;
        int i30 = iIndexOf;
        int i31 = iValueIndex4;
        int i32 = i27;
        while (true) {
            i = i27;
            i2 = i31;
            i3 = i26;
            if (i32 + 8 > this.src.length) {
                i4 = i29;
                break;
            }
            int iU19 = u16(i32);
            int i33 = i32;
            i4 = i29;
            int i34 = i25;
            int iU32 = (int) u32(i32 + 4);
            if (iU32 <= 0) {
                break;
            }
            int i35 = i24;
            int i36 = iAttrNameIndex;
            int i37 = iNameIndex4;
            int i38 = iNameIndex2;
            int i39 = iNameIndex3;
            ArrayList arrayList14 = arrayList11;
            ArrayList arrayList15 = arrayList12;
            int i40 = i2;
            ArrayList arrayList16 = arrayList10;
            int i41 = iNameIndex;
            int i42 = i;
            if (iU19 == 258) {
                int iU33 = (int) u32(i33 + 20);
                ArrayList arrayList17 = arrayList13;
                arrayList17.add(Integer.valueOf(iU33));
                i41 = i41;
                if (iU33 != i41) {
                    if (i4 >= 0) {
                        i18 = i4;
                        if (iU33 == i18) {
                        }
                        i14 = i37;
                        if (iU33 == i14) {
                            iU16 = u16(i20 + 2);
                            iU17 = i20 + iU16 + u16(i20 + 24);
                            iU18 = u16(i20 + 28);
                            i23 = 0;
                            while (i23 < iU18) {
                                int i43 = iU17 + (i23 * 20);
                                int i44 = iU18;
                                int i45 = i30;
                                int i46 = iU32;
                                int i47 = i40;
                                int i48 = i42;
                                int iU34 = (int) u32(i43 + 4);
                                int i49 = this.src[i43 + 15] & 255;
                                int i50 = i20;
                                int i51 = iU16;
                                int i52 = iU19;
                                int i53 = i9;
                                int iU35 = (int) u32(i43 + 16);
                                if (str4 == null && iU34 == i13 && i49 == 3 && iU35 >= 0 && iU35 < this.strings.size() && str5.equals(this.strings.get(iU35))) {
                                    arrayList8 = arrayList16;
                                    arrayList8.add(str4);
                                    arrayList9 = arrayList14;
                                    arrayList9.add(Integer.valueOf(i43 + 16));
                                } else {
                                    arrayList8 = arrayList16;
                                    arrayList9 = arrayList14;
                                }
                                i23++;
                                i30 = i45;
                                iU32 = i46;
                                i20 = i50;
                                arrayList14 = arrayList9;
                                arrayList16 = arrayList8;
                                iU16 = i51;
                                i40 = i47;
                                i42 = i48;
                                iU19 = i52;
                                iU18 = i44;
                                i9 = i53;
                            }
                            i21 = iU19;
                            i10 = i9;
                            i11 = i40;
                            i12 = i42;
                            arrayList5 = arrayList16;
                            arrayList6 = arrayList14;
                            i22 = i30;
                            i15 = iU32;
                            i16 = i20;
                        } else {
                            i21 = iU19;
                            i10 = i9;
                            i11 = i40;
                            i12 = i42;
                            arrayList5 = arrayList16;
                            arrayList6 = arrayList14;
                            i22 = i30;
                            i15 = iU32;
                            i16 = i20;
                        }
                        str6 = str4;
                        i30 = i22;
                        arrayList7 = arrayList17;
                        i17 = i19;
                    } else {
                        i18 = i4;
                    }
                    i19 = i18;
                    str4 = str6;
                    arrayList17 = arrayList17;
                    i41 = i41;
                    i20 = i33;
                    arrayList15 = arrayList15;
                    i13 = i36;
                    i14 = i37;
                    if (iU33 == i14) {
                        iU16 = u16(i20 + 2);
                        iU17 = i20 + iU16 + u16(i20 + 24);
                        iU18 = u16(i20 + 28);
                        i23 = 0;
                        while (i23 < iU18) {
                            int i410 = iU17 + (i23 * 20);
                            int i411 = iU18;
                            int i412 = i30;
                            int i413 = iU32;
                            int i414 = i40;
                            int i415 = i42;
                            int iU36 = (int) u32(i410 + 4);
                            int i416 = this.src[i410 + 15] & 255;
                            int i54 = i20;
                            int i55 = iU16;
                            int i56 = iU19;
                            int i57 = i9;
                            int iU37 = (int) u32(i410 + 16);
                            if (str4 == null) {
                                arrayList8 = arrayList16;
                                arrayList9 = arrayList14;
                            } else {
                                arrayList8 = arrayList16;
                                arrayList9 = arrayList14;
                            }
                            i23++;
                            i30 = i412;
                            iU32 = i413;
                            i20 = i54;
                            arrayList14 = arrayList9;
                            arrayList16 = arrayList8;
                            iU16 = i55;
                            i40 = i414;
                            i42 = i415;
                            iU19 = i56;
                            iU18 = i411;
                            i9 = i57;
                        }
                        i21 = iU19;
                        i10 = i9;
                        i11 = i40;
                        i12 = i42;
                        arrayList5 = arrayList16;
                        arrayList6 = arrayList14;
                        i22 = i30;
                        i15 = iU32;
                        i16 = i20;
                    } else {
                        i21 = iU19;
                        i10 = i9;
                        i11 = i40;
                        i12 = i42;
                        arrayList5 = arrayList16;
                        arrayList6 = arrayList14;
                        i22 = i30;
                        i15 = iU32;
                        i16 = i20;
                    }
                    str6 = str4;
                    i30 = i22;
                    arrayList7 = arrayList17;
                    i17 = i19;
                } else {
                    i9 = i3;
                    i18 = i4;
                }
                i19 = i18;
                i13 = i36;
                String androidName = readAndroidName(i33, i13);
                if (androidName == null || androidName.length() <= 0) {
                    arrayList15 = arrayList15;
                } else {
                    arrayList15 = arrayList15;
                    arrayList15.add(fullName(androidName));
                }
                i20 = i33;
                str4 = androidName;
                i14 = i37;
                if (iU33 == i14) {
                    iU16 = u16(i20 + 2);
                    iU17 = i20 + iU16 + u16(i20 + 24);
                    iU18 = u16(i20 + 28);
                    i23 = 0;
                    while (i23 < iU18) {
                        int i417 = iU17 + (i23 * 20);
                        int i418 = iU18;
                        int i419 = i30;
                        int i4110 = iU32;
                        int i4111 = i40;
                        int i4112 = i42;
                        int iU38 = (int) u32(i417 + 4);
                        int i4113 = this.src[i417 + 15] & 255;
                        int i58 = i20;
                        int i59 = iU16;
                        int i510 = iU19;
                        int i511 = i9;
                        int iU39 = (int) u32(i417 + 16);
                        if (str4 == null) {
                            arrayList8 = arrayList16;
                            arrayList9 = arrayList14;
                        } else {
                            arrayList8 = arrayList16;
                            arrayList9 = arrayList14;
                        }
                        i23++;
                        i30 = i419;
                        iU32 = i4110;
                        i20 = i58;
                        arrayList14 = arrayList9;
                        arrayList16 = arrayList8;
                        iU16 = i59;
                        i40 = i4111;
                        i42 = i4112;
                        iU19 = i510;
                        iU18 = i418;
                        i9 = i511;
                    }
                    i21 = iU19;
                    i10 = i9;
                    i11 = i40;
                    i12 = i42;
                    arrayList5 = arrayList16;
                    arrayList6 = arrayList14;
                    i22 = i30;
                    i15 = iU32;
                    i16 = i20;
                } else {
                    i21 = iU19;
                    i10 = i9;
                    i11 = i40;
                    i12 = i42;
                    arrayList5 = arrayList16;
                    arrayList6 = arrayList14;
                    i22 = i30;
                    i15 = iU32;
                    i16 = i20;
                }
                str6 = str4;
                i30 = i22;
                arrayList7 = arrayList17;
                i17 = i19;
            } else {
                i10 = i9;
                i11 = i40;
                i12 = i42;
                arrayList5 = arrayList16;
                arrayList6 = arrayList14;
                i13 = i36;
                i14 = i37;
                int i60 = i30;
                i15 = iU32;
                arrayList7 = arrayList13;
                i16 = i33;
                i17 = i4;
                if (iU19 == 259) {
                    int iU310 = (int) u32(i16 + 20);
                    if (!arrayList7.isEmpty()) {
                        i9 = i3;
                        arrayList7.remove(arrayList7.size() - 1);
                    }
                    i9 = i3;
                    if (iU310 == i60) {
                        i28 = i16;
                    }
                    i30 = i60;
                } else {
                    i9 = i3;
                    i30 = i60;
                }
            }
            int i61 = i16 + i15;
            i27 = i12;
            i31 = i11;
            i26 = i10;
            arrayList13 = arrayList7;
            i29 = i17;
            arrayList10 = arrayList5;
            iAttrNameIndex = i13;
            iNameIndex4 = i14;
            iNameIndex = i41;
            i25 = i34;
            iNameIndex2 = i38;
            iNameIndex3 = i39;
            arrayList12 = arrayList15;
            i24 = i35;
            i32 = i61;
            str5 = str5;
            arrayList11 = arrayList6;
        }
        if (i28 < 0) {
            throw new IllegalStateException("清单中未找到 </application>");
        }
        if (str2 != 0 && str2.length() > 0) {
            int i62 = 0;
            while (true) {
                if (i62 < arrayList12.size()) {
                    arrayList = arrayList12;
                    if (sameClass(str2, (String) arrayList.get(i62))) {
                        str3 = (String) arrayList.get(i62);
                        break;
                    }
                    i62++;
                    arrayList12 = arrayList;
                } else {
                    arrayList = arrayList12;
                }
            }
            if (str3 == null || arrayList10.isEmpty()) {
                strFullName = str3;
            } else {
                strFullName = fullName((String) arrayList10.get(0));
            }
            this.resolvedEntry = strFullName;
            arrayList2 = new ArrayList();
            if (arrayList10.isEmpty()) {
                arrayList3 = arrayList11;
            } else {
                z = false;
                this.discoveredLauncher = fullName((String) arrayList10.get(0));
                StringBuilder sb = new StringBuilder();
                i5 = 0;
                while (true) {
                    z2 = z;
                    if (i5 < arrayList10.size()) {
                        break;
                    }
                    ArrayList arrayList18 = arrayList11;
                    arrayList2.add((Integer) arrayList18.get(i5));
                    strFullName2 = fullName((String) arrayList10.get(i5));
                    if (strFullName2 != null || strFullName2.length() <= 0 || sb.indexOf(strFullName2) >= 0) {
                        strFullName = strFullName;
                    } else {
                        if (sb.length() > 0) {
                            sb.append(',');
                        }
                        sb.append(strFullName2);
                    }
                    i5++;
                    z = z2;
                    strFullName = strFullName;
                    arrayList11 = arrayList18;
                }
                arrayList3 = arrayList11;
                this.downgradedLaunchers = sb.toString();
            }
            i6 = i28;
            arrayList4 = arrayList2;
            bArrBuildActivityTree = buildActivityTree(i3, iNameIndex, iNameIndex2, iNameIndex3, iNameIndex4, iAttrNameIndex, iAttrNameIndex2, iValueIndex, iValueIndex2, iValueIndex3);
            byte[] bArrBuildStringPool = buildStringPool();
            byte[] bArrBuildResMap = buildResMap();
            i7 = i6 - i;
            length = this.src.length - i6;
            length2 = bArrBuildStringPool.length + 8 + bArrBuildResMap.length;
            byteArrayOutputStream = new ByteArrayOutputStream(this.src.length + ApkSigningBlockUtils.ANDROID_COMMON_PAGE_ALIGNMENT_BYTES);
            writeU16(byteArrayOutputStream, 3);
            writeU16(byteArrayOutputStream, 8);
            writeU32(byteArrayOutputStream, 0);
            byteArrayOutputStream.write(bArrBuildStringPool, 0, bArrBuildStringPool.length);
            byteArrayOutputStream.write(bArrBuildResMap, 0, bArrBuildResMap.length);
            if (i7 > 0) {
                byteArrayOutputStream.write(this.src, i, i7);
            }
            byteArrayOutputStream.write(bArrBuildActivityTree, 0, bArrBuildActivityTree.length);
            if (length > 0) {
                byteArrayOutputStream.write(this.src, i6, length);
            }
            byteArray = byteArrayOutputStream.toByteArray();
            putU32(byteArray, 4, byteArray.length);
            if (!arrayList4.isEmpty()) {
                i8 = 0;
                while (i8 < arrayList4.size()) {
                    ArrayList arrayList19 = arrayList4;
                    int iIntValue = (((Integer) arrayList19.get(i8)).intValue() - i) + length2;
                    putU32(byteArray, iIntValue, i2);
                    putU32(byteArray, iIntValue - 8, i2);
                    i8++;
                    bArrBuildActivityTree = bArrBuildActivityTree;
                    arrayList4 = arrayList19;
                }
            }
            return byteArray;
        }
        arrayList = arrayList12;
        str3 = null;
        if (str3 == null) {
            strFullName = str3;
        } else {
            strFullName = str3;
        }
        this.resolvedEntry = strFullName;
        arrayList2 = new ArrayList();
        if (arrayList10.isEmpty()) {
            arrayList3 = arrayList11;
        } else {
            z = false;
            this.discoveredLauncher = fullName((String) arrayList10.get(0));
            StringBuilder sb2 = new StringBuilder();
            i5 = 0;
            while (true) {
                z2 = z;
                if (i5 < arrayList10.size()) {
                    break;
                    break;
                }
                ArrayList arrayList110 = arrayList11;
                arrayList2.add((Integer) arrayList110.get(i5));
                strFullName2 = fullName((String) arrayList10.get(i5));
                if (strFullName2 != null) {
                    strFullName = strFullName;
                } else {
                    strFullName = strFullName;
                }
                i5++;
                z = z2;
                strFullName = strFullName;
                arrayList11 = arrayList110;
            }
            arrayList3 = arrayList11;
            this.downgradedLaunchers = sb2.toString();
        }
        i6 = i28;
        arrayList4 = arrayList2;
        bArrBuildActivityTree = buildActivityTree(i3, iNameIndex, iNameIndex2, iNameIndex3, iNameIndex4, iAttrNameIndex, iAttrNameIndex2, iValueIndex, iValueIndex2, iValueIndex3);
        byte[] bArrBuildStringPool2 = buildStringPool();
        byte[] bArrBuildResMap2 = buildResMap();
        i7 = i6 - i;
        length = this.src.length - i6;
        length2 = bArrBuildStringPool2.length + 8 + bArrBuildResMap2.length;
        byteArrayOutputStream = new ByteArrayOutputStream(this.src.length + ApkSigningBlockUtils.ANDROID_COMMON_PAGE_ALIGNMENT_BYTES);
        writeU16(byteArrayOutputStream, 3);
        writeU16(byteArrayOutputStream, 8);
        writeU32(byteArrayOutputStream, 0);
        byteArrayOutputStream.write(bArrBuildStringPool2, 0, bArrBuildStringPool2.length);
        byteArrayOutputStream.write(bArrBuildResMap2, 0, bArrBuildResMap2.length);
        if (i7 > 0) {
            byteArrayOutputStream.write(this.src, i, i7);
        }
        byteArrayOutputStream.write(bArrBuildActivityTree, 0, bArrBuildActivityTree.length);
        if (length > 0) {
            byteArrayOutputStream.write(this.src, i6, length);
        }
        byteArray = byteArrayOutputStream.toByteArray();
        putU32(byteArray, 4, byteArray.length);
        if (!arrayList4.isEmpty()) {
            i8 = 0;
            while (i8 < arrayList4.size()) {
                ArrayList arrayList111 = arrayList4;
                int iIntValue2 = (((Integer) arrayList111.get(i8)).intValue() - i) + length2;
                putU32(byteArray, iIntValue2, i2);
                putU32(byteArray, iIntValue2 - 8, i2);
                i8++;
                bArrBuildActivityTree = bArrBuildActivityTree;
                arrayList4 = arrayList111;
            }
        }
        return byteArray;
    }

    public List<Entry> listActivities() {
        ArrayList<EntryAcc> arrayList;
        int i;
        int i2;
        boolean z;
        ArrayList arrayList2;
        int i3;
        int i4;
        int i5;
        boolean z2;
        boolean z3;
        int i6;
        boolean z4;
        int i7;
        int i8;
        int i9;
        boolean z5;
        EntryAcc entryAcc;
        AxmLEditor axmLEditor = this;
        ArrayList arrayList3 = new ArrayList();
        int iIndexOf = axmLEditor.strings.indexOf("name");
        if (iIndexOf < 0) {
            return new ArrayList();
        }
        int iIndexOf2 = axmLEditor.strings.indexOf("activity");
        int iIndexOf3 = axmLEditor.strings.indexOf("activity-alias");
        int iIndexOf4 = axmLEditor.strings.indexOf("action");
        int iIndexOf5 = axmLEditor.strings.indexOf("category");
        int iEnsureAndroidNs = ensureAndroidNs();
        int iIndexOf6 = axmLEditor.strings.indexOf("targetActivity");
        int iIndexOf7 = axmLEditor.strings.indexOf("noHistory");
        int iIndexOf8 = axmLEditor.strings.indexOf("launchMode");
        int iIndexOf9 = axmLEditor.strings.indexOf("process");
        int i10 = axmLEditor.stringPoolOff + axmLEditor.stringPoolSize;
        int i11 = axmLEditor.resMapOff;
        int iMax = Math.max(i10, i11 >= 0 ? axmLEditor.resMapSize + i11 : 0);
        boolean z6 = false;
        boolean z7 = false;
        EntryAcc entryAcc2 = null;
        int i12 = iMax;
        while (true) {
            arrayList = arrayList3;
            boolean z8 = z6;
            int i13 = i11;
            if (i12 + 8 > axmLEditor.src.length) {
                break;
            }
            int iU16 = axmLEditor.u16(i12);
            boolean z9 = z7;
            int i14 = iMax;
            int i15 = iIndexOf4;
            int i16 = iIndexOf5;
            int iU32 = (int) axmLEditor.u32(i12 + 4);
            if (iU32 <= 0) {
                break;
            }
            if (iU16 == 258) {
                int iU33 = (int) axmLEditor.u32(i12 + 20);
                boolean z10 = iIndexOf3 >= 0 && iU33 == iIndexOf3;
                boolean z11 = (iIndexOf2 >= 0 && iU33 == iIndexOf2) || z10;
                if (z11) {
                    i7 = iIndexOf3;
                    z4 = z11;
                    String androidName = axmLEditor.readAndroidName(i12, iIndexOf);
                    if (androidName == null || androidName.length() <= 0) {
                        entryAcc = null;
                    } else {
                        iIndexOf2 = iIndexOf2;
                        entryAcc = new EntryAcc(axmLEditor.fullName(androidName));
                    }
                    entryAcc2 = entryAcc;
                    if (entryAcc2 != null) {
                        entryAcc2.alias = z10;
                        String androidAttr = axmLEditor.readAndroidAttr(i12, iIndexOf6, iEnsureAndroidNs);
                        entryAcc2.target = androidAttr != null ? axmLEditor.fullName(androidAttr) : null;
                        entryAcc2.noHistory = "true".equals(axmLEditor.readAndroidAttr(i12, iIndexOf7, iEnsureAndroidNs));
                        entryAcc2.launchMode = launchModeName(axmLEditor.readAndroidAttr(i12, iIndexOf8, iEnsureAndroidNs));
                        entryAcc2.process = axmLEditor.readAndroidAttr(i12, iIndexOf9, iEnsureAndroidNs);
                    }
                    z2 = false;
                    z5 = false;
                    i9 = i16;
                } else {
                    iIndexOf2 = iIndexOf2;
                    z4 = z11;
                    i7 = iIndexOf3;
                    if (entryAcc2 == null || i15 < 0) {
                        i8 = i15;
                    } else {
                        i8 = i15;
                        if (iU33 == i8) {
                            if ("android.intent.action.MAIN".equals(axmLEditor.readAndroidName(i12, iIndexOf))) {
                                z5 = z9;
                                i15 = i8;
                                z2 = true;
                                i9 = i16;
                            } else {
                                z5 = z9;
                                i15 = i8;
                                z2 = z8;
                                i9 = i16;
                            }
                        }
                    }
                    if (entryAcc2 == null || i16 < 0) {
                        i15 = i8;
                        i9 = i16;
                    } else {
                        i9 = i16;
                        if (iU33 == i9) {
                            i15 = i8;
                            if ("android.intent.category.LAUNCHER".equals(axmLEditor.readAndroidName(i12, iIndexOf))) {
                                z5 = true;
                                z2 = z8;
                            }
                        } else {
                            i15 = i8;
                        }
                    }
                    z2 = z8;
                    z5 = z9;
                }
                z3 = z5;
                i5 = iIndexOf2;
                i2 = iU32;
                i = i9;
                arrayList2 = arrayList;
                i3 = i7;
            } else {
                int i17 = iIndexOf2;
                i = i16;
                int i18 = iIndexOf3;
                i2 = iU32;
                if (iU16 == 259) {
                    if (i17 >= 0) {
                        i4 = i17;
                        if (1 != 0) {
                            if (entryAcc2 == null) {
                                z = z8;
                                arrayList2 = arrayList;
                            } else {
                                entryAcc2.launcher = z9;
                                z = z8;
                                entryAcc2.main = z;
                                arrayList2 = arrayList;
                                addAcc(arrayList2, entryAcc2);
                            }
                            entryAcc2 = null;
                        } else {
                            z = z8;
                            arrayList2 = arrayList;
                        }
                    } else {
                        z = z8;
                        arrayList2 = arrayList;
                        i4 = i17;
                    }
                    if (i18 >= 0) {
                        i6 = i18;
                        if (1 != 0) {
                            if (entryAcc2 != null) {
                                entryAcc2.launcher = z9;
                                entryAcc2.main = z;
                                addAcc(arrayList2, entryAcc2);
                            }
                            entryAcc2 = null;
                        }
                    } else {
                        i6 = i18;
                    }
                    if (0 != 0) {
                        if (entryAcc2 != null) {
                            entryAcc2.launcher = z9;
                            entryAcc2.main = z;
                            addAcc(arrayList2, entryAcc2);
                        }
                        entryAcc2 = null;
                    }
                    i3 = i6;
                } else {
                    z = z8;
                    arrayList2 = arrayList;
                    i3 = i18;
                    i4 = i17;
                }
                i5 = i4;
                z2 = z;
                z3 = z9;
            }
            i12 += i2;
            iIndexOf3 = i3;
            z7 = z3;
            z6 = z2;
            arrayList3 = arrayList2;
            axmLEditor = this;
            iIndexOf2 = i5;
            i11 = i13;
            iMax = i14;
            iIndexOf4 = i15;
            iIndexOf = iIndexOf;
            iIndexOf5 = i;
        }
        ArrayList arrayList4 = new ArrayList(arrayList.size());
        for (EntryAcc entryAcc3 : arrayList) {
            int i19 = iIndexOf;
            if (entryAcc3.launcher) {
                arrayList4.add(entryAcc3.toEntry());
            }
            iIndexOf = i19;
        }
        for (EntryAcc entryAcc4 : arrayList) {
            if (!entryAcc4.launcher && entryAcc4.main) {
                arrayList4.add(entryAcc4.toEntry());
            }
        }
        for (EntryAcc entryAcc5 : arrayList) {
            if (!entryAcc5.launcher && !entryAcc5.main) {
                arrayList4.add(entryAcc5.toEntry());
            }
        }
        return arrayList4;
    }

    public List<Entry> listEntryCandidates() {
        ArrayList arrayList = new ArrayList();
        for (Entry entry : listActivities()) {
            if (entry.isEntry()) {
                arrayList.add(entry);
            }
        }
        return arrayList;
    }

    public byte[] restoreLauncher(String str, String str2) {
        int i;
        String str3;
        int i2;
        int i3;
        String str4;
        int i4;
        int i5;
        ArrayList arrayList;
        if (str2 != null && !str2.isEmpty()) {
            int iIndexOf = this.strings.indexOf("android.intent.category.LAUNCHER");
            int iIndexOf2 = this.strings.indexOf("android.intent.category.DEFAULT");
            if (iIndexOf < 0 || iIndexOf2 < 0) {
                return null;
            }
            int iIndexOf3 = this.strings.indexOf("name");
            int iNameIndex = nameIndex("activity");
            int iNameIndex2 = nameIndex("activity-alias");
            int iNameIndex3 = nameIndex("category");
            if (iIndexOf3 < 0 || iNameIndex < 0 || iNameIndex3 < 0) {
                return null;
            }
            int iIndexOf4 = this.strings.indexOf("application");
            int i6 = this.stringPoolOff + this.stringPoolSize;
            int i7 = this.resMapOff;
            int iMax = Math.max(i6, i7 >= 0 ? this.resMapSize + i7 : 0);
            int i8 = -1;
            int i9 = -1;
            ArrayList arrayList2 = new ArrayList();
            int i10 = -1;
            int i11 = iIndexOf;
            int i12 = -1;
            String str5 = null;
            int i13 = 0;
            int i14 = iMax;
            while (true) {
                i = i8;
                int i15 = iIndexOf;
                int i16 = iIndexOf4;
                int i17 = i10;
                int i18 = i6;
                if (i14 + 8 > this.src.length) {
                    break;
                }
                int iU16 = u16(i14);
                int i19 = i7;
                int iU32 = (int) u32(i14 + 4);
                if (iU32 <= 0) {
                    break;
                }
                int i20 = iIndexOf2;
                int i21 = iIndexOf3;
                if (iU16 == 258) {
                    int i22 = iU32;
                    int iU33 = (int) u32(i14 + 20);
                    i13++;
                    if (iU33 == iNameIndex || (iNameIndex2 >= 0 && iU33 == iNameIndex2)) {
                        String androidName = readAndroidName(i14, i21);
                        if (i9 < 0) {
                            str3 = str2;
                            if (sameClass(str3, androidName)) {
                                i9 = i14;
                            }
                        } else {
                            str3 = str2;
                        }
                        str5 = androidName;
                    } else if (iU33 != iNameIndex3 || str == 0) {
                        i22 = i22;
                        iNameIndex = iNameIndex;
                        iNameIndex2 = iNameIndex2;
                        i21 = i21;
                        str3 = str2;
                        str5 = str5;
                    } else {
                        int iU17 = u16(i14 + 2);
                        i22 = i22;
                        int iU18 = i14 + iU17 + u16(i14 + 24);
                        int iU19 = u16(i14 + 28);
                        int i23 = 0;
                        while (i23 < iU19) {
                            int i24 = iU18 + (i23 * 20);
                            int i25 = iU19;
                            int i26 = iNameIndex3;
                            int i27 = iNameIndex;
                            int i28 = iNameIndex2;
                            int iU34 = (int) u32(i24 + 4);
                            int i29 = this.src[i24 + 15] & 255;
                            int i30 = iU33;
                            int i31 = iU17;
                            int iU35 = (int) u32(i24 + 16);
                            int i32 = i21;
                            if (iU34 == i32 && i29 == 3) {
                                int i33 = i20;
                                if (iU35 == i33) {
                                    i20 = i33;
                                    str5 = str5;
                                    if (csvContains(str, fullName(str5))) {
                                        arrayList = arrayList2;
                                        arrayList.add(Integer.valueOf(i24 + 16));
                                    } else {
                                        arrayList = arrayList2;
                                    }
                                } else {
                                    i20 = i33;
                                }
                                i23++;
                                arrayList2 = arrayList;
                                iNameIndex3 = i26;
                                i21 = i32;
                                iU33 = i30;
                                iU17 = i31;
                                iNameIndex = i27;
                                iNameIndex2 = i28;
                                str5 = str5;
                                iU19 = i25;
                                str = str;
                            }
                            arrayList = arrayList2;
                            i23++;
                            arrayList2 = arrayList;
                            iNameIndex3 = i26;
                            i21 = i32;
                            iU33 = i30;
                            iU17 = i31;
                            iNameIndex = i27;
                            iNameIndex2 = i28;
                            str5 = str5;
                            iU19 = i25;
                            str = str;
                        }
                        iNameIndex = iNameIndex;
                        iNameIndex2 = iNameIndex2;
                        i21 = i21;
                        str3 = str2;
                    }
                    i5 = i16;
                    i10 = i17;
                    i8 = i;
                    str4 = str5;
                    i4 = i22;
                    i3 = i21;
                } else {
                    iNameIndex = iNameIndex;
                    iNameIndex2 = iNameIndex2;
                    String str6 = str5;
                    int i34 = i13;
                    str3 = str2;
                    if (iU16 != 259) {
                        i8 = i;
                        i3 = i21;
                        str4 = str6;
                        i4 = iU32;
                        i13 = i34;
                        i5 = i16;
                        i10 = i17;
                    } else {
                        if (i9 < 0 || i12 >= 0) {
                            i2 = i17;
                        } else {
                            i2 = i17;
                            if (i34 == i2) {
                                i12 = i14 + iU32;
                            }
                        }
                        i3 = i21;
                        str4 = str6;
                        i13 = i34 - 1;
                        i8 = ((int) u32(i14 + 20)) == i16 ? i14 : i;
                        i10 = i2;
                        i4 = iU32;
                        i5 = i16;
                    }
                }
                i14 += i4;
                iIndexOf4 = i5;
                iIndexOf = i15;
                iIndexOf3 = i3;
                i6 = i18;
                i7 = i19;
                iIndexOf2 = i20;
                iNameIndex = iNameIndex;
                iNameIndex2 = iNameIndex2;
                str5 = str4;
            }
            if (i9 < 0 || i12 < 0 || i < 0) {
                return null;
            }
            byte[] bArrBuildStringPool = buildStringPool();
            byte[] bArrBuildResMap = buildResMap();
            int length = bArrBuildStringPool.length + 8 + bArrBuildResMap.length;
            int length2 = this.src.length - i;
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(this.src.length);
            writeU16(byteArrayOutputStream, 3);
            writeU16(byteArrayOutputStream, 8);
            writeU32(byteArrayOutputStream, 0);
            byteArrayOutputStream.write(bArrBuildStringPool, 0, bArrBuildStringPool.length);
            byteArrayOutputStream.write(bArrBuildResMap, 0, bArrBuildResMap.length);
            byteArrayOutputStream.write(this.src, iMax, i9 - iMax);
            byteArrayOutputStream.write(this.src, i12, i - i12);
            if (length2 > 0) {
                byteArrayOutputStream.write(this.src, i, length2);
            }
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            putU32(byteArray, 4, byteArray.length);
            int i35 = 0;
            ArrayList arrayList3 = arrayList2;
            while (true) {
                byte[] bArr = bArrBuildStringPool;
                if (i35 >= arrayList3.size()) {
                    return byteArray;
                }
                int iIntValue = (((Integer) arrayList3.get(i35)).intValue() - iMax) + length;
                int i36 = i11;
                putU32(byteArray, iIntValue, i36);
                putU32(byteArray, iIntValue - 8, i36);
                i35++;
                i11 = i36;
                arrayList3 = arrayList3;
                bArrBuildStringPool = bArr;
                bArrBuildResMap = bArrBuildResMap;
            }
        }
        return null;
    }

    public boolean sameClass(String str, String str2) {
        if (str == null || str2 == null || str.length() == 0 || str2.length() == 0) {
            return false;
        }
        return str.equals(str2) || fullName(str).equals(fullName(str2));
    }
}
