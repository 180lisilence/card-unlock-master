.class public Lcom/android/apksig/DefaultApkSignerEngine;
.super Ljava/lang/Object;
.source "DefaultApkSignerEngine.java"

# interfaces
.implements Lcom/android/apksig/ApkSignerEngine;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;,
        Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;,
        Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;,
        Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;,
        Lcom/android/apksig/DefaultApkSignerEngine$OutputJarSignatureRequestImpl;,
        Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;,
        Lcom/android/apksig/DefaultApkSignerEngine$Builder;
    }
.end annotation


# static fields
.field private static final DISCARDED_SIGNATURE_BLOCK_IDS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAddSigningBlockRequest:Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;

.field private mAddV1SignatureRequest:Lcom/android/apksig/DefaultApkSignerEngine$OutputJarSignatureRequestImpl;

.field private mClosed:Z

.field private final mCreatedBy:Ljava/lang/String;

.field private mDebuggable:Ljava/lang/Boolean;

.field private final mDebuggableApkPermitted:Z

.field private final mEmittedSignatureJarEntryData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field

.field private mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

.field private mInputJarManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

.field private final mMinSdkVersion:I

.field private final mOtherSignersSignaturesPreserved:Z

.field private mOutputAndroidManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

.field private final mOutputJarEntryDigestRequests:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final mOutputJarEntryDigests:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field

.field private final mOutputSignatureJarEntryDataRequests:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;",
            ">;"
        }
    .end annotation
.end field

.field private mPreservedSignatureBlocks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/util/Pair<",
            "[B",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field private mPreservedV2Signers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[B>;"
        }
    .end annotation
.end field

.field private final mRotationMinSdkVersion:I

.field private final mRotationTargetsDevRelease:Z

.field private mSignatureExpectedOutputJarEntryNames:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mSignerConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;",
            ">;"
        }
    .end annotation
.end field

.field private final mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

.field private final mSourceStampSignerConfig:Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

.field private final mSourceStampSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

.field private final mSourceStampTimestampEnabled:Z

.field private mV1ContentDigestAlgorithm:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

.field private mV1SignaturePending:Z

.field private mV1SignerConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;",
            ">;"
        }
    .end annotation
.end field

.field private final mV1SigningEnabled:Z

.field private mV2SignaturePending:Z

.field private final mV2SigningEnabled:Z

.field private mV3SignaturePending:Z

.field private final mV3SigningEnabled:Z

.field private final mVerityEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 179
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    sput-object v0, Lcom/android/apksig/DefaultApkSignerEngine;->DISCARDED_SIGNATURE_BLOCK_IDS:Ljava/util/Set;

    .line 182
    const v1, 0x42726577

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 185
    const v1, 0x2b09189e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 186
    const v1, 0x6dff800d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 187
    return-void
.end method

