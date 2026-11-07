package com.licenseinjector.app.core;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.zip.CRC32;
import java.util.zip.Deflater;

/* JADX INFO: loaded from: classes3.dex */
public final class ZipRewriter {
    private static final long CD_SIG = 33639248;
    private static final long EOCD_SIG = 101010256;
    private static final long LFH_SIG = 67324752;
    private final RandomAccessFile raf;
    private final List<C0050E> entries = new ArrayList();
    private final List<C0050E> added = new ArrayList();

    /* JADX INFO: renamed from: com.licenseinjector.app.core.ZipRewriter$E */
    private static final class C0050E {
        byte[] centralExtra;
        byte[] comment;
        long compSize;
        int crc;
        long dataOff;
        int date;
        int flags;
        byte[] localExtra;
        int localExtraLen;
        long localOff;
        int method;
        String name;
        byte[] nameBytes;
        boolean remove;
        byte[] replace;
        int replaceCrc;
        long replaceUncomp;
        int time;
        long uncompSize;

        private C0050E() {
            this.localExtra = new byte[0];
            this.centralExtra = new byte[0];
            this.comment = new byte[0];
        }
    }

    public ZipRewriter(File file) throws IOException {
        this.raf = new RandomAccessFile(file, "r");
        parse();
    }

    private static int crc32(byte[] bArr) {
        CRC32 crc32 = new CRC32();
        crc32.update(bArr);
        return (int) crc32.getValue();
    }

    private static byte[] deflate(byte[] bArr) {
        Deflater deflater = new Deflater(-1, true);
        try {
            deflater.setInput(bArr);
            deflater.finish();
            byte[] bArr2 = new byte[bArr.length + 128];
            int iDeflate = deflater.deflate(bArr2);
            byte[] bArr3 = new byte[iDeflate];
            System.arraycopy(bArr2, 0, bArr3, 0, iDeflate);
            return bArr3;
        } finally {
            deflater.end();
        }
    }

    private C0050E find(String str) {
        for (C0050E c0050e : this.entries) {
            if (c0050e.name.equals(str)) {
                return c0050e;
            }
        }
        for (C0050E c0050e2 : this.added) {
            if (c0050e2.name.equals(str)) {
                return c0050e2;
            }
        }
        return null;
    }

    private void parse() throws IOException {
        long length = this.raf.length();
        int iMin = (int) Math.min(length, 66000L);
        byte[] bArr = new byte[iMin];
        this.raf.seek(length - ((long) iMin));
        this.raf.readFully(bArr);
        int i = -1;
        for (int i2 = iMin - 22; i2 >= 0; i2--) {
            if (u32(bArr, i2) == EOCD_SIG) {
                i = i2;
                break;
            }
        }
        if (i < 0) {
            throw new IOException("不是有效的 ZIP：未找到 EOCD");
        }
        int iU16 = u16(bArr, i + 10);
        long jU32 = u32(bArr, i + 12);
        long jU33 = u32(bArr, i + 16);
        byte[] bArr2 = new byte[(int) jU32];
        this.raf.seek(jU33);
        this.raf.readFully(bArr2);
        int i3 = 0;
        int i4 = 0;
        while (i4 < iU16) {
            if (u32(bArr2, i3) != CD_SIG) {
                throw new IOException("中央目录损坏 @" + i3);
            }
            C0050E c0050e = new C0050E();
            c0050e.flags = u16(bArr2, i3 + 8);
            c0050e.method = u16(bArr2, i3 + 10);
            c0050e.time = u16(bArr2, i3 + 12);
            c0050e.date = u16(bArr2, i3 + 14);
            long j = length;
            c0050e.crc = (int) u32(bArr2, i3 + 16);
            c0050e.compSize = u32(bArr2, i3 + 20);
            c0050e.uncompSize = u32(bArr2, i3 + 24);
            int iU17 = u16(bArr2, i3 + 28);
            int iU18 = u16(bArr2, i3 + 30);
            long j2 = jU32;
            int iU19 = u16(bArr2, i3 + 32);
            int i5 = iMin;
            byte[] bArr3 = bArr;
            c0050e.localOff = u32(bArr2, i3 + 42);
            c0050e.nameBytes = new byte[iU17];
            int i6 = i;
            long j3 = jU33;
            System.arraycopy(bArr2, i3 + 46, c0050e.nameBytes, 0, iU17);
            c0050e.name = new String(c0050e.nameBytes);
            c0050e.centralExtra = new byte[iU18];
            System.arraycopy(bArr2, i3 + 46 + iU17, c0050e.centralExtra, 0, iU18);
            c0050e.comment = new byte[iU19];
            System.arraycopy(bArr2, i3 + 46 + iU17 + iU18, c0050e.comment, 0, iU19);
            int i7 = i3 + iU17 + 46 + iU18 + iU19;
            byte[] bArr4 = new byte[30];
            int i8 = iU16;
            this.raf.seek(c0050e.localOff);
            this.raf.readFully(bArr4);
            if (u32(bArr4, 0) != LFH_SIG) {
                throw new IOException("本地文件头损坏: " + c0050e.name);
            }
            int iU110 = u16(bArr4, 26);
            c0050e.localExtraLen = u16(bArr4, 28);
            c0050e.dataOff = c0050e.localOff + 30 + ((long) iU110) + ((long) c0050e.localExtraLen);
            c0050e.localExtra = new byte[c0050e.localExtraLen];
            if (c0050e.localExtraLen > 0) {
                this.raf.seek(c0050e.localOff + 30 + ((long) iU110));
                this.raf.readFully(c0050e.localExtra);
            }
            this.entries.add(c0050e);
            i4++;
            iMin = i5;
            bArr = bArr3;
            i = i6;
            i3 = i7;
            iU16 = i8;
            bArr2 = bArr2;
            length = j;
            jU32 = j2;
            jU33 = j3;
        }
    }

