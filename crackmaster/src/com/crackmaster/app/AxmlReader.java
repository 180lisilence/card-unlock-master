package com.crackmaster.app;

import java.nio.charset.Charset;

/**
 * 二进制 AndroidManifest.xml（AXML）解析器 —— 纯 Java 实现，手机端无需 aapt2。
 *
 * <p>用于在卸载原版前读出真实包名。APK 里的 AndroidManifest.xml 不是文本 XML，
 * 而是 Android 资源格式的 chunk 序列：
 * <pre>
 *   ResChunk_header (type=0x0003 RES_XML_TYPE, headerSize=8, size=整文件)
 *   ├─ ResStringPool_header (type=0x0001)  字符串池：所有属性名/值/类名
 *   ├─ ResXMLTree_node   (type=0x0180)     resource map
 *   ├─ ResXMLTree_node   (type=0x0100)     startNamespace
 *   ├─ ResXMLTree_node   (type=0x0102)     startElement  ← 元素与属性在这里
 *   └─ ...
 * </pre>
 *
 * <p>字符串池同时支持 UTF-16LE（默认）与 UTF-8（flags &amp; 0x100）两种编码。
 */
public final class AxmlReader {

    private static final Charset UTF8 = Charset.forName("UTF-8");

    private static final int RES_STRING_POOL = 0x0001;
    private static final int RES_XML_START_ELEMENT = 0x0102;
    private static final int UTF8_FLAG = 0x100;
    private static final int ANDROID_NS = 0xFFFFFFFF;

    private AxmlReader() {}

    // ---------------- 小端读取 ----------------

    private static int u8(byte[] b, int o) { return b[o] & 0xff; }

    private static int u16(byte[] b, int o) {
        return (b[o] & 0xff) | ((b[o + 1] & 0xff) << 8);
    }

    private static int u32(byte[] b, int o) {
        return (b[o] & 0xff) | ((b[o + 1] & 0xff) << 8)
                | ((b[o + 2] & 0xff) << 16) | ((b[o + 3] & 0xff) << 24);
    }

    // ---------------- 字符串池 ----------------

    /** 解析字符串池，返回索引→字符串的映射。 */
    private static String[] parseStringPool(byte[] b, int poolOff) {
        int hs = u16(b, poolOff + 2);
        int strCount = u32(b, poolOff + 8);
        int flags = u32(b, poolOff + 16);
        int strStart = u32(b, poolOff + 20);
        if (strCount <= 0 || strCount > 100000) return new String[0];
        boolean utf8 = (flags & UTF8_FLAG) != 0;
        String[] out = new String[strCount];
        int dataBase = poolOff + strStart;
        for (int i = 0; i < strCount; i++) {
            int off = u32(b, poolOff + hs + i * 4);
            int p = dataBase + off;
            if (p < 0 || p >= b.length) { out[i] = ""; continue; }
            try {
                out[i] = utf8 ? readUtf8String(b, p) : readUtf16String(b, p);
            } catch (RuntimeException e) {
                out[i] = "";
            }
        }
        return out;
    }

    private static String readUtf16String(byte[] b, int p) {
        int n = u16(b, p);
        p += 2;
        if (n != 0 && (n & 0x8000) != 0) {
            // 长字符串：低16位在 n，高16位在下一 u16
            n = ((n & 0x7fff) << 16) | u16(b, p);
            p += 2;
        }
        if (n <= 0 || p + n * 2 > b.length) return "";
        return new String(b, p, n * 2, Charset.forName("UTF-16LE"));
    }

    private static String readUtf8String(byte[] b, int p) {
        // UTF-8 池：u8 utf16Len, u8 byteLen（均为可变长高位在前）
        int n = u8(b, p);
        p++;
        if (n > 0x7f) p++;
        int len = u8(b, p);
        p++;
        if (len > 0x7f) {
            len = ((len & 0x7f) << 8) | u8(b, p);
            p++;
        }
        if (len <= 0 || p + len > b.length) return "";
        return new String(b, p, len, UTF8);
    }

    // ---------------- 元素属性 ----------------

    /** 一个 XML 元素的解析结果。 */
    public static final class Element {
        public String name = "";
        /** 属性名→属性值，值为 null 表示该属性是引用型（资源 ID）。 */
        public final java.util.LinkedHashMap<String, String> attrs =
                new java.util.LinkedHashMap<String, String>();
    }

    /** 整个 manifest 的解析结果。 */
    public static final class Manifest {
        public String packageName;
        public String versionName;
        public int versionCode;
        /** <application> 下所有 activity 的 android:name（含包名前缀的完整形式）。 */
        public final java.util.List<String> activities = new java.util.ArrayList<String>();
        public final java.util.List<Element> elements = new java.util.ArrayList<Element>();
    }

