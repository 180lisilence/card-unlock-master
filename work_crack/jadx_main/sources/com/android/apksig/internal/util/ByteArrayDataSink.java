package com.android.apksig.internal.util;

import com.android.apksig.util.DataSink;
import com.android.apksig.util.DataSource;
import com.android.apksig.util.ReadableDataSink;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Arrays;

/* JADX INFO: loaded from: classes.dex */
public class ByteArrayDataSink implements ReadableDataSink {
    private static final int MAX_READ_CHUNK_SIZE = 65536;
    private byte[] mArray;
    private int mSize;

    private class SliceDataSource implements DataSource {
        private final int mSliceOffset;
        private final int mSliceSize;

        private SliceDataSource(int i, int i2) {
            this.mSliceOffset = i;
            this.mSliceSize = i2;
        }

        private void checkChunkValid(long j, long j2) {
            if (j < 0) {
                throw new IndexOutOfBoundsException("offset: " + j);
            }
            if (j2 < 0) {
                throw new IndexOutOfBoundsException("size: " + j2);
            }
            int i = this.mSliceSize;
            if (j > i) {
                throw new IndexOutOfBoundsException("offset (" + j + ") > source size (" + this.mSliceSize + ")");
            }
            long j3 = j + j2;
            if (j3 < j) {
                throw new IndexOutOfBoundsException("offset (" + j + ") + size (" + j2 + ") overflow");
            }
            if (j3 > i) {
                throw new IndexOutOfBoundsException("offset (" + j + ") + size (" + j2 + ") > source size (" + this.mSliceSize + ")");
            }
        }

        @Override // com.android.apksig.util.DataSource
        public void copyTo(long j, int i, ByteBuffer byteBuffer) throws IOException {
            checkChunkValid(j, i);
            byteBuffer.put(ByteArrayDataSink.this.mArray, (int) (((long) this.mSliceOffset) + j), i);
        }

        @Override // com.android.apksig.util.DataSource
        public void feed(long j, long j2, DataSink dataSink) throws IOException {
            checkChunkValid(j, j2);
            dataSink.consume(ByteArrayDataSink.this.mArray, (int) (((long) this.mSliceOffset) + j), (int) j2);
        }

        @Override // com.android.apksig.util.DataSource
        public ByteBuffer getByteBuffer(long j, int i) throws IOException {
            checkChunkValid(j, i);
            return ByteBuffer.wrap(ByteArrayDataSink.this.mArray, (int) (((long) this.mSliceOffset) + j), i).slice();
        }

        @Override // com.android.apksig.util.DataSource
        public long size() {
            return this.mSliceSize;
        }

        @Override // com.android.apksig.util.DataSource
        public DataSource slice(long j, long j2) {
            checkChunkValid(j, j2);
            return ByteArrayDataSink.this.new SliceDataSource((int) (((long) this.mSliceOffset) + j), (int) j2);
        }
    }

    public ByteArrayDataSink() {
        this(MAX_READ_CHUNK_SIZE);
    }

    public ByteArrayDataSink(int i) {
        if (i < 0) {
            throw new IllegalArgumentException("initial capacity: " + i);
        }
        this.mArray = new byte[i];
    }

    private void checkChunkValid(long j, long j2) {
        if (j < 0) {
            throw new IndexOutOfBoundsException("offset: " + j);
        }
        if (j2 < 0) {
            throw new IndexOutOfBoundsException("size: " + j2);
        }
        int i = this.mSize;
        if (j > i) {
            throw new IndexOutOfBoundsException("offset (" + j + ") > source size (" + this.mSize + ")");
        }
        long j3 = j + j2;
        if (j3 < j) {
            throw new IndexOutOfBoundsException("offset (" + j + ") + size (" + j2 + ") overflow");
        }
        if (j3 > i) {
            throw new IndexOutOfBoundsException("offset (" + j + ") + size (" + j2 + ") > source size (" + this.mSize + ")");
        }
    }

    private void ensureAvailable(int i) throws IOException {
        if (i <= 0) {
            return;
        }
        long j = ((long) this.mSize) + ((long) i);
        byte[] bArr = this.mArray;
        if (j <= bArr.length) {
            return;
        }
        if (j > 2147483647L) {
            throw new IOException("Required capacity too large: " + j + ", max: 2147483647");
        }
        this.mArray = Arrays.copyOf(this.mArray, (int) Math.max(j, (int) Math.min(((long) bArr.length) * 2, 2147483647L)));
    }

    @Override // com.android.apksig.util.DataSink
    public void consume(ByteBuffer byteBuffer) throws IOException {
        if (byteBuffer.hasRemaining()) {
            if (byteBuffer.hasArray()) {
                consume(byteBuffer.array(), byteBuffer.arrayOffset() + byteBuffer.position(), byteBuffer.remaining());
                byteBuffer.position(byteBuffer.limit());
                return;
            }
            ensureAvailable(byteBuffer.remaining());
            byte[] bArr = new byte[Math.min(byteBuffer.remaining(), MAX_READ_CHUNK_SIZE)];
            while (byteBuffer.hasRemaining()) {
                int iMin = Math.min(byteBuffer.remaining(), bArr.length);
                byteBuffer.get(bArr, 0, iMin);
                System.arraycopy(bArr, 0, this.mArray, this.mSize, iMin);
                this.mSize += iMin;
            }
        }
    }

    @Override // com.android.apksig.util.DataSink
    public void consume(byte[] bArr, int i, int i2) throws IOException {
        if (i < 0) {
            throw new IndexOutOfBoundsException("offset: " + i);
        }
        if (i > bArr.length) {
            throw new IndexOutOfBoundsException("offset: " + i + ", buf.length: " + bArr.length);
        }
        if (i2 == 0) {
            return;
        }
        ensureAvailable(i2);
        System.arraycopy(bArr, i, this.mArray, this.mSize, i2);
        this.mSize += i2;
    }

    @Override // com.android.apksig.util.DataSource
    public void copyTo(long j, int i, ByteBuffer byteBuffer) throws IOException {
        checkChunkValid(j, i);
        byteBuffer.put(this.mArray, (int) j, i);
    }

    @Override // com.android.apksig.util.DataSource
    public void feed(long j, long j2, DataSink dataSink) throws IOException {
        checkChunkValid(j, j2);
        dataSink.consume(this.mArray, (int) j, (int) j2);
    }

    @Override // com.android.apksig.util.DataSource
    public ByteBuffer getByteBuffer(long j, int i) {
        checkChunkValid(j, i);
        return ByteBuffer.wrap(this.mArray, (int) j, i).slice();
    }

    @Override // com.android.apksig.util.DataSource
    public long size() {
        return this.mSize;
    }

    @Override // com.android.apksig.util.DataSource
    public DataSource slice(long j, long j2) {
        checkChunkValid(j, j2);
        return new SliceDataSource((int) j, (int) j2);
    }
}
