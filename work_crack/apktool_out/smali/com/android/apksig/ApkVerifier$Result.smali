.class public Lcom/android/apksig/ApkVerifier$Result;
.super Ljava/lang/Object;
.source "ApkVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/ApkVerifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Result"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;,
        Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;,
        Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;,
        Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;,
        Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;
    }
.end annotation


# instance fields
.field private final mErrors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$IssueWithParams;",
            ">;"
        }
    .end annotation
.end field

.field private final mSignerCerts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation
.end field

.field private mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

.field private mSourceStampInfo:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;

.field private mSourceStampVerified:Z

.field private final mV1SchemeIgnoredSigners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mV1SchemeSigners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mV2SchemeSigners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mV31SchemeSigners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mV3SchemeSigners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mV4SchemeSigners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mVerified:Z

.field private mVerifiedUsingV1Scheme:Z

.field private mVerifiedUsingV2Scheme:Z

.field private mVerifiedUsingV31Scheme:Z

.field private mVerifiedUsingV3Scheme:Z

.field private mVerifiedUsingV4Scheme:Z

.field private final mWarnings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$IssueWithParams;",
            ">;"
        }
    .end annotation
.end field

.field private mWarningsAsErrors:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1056
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1057
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mErrors:Ljava/util/List;

    .line 1058
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarnings:Ljava/util/List;

    .line 1059
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mSignerCerts:Ljava/util/List;

    .line 1060
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV1SchemeSigners:Ljava/util/List;

    .line 1061
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV1SchemeIgnoredSigners:Ljava/util/List;

    .line 1062
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV2SchemeSigners:Ljava/util/List;

    .line 1063
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV3SchemeSigners:Ljava/util/List;

    .line 1064
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV31SchemeSigners:Ljava/util/List;

    .line 1065
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV4SchemeSigners:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/android/apksig/ApkVerifier$Result;Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Result;
    .param p1, "x1"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;

    .line 1056
    invoke-direct {p0, p1}, Lcom/android/apksig/ApkVerifier$Result;->mergeFrom(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/apksig/ApkVerifier$Result;Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Result;
    .param p1, "x1"    # Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;

    .line 1056
    invoke-direct {p0, p1}, Lcom/android/apksig/ApkVerifier$Result;->mergeFrom(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/apksig/ApkVerifier$Result;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Result;

    .line 1056
    invoke-direct {p0}, Lcom/android/apksig/ApkVerifier$Result;->setVerified()V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/apksig/ApkVerifier$Result;Ljava/security/cert/X509Certificate;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Result;
    .param p1, "x1"    # Ljava/security/cert/X509Certificate;

    .line 1056
    invoke-direct {p0, p1}, Lcom/android/apksig/ApkVerifier$Result;->addSignerCertificate(Ljava/security/cert/X509Certificate;)V

    return-void
.end method

.method static synthetic access$1202(Lcom/android/apksig/ApkVerifier$Result;Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;)Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;
    .locals 0
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Result;
    .param p1, "x1"    # Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;

    .line 1056
    iput-object p1, p0, Lcom/android/apksig/ApkVerifier$Result;->mSourceStampInfo:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;

    return-object p1
.end method

.method static synthetic access$200(Lcom/android/apksig/ApkVerifier$Result;Lcom/android/apksig/internal/apk/ApkSigResult;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/apksig/ApkVerifier$Result;
    .param p1, "x1"    # Lcom/android/apksig/internal/apk/ApkSigResult;

    .line 1056
    invoke-direct {p0, p1}, Lcom/android/apksig/ApkVerifier$Result;->mergeFrom(Lcom/android/apksig/internal/apk/ApkSigResult;)V

    return-void
.end method

.method private addSignerCertificate(Ljava/security/cert/X509Certificate;)V
    .locals 1
    .param p1, "cert"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "cert"
        }
    .end annotation

    .line 1139
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mSignerCerts:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1140
    return-void
.end method

.method private mergeFrom(Lcom/android/apksig/internal/apk/ApkSigResult;)V
    .locals 3
    .param p1, "source"    # Lcom/android/apksig/internal/apk/ApkSigResult;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "source"
        }
    .end annotation

    .line 1267
    iget v0, p1, Lcom/android/apksig/internal/apk/ApkSigResult;->signatureSchemeVersion:I

    packed-switch v0, :pswitch_data_0

    .line 1275
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown ApkSigResult Signing Block Scheme Id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/android/apksig/internal/apk/ApkSigResult;->signatureSchemeVersion:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1269
    :pswitch_0
    iget-boolean v0, p1, Lcom/android/apksig/internal/apk/ApkSigResult;->verified:Z

    iput-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mSourceStampVerified:Z

    .line 1270
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigResult;->mSigners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1271
    new-instance v0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;

    iget-object v1, p1, Lcom/android/apksig/internal/apk/ApkSigResult;->mSigners:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/apk/ApkSignerInfo;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;-><init>(Lcom/android/apksig/internal/apk/ApkSignerInfo;Lcom/android/apksig/ApkVerifier$1;)V

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mSourceStampInfo:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;

    .line 1279
    :cond_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method private mergeFrom(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;)V
    .locals 5
    .param p1, "source"    # Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "source"
        }
    .end annotation

    .line 1282
    iget v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signatureSchemeVersion:I

    const/4 v1, 0x0

    sparse-switch v0, :sswitch_data_0

    .line 1319
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unknown Signing Block Scheme Id"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1300
    :sswitch_0
    iget-boolean v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->verified:Z

    iput-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mVerifiedUsingV31Scheme:Z

    .line 1301
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    .line 1302
    .local v2, "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    iget-object v3, p0, Lcom/android/apksig/ApkVerifier$Result;->mV31SchemeSigners:Ljava/util/List;

    new-instance v4, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;

    invoke-direct {v4, v2, v1}, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;-><init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$1;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1303
    .end local v2    # "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    goto :goto_0

    .line 1304
    :cond_0
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signingCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    .line 1305
    goto/16 :goto_4

    .line 1307
    :sswitch_1
    iget-boolean v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->verified:Z

    iput-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mVerifiedUsingV4Scheme:Z

    .line 1308
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    .line 1309
    .restart local v2    # "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    iget-object v3, p0, Lcom/android/apksig/ApkVerifier$Result;->mV4SchemeSigners:Ljava/util/List;

    new-instance v4, Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;

    invoke-direct {v4, v2, v1}, Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;-><init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$1;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1310
    .end local v2    # "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    goto :goto_1

    .line 1311
    :cond_1
    goto :goto_4

    .line 1290
    :sswitch_2
    iget-boolean v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->verified:Z

    iput-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mVerifiedUsingV3Scheme:Z

    .line 1291
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    .line 1292
    .restart local v2    # "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    iget-object v3, p0, Lcom/android/apksig/ApkVerifier$Result;->mV3SchemeSigners:Ljava/util/List;

    new-instance v4, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;

    invoke-direct {v4, v2, v1}, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;-><init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$1;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1293
    .end local v2    # "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    goto :goto_2

    .line 1295
    :cond_2
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    if-nez v0, :cond_4

    .line 1296
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signingCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    goto :goto_4

    .line 1284
    :sswitch_3
    iget-boolean v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->verified:Z

    iput-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mVerifiedUsingV2Scheme:Z

    .line 1285
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;

    .line 1286
    .restart local v2    # "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    iget-object v3, p0, Lcom/android/apksig/ApkVerifier$Result;->mV2SchemeSigners:Ljava/util/List;

    new-instance v4, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;

    invoke-direct {v4, v2, v1}, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;-><init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$1;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1287
    .end local v2    # "signer":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result$SignerInfo;
    goto :goto_3

    .line 1288
    :cond_3
    goto :goto_4

    .line 1313
    :sswitch_4
    iget-boolean v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->verified:Z

    iput-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mSourceStampVerified:Z

    .line 1314
    iget-object v0, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1315
    new-instance v0, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;

    iget-object v2, p1, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$Result;->signers:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/ApkSignerInfo;

    invoke-direct {v0, v2, v1}, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;-><init>(Lcom/android/apksig/internal/apk/ApkSignerInfo;Lcom/android/apksig/ApkVerifier$1;)V

    iput-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mSourceStampInfo:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;

    .line 1321
    :cond_4
    :goto_4
    return-void

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_4
        0x2 -> :sswitch_3
        0x3 -> :sswitch_2
        0x4 -> :sswitch_1
        0x1f -> :sswitch_0
    .end sparse-switch