    /**
     * 解析 AXML 字节流。
     *
     * @return 解析结果；格式非法时返回 null
     */
    public static Manifest parse(byte[] b) {
        if (b == null || b.length < 16) return null;
        if (u16(b, 0) != RES_STRING_POOL && u16(b, 0) != 0x0003) return null;

        Manifest mf = new Manifest();
        String[] pool = null;
        int fileSize = u32(b, 4);
        int end = (fileSize > 0 && fileSize <= b.length) ? fileSize : b.length;
        int off = u16(b, 2); // root headerSize

        // 记录元素栈，判断当前元素是 manifest / activity
        final java.util.ArrayDeque<String> stack = new java.util.ArrayDeque<String>();
        String pendingActivityName = null;
        boolean inApplication = false;

        while (off + 8 <= end) {
            int type = u16(b, off);
            int hs = u16(b, off + 2);
            int size = u32(b, off + 4);
            if (size <= 0 || off + size > end) break;

            if (type == RES_STRING_POOL && pool == null) {
                pool = parseStringPool(b, off);
            } else if (type == RES_XML_START_ELEMENT) {
                Element e = parseStartElement(b, off, hs, pool);
                if (e != null) {
                    mf.elements.add(e);
                    if ("manifest".equals(e.name)) {
                        String pkg = attr(e, "package");
                        if (pkg != null) mf.packageName = pkg;
                        String vn = attr(e, "versionName");
                        if (vn != null) mf.versionName = vn;
                        Integer vc = attrInt(e, "versionCode");
                        if (vc != null) mf.versionCode = vc;
                    } else if ("application".equals(e.name)) {
                        inApplication = true;
                    } else if (inApplication && ("activity".equals(e.name)
                            || "activity-alias".equals(e.name))) {
                        String an = attr(e, "name");
                        if (an != null) pendingActivityName = an;
                    }
                    stack.push(e.name);
                }
            } else if (type == 0x0103) { // END_ELEMENT
                String top = stack.poll();
                if ("activity".equals(top) || "activity-alias".equals(top)) {
                    if (pendingActivityName != null) {
                        mf.activities.add(pendingActivityName);
                        pendingActivityName = null;
                    }
                } else if ("application".equals(top)) {
                    inApplication = false;
                }
            }

            int step = size;
            // chunk 自身 4 字节对齐
            if ((off + step) % 4 != 0) step += 4 - ((off + step) % 4);
            off += step;
        }
        return mf;
    }

    /**
     * 解析 startElement chunk。
     *
     * <p>结构：ResXMLTree_node(header, lineNumber, comment) + ResXMLTree_attrExt
     * + attribute[]。attrExt 中 attributeStart 是相对本 chunk 起点的偏移。
     */
    private static Element parseStartElement(byte[] b, int off, int hs, String[] pool) {
        if (pool == null || pool.length == 0) return null;
        int attrExt = off + hs;
        if (attrExt + 20 > b.length) return null;

        int nameIdx = u32(b, attrExt + 4);
        int attrStart = u16(b, attrExt + 8);
        int attrSize = u16(b, attrExt + 10);
        int attrCount = u16(b, attrExt + 12);
        if (attrSize < 20) attrSize = 20;

        Element e = new Element();
        e.name = str(pool, nameIdx);
        if (attrCount <= 0 || attrCount > 4096) return e;

        int p = attrExt + attrStart;   // attributeStart 相对 attrExt（即 ResXMLTree_node 之后）
        for (int i = 0; i < attrCount; i++, p += attrSize) {
            if (p + 20 > b.length) break;
            int aNameIdx = u32(b, p + 4);
            int rawValue = u32(b, p + 8);
            // Res_value: u16 size, u8 res0, u8 dataType, u32 data
            int dataType = u8(b, p + 15);
            int data = u32(b, p + 16);

            String an = str(pool, aNameIdx);
            if (an == null || an.length() == 0) continue;

            String value;
            if (dataType == 0x03) {          // TYPE_STRING
                value = str(pool, data);
            } else if (dataType == 0x10) {   // TYPE_INT_DEC
                value = Integer.toString(data);
            } else if (dataType == 0x11) {   // TYPE_INT_HEX
                value = "0x" + Integer.toHexString(data);
            } else if (dataType == 0x12) {   // TYPE_INT_BOOLEAN
                value = (data != 0) ? "true" : "false";
            } else if (dataType == 0x01) {   // TYPE_REFERENCE → 资源 ID，无字面值
                value = null;
            } else {
                value = (rawValue >= 0) ? str(pool, rawValue) : null;
            }
            if (value != null) e.attrs.put(an, value);
        }
        return e;
    }

    private static String str(String[] pool, int i) {
        if (pool == null || i < 0 || i >= pool.length) return null;
        return pool[i];
    }

    /** 取属性值；android: 前缀会被剥掉。 */
    private static String attr(Element e, String name) {
        String v = e.attrs.get(name);
        if (v == null) v = e.attrs.get("android:" + name);
        return v;
    }

    private static Integer attrInt(Element el, String name) {
        String v = attr(el, name);
        if (v == null) return null;
        try {
            if (v.startsWith("0x") || v.startsWith("0X")) return (int) Long.parseLong(v.substring(2), 16);
            return Integer.valueOf(v.trim());
        } catch (NumberFormatException ex) {
            return null;
        }
    }

    // ---------------- 对外便捷方法 ----------------

    /** 从 APK 中读出真实包名；失败返回 null。 */
    public static String packageNameOf(byte[] axml) {
        Manifest mf = parse(axml);
        if (mf == null || mf.packageName == null || mf.packageName.length() == 0) return null;
        return mf.packageName;
    }

    /**
     * 把 manifest 里可能简写的组件名补全为完整类名。
     * 规则：不含 '.' 时按 "包名." + name 处理（相对类名）。
     */
    public static String qualify(String pkg, String cls) {
        if (cls == null) return null;
        if (cls.startsWith(".")) return pkg + cls;
        if (cls.indexOf('.') < 0) return pkg + "." + cls;
        return cls;
    }
}