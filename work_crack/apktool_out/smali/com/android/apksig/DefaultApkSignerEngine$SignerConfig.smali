.class public Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
.super Ljava/lang/Object;
.source "DefaultApkSignerEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/DefaultApkSignerEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SignerConfig"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;
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

.field private final mDeterministicDsaSigning:Z

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

    .line 1639
    .local p3, "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1640
    iput-object p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->mName:Ljava/lang/String;

    .line 1641
    iput-object p2, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->mPrivateKey:Ljava/security/PrivateKey;

    .line 1642
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->mCertificates:Ljava/util/List;

    .line 1643
    iput-boolean p4, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->mDeterministicDsaSigning:Z

    .line 1644
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/util/List;ZLcom/android/apksig/DefaultApkSignerEngine$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/security/PrivateKey;
    .param p3, "x2"    # Ljava/util/List;
    .param p4, "x3"    # Z
    .param p5, "x4"    # Lcom/android/apksig/DefaultApkSignerEngine$1;

    .line 1631
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;-><init>(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/util/List;Z)V

    return-void
.end method

.method static synthetic access$000(Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    .line 1631
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->mCertificates:Ljava/util/List;

    return-object v0
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

    .line 1661
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->mCertificates:Ljava/util/List;

    return-object v0
.end method

.method public getDeterministicDsaSigning()Z
    .locals 1

    .line 1668
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->mDeterministicDsaSigning:Z

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 1648
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getPrivateKey()Ljava/security/PrivateKey;
    .locals 1

    .line 1653
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->mPrivateKey:Ljava/security/PrivateKey;

    return-object v0
.end method
