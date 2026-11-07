package com.android.apksig.internal.asn1;

import com.android.apksig.ApkVerificationIssue;
import com.android.apksig.internal.asn1.ber.BerEncoding;
import java.io.ByteArrayOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class Asn1DerEncoder {
    public static final Asn1OpaqueObject ASN1_DER_NULL = new Asn1OpaqueObject(new byte[]{5, 0});

    /* JADX INFO: renamed from: com.android.apksig.internal.asn1.Asn1DerEncoder$1 */
    static /* synthetic */ class C00201 {
        static final /* synthetic */ int[] $SwitchMap$com$android$apksig$internal$asn1$Asn1Tagging;
        static final /* synthetic */ int[] $SwitchMap$com$android$apksig$internal$asn1$Asn1Type;

        static {
            int[] iArr = new int[Asn1Tagging.values().length];
            $SwitchMap$com$android$apksig$internal$asn1$Asn1Tagging = iArr;
            try {
                iArr[Asn1Tagging.NORMAL.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Tagging[Asn1Tagging.EXPLICIT.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Tagging[Asn1Tagging.IMPLICIT.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            int[] iArr2 = new int[Asn1Type.values().length];
            $SwitchMap$com$android$apksig$internal$asn1$Asn1Type = iArr2;
            try {
                iArr2[Asn1Type.CHOICE.ordinal()] = 1;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.SEQUENCE.ordinal()] = 2;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.UNENCODED_CONTAINER.ordinal()] = 3;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.OCTET_STRING.ordinal()] = 4;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.BIT_STRING.ordinal()] = 5;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.INTEGER.ordinal()] = 6;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.BOOLEAN.ordinal()] = 7;
            } catch (NoSuchFieldError e10) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.UTC_TIME.ordinal()] = 8;
            } catch (NoSuchFieldError e11) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.GENERALIZED_TIME.ordinal()] = 9;
            } catch (NoSuchFieldError e12) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.OBJECT_IDENTIFIER.ordinal()] = 10;
            } catch (NoSuchFieldError e13) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.SET_OF.ordinal()] = 11;
            } catch (NoSuchFieldError e14) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.SEQUENCE_OF.ordinal()] = 12;
            } catch (NoSuchFieldError e15) {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    static final class AnnotatedField {
        private final Asn1Field mAnnotation;
        private final Asn1Type mDataType;
        private final int mDerTagClass;
        private final int mDerTagNumber;
        private final Asn1Type mElementDataType;
        private final Field mField;
        private final Object mObject;
        private final boolean mOptional;
        private final Asn1TagClass mTagClass;
        private final Asn1Tagging mTagging;

        public AnnotatedField(Object obj, Field field, Asn1Field asn1Field) throws Asn1EncodingException {
            this.mObject = obj;
            this.mField = field;
            this.mAnnotation = asn1Field;
            Asn1Type asn1TypeType = asn1Field.type();
            this.mDataType = asn1TypeType;
            this.mElementDataType = asn1Field.elementType();
            Asn1TagClass asn1TagClassCls = asn1Field.cls();
            asn1TagClassCls = asn1TagClassCls == Asn1TagClass.AUTOMATIC ? asn1Field.tagNumber() != -1 ? Asn1TagClass.CONTEXT_SPECIFIC : Asn1TagClass.UNIVERSAL : asn1TagClassCls;
            this.mTagClass = asn1TagClassCls;
            this.mDerTagClass = BerEncoding.getTagClass(asn1TagClassCls);
            this.mDerTagNumber = asn1Field.tagNumber() != -1 ? asn1Field.tagNumber() : (asn1TypeType == Asn1Type.CHOICE || asn1TypeType == Asn1Type.ANY) ? -1 : BerEncoding.getTagNumber(asn1TypeType);
            Asn1Tagging asn1TaggingTagging = asn1Field.tagging();
            this.mTagging = asn1TaggingTagging;
            if ((asn1TaggingTagging == Asn1Tagging.EXPLICIT || asn1TaggingTagging == Asn1Tagging.IMPLICIT) && asn1Field.tagNumber() == -1) {
                throw new Asn1EncodingException("Tag number must be specified when tagging mode is " + asn1TaggingTagging);
            }
            this.mOptional = asn1Field.optional();
        }

        public Asn1Field getAnnotation() {
            return this.mAnnotation;
        }

        public Field getField() {
            return this.mField;
        }

        public byte[] toDer() throws Asn1EncodingException {
            Object memberFieldValue = Asn1DerEncoder.getMemberFieldValue(this.mObject, this.mField);
            if (memberFieldValue == null) {
                if (this.mOptional) {
                    return null;
                }
                throw new Asn1EncodingException("Required field not set");
            }
            byte[] der = JavaToDerConverter.toDer(memberFieldValue, this.mDataType, this.mElementDataType);
            switch (C00201.$SwitchMap$com$android$apksig$internal$asn1$Asn1Tagging[this.mTagging.ordinal()]) {
                case 1:
                    return der;
                case 2:
                    return Asn1DerEncoder.createTag(this.mDerTagClass, true, this.mDerTagNumber, der);
                case 3:
                    if (BerEncoding.getTagNumber(der[0]) == 31) {
                        throw new Asn1EncodingException("High-tag-number form not supported");
                    }
                    int i = this.mDerTagNumber;
                    if (i >= 31) {
                        throw new Asn1EncodingException("Unsupported high tag number: " + this.mDerTagNumber);
                    }
                    der[0] = BerEncoding.setTagNumber(der[0], i);
                    der[0] = BerEncoding.setTagClass(der[0], this.mDerTagClass);
                    return der;
                default:
                    throw new RuntimeException("Unknown tagging mode: " + this.mTagging);
            }
        }
    }

    private static class ByteArrayLexicographicComparator implements Comparator<byte[]> {
        private static final ByteArrayLexicographicComparator INSTANCE = new ByteArrayLexicographicComparator();

        private ByteArrayLexicographicComparator() {
        }

        @Override // java.util.Comparator
        public int compare(byte[] bArr, byte[] bArr2) {
            int iMin = Math.min(bArr.length, bArr2.length);
            for (int i = 0; i < iMin; i++) {
                int i2 = (bArr[i] & 255) - (bArr2[i] & 255);
                if (i2 != 0) {
                    return i2;
                }
            }
            return bArr.length - bArr2.length;
        }
    }

    private static final class JavaToDerConverter {
        private JavaToDerConverter() {
        }

        public static byte[] toDer(Object obj, Asn1Type asn1Type, Asn1Type asn1Type2) throws Asn1EncodingException {
            Class<?> cls = obj.getClass();
            if (Asn1OpaqueObject.class.equals(cls)) {
                ByteBuffer encoded = ((Asn1OpaqueObject) obj).getEncoded();
                byte[] bArr = new byte[encoded.remaining()];
                encoded.get(bArr);
                return bArr;
            }
            if (asn1Type == null || asn1Type == Asn1Type.ANY) {
                return Asn1DerEncoder.encode(obj);
            }
            switch (C00201.$SwitchMap$com$android$apksig$internal$asn1$Asn1Type[asn1Type.ordinal()]) {
                case 1:
                    Asn1Class asn1Class = (Asn1Class) cls.getDeclaredAnnotation(Asn1Class.class);
                    if (asn1Class != null && asn1Class.type() == Asn1Type.CHOICE) {
                        return Asn1DerEncoder.toChoice(obj);
                    }
                    break;
                case 2:
                    Asn1Class asn1Class2 = (Asn1Class) cls.getDeclaredAnnotation(Asn1Class.class);
                    if (asn1Class2 != null && asn1Class2.type() == Asn1Type.SEQUENCE) {
                        return Asn1DerEncoder.toSequence(obj);
                    }
                    break;
                case 4:
                case 5:
                    byte[] bArr2 = null;
                    if (obj instanceof ByteBuffer) {
                        ByteBuffer byteBuffer = (ByteBuffer) obj;
                        bArr2 = new byte[byteBuffer.remaining()];
                        byteBuffer.slice().get(bArr2);
                    } else if (obj instanceof byte[]) {
                        bArr2 = (byte[]) obj;
                    }
                    if (bArr2 != null) {
                        return Asn1DerEncoder.createTag(0, false, BerEncoding.getTagNumber(asn1Type), bArr2);
                    }
                    break;
                case 6:
                    if (obj instanceof Integer) {
                        return Asn1DerEncoder.toInteger(((Integer) obj).intValue());
                    }
                    if (obj instanceof Long) {
                        return Asn1DerEncoder.toInteger(((Long) obj).longValue());
                    }
                    if (obj instanceof BigInteger) {
                        return Asn1DerEncoder.toInteger((BigInteger) obj);
                    }
                    break;
                case ApkVerificationIssue.V2_SIG_NO_CERTIFICATES /* 7 */:
                    if (obj instanceof Boolean) {
                        return Asn1DerEncoder.toBoolean(((Boolean) obj).booleanValue());
                    }
                    break;
                case ApkVerificationIssue.V2_SIG_MALFORMED_DIGEST /* 8 */:
                case 9:
                    if (obj instanceof String) {
                        return Asn1DerEncoder.createTag(0, false, BerEncoding.getTagNumber(asn1Type), ((String) obj).getBytes());
                    }
                    break;
                case ApkVerificationIssue.V3_SIG_NO_SIGNERS /* 10 */:
                    if (obj instanceof String) {
                        return Asn1DerEncoder.toOid((String) obj);
                    }
                    break;
                case 11:
                    return Asn1DerEncoder.toSetOf((Collection) obj, asn1Type2);
                case ApkVerificationIssue.V3_SIG_MALFORMED_SIGNATURE /* 12 */:
                    return Asn1DerEncoder.toSequenceOf((Collection) obj, asn1Type2);
            }
            throw new Asn1EncodingException("Unsupported conversion: " + cls.getName() + " to ASN.1 " + asn1Type);
        }
    }

    private Asn1DerEncoder() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static byte[] createTag(int i, boolean z, int i2, byte[]... bArr) {
        int length;
        byte[] bArr2;
        if (i2 >= 31) {
            throw new IllegalArgumentException("High tag numbers not supported: " + i2);
        }
        byte b = (byte) ((i << 6) | (z ? 32 : 0) | i2);
        int length2 = 0;
        for (byte[] bArr3 : bArr) {
            length2 += bArr3.length;
        }
        if (length2 < 128) {
            length = 2;
            bArr2 = new byte[2 + length2];
            bArr2[0] = b;
            bArr2[1] = (byte) length2;
        } else {
            if (length2 <= 255) {
                byte[] bArr4 = new byte[3 + length2];
                bArr4[1] = -127;
                bArr4[2] = (byte) length2;
                length = 3;
                bArr2 = bArr4;
            } else if (length2 <= 65535) {
                byte[] bArr5 = new byte[4 + length2];
                bArr5[1] = -126;
                bArr5[2] = (byte) (length2 >> 8);
                bArr5[3] = (byte) (length2 & 255);
                length = 4;
                bArr2 = bArr5;
            } else if (length2 <= 16777215) {
                byte[] bArr6 = new byte[5 + length2];
                bArr6[1] = -125;
                bArr6[2] = (byte) (length2 >> 16);
                bArr6[3] = (byte) ((length2 >> 8) & 255);
                bArr6[4] = (byte) (length2 & 255);
                length = 5;
                bArr2 = bArr6;
            } else {
                byte[] bArr7 = new byte[6 + length2];
                bArr7[1] = -124;
                bArr7[2] = (byte) (length2 >> 24);
                bArr7[3] = (byte) ((length2 >> 16) & 255);
                bArr7[4] = (byte) ((length2 >> 8) & 255);
                bArr7[5] = (byte) (length2 & 255);
                length = 6;
                bArr2 = bArr7;
            }
            bArr2[0] = b;
        }
        for (byte[] bArr8 : bArr) {
            System.arraycopy(bArr8, 0, bArr2, length, bArr8.length);
            length += bArr8.length;
        }
        return bArr2;
    }

    public static byte[] encode(Object obj) throws Asn1EncodingException {
        Class<?> cls = obj.getClass();
        Asn1Class asn1Class = (Asn1Class) cls.getDeclaredAnnotation(Asn1Class.class);
        if (asn1Class == null) {
            throw new Asn1EncodingException(cls.getName() + " not annotated with " + Asn1Class.class.getName());
        }
        Asn1Type asn1TypeType = asn1Class.type();
        switch (C00201.$SwitchMap$com$android$apksig$internal$asn1$Asn1Type[asn1TypeType.ordinal()]) {
            case 1:
                return toChoice(obj);
            case 2:
                return toSequence(obj);
            case 3:
                return toSequence(obj, true);
            default:
                throw new Asn1EncodingException("Unsupported container type: " + asn1TypeType);
        }
    }

    private static List<AnnotatedField> getAnnotatedFields(Object obj) throws Asn1EncodingException {
        Class<?> cls = obj.getClass();
        Field[] declaredFields = cls.getDeclaredFields();
        ArrayList arrayList = new ArrayList(declaredFields.length);
        for (Field field : declaredFields) {
            Asn1Field asn1Field = (Asn1Field) field.getDeclaredAnnotation(Asn1Field.class);
            if (asn1Field != null) {
                if (Modifier.isStatic(field.getModifiers())) {
                    throw new Asn1EncodingException(Asn1Field.class.getName() + " used on a static field: " + cls.getName() + "." + field.getName());
                }
                try {
                    arrayList.add(new AnnotatedField(obj, field, asn1Field));
                } catch (Asn1EncodingException e) {
                    throw new Asn1EncodingException("Invalid ASN.1 annotation on " + cls.getName() + "." + field.getName(), e);
                }
            }
        }
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Object getMemberFieldValue(Object obj, Field field) throws Asn1EncodingException {
        try {
            return field.get(obj);
        } catch (ReflectiveOperationException e) {
            throw new Asn1EncodingException("Failed to read " + obj.getClass().getName() + "." + field.getName(), e);
        }
    }

    static /* synthetic */ int lambda$toSequence$0(AnnotatedField annotatedField, AnnotatedField annotatedField2) {
        return annotatedField.getAnnotation().index() - annotatedField2.getAnnotation().index();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static byte[] toBoolean(boolean z) {
        byte[] bArr = new byte[1];
        if (z) {
            bArr[0] = 1;
        } else {
            bArr[0] = 0;
        }
        return createTag(0, false, 1, bArr);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static byte[] toChoice(Object obj) throws Asn1EncodingException {
        Class<?> cls = obj.getClass();
        List<AnnotatedField> annotatedFields = getAnnotatedFields(obj);
        if (annotatedFields.isEmpty()) {
            throw new Asn1EncodingException("No fields annotated with " + Asn1Field.class.getName() + " in CHOICE class " + cls.getName());
        }
        AnnotatedField annotatedField = null;
        for (AnnotatedField annotatedField2 : annotatedFields) {
            if (getMemberFieldValue(obj, annotatedField2.getField()) != null) {
                if (annotatedField != null) {
                    throw new Asn1EncodingException("Multiple non-null fields in CHOICE class " + cls.getName() + ": " + annotatedField.getField().getName() + ", " + annotatedField2.getField().getName());
                }
                annotatedField = annotatedField2;
            }
        }
        if (annotatedField != null) {
            return annotatedField.toDer();
        }
        throw new Asn1EncodingException("No non-null fields in CHOICE class " + cls.getName());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static byte[] toInteger(int i) {
        return toInteger(i);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static byte[] toInteger(long j) {
        return toInteger(BigInteger.valueOf(j));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static byte[] toInteger(BigInteger bigInteger) {
        return createTag(0, false, 2, bigInteger.toByteArray());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static byte[] toOid(String str) throws Asn1EncodingException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        String[] strArrSplit = str.split("\\.");
        if (strArrSplit.length < 2) {
            throw new Asn1EncodingException("OBJECT IDENTIFIER must contain at least two nodes: " + str);
        }
        try {
            int i = Integer.parseInt(strArrSplit[0]);
            if (i > 6 || i < 0) {
                throw new Asn1EncodingException("Invalid value for node #1: " + i);
            }
            try {
                int i2 = Integer.parseInt(strArrSplit[1]);
                if (i2 >= 40 || i2 < 0) {
                    throw new Asn1EncodingException("Invalid value for node #2: " + i2);
                }
                int i3 = (i * 40) + i2;
                if (i3 > 255) {
                    throw new Asn1EncodingException("First two nodes out of range: " + i + "." + i2);
                }
                byteArrayOutputStream.write(i3);
                for (int i4 = 2; i4 < strArrSplit.length; i4++) {
                    String str2 = strArrSplit[i4];
                    try {
                        int i5 = Integer.parseInt(str2);
                        if (i5 < 0) {
                            throw new Asn1EncodingException("Invalid value for node #" + (i4 + 1) + ": " + i5);
                        }
                        if (i5 <= 127) {
                            byteArrayOutputStream.write(i5);
                        } else if (i5 < 16384) {
                            byteArrayOutputStream.write((i5 >> 7) | 128);
                            byteArrayOutputStream.write(i5 & 127);
                        } else {
                            if (i5 >= 2097152) {
                                throw new Asn1EncodingException("Node #" + (i4 + 1) + " too large: " + i5);
                            }
                            byteArrayOutputStream.write((i5 >> 14) | 128);
                            byteArrayOutputStream.write((127 & (i5 >> 7)) | 128);
                            byteArrayOutputStream.write(i5 & 127);
                        }
                    } catch (NumberFormatException e) {
                        throw new Asn1EncodingException("Node #" + (i4 + 1) + " not numeric: " + str2);
                    }
                }
                return createTag(0, false, 6, byteArrayOutputStream.toByteArray());
            } catch (NumberFormatException e2) {
                throw new Asn1EncodingException("Node #2 not numeric: " + strArrSplit[1]);
            }
        } catch (NumberFormatException e3) {
            throw new Asn1EncodingException("Node #1 not numeric: " + strArrSplit[0]);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static byte[] toSequence(Object obj) throws Asn1EncodingException {
        return toSequence(obj, false);
    }

    private static byte[] toSequence(Object obj, boolean z) throws Asn1EncodingException {
        Class<?> cls = obj.getClass();
        List<AnnotatedField> annotatedFields = getAnnotatedFields(obj);
        Collections.sort(annotatedFields, new Comparator() { // from class: com.android.apksig.internal.asn1.Asn1DerEncoder$$ExternalSyntheticLambda0
            @Override // java.util.Comparator
            public final int compare(Object obj2, Object obj3) {
                return Asn1DerEncoder.lambda$toSequence$0((Asn1DerEncoder.AnnotatedField) obj2, (Asn1DerEncoder.AnnotatedField) obj3);
            }
        });
        if (annotatedFields.size() > 1) {
            AnnotatedField annotatedField = null;
            for (AnnotatedField annotatedField2 : annotatedFields) {
                if (annotatedField != null && annotatedField.getAnnotation().index() == annotatedField2.getAnnotation().index()) {
                    throw new Asn1EncodingException("Fields have the same index: " + cls.getName() + "." + annotatedField.getField().getName() + " and ." + annotatedField2.getField().getName());
                }
                annotatedField = annotatedField2;
            }
        }
        ArrayList<byte[]> arrayList = new ArrayList(annotatedFields.size());
        int length = 0;
        for (AnnotatedField annotatedField3 : annotatedFields) {
            try {
                byte[] der = annotatedField3.toDer();
                if (der != null) {
                    arrayList.add(der);
                    length += der.length;
                }
            } catch (Asn1EncodingException e) {
                throw new Asn1EncodingException("Failed to encode " + cls.getName() + "." + annotatedField3.getField().getName(), e);
            }
        }
        if (!z) {
            return createTag(0, true, 16, (byte[][]) arrayList.toArray(new byte[0][]));
        }
        byte[] bArr = new byte[length];
        int length2 = 0;
        for (byte[] bArr2 : arrayList) {
            System.arraycopy(bArr2, 0, bArr, length2, bArr2.length);
            length2 += bArr2.length;
        }
        return bArr;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static byte[] toSequenceOf(Collection<?> collection, Asn1Type asn1Type) throws Asn1EncodingException {
        return toSequenceOrSetOf(collection, asn1Type, false);
    }

    private static byte[] toSequenceOrSetOf(Collection<?> collection, Asn1Type asn1Type, boolean z) throws Asn1EncodingException {
        int i;
        ArrayList arrayList = new ArrayList(collection.size());
        Iterator<?> it = collection.iterator();
        while (it.hasNext()) {
            arrayList.add(JavaToDerConverter.toDer(it.next(), asn1Type, null));
        }
        if (z) {
            if (arrayList.size() > 1) {
                Collections.sort(arrayList, ByteArrayLexicographicComparator.INSTANCE);
            }
            i = 17;
        } else {
            i = 16;
        }
        return createTag(0, true, i, (byte[][]) arrayList.toArray(new byte[0][]));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static byte[] toSetOf(Collection<?> collection, Asn1Type asn1Type) throws Asn1EncodingException {
        return toSequenceOrSetOf(collection, asn1Type, true);
    }
}
