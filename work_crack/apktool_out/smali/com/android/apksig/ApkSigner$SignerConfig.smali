.class public Lcom/android/apksig/ApkSigner$SignerConfig;
.super Ljava/lang/Object;
.source "ApkSigner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/ApkSigner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SignerConfig"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/ApkSigner$SignerConfig$Builder;
    }
.end annotation


# instance fields
.field private final mCertificates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation
.end field

.field private mDeterministicDsaSigning:Z

.field private final mName:Ljava/lang/String;

.field private final mPrivateKey:Ljava/security/PrivateKey;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/util/List;Z)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "privateKey"    # Ljava/security/PrivateKey;
    .param p4, "deterministicDsaSigning"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "name",
            "privateKey",
            "certificates",
            "deterministicDsaSigning"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/security/PrivateKey;",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;Z)V"
        }
    .end annotation

    .line 1027
    .local p3, "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1028
    iput-object p1, p0, Lcom/android/apksig/ApkSigner$SignerConfig;->mName:Ljava/lang/String;

    .line 1029
    iput-object p2, p0, Lcom/android/apksig/ApkSigner$SignerConfig;->mPrivateKey:Ljava/security/PrivateKey;

    .line 1030
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/ApkSigner$SignerConfig;->mCertificates:Ljava/util/List;

    .line 1031
    iput-boolean p4, p0, Lcom/android/apksig/ApkSigner$SignerConfig;->mDeterministicDsaSigning:Z

    .line 1032
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/util/List;ZLcom/android/apksig/ApkSigner$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/security/PrivateKey;
    .param p3, "x2"    # Ljava/util/List;
    .param p4, "x3"    # Z
    .param p5, "x4"    # Lcom/android/apksig/ApkSigner$1;

    .line 1017
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/apksig/ApkSigner$SignerConfig;-><init>(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/util/List;Z)V

    return-void
.end method


# virtual methods
.method public getCertificates()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;"
        }
    .end annotation

    .line 1048
    iget-object v0, p0, Lcom/android/apksig/ApkSigner$SignerConfig;->mCertificates:Ljava/util/List;

    return-object v0
.end method

.method public getDeterministicDsaSigning()Z
    .locals 1

    .line 1056
    iget-boolean v0, p0, Lcom/android/apksig/ApkSigner$SignerConfig;->mDeterministicDsaSigning:Z

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 1035
    iget-object v0, p0, Lcom/android/apksig/ApkSigner$SignerConfig;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getPrivateKey()Ljava/security/PrivateKey;
    .locals 1

    .line 1040
    iget-object v0, p0, Lcom/android/apksig/ApkSigner$SignerConfig;->mPrivateKey:Ljava/security/PrivateKey;

    return-object v0
.end method
