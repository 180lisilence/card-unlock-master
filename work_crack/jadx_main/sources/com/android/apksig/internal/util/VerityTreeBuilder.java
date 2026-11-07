package com.android.apksig.internal.util;

import com.android.apksig.internal.zip.ZipUtils;
import com.android.apksig.util.DataSink;
import com.android.apksig.util.DataSource;
import com.android.apksig.util.DataSources;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Phaser;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public class VerityTreeBuilder implements AutoCloseable {
    private static final int CHUNK_SIZE = 4096;
    private static final int DIGEST_PARALLELISM = Math.min(32, Runtime.getRuntime().availableProcessors());
    private static final String JCA_ALGORITHM = "SHA-256";
    private static final int MAX_OUTSTANDING_CHUNKS = 4;
    private static final int MAX_PREFETCH_CHUNKS = 1024;
    private static final int MIN_CHUNKS_PER_WORKER = 8;
    private final ExecutorService mExecutor;
    private final MessageDigest mMd;
    private final byte[] mSalt;

    public VerityTreeBuilder(byte[] bArr) throws NoSuchAlgorithmException {
        int i = DIGEST_PARALLELISM;
        this.mExecutor = new ThreadPoolExecutor(i, i, 0L, TimeUnit.MILLISECONDS, new ArrayBlockingQueue(4), new ThreadPoolExecutor.CallerRunsPolicy());
        this.mSalt = bArr;
        this.mMd = getNewMessageDigest();
    }

    private static int[] calculateLevelOffset(long j, int i) {
        ArrayList arrayList = new ArrayList();
        while (true) {
            long jDivideRoundup = divideRoundup(j, 4096L);
            arrayList.add(Long.valueOf(divideRoundup(((long) i) * jDivideRoundup, 4096L) * 4096));
            if (((long) i) * jDivideRoundup <= 4096) {
                break;
            }
            j = jDivideRoundup * ((long) i);
        }
        int[] iArr = new int[arrayList.size() + 1];
        iArr[0] = 0;
        for (int i2 = 0; i2 < arrayList.size(); i2++) {
            iArr[i2 + 1] = iArr[i2] + Math.toIntExact(((Long) arrayList.get((arrayList.size() - i2) - 1)).longValue());
        }
        return iArr;
    }

    private MessageDigest cloneMessageDigest() {
        try {
            return (MessageDigest) this.mMd.clone();
        } catch (CloneNotSupportedException e) {
            try {
                return getNewMessageDigest();
            } catch (NoSuchAlgorithmException e2) {
                throw new IllegalStateException("Failed to obtain an instance of a previously available message digest", e2);
            }
        }
    }

    private void digestDataByChunks(DataSource dataSource, DataSink dataSink) throws IOException {
        long size = dataSource.size();
        long j = 4096;
        final byte[][] bArr = new byte[(int) divideRoundup(size, 4096L)][];
        final Phaser phaser = new Phaser(1);
        int i = 0;
        long j2 = 0;
        while (j2 < size) {
            int iMin = (int) (Math.min(4194304 + j2, size) - j2);
            long j3 = size;
            int iDivideRoundup = (int) divideRoundup(iMin, j);
            final ByteBuffer byteBufferAllocate = ByteBuffer.allocate(iDivideRoundup * 4096);
            dataSource.copyTo(j2, iMin, byteBufferAllocate);
            byteBufferAllocate.rewind();
            final int i2 = i;
            Runnable runnable = new Runnable() { // from class: com.android.apksig.internal.util.VerityTreeBuilder$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    this.f$0.m1x53c710b9(byteBufferAllocate, i2, bArr, phaser);
                }
            };
            phaser.register();
            this.mExecutor.execute(runnable);
            i += iDivideRoundup;
            j2 += (long) iMin;
            size = j3;
            j = 4096;
        }
        phaser.arriveAndAwaitAdvance();
        for (byte[] bArr2 : bArr) {
            dataSink.consume(bArr2, 0, bArr2.length);
        }
    }

    private static long divideRoundup(long j, long j2) {
        return ((j + j2) - 1) / j2;
    }

    private static MessageDigest getNewMessageDigest() throws NoSuchAlgorithmException {
        return MessageDigest.getInstance(JCA_ALGORITHM);
    }

    private byte[] saltedDigest(ByteBuffer byteBuffer) {
        return saltedDigest(this.mMd, byteBuffer);
    }

    private byte[] saltedDigest(MessageDigest messageDigest, ByteBuffer byteBuffer) {
        messageDigest.reset();
        byte[] bArr = this.mSalt;
        if (bArr != null) {
            messageDigest.update(bArr);
        }
        messageDigest.update(byteBuffer);
        return messageDigest.digest();
    }

    private static ByteBuffer slice(ByteBuffer byteBuffer, int i, int i2) {
        ByteBuffer byteBufferDuplicate = byteBuffer.duplicate();
        byteBufferDuplicate.position(0);
        byteBufferDuplicate.limit(i2);
        byteBufferDuplicate.position(i);
        return byteBufferDuplicate.slice();
    }

    @Override // java.lang.AutoCloseable
    public void close() {
        this.mExecutor.shutdownNow();
    }

    public ByteBuffer generateVerityTree(DataSource dataSource) throws IOException {
        DataSource dataSourceAsDataSource;
        int digestLength = this.mMd.getDigestLength();
        int[] iArrCalculateLevelOffset = calculateLevelOffset(dataSource.size(), digestLength);
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(iArrCalculateLevelOffset[iArrCalculateLevelOffset.length - 1]);
        for (int length = iArrCalculateLevelOffset.length - 2; length >= 0; length--) {
            ByteBufferSink byteBufferSink = new ByteBufferSink(slice(byteBufferAllocate, iArrCalculateLevelOffset[length], iArrCalculateLevelOffset[length + 1]));
            if (length == iArrCalculateLevelOffset.length - 2) {
                dataSourceAsDataSource = dataSource;
                digestDataByChunks(dataSourceAsDataSource, byteBufferSink);
            } else {
                dataSourceAsDataSource = DataSources.asDataSource(slice(byteBufferAllocate.asReadOnlyBuffer(), iArrCalculateLevelOffset[length + 1], iArrCalculateLevelOffset[length + 2]));
                digestDataByChunks(dataSourceAsDataSource, byteBufferSink);
            }
            int iDivideRoundup = (int) ((divideRoundup(dataSourceAsDataSource.size(), 4096L) * ((long) digestLength)) % 4096);
            if (iDivideRoundup > 0) {
                byte[] bArr = new byte[4096 - iDivideRoundup];
                byteBufferSink.consume(bArr, 0, bArr.length);
            }
        }
        return byteBufferAllocate;
    }

    public byte[] generateVerityTreeRootHash(DataSource dataSource) throws IOException {
        return getRootHashFromTree(generateVerityTree(dataSource));
    }

    public byte[] generateVerityTreeRootHash(DataSource dataSource, DataSource dataSource2, DataSource dataSource3) throws IOException {
        if (dataSource.size() % 4096 != 0) {
            throw new IllegalStateException("APK Signing Block size not a multiple of 4096: " + dataSource.size());
        }
        long size = dataSource.size();
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate((int) dataSource3.size());
        byteBufferAllocate.order(ByteOrder.LITTLE_ENDIAN);
        dataSource3.copyTo(0L, (int) dataSource3.size(), byteBufferAllocate);
        byteBufferAllocate.flip();
        ZipUtils.setZipEocdCentralDirectoryOffset(byteBufferAllocate, size);
        return generateVerityTreeRootHash(new ChainedDataSource(dataSource, dataSource2, DataSources.asDataSource(byteBufferAllocate)));
    }

    public byte[] getRootHashFromTree(ByteBuffer byteBuffer) throws IOException {
        return saltedDigest(slice(byteBuffer.asReadOnlyBuffer(), 0, 4096));
    }

    /* JADX INFO: renamed from: lambda$digestDataByChunks$0$com-android-apksig-internal-util-VerityTreeBuilder */
    /* synthetic */ void m1x53c710b9(ByteBuffer byteBuffer, int i, byte[][] bArr, Phaser phaser) {
        MessageDigest messageDigestCloneMessageDigest = cloneMessageDigest();
        int i2 = 0;
        int iCapacity = byteBuffer.capacity();
        int i3 = i;
        while (i2 < iCapacity) {
            bArr[i3] = saltedDigest(messageDigestCloneMessageDigest, slice(byteBuffer, i2, i2 + 4096));
            i2 += 4096;
            i3++;
        }
        phaser.arriveAndDeregister();
    }
}
