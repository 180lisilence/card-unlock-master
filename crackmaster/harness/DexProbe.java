package harness;

import java.io.FileInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

/** 诊断工具：打印 dex 中 LicenseVerify 各方法的 code_off 与 code_item 头字段。 */
public class DexProbe {

    private static int u16(byte[] b, int o) { return (b[o] & 0xff) | ((b[o + 1] & 0xff) << 8); }
    private static long u32(byte[] b, int o) {
        return (b[o] & 0xffL) | ((b[o + 1] & 0xffL) << 8) | ((b[o + 2] & 0xffL) << 16) | ((b[o + 3] & 0xffL) << 24);
    }
    private static int uleb(byte[] b, int[] pos) {
        int r = 0, s = 0, i = pos[0];
        while (true) {
            int c = b[i++] & 0xff;
            r |= (c & 0x7f) << s;
            if ((c & 0x80) == 0) break;
            s += 7;
        }
        pos[0] = i;
        return r;
    }
    private static String str(byte[] dex, int idx) {
        long off = u32(dex, 0x3C) + (long) idx * 4;
        int[] p = new int[]{(int) u32(dex, (int) off)};
        uleb(dex, p);
        int s = p[0], e = s;
        while (dex[e] != 0) e++;
        try {
            return new String(dex, s, e - s, "UTF-8");
        } catch (java.io.UnsupportedEncodingException ex) {
            throw new RuntimeException(ex);
        }
    }
    private static String type(byte[] dex, int idx) {
        return str(dex, (int) u32(dex, (int) (u32(dex, 0x44) + (long) idx * 4)));
    }

    public static void main(String[] args) throws Exception {
        InputStream in = new FileInputStream(args[0]);
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int n;
        while ((n = in.read(buf)) > 0) bos.write(buf, 0, n);
        byte[] dex = bos.toByteArray();

        int cds = (int) u32(dex, 0x60);
        int cdo = (int) u32(dex, 0x64);
        System.out.println("dex size=" + dex.length + ", class_defs=" + cds);
        for (int i = 0; i < cds; i++) {
            int off = cdo + i * 32;
            String desc = type(dex, (int) u32(dex, off));
            if (!desc.contains("LicenseVerify")) continue;
            System.out.println("class " + desc + " class_data_off=" + u32(dex, off + 24));
            int[] p = new int[]{(int) u32(dex, off + 24)};
            int sf = uleb(dex, p), inf = uleb(dex, p), dm = uleb(dex, p), vm = uleb(dex, p);
            System.out.println("  static_fields=" + sf + " instance_fields=" + inf + " direct=" + dm + " virtual=" + vm);
            for (int j = 0; j < sf; j++) { uleb(dex, p); uleb(dex, p); }
            for (int j = 0; j < inf; j++) { uleb(dex, p); uleb(dex, p); }
            int mi = 0;
            for (int j = 0; j < dm; j++) {
                mi += uleb(dex, p);
                uleb(dex, p);
                int co = uleb(dex, p);
                int mo = (int) (u32(dex, 0x5C) + (long) mi * 8);
                String name = str(dex, (int) u32(dex, mo + 4));
                if (co != 0) {
                    System.out.printf("  direct %-16s code_off=%d regs=%d ins=%d outs=%d tries=%d dbg=%d insns_size=%d%n",
                            name, co, u16(dex, co), u16(dex, co + 2), u16(dex, co + 4), u16(dex, co + 6),
                            u32(dex, co + 8), u32(dex, co + 12));
                }
            }
        }
    }
}