.end method

.method private mergeFrom(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)V
    .locals 5
    .param p1, "source"    # Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "source"
        }
    .end annotation

    .line 1255
    iget-boolean v0, p1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->verified:Z

    iput-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mVerifiedUsingV1Scheme:Z

    .line 1256
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mErrors:Ljava/util/List;

    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->getErrors()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1257
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarnings:Ljava/util/List;

    invoke-virtual {p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->getWarnings()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1258
    iget-object v0, p1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->signers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    .line 1259
    .local v1, "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;
    iget-object v3, p0, Lcom/android/apksig/ApkVerifier$Result;->mV1SchemeSigners:Ljava/util/List;

    new-instance v4, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;

    invoke-direct {v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;-><init>(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$1;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1260
    .end local v1    # "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;
    goto :goto_0

    .line 1261
    :cond_0
    iget-object v0, p1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;->ignoredSigners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;

    .line 1262
    .restart local v1    # "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;
    iget-object v3, p0, Lcom/android/apksig/ApkVerifier$Result;->mV1SchemeIgnoredSigners:Ljava/util/List;

    new-instance v4, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;

    invoke-direct {v4, v1, v2}, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;-><init>(Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;Lcom/android/apksig/ApkVerifier$1;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1263
    .end local v1    # "signer":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result$SignerInfo;
    goto :goto_1

    .line 1264
    :cond_1
    return-void
.end method

.method private setVerified()V
    .locals 1

    .line 1086
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mVerified:Z

    .line 1087
    return-void
.end method


# virtual methods
.method varargs addError(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V
    .locals 2
    .param p1, "msg"    # Lcom/android/apksig/ApkVerifier$Issue;
    .param p2, "parameters"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "msg",
            "parameters"
        }
    .end annotation

    .line 1219
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mErrors:Ljava/util/List;

    new-instance v1, Lcom/android/apksig/ApkVerifier$IssueWithParams;

    invoke-direct {v1, p1, p2}, Lcom/android/apksig/ApkVerifier$IssueWithParams;-><init>(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1220
    return-void
.end method

.method varargs addWarning(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V
    .locals 2
    .param p1, "msg"    # Lcom/android/apksig/ApkVerifier$Issue;
    .param p2, "parameters"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "msg",
            "parameters"
        }
    .end annotation

    .line 1223
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarnings:Ljava/util/List;

    new-instance v1, Lcom/android/apksig/ApkVerifier$IssueWithParams;

    invoke-direct {v1, p1, p2}, Lcom/android/apksig/ApkVerifier$IssueWithParams;-><init>(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1224
    return-void
.end method

.method public containsErrors()Z
    .locals 4

    .line 1328
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mErrors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 1329
    return v1

    .line 1331
    :cond_0
    iget-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarningsAsErrors:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarnings:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1332
    return v1

    .line 1334
    :cond_1
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV1SchemeSigners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 1335
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV1SchemeSigners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;

    .line 1336
    .local v2, "signer":Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;
    invoke-virtual {v2}, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->containsErrors()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1337
    return v1

    .line 1339
    :cond_2
    iget-boolean v3, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarningsAsErrors:Z

    if-eqz v3, :cond_3

    invoke-virtual {v2}, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->getWarnings()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 1340
    return v1

    .line 1342
    .end local v2    # "signer":Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;
    :cond_3
    goto :goto_0

    .line 1344
    :cond_4
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV2SchemeSigners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_7

    .line 1345
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV2SchemeSigners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;

    .line 1346
    .local v2, "signer":Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;
    invoke-virtual {v2}, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->containsErrors()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1347
    return v1

    .line 1349
    :cond_5
    iget-boolean v3, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarningsAsErrors:Z

    if-eqz v3, :cond_6

    invoke-virtual {v2}, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->getWarnings()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_6

    .line 1350
    return v1

    .line 1352
    .end local v2    # "signer":Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;
    :cond_6
    goto :goto_1

    .line 1354
    :cond_7
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV3SchemeSigners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a

    .line 1355
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV3SchemeSigners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;

    .line 1356
    .local v2, "signer":Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;
    invoke-virtual {v2}, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->containsErrors()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 1357
    return v1

    .line 1359
    :cond_8
    iget-boolean v3, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarningsAsErrors:Z

    if-eqz v3, :cond_9

    invoke-virtual {v2}, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->getWarnings()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_9

    .line 1360
    return v1

    .line 1362
    .end local v2    # "signer":Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;
    :cond_9
    goto :goto_2

    .line 1364
    :cond_a
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mSourceStampInfo:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;

    if-eqz v0, :cond_c

    .line 1365
    invoke-virtual {v0}, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->containsErrors()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 1366
    return v1

    .line 1368
    :cond_b
    iget-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarningsAsErrors:Z

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mSourceStampInfo:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;

    invoke-virtual {v0}, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->getWarnings()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_c

    .line 1369
    return v1

    .line 1373
    :cond_c
    const/4 v0, 0x0

    return v0
.end method

.method public getAllErrors()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$IssueWithParams;",
            ">;"
        }
    .end annotation

    .line 1381
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1382
    .local v0, "errors":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$IssueWithParams;>;"
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier$Result;->mErrors:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1383
    iget-boolean v1, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarningsAsErrors:Z

    if-eqz v1, :cond_0

    .line 1384
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarnings:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1386
    :cond_0
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier$Result;->mV1SchemeSigners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 1387
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier$Result;->mV1SchemeSigners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;

    .line 1388
    .local v2, "signer":Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;
    invoke-static {v2}, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->access$1800(Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1389
    iget-boolean v3, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarningsAsErrors:Z

    if-eqz v3, :cond_1

    .line 1390
    invoke-virtual {v2}, Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;->getWarnings()Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1392
    .end local v2    # "signer":Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;
    :cond_1
    goto :goto_0

    .line 1394
    :cond_2
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier$Result;->mV2SchemeSigners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    .line 1395
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier$Result;->mV2SchemeSigners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;

    .line 1396
    .local v2, "signer":Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;
    invoke-static {v2}, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->access$1900(Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1397
    iget-boolean v3, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarningsAsErrors:Z

    if-eqz v3, :cond_3

    .line 1398
    invoke-virtual {v2}, Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;->getWarnings()Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1400
    .end local v2    # "signer":Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;
    :cond_3
    goto :goto_1

    .line 1402
    :cond_4
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier$Result;->mV3SchemeSigners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6

    .line 1403
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier$Result;->mV3SchemeSigners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;

    .line 1404
    .local v2, "signer":Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;
    invoke-static {v2}, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->access$2000(Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1405
    iget-boolean v3, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarningsAsErrors:Z

    if-eqz v3, :cond_5

    .line 1406
    invoke-virtual {v2}, Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;->getWarnings()Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1408
    .end local v2    # "signer":Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;
    :cond_5
    goto :goto_2

    .line 1410
    :cond_6
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier$Result;->mSourceStampInfo:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;

    if-eqz v1, :cond_7

    .line 1411
    invoke-virtual {v1}, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->getErrors()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1412
    iget-boolean v1, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarningsAsErrors:Z

    if-eqz v1, :cond_7

    .line 1413
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier$Result;->mSourceStampInfo:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;

    invoke-virtual {v1}, Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;->getWarnings()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1416
    :cond_7
    return-object v0
.end method

.method public getErrors()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$IssueWithParams;",
            ">;"
        }
    .end annotation

    .line 1237
    iget-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarningsAsErrors:Z

    if-nez v0, :cond_0

    .line 1238
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mErrors:Ljava/util/List;

    return-object v0

    .line 1240
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1241
    .local v0, "allErrors":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkVerifier$IssueWithParams;>;"
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier$Result;->mErrors:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1242
    iget-object v1, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarnings:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1243
    return-object v0
.end method

.method public getSignerCertificates()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation

    .line 1135
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mSignerCerts:Ljava/util/List;

    return-object v0
.end method

.method public getSigningCertificateLineage()Lcom/android/apksig/SigningCertificateLineage;
    .locals 1

    .line 1215
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    return-object v0
.end method

.method public getSourceStampInfo()Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;
    .locals 1

    .line 1207
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mSourceStampInfo:Lcom/android/apksig/ApkVerifier$Result$SourceStampInfo;

    return-object v0
.end method

.method public getV1SchemeIgnoredSigners()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;",
            ">;"
        }
    .end annotation

    .line 1160
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV1SchemeIgnoredSigners:Ljava/util/List;

    return-object v0
.end method

.method public getV1SchemeSigners()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$Result$V1SchemeSignerInfo;",
            ">;"
        }
    .end annotation

    .line 1149
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV1SchemeSigners:Ljava/util/List;

    return-object v0
.end method

.method public getV2SchemeSigners()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$Result$V2SchemeSignerInfo;",
            ">;"
        }
    .end annotation

    .line 1168
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV2SchemeSigners:Ljava/util/List;

    return-object v0
.end method

.method public getV31SchemeSigners()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;",
            ">;"
        }
    .end annotation

    .line 1192
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV31SchemeSigners:Ljava/util/List;

    return-object v0
.end method

.method public getV3SchemeSigners()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$Result$V3SchemeSignerInfo;",
            ">;"
        }
    .end annotation

    .line 1180
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV3SchemeSigners:Ljava/util/List;

    return-object v0
.end method

.method public getV4SchemeSigners()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$Result$V4SchemeSignerInfo;",
            ">;"
        }
    .end annotation

    .line 1200
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mV4SchemeSigners:Ljava/util/List;

    return-object v0
.end method

.method public getWarnings()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkVerifier$IssueWithParams;",
            ">;"
        }
    .end annotation

    .line 1251
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarnings:Ljava/util/List;

    return-object v0
