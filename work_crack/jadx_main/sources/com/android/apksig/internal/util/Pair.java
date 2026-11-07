package com.android.apksig.internal.util;

/* JADX INFO: loaded from: classes.dex */
public final class Pair<A, B> {
    private final A mFirst;
    private final B mSecond;

    private Pair(A a, B b) {
        this.mFirst = a;
        this.mSecond = b;
    }

    /* JADX INFO: renamed from: of */
    public static <A, B> Pair<A, B> m0of(A a, B b) {
        return new Pair<>(a, b);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Pair pair = (Pair) obj;
        A a = this.mFirst;
        if (a == null) {
            if (pair.mFirst != null) {
                return false;
            }
        } else if (!a.equals(pair.mFirst)) {
            return false;
        }
        B b = this.mSecond;
        if (b == null) {
            if (pair.mSecond != null) {
                return false;
            }
        } else if (!b.equals(pair.mSecond)) {
            return false;
        }
        return true;
    }

    public A getFirst() {
        return this.mFirst;
    }

    public B getSecond() {
        return this.mSecond;
    }

    public int hashCode() {
        int i = 1 * 31;
        A a = this.mFirst;
        int iHashCode = (i + (a == null ? 0 : a.hashCode())) * 31;
        B b = this.mSecond;
        return iHashCode + (b != null ? b.hashCode() : 0);
    }
}
