.class public final synthetic Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/android/apksig/internal/apk/ApkSupportedSignature;

    check-cast p2, Lcom/android/apksig/internal/apk/ApkSupportedSignature;

    invoke-static {p1, p2}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtilsLite;->lambda$getSignaturesToVerify$0(Lcom/android/apksig/internal/apk/ApkSupportedSignature;Lcom/android/apksig/internal/apk/ApkSupportedSignature;)I

    move-result p1

    return p1
.end method
