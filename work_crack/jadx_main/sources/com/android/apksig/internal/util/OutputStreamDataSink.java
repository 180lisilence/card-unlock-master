package com.android.apksig.internal.util;

import com.android.apksig.util.DataSink;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;

/* JADX INFO: loaded from: classes.dex */
public class OutputStreamDataSink implements DataSink {
    private static final int MAX_READ_CHUNK_SIZE = 65536;
    private final OutputStream mOut;

    public OutputStreamDataSink(OutputStream outputStream) {
        if (outputStream == null) {
            throw new NullPointerException("out == null");
        }
        this.mOut = outputStream;
    }

    @Override // com.android.apksig.util.DataSink
    public void consume(ByteBuffer byteBuffer) throws IOException {
        if (byteBuffer.hasRemaining()) {
            if (byteBuffer.hasArray()) {
                this.mOut.write(byteBuffer.array(), byteBuffer.arrayOffset() + byteBuffer.position(), byteBuffer.remaining());
                byteBuffer.position(byteBuffer.limit());
                return;
            }
            byte[] bArr = new byte[Math.min(byteBuffer.remaining(), MAX_READ_CHUNK_SIZE)];
            while (byteBuffer.hasRemaining()) {
                int iMin = Math.min(byteBuffer.remaining(), bArr.length);
                byteBuffer.get(bArr, 0, iMin);
                this.mOut.write(bArr, 0, iMin);
            }
        }
    }

    @Override // com.android.apksig.util.DataSink
    public void consume(byte[] bArr, int i, int i2) throws IOException {
        this.mOut.write(bArr, i, i2);
    }

    public OutputStream getOutputStream() {
        return this.mOut;
    }
}
