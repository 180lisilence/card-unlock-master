.class public Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;
.super Ljava/lang/Object;
.source "DefaultApkSignerEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
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
.method public constructor <init>(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/util/List;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "privateKey"    # Ljava/security/PrivateKey;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "name",
            "privateKey",
            "certificates"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/security/PrivateKey;",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;)V"
        }
    .end annotation

    .line 1688
    .local p3, "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;-><init>(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/util/List;Z)V

    .line 1689
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/util/List;Z)V
    .locals 2
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

    .line 1703
    .local p3, "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1704
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1707
    iput-object p1, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;->mName:Ljava/lang/String;

    .line 1708
    iput-object p2, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;->mPrivateKey:Ljava/security/PrivateKey;

    .line 1709
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;->mCertificates:Ljava/util/List;

    .line 1710
    iput-boolean p4, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;->mDeterministicDsaSigning:Z

    .line 1711
    return-void

    .line 1705
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Empty name"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public build()Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    .locals 7

    .line 1718
    new-instance v6, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    iget-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;->mName:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;->mPrivateKey:Ljava/security/PrivateKey;

    iget-object v3, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;->mCertificates:Ljava/util/List;

    iget-boolean v4, p0, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;->mDeterministicDsaSigning:Z

    const/4 v5, 0x0

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;-><init>(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/util/List;ZLcom/android/apksig/DefaultApkSignerEngine$1;)V

    return-object v6
.end method
