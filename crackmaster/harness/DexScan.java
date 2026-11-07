package harness;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;

/** 全量扫描 dex 中所有 code_item，找出头部异常的方法。 */
public class DexScan {

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
        } catch (Exception ex) {
            return "?";
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

        int bad = 0, total = 0;
        int cds = (int) u32(dex, 0x60);
        int cdo = (int) u32(dex, 0x64);
        for (int i = 0; i < cds; i++) {
            int off = cdo + i * 32;
            String desc = type(dex, (int) u32(dex, off));
            int cdoff = (int) u32(dex, off + 24);
            if (cdoff == 0) continue;
            int[] p = new int[]{cdoff};
            int sf = uleb(dex, p), inf = uleb(dex, p), dm = uleb(dex, p), vm = uleb(dex, p);
            for (int j = 0; j < sf; j++) { uleb(dex, p); uleb(dex, p); }
            for (int j = 0; j < inf; j++) { uleb(dex, p); uleb(dex, p); }
            for (int pass = 0; pass < 2; pass++) {
                int cnt = pass == 0 ? dm : vm;
                int mi = 0;
                for (int j = 0; j < cnt; j++) {
                    mi += uleb(dex, p);
                    uleb(dex, p);
                    int co = uleb(dex, p);
                    if (co == 0) continue;
                    total++;
                    if (co + 16 > dex.length) {
                        System.out.println("[BAD-OOB] " + desc + " code_off=" + co + " 越界");
                        bad++;
                        continue;
                    }
                    int regs = u16(dex, co), ins = u16(dex, co + 2), outs = u16(dex, co + 4);
                    int tries = u16(dex, co + 6);
                    long insnsSize = u32(dex, co + 12);
                    int mo = (int) (u32(dex, 0x5C) + (long) mi * 8);
                    String name = str(dex, (int) u32(dex, mo + 4));
                    boolean bad1 = regs == 0 || ins > regs || outs > regs || insnsSize <= 0 || insnsSize > 65535;
                    long codeEnd = co + 16 + insnsSize * 2L;
                    boolean bad2 = codeEnd > dex.length;
                    if (bad1 || bad2) {
                        System.out.printf("[BAD] %s.%s code_off=%d regs=%d ins=%d outs=%d tries=%d insns_size=%d end=%d (file=%d)%n",
                                desc, name, co, regs, ins, outs, tries, insnsSize, codeEnd, dex.length);
                        bad++;
                    }
                }
            }
        }
        System.out.println("扫描方法总数=" + total + "，异常=" + bad);
    }
}