package com.android.apksig.internal.asn1.ber;

import com.android.apksig.ApkVerificationIssue;
import com.android.apksig.internal.asn1.Asn1TagClass;
import com.android.apksig.internal.asn1.Asn1Type;

/* JADX INFO: loaded from: classes.dex */
public abstract class BerEncoding {
    public static final int ID_FLAG_CONSTRUCTED_ENCODING = 32;
    public static final int TAG_CLASS_APPLICATION = 1;
    public static final int TAG_CLASS_CONTEXT_SPECIFIC = 2;
    public static final int TAG_CLASS_PRIVATE = 3;
    public static final int TAG_CLASS_UNIVERSAL = 0;
    public static final int TAG_NUMBER_BIT_STRING = 3;
    public static final int TAG_NUMBER_BOOLEAN = 1;
    public static final int TAG_NUMBER_GENERALIZED_TIME = 24;
    public static final int TAG_NUMBER_INTEGER = 2;
    public static final int TAG_NUMBER_NULL = 5;
    public static final int TAG_NUMBER_OBJECT_IDENTIFIER = 6;
    public static final int TAG_NUMBER_OCTET_STRING = 4;
    public static final int TAG_NUMBER_SEQUENCE = 16;
    public static final int TAG_NUMBER_SET = 17;
    public static final int TAG_NUMBER_UTC_TIME = 23;

    /* JADX INFO: renamed from: com.android.apksig.internal.asn1.ber.BerEncoding$1 */
    static /* synthetic */ class C00211 {
        static final /* synthetic */ int[] $SwitchMap$com$android$apksig$internal$asn1$Asn1TagClass;
        static final /* synthetic */ int[] $SwitchMap$com$android$apksig$internal$asn1$Asn1Type;

        static {
            int[] iArr = new int[Asn1TagClass.values().length];
            $SwitchMap$com$android$apksig$internal$asn1$Asn1TagClass = iArr;
            try {
                iArr[Asn1TagClass.APPLICATION.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1TagClass[Asn1TagClass.CONTEXT_SPECIFIC.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1TagClass[Asn1TagClass.PRIVATE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1TagClass[Asn1TagClass.UNIVERSAL.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            int[] iArr2 = new int[Asn1Type.values().length];
            $SwitchMap$com$android$apksig$internal$asn1$Asn1Type = iArr2;
            try {
                iArr2[Asn1Type.INTEGER.ordinal()] = 1;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.OBJECT_IDENTIFIER.ordinal()] = 2;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.OCTET_STRING.ordinal()] = 3;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.BIT_STRING.ordinal()] = 4;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.SET_OF.ordinal()] = 5;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.SEQUENCE.ordinal()] = 6;
            } catch (NoSuchFieldError e10) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.SEQUENCE_OF.ordinal()] = 7;
            } catch (NoSuchFieldError e11) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.UTC_TIME.ordinal()] = 8;
            } catch (NoSuchFieldError e12) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.GENERALIZED_TIME.ordinal()] = 9;
            } catch (NoSuchFieldError e13) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$asn1$Asn1Type[Asn1Type.BOOLEAN.ordinal()] = 10;
            } catch (NoSuchFieldError e14) {
            }
        }
    }

    private BerEncoding() {
    }

    public static int getTagClass(byte b) {
        return (b & 255) >> 6;
    }

    public static int getTagClass(Asn1TagClass asn1TagClass) {
        switch (C00211.$SwitchMap$com$android$apksig$internal$asn1$Asn1TagClass[asn1TagClass.ordinal()]) {
            case 1:
                return 1;
            case 2:
                return 2;
            case 3:
                return 3;
            case 4:
                return 0;
            default:
                throw new IllegalArgumentException("Unsupported tag class: " + asn1TagClass);
        }
    }

    public static int getTagNumber(byte b) {
        return b & 31;
    }

    public static int getTagNumber(Asn1Type asn1Type) {
        switch (C00211.$SwitchMap$com$android$apksig$internal$asn1$Asn1Type[asn1Type.ordinal()]) {
            case 1:
                return 2;
            case 2:
                return 6;
            case 3:
                return 4;
            case 4:
                return 3;
            case 5:
                return 17;
            case 6:
            case ApkVerificationIssue.V2_SIG_NO_CERTIFICATES /* 7 */:
                return 16;
            case ApkVerificationIssue.V2_SIG_MALFORMED_DIGEST /* 8 */:
                return 23;
            case 9:
                return 24;
            case ApkVerificationIssue.V3_SIG_NO_SIGNERS /* 10 */:
                return 1;
            default:
                throw new IllegalArgumentException("Unsupported data type: " + asn1Type);
        }
    }

    public static boolean isConstructed(byte b) {
        return (b & 32) != 0;
    }

    public static byte setTagClass(byte b, int i) {
        return (byte) ((b & 63) | (i << 6));
    }

    public static byte setTagNumber(byte b, int i) {
        return (byte) ((b & (-32)) | i);
    }

    public static String tagClassAndNumberToString(int i, int i2) {
        String strTagClassToString = tagClassToString(i);
        String strTagNumberToString = tagNumberToString(i2);
        return strTagClassToString.isEmpty() ? strTagNumberToString : strTagClassToString + " " + strTagNumberToString;
    }

    public static String tagClassToString(int i) {
        switch (i) {
            case TAG_CLASS_UNIVERSAL /* 0 */:
                return "UNIVERSAL";
            case 1:
                return "APPLICATION";
            case 2:
                return "";
            case 3:
                return "PRIVATE";
            default:
                throw new IllegalArgumentException("Unsupported type class: " + i);
        }
    }

    public static String tagNumberToString(int i) {
        switch (i) {
            case 1:
                return "BOOLEAN";
            case 2:
                return "INTEGER";
            case 3:
                return "BIT STRING";
            case 4:
                return "OCTET STRING";
            case 5:
                return "NULL";
            case 6:
                return "OBJECT IDENTIFIER";
            case 16:
                return "SEQUENCE";
            case 17:
                return "SET";
            case 23:
                return "UTC TIME";
            case 24:
                return "GENERALIZED TIME";
            default:
                return "0x" + Integer.toHexString(i);
        }
    }
}
