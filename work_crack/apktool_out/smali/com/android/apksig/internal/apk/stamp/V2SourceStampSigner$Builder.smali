.class public Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;
.super Ljava/lang/Object;
.source "V2SourceStampSigner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private final mSignatureSchemeDigestInfos:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;>;"
        }
    .end annotation
.end field

.field private final mSourceStampSignerConfig:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

.field private mSourceStampTimestampEnabled:Z


# direct methods
.method public constructor <init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;Ljava/util/Map;)V
    .locals 1
    .param p1, "sourceStampSignerConfig"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "sourceStampSignerConfig",
            "signatureSchemeDigestInfos"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/Map<",
            "Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;",
            "[B>;>;)V"
        }
    .end annotation

    .line 264
    .local p2, "signatureSchemeDigestInfos":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 257
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;->mSourceStampTimestampEnabled:Z

    .line 265
    iput-object p1, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;->mSourceStampSignerConfig:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    .line 266
    iput-object p2, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;->mSignatureSchemeDigestInfos:Ljava/util/Map;

    .line 267
    return-void
.end method

.method static synthetic access$000(Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;

    .line 254
    iget-object v0, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;->mSourceStampSignerConfig:Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;

    .line 254
    iget-object v0, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;->mSignatureSchemeDigestInfos:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;)Z
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;

    .line 254
    iget-boolean v0, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;->mSourceStampTimestampEnabled:Z

    return v0
.end method


# virtual methods
.method public build()Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;
    .locals 2

    .line 283
    new-instance v0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;-><init>(Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$1;)V

    return-object v0
.end method

.method public setSourceStampTimestampEnabled(Z)Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;
    .locals 0
    .param p1, "value"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 274
    iput-boolean p1, p0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;->mSourceStampTimestampEnabled:Z

    .line 275
    return-object p0
.end method
