package com.android.apksig.util;

import com.android.apksig.internal.util.ByteBufferDataSource;
import com.android.apksig.internal.util.FileChannelDataSource;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

/* JADX INFO: loaded from: classes.dex */
public abstract class DataSources {
    private DataSources() {
    }

    public static DataSource asDataSource(RandomAccessFile randomAccessFile) {
        return asDataSource(randomAccessFile.getChannel());
    }

    public static DataSource asDataSource(RandomAccessFile randomAccessFile, long j, long j2) {
        return asDataSource(randomAccessFile.getChannel(), j, j2);
    }

    public static DataSource asDataSource(ByteBuffer byteBuffer) {
        if (byteBuffer != null) {
            return new ByteBufferDataSource(byteBuffer);
        }
        throw new NullPointerException();
    }

    public static DataSource asDataSource(FileChannel fileChannel) {
        if (fileChannel != null) {
            return new FileChannelDataSource(fileChannel);
        }
        throw new NullPointerException();
    }

    public static DataSource asDataSource(FileChannel fileChannel, long j, long j2) {
        if (fileChannel != null) {
            return new FileChannelDataSource(fileChannel, j, j2);
        }
        throw new NullPointerException();
    }
}