    private static void putU16(byte[] bArr, int i, int i2) {
        bArr[i] = (byte) (i2 & 255);
        bArr[i + 1] = (byte) ((i2 >> 8) & 255);
    }

    private static void putU32(byte[] bArr, int i, long j) {
        bArr[i] = (byte) (j & 255);
        bArr[i + 1] = (byte) ((j >> 8) & 255);
        bArr[i + 2] = (byte) ((j >> 16) & 255);
        bArr[i + 3] = (byte) (255 & (j >> 24));
    }

    private static int u16(byte[] bArr, int i) {
        return (bArr[i] & 255) | ((bArr[i + 1] & 255) << 8);
    }

    private static long u32(byte[] bArr, int i) {
        return (((long) bArr[i]) & 255) | ((((long) bArr[i + 1]) & 255) << 8) | ((((long) bArr[i + 2]) & 255) << 16) | ((255 & ((long) bArr[i + 3])) << 24);
    }

    private long writeCentral(BufferedOutputStream bufferedOutputStream, C0050E c0050e, long j) throws IOException {
        byte[] bArr = new byte[46];
        putU32(bArr, 0, CD_SIG);
        putU16(bArr, 4, 20);
        putU16(bArr, 6, 20);
        putU16(bArr, 8, c0050e.flags);
        putU16(bArr, 10, c0050e.method);
        putU16(bArr, 12, c0050e.time);
        putU16(bArr, 14, c0050e.date);
        putU32(bArr, 16, c0050e.crc);
        putU32(bArr, 20, (int) c0050e.compSize);
        putU32(bArr, 24, (int) c0050e.uncompSize);
        putU16(bArr, 28, c0050e.nameBytes.length);
        putU16(bArr, 30, c0050e.centralExtra.length);
        putU16(bArr, 32, c0050e.comment.length);
        putU16(bArr, 34, 0);
        putU16(bArr, 36, 0);
        putU32(bArr, 38, 0L);
        putU32(bArr, 42, (int) c0050e.localOff);
        bufferedOutputStream.write(bArr);
        bufferedOutputStream.write(c0050e.nameBytes);
        bufferedOutputStream.write(c0050e.centralExtra);
        bufferedOutputStream.write(c0050e.comment);
        return 46 + j + ((long) c0050e.nameBytes.length) + ((long) c0050e.centralExtra.length) + ((long) c0050e.comment.length);
    }

    private void writeEnd(BufferedOutputStream bufferedOutputStream, int i, long j, long j2) throws IOException {
        byte[] bArr = new byte[22];
        putU32(bArr, 0, EOCD_SIG);
        putU16(bArr, 4, 0);
        putU16(bArr, 6, 0);
        putU16(bArr, 8, i);
        putU16(bArr, 10, i);
        putU32(bArr, 12, (int) j);
        putU32(bArr, 16, (int) j2);
        putU16(bArr, 20, 0);
        bufferedOutputStream.write(bArr);
    }

