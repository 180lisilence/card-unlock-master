.class public Lcom/android/apksig/SigningCertificateLineage$SignerConfig;
.super Ljava/lang/Object;
.source "SigningCertificateLineage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/SigningCertificateLineage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SignerConfig"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/SigningCertificateLineage$SignerConfig$Builder;
    }
.end annotation


# instance fields
.field private final mCertificate:Ljava/security/cert/X509Certificate;

.field private final mPrivateKey:Ljava/security/PrivateKey;


# direct methods
.method private constructor <init>(Ljava/security/PrivateKey;Ljava/security/cert/X509Certificate;)V
    .locals 0
    .param p1, "privateKey"    # Ljava/security/PrivateKey;
    .param p2, "certificate"    # Ljava/security/cert/X509Certificate;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "privateKey",
            "certificate"
        }
    .end annotation

    .line 962
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 963
    iput-object p1, p0, Lcom/android/apksig/SigningCertificateLineage$SignerConfig;->mPrivateKey:Ljava/security/PrivateKey;

    .line 964
    iput-object p2, p0, Lcom/android/apksig/SigningCertificateLineage$SignerConfig;->mCertificate:Ljava/security/cert/X509Certificate;

    .line 965
    return-void
.end method

.method synthetic constructor <init>(Ljava/security/PrivateKey;Ljava/security/cert/X509Certificate;Lcom/android/apksig/SigningCertificateLineage$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/security/PrivateKey;
    .param p2, "x1"    # Ljava/security/cert/X509Certificate;
    .param p3, "x2"    # Lcom/android/apksig/SigningCertificateLineage$1;

    .line 956
    invoke-direct {p0, p1, p2}, Lcom/android/apksig/SigningCertificateLineage$SignerConfig;-><init>(Ljava/security/PrivateKey;Ljava/security/cert/X509Certificate;)V

    return-void
.end method


# virtual methods
.method public getCertificate()Ljava/security/cert/X509Certificate;
    .locals 1

    .line 979
    iget-object v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerConfig;->mCertificate:Ljava/security/cert/X509Certificate;

    return-object v0
.end method

.method public getPrivateKey()Ljava/security/PrivateKey;
    .locals 1

    .line 971
    iget-object v0, p0, Lcom/android/apksig/SigningCertificateLineage$SignerConfig;->mPrivateKey:Ljava/security/PrivateKey;

    return-object v0
.end method