.method private constructor <init>(Ljava/util/List;Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;Lcom/android/apksig/SigningCertificateLineage;ZIIZZZZZZZLjava/lang/String;Lcom/android/apksig/SigningCertificateLineage;)V
    .locals 18
    .param p2, "sourceStampSignerConfig"    # Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    .param p3, "sourceStampSigningCertificateLineage"    # Lcom/android/apksig/SigningCertificateLineage;
    .param p4, "sourceStampTimestampEnabled"    # Z
    .param p5, "minSdkVersion"    # I
    .param p6, "rotationMinSdkVersion"    # I
    .param p7, "rotationTargetsDevRelease"    # Z
    .param p8, "v1SigningEnabled"    # Z
    .param p9, "v2SigningEnabled"    # Z
    .param p10, "v3SigningEnabled"    # Z
    .param p11, "verityEnabled"    # Z
    .param p12, "debuggableApkPermitted"    # Z
    .param p13, "otherSignersSignaturesPreserved"    # Z
    .param p14, "createdBy"    # Ljava/lang/String;
    .param p15, "signingCertificateLineage"    # Lcom/android/apksig/SigningCertificateLineage;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "signerConfigs",
            "sourceStampSignerConfig",
            "sourceStampSigningCertificateLineage",
            "sourceStampTimestampEnabled",
            "minSdkVersion",
            "rotationMinSdkVersion",
            "rotationTargetsDevRelease",
            "v1SigningEnabled",
            "v2SigningEnabled",
            "v3SigningEnabled",
            "verityEnabled",
            "debuggableApkPermitted",
            "otherSignersSignaturesPreserved",
            "createdBy",
            "signingCertificateLineage"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;",
            ">;",
            "Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;",
            "Lcom/android/apksig/SigningCertificateLineage;",
            "ZIIZZZZZZZ",
            "Ljava/lang/String;",
            "Lcom/android/apksig/SigningCertificateLineage;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 205
    .local p1, "signerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p5

    move/from16 v3, p8

    move/from16 v4, p9

    move/from16 v5, p10

    move-object/from16 v6, p15

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 115
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v7

    iput-object v7, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mPreservedV2Signers:Ljava/util/List;

    .line 116
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v7

    iput-object v7, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mPreservedSignatureBlocks:Ljava/util/List;

    .line 118
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v7

    iput-object v7, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SignerConfigs:Ljava/util/List;

    .line 126
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v7

    iput-object v7, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mSignatureExpectedOutputJarEntryNames:Ljava/util/Set;

    .line 129
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigestRequests:Ljava/util/Map;

    .line 133
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigests:Ljava/util/Map;

    .line 136
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mEmittedSignatureJarEntryData:Ljava/util/Map;

    .line 139
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputSignatureJarEntryDataRequests:Ljava/util/Map;

    .line 172
    sget-object v7, Lcom/android/apksig/util/RunnablesExecutor;->MULTI_THREADED:Lcom/android/apksig/util/RunnablesExecutor;

    iput-object v7, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    .line 206
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_4

    .line 210
    iput-boolean v3, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SigningEnabled:Z

    .line 211
    iput-boolean v4, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mV2SigningEnabled:Z

    .line 212
    iput-boolean v5, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mV3SigningEnabled:Z

    .line 213
    move/from16 v7, p11

    iput-boolean v7, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mVerityEnabled:Z

    .line 214
    iput-boolean v3, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SignaturePending:Z

    .line 215
    iput-boolean v4, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mV2SignaturePending:Z

    .line 216
    iput-boolean v5, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mV3SignaturePending:Z

    .line 217
    move/from16 v8, p12

    iput-boolean v8, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mDebuggableApkPermitted:Z

    .line 218
    move/from16 v9, p13

    iput-boolean v9, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mOtherSignersSignaturesPreserved:Z

    .line 219
    move-object/from16 v10, p14

    iput-object v10, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mCreatedBy:Ljava/lang/String;

    .line 220
    iput-object v1, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mSignerConfigs:Ljava/util/List;

    .line 221
    move-object/from16 v11, p2

    iput-object v11, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mSourceStampSignerConfig:Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    .line 222
    move-object/from16 v12, p3

    iput-object v12, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mSourceStampSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    .line 223
    move/from16 v13, p4

    iput-boolean v13, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mSourceStampTimestampEnabled:Z

    .line 224
    iput v2, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mMinSdkVersion:I

    .line 225
    move/from16 v14, p6

    iput v14, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mRotationMinSdkVersion:I

    .line 226
    move/from16 v15, p7

    iput-boolean v15, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mRotationTargetsDevRelease:Z

    .line 227
    iput-object v6, v0, Lcom/android/apksig/DefaultApkSignerEngine;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    .line 229
    if-eqz v3, :cond_3

    .line 230
    if-eqz v5, :cond_2

    .line 234
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    .line 238
    .local v16, "oldestConfig":Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    if-eqz v6, :cond_1

    .line 239
    nop

    .line 241
    invoke-static/range {v16 .. v16}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->access$000(Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/security/cert/X509Certificate;

    .line 240
    invoke-virtual {v6, v3}, Lcom/android/apksig/SigningCertificateLineage;->getSubLineage(Ljava/security/cert/X509Certificate;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v3

    .line 242
    .local v3, "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    invoke-virtual {v3}, Lcom/android/apksig/SigningCertificateLineage;->size()I

    move-result v4

    move-object/from16 v17, v3

    .end local v3    # "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    .local v17, "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    const/4 v3, 0x1

    if-ne v4, v3, :cond_0

    goto :goto_0

    .line 243
    :cond_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "v1 signing enabled but the oldest signer in the SigningCertificateLineage is missing.  Please provide the oldest signer to enable v1 signing"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 249
    .end local v17    # "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    :cond_1
    :goto_0
    invoke-static/range {v16 .. v16}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v3, v2}, Lcom/android/apksig/DefaultApkSignerEngine;->createV1SignerConfigs(Ljava/util/List;I)V

    .line 250
    .end local v16    # "oldestConfig":Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    goto :goto_1

    .line 251
    :cond_2
    invoke-direct {v0, v1, v2}, Lcom/android/apksig/DefaultApkSignerEngine;->createV1SignerConfigs(Ljava/util/List;I)V

    .line 254
    :cond_3
    :goto_1
    return-void

    .line 207
    :cond_4
    move-object/from16 v11, p2

    move-object/from16 v12, p3

    move/from16 v13, p4

    move/from16 v14, p6

    move/from16 v15, p7

    move/from16 v7, p11

    move/from16 v8, p12

    move/from16 v9, p13

    move-object/from16 v10, p14

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "At least one signer config must be provided"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method synthetic constructor <init>(Ljava/util/List;Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;Lcom/android/apksig/SigningCertificateLineage;ZIIZZZZZZZLjava/lang/String;Lcom/android/apksig/SigningCertificateLineage;Lcom/android/apksig/DefaultApkSignerEngine$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/util/List;
    .param p2, "x1"    # Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    .param p3, "x2"    # Lcom/android/apksig/SigningCertificateLineage;
    .param p4, "x3"    # Z
    .param p5, "x4"    # I
    .param p6, "x5"    # I
    .param p7, "x6"    # Z
    .param p8, "x7"    # Z
    .param p9, "x8"    # Z
    .param p10, "x9"    # Z
    .param p11, "x10"    # Z
    .param p12, "x11"    # Z
    .param p13, "x12"    # Z
    .param p14, "x13"    # Ljava/lang/String;
    .param p15, "x14"    # Lcom/android/apksig/SigningCertificateLineage;
    .param p16, "x15"    # Lcom/android/apksig/DefaultApkSignerEngine$1;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 82
    invoke-direct/range {p0 .. p15}, Lcom/android/apksig/DefaultApkSignerEngine;-><init>(Ljava/util/List;Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;Lcom/android/apksig/SigningCertificateLineage;ZIIZZZZZZZLjava/lang/String;Lcom/android/apksig/SigningCertificateLineage;)V

    return-void
.end method

.method private checkNotClosed()V
    .locals 2

    .line 1259
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mClosed:Z

    if-nez v0, :cond_0

    .line 1262
    return-void

    .line 1260
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Engine closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private checkOutputApkNotDebuggableIfDebuggableMustBeRejected()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 1322
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mDebuggableApkPermitted:Z

    if-eqz v0, :cond_0

    .line 1323
    return-void

    .line 1327
    :cond_0
    :try_start_0
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->isOutputApkDebuggable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1334
    nop

    .line 1335
    return-void

    .line 1328
    :cond_1
    new-instance v0, Ljava/security/SignatureException;

    const-string v1, "APK is debuggable (see android:debuggable attribute) and this engine is configured to refuse to sign debuggable APKs"

    invoke-direct {v0, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1332
    :catch_0
    move-exception v0

    .line 1333
    .local v0, "e":Lcom/android/apksig/apk/ApkFormatException;
    new-instance v1, Ljava/security/SignatureException;

    const-string v2, "Failed to determine whether the APK is debuggable"

    invoke-direct {v1, v2, v0}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private checkSigningBlockDoneIfEnabled()V
    .locals 2

    .line 1304
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV2SignaturePending:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV3SignaturePending:Z

    if-nez v0, :cond_0

    .line 1305
    return-void

    .line 1307
    :cond_0
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mAddSigningBlockRequest:Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;

    if-eqz v0, :cond_2

    .line 1311
    invoke-static {v0}, Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;->access$1100(Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1316
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mAddSigningBlockRequest:Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;

    .line 1317
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV2SignaturePending:Z

    .line 1318
    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV3SignaturePending:Z

    .line 1319
    return-void

    .line 1312
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "APK Signing Block addition of signature(s) requested by outputZipSections() hasn\'t been fulfilled yet"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1308
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Signed APK Signing BLock not yet generated. Skipped outputZipSections()?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private checkV1SigningDoneIfEnabled()V
    .locals 8

    .line 1265
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SignaturePending:Z

    if-nez v0, :cond_0

    .line 1266
    return-void

    .line 1269
    :cond_0
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mAddV1SignatureRequest:Lcom/android/apksig/DefaultApkSignerEngine$OutputJarSignatureRequestImpl;

    if-eqz v0, :cond_6

    .line 1273
    invoke-static {v0}, Lcom/android/apksig/DefaultApkSignerEngine$OutputJarSignatureRequestImpl;->access$800(Lcom/android/apksig/DefaultApkSignerEngine$OutputJarSignatureRequestImpl;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1279
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mEmittedSignatureJarEntryData:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 1280
    .local v1, "expectedOutputEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[B>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1281
    .local v2, "entryName":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    .line 1282
    .local v3, "expectedData":[B
    iget-object v4, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputSignatureJarEntryDataRequests:Ljava/util/Map;

    .line 1283
    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    .line 1284
    .local v4, "actualDataRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;
    if-eqz v4, :cond_3

    .line 1290
    invoke-static {v4}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->access$400(Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1294
    invoke-static {v4}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->access$700(Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;)[B

    move-result-object v5

    .line 1295
    .local v5, "actualData":[B
    invoke-static {v3, v5}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1299
    .end local v1    # "expectedOutputEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[B>;"
    .end local v2    # "entryName":Ljava/lang/String;
    .end local v3    # "expectedData":[B
    .end local v4    # "actualDataRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;
    .end local v5    # "actualData":[B
    goto :goto_0

    .line 1296
    .restart local v1    # "expectedOutputEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[B>;"
    .restart local v2    # "entryName":Ljava/lang/String;
    .restart local v3    # "expectedData":[B
    .restart local v4    # "actualDataRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;
    .restart local v5    # "actualData":[B
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Output APK entry "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " data differs from what was requested"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1291
    .end local v5    # "actualData":[B
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Still waiting to inspect output APK\'s "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1285
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "APK entry "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " not yet output despite this having been requested"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1300
    .end local v1    # "expectedOutputEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[B>;"
    .end local v2    # "entryName":Ljava/lang/String;
    .end local v3    # "expectedData":[B
    .end local v4    # "actualDataRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;
    :cond_4
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SignaturePending:Z

    .line 1301
    return-void

    .line 1274
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "v1 signature (JAR signature) addition requested by outputJarEntries() hasn\'t been fulfilled"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1270
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "v1 signature (JAR signature) not yet generated. Skipped outputJarEntries()?"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private createSigningBlockSignerConfig(Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;ZI)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .locals 8
    .param p1, "signerConfig"    # Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    .param p2, "apkSigningBlockPaddingSupported"    # Z
    .param p3, "schemeId"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "signerConfig",
            "apkSigningBlockPaddingSupported",
            "schemeId"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 530
    invoke-virtual {p1}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->getCertificates()Ljava/util/List;

    move-result-object v0

    .line 531
    .local v0, "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/security/cert/X509Certificate;

    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v2

    .line 533
    .local v2, "publicKey":Ljava/security/PublicKey;
    new-instance v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    invoke-direct {v3}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;-><init>()V

    .line 534
    .local v3, "newSignerConfig":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    invoke-virtual {p1}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->getPrivateKey()Ljava/security/PrivateKey;

    move-result-object v4

    iput-object v4, v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->privateKey:Ljava/security/PrivateKey;

    .line 535
    iput-object v0, v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    .line 537
    const/4 v4, 0x0

    const/4 v5, 0x1

    packed-switch p3, :pswitch_data_0

    .line 580
    :pswitch_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v4, "Unknown APK Signature Scheme ID requested"

    invoke-direct {v1, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 565
    :pswitch_1
    :try_start_0
    iget v1, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mMinSdkVersion:I

    .line 568
    invoke-virtual {p1}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->getDeterministicDsaSigning()Z

    move-result v5

    .line 566
    invoke-static {v2, v1, p2, v5}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->getSuggestedSignatureAlgorithms(Ljava/security/PublicKey;IZZ)Ljava/util/List;

    move-result-object v1

    iput-object v1, v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->signatureAlgorithms:Ljava/util/List;
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    .line 572
    goto :goto_0

    .line 569
    :catch_0
    move-exception v1

    .line 571
    .local v1, "e":Ljava/security/InvalidKeyException;
    iput-object v4, v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->signatureAlgorithms:Ljava/util/List;

    .line 573
    .end local v1    # "e":Ljava/security/InvalidKeyException;
    goto :goto_0

    .line 548
    :pswitch_2
    :try_start_1
    iget v6, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mMinSdkVersion:I

    if-eqz p2, :cond_0

    iget-boolean v7, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mVerityEnabled:Z

    if-eqz v7, :cond_0

    move v1, v5

    .line 553
    :cond_0
    invoke-virtual {p1}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->getDeterministicDsaSigning()Z

    move-result v5

    .line 549
    invoke-static {v2, v6, v1, v5}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->getSuggestedSignatureAlgorithms(Ljava/security/PublicKey;IZZ)Ljava/util/List;

    move-result-object v1

    iput-object v1, v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->signatureAlgorithms:Ljava/util/List;
    :try_end_1
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_1

    .line 561
    goto :goto_0

    .line 554
    :catch_1
    move-exception v1

    .line 560
    .restart local v1    # "e":Ljava/security/InvalidKeyException;
    iput-object v4, v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->signatureAlgorithms:Ljava/util/List;

    .line 562
    .end local v1    # "e":Ljava/security/InvalidKeyException;
    goto :goto_0

    .line 539
    :pswitch_3
    iget v4, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mMinSdkVersion:I

    if-eqz p2, :cond_1

    iget-boolean v6, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mVerityEnabled:Z

    if-eqz v6, :cond_1

    move v1, v5

    .line 544
    :cond_1
    invoke-virtual {p1}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->getDeterministicDsaSigning()Z

    move-result v5

    .line 540
    invoke-static {v2, v4, v1, v5}, Lcom/android/apksig/internal/apk/v2/V2SchemeSigner;->getSuggestedSignatureAlgorithms(Ljava/security/PublicKey;IZZ)Ljava/util/List;

    move-result-object v1

    iput-object v1, v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->signatureAlgorithms:Ljava/util/List;

    .line 545
    goto :goto_0

    .line 575
    :pswitch_4
    sget-object v1, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->RSA_PKCS1_V1_5_WITH_SHA256:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    .line 576
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v3, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->signatureAlgorithms:Ljava/util/List;

    .line 578
    nop

    .line 582
    :goto_0
    return-object v3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private createSigningBlockSignerConfigs(ZI)Ljava/util/List;
    .locals 4
    .param p1, "apkSigningBlockPaddingSupported"    # Z
    .param p2, "schemeId"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apkSigningBlockPaddingSupported",
            "schemeId"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZI)",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 516
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSignerConfigs:Ljava/util/List;

    .line 517
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 518
    .local v0, "signerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSignerConfigs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 519
    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSignerConfigs:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    .line 520
    .local v2, "signerConfig":Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    nop

    .line 521
    invoke-direct {p0, v2, p1, p2}, Lcom/android/apksig/DefaultApkSignerEngine;->createSigningBlockSignerConfig(Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;ZI)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    move-result-object v3

    .line 520
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 518
    .end local v2    # "signerConfig":Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 524
    .end local v1    # "i":I
    :cond_0
    return-object v0
.end method

.method private createSourceStampSignerConfig()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 487
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSourceStampSignerConfig:Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, v1}, Lcom/android/apksig/DefaultApkSignerEngine;->createSigningBlockSignerConfig(Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;ZI)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    move-result-object v0

    .line 491
    .local v0, "config":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSourceStampSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    if-eqz v2, :cond_0

    .line 492
    iget-object v3, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    .line 493
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509Certificate;

    .line 492
    invoke-virtual {v2, v1}, Lcom/android/apksig/SigningCertificateLineage;->getSubLineage(Ljava/security/cert/X509Certificate;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v1

    iput-object v1, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    .line 495
    :cond_0
    return-object v0
.end method

.method private createV1SignerConfigs(Ljava/util/List;I)V
    .locals 11
    .param p2, "minSdkVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "signerConfigs",
            "minSdkVersion"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;",
            ">;I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 258
    .local p1, "signerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SignerConfigs:Ljava/util/List;

    .line 259
    new-instance v0, Ljava/util/HashMap;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 260
    .local v0, "v1SignerNameToSignerIndex":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    .line 261
    .local v1, "v1ContentDigestAlgorithm":Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_3

    .line 262
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    .line 263
    .local v3, "signerConfig":Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    invoke-virtual {v3}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->getCertificates()Ljava/util/List;

    move-result-object v4

    .line 264
    .local v4, "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/security/cert/X509Certificate;

    invoke-virtual {v5}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v5

    .line 266
    .local v5, "publicKey":Ljava/security/PublicKey;
    invoke-virtual {v3}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->getSafeSignerName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 268
    .local v6, "v1SignerName":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 269
    .local v7, "indexOfOtherSignerWithSameName":Ljava/lang/Integer;
    if-nez v7, :cond_2

    .line 280
    nop

    .line 281
    invoke-static {v5, p2}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->getSuggestedSignatureDigestAlgorithm(Ljava/security/PublicKey;I)Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    move-result-object v8

    .line 282
    .local v8, "v1SignatureDigestAlgorithm":Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;
    new-instance v9, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;

    invoke-direct {v9}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;-><init>()V

    .line 283
    .local v9, "v1SignerConfig":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;
    iput-object v6, v9, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;->name:Ljava/lang/String;

    .line 284
    invoke-virtual {v3}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->getPrivateKey()Ljava/security/PrivateKey;

    move-result-object v10

    iput-object v10, v9, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;->privateKey:Ljava/security/PrivateKey;

    .line 285
    iput-object v4, v9, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;->certificates:Ljava/util/List;

    .line 286
    iput-object v8, v9, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;->signatureDigestAlgorithm:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    .line 287
    invoke-virtual {v3}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->getDeterministicDsaSigning()Z

    move-result v10

    iput-boolean v10, v9, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;->deterministicDsaSigning:Z

    .line 293
    if-nez v1, :cond_0

    .line 294
    move-object v1, v8

    goto :goto_1

    .line 296
    :cond_0
    sget-object v10, Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;->BY_STRENGTH_COMPARATOR:Ljava/util/Comparator;

    invoke-interface {v10, v8, v1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v10

    if-lez v10, :cond_1

    .line 299
    move-object v1, v8

    .line 302
    :cond_1
    :goto_1
    iget-object v10, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SignerConfigs:Ljava/util/List;

    invoke-interface {v10, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    .end local v3    # "signerConfig":Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    .end local v4    # "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .end local v5    # "publicKey":Ljava/security/PublicKey;
    .end local v6    # "v1SignerName":Ljava/lang/String;
    .end local v7    # "indexOfOtherSignerWithSameName":Ljava/lang/Integer;
    .end local v8    # "v1SignatureDigestAlgorithm":Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;
    .end local v9    # "v1SignerConfig":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$SignerConfig;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 270
    .restart local v3    # "signerConfig":Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    .restart local v4    # "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .restart local v5    # "publicKey":Ljava/security/PublicKey;
    .restart local v6    # "v1SignerName":Ljava/lang/String;
    .restart local v7    # "indexOfOtherSignerWithSameName":Ljava/lang/Integer;
    :cond_2
    new-instance v8, Ljava/lang/IllegalArgumentException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Signers #"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 272
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " and #"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    add-int/lit8 v10, v2, 0x1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " have the same name: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ". v1 signer names must be unique"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 304
    .end local v2    # "i":I
    .end local v3    # "signerConfig":Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    .end local v4    # "certificates":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    .end local v5    # "publicKey":Ljava/security/PublicKey;
    .end local v6    # "v1SignerName":Ljava/lang/String;
    .end local v7    # "indexOfOtherSignerWithSameName":Ljava/lang/Integer;
    :cond_3
    iput-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1ContentDigestAlgorithm:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    .line 305
    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SignerConfigs:Ljava/util/List;

    .line 306
    invoke-static {v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->getOutputEntryNames(Ljava/util/List;)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSignatureExpectedOutputJarEntryNames:Ljava/util/Set;

    .line 307
    return-void
.end method

.method private createV2SignerConfigs(Z)Ljava/util/List;
    .locals 7
    .param p1, "apkSigningBlockPaddingSupported"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apkSigningBlockPaddingSupported"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 311
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV3SigningEnabled:Z

    const/4 v1, 0x2

    if-eqz v0, :cond_2

    .line 315
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 317
    .local v0, "signerConfig":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSignerConfigs:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    .line 321
    .local v2, "oldestConfig":Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    iget-object v4, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    if-eqz v4, :cond_1

    .line 322
    nop

    .line 323
    invoke-static {v2}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->access$000(Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/security/cert/X509Certificate;

    invoke-virtual {v4, v5}, Lcom/android/apksig/SigningCertificateLineage;->getSubLineage(Ljava/security/cert/X509Certificate;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v4

    .line 324
    .local v4, "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    invoke-virtual {v4}, Lcom/android/apksig/SigningCertificateLineage;->size()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_0

    goto :goto_0

    .line 325
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v3, "v2 signing enabled but the oldest signer in the SigningCertificateLineage is missing.  Please provide the oldest signer to enable v2 signing."

    invoke-direct {v1, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 331
    .end local v4    # "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    :cond_1
    :goto_0
    iget-object v4, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSignerConfigs:Ljava/util/List;

    .line 333
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    .line 332
    invoke-direct {p0, v3, p1, v1}, Lcom/android/apksig/DefaultApkSignerEngine;->createSigningBlockSignerConfig(Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;ZI)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    move-result-object v1

    .line 331
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 336
    return-object v0

    .line 338
    .end local v0    # "signerConfig":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    .end local v2    # "oldestConfig":Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    :cond_2
    invoke-direct {p0, p1, v1}, Lcom/android/apksig/DefaultApkSignerEngine;->createSigningBlockSignerConfigs(ZI)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private createV3SignerConfigs(Z)Ljava/util/List;
    .locals 1
    .param p1, "apkSigningBlockPaddingSupported"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apkSigningBlockPaddingSupported"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 443
    const/4 v0, 0x3

    invoke-direct {p0, p1, v0}, Lcom/android/apksig/DefaultApkSignerEngine;->createSigningBlockSignerConfigs(ZI)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/apksig/DefaultApkSignerEngine;->processV3Configs(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private createV4SignerConfig()Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 475
    const/4 v0, 0x4

    const/4 v1, 0x1

    invoke-direct {p0, v1, v0}, Lcom/android/apksig/DefaultApkSignerEngine;->createSigningBlockSignerConfigs(ZI)Ljava/util/List;

    move-result-object v0

    .line 477
    .local v0, "v4Configs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-eq v2, v1, :cond_0

    .line 479
    invoke-direct {p0, v0}, Lcom/android/apksig/DefaultApkSignerEngine;->processV3Configs(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 481
    :cond_0
    invoke-direct {p0, v0}, Lcom/android/apksig/DefaultApkSignerEngine;->processV31SignerConfigs(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 482
    .local v1, "v41configs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    new-instance v2, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;

    invoke-direct {v2, v0, v1}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;-><init>(Ljava/util/List;Ljava/util/List;)V

    return-object v2
.end method

.method private forgetOutputApkDebuggableStatus()V
    .locals 1

    .line 1365
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mDebuggable:Ljava/lang/Boolean;

    .line 1366
    return-void
.end method

.method private getInputJarEntryOutputPolicy(Ljava/lang/String;)Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;
    .locals 1
    .param p1, "entryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entryName"
        }
    .end annotation

    .line 1370
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSignatureExpectedOutputJarEntryNames:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1371
    sget-object v0, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;->OUTPUT_BY_ENGINE:Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;

    return-object v0

    .line 1373
    :cond_0
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOtherSignersSignaturesPreserved:Z

    if-nez v0, :cond_2

    .line 1374
    invoke-static {p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->isJarEntryDigestNeededInManifest(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 1377
    :cond_1
    sget-object v0, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;->SKIP:Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;

    return-object v0

    .line 1375
    :cond_2
    :goto_0
    sget-object v0, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;->OUTPUT:Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;

    return-object v0
.end method

.method private getMinSdkFromV3SignatureAlgorithms(Ljava/util/List;)I
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "algorithms"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/SignatureAlgorithm;",
            ">;)I"
        }
    .end annotation

    .line 499
    .local p1, "algorithms":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/SignatureAlgorithm;>;"
    const v0, 0x7fffffff

    .line 500
    .local v0, "min":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    .line 501
    .local v2, "algorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    invoke-virtual {v2}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->getMinSdkVersion()I

    move-result v3

    .line 502
    .local v3, "current":I
    if-ge v3, v0, :cond_2

    .line 503
    iget v4, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mMinSdkVersion:I

    if-le v3, v4, :cond_1

    const/16 v4, 0x1c

    if-gt v3, v4, :cond_0

    goto :goto_1

    .line 507
    :cond_0
    move v0, v3

    goto :goto_2

    .line 505
    :cond_1
    :goto_1
    return v3

    .line 510
    .end local v2    # "algorithm":Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .end local v3    # "current":I
    :cond_2
    :goto_2
    goto :goto_0

    .line 511
    :cond_3
    return v0
.end method

.method private invalidateV1Signature()V
    .locals 1

    .line 1238
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SigningEnabled:Z

    if-eqz v0, :cond_0

    .line 1239
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SignaturePending:Z

    .line 1241
    :cond_0
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->invalidateV2Signature()V

    .line 1242
    return-void
.end method

.method private invalidateV2Signature()V
    .locals 1

    .line 1245
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV2SigningEnabled:Z

    if-eqz v0, :cond_0

    .line 1246
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV2SignaturePending:Z

    .line 1247
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mAddSigningBlockRequest:Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;

    .line 1249
    :cond_0
    return-void
.end method

.method private invalidateV3Signature()V
    .locals 1

    .line 1252
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV3SigningEnabled:Z

    if-eqz v0, :cond_0

    .line 1253
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV3SignaturePending:Z

    .line 1254
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mAddSigningBlockRequest:Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;

    .line 1256
    :cond_0
    return-void
.end method

.method private isConfiguredWithSigner(Ljava/util/List;)Z
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "signerCerts"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/security/cert/X509Certificate;",
            ">;)Z"
        }
    .end annotation

    .line 728
    .local p1, "signerCerts":Ljava/util/List;, "Ljava/util/List<Ljava/security/cert/X509Certificate;>;"
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSignerConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    .line 729
    .local v1, "signerConfig":Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    invoke-virtual {v1}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->getCertificates()Ljava/util/List;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 730
    const/4 v0, 0x1

    return v0

    .line 732
    .end local v1    # "signerConfig":Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;
    :cond_0
    goto :goto_0

    .line 733
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private isDebuggable(Ljava/lang/String;)Z
    .locals 1
    .param p1, "entryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entryName"
        }
    .end annotation

    .line 586
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mDebuggableApkPermitted:Z

    if-nez v0, :cond_1

    .line 587
    const-string v0, "AndroidManifest.xml"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 586
    :goto_1
    return v0
.end method

.method private isOutputApkDebuggable()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 1342
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mDebuggable:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    .line 1343
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    .line 1346
    :cond_0
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputAndroidManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    if-eqz v0, :cond_2

    .line 1353
    invoke-static {v0}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->access$400(Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1358
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputAndroidManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    .line 1360
    invoke-static {v0}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->access$700(Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;)[B

    move-result-object v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 1359
    invoke-static {v0}, Lcom/android/apksig/apk/ApkUtils;->getDebuggableFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mDebuggable:Ljava/lang/Boolean;

    .line 1361
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    .line 1354
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Still waiting to inspect output APK\'s "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputAndroidManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    .line 1356
    invoke-virtual {v2}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->getEntryName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1347
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot determine debuggable status of output APK because AndroidManifest.xml entry contents have not yet been requested"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private outputZipSectionsInternal(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Z)Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;
    .locals 20
    .param p1, "zipEntries"    # Lcom/android/apksig/util/DataSource;
    .param p2, "zipCentralDirectory"    # Lcom/android/apksig/util/DataSource;
    .param p3, "zipEocd"    # Lcom/android/apksig/util/DataSource;
    .param p4, "apkSigningBlockPaddingSupported"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "zipEntries",
            "zipCentralDirectory",
            "zipEocd",
            "apkSigningBlockPaddingSupported"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 1032
    move-object/from16 v1, p0

    move-object/from16 v9, p2

    move/from16 v10, p4

    invoke-direct/range {p0 .. p0}, Lcom/android/apksig/DefaultApkSignerEngine;->checkNotClosed()V

    .line 1033
    invoke-direct/range {p0 .. p0}, Lcom/android/apksig/DefaultApkSignerEngine;->checkV1SigningDoneIfEnabled()V

    .line 1034
    iget-boolean v0, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mV2SigningEnabled:Z

    const/4 v11, 0x0

    if-nez v0, :cond_0

    iget-boolean v0, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mV3SigningEnabled:Z

    if-nez v0, :cond_0

    invoke-virtual/range {p0 .. p0}, Lcom/android/apksig/DefaultApkSignerEngine;->isEligibleForSourceStamp()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1035
    return-object v11

    .line 1037
    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/android/apksig/DefaultApkSignerEngine;->checkOutputApkNotDebuggableIfDebuggableMustBeRejected()V

    .line 1040
    nop

    .line 1041
    move-object/from16 v12, p1

    invoke-static {v12, v10}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->generateApkSigningBlockPadding(Lcom/android/apksig/util/DataSource;Z)Lcom/android/apksig/internal/util/Pair;

    move-result-object v13

    .line 1043
    .local v13, "paddingPair":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Lcom/android/apksig/util/DataSource;Ljava/lang/Integer;>;"
    invoke-virtual {v13}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Lcom/android/apksig/util/DataSource;

    .line 1044
    .local v14, "beforeCentralDir":Lcom/android/apksig/util/DataSource;
    invoke-virtual {v13}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v15

    .line 1045
    .local v15, "padSizeBeforeApkSigningBlock":I
    move-object/from16 v8, p3

    invoke-static {v14, v8}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->copyWithModifiedCDOffset(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/util/DataSource;

    move-result-object v7

    .line 1047
    .local v7, "eocd":Lcom/android/apksig/util/DataSource;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v6, v0

    .line 1048
    .local v6, "signingSchemeBlocks":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;>;"
    const/4 v0, 0x0

    .line 1049
    .local v0, "v2SigningSchemeBlockAndDigests":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;
    const/16 v16, 0x0

    .line 1053
    .local v16, "v3SigningSchemeBlockAndDigests":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;
    iget-boolean v2, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mOtherSignersSignaturesPreserved:Z

    if-eqz v2, :cond_1

    iget-object v2, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mPreservedSignatureBlocks:Ljava/util/List;

    if-eqz v2, :cond_1

    .line 1054
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1055
    iget-object v2, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mPreservedSignatureBlocks:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1059
    :cond_1
    iget-boolean v2, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mV2SigningEnabled:Z

    if-eqz v2, :cond_3

    .line 1060
    invoke-direct/range {p0 .. p0}, Lcom/android/apksig/DefaultApkSignerEngine;->invalidateV2Signature()V

    .line 1061
    nop

    .line 1062
    invoke-direct {v1, v10}, Lcom/android/apksig/DefaultApkSignerEngine;->createV2SignerConfigs(Z)Ljava/util/List;

    move-result-object v17

    .line 1063
    .local v17, "v2SignerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    iget-object v2, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    iget-boolean v5, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mV3SigningEnabled:Z

    .line 1071
    iget-boolean v3, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mOtherSignersSignaturesPreserved:Z

    if-eqz v3, :cond_2

    iget-object v3, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mPreservedV2Signers:Ljava/util/List;

    move-object/from16 v18, v3

    goto :goto_0

    :cond_2
    move-object/from16 v18, v11

    .line 1064
    :goto_0
    move-object v3, v14

    move-object/from16 v4, p2

    move/from16 v19, v5

    move-object v5, v7

    move-object v11, v6

    .end local v6    # "signingSchemeBlocks":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;>;"
    .local v11, "signingSchemeBlocks":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;>;"
    move-object/from16 v6, v17

    move-object v12, v7

    .end local v7    # "eocd":Lcom/android/apksig/util/DataSource;
    .local v12, "eocd":Lcom/android/apksig/util/DataSource;
    move/from16 v7, v19

    move-object/from16 v8, v18

    invoke-static/range {v2 .. v8}, Lcom/android/apksig/internal/apk/v2/V2SchemeSigner;->generateApkSignatureSchemeV2Block(Lcom/android/apksig/util/RunnablesExecutor;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/util/List;ZLjava/util/List;)Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;

    move-result-object v0

    .line 1072
    iget-object v2, v0, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;->signingSchemeBlock:Lcom/android/apksig/internal/util/Pair;

    invoke-interface {v11, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v2, v0

    goto :goto_1

    .line 1059
    .end local v11    # "signingSchemeBlocks":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;>;"
    .end local v12    # "eocd":Lcom/android/apksig/util/DataSource;
    .end local v17    # "v2SignerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    .restart local v6    # "signingSchemeBlocks":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;>;"
    .restart local v7    # "eocd":Lcom/android/apksig/util/DataSource;
    :cond_3
    move-object v11, v6

    move-object v12, v7

    .end local v6    # "signingSchemeBlocks":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;>;"
    .end local v7    # "eocd":Lcom/android/apksig/util/DataSource;
    .restart local v11    # "signingSchemeBlocks":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;>;"
    .restart local v12    # "eocd":Lcom/android/apksig/util/DataSource;
    move-object v2, v0

    .line 1074
    .end local v0    # "v2SigningSchemeBlockAndDigests":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;
    .local v2, "v2SigningSchemeBlockAndDigests":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;
    :goto_1
    iget-boolean v0, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mV3SigningEnabled:Z

    if-eqz v0, :cond_6

    .line 1075
    invoke-direct/range {p0 .. p0}, Lcom/android/apksig/DefaultApkSignerEngine;->invalidateV3Signature()V

    .line 1076
    nop

    .line 1077
    invoke-direct {v1, v10}, Lcom/android/apksig/DefaultApkSignerEngine;->createV3SignerConfigs(Z)Ljava/util/List;

    move-result-object v0

    .line 1078
    .local v0, "v3SignerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    invoke-direct {v1, v0}, Lcom/android/apksig/DefaultApkSignerEngine;->processV31SignerConfigs(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    .line 1080
    .local v3, "v31SignerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    if-eqz v3, :cond_4

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_4

    .line 1082
    new-instance v4, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;

    invoke-direct {v4, v14, v9, v12, v3}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;-><init>(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/util/List;)V

    iget-object v5, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    .line 1085
    invoke-virtual {v4, v5}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->setRunnablesExecutor(Lcom/android/apksig/util/RunnablesExecutor;)Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;

    move-result-object v4

    .line 1086
    const v5, 0x1b93ad61

    invoke-virtual {v4, v5}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->setBlockId(I)Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;

    move-result-object v4

    iget-boolean v5, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mRotationTargetsDevRelease:Z

    .line 1087
    invoke-virtual {v4, v5}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->setRotationTargetsDevRelease(Z)Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;

    move-result-object v4

    .line 1088
    invoke-virtual {v4}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->build()Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;

    move-result-object v4

    .line 1089
    invoke-virtual {v4}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->generateApkSignatureSchemeV3BlockAndDigests()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;

    move-result-object v4

    .line 1090
    .local v4, "v31SigningSchemeBlockAndDigests":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;
    iget-object v5, v4, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;->signingSchemeBlock:Lcom/android/apksig/internal/util/Pair;

    invoke-interface {v11, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1092
    .end local v4    # "v31SigningSchemeBlockAndDigests":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;
    :cond_4
    new-instance v4, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;

    invoke-direct {v4, v14, v9, v12, v0}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;-><init>(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Ljava/util/List;)V

    iget-object v5, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    .line 1094
    invoke-virtual {v4, v5}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->setRunnablesExecutor(Lcom/android/apksig/util/RunnablesExecutor;)Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;

    move-result-object v4

    .line 1095
    const v5, -0xfac9740

    invoke-virtual {v4, v5}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->setBlockId(I)Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;

    move-result-object v4

    .line 1096
    .local v4, "builder":Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;
    invoke-direct/range {p0 .. p0}, Lcom/android/apksig/DefaultApkSignerEngine;->signingLineageHas31Support()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 1097
    iget v5, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mRotationMinSdkVersion:I

    invoke-virtual {v4, v5}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->setRotationMinSdkVersion(I)Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;

    .line 1099
    :cond_5
    nop

    .line 1100
    invoke-virtual {v4}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;->build()Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/apksig/internal/apk/v3/V3SchemeSigner;->generateApkSignatureSchemeV3BlockAndDigests()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;

    move-result-object v5

    .line 1101
    .end local v16    # "v3SigningSchemeBlockAndDigests":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;
    .local v5, "v3SigningSchemeBlockAndDigests":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;
    iget-object v6, v5, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;->signingSchemeBlock:Lcom/android/apksig/internal/util/Pair;

    invoke-interface {v11, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 1074
    .end local v0    # "v3SignerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    .end local v3    # "v31SignerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    .end local v4    # "builder":Lcom/android/apksig/internal/apk/v3/V3SchemeSigner$Builder;
    .end local v5    # "v3SigningSchemeBlockAndDigests":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;
    .restart local v16    # "v3SigningSchemeBlockAndDigests":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;
    :cond_6
    move-object/from16 v5, v16

    .line 1103
    .end local v16    # "v3SigningSchemeBlockAndDigests":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;
    .restart local v5    # "v3SigningSchemeBlockAndDigests":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;
    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/android/apksig/DefaultApkSignerEngine;->isEligibleForSourceStamp()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 1104
    nop

    .line 1105
    invoke-direct/range {p0 .. p0}, Lcom/android/apksig/DefaultApkSignerEngine;->createSourceStampSignerConfig()Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    move-result-object v3

    .line 1106
    .local v3, "sourceStampSignerConfig":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v4, v0

    .line 1108
    .local v4, "signatureSchemeDigestInfos":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    iget-boolean v0, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mV3SigningEnabled:Z

    if-eqz v0, :cond_7

    .line 1109
    nop

    .line 1110
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v6, v5, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;->digestInfo:Ljava/util/Map;

    .line 1109
    invoke-interface {v4, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1112
    :cond_7
    iget-boolean v0, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mV2SigningEnabled:Z

    if-eqz v0, :cond_8

    .line 1113
    nop

    .line 1114
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object v6, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SigningSchemeBlockAndDigests;->digestInfo:Ljava/util/Map;

    .line 1113
    invoke-interface {v4, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1116
    :cond_8
    iget-boolean v0, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SigningEnabled:Z

    if-eqz v0, :cond_a

    .line 1117
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    move-object v6, v0

    .line 1123
    .local v6, "v1SigningSchemeDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    :try_start_0
    iget-object v0, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mInputJarManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    if-eqz v0, :cond_9

    .line 1124
    invoke-static {v0}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->access$700(Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;)[B

    move-result-object v0

    goto :goto_3

    .line 1125
    :cond_9
    const/4 v0, 0x0

    :goto_3
    nop

    .line 1126
    .local v0, "inputJarManifest":[B
    iget-object v7, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mV1ContentDigestAlgorithm:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    iget-object v8, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigests:Ljava/util/Map;

    .line 1127
    invoke-static {v7, v8, v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->generateManifestFile(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;Ljava/util/Map;[B)Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;

    move-result-object v7

    iget-object v7, v7, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;->contents:[B

    .line 1134
    .local v7, "jarManifest":[B
    sget-object v8, Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;->SHA256:Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;

    .line 1135
    move-object/from16 v16, v0

    .end local v0    # "inputJarManifest":[B
    .local v16, "inputJarManifest":[B
    invoke-static {v7}, Lcom/android/apksig/apk/ApkUtils;->computeSha256DigestBytes([B)[B

    move-result-object v0

    .line 1134
    invoke-interface {v6, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1138
    nop

    .line 1139
    .end local v7    # "jarManifest":[B
    .end local v16    # "inputJarManifest":[B
    nop

    .line 1140
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 1139
    invoke-interface {v4, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 1136
    :catch_0
    move-exception v0

    .line 1137
    .local v0, "e":Lcom/android/apksig/apk/ApkFormatException;
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Failed to generate manifest file"

    invoke-direct {v7, v8, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 1142
    .end local v0    # "e":Lcom/android/apksig/apk/ApkFormatException;
    .end local v6    # "v1SigningSchemeDigests":Ljava/util/Map;, "Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;"
    :cond_a
    :goto_4
    new-instance v0, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;

    invoke-direct {v0, v3, v4}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;-><init>(Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;Ljava/util/Map;)V

    iget-boolean v6, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mSourceStampTimestampEnabled:Z

    .line 1145
    invoke-virtual {v0, v6}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;->setSourceStampTimestampEnabled(Z)Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;

    move-result-object v0

    .line 1146
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner$Builder;->build()Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;

    move-result-object v0

    .line 1147
    .local v0, "v2SourceStampSigner":Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;->generateSourceStampBlock()Lcom/android/apksig/internal/util/Pair;

    move-result-object v6

    invoke-interface {v11, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1151
    .end local v0    # "v2SourceStampSigner":Lcom/android/apksig/internal/apk/stamp/V2SourceStampSigner;
    .end local v3    # "sourceStampSignerConfig":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    .end local v4    # "signatureSchemeDigestInfos":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Ljava/util/Map<Lcom/android/apksig/internal/apk/ContentDigestAlgorithm;[B>;>;"
    :cond_b
    invoke-static {v11}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->generateApkSigningBlock(Ljava/util/List;)[B

    move-result-object v0

    .line 1153
    .local v0, "apkSigningBlock":[B
    new-instance v3, Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v15, v4}, Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;-><init>([BILcom/android/apksig/DefaultApkSignerEngine$1;)V

    iput-object v3, v1, Lcom/android/apksig/DefaultApkSignerEngine;->mAddSigningBlockRequest:Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;

    .line 1155
    return-object v3
.end method

.method private processV31SignerConfigs(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v3SignerConfigs"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            ">;"
        }
    .end annotation

    .line 455
    .local p1, "v3SignerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->signingLineageHas31Support()Z

    move-result v0

    if-nez v0, :cond_0

    .line 456
    const/4 v0, 0x0

    return-object v0

    .line 459
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 460
    .local v0, "v31SignerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    nop

    .line 461
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 462
    .local v1, "v3SignerIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 463
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    .line 466
    .local v2, "signerConfig":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    iget v3, v2, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->minSdkVersion:I

    iget v4, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mRotationMinSdkVersion:I

    if-lt v3, v4, :cond_1

    .line 467
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 468
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 470
    .end local v2    # "signerConfig":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    :cond_1
    goto :goto_0

    .line 471
    :cond_2
    return-object v0
.end method

.method private processV3Configs(Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rawConfigs"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .line 356
    .local p1, "rawConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->signingLineageHas31Support()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    .line 357
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    iget-object v3, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSignerConfigs:Ljava/util/List;

    .line 358
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    invoke-static {v3}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->access$000(Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/security/cert/X509Certificate;

    invoke-virtual {v0, v3}, Lcom/android/apksig/SigningCertificateLineage;->getSubLineage(Ljava/security/cert/X509Certificate;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v0

    .line 359
    .local v0, "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    invoke-virtual {v0}, Lcom/android/apksig/SigningCertificateLineage;->size()I

    move-result v3

    if-ne v3, v2, :cond_0

    goto :goto_0

    .line 360
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "v3.1 signing enabled but the oldest signer in the SigningCertificateLineage for the v3.0 signing block is missing.  Please provide the oldest signer to enable v3.1 signing."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 367
    .end local v0    # "subLineage":Lcom/android/apksig/SigningCertificateLineage;
    :cond_1
    :goto_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 371
    .local v0, "processedConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;>;"
    const v3, 0x7fffffff

    .line 372
    .local v3, "currentMinSdk":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    sub-int/2addr v4, v2

    .local v4, "i":I
    :goto_1
    const/16 v5, 0x1c

    if-ltz v4, :cond_a

    .line 373
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;

    .line 374
    .local v6, "config":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    iget-object v7, v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->signatureAlgorithms:Ljava/util/List;

    if-eqz v7, :cond_9

    .line 384
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    sub-int/2addr v7, v2

    if-ne v4, v7, :cond_2

    .line 388
    const v7, 0x7fffffff

    iput v7, v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->maxSdkVersion:I

    goto :goto_2

    .line 390
    :cond_2
    iget-boolean v7, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mRotationTargetsDevRelease:Z

    if-eqz v7, :cond_3

    iget v7, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mRotationMinSdkVersion:I

    if-ne v3, v7, :cond_3

    .line 395
    iput v3, v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->maxSdkVersion:I

    goto :goto_2

    .line 399
    :cond_3
    add-int/lit8 v7, v3, -0x1

    iput v7, v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->maxSdkVersion:I

    .line 402
    :goto_2
    iget-object v7, v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->signatureAlgorithms:Ljava/util/List;

    invoke-direct {p0, v7}, Lcom/android/apksig/DefaultApkSignerEngine;->getMinSdkFromV3SignatureAlgorithms(Ljava/util/List;)I

    move-result v7

    iput v7, v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->minSdkVersion:I

    .line 405
    iget-object v7, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    if-eqz v7, :cond_5

    iget-boolean v7, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mRotationTargetsDevRelease:Z

    if-eqz v7, :cond_4

    iget v7, v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->maxSdkVersion:I

    iget v8, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mRotationMinSdkVersion:I

    if-le v7, v8, :cond_5

    goto :goto_3

    :cond_4
    iget v7, v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->maxSdkVersion:I

    iget v8, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mRotationMinSdkVersion:I

    if-lt v7, v8, :cond_5

    .line 409
    :goto_3
    iget-object v7, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    iget-object v8, v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    .line 410
    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/security/cert/X509Certificate;

    invoke-virtual {v7, v8}, Lcom/android/apksig/SigningCertificateLineage;->getSubLineage(Ljava/security/cert/X509Certificate;)Lcom/android/apksig/SigningCertificateLineage;

    move-result-object v7

    iput-object v7, v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    .line 411
    iget v7, v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->minSdkVersion:I

    iget v8, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mRotationMinSdkVersion:I

    if-ge v7, v8, :cond_5

    .line 412
    iput v8, v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->minSdkVersion:I

    .line 417
    :cond_5
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 418
    iget v3, v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->minSdkVersion:I

    .line 424
    iget-boolean v7, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mRotationTargetsDevRelease:Z

    if-eqz v7, :cond_6

    iget v8, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mMinSdkVersion:I

    if-lt v3, v8, :cond_a

    :cond_6
    if-nez v7, :cond_7

    iget v7, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mMinSdkVersion:I

    if-le v3, v7, :cond_a

    :cond_7
    if-gt v3, v5, :cond_8

    .line 428
    goto :goto_4

    .line 372
    .end local v6    # "config":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    :cond_8
    add-int/lit8 v4, v4, -0x1

    goto :goto_1

    .line 377
    .restart local v6    # "config":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    :cond_9
    iget-object v2, v6, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;->certificates:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/X509Certificate;

    invoke-virtual {v1}, Ljava/security/cert/X509Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v1

    invoke-interface {v1}, Ljava/security/PublicKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v1

    .line 378
    .local v1, "keyAlgorithm":Ljava/lang/String;
    new-instance v2, Ljava/security/InvalidKeyException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unsupported key algorithm "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " is not supported for APK Signature Scheme v3 signing"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 431
    .end local v1    # "keyAlgorithm":Ljava/lang/String;
    .end local v4    # "i":I
    .end local v6    # "config":Lcom/android/apksig/internal/apk/ApkSigningBlockUtils$SignerConfig;
    :cond_a
    :goto_4
    if-le v3, v5, :cond_c

    iget v1, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mMinSdkVersion:I

    if-gt v3, v1, :cond_b

    goto :goto_5

    .line 433
    :cond_b
    new-instance v1, Ljava/security/InvalidKeyException;

    const-string v2, "Provided key algorithms not supported on all desired Android SDK versions"

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 438
    :cond_c
    :goto_5
    return-object v0
.end method

.method private signingLineageHas31Support()Z
    .locals 2

    .line 345
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mRotationMinSdkVersion:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    iget v1, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mMinSdkVersion:I

    if-ge v1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public close()V
    .locals 2

    .line 1223
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mClosed:Z

    .line 1225
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mAddV1SignatureRequest:Lcom/android/apksig/DefaultApkSignerEngine$OutputJarSignatureRequestImpl;

    .line 1226
    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mInputJarManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    .line 1227
    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputAndroidManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    .line 1228
    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mDebuggable:Ljava/lang/Boolean;

    .line 1229
    iget-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigestRequests:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 1230
    iget-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigests:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 1231
    iget-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mEmittedSignatureJarEntryData:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 1232
    iget-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputSignatureJarEntryDataRequests:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 1234
    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mAddSigningBlockRequest:Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;

    .line 1235
    return-void
.end method

.method public generateSourceStampCertificateDigest()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 1210
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSourceStampSignerConfig:Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    invoke-virtual {v0}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->getCertificates()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1214
    :try_start_0
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSourceStampSignerConfig:Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    .line 1215
    invoke-virtual {v0}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;->getCertificates()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/cert/X509Certificate;

    invoke-virtual {v0}, Ljava/security/cert/X509Certificate;->getEncoded()[B

    move-result-object v0

    .line 1214
    invoke-static {v0}, Lcom/android/apksig/apk/ApkUtils;->computeSha256DigestBytes([B)[B

    move-result-object v0
    :try_end_0
    .catch Ljava/security/cert/CertificateEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 1216
    :catch_0
    move-exception v0

    .line 1217
    .local v0, "e":Ljava/security/cert/CertificateEncodingException;
    new-instance v1, Ljava/security/SignatureException;

    const-string v2, "Failed to encode source stamp certificate"

    invoke-direct {v1, v2, v0}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 1211
    .end local v0    # "e":Ljava/security/cert/CertificateEncodingException;
    :cond_0
    new-instance v0, Ljava/security/SignatureException;

    const-string v1, "No certificates configured for stamp"

    invoke-direct {v0, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public initWith([BLjava/util/Set;)Ljava/util/Set;
    .locals 11
    .param p1, "manifestBytes"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "manifestBytes",
            "entryNames"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 607
    .local p2, "entryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;

    invoke-direct {v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;-><init>()V

    .line 608
    .local v0, "result":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;
    nop

    .line 609
    invoke-static {p1, p2, v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->parseManifest([BLjava/util/Set;Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$Result;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v1

    .line 610
    .local v1, "sections":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Lcom/android/apksig/internal/jar/ManifestParser$Section;Ljava/util/Map<Ljava/lang/String;Lcom/android/apksig/internal/jar/ManifestParser$Section;>;>;"
    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1ContentDigestAlgorithm:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    invoke-static {v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->getJcaMessageDigestAlgorithm(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;)Ljava/lang/String;

    move-result-object v2

    .line 611
    .local v2, "alg":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 612
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/android/apksig/internal/jar/ManifestParser$Section;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 613
    .local v5, "entryName":Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->isJarEntryDigestNeededInManifest(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 614
    invoke-direct {p0, v5}, Lcom/android/apksig/DefaultApkSignerEngine;->isDebuggable(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 616
    const/4 v6, 0x0

    .line 617
    .local v6, "extractedDigest":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;
    nop

    .line 619
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/apksig/internal/jar/ManifestParser$Section;

    iget v8, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mMinSdkVersion:I

    .line 618
    const-string v9, "-Digest"

    const v10, 0x7fffffff

    invoke-static {v7, v9, v8, v10}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->getDigestsToVerify(Lcom/android/apksig/internal/jar/ManifestParser$Section;Ljava/lang/String;II)Ljava/util/Collection;

    move-result-object v7

    .line 620
    .local v7, "digestsToVerify":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;

    .line 621
    .local v9, "digestToVerify":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;
    iget-object v10, v9, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;->jcaDigestAlgorithm:Ljava/lang/String;

    invoke-virtual {v10, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 622
    move-object v6, v9

    .line 623
    goto :goto_2

    .line 625
    .end local v9    # "digestToVerify":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;
    :cond_0
    goto :goto_1

    .line 626
    :cond_1
    :goto_2
    if-eqz v6, :cond_2

    .line 627
    iget-object v8, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigests:Ljava/util/Map;

    iget-object v9, v6, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;->digest:[B

    invoke-interface {v8, v5, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 630
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/android/apksig/internal/jar/ManifestParser$Section;>;"
    .end local v5    # "entryName":Ljava/lang/String;
    .end local v6    # "extractedDigest":Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;
    .end local v7    # "digestsToVerify":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$NamedDigest;>;"
    :cond_2
    goto :goto_0

    .line 631
    :cond_3
    iget-object v3, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigests:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    return-object v3
.end method

.method public inputApkSigningBlock(Lcom/android/apksig/util/DataSource;)V
    .locals 9
    .param p1, "apkSigningBlock"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apkSigningBlock"
        }
    .end annotation

    .line 641
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->checkNotClosed()V

    .line 643
    if-eqz p1, :cond_e

    invoke-interface {p1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    goto/16 :goto_6

    .line 647
    :cond_0
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOtherSignersSignaturesPreserved:Z

    if-eqz v0, :cond_d

    .line 648
    const/4 v0, 0x0

    .line 649
    .local v0, "schemeSignatureBlockPreserved":Z
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mPreservedSignatureBlocks:Ljava/util/List;

    .line 651
    nop

    .line 652
    :try_start_0
    invoke-static {p1}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getApkSignatureBlocks(Lcom/android/apksig/util/DataSource;)Ljava/util/List;

    move-result-object v1

    .line 653
    .local v1, "signatureBlocks":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/util/Pair;

    .line 654
    .local v3, "signatureBlock":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;"
    invoke-virtual {v3}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const v5, 0x7109871a

    if-ne v4, v5, :cond_4

    .line 658
    iget-boolean v4, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV2SigningEnabled:Z

    if-eqz v4, :cond_3

    .line 659
    nop

    .line 661
    invoke-virtual {v3}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    .line 660
    invoke-static {v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getApkSignatureBlockSigners([B)Ljava/util/List;

    move-result-object v4

    .line 662
    .local v4, "v2Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/util/List<Ljava/security/cert/X509Certificate;>;[B>;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v5, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mPreservedV2Signers:Ljava/util/List;

    .line 663
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/internal/util/Pair;

    .line 664
    .local v6, "v2Signer":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/util/List<Ljava/security/cert/X509Certificate;>;[B>;"
    invoke-virtual {v6}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    invoke-direct {p0, v7}, Lcom/android/apksig/DefaultApkSignerEngine;->isConfiguredWithSigner(Ljava/util/List;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 665
    iget-object v7, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mPreservedV2Signers:Ljava/util/List;

    invoke-virtual {v6}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [B

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 666
    const/4 v0, 0x1

    .line 668
    .end local v6    # "v2Signer":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/util/List<Ljava/security/cert/X509Certificate;>;[B>;"
    :cond_1
    goto :goto_1

    .line 669
    .end local v4    # "v2Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/util/List<Ljava/security/cert/X509Certificate;>;[B>;>;"
    :cond_2
    goto/16 :goto_3

    .line 672
    :cond_3
    iget-object v4, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mPreservedSignatureBlocks:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 673
    const/4 v0, 0x1

    goto/16 :goto_3

    .line 675
    :cond_4
    invoke-virtual {v3}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const v5, -0xfac9740

    if-ne v4, v5, :cond_8

    .line 681
    iget-boolean v4, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV3SigningEnabled:Z

    if-eqz v4, :cond_7

    .line 685
    nop

    .line 687
    invoke-virtual {v3}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    .line 686
    invoke-static {v4}, Lcom/android/apksig/internal/apk/ApkSigningBlockUtils;->getApkSignatureBlockSigners([B)Ljava/util/List;

    move-result-object v4

    .line 688
    .local v4, "v3Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/util/List<Ljava/security/cert/X509Certificate;>;[B>;>;"
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x1

    if-gt v5, v6, :cond_6

    .line 696
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-ne v5, v6, :cond_9

    .line 697
    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/apksig/internal/util/Pair;

    invoke-virtual {v5}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-direct {p0, v5}, Lcom/android/apksig/DefaultApkSignerEngine;->isConfiguredWithSigner(Ljava/util/List;)Z

    move-result v5

    if-eqz v5, :cond_5

    goto :goto_2

    .line 698
    :cond_5
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v5, "The V3 signature scheme only supports one signer; a request was made to preserve the existing V3 signature, but the engine is configured to sign with a different signer"

    invoke-direct {v2, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v0    # "schemeSignatureBlockPreserved":Z
    .end local p1    # "apkSigningBlock":Lcom/android/apksig/util/DataSource;
    throw v2

    .line 689
    .restart local v0    # "schemeSignatureBlockPreserved":Z
    .restart local p1    # "apkSigningBlock":Lcom/android/apksig/util/DataSource;
    :cond_6
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "The provided APK signing block contains "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 690
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " V3 signers; the V3 signature scheme only supports one signer"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local v0    # "schemeSignatureBlockPreserved":Z
    .end local p1    # "apkSigningBlock":Lcom/android/apksig/util/DataSource;
    throw v2

    .line 682
    .end local v4    # "v3Signers":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/util/List<Ljava/security/cert/X509Certificate;>;[B>;>;"
    .restart local v0    # "schemeSignatureBlockPreserved":Z
    .restart local p1    # "apkSigningBlock":Lcom/android/apksig/util/DataSource;
    :cond_7
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v4, "Preserving an existing V3 signature is not supported"

    invoke-direct {v2, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v0    # "schemeSignatureBlockPreserved":Z
    .end local p1    # "apkSigningBlock":Lcom/android/apksig/util/DataSource;
    throw v2

    .line 704
    .restart local v0    # "schemeSignatureBlockPreserved":Z
    .restart local p1    # "apkSigningBlock":Lcom/android/apksig/util/DataSource;
    :cond_8
    sget-object v4, Lcom/android/apksig/DefaultApkSignerEngine;->DISCARDED_SIGNATURE_BLOCK_IDS:Ljava/util/Set;

    .line 705
    invoke-virtual {v3}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v5

    .line 704
    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_9

    .line 706
    iget-object v4, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mPreservedSignatureBlocks:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 704
    :cond_9
    :goto_2
    nop

    .line 708
    .end local v3    # "signatureBlock":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;"
    :goto_3
    goto/16 :goto_0

    .line 711
    .end local v1    # "signatureBlocks":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<[BLjava/lang/Integer;>;>;"
    :cond_a
    nop

    .line 714
    iget-boolean v1, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV3SigningEnabled:Z

    if-eqz v1, :cond_c

    if-nez v0, :cond_b

    goto :goto_4

    .line 715
    :cond_b
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Signature scheme V3+ only supports a single signer and cannot be appended to the existing signature scheme blocks"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 719
    :cond_c
    :goto_4
    return-void

    .line 709
    :catch_0
    move-exception v1

    goto :goto_5

    :catch_1
    move-exception v1

    goto :goto_5

    :catch_2
    move-exception v1

    .line 710
    .local v1, "e":Ljava/lang/Exception;
    :goto_5
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Unable to parse the provided signing block"

    invoke-direct {v2, v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 721
    .end local v0    # "schemeSignatureBlockPreserved":Z
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_d
    return-void

    .line 644
    :cond_e
    :goto_6
    return-void
.end method

.method public inputJarEntry(Ljava/lang/String;)Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;
    .locals 4
    .param p1, "entryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entryName"
        }
    .end annotation

    .line 738
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->checkNotClosed()V

    .line 740
    nop

    .line 741
    invoke-direct {p0, p1}, Lcom/android/apksig/DefaultApkSignerEngine;->getInputJarEntryOutputPolicy(Ljava/lang/String;)Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;

    move-result-object v0

    .line 742
    .local v0, "outputPolicy":Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;
    sget-object v1, Lcom/android/apksig/DefaultApkSignerEngine$1;->$SwitchMap$com$android$apksig$ApkSignerEngine$InputJarEntryInstructions$OutputPolicy:[I

    invoke-virtual {v0}, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 759
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported output policy: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 748
    :pswitch_0
    const-string v1, "META-INF/MANIFEST.MF"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 751
    new-instance v1, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    const/4 v2, 0x0

    invoke-direct {v1, p1, v2}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;-><init>(Ljava/lang/String;Lcom/android/apksig/DefaultApkSignerEngine$1;)V

    iput-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mInputJarManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    .line 752
    new-instance v1, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;

    sget-object v2, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;->OUTPUT_BY_ENGINE:Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;

    iget-object v3, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mInputJarManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    invoke-direct {v1, v2, v3}, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;-><init>(Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;)V

    return-object v1

    .line 756
    :cond_0
    new-instance v1, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;

    sget-object v2, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;->OUTPUT_BY_ENGINE:Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;

    invoke-direct {v1, v2}, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;-><init>(Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;)V

    return-object v1

    .line 746
    :pswitch_1
    new-instance v1, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;

    sget-object v2, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;->OUTPUT:Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;

    invoke-direct {v1, v2}, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;-><init>(Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;)V

    return-object v1

    .line 744
    :pswitch_2
    new-instance v1, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;

    sget-object v2, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;->SKIP:Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;

    invoke-direct {v1, v2}, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;-><init>(Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;)V

    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public inputJarEntryRemoved(Ljava/lang/String;)Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;
    .locals 1
    .param p1, "entryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entryName"
        }
    .end annotation

    .line 840
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->checkNotClosed()V

    .line 841
    invoke-direct {p0, p1}, Lcom/android/apksig/DefaultApkSignerEngine;->getInputJarEntryOutputPolicy(Ljava/lang/String;)Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;

    move-result-object v0

    return-object v0
.end method

.method public isEligibleForSourceStamp()Z
    .locals 1

    .line 1204
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSourceStampSignerConfig:Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV2SigningEnabled:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV3SigningEnabled:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SigningEnabled:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public outputDone()V
    .locals 0

    .line 1160
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->checkNotClosed()V

    .line 1161
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->checkV1SigningDoneIfEnabled()V

    .line 1162
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->checkSigningBlockDoneIfEnabled()V

    .line 1163
    return-void
.end method

.method public outputJarEntries()Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 872
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->checkNotClosed()V

    .line 874
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SignaturePending:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 875
    return-object v1

    .line 878
    :cond_0
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mInputJarManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    if-eqz v0, :cond_2

    .line 879
    invoke-static {v0}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->access$400(Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 880
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Still waiting to inspect input APK\'s "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mInputJarManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    .line 882
    invoke-virtual {v2}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->getEntryName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 885
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigestRequests:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "Still waiting to inspect output APK\'s "

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;

    .line 886
    .local v2, "digestRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;
    invoke-virtual {v2}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;->getEntryName()Ljava/lang/String;

    move-result-object v4

    .line 887
    .local v4, "entryName":Ljava/lang/String;
    invoke-static {v2}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;->access$500(Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 891
    iget-object v3, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigests:Ljava/util/Map;

    invoke-static {v2}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;->access$600(Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;)[B

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 892
    .end local v2    # "digestRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;
    .end local v4    # "entryName":Ljava/lang/String;
    goto :goto_1

    .line 888
    .restart local v2    # "digestRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;
    .restart local v4    # "entryName":Ljava/lang/String;
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 893
    .end local v2    # "digestRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;
    .end local v4    # "entryName":Ljava/lang/String;
    :cond_4
    invoke-virtual {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->isEligibleForSourceStamp()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 894
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1ContentDigestAlgorithm:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    .line 896
    invoke-static {v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->getJcaMessageDigestAlgorithm(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;)Ljava/lang/String;

    move-result-object v0

    .line 895
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 897
    .local v0, "messageDigest":Ljava/security/MessageDigest;
    invoke-virtual {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->generateSourceStampCertificateDigest()[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/security/MessageDigest;->update([B)V

    .line 898
    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigests:Ljava/util/Map;

    .line 899
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    .line 898
    const-string v5, "stamp-cert-sha256"

    invoke-interface {v2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 901
    .end local v0    # "messageDigest":Ljava/security/MessageDigest;
    :cond_5
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigestRequests:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 903
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputSignatureJarEntryDataRequests:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    .line 904
    .local v2, "dataRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;
    invoke-static {v2}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->access$400(Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 908
    .end local v2    # "dataRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;
    goto :goto_2

    .line 905
    .restart local v2    # "dataRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 906
    invoke-virtual {v2}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->getEntryName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 910
    .end local v2    # "dataRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;
    :cond_7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 911
    .local v0, "apkSigningSchemeIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    iget-boolean v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV2SigningEnabled:Z

    if-eqz v2, :cond_8

    .line 912
    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 914
    :cond_8
    iget-boolean v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV3SigningEnabled:Z

    if-eqz v2, :cond_9

    .line 915
    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 918
    :cond_9
    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mInputJarManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    if-eqz v2, :cond_a

    .line 919
    invoke-static {v2}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->access$700(Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;)[B

    move-result-object v2

    goto :goto_3

    .line 920
    :cond_a
    move-object v2, v1

    :goto_3
    nop

    .line 921
    .local v2, "inputJarManifest":[B
    invoke-virtual {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->isEligibleForSourceStamp()Z

    move-result v3

    if-eqz v3, :cond_b

    .line 922
    iget-object v3, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1ContentDigestAlgorithm:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    iget-object v4, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigests:Ljava/util/Map;

    .line 923
    invoke-static {v3, v4, v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->generateManifestFile(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;Ljava/util/Map;[B)Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;

    move-result-object v3

    iget-object v2, v3, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;->contents:[B

    move-object v8, v2

    goto :goto_4

    .line 921
    :cond_b
    move-object v8, v2

    .line 931
    .end local v2    # "inputJarManifest":[B
    .local v8, "inputJarManifest":[B
    :goto_4
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->checkOutputApkNotDebuggableIfDebuggableMustBeRejected()V

    .line 933
    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mAddV1SignatureRequest:Lcom/android/apksig/DefaultApkSignerEngine$OutputJarSignatureRequestImpl;

    const-string v9, "Failed to generate v1 signature"

    if-eqz v2, :cond_11

    invoke-static {v2}, Lcom/android/apksig/DefaultApkSignerEngine$OutputJarSignatureRequestImpl;->access$800(Lcom/android/apksig/DefaultApkSignerEngine$OutputJarSignatureRequestImpl;)Z

    move-result v2

    if-nez v2, :cond_c

    goto/16 :goto_6

    .line 947
    :cond_c
    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1ContentDigestAlgorithm:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    iget-object v3, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigests:Ljava/util/Map;

    .line 948
    invoke-static {v2, v3, v8}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->generateManifestFile(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;Ljava/util/Map;[B)Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;

    move-result-object v2

    .line 950
    .local v2, "newManifest":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;
    iget-object v3, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mEmittedSignatureJarEntryData:Ljava/util/Map;

    .line 951
    const-string v4, "META-INF/MANIFEST.MF"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    .line 952
    .local v3, "emittedSignatureManifest":[B
    iget-object v4, v2, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;->contents:[B

    invoke-static {v4, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v4

    if-nez v4, :cond_d

    .line 955
    :try_start_0
    iget-object v4, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SignerConfigs:Ljava/util/List;

    iget-object v5, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1ContentDigestAlgorithm:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    iget-object v6, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mCreatedBy:Ljava/lang/String;

    .line 956
    invoke-static {v4, v5, v0, v6, v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->signManifest(Ljava/util/List;Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;Ljava/util/List;Ljava/lang/String;Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;)Ljava/util/List;

    move-result-object v4
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 964
    .local v4, "signatureZipEntries":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;[B>;>;"
    goto :goto_7

    .line 962
    .end local v4    # "signatureZipEntries":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;[B>;>;"
    :catch_0
    move-exception v1

    .line 963
    .local v1, "e":Ljava/security/cert/CertificateException;
    new-instance v4, Ljava/security/SignatureException;

    invoke-direct {v4, v9, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 968
    .end local v1    # "e":Ljava/security/cert/CertificateException;
    :cond_d
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 970
    .restart local v4    # "signatureZipEntries":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;[B>;>;"
    iget-object v5, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mEmittedSignatureJarEntryData:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_10

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 971
    .local v6, "expectedOutputEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[B>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 972
    .local v7, "entryName":Ljava/lang/String;
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [B

    .line 973
    .local v9, "expectedData":[B
    iget-object v10, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputSignatureJarEntryDataRequests:Ljava/util/Map;

    .line 974
    invoke-interface {v10, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    .line 975
    .local v10, "actualDataRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;
    if-nez v10, :cond_e

    .line 977
    invoke-static {v7, v9}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v11

    invoke-interface {v4, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 978
    goto :goto_5

    .line 980
    :cond_e
    invoke-static {v10}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;->access$700(Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;)[B

    move-result-object v11

    .line 981
    .local v11, "actualData":[B
    invoke-static {v9, v11}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v12

    if-nez v12, :cond_f

    .line 982
    invoke-static {v7, v9}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v12

    invoke-interface {v4, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 984
    .end local v6    # "expectedOutputEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[B>;"
    .end local v7    # "entryName":Ljava/lang/String;
    .end local v9    # "expectedData":[B
    .end local v10    # "actualDataRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;
    .end local v11    # "actualData":[B
    :cond_f
    goto :goto_5

    .line 985
    :cond_10
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_12

    .line 987
    return-object v1

    .line 935
    .end local v2    # "newManifest":Lcom/android/apksig/internal/apk/v1/V1SchemeSigner$OutputManifestFile;
    .end local v3    # "emittedSignatureManifest":[B
    .end local v4    # "signatureZipEntries":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;[B>;>;"
    :cond_11
    :goto_6
    :try_start_1
    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SignerConfigs:Ljava/util/List;

    iget-object v3, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1ContentDigestAlgorithm:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    iget-object v4, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigests:Ljava/util/Map;

    iget-object v7, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mCreatedBy:Ljava/lang/String;

    .line 936
    move-object v5, v0

    move-object v6, v8

    invoke-static/range {v2 .. v7}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->sign(Ljava/util/List;Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;Ljava/util/Map;Ljava/util/List;[BLjava/lang/String;)Ljava/util/List;

    move-result-object v2
    :try_end_1
    .catch Ljava/security/cert/CertificateException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v4, v2

    .line 945
    .restart local v4    # "signatureZipEntries":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;[B>;>;"
    nop

    .line 993
    :cond_12
    :goto_7
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_13

    .line 995
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SignaturePending:Z

    .line 996
    return-object v1

    .line 999
    :cond_13
    new-instance v2, Ljava/util/ArrayList;

    .line 1000
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1001
    .local v2, "sigEntries":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest$JarEntry;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_14

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/apksig/internal/util/Pair;

    .line 1002
    .local v5, "entry":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;[B>;"
    invoke-virtual {v5}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 1003
    .local v6, "entryName":Ljava/lang/String;
    invoke-virtual {v5}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [B

    .line 1004
    .local v7, "entryData":[B
    new-instance v9, Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest$JarEntry;

    invoke-direct {v9, v6, v7}, Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest$JarEntry;-><init>(Ljava/lang/String;[B)V

    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1005
    iget-object v9, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mEmittedSignatureJarEntryData:Ljava/util/Map;

    invoke-interface {v9, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1006
    .end local v5    # "entry":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;[B>;"
    .end local v6    # "entryName":Ljava/lang/String;
    .end local v7    # "entryData":[B
    goto :goto_8

    .line 1007
    :cond_14
    new-instance v3, Lcom/android/apksig/DefaultApkSignerEngine$OutputJarSignatureRequestImpl;

    invoke-direct {v3, v2, v1}, Lcom/android/apksig/DefaultApkSignerEngine$OutputJarSignatureRequestImpl;-><init>(Ljava/util/List;Lcom/android/apksig/DefaultApkSignerEngine$1;)V

    iput-object v3, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mAddV1SignatureRequest:Lcom/android/apksig/DefaultApkSignerEngine$OutputJarSignatureRequestImpl;

    .line 1008
    return-object v3

    .line 943
    .end local v2    # "sigEntries":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest$JarEntry;>;"
    .end local v4    # "signatureZipEntries":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/util/Pair<Ljava/lang/String;[B>;>;"
    :catch_1
    move-exception v1

    .line 944
    .restart local v1    # "e":Ljava/security/cert/CertificateException;
    new-instance v2, Ljava/security/SignatureException;

    invoke-direct {v2, v9, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public outputJarEntry(Ljava/lang/String;)Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    .locals 6
    .param p1, "entryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entryName"
        }
    .end annotation

    .line 765
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->checkNotClosed()V

    .line 766
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->invalidateV2Signature()V

    .line 768
    invoke-direct {p0, p1}, Lcom/android/apksig/DefaultApkSignerEngine;->isDebuggable(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 769
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->forgetOutputApkDebuggableStatus()V

    .line 772
    :cond_0
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SigningEnabled:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2

    .line 774
    invoke-direct {p0, p1}, Lcom/android/apksig/DefaultApkSignerEngine;->isDebuggable(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 777
    new-instance v0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    invoke-direct {v0, p1, v1}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;-><init>(Ljava/lang/String;Lcom/android/apksig/DefaultApkSignerEngine$1;)V

    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputAndroidManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    .line 778
    return-object v0

    .line 780
    :cond_1
    return-object v1

    .line 784
    :cond_2
    invoke-static {p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->isJarEntryDigestNeededInManifest(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 791
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->invalidateV1Signature()V

    .line 792
    new-instance v0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;

    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1ContentDigestAlgorithm:Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;

    .line 795
    invoke-static {v2}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->getJcaMessageDigestAlgorithm(Lcom/android/apksig/internal/apk/v1/DigestAlgorithm;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p1, v2, v1}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/android/apksig/DefaultApkSignerEngine$1;)V

    .line 796
    .local v0, "dataDigestRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;
    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigestRequests:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 797
    iget-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigests:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 799
    iget-boolean v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mDebuggableApkPermitted:Z

    if-nez v2, :cond_3

    .line 800
    const-string v2, "AndroidManifest.xml"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 803
    new-instance v2, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    invoke-direct {v2, p1, v1}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;-><init>(Ljava/lang/String;Lcom/android/apksig/DefaultApkSignerEngine$1;)V

    iput-object v2, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputAndroidManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    .line 804
    new-instance v2, Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputAndroidManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-direct {v2, p1, v3, v1}, Lcom/android/apksig/DefaultApkSignerEngine$CompoundInspectJarEntryRequest;-><init>(Ljava/lang/String;[Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;Lcom/android/apksig/DefaultApkSignerEngine$1;)V

    return-object v2

    .line 808
    :cond_3
    return-object v0

    .line 811
    .end local v0    # "dataDigestRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataDigestRequest;
    :cond_4
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSignatureExpectedOutputJarEntryNames:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 814
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->invalidateV1Signature()V

    .line 816
    const-string v0, "META-INF/MANIFEST.MF"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 817
    new-instance v0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    invoke-direct {v0, p1, v1}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;-><init>(Ljava/lang/String;Lcom/android/apksig/DefaultApkSignerEngine$1;)V

    .line 818
    .local v0, "dataRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;
    iput-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mInputJarManifestEntryDataRequest:Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    goto :goto_1

    .line 823
    .end local v0    # "dataRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;
    :cond_5
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mEmittedSignatureJarEntryData:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 824
    new-instance v0, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;

    invoke-direct {v0, p1, v1}, Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;-><init>(Ljava/lang/String;Lcom/android/apksig/DefaultApkSignerEngine$1;)V

    move-object v1, v0

    goto :goto_0

    .line 825
    :cond_6
    nop

    :goto_0
    move-object v0, v1

    .line 828
    .restart local v0    # "dataRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;
    :goto_1
    if-eqz v0, :cond_7

    .line 829
    iget-object v1, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputSignatureJarEntryDataRequests:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 831
    :cond_7
    return-object v0

    .line 835
    .end local v0    # "dataRequest":Lcom/android/apksig/DefaultApkSignerEngine$GetJarEntryDataRequest;
    :cond_8
    return-object v1
.end method

.method public outputJarEntryRemoved(Ljava/lang/String;)V
    .locals 1
    .param p1, "entryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entryName"
        }
    .end annotation

    .line 846
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->checkNotClosed()V

    .line 847
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->invalidateV2Signature()V

    .line 848
    iget-boolean v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mV1SigningEnabled:Z

    if-nez v0, :cond_0

    .line 849
    return-void

    .line 852
    :cond_0
    invoke-static {p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeSigner;->isJarEntryDigestNeededInManifest(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 854
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->invalidateV1Signature()V

    .line 855
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigests:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 856
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputJarEntryDigestRequests:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 857
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mOutputSignatureJarEntryDataRequests:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 858
    return-void

    .line 861
    :cond_1
    iget-object v0, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mSignatureExpectedOutputJarEntryNames:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 863
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->invalidateV1Signature()V

    .line 864
    return-void

    .line 866
    :cond_2
    return-void
.end method

.method public outputZipSections(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest;
    .locals 1
    .param p1, "zipEntries"    # Lcom/android/apksig/util/DataSource;
    .param p2, "zipCentralDirectory"    # Lcom/android/apksig/util/DataSource;
    .param p3, "zipEocd"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "zipEntries",
            "zipCentralDirectory",
            "zipEocd"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1016
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/apksig/DefaultApkSignerEngine;->outputZipSectionsInternal(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Z)Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;

    move-result-object v0

    return-object v0
.end method

.method public outputZipSections2(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;
    .locals 1
    .param p1, "zipEntries"    # Lcom/android/apksig/util/DataSource;
    .param p2, "zipCentralDirectory"    # Lcom/android/apksig/util/DataSource;
    .param p3, "zipEocd"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "zipEntries",
            "zipCentralDirectory",
            "zipEocd"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 1023
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/apksig/DefaultApkSignerEngine;->outputZipSectionsInternal(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Z)Lcom/android/apksig/DefaultApkSignerEngine$OutputApkSigningBlockRequestImpl;

    move-result-object v0

    return-object v0
.end method

.method public produceV4Signature(Lcom/android/apksig/util/DataSource;Ljava/io/OutputStream;)[B
    .locals 3
    .param p1, "dataSource"    # Lcom/android/apksig/util/DataSource;
    .param p2, "sigOutput"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dataSource",
            "sigOutput"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 1188
    if-eqz p2, :cond_0

    .line 1192
    :try_start_0
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->createV4SignerConfig()Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;

    move-result-object v0

    .line 1193
    .local v0, "v4SignerConfig":Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;
    nop

    .line 1194
    invoke-static {p1, v0}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->generateV4Signature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v1

    .line 1195
    .local v1, "pair":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Lcom/android/apksig/internal/apk/v4/V4Signature;[B>;"
    invoke-virtual {v1}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/apk/v4/V4Signature;

    invoke-virtual {v2, p2}, Lcom/android/apksig/internal/apk/v4/V4Signature;->writeTo(Ljava/io/OutputStream;)V

    .line 1196
    invoke-virtual {v1}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 1197
    .end local v0    # "v4SignerConfig":Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;
    .end local v1    # "pair":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Lcom/android/apksig/internal/apk/v4/V4Signature;[B>;"
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    .line 1198
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    new-instance v1, Ljava/security/SignatureException;

    const-string v2, "V4 signing failed"

    invoke-direct {v1, v2, v0}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 1189
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    new-instance v0, Ljava/security/SignatureException;

    const-string v1, "Missing V4 output streams."

    invoke-direct {v0, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setExecutor(Lcom/android/apksig/util/RunnablesExecutor;)V
    .locals 0
    .param p1, "executor"    # Lcom/android/apksig/util/RunnablesExecutor;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "executor"
        }
    .end annotation

    .line 636
    iput-object p1, p0, Lcom/android/apksig/DefaultApkSignerEngine;->mExecutor:Lcom/android/apksig/util/RunnablesExecutor;

    .line 637
    return-void
.end method

.method public signV4(Lcom/android/apksig/util/DataSource;Ljava/io/File;Z)V
    .locals 3
    .param p1, "dataSource"    # Lcom/android/apksig/util/DataSource;
    .param p2, "outputFile"    # Ljava/io/File;
    .param p3, "ignoreFailures"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "dataSource",
            "outputFile",
            "ignoreFailures"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 1168
    if-nez p2, :cond_1

    .line 1169
    if-eqz p3, :cond_0

    .line 1170
    return-void

    .line 1172
    :cond_0
    new-instance v0, Ljava/security/SignatureException;

    const-string v1, "Missing V4 output file."

    invoke-direct {v0, v1}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1175
    :cond_1
    :try_start_0
    invoke-direct {p0}, Lcom/android/apksig/DefaultApkSignerEngine;->createV4SignerConfig()Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;

    move-result-object v0

    .line 1176
    .local v0, "v4SignerConfig":Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;
    invoke-static {p1, v0, p2}, Lcom/android/apksig/internal/apk/v4/V4SchemeSigner;->generateV4Signature(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1182
    .end local v0    # "v4SignerConfig":Lcom/android/apksig/internal/apk/v4/V4SchemeSigner$SignerConfig;
    nop

    .line 1183
    return-void

    .line 1177
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    .line 1178
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    if-eqz p3, :cond_2

    .line 1179
    return-void

    .line 1181
    :cond_2
    new-instance v1, Ljava/security/SignatureException;

    const-string v2, "V4 signing failed"

    invoke-direct {v1, v2, v0}, Ljava/security/SignatureException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method