    /* JADX WARN: Code duplicated, block: B:25:0x009b  */
    /* JADX WARN: Code duplicated, block: B:26:0x009d  */
    /* JADX WARN: Code duplicated, block: B:29:0x00f5  */
    /* JADX WARN: Code duplicated, block: B:32:0x0116  */
    /* JADX WARN: Code duplicated, block: B:33:0x0165  */
    private long writeEntry(BufferedOutputStream bufferedOutputStream, C0050E c0050e, long j, List<C0050E> list) throws IOException {
        byte[] bArr;
        int i;
        long length;
        long j2;
        int i2;
        int i3;
        byte[] bArr2;
        int i4;
        int i5;
        if (c0050e.replace != null) {
            bArr = c0050e.replace;
            i = 8;
            length = bArr.length;
            j2 = c0050e.replaceUncomp;
            i2 = c0050e.replaceCrc;
        } else {
            bArr = new byte[(int) c0050e.compSize];
            this.raf.seek(c0050e.dataOff);
            this.raf.readFully(bArr);
            i = c0050e.method;
            length = c0050e.compSize;
            j2 = c0050e.uncompSize;
            i2 = c0050e.crc;
        }
        if (i == 0) {
            int i6 = c0050e.name.endsWith(".so") ? 16384 : 4;
            int length2 = (int) ((((((long) i6) - ((((j + 30) + ((long) c0050e.nameBytes.length)) + 0) % ((long) i6))) % ((long) i6)) + ((long) i6)) % ((long) i6));
            if (length2 == 0) {
                i5 = 0;
            } else {
                i5 = length2 >= 4 ? length2 : length2 + i6;
            }
            if (i5 > 0) {
                bArr2 = new byte[i5];
                bArr2[0] = 53;
                bArr2[1] = -39;
                int i7 = i5 - 4;
                bArr2[2] = (byte) (i7 & 255);
                bArr2[3] = (byte) ((i7 >> 8) & 255);
                i3 = i5 + 0;
            }
            if (c0050e.replace != null) {
                i4 = 0;
            } else {
                i4 = c0050e.flags & (-9);
            }
            int i8 = i4;
            byte[] bArr3 = new byte[30];
            putU32(bArr3, 0, LFH_SIG);
            putU16(bArr3, 4, 20);
            putU16(bArr3, 6, i8);
            putU16(bArr3, 8, i);
            putU16(bArr3, 10, c0050e.time);
            putU16(bArr3, 12, c0050e.date);
            putU32(bArr3, 14, i2);
            putU32(bArr3, 18, (int) length);
            putU32(bArr3, 22, (int) j2);
            putU16(bArr3, 26, c0050e.nameBytes.length);
            putU16(bArr3, 28, i3);
            bufferedOutputStream.write(bArr3);
            bufferedOutputStream.write(c0050e.nameBytes);
            if (bArr2 != null) {
                bufferedOutputStream.write(bArr2);
            }
            bufferedOutputStream.write(bArr);
            c0050e.localOff = j;
            c0050e.flags = i8;
            c0050e.method = i;
            c0050e.crc = i2;
            c0050e.compSize = length;
            c0050e.uncompSize = j2;
            list.add(c0050e);
            if (System.getenv("ZIP_DEBUG") != null) {
                System.err.println("[zip] " + c0050e.name + " m=" + i + " cs=" + length + " us=" + j2 + " extraLen=" + i3 + " off=" + j);
            }
            return 30 + j + ((long) c0050e.nameBytes.length) + ((long) i3) + ((long) bArr.length);
        }
        i3 = 0;
        bArr2 = null;
        if (c0050e.replace != null) {
            i4 = 0;
        } else {
            i4 = c0050e.flags & (-9);
        }
        int i9 = i4;
        byte[] bArr4 = new byte[30];
        putU32(bArr4, 0, LFH_SIG);
        putU16(bArr4, 4, 20);
        putU16(bArr4, 6, i9);
        putU16(bArr4, 8, i);
        putU16(bArr4, 10, c0050e.time);
        putU16(bArr4, 12, c0050e.date);
        putU32(bArr4, 14, i2);
        putU32(bArr4, 18, (int) length);
        putU32(bArr4, 22, (int) j2);
        putU16(bArr4, 26, c0050e.nameBytes.length);
        putU16(bArr4, 28, i3);
        bufferedOutputStream.write(bArr4);
        bufferedOutputStream.write(c0050e.nameBytes);
        if (bArr2 != null) {
            bufferedOutputStream.write(bArr2);
        }
        bufferedOutputStream.write(bArr);
        c0050e.localOff = j;
        c0050e.flags = i9;
        c0050e.method = i;
        c0050e.crc = i2;
        c0050e.compSize = length;
        c0050e.uncompSize = j2;
        list.add(c0050e);
        if (System.getenv("ZIP_DEBUG") != null) {
            System.err.println("[zip] " + c0050e.name + " m=" + i + " cs=" + length + " us=" + j2 + " extraLen=" + i3 + " off=" + j);
        }
        return 30 + j + ((long) c0050e.nameBytes.length) + ((long) i3) + ((long) bArr.length);
    }

