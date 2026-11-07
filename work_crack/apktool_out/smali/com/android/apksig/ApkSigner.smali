.class public Lcom/android/apksig/ApkSigner;
.super Ljava/lang/Object;
.source "ApkSigner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/ApkSigner$SignerConfig;,
        Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;,
        Lcom/android/apksig/ApkSigner$Builder;
    }
.end annotation


# static fields
.field private static final ALIGNMENT_ZIP_EXTRA_DATA_FIELD_HEADER_ID:S = -0x26cbs

.field private static final ALIGNMENT_ZIP_EXTRA_DATA_FIELD_MIN_SIZE_BYTES:S = 0x6s

.field private static final ANDROID_COMMON_PAGE_ALIGNMENT_BYTES:S = 0x1000s

.field private static final ANDROID_FILE_ALIGNMENT_BYTES:S = 0x1000s

.field private static final ANDROID_MANIFEST_ZIP_ENTRY_NAME:Ljava/lang/String; = "AndroidManifest.xml"


# instance fields
.field private final mAlignFileSize:Z

.field private final mCreatedBy:Ljava/lang/String;

.field private final mDebuggableApkPermitted:Z

.field private final mForceSourceStampOverwrite:Z

.field private final mInputApkDataSource:Lcom/android/apksig/util/DataSource;

.field private final mInputApkFile:Ljava/io/File;

.field private final mMinSdkVersion:Ljava/lang/Integer;

.field private final mOtherSignersSignaturesPreserved:Z

.field private final mOutputApkDataSink:Lcom/android/apksig/util/DataSink;

.field private final mOutputApkDataSource:Lcom/android/apksig/util/DataSource;

.field private final mOutputApkFile:Ljava/io/File;

.field private final mOutputV4File:Ljava/io/File;

.field private final mRotationMinSdkVersion:I

.field private final mRotationTargetsDevRelease:Z

.field private final mSignerConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkSigner$SignerConfig;",
            ">;"
        }
    .end annotation
.end field

.field private final mSignerEngine:Lcom/android/apksig/ApkSignerEngine;

.field private final mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

.field private final mSourceStampSignerConfig:Lcom/android/apksig/ApkSigner$SignerConfig;

.field private final mSourceStampSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

.field private final mSourceStampTimestampEnabled:Z

.field private final mV1SigningEnabled:Z

.field private final mV2SigningEnabled:Z

.field private final mV3SigningEnabled:Z

.field private final mV4ErrorReportingEnabled:Z

.field private final mV4SigningEnabled:Z

.field private final mVerityEnabled:Z


# direct methods
.method private constructor <init>(Ljava/util/List;Lcom/android/apksig/ApkSigner$SignerConfig;Lcom/android/apksig/SigningCertificateLineage;ZZLjava/lang/Integer;IZZZZZZZZZZLjava/lang/String;Lcom/android/apksig/ApkSignerEngine;Ljava/io/File;Lcom/android/apksig/util/DataSource;Ljava/io/File;Lcom/android/apksig/util/DataSink;Lcom/android/apksig/util/DataSource;Ljava/io/File;Lcom/android/apksig/SigningCertificateLineage;)V
    .locals 16
    .param p2, "sourceStampSignerConfig"    # Lcom/android/apksig/ApkSigner$SignerConfig;
    .param p3, "sourceStampSigningCertificateLineage"    # Lcom/android/apksig/SigningCertificateLineage;
    .param p4, "forceSourceStampOverwrite"    # Z
    .param p5, "sourceStampTimestampEnabled"    # Z
    .param p6, "minSdkVersion"    # Ljava/lang/Integer;
    .param p7, "rotationMinSdkVersion"    # I
    .param p8, "rotationTargetsDevRelease"    # Z
    .param p9, "v1SigningEnabled"    # Z
    .param p10, "v2SigningEnabled"    # Z
    .param p11, "v3SigningEnabled"    # Z
    .param p12, "v4SigningEnabled"    # Z
    .param p13, "alignFileSize"    # Z
    .param p14, "verityEnabled"    # Z
    .param p15, "v4ErrorReportingEnabled"    # Z
    .param p16, "debuggableApkPermitted"    # Z
    .param p17, "otherSignersSignaturesPreserved"    # Z
    .param p18, "createdBy"    # Ljava/lang/String;
    .param p19, "signerEngine"    # Lcom/android/apksig/ApkSignerEngine;
    .param p20, "inputApkFile"    # Ljava/io/File;
    .param p21, "inputApkDataSource"    # Lcom/android/apksig/util/DataSource;
    .param p22, "outputApkFile"    # Ljava/io/File;
    .param p23, "outputApkDataSink"    # Lcom/android/apksig/util/DataSink;
    .param p24, "outputApkDataSource"    # Lcom/android/apksig/util/DataSource;
    .param p25, "outputV4File"    # Ljava/io/File;
    .param p26, "signingCertificateLineage"    # Lcom/android/apksig/SigningCertificateLineage;
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
            "forceSourceStampOverwrite",
            "sourceStampTimestampEnabled",
            "minSdkVersion",
            "rotationMinSdkVersion",
            "rotationTargetsDevRelease",
            "v1SigningEnabled",
            "v2SigningEnabled",
            "v3SigningEnabled",
            "v4SigningEnabled",
            "alignFileSize",
            "verityEnabled",
            "v4ErrorReportingEnabled",
            "debuggableApkPermitted",
            "otherSignersSignaturesPreserved",
            "createdBy",
            "signerEngine",
            "inputApkFile",
            "inputApkDataSource",
            "outputApkFile",
            "outputApkDataSink",
            "outputApkDataSource",
            "outputV4File",
            "signingCertificateLineage"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/ApkSigner$SignerConfig;",
            ">;",
            "Lcom/android/apksig/ApkSigner$SignerConfig;",
            "Lcom/android/apksig/SigningCertificateLineage;",
            "ZZ",
            "Ljava/lang/Integer;",
            "IZZZZZZZZZZ",
            "Ljava/lang/String;",
            "Lcom/android/apksig/ApkSignerEngine;",
            "Ljava/io/File;",
            "Lcom/android/apksig/util/DataSource;",
            "Ljava/io/File;",
            "Lcom/android/apksig/util/DataSink;",
            "Lcom/android/apksig/util/DataSource;",
            "Ljava/io/File;",
            "Lcom/android/apksig/SigningCertificateLineage;",
            ")V"
        }
    .end annotation

    .line 150
    .local p1, "signerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/ApkSigner$SignerConfig;>;"
    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 152
    move-object/from16 v1, p1

    iput-object v1, v0, Lcom/android/apksig/ApkSigner;->mSignerConfigs:Ljava/util/List;

    .line 153
    move-object/from16 v2, p2

    iput-object v2, v0, Lcom/android/apksig/ApkSigner;->mSourceStampSignerConfig:Lcom/android/apksig/ApkSigner$SignerConfig;

    .line 154
    move-object/from16 v3, p3

    iput-object v3, v0, Lcom/android/apksig/ApkSigner;->mSourceStampSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    .line 155
    move/from16 v4, p4

    iput-boolean v4, v0, Lcom/android/apksig/ApkSigner;->mForceSourceStampOverwrite:Z

    .line 156
    move/from16 v5, p5

    iput-boolean v5, v0, Lcom/android/apksig/ApkSigner;->mSourceStampTimestampEnabled:Z

    .line 157
    move-object/from16 v6, p6

    iput-object v6, v0, Lcom/android/apksig/ApkSigner;->mMinSdkVersion:Ljava/lang/Integer;

    .line 158
    move/from16 v7, p7

    iput v7, v0, Lcom/android/apksig/ApkSigner;->mRotationMinSdkVersion:I

    .line 159
    move/from16 v8, p8

    iput-boolean v8, v0, Lcom/android/apksig/ApkSigner;->mRotationTargetsDevRelease:Z

    .line 160
    move/from16 v9, p9

    iput-boolean v9, v0, Lcom/android/apksig/ApkSigner;->mV1SigningEnabled:Z

    .line 161
    move/from16 v10, p10

    iput-boolean v10, v0, Lcom/android/apksig/ApkSigner;->mV2SigningEnabled:Z

    .line 162
    move/from16 v11, p11

    iput-boolean v11, v0, Lcom/android/apksig/ApkSigner;->mV3SigningEnabled:Z

    .line 163
    move/from16 v12, p12

    iput-boolean v12, v0, Lcom/android/apksig/ApkSigner;->mV4SigningEnabled:Z

    .line 164
    move/from16 v13, p13

    iput-boolean v13, v0, Lcom/android/apksig/ApkSigner;->mAlignFileSize:Z

    .line 165
    move/from16 v14, p14

    iput-boolean v14, v0, Lcom/android/apksig/ApkSigner;->mVerityEnabled:Z

    .line 166
    move/from16 v15, p15

    iput-boolean v15, v0, Lcom/android/apksig/ApkSigner;->mV4ErrorReportingEnabled:Z

    .line 167
    move/from16 v1, p16

    iput-boolean v1, v0, Lcom/android/apksig/ApkSigner;->mDebuggableApkPermitted:Z

    .line 168
    move/from16 v1, p17

    iput-boolean v1, v0, Lcom/android/apksig/ApkSigner;->mOtherSignersSignaturesPreserved:Z

    .line 169
    move-object/from16 v1, p18

    iput-object v1, v0, Lcom/android/apksig/ApkSigner;->mCreatedBy:Ljava/lang/String;

    .line 171
    move-object/from16 v1, p19

    iput-object v1, v0, Lcom/android/apksig/ApkSigner;->mSignerEngine:Lcom/android/apksig/ApkSignerEngine;

    .line 173
    move-object/from16 v1, p20

    iput-object v1, v0, Lcom/android/apksig/ApkSigner;->mInputApkFile:Ljava/io/File;

    .line 174
    move-object/from16 v1, p21

    iput-object v1, v0, Lcom/android/apksig/ApkSigner;->mInputApkDataSource:Lcom/android/apksig/util/DataSource;

    .line 176
    move-object/from16 v1, p22

    iput-object v1, v0, Lcom/android/apksig/ApkSigner;->mOutputApkFile:Ljava/io/File;

    .line 177
    move-object/from16 v1, p23

    iput-object v1, v0, Lcom/android/apksig/ApkSigner;->mOutputApkDataSink:Lcom/android/apksig/util/DataSink;

    .line 178
    move-object/from16 v1, p24

    iput-object v1, v0, Lcom/android/apksig/ApkSigner;->mOutputApkDataSource:Lcom/android/apksig/util/DataSource;

    .line 180
    move-object/from16 v1, p25

    iput-object v1, v0, Lcom/android/apksig/ApkSigner;->mOutputV4File:Ljava/io/File;

    .line 182
    move-object/from16 v1, p26

    iput-object v1, v0, Lcom/android/apksig/ApkSigner;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    .line 183
    return-void
.end method

