package com.android.apksig.internal.apk.p000v1;

import java.util.Comparator;

/* JADX INFO: loaded from: classes.dex */
public enum DigestAlgorithm {
    SHA1("SHA-1"),
    SHA256("SHA-256");

    public static Comparator<DigestAlgorithm> BY_STRENGTH_COMPARATOR = new StrengthComparator(null);
    private final String mJcaMessageDigestAlgorithm;

    /* JADX INFO: renamed from: com.android.apksig.internal.apk.v1.DigestAlgorithm$1 */
    static /* synthetic */ class C00121 {
        static final /* synthetic */ int[] $SwitchMap$com$android$apksig$internal$apk$v1$DigestAlgorithm;

        static {
            int[] iArr = new int[DigestAlgorithm.values().length];
            $SwitchMap$com$android$apksig$internal$apk$v1$DigestAlgorithm = iArr;
            try {
                iArr[DigestAlgorithm.SHA1.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$android$apksig$internal$apk$v1$DigestAlgorithm[DigestAlgorithm.SHA256.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
        }
    }

    private static class StrengthComparator implements Comparator<DigestAlgorithm> {
        private StrengthComparator() {
        }

        /* synthetic */ StrengthComparator(C00121 c00121) {
            this();
        }

        @Override // java.util.Comparator
        public int compare(DigestAlgorithm digestAlgorithm, DigestAlgorithm digestAlgorithm2) {
            switch (C00121.$SwitchMap$com$android$apksig$internal$apk$v1$DigestAlgorithm[digestAlgorithm.ordinal()]) {
                case 1:
                    switch (C00121.$SwitchMap$com$android$apksig$internal$apk$v1$DigestAlgorithm[digestAlgorithm2.ordinal()]) {
                        case 1:
                            return 0;
                        case 2:
                            return -1;
                        default:
                            throw new RuntimeException("Unsupported algorithm: " + digestAlgorithm2);
                    }
                case 2:
                    switch (C00121.$SwitchMap$com$android$apksig$internal$apk$v1$DigestAlgorithm[digestAlgorithm2.ordinal()]) {
                        case 1:
                            return 1;
                        case 2:
                            return 0;
                        default:
                            throw new RuntimeException("Unsupported algorithm: " + digestAlgorithm2);
                    }
                default:
                    throw new RuntimeException("Unsupported algorithm: " + digestAlgorithm);
            }
        }
    }

    DigestAlgorithm(String str) {
        this.mJcaMessageDigestAlgorithm = str;
    }

    String getJcaMessageDigestAlgorithm() {
        return this.mJcaMessageDigestAlgorithm;
    }
}