    public void add(String str, byte[] bArr) {
        C0050E c0050eFind = find(str);
        if (c0050eFind != null) {
            c0050eFind.replace = deflate(bArr);
            return;
        }
        C0050E c0050e = new C0050E();
        c0050e.name = str;
        c0050e.nameBytes = str.getBytes();
        c0050e.method = 8;
        c0050e.date = 33;
        c0050e.uncompSize = bArr.length;
        c0050e.replace = deflate(bArr);
        c0050e.replaceCrc = crc32(bArr);
        c0050e.replaceUncomp = bArr.length;
        this.added.add(c0050e);
    }

    public void close() {
        try {
            this.raf.close();
        } catch (Throwable th) {
        }
    }

    public boolean contains(String str) {
        return find(str) != null;
    }

    public List<String> names() {
        ArrayList arrayList = new ArrayList();
        Iterator<C0050E> it = this.entries.iterator();
        while (it.hasNext()) {
            arrayList.add(it.next().name);
        }
        return arrayList;
    }

    public void remove(String str) {
        C0050E c0050eFind = find(str);
        if (c0050eFind != null) {
            c0050eFind.remove = true;
        }
    }

    public void removeOldSignatures() {
        for (C0050E c0050e : this.entries) {
            String str = c0050e.name;
            String upperCase = str.toUpperCase();
            if (str.equalsIgnoreCase("META-INF/MANIFEST.MF") || (str.regionMatches(true, 0, "META-INF/", 0, 9) && (upperCase.endsWith(".SF") || upperCase.endsWith(".RSA") || upperCase.endsWith(".DSA") || upperCase.endsWith(".EC")))) {
                c0050e.remove = true;
            }
        }
    }

    public void replace(String str, byte[] bArr) {
        C0050E c0050eFind = find(str);
        if (c0050eFind != null) {
            c0050eFind.replace = deflate(bArr);
            c0050eFind.replaceCrc = crc32(bArr);
            c0050eFind.replaceUncomp = bArr.length;
        }
    }

    public void writeTo(File file) throws Throwable {
        BufferedOutputStream bufferedOutputStream;
        if (file.exists() && !file.delete()) {
            throw new IOException("无法删除已存在的输出文件: " + file);
        }
        BufferedOutputStream bufferedOutputStream2 = new BufferedOutputStream(new FileOutputStream(file), 65536);
        ArrayList arrayList = new ArrayList();
        try {
            long jWriteEntry = 0;
            for (C0050E c0050e : this.entries) {
                try {
                    if (!c0050e.remove) {
                        jWriteEntry = writeEntry(bufferedOutputStream2, c0050e, jWriteEntry, arrayList);
                    }
                } catch (Throwable th) {
                    th = th;
                    bufferedOutputStream = bufferedOutputStream2;
                }
            }
            Iterator<C0050E> it = this.added.iterator();
            long jWriteEntry2 = jWriteEntry;
            while (it.hasNext()) {
                jWriteEntry2 = writeEntry(bufferedOutputStream2, it.next(), jWriteEntry2, arrayList);
            }
            long j = jWriteEntry2;
            long jWriteCentral = jWriteEntry2;
            Iterator<C0050E> it2 = arrayList.iterator();
            while (true) {
                long j2 = jWriteCentral;
                if (it2.hasNext()) {
                    jWriteCentral = writeCentral(bufferedOutputStream2, it2.next(), j2);
                } else {
                    bufferedOutputStream = bufferedOutputStream2;
                    try {
                        writeEnd(bufferedOutputStream2, arrayList.size(), j2 - j, j);
                        bufferedOutputStream.flush();
                        bufferedOutputStream.close();
                        return;
                    } catch (Throwable th2) {
                        th = th2;
                    }
                }
                bufferedOutputStream.flush();
                bufferedOutputStream.close();
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            bufferedOutputStream = bufferedOutputStream2;
        }
    }
}