.method synthetic constructor <init>(Ljava/util/List;Lcom/android/apksig/ApkSigner$SignerConfig;Lcom/android/apksig/SigningCertificateLineage;ZZLjava/lang/Integer;IZZZZZZZZZZLjava/lang/String;Lcom/android/apksig/ApkSignerEngine;Ljava/io/File;Lcom/android/apksig/util/DataSource;Ljava/io/File;Lcom/android/apksig/util/DataSink;Lcom/android/apksig/util/DataSource;Ljava/io/File;Lcom/android/apksig/SigningCertificateLineage;Lcom/android/apksig/ApkSigner$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/util/List;
    .param p2, "x1"    # Lcom/android/apksig/ApkSigner$SignerConfig;
    .param p3, "x2"    # Lcom/android/apksig/SigningCertificateLineage;
    .param p4, "x3"    # Z
    .param p5, "x4"    # Z
    .param p6, "x5"    # Ljava/lang/Integer;
    .param p7, "x6"    # I
    .param p8, "x7"    # Z
    .param p9, "x8"    # Z
    .param p10, "x9"    # Z
    .param p11, "x10"    # Z
    .param p12, "x11"    # Z
    .param p13, "x12"    # Z
    .param p14, "x13"    # Z
    .param p15, "x14"    # Z
    .param p16, "x15"    # Z
    .param p17, "x16"    # Z
    .param p18, "x17"    # Ljava/lang/String;
    .param p19, "x18"    # Lcom/android/apksig/ApkSignerEngine;
    .param p20, "x19"    # Ljava/io/File;
    .param p21, "x20"    # Lcom/android/apksig/util/DataSource;
    .param p22, "x21"    # Ljava/io/File;
    .param p23, "x22"    # Lcom/android/apksig/util/DataSink;
    .param p24, "x23"    # Lcom/android/apksig/util/DataSource;
    .param p25, "x24"    # Ljava/io/File;
    .param p26, "x25"    # Lcom/android/apksig/SigningCertificateLineage;
    .param p27, "x26"    # Lcom/android/apksig/ApkSigner$1;

    .line 70
    invoke-direct/range {p0 .. p26}, Lcom/android/apksig/ApkSigner;-><init>(Ljava/util/List;Lcom/android/apksig/ApkSigner$SignerConfig;Lcom/android/apksig/SigningCertificateLineage;ZZLjava/lang/Integer;IZZZZZZZZZZLjava/lang/String;Lcom/android/apksig/ApkSignerEngine;Ljava/io/File;Lcom/android/apksig/util/DataSource;Ljava/io/File;Lcom/android/apksig/util/DataSink;Lcom/android/apksig/util/DataSource;Ljava/io/File;Lcom/android/apksig/SigningCertificateLineage;)V

    return-void
.end method

.method private static createExtraFieldToAlignData(Ljava/nio/ByteBuffer;JI)Ljava/nio/ByteBuffer;
    .locals 7
    .param p0, "original"    # Ljava/nio/ByteBuffer;
    .param p1, "extraStartOffset"    # J
    .param p3, "dataAlignmentMultiple"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "original",
            "extraStartOffset",
            "dataAlignmentMultiple"
        }
    .end annotation

    .line 833
    const/4 v0, 0x1

    if-gt p3, v0, :cond_0

    .line 834
    return-object p0

    .line 838
    :cond_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    add-int/lit8 v0, v0, 0x5

    add-int/2addr v0, p3

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 839
    .local v0, "result":Ljava/nio/ByteBuffer;
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 846
    :goto_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    const/16 v2, -0x26cb

    const/4 v3, 0x4

    if-lt v1, v3, :cond_5

    .line 847
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    .line 848
    .local v1, "headerId":S
    invoke-static {p0}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt16(Ljava/nio/ByteBuffer;)I

    move-result v4

    .line 849
    .local v4, "dataSize":I
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    if-le v4, v5, :cond_1

    .line 851
    goto :goto_1

    .line 853
    :cond_1
    if-nez v1, :cond_2

    if-eqz v4, :cond_3

    :cond_2
    if-ne v1, v2, :cond_4

    .line 857
    :cond_3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v2, v4

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 858
    goto :goto_0

    .line 861
    :cond_4
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    sub-int/2addr v2, v3

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 862
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    .line 863
    .local v2, "originalLimit":I
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    add-int/2addr v5, v3

    add-int/2addr v5, v4

    invoke-virtual {p0, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 864
    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 865
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 866
    .end local v1    # "headerId":S
    .end local v2    # "originalLimit":I
    .end local v4    # "dataSize":I
    goto :goto_0

    .line 876
    :cond_5
    :goto_1
    nop

    .line 878
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    int-to-long v3, v1

    add-long/2addr v3, p1

    const-wide/16 v5, 0x6

    add-long/2addr v3, v5

    .line 880
    .local v3, "dataMinStartOffset":J
    int-to-long v5, p3

    rem-long v5, v3, v5

    long-to-int v1, v5

    sub-int v1, p3, v1

    rem-int/2addr v1, p3

    .line 883
    .local v1, "paddingSizeBytes":I
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 884
    add-int/lit8 v2, v1, 0x2

    invoke-static {v0, v2}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 885
    invoke-static {v0, p3}, Lcom/android/apksig/internal/zip/ZipUtils;->putUnsignedInt16(Ljava/nio/ByteBuffer;I)V

    .line 886
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 887
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 889
    return-object v0
.end method

.method private static extractPinPatterns(Ljava/util/List;Lcom/android/apksig/util/DataSource;)Ljava/util/List;
    .locals 6
    .param p1, "lhfSection"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "cdRecords",
            "lhfSection"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/zip/CentralDirectoryRecord;",
            ">;",
            "Lcom/android/apksig/util/DataSource;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/apksig/Hints$PatternWithRange;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 977
    .local p0, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    nop

    .line 978
    const-string v0, "assets/com.android.hints.pins.txt"

    invoke-static {p0, v0}, Lcom/android/apksig/ApkSigner;->findCdRecord(Ljava/util/List;Ljava/lang/String;)Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    move-result-object v0

    .line 979
    .local v0, "pinListCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    const/4 v1, 0x0

    .line 980
    .local v1, "pinPatterns":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$PatternWithRange;>;"
    if-eqz v0, :cond_0

    .line 981
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v2

    .line 984
    nop

    .line 986
    :try_start_0
    invoke-interface {p1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v2

    .line 985
    invoke-static {p1, v0, v2, v3}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)[B

    move-result-object v2
    :try_end_0
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 989
    .local v2, "patternBlob":[B
    nop

    .line 990
    invoke-static {v2}, Lcom/android/apksig/Hints;->parsePinPatterns([B)Ljava/util/ArrayList;

    move-result-object v1

    goto :goto_0

    .line 987
    .end local v2    # "patternBlob":[B
    :catch_0
    move-exception v2

    .line 988
    .local v2, "ex":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v3, Lcom/android/apksig/apk/ApkFormatException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Bad "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 992
    .end local v2    # "ex":Lcom/android/apksig/zip/ZipFormatException;
    :cond_0
    :goto_0
    return-object v1
.end method

.method private static findCdRecord(Ljava/util/List;Ljava/lang/String;)Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "cdRecords",
            "name"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/zip/CentralDirectoryRecord;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/android/apksig/internal/zip/CentralDirectoryRecord;"
        }
    .end annotation

    .line 944
    .local p0, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 945
    .local v1, "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    invoke-virtual {v1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 946
    return-object v1

    .line 948
    .end local v1    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :cond_0
    goto :goto_0

    .line 949
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private static fulfillInspectInputJarEntryRequest(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/LocalFileRecord;Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;)V
    .locals 4
    .param p0, "lfhSection"    # Lcom/android/apksig/util/DataSource;
    .param p1, "localFileRecord"    # Lcom/android/apksig/internal/zip/LocalFileRecord;
    .param p2, "inspectEntryRequest"    # Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "lfhSection",
            "localFileRecord",
            "inspectEntryRequest"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 722
    :try_start_0
    invoke-interface {p2}, Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;->getDataSink()Lcom/android/apksig/util/DataSink;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Lcom/android/apksig/internal/zip/LocalFileRecord;->outputUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSink;)V
    :try_end_0
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 725
    nop

    .line 726
    invoke-interface {p2}, Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;->done()V

    .line 727
    return-void

    .line 723
    :catch_0
    move-exception v0

    .line 724
    .local v0, "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v1, Lcom/android/apksig/apk/ApkFormatException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Malformed ZIP entry: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method static getAndroidManifestFromApk(Ljava/util/List;Lcom/android/apksig/util/DataSource;)Ljava/nio/ByteBuffer;
    .locals 3
    .param p1, "lhfSection"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "cdRecords",
            "lhfSection"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/zip/CentralDirectoryRecord;",
            ">;",
            "Lcom/android/apksig/util/DataSource;",
            ")",
            "Ljava/nio/ByteBuffer;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;,
            Lcom/android/apksig/zip/ZipFormatException;
        }
    .end annotation

    .line 959
    .local p0, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    nop

    .line 960
    const-string v0, "AndroidManifest.xml"

    invoke-static {p0, v0}, Lcom/android/apksig/ApkSigner;->findCdRecord(Ljava/util/List;Ljava/lang/String;)Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    move-result-object v0

    .line 961
    .local v0, "androidManifestCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    if-eqz v0, :cond_0

    .line 965
    nop

    .line 967
    invoke-interface {p1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v1

    .line 966
    invoke-static {p1, v0, v1, v2}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)[B

    move-result-object v1

    .line 965
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    return-object v1

    .line 962
    :cond_0
    new-instance v1, Lcom/android/apksig/apk/ApkFormatException;

    const-string v2, "Missing AndroidManifest.xml"

    invoke-direct {v1, v2}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static getInputJarEntryDataAlignmentMultiple(Lcom/android/apksig/internal/zip/LocalFileRecord;)I
    .locals 5
    .param p0, "entry"    # Lcom/android/apksig/internal/zip/LocalFileRecord;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entry"
        }
    .end annotation

    .line 789
    invoke-virtual {p0}, Lcom/android/apksig/internal/zip/LocalFileRecord;->isDataCompressed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 791
    const/4 v0, 0x1

    return v0

    .line 795
    :cond_0
    invoke-virtual {p0}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getExtra()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 796
    .local v0, "extra":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    const/4 v2, 0x4

    if-eqz v1, :cond_4

    .line 797
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 802
    :goto_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    if-lt v1, v2, :cond_4

    .line 803
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v1

    .line 804
    .local v1, "headerId":S
    invoke-static {v0}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt16(Ljava/nio/ByteBuffer;)I

    move-result v3

    .line 805
    .local v3, "dataSize":I
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    if-le v3, v4, :cond_1

    .line 807
    goto :goto_1

    .line 809
    :cond_1
    const/16 v4, -0x26cb

    if-eq v1, v4, :cond_2

    .line 811
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    add-int/2addr v4, v3

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 812
    goto :goto_0

    .line 819
    :cond_2
    const/4 v4, 0x2

    if-ge v3, v4, :cond_3

    .line 821
    goto :goto_1

    .line 823
    :cond_3
    invoke-static {v0}, Lcom/android/apksig/internal/zip/ZipUtils;->getUnsignedInt16(Ljava/nio/ByteBuffer;)I

    move-result v2

    return v2

    .line 828
    .end local v1    # "headerId":S
    .end local v3    # "dataSize":I
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v3, ".so"

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    const/16 v2, 0x1000

    :cond_5
    return v2
.end method

.method private static getMinSdkVersionFromApk(Ljava/util/List;Lcom/android/apksig/util/DataSource;)I
    .locals 3
    .param p1, "lhfSection"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "cdRecords",
            "lhfSection"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/zip/CentralDirectoryRecord;",
            ">;",
            "Lcom/android/apksig/util/DataSource;",
            ")I"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/MinSdkVersionException;
        }
    .end annotation

    .line 1004
    .local p0, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    :try_start_0
    invoke-static {p0, p1}, Lcom/android/apksig/ApkSigner;->getAndroidManifestFromApk(Ljava/util/List;Lcom/android/apksig/util/DataSource;)Ljava/nio/ByteBuffer;

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1008
    .local v0, "androidManifest":Ljava/nio/ByteBuffer;
    nop

    .line 1009
    invoke-static {v0}, Lcom/android/apksig/apk/ApkUtils;->getMinSdkVersionFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;)I

    move-result v1

    return v1

    .line 1005
    .end local v0    # "androidManifest":Ljava/nio/ByteBuffer;
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 1006
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    new-instance v1, Lcom/android/apksig/apk/MinSdkVersionException;

    const-string v2, "Failed to determine APK\'s minimum supported Android platform version"

    invoke-direct {v1, v2, v0}, Lcom/android/apksig/apk/MinSdkVersionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static getZipCentralDirectory(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/nio/ByteBuffer;
    .locals 6
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "apkSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apk",
            "apkSections"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 895
    invoke-virtual {p1}, Lcom/android/apksig/apk/ApkUtils$ZipSections;->getZipCentralDirectorySizeBytes()J

    move-result-wide v0

    .line 896
    .local v0, "cdSizeBytes":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    .line 899
    invoke-virtual {p1}, Lcom/android/apksig/apk/ApkUtils$ZipSections;->getZipCentralDirectoryOffset()J

    move-result-wide v2

    .line 900
    .local v2, "cdOffset":J
    long-to-int v4, v0

    invoke-interface {p0, v2, v3, v4}, Lcom/android/apksig/util/DataSource;->getByteBuffer(JI)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 901
    .local v4, "cd":Ljava/nio/ByteBuffer;
    sget-object v5, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 902
    return-object v4

    .line 897
    .end local v2    # "cdOffset":J
    .end local v4    # "cd":Ljava/nio/ByteBuffer;
    :cond_0
    new-instance v2, Lcom/android/apksig/apk/ApkFormatException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ZIP Central Directory too large: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static outputDataToOutputApk(Ljava/lang/String;[BJLjava/util/List;IILcom/android/apksig/util/DataSink;)J
    .locals 23
    .param p0, "entryName"    # Ljava/lang/String;
    .param p1, "uncompressedData"    # [B
    .param p2, "localFileHeaderOffset"    # J
    .param p5, "lastModifiedTimeForNewEntries"    # I
    .param p6, "lastModifiedDateForNewEntries"    # I
    .param p7, "outputApkOut"    # Lcom/android/apksig/util/DataSink;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "entryName",
            "uncompressedData",
            "localFileHeaderOffset",
            "outputCdRecords",
            "lastModifiedTimeForNewEntries",
            "lastModifiedDateForNewEntries",
            "outputApkOut"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[BJ",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/zip/CentralDirectoryRecord;",
            ">;II",
            "Lcom/android/apksig/util/DataSink;",
            ")J"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 692
    .local p4, "outputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    move-object/from16 v0, p1

    invoke-static/range {p1 .. p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-static {v1}, Lcom/android/apksig/internal/zip/ZipUtils;->deflate(Ljava/nio/ByteBuffer;)Lcom/android/apksig/internal/zip/ZipUtils$DeflateResult;

    move-result-object v1

    .line 693
    .local v1, "deflateResult":Lcom/android/apksig/internal/zip/ZipUtils$DeflateResult;
    iget-object v11, v1, Lcom/android/apksig/internal/zip/ZipUtils$DeflateResult;->output:[B

    .line 694
    .local v11, "compressedData":[B
    iget-wide v14, v1, Lcom/android/apksig/internal/zip/ZipUtils$DeflateResult;->inputCrc32:J

    .line 695
    .local v14, "uncompressedDataCrc32":J
    array-length v2, v0

    int-to-long v8, v2

    .line 696
    move-object/from16 v2, p0

    move/from16 v3, p5

    move/from16 v4, p6

    move-object v5, v11

    move-wide v6, v14

    move-object/from16 v10, p7

    invoke-static/range {v2 .. v10}, Lcom/android/apksig/internal/zip/LocalFileRecord;->outputRecordWithDeflateCompressedData(Ljava/lang/String;II[BJJLcom/android/apksig/util/DataSink;)J

    move-result-wide v2

    .line 704
    .local v2, "numOfDataBytes":J
    array-length v4, v11

    int-to-long v4, v4

    array-length v6, v0

    int-to-long v6, v6

    .line 705
    move-object/from16 v12, p0

    move/from16 v13, p5

    move-wide v8, v14

    .end local v14    # "uncompressedDataCrc32":J
    .local v8, "uncompressedDataCrc32":J
    move/from16 v14, p6

    move-wide v15, v8

    move-wide/from16 v17, v4

    move-wide/from16 v19, v6

    move-wide/from16 v21, p2

    invoke-static/range {v12 .. v22}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->createWithDeflateCompressedData(Ljava/lang/String;IIJJJJ)Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    move-result-object v4

    .line 704
    move-object/from16 v5, p4

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 713
    return-wide v2
.end method

.method private static outputInputJarEntryLfhRecordPreservingDataAlignment(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/LocalFileRecord;Lcom/android/apksig/util/DataSink;J)Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;
    .locals 11
    .param p0, "inputLfhSection"    # Lcom/android/apksig/util/DataSource;
    .param p1, "inputRecord"    # Lcom/android/apksig/internal/zip/LocalFileRecord;
    .param p2, "outputLfhSection"    # Lcom/android/apksig/util/DataSink;
    .param p3, "outputOffset"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "inputLfhSection",
            "inputRecord",
            "outputLfhSection",
            "outputOffset"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 745
    invoke-virtual {p1}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getStartOffsetInArchive()J

    move-result-wide v0

    .line 746
    .local v0, "inputOffset":J
    cmp-long v2, v0, p3

    if-nez v2, :cond_0

    .line 748
    new-instance v2, Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;

    .line 749
    invoke-virtual {p1, p0, p2}, Lcom/android/apksig/internal/zip/LocalFileRecord;->outputRecord(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSink;)J

    move-result-wide v3

    .line 750
    invoke-virtual {p1}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getDataStartOffsetInRecord()I

    move-result v5

    int-to-long v5, v5

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;-><init>(JJ)V

    .line 748
    return-object v2

    .line 752
    :cond_0
    invoke-static {p1}, Lcom/android/apksig/ApkSigner;->getInputJarEntryDataAlignmentMultiple(Lcom/android/apksig/internal/zip/LocalFileRecord;)I

    move-result v2

    .line 753
    .local v2, "dataAlignmentMultiple":I
    const/4 v3, 0x1

    if-le v2, v3, :cond_3

    int-to-long v3, v2

    rem-long v3, v0, v3

    int-to-long v5, v2

    rem-long v5, p3, v5

    cmp-long v3, v3, v5

    if-nez v3, :cond_1

    goto :goto_0

    .line 762
    :cond_1
    invoke-virtual {p1}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getDataStartOffsetInRecord()I

    move-result v3

    int-to-long v3, v3

    add-long/2addr v3, v0

    .line 763
    .local v3, "inputDataStartOffset":J
    int-to-long v5, v2

    rem-long v5, v3, v5

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-eqz v5, :cond_2

    .line 766
    new-instance v5, Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;

    .line 767
    invoke-virtual {p1, p0, p2}, Lcom/android/apksig/internal/zip/LocalFileRecord;->outputRecord(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSink;)J

    move-result-wide v6

    .line 768
    invoke-virtual {p1}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getDataStartOffsetInRecord()I

    move-result v8

    int-to-long v8, v8

    invoke-direct {v5, v6, v7, v8, v9}, Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;-><init>(JJ)V

    .line 766
    return-object v5

    .line 773
    :cond_2
    nop

    .line 775
    invoke-virtual {p1}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getExtra()Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 776
    invoke-virtual {p1}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getExtraFieldStartOffsetInsideRecord()I

    move-result v6

    int-to-long v6, v6

    add-long/2addr v6, p3

    .line 774
    invoke-static {v5, v6, v7, v2}, Lcom/android/apksig/ApkSigner;->createExtraFieldToAlignData(Ljava/nio/ByteBuffer;JI)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 778
    .local v5, "aligningExtra":Ljava/nio/ByteBuffer;
    nop

    .line 779
    invoke-virtual {p1}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getDataStartOffsetInRecord()I

    move-result v6

    int-to-long v6, v6

    .line 780
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v8

    int-to-long v8, v8

    add-long/2addr v6, v8

    .line 781
    invoke-virtual {p1}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getExtra()Ljava/nio/ByteBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v8

    int-to-long v8, v8

    sub-long/2addr v6, v8

    .line 782
    .local v6, "dataOffset":J
    new-instance v8, Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;

    .line 783
    invoke-virtual {p1, p0, v5, p2}, Lcom/android/apksig/internal/zip/LocalFileRecord;->outputRecordWithModifiedExtra(Lcom/android/apksig/util/DataSource;Ljava/nio/ByteBuffer;Lcom/android/apksig/util/DataSink;)J

    move-result-wide v9

    invoke-direct {v8, v9, v10, v6, v7}, Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;-><init>(JJ)V

    .line 782
    return-object v8

    .line 757
    .end local v3    # "inputDataStartOffset":J
    .end local v5    # "aligningExtra":Ljava/nio/ByteBuffer;
    .end local v6    # "dataOffset":J
    :cond_3
    :goto_0
    new-instance v3, Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;

    .line 758
    invoke-virtual {p1, p0, p2}, Lcom/android/apksig/internal/zip/LocalFileRecord;->outputRecord(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSink;)J

    move-result-wide v4

    .line 759
    invoke-virtual {p1}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getDataStartOffsetInRecord()I

    move-result v6

    int-to-long v6, v6

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;-><init>(JJ)V

    .line 757
    return-object v3
.end method

.method private static parseZipCentralDirectory(Ljava/nio/ByteBuffer;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/util/List;
    .locals 12
    .param p0, "cd"    # Ljava/nio/ByteBuffer;
    .param p1, "apkSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "cd",
            "apkSections"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            "Lcom/android/apksig/apk/ApkUtils$ZipSections;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/zip/CentralDirectoryRecord;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 907
    invoke-virtual {p1}, Lcom/android/apksig/apk/ApkUtils$ZipSections;->getZipCentralDirectoryOffset()J

    move-result-wide v0

    .line 908
    .local v0, "cdOffset":J
    invoke-virtual {p1}, Lcom/android/apksig/apk/ApkUtils$ZipSections;->getZipCentralDirectoryRecordCount()I

    move-result v2

    .line 909
    .local v2, "expectedCdRecordCount":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 910
    .local v3, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4, v2}, Ljava/util/HashSet;-><init>(I)V

    .line 911
    .local v4, "entryNames":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v2, :cond_1

    .line 913
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v6

    .line 915
    .local v6, "offsetInsideCd":I
    :try_start_0
    invoke-static {p0}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getRecord(Ljava/nio/ByteBuffer;)Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    move-result-object v7
    :try_end_0
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 923
    .local v7, "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    nop

    .line 924
    invoke-virtual {v7}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v8

    .line 925
    .local v8, "entryName":Ljava/lang/String;
    invoke-interface {v4, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 929
    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 911
    .end local v6    # "offsetInsideCd":I
    .end local v7    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v8    # "entryName":Ljava/lang/String;
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 926
    .restart local v6    # "offsetInsideCd":I
    .restart local v7    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v8    # "entryName":Ljava/lang/String;
    :cond_0
    new-instance v9, Lcom/android/apksig/apk/ApkFormatException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Multiple ZIP entries with the same name: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 916
    .end local v7    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v8    # "entryName":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 917
    .local v7, "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v8, Lcom/android/apksig/apk/ApkFormatException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Malformed ZIP Central Directory record #"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    add-int/lit8 v10, v5, 0x1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " at file offset "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    int-to-long v10, v6

    add-long/2addr v10, v0

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v7}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 931
    .end local v5    # "i":I
    .end local v6    # "offsetInsideCd":I
    .end local v7    # "e":Lcom/android/apksig/zip/ZipFormatException;
    :cond_1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v5

    if-nez v5, :cond_2

    .line 939
    return-object v3

    .line 932
    :cond_2
    new-instance v5, Lcom/android/apksig/apk/ApkFormatException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unused space at the end of ZIP Central Directory: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 934
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " bytes starting at file offset "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 936
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v7

    int-to-long v7, v7

    add-long/2addr v7, v0

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private static requestOutputEntryInspection(Lcom/android/apksig/ApkSignerEngine;Ljava/lang/String;[B)V
    .locals 4
    .param p0, "signerEngine"    # Lcom/android/apksig/ApkSignerEngine;
    .param p1, "entryName"    # Ljava/lang/String;
    .param p2, "uncompressedData"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "signerEngine",
            "entryName",
            "uncompressedData"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 674
    nop

    .line 675
    invoke-interface {p0, p1}, Lcom/android/apksig/ApkSignerEngine;->outputJarEntry(Ljava/lang/String;)Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;

    move-result-object v0

    .line 676
    .local v0, "inspectEntryRequest":Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    if-eqz v0, :cond_0

    .line 677
    invoke-interface {v0}, Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;->getDataSink()Lcom/android/apksig/util/DataSink;

    move-result-object v1

    const/4 v2, 0x0

    array-length v3, p2

    invoke-interface {v1, p2, v2, v3}, Lcom/android/apksig/util/DataSink;->consume([BII)V

    .line 679
    invoke-interface {v0}, Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;->done()V

    .line 681
    :cond_0
    return-void
.end method

.method private sign(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSink;Lcom/android/apksig/util/DataSource;)V
    .locals 49
    .param p1, "inputApk"    # Lcom/android/apksig/util/DataSource;
    .param p2, "outputApkOut"    # Lcom/android/apksig/util/DataSink;
    .param p3, "outputApkIn"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "inputApk",
            "outputApkOut",
            "outputApkIn"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;
        }
    .end annotation

    .line 250
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v11, p2

    move-object/from16 v12, p3

    :try_start_0
    invoke-static/range {p1 .. p1}, Lcom/android/apksig/apk/ApkUtils;->findZipSections(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/apk/ApkUtils$ZipSections;

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_4

    move-object v13, v0

    .line 253
    .local v13, "inputZipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    nop

    .line 254
    const-wide/16 v3, -0x1

    .line 255
    .local v3, "inputApkSigningBlockOffset":J
    const/4 v5, 0x0

    .line 257
    .local v5, "inputApkSigningBlock":Lcom/android/apksig/util/DataSource;
    nop

    .line 258
    :try_start_1
    invoke-static {v2, v13}, Lcom/android/apksig/apk/ApkUtils;->findApkSigningBlock(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Lcom/android/apksig/apk/ApkUtils$ApkSigningBlock;

    move-result-object v0

    .line 259
    .local v0, "apkSigningBlockInfo":Lcom/android/apksig/apk/ApkUtils$ApkSigningBlock;
    invoke-virtual {v0}, Lcom/android/apksig/apk/ApkUtils$ApkSigningBlock;->getStartOffset()J

    move-result-wide v6

    move-wide v3, v6

    .line 260
    invoke-virtual {v0}, Lcom/android/apksig/apk/ApkUtils$ApkSigningBlock;->getContents()Lcom/android/apksig/util/DataSource;

    move-result-object v6
    :try_end_1
    .catch Lcom/android/apksig/apk/ApkSigningBlockNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    move-object v5, v6

    .line 265
    .end local v0    # "apkSigningBlockInfo":Lcom/android/apksig/apk/ApkUtils$ApkSigningBlock;
    move-wide v14, v3

    move-object v10, v5

    goto :goto_0

    .line 261
    :catch_0
    move-exception v0

    move-wide v14, v3

    move-object v10, v5

    .line 266
    .end local v3    # "inputApkSigningBlockOffset":J
    .end local v5    # "inputApkSigningBlock":Lcom/android/apksig/util/DataSource;
    .local v10, "inputApkSigningBlock":Lcom/android/apksig/util/DataSource;
    .local v14, "inputApkSigningBlockOffset":J
    :goto_0
    nop

    .line 269
    const-wide/16 v3, -0x1

    cmp-long v0, v14, v3

    if-eqz v0, :cond_0

    .line 270
    move-wide v3, v14

    goto :goto_1

    .line 271
    :cond_0
    invoke-virtual {v13}, Lcom/android/apksig/apk/ApkUtils$ZipSections;->getZipCentralDirectoryOffset()J

    move-result-wide v3

    .line 267
    :goto_1
    const-wide/16 v8, 0x0

    invoke-interface {v2, v8, v9, v3, v4}, Lcom/android/apksig/util/DataSource;->slice(JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v6

    .line 274
    .local v6, "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    invoke-static {v2, v13}, Lcom/android/apksig/ApkSigner;->getZipCentralDirectory(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/nio/ByteBuffer;

    move-result-object v7

    .line 275
    .local v7, "inputCd":Ljava/nio/ByteBuffer;
    nop

    .line 276
    invoke-static {v7, v13}, Lcom/android/apksig/ApkSigner;->parseZipCentralDirectory(Ljava/nio/ByteBuffer;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/util/List;

    move-result-object v4

    .line 278
    .local v4, "inputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    nop

    .line 279
    invoke-static {v4, v6}, Lcom/android/apksig/ApkSigner;->extractPinPatterns(Ljava/util/List;Lcom/android/apksig/util/DataSource;)Ljava/util/List;

    move-result-object v16

    .line 280
    .local v16, "pinPatterns":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$PatternWithRange;>;"
    if-nez v16, :cond_1

    const/4 v0, 0x0

    goto :goto_2

    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :goto_2
    move-object v5, v0

    .line 284
    .local v5, "pinByteRanges":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$ByteRange;>;"
    iget-object v0, v1, Lcom/android/apksig/ApkSigner;->mSignerEngine:Lcom/android/apksig/ApkSignerEngine;

    if-eqz v0, :cond_2

    .line 286
    iget-object v0, v1, Lcom/android/apksig/ApkSigner;->mSignerEngine:Lcom/android/apksig/ApkSignerEngine;

    move-object v2, v0

    move-object/from16 v19, v5

    move-object/from16 v20, v7

    move-wide/from16 v22, v14

    .local v0, "signerEngine":Lcom/android/apksig/ApkSignerEngine;
    goto/16 :goto_5

    .line 290
    .end local v0    # "signerEngine":Lcom/android/apksig/ApkSignerEngine;
    :cond_2
    iget-object v0, v1, Lcom/android/apksig/ApkSigner;->mMinSdkVersion:Ljava/lang/Integer;

    if-eqz v0, :cond_3

    .line 292
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .local v0, "minSdkVersion":I
    goto :goto_3

    .line 295
    .end local v0    # "minSdkVersion":I
    :cond_3
    invoke-static {v4, v6}, Lcom/android/apksig/ApkSigner;->getMinSdkVersionFromApk(Ljava/util/List;Lcom/android/apksig/util/DataSource;)I

    move-result v0

    .line 297
    .restart local v0    # "minSdkVersion":I
    :goto_3
    new-instance v3, Ljava/util/ArrayList;

    iget-object v8, v1, Lcom/android/apksig/ApkSigner;->mSignerConfigs:Ljava/util/List;

    .line 298
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-direct {v3, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 299
    .local v3, "engineSignerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;>;"
    iget-object v8, v1, Lcom/android/apksig/ApkSigner;->mSignerConfigs:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/apksig/ApkSigner$SignerConfig;

    .line 300
    .local v9, "signerConfig":Lcom/android/apksig/ApkSigner$SignerConfig;
    new-instance v2, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;

    .line 302
    move-object/from16 v19, v5

    .end local v5    # "pinByteRanges":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$ByteRange;>;"
    .local v19, "pinByteRanges":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$ByteRange;>;"
    invoke-virtual {v9}, Lcom/android/apksig/ApkSigner$SignerConfig;->getName()Ljava/lang/String;

    move-result-object v5

    .line 303
    move-object/from16 v20, v7

    .end local v7    # "inputCd":Ljava/nio/ByteBuffer;
    .local v20, "inputCd":Ljava/nio/ByteBuffer;
    invoke-virtual {v9}, Lcom/android/apksig/ApkSigner$SignerConfig;->getPrivateKey()Ljava/security/PrivateKey;

    move-result-object v7

    .line 304
    move-object/from16 v21, v8

    invoke-virtual {v9}, Lcom/android/apksig/ApkSigner$SignerConfig;->getCertificates()Ljava/util/List;

    move-result-object v8

    .line 305
    move-wide/from16 v22, v14

    .end local v14    # "inputApkSigningBlockOffset":J
    .local v22, "inputApkSigningBlockOffset":J
    invoke-virtual {v9}, Lcom/android/apksig/ApkSigner$SignerConfig;->getDeterministicDsaSigning()Z

    move-result v14

    invoke-direct {v2, v5, v7, v8, v14}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;-><init>(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/util/List;Z)V

    .line 306
    invoke-virtual {v2}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;->build()Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    move-result-object v2

    .line 300
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    .end local v9    # "signerConfig":Lcom/android/apksig/ApkSigner$SignerConfig;
    move-object/from16 v2, p1

    move-object/from16 v5, v19

    move-object/from16 v7, v20

    move-object/from16 v8, v21

    move-wide/from16 v14, v22

    goto :goto_4

    .line 308
    .end local v19    # "pinByteRanges":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$ByteRange;>;"
    .end local v20    # "inputCd":Ljava/nio/ByteBuffer;
    .end local v22    # "inputApkSigningBlockOffset":J
    .restart local v5    # "pinByteRanges":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$ByteRange;>;"
    .restart local v7    # "inputCd":Ljava/nio/ByteBuffer;
    .restart local v14    # "inputApkSigningBlockOffset":J
    :cond_4
    move-object/from16 v19, v5

    move-object/from16 v20, v7

    move-wide/from16 v22, v14

    .end local v5    # "pinByteRanges":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$ByteRange;>;"
    .end local v7    # "inputCd":Ljava/nio/ByteBuffer;
    .end local v14    # "inputApkSigningBlockOffset":J
    .restart local v19    # "pinByteRanges":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$ByteRange;>;"
    .restart local v20    # "inputCd":Ljava/nio/ByteBuffer;
    .restart local v22    # "inputApkSigningBlockOffset":J
    new-instance v2, Lcom/android/apksig/DefaultApkSignerEngine$Builder;

    invoke-direct {v2, v3, v0}, Lcom/android/apksig/DefaultApkSignerEngine$Builder;-><init>(Ljava/util/List;I)V

    iget-boolean v5, v1, Lcom/android/apksig/ApkSigner;->mV1SigningEnabled:Z

    .line 310
    invoke-virtual {v2, v5}, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->setV1SigningEnabled(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;

    move-result-object v2

    iget-boolean v5, v1, Lcom/android/apksig/ApkSigner;->mV2SigningEnabled:Z

    .line 311
    invoke-virtual {v2, v5}, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->setV2SigningEnabled(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;

    move-result-object v2

    iget-boolean v5, v1, Lcom/android/apksig/ApkSigner;->mV3SigningEnabled:Z

    .line 312
    invoke-virtual {v2, v5}, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->setV3SigningEnabled(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;

    move-result-object v2

    iget-boolean v5, v1, Lcom/android/apksig/ApkSigner;->mVerityEnabled:Z

    .line 313
    invoke-virtual {v2, v5}, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->setVerityEnabled(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;

    move-result-object v2

    iget-boolean v5, v1, Lcom/android/apksig/ApkSigner;->mDebuggableApkPermitted:Z

    .line 314
    invoke-virtual {v2, v5}, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->setDebuggableApkPermitted(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;

    move-result-object v2

    iget-boolean v5, v1, Lcom/android/apksig/ApkSigner;->mOtherSignersSignaturesPreserved:Z

    .line 315
    invoke-virtual {v2, v5}, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->setOtherSignersSignaturesPreserved(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;

    move-result-object v2

    iget-object v5, v1, Lcom/android/apksig/ApkSigner;->mSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    .line 316
    invoke-virtual {v2, v5}, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->setSigningCertificateLineage(Lcom/android/apksig/SigningCertificateLineage;)Lcom/android/apksig/DefaultApkSignerEngine$Builder;

    move-result-object v2

    iget v5, v1, Lcom/android/apksig/ApkSigner;->mRotationMinSdkVersion:I

    .line 317
    invoke-virtual {v2, v5}, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->setMinSdkVersionForRotation(I)Lcom/android/apksig/DefaultApkSignerEngine$Builder;

    move-result-object v2

    iget-boolean v5, v1, Lcom/android/apksig/ApkSigner;->mRotationTargetsDevRelease:Z

    .line 318
    invoke-virtual {v2, v5}, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->setRotationTargetsDevRelease(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;

    move-result-object v2

    .line 319
    .local v2, "signerEngineBuilder":Lcom/android/apksig/DefaultApkSignerEngine$Builder;
    iget-object v5, v1, Lcom/android/apksig/ApkSigner;->mCreatedBy:Ljava/lang/String;

    if-eqz v5, :cond_5

    .line 320
    invoke-virtual {v2, v5}, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->setCreatedBy(Ljava/lang/String;)Lcom/android/apksig/DefaultApkSignerEngine$Builder;

    .line 322
    :cond_5
    iget-object v5, v1, Lcom/android/apksig/ApkSigner;->mSourceStampSignerConfig:Lcom/android/apksig/ApkSigner$SignerConfig;

    if-eqz v5, :cond_6

    .line 323
    new-instance v5, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;

    iget-object v7, v1, Lcom/android/apksig/ApkSigner;->mSourceStampSignerConfig:Lcom/android/apksig/ApkSigner$SignerConfig;

    .line 325
    invoke-virtual {v7}, Lcom/android/apksig/ApkSigner$SignerConfig;->getName()Ljava/lang/String;

    move-result-object v7

    iget-object v8, v1, Lcom/android/apksig/ApkSigner;->mSourceStampSignerConfig:Lcom/android/apksig/ApkSigner$SignerConfig;

    .line 326
    invoke-virtual {v8}, Lcom/android/apksig/ApkSigner$SignerConfig;->getPrivateKey()Ljava/security/PrivateKey;

    move-result-object v8

    iget-object v9, v1, Lcom/android/apksig/ApkSigner;->mSourceStampSignerConfig:Lcom/android/apksig/ApkSigner$SignerConfig;

    .line 327
    invoke-virtual {v9}, Lcom/android/apksig/ApkSigner$SignerConfig;->getCertificates()Ljava/util/List;

    move-result-object v9

    iget-object v14, v1, Lcom/android/apksig/ApkSigner;->mSourceStampSignerConfig:Lcom/android/apksig/ApkSigner$SignerConfig;

    .line 328
    invoke-virtual {v14}, Lcom/android/apksig/ApkSigner$SignerConfig;->getDeterministicDsaSigning()Z

    move-result v14

    invoke-direct {v5, v7, v8, v9, v14}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;-><init>(Ljava/lang/String;Ljava/security/PrivateKey;Ljava/util/List;Z)V

    .line 329
    invoke-virtual {v5}, Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig$Builder;->build()Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;

    move-result-object v5

    .line 323
    invoke-virtual {v2, v5}, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->setStampSignerConfig(Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;)Lcom/android/apksig/DefaultApkSignerEngine$Builder;

    .line 330
    iget-boolean v5, v1, Lcom/android/apksig/ApkSigner;->mSourceStampTimestampEnabled:Z

    invoke-virtual {v2, v5}, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->setSourceStampTimestampEnabled(Z)Lcom/android/apksig/DefaultApkSignerEngine$Builder;

    .line 332
    :cond_6
    iget-object v5, v1, Lcom/android/apksig/ApkSigner;->mSourceStampSigningCertificateLineage:Lcom/android/apksig/SigningCertificateLineage;

    if-eqz v5, :cond_7

    .line 333
    invoke-virtual {v2, v5}, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->setSourceStampSigningCertificateLineage(Lcom/android/apksig/SigningCertificateLineage;)Lcom/android/apksig/DefaultApkSignerEngine$Builder;

    .line 336
    :cond_7
    invoke-virtual {v2}, Lcom/android/apksig/DefaultApkSignerEngine$Builder;->build()Lcom/android/apksig/DefaultApkSignerEngine;

    move-result-object v5

    move-object v2, v5

    .line 340
    .end local v0    # "minSdkVersion":I
    .end local v3    # "engineSignerConfigs":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/DefaultApkSignerEngine$SignerConfig;>;"
    .local v2, "signerEngine":Lcom/android/apksig/ApkSignerEngine;
    :goto_5
    if-eqz v10, :cond_8

    .line 341
    invoke-interface {v2, v10}, Lcom/android/apksig/ApkSignerEngine;->inputApkSigningBlock(Lcom/android/apksig/util/DataSource;)V

    .line 348
    :cond_8
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v14, v0

    .line 350
    .local v14, "inputCdRecordsSortedByLfhOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    sget-object v0, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->BY_LOCAL_FILE_HEADER_OFFSET_COMPARATOR:Ljava/util/Comparator;

    invoke-static {v14, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 353
    const/4 v0, -0x1

    .line 354
    .local v0, "lastModifiedDateForNewEntries":I
    const/4 v3, -0x1

    .line 355
    .local v3, "lastModifiedTimeForNewEntries":I
    const-wide/16 v7, 0x0

    .line 356
    .local v7, "inputOffset":J
    const-wide/16 v24, 0x0

    .line 357
    .local v24, "outputOffset":J
    const/4 v5, 0x0

    .line 358
    .local v5, "sourceStampCertificateDigest":[B
    new-instance v9, Ljava/util/HashMap;

    .line 359
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v15

    invoke-direct {v9, v15}, Ljava/util/HashMap;-><init>(I)V

    move-object v15, v9

    .line 360
    .local v15, "outputCdRecordsByName":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    move-wide/from16 v26, v24

    move-wide/from16 v24, v7

    move v8, v0

    move v7, v3

    .end local v0    # "lastModifiedDateForNewEntries":I
    .end local v3    # "lastModifiedTimeForNewEntries":I
    .local v7, "lastModifiedTimeForNewEntries":I
    .local v8, "lastModifiedDateForNewEntries":I
    .local v24, "inputOffset":J
    .local v26, "outputOffset":J
    :goto_6
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v3, -0x1

    move-object/from16 v21, v10

    .end local v10    # "inputApkSigningBlock":Lcom/android/apksig/util/DataSource;
    .local v21, "inputApkSigningBlock":Lcom/android/apksig/util/DataSource;
    const-string v10, "stamp-cert-sha256"

    if-eqz v0, :cond_17

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v28, v9

    move-object v9, v0

    check-cast v9, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 361
    .local v9, "inputCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    move-object/from16 v29, v14

    .end local v14    # "inputCdRecordsSortedByLfhOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .local v29, "inputCdRecordsSortedByLfhOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    invoke-virtual {v9}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v14

    .line 362
    .local v14, "entryName":Ljava/lang/String;
    const-string v0, "pinlist.meta"

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 363
    move-object/from16 v10, v21

    move-object/from16 v9, v28

    move-object/from16 v14, v29

    goto :goto_6

    .line 365
    :cond_9
    invoke-virtual {v10, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 367
    nop

    .line 369
    move-object/from16 v30, v4

    .end local v4    # "inputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .local v30, "inputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    :try_start_2
    invoke-interface {v6}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v3

    .line 368
    invoke-static {v6, v9, v3, v4}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)[B

    move-result-object v0
    :try_end_2
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_2 .. :try_end_2} :catch_1

    move-object v5, v0

    .line 372
    move-object/from16 v10, v21

    move-object/from16 v9, v28

    move-object/from16 v14, v29

    move-object/from16 v4, v30

    goto :goto_6

    .line 370
    :catch_1
    move-exception v0

    .line 371
    .local v0, "ex":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v3, Lcom/android/apksig/apk/ApkFormatException;

    const-string v4, "Bad source stamp entry"

    invoke-direct {v3, v4}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 375
    .end local v0    # "ex":Lcom/android/apksig/zip/ZipFormatException;
    .end local v30    # "inputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v4    # "inputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    :cond_a
    move-object/from16 v30, v4

    .line 376
    .end local v4    # "inputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v30    # "inputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    invoke-interface {v2, v14}, Lcom/android/apksig/ApkSignerEngine;->inputJarEntry(Ljava/lang/String;)Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;

    move-result-object v10

    .line 378
    .local v10, "entryInstructions":Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;
    sget-object v0, Lcom/android/apksig/ApkSigner$1;->$SwitchMap$com$android$apksig$ApkSignerEngine$InputJarEntryInstructions$OutputPolicy:[I

    invoke-virtual {v10}, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;->getOutputPolicy()Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;->ordinal()I

    move-result v4

    aget v0, v0, v4

    packed-switch v0, :pswitch_data_0

    .line 387
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown output policy: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 388
    invoke-virtual {v10}, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;->getOutputPolicy()Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 384
    :pswitch_0
    const/4 v0, 0x0

    .line 385
    .local v0, "shouldOutput":Z
    move/from16 v31, v0

    goto :goto_7

    .line 380
    .end local v0    # "shouldOutput":Z
    :pswitch_1
    const/4 v0, 0x1

    .line 381
    .restart local v0    # "shouldOutput":Z
    move/from16 v31, v0

    .line 391
    .end local v0    # "shouldOutput":Z
    .local v31, "shouldOutput":Z
    :goto_7
    invoke-virtual {v9}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getLocalFileHeaderOffset()J

    move-result-wide v32

    .line 392
    .local v32, "inputLocalFileHeaderStartOffset":J
    cmp-long v0, v32, v24

    if-lez v0, :cond_b

    .line 396
    sub-long v34, v32, v24

    .line 397
    .local v34, "chunkSize":J
    move v0, v3

    move-object v3, v6

    move-object v12, v5

    move-object/from16 v48, v30

    move-object/from16 v30, v13

    move-object/from16 v13, v19

    move-object/from16 v19, v48

    .end local v5    # "sourceStampCertificateDigest":[B
    .local v12, "sourceStampCertificateDigest":[B
    .local v13, "pinByteRanges":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$ByteRange;>;"
    .local v19, "inputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .local v30, "inputZipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    move-wide/from16 v4, v24

    move-object/from16 v36, v12

    move-object/from16 v37, v20

    move-object/from16 v20, v6

    move v12, v7

    .end local v6    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .end local v7    # "lastModifiedTimeForNewEntries":I
    .local v12, "lastModifiedTimeForNewEntries":I
    .local v20, "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .local v36, "sourceStampCertificateDigest":[B
    .local v37, "inputCd":Ljava/nio/ByteBuffer;
    move-wide/from16 v6, v34

    move v1, v8

    const-wide/16 v17, 0x0

    .end local v8    # "lastModifiedDateForNewEntries":I
    .local v1, "lastModifiedDateForNewEntries":I
    move-object/from16 v8, p2

    invoke-interface/range {v3 .. v8}, Lcom/android/apksig/util/DataSource;->feed(JJLcom/android/apksig/util/DataSink;)V

    .line 398
    add-long v26, v26, v34

    .line 399
    move-wide/from16 v24, v32

    goto :goto_8

    .line 392
    .end local v1    # "lastModifiedDateForNewEntries":I
    .end local v12    # "lastModifiedTimeForNewEntries":I
    .end local v34    # "chunkSize":J
    .end local v36    # "sourceStampCertificateDigest":[B
    .end local v37    # "inputCd":Ljava/nio/ByteBuffer;
    .restart local v5    # "sourceStampCertificateDigest":[B
    .restart local v6    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .restart local v7    # "lastModifiedTimeForNewEntries":I
    .restart local v8    # "lastModifiedDateForNewEntries":I
    .local v13, "inputZipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .local v19, "pinByteRanges":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$ByteRange;>;"
    .local v20, "inputCd":Ljava/nio/ByteBuffer;
    .local v30, "inputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    :cond_b
    move v0, v3

    move-object/from16 v36, v5

    move v12, v7

    move v1, v8

    move-object/from16 v37, v20

    const-wide/16 v17, 0x0

    move-object/from16 v20, v6

    move-object/from16 v48, v30

    move-object/from16 v30, v13

    move-object/from16 v13, v19

    move-object/from16 v19, v48

    .line 403
    .end local v5    # "sourceStampCertificateDigest":[B
    .end local v6    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .end local v7    # "lastModifiedTimeForNewEntries":I
    .end local v8    # "lastModifiedDateForNewEntries":I
    .restart local v1    # "lastModifiedDateForNewEntries":I
    .restart local v12    # "lastModifiedTimeForNewEntries":I
    .local v13, "pinByteRanges":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$ByteRange;>;"
    .local v19, "inputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .local v20, "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .local v30, "inputZipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .restart local v36    # "sourceStampCertificateDigest":[B
    .restart local v37    # "inputCd":Ljava/nio/ByteBuffer;
    :goto_8
    nop

    .line 405
    :try_start_3
    invoke-interface/range {v20 .. v20}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v3
    :try_end_3
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_3 .. :try_end_3} :catch_3

    .line 404
    move-object/from16 v8, v20

    .end local v20    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .local v8, "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    :try_start_4
    invoke-static {v8, v9, v3, v4}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getRecord(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)Lcom/android/apksig/internal/zip/LocalFileRecord;

    move-result-object v3
    :try_end_4
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_4 .. :try_end_4} :catch_2

    .line 408
    .local v3, "inputLocalFileRecord":Lcom/android/apksig/internal/zip/LocalFileRecord;
    nop

    .line 409
    invoke-virtual {v3}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getSize()J

    move-result-wide v4

    add-long v24, v24, v4

    .line 411
    nop

    .line 412
    invoke-virtual {v10}, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;->getInspectJarEntryRequest()Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;

    move-result-object v4

    .line 413
    .local v4, "inspectEntryRequest":Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    if-eqz v4, :cond_c

    .line 414
    invoke-static {v8, v3, v4}, Lcom/android/apksig/ApkSigner;->fulfillInspectInputJarEntryRequest(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/LocalFileRecord;Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;)V

    .line 418
    :cond_c
    if-eqz v31, :cond_16

    .line 421
    invoke-virtual {v9}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getLastModificationDate()I

    move-result v5

    .line 422
    .local v5, "lastModifiedDate":I
    invoke-virtual {v9}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getLastModificationTime()I

    move-result v6

    .line 423
    .local v6, "lastModifiedTime":I
    if-eq v1, v0, :cond_e

    if-gt v5, v1, :cond_e

    if-ne v5, v1, :cond_d

    if-le v6, v12, :cond_d

    goto :goto_9

    .line 431
    :cond_d
    move v0, v1

    move v7, v12

    goto :goto_a

    .line 427
    :cond_e
    :goto_9
    move v0, v5

    .line 428
    .end local v1    # "lastModifiedDateForNewEntries":I
    .local v0, "lastModifiedDateForNewEntries":I
    move v7, v6

    .line 431
    .end local v12    # "lastModifiedTimeForNewEntries":I
    .restart local v7    # "lastModifiedTimeForNewEntries":I
    :goto_a
    invoke-interface {v2, v14}, Lcom/android/apksig/ApkSignerEngine;->outputJarEntry(Ljava/lang/String;)Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;

    move-result-object v1

    .line 432
    .end local v4    # "inspectEntryRequest":Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    .local v1, "inspectEntryRequest":Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    if-eqz v1, :cond_f

    .line 433
    invoke-static {v8, v3, v1}, Lcom/android/apksig/ApkSigner;->fulfillInspectInputJarEntryRequest(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/LocalFileRecord;Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;)V

    .line 438
    :cond_f
    move-wide/from16 v34, v26

    .line 439
    .local v34, "outputLocalFileHeaderOffset":J
    nop

    .line 440
    move v12, v0

    move-object/from16 v20, v1

    move-wide/from16 v0, v34

    .end local v1    # "inspectEntryRequest":Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    .end local v34    # "outputLocalFileHeaderOffset":J
    .local v0, "outputLocalFileHeaderOffset":J
    .local v12, "lastModifiedDateForNewEntries":I
    .local v20, "inspectEntryRequest":Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    invoke-static {v8, v3, v11, v0, v1}, Lcom/android/apksig/ApkSigner;->outputInputJarEntryLfhRecordPreservingDataAlignment(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/LocalFileRecord;Lcom/android/apksig/util/DataSink;J)Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;

    move-result-object v4

    .line 445
    .local v4, "outputLfrResult":Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;
    move/from16 v34, v5

    move/from16 v35, v6

    .end local v5    # "lastModifiedDate":I
    .end local v6    # "lastModifiedTime":I
    .local v34, "lastModifiedDate":I
    .local v35, "lastModifiedTime":I
    iget-wide v5, v4, Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;->outputBytes:J

    add-long v5, v26, v5

    .line 446
    .end local v26    # "outputOffset":J
    .local v5, "outputOffset":J
    move/from16 v38, v12

    .end local v12    # "lastModifiedDateForNewEntries":I
    .local v38, "lastModifiedDateForNewEntries":I
    iget-wide v11, v4, Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;->dataOffsetBytes:J

    add-long/2addr v11, v0

    .line 449
    .local v11, "outputDataOffset":J
    if-eqz v16, :cond_13

    .line 450
    const/16 v26, 0x0

    .line 451
    .local v26, "pinFileHeader":Z
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v27

    :goto_b
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v39

    if-eqz v39, :cond_12

    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v39

    move-object/from16 v40, v4

    .end local v4    # "outputLfrResult":Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;
    .local v40, "outputLfrResult":Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;
    move-object/from16 v4, v39

    check-cast v4, Lcom/android/apksig/Hints$PatternWithRange;

    .line 452
    .local v4, "pinPattern":Lcom/android/apksig/Hints$PatternWithRange;
    move/from16 v39, v7

    .end local v7    # "lastModifiedTimeForNewEntries":I
    .local v39, "lastModifiedTimeForNewEntries":I
    invoke-virtual {v9}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lcom/android/apksig/Hints$PatternWithRange;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v7

    if-eqz v7, :cond_10

    .line 453
    new-instance v7, Lcom/android/apksig/Hints$ByteRange;

    invoke-direct {v7, v11, v12, v5, v6}, Lcom/android/apksig/Hints$ByteRange;-><init>(JJ)V

    .line 455
    .local v7, "dataRange":Lcom/android/apksig/Hints$ByteRange;
    nop

    .line 456
    move-wide/from16 v41, v5

    .end local v5    # "outputOffset":J
    .local v41, "outputOffset":J
    invoke-virtual {v4, v7}, Lcom/android/apksig/Hints$PatternWithRange;->ClampToAbsoluteByteRange(Lcom/android/apksig/Hints$ByteRange;)Lcom/android/apksig/Hints$ByteRange;

    move-result-object v5

    .line 457
    .local v5, "pinRange":Lcom/android/apksig/Hints$ByteRange;
    if-eqz v5, :cond_11

    .line 458
    const/4 v6, 0x1

    .line 459
    .end local v26    # "pinFileHeader":Z
    .local v6, "pinFileHeader":Z
    invoke-interface {v13, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move/from16 v26, v6

    goto :goto_c

    .line 452
    .end local v6    # "pinFileHeader":Z
    .end local v7    # "dataRange":Lcom/android/apksig/Hints$ByteRange;
    .end local v41    # "outputOffset":J
    .local v5, "outputOffset":J
    .restart local v26    # "pinFileHeader":Z
    :cond_10
    move-wide/from16 v41, v5

    .line 462
    .end local v4    # "pinPattern":Lcom/android/apksig/Hints$PatternWithRange;
    .end local v5    # "outputOffset":J
    .restart local v41    # "outputOffset":J
    :cond_11
    :goto_c
    move/from16 v7, v39

    move-object/from16 v4, v40

    move-wide/from16 v5, v41

    goto :goto_b

    .line 463
    .end local v39    # "lastModifiedTimeForNewEntries":I
    .end local v40    # "outputLfrResult":Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;
    .end local v41    # "outputOffset":J
    .local v4, "outputLfrResult":Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;
    .restart local v5    # "outputOffset":J
    .local v7, "lastModifiedTimeForNewEntries":I
    :cond_12
    move-object/from16 v40, v4

    move-wide/from16 v41, v5

    move/from16 v39, v7

    .end local v4    # "outputLfrResult":Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;
    .end local v5    # "outputOffset":J
    .end local v7    # "lastModifiedTimeForNewEntries":I
    .restart local v39    # "lastModifiedTimeForNewEntries":I
    .restart local v40    # "outputLfrResult":Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;
    .restart local v41    # "outputOffset":J
    if-eqz v26, :cond_14

    .line 464
    new-instance v4, Lcom/android/apksig/Hints$ByteRange;

    invoke-direct {v4, v0, v1, v11, v12}, Lcom/android/apksig/Hints$ByteRange;-><init>(JJ)V

    invoke-interface {v13, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 449
    .end local v26    # "pinFileHeader":Z
    .end local v39    # "lastModifiedTimeForNewEntries":I
    .end local v40    # "outputLfrResult":Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;
    .end local v41    # "outputOffset":J
    .restart local v4    # "outputLfrResult":Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;
    .restart local v5    # "outputOffset":J
    .restart local v7    # "lastModifiedTimeForNewEntries":I
    :cond_13
    move-object/from16 v40, v4

    move-wide/from16 v41, v5

    move/from16 v39, v7

    .line 471
    .end local v4    # "outputLfrResult":Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;
    .end local v5    # "outputOffset":J
    .end local v7    # "lastModifiedTimeForNewEntries":I
    .restart local v39    # "lastModifiedTimeForNewEntries":I
    .restart local v40    # "outputLfrResult":Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;
    .restart local v41    # "outputOffset":J
    :cond_14
    :goto_d
    invoke-virtual {v3}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getStartOffsetInArchive()J

    move-result-wide v4

    cmp-long v4, v0, v4

    if-nez v4, :cond_15

    .line 472
    move-object v4, v9

    .local v4, "outputCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    goto :goto_e

    .line 474
    .end local v4    # "outputCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :cond_15
    nop

    .line 475
    invoke-virtual {v9, v0, v1}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->createWithModifiedLocalFileHeaderOffset(J)Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    move-result-object v4

    .line 478
    .restart local v4    # "outputCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :goto_e
    invoke-interface {v15, v14, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move/from16 v1, v38

    move/from16 v7, v39

    move-wide/from16 v26, v41

    goto :goto_f

    .line 418
    .end local v0    # "outputLocalFileHeaderOffset":J
    .end local v11    # "outputDataOffset":J
    .end local v20    # "inspectEntryRequest":Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    .end local v34    # "lastModifiedDate":I
    .end local v35    # "lastModifiedTime":I
    .end local v38    # "lastModifiedDateForNewEntries":I
    .end local v39    # "lastModifiedTimeForNewEntries":I
    .end local v40    # "outputLfrResult":Lcom/android/apksig/ApkSigner$OutputSizeAndDataOffset;
    .end local v41    # "outputOffset":J
    .local v1, "lastModifiedDateForNewEntries":I
    .local v4, "inspectEntryRequest":Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    .local v12, "lastModifiedTimeForNewEntries":I
    .local v26, "outputOffset":J
    :cond_16
    move v7, v12

    .line 480
    .end local v3    # "inputLocalFileRecord":Lcom/android/apksig/internal/zip/LocalFileRecord;
    .end local v4    # "inspectEntryRequest":Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    .end local v9    # "inputCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v10    # "entryInstructions":Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;
    .end local v12    # "lastModifiedTimeForNewEntries":I
    .end local v14    # "entryName":Ljava/lang/String;
    .end local v31    # "shouldOutput":Z
    .end local v32    # "inputLocalFileHeaderStartOffset":J
    .restart local v7    # "lastModifiedTimeForNewEntries":I
    :goto_f
    move-object/from16 v11, p2

    move-object/from16 v12, p3

    move-object v6, v8

    move-object/from16 v4, v19

    move-object/from16 v10, v21

    move-object/from16 v9, v28

    move-object/from16 v14, v29

    move-object/from16 v5, v36

    move-object/from16 v20, v37

    move v8, v1

    move-object/from16 v19, v13

    move-object/from16 v13, v30

    move-object/from16 v1, p0

    goto/16 :goto_6

    .line 406
    .end local v7    # "lastModifiedTimeForNewEntries":I
    .restart local v9    # "inputCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .restart local v10    # "entryInstructions":Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;
    .restart local v12    # "lastModifiedTimeForNewEntries":I
    .restart local v14    # "entryName":Ljava/lang/String;
    .restart local v31    # "shouldOutput":Z
    .restart local v32    # "inputLocalFileHeaderStartOffset":J
    :catch_2
    move-exception v0

    goto :goto_10

    .end local v8    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .local v20, "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    :catch_3
    move-exception v0

    move-object/from16 v8, v20

    .line 407
    .end local v20    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .local v0, "e":Lcom/android/apksig/zip/ZipFormatException;
    .restart local v8    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    :goto_10
    new-instance v3, Lcom/android/apksig/apk/ApkFormatException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Malformed ZIP entry: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v9}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 481
    .end local v0    # "e":Lcom/android/apksig/zip/ZipFormatException;
    .end local v1    # "lastModifiedDateForNewEntries":I
    .end local v9    # "inputCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v10    # "entryInstructions":Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;
    .end local v12    # "lastModifiedTimeForNewEntries":I
    .end local v29    # "inputCdRecordsSortedByLfhOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v30    # "inputZipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .end local v31    # "shouldOutput":Z
    .end local v32    # "inputLocalFileHeaderStartOffset":J
    .end local v36    # "sourceStampCertificateDigest":[B
    .end local v37    # "inputCd":Ljava/nio/ByteBuffer;
    .local v4, "inputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .local v5, "sourceStampCertificateDigest":[B
    .local v6, "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .restart local v7    # "lastModifiedTimeForNewEntries":I
    .local v8, "lastModifiedDateForNewEntries":I
    .local v13, "inputZipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .local v14, "inputCdRecordsSortedByLfhOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .local v19, "pinByteRanges":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$ByteRange;>;"
    .local v20, "inputCd":Ljava/nio/ByteBuffer;
    :cond_17
    move v0, v3

    move-object/from16 v36, v5

    move v12, v7

    move v1, v8

    move-object/from16 v30, v13

    move-object/from16 v29, v14

    move-object/from16 v13, v19

    move-object/from16 v37, v20

    const-wide/16 v17, 0x0

    move-object/from16 v19, v4

    move-object v8, v6

    .end local v4    # "inputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v5    # "sourceStampCertificateDigest":[B
    .end local v6    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .end local v7    # "lastModifiedTimeForNewEntries":I
    .end local v14    # "inputCdRecordsSortedByLfhOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v20    # "inputCd":Ljava/nio/ByteBuffer;
    .restart local v1    # "lastModifiedDateForNewEntries":I
    .local v8, "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .restart local v12    # "lastModifiedTimeForNewEntries":I
    .local v13, "pinByteRanges":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$ByteRange;>;"
    .local v19, "inputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v29    # "inputCdRecordsSortedByLfhOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .restart local v30    # "inputZipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .restart local v36    # "sourceStampCertificateDigest":[B
    .restart local v37    # "inputCd":Ljava/nio/ByteBuffer;
    invoke-interface {v8}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v31

    .line 482
    .local v31, "inputLfhSectionSize":J
    cmp-long v3, v24, v31

    if-gez v3, :cond_18

    .line 486
    sub-long v33, v31, v24

    .line 487
    .local v33, "chunkSize":J
    move-object v3, v8

    move-wide/from16 v4, v24

    move-wide/from16 v6, v33

    move-object v11, v8

    .end local v8    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .local v11, "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    move-object/from16 v8, p2

    invoke-interface/range {v3 .. v8}, Lcom/android/apksig/util/DataSource;->feed(JJLcom/android/apksig/util/DataSink;)V

    .line 488
    add-long v26, v26, v33

    .line 489
    move-wide/from16 v24, v31

    goto :goto_11

    .line 482
    .end local v11    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .end local v33    # "chunkSize":J
    .restart local v8    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    :cond_18
    move-object v11, v8

    .line 494
    .end local v8    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .restart local v11    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    :goto_11
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, 0xa

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    move-object v14, v3

    .line 495
    .local v14, "outputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_12
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 496
    .local v4, "inputCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    invoke-virtual {v4}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v5

    .line 497
    .local v5, "entryName":Ljava/lang/String;
    invoke-interface {v15, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 498
    .local v6, "outputCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    if-eqz v6, :cond_19

    .line 499
    invoke-interface {v14, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 501
    .end local v4    # "inputCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    .end local v5    # "entryName":Ljava/lang/String;
    .end local v6    # "outputCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :cond_19
    goto :goto_12

    .line 503
    :cond_1a
    if-ne v1, v0, :cond_1b

    .line 504
    const/16 v8, 0x3a21

    .line 505
    .end local v1    # "lastModifiedDateForNewEntries":I
    .local v8, "lastModifiedDateForNewEntries":I
    const/4 v7, 0x0

    move v12, v7

    move v1, v8

    .line 511
    .end local v8    # "lastModifiedDateForNewEntries":I
    .restart local v1    # "lastModifiedDateForNewEntries":I
    :cond_1b
    invoke-interface {v2}, Lcom/android/apksig/ApkSignerEngine;->isEligibleForSourceStamp()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 512
    invoke-interface {v2}, Lcom/android/apksig/ApkSignerEngine;->generateSourceStampCertificateDigest()[B

    move-result-object v0

    .line 513
    .local v0, "uncompressedData":[B
    move-object/from16 v9, p0

    iget-boolean v3, v9, Lcom/android/apksig/ApkSigner;->mForceSourceStampOverwrite:Z

    if-nez v3, :cond_1d

    if-eqz v36, :cond_1d

    .line 515
    move-object/from16 v8, v36

    .end local v36    # "sourceStampCertificateDigest":[B
    .local v8, "sourceStampCertificateDigest":[B
    invoke-static {v0, v8}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-eqz v3, :cond_1c

    goto :goto_13

    .line 526
    :cond_1c
    new-instance v3, Lcom/android/apksig/apk/ApkFormatException;

    filled-new-array {v10}, [Ljava/lang/Object;

    move-result-object v4

    .line 527
    const-string v5, "Cannot generate SourceStamp. APK contains an existing entry with the name: %s, and it is different than the provided source stamp certificate"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 513
    .end local v8    # "sourceStampCertificateDigest":[B
    .restart local v36    # "sourceStampCertificateDigest":[B
    :cond_1d
    move-object/from16 v8, v36

    .line 516
    .end local v36    # "sourceStampCertificateDigest":[B
    .restart local v8    # "sourceStampCertificateDigest":[B
    :goto_13
    const-string v3, "stamp-cert-sha256"

    .line 517
    move-object v4, v0

    move-wide/from16 v5, v26

    move-object v7, v14

    move-object/from16 v36, v8

    .end local v8    # "sourceStampCertificateDigest":[B
    .restart local v36    # "sourceStampCertificateDigest":[B
    move v8, v12

    move-object v10, v9

    move v9, v1

    move-object/from16 v20, v11

    move-object v11, v10

    .end local v11    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .local v20, "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    move-object/from16 v10, p2

    invoke-static/range {v3 .. v10}, Lcom/android/apksig/ApkSigner;->outputDataToOutputApk(Ljava/lang/String;[BJLjava/util/List;IILcom/android/apksig/util/DataSink;)J

    move-result-wide v3

    add-long v26, v26, v3

    move-wide/from16 v9, v26

    goto :goto_14

    .line 511
    .end local v0    # "uncompressedData":[B
    .end local v20    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .restart local v11    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    :cond_1e
    move-object/from16 v20, v11

    move-object/from16 v11, p0

    .end local v11    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .restart local v20    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    move-wide/from16 v9, v26

    .line 537
    .end local v26    # "outputOffset":J
    .local v9, "outputOffset":J
    :goto_14
    if-eqz v13, :cond_1f

    .line 541
    new-instance v0, Lcom/android/apksig/Hints$ByteRange;

    const-wide v3, 0x7fffffffffffffffL

    invoke-direct {v0, v9, v10, v3, v4}, Lcom/android/apksig/Hints$ByteRange;-><init>(JJ)V

    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 542
    const-string v0, "pinlist.meta"

    .line 543
    .local v0, "entryName":Ljava/lang/String;
    invoke-static {v13}, Lcom/android/apksig/Hints;->encodeByteRangeList(Ljava/util/List;)[B

    move-result-object v8

    .line 545
    .local v8, "uncompressedData":[B
    invoke-static {v2, v0, v8}, Lcom/android/apksig/ApkSigner;->requestOutputEntryInspection(Lcom/android/apksig/ApkSignerEngine;Ljava/lang/String;[B)V

    .line 546
    nop

    .line 547
    move-object v3, v0

    move-object v4, v8

    move-wide v5, v9

    move-object v7, v14

    move-object/from16 v26, v8

    .end local v8    # "uncompressedData":[B
    .local v26, "uncompressedData":[B
    move v8, v12

    move-wide/from16 v27, v9

    .end local v9    # "outputOffset":J
    .local v27, "outputOffset":J
    move v9, v1

    move-object/from16 v10, p2

    invoke-static/range {v3 .. v10}, Lcom/android/apksig/ApkSigner;->outputDataToOutputApk(Ljava/lang/String;[BJLjava/util/List;IILcom/android/apksig/util/DataSink;)J

    move-result-wide v3

    add-long v9, v27, v3

    .end local v27    # "outputOffset":J
    .restart local v9    # "outputOffset":J
    goto :goto_15

    .line 537
    .end local v0    # "entryName":Ljava/lang/String;
    .end local v26    # "uncompressedData":[B
    :cond_1f
    move-wide/from16 v27, v9

    .line 559
    :goto_15
    nop

    .line 560
    invoke-interface {v2}, Lcom/android/apksig/ApkSignerEngine;->outputJarEntries()Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest;

    move-result-object v0

    .line 561
    .local v0, "outputJarSignatureRequest":Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest;
    if-eqz v0, :cond_21

    .line 563
    invoke-interface {v0}, Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest;->getAdditionalJarEntries()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v26

    move-wide/from16 v27, v9

    .end local v9    # "outputOffset":J
    .restart local v27    # "outputOffset":J
    :goto_16
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v33, v3

    check-cast v33, Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest$JarEntry;

    .line 564
    .local v33, "entry":Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest$JarEntry;
    invoke-virtual/range {v33 .. v33}, Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest$JarEntry;->getName()Ljava/lang/String;

    move-result-object v10

    .line 565
    .local v10, "entryName":Ljava/lang/String;
    invoke-virtual/range {v33 .. v33}, Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest$JarEntry;->getData()[B

    move-result-object v9

    .line 567
    .local v9, "uncompressedData":[B
    invoke-static {v2, v10, v9}, Lcom/android/apksig/ApkSigner;->requestOutputEntryInspection(Lcom/android/apksig/ApkSignerEngine;Ljava/lang/String;[B)V

    .line 568
    nop

    .line 569
    move-object v3, v10

    move-object v4, v9

    move-wide/from16 v5, v27

    move-object v7, v14

    move v8, v12

    move-object/from16 v34, v9

    .end local v9    # "uncompressedData":[B
    .local v34, "uncompressedData":[B
    move v9, v1

    move-object/from16 v35, v10

    .end local v10    # "entryName":Ljava/lang/String;
    .local v35, "entryName":Ljava/lang/String;
    move-object/from16 v10, p2

    invoke-static/range {v3 .. v10}, Lcom/android/apksig/ApkSigner;->outputDataToOutputApk(Ljava/lang/String;[BJLjava/util/List;IILcom/android/apksig/util/DataSink;)J

    move-result-wide v3

    add-long v27, v27, v3

    .line 577
    .end local v33    # "entry":Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest$JarEntry;
    .end local v34    # "uncompressedData":[B
    .end local v35    # "entryName":Ljava/lang/String;
    goto :goto_16

    .line 578
    :cond_20
    invoke-interface {v0}, Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest;->done()V

    move-wide/from16 v9, v27

    .line 582
    .end local v27    # "outputOffset":J
    .local v9, "outputOffset":J
    :cond_21
    const-wide/16 v3, 0x0

    .line 583
    .local v3, "outputCentralDirSizeBytes":J
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move-wide v6, v3

    .end local v3    # "outputCentralDirSizeBytes":J
    .local v6, "outputCentralDirSizeBytes":J
    :goto_17
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 584
    .local v3, "record":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    invoke-virtual {v3}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getSize()I

    move-result v4

    move-object/from16 v27, v0

    move/from16 v26, v1

    .end local v0    # "outputJarSignatureRequest":Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest;
    .end local v1    # "lastModifiedDateForNewEntries":I
    .local v26, "lastModifiedDateForNewEntries":I
    .local v27, "outputJarSignatureRequest":Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest;
    int-to-long v0, v4

    add-long/2addr v6, v0

    .line 585
    .end local v3    # "record":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    move/from16 v1, v26

    move-object/from16 v0, v27

    goto :goto_17

    .line 586
    .end local v26    # "lastModifiedDateForNewEntries":I
    .end local v27    # "outputJarSignatureRequest":Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest;
    .restart local v0    # "outputJarSignatureRequest":Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest;
    .restart local v1    # "lastModifiedDateForNewEntries":I
    :cond_22
    move-object/from16 v27, v0

    move/from16 v26, v1

    .end local v0    # "outputJarSignatureRequest":Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest;
    .end local v1    # "lastModifiedDateForNewEntries":I
    .restart local v26    # "lastModifiedDateForNewEntries":I
    .restart local v27    # "outputJarSignatureRequest":Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest;
    const-wide/32 v0, 0x7fffffff

    cmp-long v0, v6, v0

    if-gtz v0, :cond_27

    .line 592
    long-to-int v0, v6

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 593
    .local v0, "outputCentralDir":Ljava/nio/ByteBuffer;
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_23

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 594
    .restart local v3    # "record":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    invoke-virtual {v3, v0}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->copyTo(Ljava/nio/ByteBuffer;)V

    .line 595
    .end local v3    # "record":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    goto :goto_18

    .line 596
    :cond_23
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 597
    new-instance v1, Lcom/android/apksig/internal/util/ByteBufferDataSource;

    invoke-direct {v1, v0}, Lcom/android/apksig/internal/util/ByteBufferDataSource;-><init>(Ljava/nio/ByteBuffer;)V

    .line 598
    .local v1, "outputCentralDirDataSource":Lcom/android/apksig/util/DataSource;
    move-wide/from16 v33, v9

    .line 599
    .local v33, "outputCentralDirStartOffset":J
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v28

    .line 605
    .local v28, "outputCentralDirRecordCount":I
    nop

    .line 607
    invoke-virtual/range {v30 .. v30}, Lcom/android/apksig/apk/ApkUtils$ZipSections;->getZipEndOfCentralDirectory()Ljava/nio/ByteBuffer;

    move-result-object v38

    .line 609
    invoke-interface {v1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v40

    .line 606
    move/from16 v39, v28

    move-wide/from16 v42, v33

    invoke-static/range {v38 .. v43}, Lcom/android/apksig/internal/zip/EocdRecord;->createWithModifiedCentralDirectoryInfo(Ljava/nio/ByteBuffer;IJJ)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 615
    .local v3, "outputEocd":Ljava/nio/ByteBuffer;
    nop

    .line 619
    invoke-static {v3}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/nio/ByteBuffer;)Lcom/android/apksig/util/DataSource;

    move-result-object v4

    .line 616
    move-object/from16 v8, p3

    invoke-interface {v2, v8, v1, v4}, Lcom/android/apksig/ApkSignerEngine;->outputZipSections2(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;

    move-result-object v4

    .line 621
    .local v4, "outputApkSigningBlockRequest":Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;
    if-eqz v4, :cond_25

    .line 622
    invoke-interface {v4}, Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;->getPaddingSizeBeforeApkSigningBlock()I

    move-result v5

    .line 623
    .local v5, "padding":I
    move-wide/from16 v38, v6

    .end local v6    # "outputCentralDirSizeBytes":J
    .local v38, "outputCentralDirSizeBytes":J
    invoke-interface {v4}, Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;->getApkSigningBlock()[B

    move-result-object v6

    .line 624
    .local v6, "outputApkSigningBlock":[B
    invoke-interface {v4}, Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;->done()V

    .line 626
    nop

    .line 628
    invoke-interface {v1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v40

    add-long v40, v33, v40

    move-wide/from16 v42, v9

    .end local v9    # "outputOffset":J
    .local v42, "outputOffset":J
    int-to-long v9, v5

    add-long v40, v40, v9

    array-length v7, v6

    int-to-long v9, v7

    add-long v40, v40, v9

    .line 631
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v7

    int-to-long v9, v7

    add-long v40, v40, v9

    .line 632
    .local v40, "fileSize":J
    iget-boolean v7, v11, Lcom/android/apksig/ApkSigner;->mAlignFileSize:Z

    if-eqz v7, :cond_24

    const-wide/16 v9, 0x1000

    rem-long v44, v40, v9

    cmp-long v7, v44, v17

    if-eqz v7, :cond_24

    .line 633
    rem-long v17, v40, v9

    sub-long v9, v9, v17

    long-to-int v7, v9

    .line 639
    .local v7, "eocdPadding":I
    invoke-static {v3, v7}, Lcom/android/apksig/internal/zip/EocdRecord;->createWithPaddedComment(Ljava/nio/ByteBuffer;I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 642
    new-instance v9, Lcom/android/apksig/internal/util/ByteBufferDataSource;

    invoke-direct {v9, v0}, Lcom/android/apksig/internal/util/ByteBufferDataSource;-><init>(Ljava/nio/ByteBuffer;)V

    .line 646
    invoke-static {v3}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/nio/ByteBuffer;)Lcom/android/apksig/util/DataSource;

    move-result-object v10

    .line 643
    invoke-interface {v2, v8, v9, v10}, Lcom/android/apksig/ApkSignerEngine;->outputZipSections2(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;

    move-result-object v4

    .line 647
    invoke-interface {v4}, Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;->getApkSigningBlock()[B

    move-result-object v6

    .line 648
    invoke-interface {v4}, Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;->done()V

    .line 651
    .end local v7    # "eocdPadding":I
    :cond_24
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v7

    move-object/from16 v9, p2

    invoke-interface {v9, v7}, Lcom/android/apksig/util/DataSink;->consume(Ljava/nio/ByteBuffer;)V

    .line 652
    const/4 v7, 0x0

    array-length v10, v6

    invoke-interface {v9, v6, v7, v10}, Lcom/android/apksig/util/DataSink;->consume([BII)V

    .line 653
    int-to-long v7, v5

    add-long v7, v33, v7

    array-length v10, v6

    move-object/from16 v18, v4

    move/from16 v17, v5

    .end local v4    # "outputApkSigningBlockRequest":Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;
    .end local v5    # "padding":I
    .local v17, "padding":I
    .local v18, "outputApkSigningBlockRequest":Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;
    int-to-long v4, v10

    add-long/2addr v7, v4

    invoke-static {v3, v7, v8}, Lcom/android/apksig/internal/zip/ZipUtils;->setZipEocdCentralDirectoryOffset(Ljava/nio/ByteBuffer;J)V

    move-object v10, v3

    goto :goto_19

    .line 621
    .end local v17    # "padding":I
    .end local v18    # "outputApkSigningBlockRequest":Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;
    .end local v38    # "outputCentralDirSizeBytes":J
    .end local v40    # "fileSize":J
    .end local v42    # "outputOffset":J
    .restart local v4    # "outputApkSigningBlockRequest":Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;
    .local v6, "outputCentralDirSizeBytes":J
    .restart local v9    # "outputOffset":J
    :cond_25
    move-wide/from16 v38, v6

    move-wide/from16 v42, v9

    move-object/from16 v9, p2

    .end local v6    # "outputCentralDirSizeBytes":J
    .end local v9    # "outputOffset":J
    .restart local v38    # "outputCentralDirSizeBytes":J
    .restart local v42    # "outputOffset":J
    move-object v10, v3

    move-object/from16 v18, v4

    .line 659
    .end local v3    # "outputEocd":Ljava/nio/ByteBuffer;
    .end local v4    # "outputApkSigningBlockRequest":Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;
    .local v10, "outputEocd":Ljava/nio/ByteBuffer;
    .restart local v18    # "outputApkSigningBlockRequest":Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;
    :goto_19
    const-wide/16 v4, 0x0

    invoke-interface {v1}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v6

    move-object v3, v1

    move-wide/from16 v46, v38

    .end local v38    # "outputCentralDirSizeBytes":J
    .local v46, "outputCentralDirSizeBytes":J
    move-object/from16 v17, v1

    move-object/from16 v1, p3

    .end local v1    # "outputCentralDirDataSource":Lcom/android/apksig/util/DataSource;
    .local v17, "outputCentralDirDataSource":Lcom/android/apksig/util/DataSource;
    move-object/from16 v8, p2

    invoke-interface/range {v3 .. v8}, Lcom/android/apksig/util/DataSource;->feed(JJLcom/android/apksig/util/DataSink;)V

    .line 660
    invoke-interface {v9, v10}, Lcom/android/apksig/util/DataSink;->consume(Ljava/nio/ByteBuffer;)V

    .line 661
    invoke-interface {v2}, Lcom/android/apksig/ApkSignerEngine;->outputDone()V

    .line 664
    iget-boolean v3, v11, Lcom/android/apksig/ApkSigner;->mV4SigningEnabled:Z

    if-eqz v3, :cond_26

    .line 665
    iget-object v3, v11, Lcom/android/apksig/ApkSigner;->mOutputV4File:Ljava/io/File;

    iget-boolean v4, v11, Lcom/android/apksig/ApkSigner;->mV4ErrorReportingEnabled:Z

    xor-int/lit8 v4, v4, 0x1

    invoke-interface {v2, v1, v3, v4}, Lcom/android/apksig/ApkSignerEngine;->signV4(Lcom/android/apksig/util/DataSource;Ljava/io/File;Z)V

    .line 667
    :cond_26
    return-void

    .line 587
    .end local v0    # "outputCentralDir":Ljava/nio/ByteBuffer;
    .end local v10    # "outputEocd":Ljava/nio/ByteBuffer;
    .end local v17    # "outputCentralDirDataSource":Lcom/android/apksig/util/DataSource;
    .end local v18    # "outputApkSigningBlockRequest":Lcom/android/apksig/ApkSignerEngine$OutputApkSigningBlockRequest2;
    .end local v28    # "outputCentralDirRecordCount":I
    .end local v33    # "outputCentralDirStartOffset":J
    .end local v42    # "outputOffset":J
    .end local v46    # "outputCentralDirSizeBytes":J
    .restart local v6    # "outputCentralDirSizeBytes":J
    .restart local v9    # "outputOffset":J
    :cond_27
    new-instance v0, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Output ZIP Central Directory too large: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " bytes"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 251
    .end local v2    # "signerEngine":Lcom/android/apksig/ApkSignerEngine;
    .end local v6    # "outputCentralDirSizeBytes":J
    .end local v9    # "outputOffset":J
    .end local v12    # "lastModifiedTimeForNewEntries":I
    .end local v13    # "pinByteRanges":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$ByteRange;>;"
    .end local v14    # "outputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v15    # "outputCdRecordsByName":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v16    # "pinPatterns":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/Hints$PatternWithRange;>;"
    .end local v19    # "inputCdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v20    # "inputApkLfhSection":Lcom/android/apksig/util/DataSource;
    .end local v21    # "inputApkSigningBlock":Lcom/android/apksig/util/DataSource;
    .end local v22    # "inputApkSigningBlockOffset":J
    .end local v24    # "inputOffset":J
    .end local v26    # "lastModifiedDateForNewEntries":I
    .end local v27    # "outputJarSignatureRequest":Lcom/android/apksig/ApkSignerEngine$OutputJarSignatureRequest;
    .end local v29    # "inputCdRecordsSortedByLfhOffset":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v30    # "inputZipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .end local v31    # "inputLfhSectionSize":J
    .end local v36    # "sourceStampCertificateDigest":[B
    .end local v37    # "inputCd":Ljava/nio/ByteBuffer;
    :catch_4
    move-exception v0

    move-object v9, v11

    move-object v11, v1

    move-object v1, v12

    move-object v2, v0

    move-object v0, v2

    .line 252
    .local v0, "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v2, Lcom/android/apksig/apk/ApkFormatException;

    const-string v3, "Malformed APK: not a ZIP archive"

    invoke-direct {v2, v3, v0}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public sign()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/InvalidKeyException;,
            Ljava/security/SignatureException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 201
    const/4 v0, 0x0

    .line 204
    .local v0, "in":Ljava/io/Closeable;
    :try_start_0
    iget-object v1, p0, Lcom/android/apksig/ApkSigner;->mInputApkDataSource:Lcom/android/apksig/util/DataSource;

    if-eqz v1, :cond_0

    .line 205
    nop

    .local v1, "inputApk":Lcom/android/apksig/util/DataSource;
    goto :goto_0

    .line 206
    .end local v1    # "inputApk":Lcom/android/apksig/util/DataSource;
    :cond_0
    iget-object v1, p0, Lcom/android/apksig/ApkSigner;->mInputApkFile:Ljava/io/File;

    if-eqz v1, :cond_6

    .line 207
    new-instance v1, Ljava/io/RandomAccessFile;

    iget-object v2, p0, Lcom/android/apksig/ApkSigner;->mInputApkFile:Ljava/io/File;

    const-string v3, "r"

    invoke-direct {v1, v2, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 208
    .local v1, "inputFile":Ljava/io/RandomAccessFile;
    move-object v0, v1

    .line 209
    invoke-static {v1}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/io/RandomAccessFile;)Lcom/android/apksig/util/DataSource;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-object v1, v2

    .line 210
    .local v1, "inputApk":Lcom/android/apksig/util/DataSource;
    nop

    .line 214
    :goto_0
    const/4 v2, 0x0

    .line 218
    .local v2, "out":Ljava/io/Closeable;
    :try_start_1
    iget-object v3, p0, Lcom/android/apksig/ApkSigner;->mOutputApkDataSink:Lcom/android/apksig/util/DataSink;

    if-eqz v3, :cond_1

    .line 219
    nop

    .line 220
    .local v3, "outputApkOut":Lcom/android/apksig/util/DataSink;
    iget-object v4, p0, Lcom/android/apksig/ApkSigner;->mOutputApkDataSource:Lcom/android/apksig/util/DataSource;

    .local v4, "outputApkIn":Lcom/android/apksig/util/DataSource;
    goto :goto_1

    .line 221
    .end local v3    # "outputApkOut":Lcom/android/apksig/util/DataSink;
    .end local v4    # "outputApkIn":Lcom/android/apksig/util/DataSource;
    :cond_1
    iget-object v3, p0, Lcom/android/apksig/ApkSigner;->mOutputApkFile:Ljava/io/File;

    if-eqz v3, :cond_4

    .line 222
    new-instance v3, Ljava/io/RandomAccessFile;

    iget-object v4, p0, Lcom/android/apksig/ApkSigner;->mOutputApkFile:Ljava/io/File;

    const-string v5, "rw"

    invoke-direct {v3, v4, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 223
    .local v3, "outputFile":Ljava/io/RandomAccessFile;
    move-object v2, v3

    .line 224
    const-wide/16 v4, 0x0

    invoke-virtual {v3, v4, v5}, Ljava/io/RandomAccessFile;->setLength(J)V

    .line 225
    invoke-static {v3}, Lcom/android/apksig/util/DataSinks;->asDataSink(Ljava/io/RandomAccessFile;)Lcom/android/apksig/util/DataSink;

    move-result-object v4

    .line 226
    .local v4, "outputApkOut":Lcom/android/apksig/util/DataSink;
    invoke-static {v3}, Lcom/android/apksig/util/DataSources;->asDataSource(Ljava/io/RandomAccessFile;)Lcom/android/apksig/util/DataSource;

    move-result-object v5

    move-object v3, v5

    .line 227
    .local v3, "outputApkIn":Lcom/android/apksig/util/DataSource;
    move-object v6, v4

    move-object v4, v3

    move-object v3, v6

    .line 231
    .local v3, "outputApkOut":Lcom/android/apksig/util/DataSink;
    .local v4, "outputApkIn":Lcom/android/apksig/util/DataSource;
    :goto_1
    invoke-direct {p0, v1, v3, v4}, Lcom/android/apksig/ApkSigner;->sign(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/util/DataSink;Lcom/android/apksig/util/DataSource;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 233
    .end local v3    # "outputApkOut":Lcom/android/apksig/util/DataSink;
    .end local v4    # "outputApkIn":Lcom/android/apksig/util/DataSource;
    if-eqz v2, :cond_2

    .line 234
    :try_start_2
    invoke-interface {v2}, Ljava/io/Closeable;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 238
    .end local v2    # "out":Ljava/io/Closeable;
    :cond_2
    if-eqz v0, :cond_3

    .line 239
    invoke-interface {v0}, Ljava/io/Closeable;->close()V

    .line 242
    :cond_3
    return-void

    .line 228
    .restart local v2    # "out":Ljava/io/Closeable;
    :cond_4
    :try_start_3
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Output APK not specified"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v0    # "in":Ljava/io/Closeable;
    .end local v1    # "inputApk":Lcom/android/apksig/util/DataSource;
    .end local v2    # "out":Ljava/io/Closeable;
    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 233
    .restart local v0    # "in":Ljava/io/Closeable;
    .restart local v1    # "inputApk":Lcom/android/apksig/util/DataSource;
    .restart local v2    # "out":Ljava/io/Closeable;
    :catchall_0
    move-exception v3

    if-eqz v2, :cond_5

    .line 234
    :try_start_4
    invoke-interface {v2}, Ljava/io/Closeable;->close()V

    .line 236
    :cond_5
    nop

    .end local v0    # "in":Ljava/io/Closeable;
    throw v3

    .line 211
    .end local v1    # "inputApk":Lcom/android/apksig/util/DataSource;
    .end local v2    # "out":Ljava/io/Closeable;
    .restart local v0    # "in":Ljava/io/Closeable;
    :cond_6
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Input APK not specified"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v0    # "in":Ljava/io/Closeable;
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 238
    .restart local v0    # "in":Ljava/io/Closeable;
    :catchall_1
    move-exception v1

    if-eqz v0, :cond_7

    .line 239
    invoke-interface {v0}, Ljava/io/Closeable;->close()V

    .line 241
    :cond_7
    throw v1
.end method
