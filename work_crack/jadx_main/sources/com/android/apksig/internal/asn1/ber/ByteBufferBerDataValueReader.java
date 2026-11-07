package com.android.apksig.internal.asn1.ber;

import java.nio.ByteBuffer;

/* JADX INFO: loaded from: classes.dex */
public class ByteBufferBerDataValueReader implements BerDataValueReader {
    private final ByteBuffer mBuf;

    public ByteBufferBerDataValueReader(ByteBuffer byteBuffer) {
        if (byteBuffer == null) {
            throw new NullPointerException("buf == null");
        }
        this.mBuf = byteBuffer;
    }

    private int readHighTagNumber() throws BerDataValueFormatException {
        int i = 0;
        while (this.mBuf.hasRemaining()) {
            byte b = this.mBuf.get();
            if (i > 16777215) {
                throw new BerDataValueFormatException("Tag number too large");
            }
            i = (i << 7) | (b & 127);
            if ((b & 128) == 0) {
                return i;
            }
        }
        throw new BerDataValueFormatException("Truncated tag number");
    }

    private int readLongFormLength(int i) throws BerDataValueFormatException {
        int i2 = i & 127;
        if (i2 > 4) {
            throw new BerDataValueFormatException("Length too large: " + i2 + " bytes");
        }
        int i3 = 0;
        for (int i4 = 0; i4 < i2; i4++) {
            if (!this.mBuf.hasRemaining()) {
                throw new BerDataValueFormatException("Truncated length");
            }
            byte b = this.mBuf.get();
            if (i3 > 8388607) {
                throw new BerDataValueFormatException("Length too large");
            }
            i3 = (i3 << 8) | (b & 255);
        }
        return i3;
    }

    private int readShortFormLength(int i) {
        return i & 127;
    }

    private int readTagNumber(byte b) throws BerDataValueFormatException {
        int tagNumber = BerEncoding.getTagNumber(b);
        return tagNumber == 31 ? readHighTagNumber() : tagNumber;
    }

    private int skipConstructedIndefiniteLengthContents() throws BerDataValueFormatException {
        int iPosition = this.mBuf.position();
        while (this.mBuf.hasRemaining()) {
            if (this.mBuf.remaining() > 1) {
                ByteBuffer byteBuffer = this.mBuf;
                if (byteBuffer.getShort(byteBuffer.position()) == 0) {
                    int iPosition2 = this.mBuf.position() - iPosition;
                    ByteBuffer byteBuffer2 = this.mBuf;
                    byteBuffer2.position(byteBuffer2.position() + 2);
                    return iPosition2;
                }
            }
            readDataValue();
        }
        throw new BerDataValueFormatException("Truncated indefinite-length contents: " + (this.mBuf.position() - iPosition) + " bytes read");
    }

    private void skipDefiniteLengthContents(int i) throws BerDataValueFormatException {
        if (this.mBuf.remaining() < i) {
            throw new BerDataValueFormatException("Truncated contents. Need: " + i + " bytes, available: " + this.mBuf.remaining());
        }
        ByteBuffer byteBuffer = this.mBuf;
        byteBuffer.position(byteBuffer.position() + i);
    }

    private int skipPrimitiveIndefiniteLengthContents() throws BerDataValueFormatException {
        boolean z = false;
        int i = 0;
        while (this.mBuf.hasRemaining()) {
            byte b = this.mBuf.get();
            i++;
            if (i < 0) {
                throw new BerDataValueFormatException("Indefinite-length contents too long");
            }
            if (b != 0) {
                z = false;
            } else {
                if (z) {
                    return i - 2;
                }
                z = true;
            }
        }
        throw new BerDataValueFormatException("Truncated indefinite-length contents: " + i + " bytes read");
    }

    @Override // com.android.apksig.internal.asn1.ber.BerDataValueReader
    public BerDataValue readDataValue() throws BerDataValueFormatException {
        int iSkipConstructedIndefiniteLengthContents;
        int i;
        int iPosition = this.mBuf.position();
        if (!this.mBuf.hasRemaining()) {
            return null;
        }
        byte b = this.mBuf.get();
        int tagNumber = readTagNumber(b);
        boolean zIsConstructed = BerEncoding.isConstructed(b);
        if (!this.mBuf.hasRemaining()) {
            throw new BerDataValueFormatException("Missing length");
        }
        int i2 = this.mBuf.get() & 255;
        if ((i2 & 128) == 0) {
            int shortFormLength = readShortFormLength(i2);
            int iPosition2 = this.mBuf.position() - iPosition;
            skipDefiniteLengthContents(shortFormLength);
            iSkipConstructedIndefiniteLengthContents = shortFormLength;
            i = iPosition2;
        } else if (i2 != 128) {
            int longFormLength = readLongFormLength(i2);
            int iPosition3 = this.mBuf.position() - iPosition;
            skipDefiniteLengthContents(longFormLength);
            iSkipConstructedIndefiniteLengthContents = longFormLength;
            i = iPosition3;
        } else {
            int iPosition4 = this.mBuf.position() - iPosition;
            iSkipConstructedIndefiniteLengthContents = zIsConstructed ? skipConstructedIndefiniteLengthContents() : skipPrimitiveIndefiniteLengthContents();
            i = iPosition4;
        }
        int iPosition5 = this.mBuf.position();
        this.mBuf.position(iPosition);
        int iLimit = this.mBuf.limit();
        this.mBuf.limit(iPosition5);
        ByteBuffer byteBufferSlice = this.mBuf.slice();
        ByteBuffer byteBuffer = this.mBuf;
        byteBuffer.position(byteBuffer.limit());
        this.mBuf.limit(iLimit);
        byteBufferSlice.position(i);
        byteBufferSlice.limit(i + iSkipConstructedIndefiniteLengthContents);
        ByteBuffer byteBufferSlice2 = byteBufferSlice.slice();
        byteBufferSlice.clear();
        return new BerDataValue(byteBufferSlice, byteBufferSlice2, BerEncoding.getTagClass(b), zIsConstructed, tagNumber);
    }
}
