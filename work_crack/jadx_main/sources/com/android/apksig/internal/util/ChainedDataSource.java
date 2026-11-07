package com.android.apksig.internal.util;

import com.android.apksig.util.DataSink;
import com.android.apksig.util.DataSource;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.function.ToLongFunction;

/* JADX INFO: loaded from: classes.dex */
public class ChainedDataSource implements DataSource {
    private final DataSource[] mSources;
    private final long mTotalSize;

    public ChainedDataSource(DataSource... dataSourceArr) {
        this.mSources = dataSourceArr;
        this.mTotalSize = Arrays.stream(dataSourceArr).mapToLong(new ToLongFunction() { // from class: com.android.apksig.internal.util.ChainedDataSource$$ExternalSyntheticLambda0
            @Override // java.util.function.ToLongFunction
            public final long applyAsLong(Object obj) {
                return ((DataSource) obj).size();
            }
        }).sum();
    }

    private Pair<Integer, Long> locateDataSource(long j) {
        long size = j;
        int i = 0;
        while (true) {
            DataSource[] dataSourceArr = this.mSources;
            if (i >= dataSourceArr.length) {
                throw new IndexOutOfBoundsException("Access is out of bound, offset: " + j + ", totalSize: " + this.mTotalSize);
            }
            if (size < dataSourceArr[i].size()) {
                return Pair.m0of(Integer.valueOf(i), Long.valueOf(size));
            }
            size -= this.mSources[i].size();
            i++;
        }
    }

    @Override // com.android.apksig.util.DataSource
    public void copyTo(long j, int i, ByteBuffer byteBuffer) throws IOException {
        feed(j, i, new ByteBufferSink(byteBuffer));
    }

    @Override // com.android.apksig.util.DataSource
    public void feed(long j, long j2, DataSink dataSink) throws IOException {
        if (j + j2 > this.mTotalSize) {
            throw new IndexOutOfBoundsException("Requested more than available");
        }
        long size = j;
        long j3 = j2;
        for (DataSource dataSource : this.mSources) {
            if (size >= dataSource.size()) {
                size -= dataSource.size();
            } else {
                long size2 = dataSource.size() - size;
                if (size2 >= j3) {
                    dataSource.feed(size, j3, dataSink);
                    return;
                } else {
                    dataSource.feed(size, size2, dataSink);
                    j3 -= size2;
                    size = 0;
                }
            }
        }
    }

    @Override // com.android.apksig.util.DataSource
    public ByteBuffer getByteBuffer(long j, int i) throws IOException {
        if (((long) i) + j > this.mTotalSize) {
            throw new IndexOutOfBoundsException("Requested more than available");
        }
        Pair<Integer, Long> pairLocateDataSource = locateDataSource(j);
        int iIntValue = pairLocateDataSource.getFirst().intValue();
        long jLongValue = pairLocateDataSource.getSecond().longValue();
        if (((long) i) + jLongValue <= this.mSources[iIntValue].size()) {
            return this.mSources[iIntValue].getByteBuffer(jLongValue, i);
        }
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(i);
        while (iIntValue < this.mSources.length && byteBufferAllocate.hasRemaining()) {
            this.mSources[iIntValue].copyTo(jLongValue, Math.toIntExact(Math.min(this.mSources[iIntValue].size() - jLongValue, byteBufferAllocate.remaining())), byteBufferAllocate);
            jLongValue = 0;
            iIntValue++;
        }
        byteBufferAllocate.rewind();
        return byteBufferAllocate;
    }

    @Override // com.android.apksig.util.DataSource
    public long size() {
        return this.mTotalSize;
    }

    @Override // com.android.apksig.util.DataSource
    public DataSource slice(long j, long j2) {
        Pair<Integer, Long> pairLocateDataSource = locateDataSource(j);
        int iIntValue = pairLocateDataSource.getFirst().intValue();
        long jLongValue = pairLocateDataSource.getSecond().longValue();
        DataSource dataSource = this.mSources[iIntValue];
        if (jLongValue + j2 <= dataSource.size()) {
            return dataSource.slice(jLongValue, j2);
        }
        ArrayList arrayList = new ArrayList();
        arrayList.add(dataSource.slice(jLongValue, dataSource.size() - jLongValue));
        Pair<Integer, Long> pairLocateDataSource2 = locateDataSource((j + j2) - 1);
        int iIntValue2 = pairLocateDataSource2.getFirst().intValue();
        long jLongValue2 = pairLocateDataSource2.getSecond().longValue();
        for (int i = iIntValue + 1; i < iIntValue2; i++) {
            arrayList.add(this.mSources[i]);
        }
        arrayList.add(this.mSources[iIntValue2].slice(0L, jLongValue2 + 1));
        return new ChainedDataSource((DataSource[]) arrayList.toArray(new DataSource[0]));
    }
}
