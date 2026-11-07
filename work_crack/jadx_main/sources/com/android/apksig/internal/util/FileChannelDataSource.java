package com.android.apksig.internal.util;

import com.android.apksig.util.DataSource;
import java.io.IOException;
import java.nio.BufferOverflowException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

/* JADX INFO: loaded from: classes.dex */
public class FileChannelDataSource implements DataSource {
    private static final int MAX_READ_CHUNK_SIZE = 1048576;
    private final FileChannel mChannel;
    private final long mOffset;
    private final long mSize;

    public FileChannelDataSource(FileChannel fileChannel) {
        this.mChannel = fileChannel;
        this.mOffset = 0L;
        this.mSize = -1L;
    }

    public FileChannelDataSource(FileChannel fileChannel, long j, long j2) {
        if (j < 0) {
            throw new IndexOutOfBoundsException("offset: " + j2);
        }
        if (j2 < 0) {
            throw new IndexOutOfBoundsException("size: " + j2);
        }
        this.mChannel = fileChannel;
        this.mOffset = j;
        this.mSize = j2;
    }

    private static void checkChunkValid(long j, long j2, long j3) {
        if (j < 0) {
            throw new IndexOutOfBoundsException("offset: " + j);
        }
        if (j2 < 0) {
            throw new IndexOutOfBoundsException("size: " + j2);
        }
        if (j > j3) {
            throw new IndexOutOfBoundsException("offset (" + j + ") > source size (" + j3 + ")");
        }
        long j4 = j + j2;
        if (j4 < j) {
            throw new IndexOutOfBoundsException("offset (" + j + ") + size (" + j2 + ") overflow");
        }
        if (j4 > j3) {
            throw new IndexOutOfBoundsException("offset (" + j + ") + size (" + j2 + ") > source size (" + j3 + ")");
        }
    }

    @Override // com.android.apksig.util.DataSource
    public void copyTo(long j, int i, ByteBuffer byteBuffer) throws IOException {
        int i2;
        checkChunkValid(j, i, size());
        if (i == 0) {
            return;
        }
        if (i > byteBuffer.remaining()) {
            throw new BufferOverflowException();
        }
        long j2 = this.mOffset + j;
        int i3 = i;
        int iLimit = byteBuffer.limit();
        try {
            byteBuffer.limit(byteBuffer.position() + i);
            while (i3 > 0) {
                synchronized (this.mChannel) {
                    this.mChannel.position(j2);
                    i2 = this.mChannel.read(byteBuffer);
                }
                j2 += (long) i2;
                i3 -= i2;
            }
            byteBuffer.limit(iLimit);
        } catch (Throwable th) {
            byteBuffer.limit(iLimit);
            throw th;
        }
    }

    /* JADX WARN: Bottom block not found for handler: all -> 0x006c */
    @Override // com.android.apksig.util.DataSource
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void feed(long r16, long r18, com.android.apksig.util.DataSink r20) throws java.lang.Throwable {
        /*
            r15 = this;
            r1 = r15
            long r8 = r15.size()
            r2 = r16
            r4 = r18
            r6 = r8
            checkChunkValid(r2, r4, r6)
            r2 = 0
            int r0 = (r18 > r2 ? 1 : (r18 == r2 ? 0 : -1))
            if (r0 != 0) goto L14
            return
        L14:
            long r4 = r1.mOffset
            long r4 = r4 + r16
            r6 = r18
            r10 = 1048576(0x100000, double:5.180654E-318)
            long r10 = java.lang.Math.min(r6, r10)
            int r0 = (int) r10
            java.nio.ByteBuffer r10 = java.nio.ByteBuffer.allocateDirect(r0)
        L26:
            int r0 = (r6 > r2 ? 1 : (r6 == r2 ? 0 : -1))
            if (r0 <= 0) goto L6e
            int r0 = r10.capacity()
            long r11 = (long) r0
            long r11 = java.lang.Math.min(r6, r11)
            int r11 = (int) r11
            r12 = r11
            r10.limit(r11)
            java.nio.channels.FileChannel r13 = r1.mChannel
            monitor-enter(r13)
            java.nio.channels.FileChannel r0 = r1.mChannel     // Catch: java.lang.Throwable -> L67
            r0.position(r4)     // Catch: java.lang.Throwable -> L67
        L40:
            if (r12 <= 0) goto L54
            java.nio.channels.FileChannel r0 = r1.mChannel     // Catch: java.lang.Throwable -> L67
            int r0 = r0.read(r10)     // Catch: java.lang.Throwable -> L67
            if (r0 < 0) goto L4c
            int r12 = r12 - r0
            goto L40
        L4c:
            java.io.IOException r2 = new java.io.IOException     // Catch: java.lang.Throwable -> L67
            java.lang.String r3 = "Unexpected EOF encountered"
            r2.<init>(r3)     // Catch: java.lang.Throwable -> L67
            throw r2     // Catch: java.lang.Throwable -> L67
        L54:
            monitor-exit(r13)     // Catch: java.lang.Throwable -> L67
            r10.flip()
            r14 = r20
            r14.consume(r10)
            r10.clear()
            long r2 = (long) r11
            long r4 = r4 + r2
            long r2 = (long) r11
            long r6 = r6 - r2
            r2 = 0
            goto L26
        L67:
            r0 = move-exception
            r14 = r20
        L6a:
            monitor-exit(r13)     // Catch: java.lang.Throwable -> L6c
            throw r0
        L6c:
            r0 = move-exception
            goto L6a
        L6e:
            r14 = r20
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.android.apksig.internal.util.FileChannelDataSource.feed(long, long, com.android.apksig.util.DataSink):void");
    }

    @Override // com.android.apksig.util.DataSource
    public ByteBuffer getByteBuffer(long j, int i) throws IOException {
        if (i < 0) {
            throw new IndexOutOfBoundsException("size: " + i);
        }
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(i);
        copyTo(j, i, byteBufferAllocate);
        byteBufferAllocate.flip();
        return byteBufferAllocate;
    }

    @Override // com.android.apksig.util.DataSource
    public long size() {
        long j = this.mSize;
        if (j != -1) {
            return j;
        }
        try {
            return this.mChannel.size();
        } catch (IOException e) {
            return 0L;
        }
    }

    @Override // com.android.apksig.util.DataSource
    public FileChannelDataSource slice(long j, long j2) {
        long size = size();
        checkChunkValid(j, j2, size);
        return (j == 0 && j2 == size) ? this : new FileChannelDataSource(this.mChannel, this.mOffset + j, j2);
    }
}