.end method

.method public isSourceStampVerified()Z
    .locals 1

    .line 1128
    iget-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mSourceStampVerified:Z

    return v0
.end method

.method public isVerified()Z
    .locals 1

    .line 1082
    iget-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mVerified:Z

    return v0
.end method

.method public isVerifiedUsingV1Scheme()Z
    .locals 1

    .line 1093
    iget-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mVerifiedUsingV1Scheme:Z

    return v0
.end method

.method public isVerifiedUsingV2Scheme()Z
    .locals 1

    .line 1100
    iget-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mVerifiedUsingV2Scheme:Z

    return v0
.end method

.method public isVerifiedUsingV31Scheme()Z
    .locals 1

    .line 1114
    iget-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mVerifiedUsingV31Scheme:Z

    return v0
.end method

.method public isVerifiedUsingV3Scheme()Z
    .locals 1

    .line 1107
    iget-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mVerifiedUsingV3Scheme:Z

    return v0
.end method

.method public isVerifiedUsingV4Scheme()Z
    .locals 1

    .line 1121
    iget-boolean v0, p0, Lcom/android/apksig/ApkVerifier$Result;->mVerifiedUsingV4Scheme:Z

    return v0
.end method

.method setWarningsAsErrors(Z)V
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

    .line 1230
    iput-boolean p1, p0, Lcom/android/apksig/ApkVerifier$Result;->mWarningsAsErrors:Z

    .line 1231
    return-void
.end method
