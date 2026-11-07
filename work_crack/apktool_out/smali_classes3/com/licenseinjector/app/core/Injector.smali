.class public final Lcom/licenseinjector/app/core/Injector;
.super Ljava/lang/Object;
.source "Injector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/licenseinjector/app/core/Injector$Log;
    }
.end annotation


# static fields
.field private static final CFG_ENTRY:Ljava/lang/String; = "assets/license_cfg.txt"

.field public static final GATE_ACTIVITY:Ljava/lang/String; = "com.license.verify2.VerifyActivity"

.field private static final KS_PASS:Ljava/lang/String; = "license123"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public static inject(Ljava/io/File;Ljava/io/File;[BLjava/lang/String;[BLcom/licenseinjector/app/core/Injector$Log;)V
    .locals 14
    .param p0, "inApk"    # Ljava/io/File;
    .param p1, "outApk"    # Ljava/io/File;
    .param p2, "payloadDex"    # [B
    .param p3, "key"    # Ljava/lang/String;
    .param p4, "keystore"    # [B
    .param p5, "log"    # Lcom/licenseinjector/app/core/Injector$Log;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 32
    move-object v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p5

    const-string v0, "AndroidManifest.xml"

    invoke-static {p0, v0}, Lcom/licenseinjector/app/core/Injector;->readEntry(Ljava/io/File;Ljava/lang/String;)[B

    move-result-object v4

    .line 33
    .local v4, "manifest":[B
    new-instance v5, Lcom/licenseinjector/app/core/AxmLEditor;

    invoke-direct {v5, v4}, Lcom/licenseinjector/app/core/AxmLEditor;-><init>([B)V

    .line 34
    .local v5, "ed":Lcom/licenseinjector/app/core/AxmLEditor;
    const-string v6, "com.license.verify2.VerifyActivity"

    invoke-virtual {v5, v6}, Lcom/licenseinjector/app/core/AxmLEditor;->hasComponent(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_7

    .line 37
    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->injectLauncher(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v6

    .line 38
    .local v6, "newManifest":[B
    iget-object v7, v5, Lcom/licenseinjector/app/core/AxmLEditor;->resolvedEntry:Ljava/lang/String;

    .line 39
    .local v7, "target":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 40
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u539f\u542f\u52a8\u9875: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v5, Lcom/licenseinjector/app/core/AxmLEditor;->discoveredLauncher:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v3, v8}, Lcom/licenseinjector/app/core/Injector$Log;->log(Ljava/lang/String;)V

    .line 41
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "\u6ce8\u5165\u70b9: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v3, v8}, Lcom/licenseinjector/app/core/Injector$Log;->log(Ljava/lang/String;)V

    .line 43
    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .local v8, "cfg":Ljava/lang/StringBuilder;
    const-string v9, "key="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ""

    if-nez p3, :cond_1

    move-object v11, v10

    goto :goto_0

    :cond_1
    move-object/from16 v11, p3

    :goto_0
    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v11, 0xa

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 45
    const-string v9, "target="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    if-nez v7, :cond_2

    goto :goto_1

    :cond_2
    move-object v10, v7

    :goto_1
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 47
    new-instance v9, Lcom/licenseinjector/app/core/ZipRewriter;

    invoke-direct {v9, p0}, Lcom/licenseinjector/app/core/ZipRewriter;-><init>(Ljava/io/File;)V

    .line 48
    .local v9, "zr":Lcom/licenseinjector/app/core/ZipRewriter;
    new-instance v10, Ljava/io/File;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ".unsigned"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 50
    .local v10, "tmp":Ljava/io/File;
    :try_start_0
    invoke-virtual {v9}, Lcom/licenseinjector/app/core/ZipRewriter;->names()Ljava/util/List;

    move-result-object v11

    invoke-static {v11}, Lcom/licenseinjector/app/core/Injector;->nextDexName(Ljava/util/List;)Ljava/lang/String;

    move-result-object v11

    .line 51
    .local v11, "dexName":Ljava/lang/String;
    if-eqz v3, :cond_3

    .line 52
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "\u6ce8\u5165\u8f7d\u8377: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " ("

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    array-length v13, v2

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " \u5b57\u8282)"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v3, v12}, Lcom/licenseinjector/app/core/Injector$Log;->log(Ljava/lang/String;)V

    .line 54
    :cond_3
    invoke-virtual {v9}, Lcom/licenseinjector/app/core/ZipRewriter;->removeOldSignatures()V

    .line 55
    invoke-virtual {v9, v0, v6}, Lcom/licenseinjector/app/core/ZipRewriter;->replace(Ljava/lang/String;[B)V

    .line 56
    invoke-virtual {v9, v11, v2}, Lcom/licenseinjector/app/core/ZipRewriter;->add(Ljava/lang/String;[B)V

    .line 57
    const-string v0, "assets/license_cfg.txt"

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v13, "UTF-8"

    invoke-virtual {v12, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v12

    invoke-virtual {v9, v0, v12}, Lcom/licenseinjector/app/core/ZipRewriter;->add(Ljava/lang/String;[B)V

    .line 58
    if-eqz v3, :cond_4

    .line 59
    const-string v0, "\u91cd\u6253\u5305\u4e2d ..."

    invoke-interface {v3, v0}, Lcom/licenseinjector/app/core/Injector$Log;->log(Ljava/lang/String;)V

    .line 61
    :cond_4
    invoke-virtual {v9, v10}, Lcom/licenseinjector/app/core/ZipRewriter;->writeTo(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .end local v11    # "dexName":Ljava/lang/String;
    invoke-virtual {v9}, Lcom/licenseinjector/app/core/ZipRewriter;->close()V

    .line 64
    nop

    .line 65
    if-eqz v3, :cond_5

    .line 66
    const-string v0, "\u7b7e\u540d\u4e2d (v1+v2+v3) ..."

    invoke-interface {v3, v0}, Lcom/licenseinjector/app/core/Injector$Log;->log(Ljava/lang/String;)V

    .line 68
    :cond_5
    move-object v11, p1

    move-object/from16 v12, p4

    invoke-static {v10, p1, v12}, Lcom/licenseinjector/app/core/Injector;->sign(Ljava/io/File;Ljava/io/File;[B)V

    .line 69
    invoke-virtual {v10}, Ljava/io/File;->delete()Z

    .line 70
    if-eqz v3, :cond_6

    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "\u5b8c\u6210: "

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Lcom/licenseinjector/app/core/Injector$Log;->log(Ljava/lang/String;)V

    .line 73
    :cond_6
    return-void

    .line 63
    :catchall_0
    move-exception v0

    move-object v11, p1

    move-object/from16 v12, p4

    invoke-virtual {v9}, Lcom/licenseinjector/app/core/ZipRewriter;->close()V

    .line 64
    throw v0

    .line 35
    .end local v6    # "newManifest":[B
    .end local v7    # "target":Ljava/lang/String;
    .end local v8    # "cfg":Ljava/lang/StringBuilder;
    .end local v9    # "zr":Lcom/licenseinjector/app/core/ZipRewriter;
    .end local v10    # "tmp":Ljava/io/File;
    :cond_7
    move-object v11, p1

    move-object/from16 v12, p4

    new-instance v0, Ljava/lang/Exception;

    const-string v6, "\u8be5 APK \u5df2\u542b\u5361\u5bc6\u6a21\u5757\uff0c\u8bf7\u7528\u672a\u690d\u5165\u8fc7\u7684\u539f\u59cb APK"

    invoke-direct {v0, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static nextDexName(Ljava/util/List;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 76
    .local p0, "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x1

    .line 77
    .local v0, "max":I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, ".dex"

    const-string v4, "classes"

    const/4 v5, 0x1

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 78
    .local v2, "n":Ljava/lang/String;
    invoke-virtual {v2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 79
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x4

    const/4 v4, 0x7

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 80
    .local v3, "mid":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 81
    invoke-static {v0, v5}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_1

    .line 84
    :cond_0
    :try_start_0
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v4
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v4

    .line 86
    goto :goto_1

    .line 85
    :catch_0
    move-exception v4

    .line 89
    .end local v2    # "n":Ljava/lang/String;
    .end local v3    # "mid":Ljava/lang/String;
    :cond_1
    :goto_1
    goto :goto_0

    .line 90
    :cond_2
    if-ne v0, v5, :cond_3

    const-string v1, "classes2.dex"

    goto :goto_2

    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_2
    return-object v1
.end method

.method static readEntry(Ljava/io/File;Ljava/lang/String;)[B
    .locals 7
    .param p0, "zip"    # Ljava/io/File;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 118
    new-instance v0, Ljava/util/zip/ZipFile;

    invoke-direct {v0, p0}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V

    .line 120
    .local v0, "zf":Ljava/util/zip/ZipFile;
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v1

    .line 121
    .local v1, "e":Ljava/util/zip/ZipEntry;
    if-eqz v1, :cond_1

    .line 124
    invoke-virtual {v0, v1}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v2

    .line 125
    .local v2, "in":Ljava/io/InputStream;
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 126
    .local v3, "bo":Ljava/io/ByteArrayOutputStream;
    const/16 v4, 0x2000

    new-array v4, v4, [B

    .line 128
    .local v4, "b":[B
    :goto_0
    invoke-virtual {v2, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5

    move v6, v5

    .local v6, "n":I
    if-lez v5, :cond_0

    .line 129
    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 131
    :cond_0
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 132
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 134
    invoke-virtual {v0}, Ljava/util/zip/ZipFile;->close()V

    .line 132
    return-object v5

    .line 122
    .end local v2    # "in":Ljava/io/InputStream;
    .end local v3    # "bo":Ljava/io/ByteArrayOutputStream;
    .end local v4    # "b":[B
    .end local v6    # "n":I
    :cond_1
    :try_start_1
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u76ee\u6807 APK \u7f3a\u5c11 "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v0    # "zf":Ljava/util/zip/ZipFile;
    .end local p0    # "zip":Ljava/io/File;
    .end local p1    # "name":Ljava/lang/String;
    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 134
    .end local v1    # "e":Ljava/util/zip/ZipEntry;
    .restart local v0    # "zf":Ljava/util/zip/ZipFile;
    .restart local p0    # "zip":Ljava/io/File;
    .restart local p1    # "name":Ljava/lang/String;
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/util/zip/ZipFile;->close()V

    .line 135
    throw v1
.end method

.method static sign(Ljava/io/File;Ljava/io/File;[B)V
    .locals 10
    .param p0, "in"    # Ljava/io/File;
    .param p1, "out"    # Ljava/io/File;
    .param p2, "ksBytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 94
    const-string v0, "PKCS12"

    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v0

    .line 95
    .local v0, "ks":Ljava/security/KeyStore;
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const-string v2, "license123"

    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 96
    invoke-virtual {v0}, Ljava/security/KeyStore;->aliases()Ljava/util/Enumeration;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 97
    .local v1, "alias":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/security/KeyStore;->getKey(Ljava/lang/String;[C)Ljava/security/Key;

    move-result-object v2

    check-cast v2, Ljava/security/PrivateKey;

    .line 98
    .local v2, "priv":Ljava/security/PrivateKey;
    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->getCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;

    move-result-object v3

    check-cast v3, Ljava/security/cert/X509Certificate;

    .line 99
    .local v3, "cert":Ljava/security/cert/X509Certificate;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 100
    .local v4, "certs":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    new-instance v5, Lcom/android/apksig/ApkSigner$SignerConfig$Builder;

    const-string v6, "LICENSE"

    invoke-direct {v5, v6, v2, v4}, Lcom/android/apksig/ApkSigner$SignerConfig$Builder;-><init>(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/util/List;)V

    invoke-virtual {v5}, Lcom/android/apksig/ApkSigner$SignerConfig$Builder;->build()Lcom/android/apksig/ApkSigner$SignerConfig;

    move-result-object v5

    .line 102
    .local v5, "cfg":Lcom/android/apksig/ApkSigner$SignerConfig;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .local v6, "list":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkSigner$SignerConfig;>;"
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    new-instance v7, Lcom/android/apksig/ApkSigner$Builder;

    invoke-direct {v7, v6}, Lcom/android/apksig/ApkSigner$Builder;-><init>(Ljava/util/List;)V

    .line 105
    invoke-virtual {v7, p0}, Lcom/android/apksig/ApkSigner$Builder;->setInputApk(Ljava/io/File;)Lcom/android/apksig/ApkSigner$Builder;

    move-result-object v7

    .line 106
    invoke-virtual {v7, p1}, Lcom/android/apksig/ApkSigner$Builder;->setOutputApk(Ljava/io/File;)Lcom/android/apksig/ApkSigner$Builder;

    move-result-object v7

    .line 107
    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lcom/android/apksig/ApkSigner$Builder;->setV1SigningEnabled(Z)Lcom/android/apksig/ApkSigner$Builder;

    move-result-object v7

    .line 108
    invoke-virtual {v7, v8}, Lcom/android/apksig/ApkSigner$Builder;->setV2SigningEnabled(Z)Lcom/android/apksig/ApkSigner$Builder;

    move-result-object v7

    .line 109
    invoke-virtual {v7, v8}, Lcom/android/apksig/ApkSigner$Builder;->setV3SigningEnabled(Z)Lcom/android/apksig/ApkSigner$Builder;

    move-result-object v7

    .line 110
    const/16 v9, 0x18

    invoke-virtual {v7, v9}, Lcom/android/apksig/ApkSigner$Builder;->setMinSdkVersion(I)Lcom/android/apksig/ApkSigner$Builder;

    move-result-object v7

    .line 111
    const/4 v9, 0x0

    invoke-virtual {v7, v9}, Lcom/android/apksig/ApkSigner$Builder;->setOtherSignersSignaturesPreserved(Z)Lcom/android/apksig/ApkSigner$Builder;

    move-result-object v7

    .line 112
    invoke-virtual {v7, v8}, Lcom/android/apksig/ApkSigner$Builder;->setDebuggableApkPermitted(Z)Lcom/android/apksig/ApkSigner$Builder;

    move-result-object v7

    .line 113
    invoke-virtual {v7}, Lcom/android/apksig/ApkSigner$Builder;->build()Lcom/android/apksig/ApkSigner;

    move-result-object v7

    .line 114
    .local v7, "signer":Lcom/android/apksig/ApkSigner;
    invoke-virtual {v7}, Lcom/android/apksig/ApkSigner;->sign()V

    .line 115
    return-void
.end method
