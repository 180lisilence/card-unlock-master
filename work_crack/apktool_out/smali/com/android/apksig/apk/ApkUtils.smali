.class public abstract Lcom/android/apksig/apk/ApkUtils;
.super Ljava/lang/Object;
.source "ApkUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/apk/ApkUtils$ZipSections;,
        Lcom/android/apksig/apk/ApkUtils$ApkSigningBlock;,
        Lcom/android/apksig/apk/ApkUtils$CodenamesLazyInitializer;
    }
.end annotation


# static fields
.field public static final ANDROID_MANIFEST_ZIP_ENTRY_NAME:Ljava/lang/String; = "AndroidManifest.xml"

.field private static final DEBUGGABLE_ATTR_ID:I = 0x101000f

.field private static final MANIFEST_ELEMENT_TAG:Ljava/lang/String; = "manifest"

.field private static final MIN_SDK_VERSION_ATTR_ID:I = 0x101020c

.field public static final SOURCE_STAMP_CERTIFICATE_HASH_ZIP_ENTRY_NAME:Ljava/lang/String; = "stamp-cert-sha256"

.field private static final TARGET_SANDBOX_VERSION_ATTR_ID:I = 0x101054c

.field private static final TARGET_SDK_VERSION_ATTR_ID:I = 0x1010270

.field private static final USES_SDK_ELEMENT_TAG:Ljava/lang/String; = "uses-sdk"

.field private static final VERSION_CODE_ATTR_ID:I = 0x101021b

.field private static final VERSION_CODE_MAJOR_ATTR_ID:I = 0x1010576


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static computeSha256DigestBytes([B)[B
    .locals 1
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .line 668
    invoke-static {p0}, Lcom/android/apksig/apk/ApkUtilsLite;->computeSha256DigestBytes([B)[B

    move-result-object v0

    return-object v0
.end method

.method public static findApkSigningBlock(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/apk/ApkUtils$ApkSigningBlock;
    .locals 3
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apk"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;,
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkSigningBlockNotFoundException;
        }
    .end annotation

    .line 124
    :try_start_0
    invoke-static {p0}, Lcom/android/apksig/apk/ApkUtils;->findZipSections(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/apk/ApkUtils$ZipSections;

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    .local v0, "inputZipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    nop

    .line 128
    invoke-static {p0, v0}, Lcom/android/apksig/apk/ApkUtils;->findApkSigningBlock(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Lcom/android/apksig/apk/ApkUtils$ApkSigningBlock;

    move-result-object v1

    return-object v1

    .line 125
    .end local v0    # "inputZipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    :catch_0
    move-exception v0

    .line 126
    .local v0, "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v1, Lcom/android/apksig/apk/ApkFormatException;

    const-string v2, "Malformed APK: not a ZIP archive"

    invoke-direct {v1, v2, v0}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static findApkSigningBlock(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Lcom/android/apksig/apk/ApkUtils$ApkSigningBlock;
    .locals 5
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .param p1, "zipSections"    # Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "apk",
            "zipSections"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkSigningBlockNotFoundException;
        }
    .end annotation

    .line 142
    invoke-static {p0, p1}, Lcom/android/apksig/apk/ApkUtilsLite;->findApkSigningBlock(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/zip/ZipSections;)Lcom/android/apksig/apk/ApkUtilsLite$ApkSigningBlock;

    move-result-object v0

    .line 144
    .local v0, "apkSigningBlock":Lcom/android/apksig/apk/ApkUtilsLite$ApkSigningBlock;
    new-instance v1, Lcom/android/apksig/apk/ApkUtils$ApkSigningBlock;

    invoke-virtual {v0}, Lcom/android/apksig/apk/ApkUtilsLite$ApkSigningBlock;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {v0}, Lcom/android/apksig/apk/ApkUtilsLite$ApkSigningBlock;->getContents()Lcom/android/apksig/util/DataSource;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/android/apksig/apk/ApkUtils$ApkSigningBlock;-><init>(JLcom/android/apksig/util/DataSource;)V

    return-object v1
.end method

.method public static findZipSections(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .locals 11
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apk"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/zip/ZipFormatException;
        }
    .end annotation

    .line 60
    invoke-static {p0}, Lcom/android/apksig/apk/ApkUtilsLite;->findZipSections(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/zip/ZipSections;

    move-result-object v0

    .line 61
    .local v0, "zipSections":Lcom/android/apksig/zip/ZipSections;
    new-instance v10, Lcom/android/apksig/apk/ApkUtils$ZipSections;

    .line 62
    invoke-virtual {v0}, Lcom/android/apksig/zip/ZipSections;->getZipCentralDirectoryOffset()J

    move-result-wide v2

    .line 63
    invoke-virtual {v0}, Lcom/android/apksig/zip/ZipSections;->getZipCentralDirectorySizeBytes()J

    move-result-wide v4

    .line 64
    invoke-virtual {v0}, Lcom/android/apksig/zip/ZipSections;->getZipCentralDirectoryRecordCount()I

    move-result v6

    .line 65
    invoke-virtual {v0}, Lcom/android/apksig/zip/ZipSections;->getZipEndOfCentralDirectoryOffset()J

    move-result-wide v7

    .line 66
    invoke-virtual {v0}, Lcom/android/apksig/zip/ZipSections;->getZipEndOfCentralDirectory()Ljava/nio/ByteBuffer;

    move-result-object v9

    move-object v1, v10

    invoke-direct/range {v1 .. v9}, Lcom/android/apksig/apk/ApkUtils$ZipSections;-><init>(JJIJLjava/nio/ByteBuffer;)V

    .line 61
    return-object v10
.end method

.method public static getAndroidManifest(Lcom/android/apksig/util/DataSource;)Ljava/nio/ByteBuffer;
    .locals 7
    .param p0, "apk"    # Lcom/android/apksig/util/DataSource;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "apk"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 173
    :try_start_0
    invoke-static {p0}, Lcom/android/apksig/apk/ApkUtils;->findZipSections(Lcom/android/apksig/util/DataSource;)Lcom/android/apksig/apk/ApkUtils$ZipSections;

    move-result-object v0
    :try_end_0
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 176
    .local v0, "zipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    nop

    .line 177
    nop

    .line 178
    invoke-static {p0, v0}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;->parseZipCentralDirectory(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/apk/ApkUtils$ZipSections;)Ljava/util/List;

    move-result-object v1

    .line 179
    .local v1, "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    const/4 v2, 0x0

    .line 180
    .local v2, "androidManifestCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;

    .line 181
    .local v4, "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    const-string v5, "AndroidManifest.xml"

    invoke-virtual {v4}, Lcom/android/apksig/internal/zip/CentralDirectoryRecord;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 182
    move-object v2, v4

    .line 183
    goto :goto_1

    .line 185
    .end local v4    # "cdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :cond_0
    goto :goto_0

    .line 186
    :cond_1
    :goto_1
    if-eqz v2, :cond_2

    .line 189
    const-wide/16 v3, 0x0

    invoke-virtual {v0}, Lcom/android/apksig/apk/ApkUtils$ZipSections;->getZipCentralDirectoryOffset()J

    move-result-wide v5

    invoke-interface {p0, v3, v4, v5, v6}, Lcom/android/apksig/util/DataSource;->slice(JJ)Lcom/android/apksig/util/DataSource;

    move-result-object v3

    .line 192
    .local v3, "lfhSection":Lcom/android/apksig/util/DataSource;
    nop

    .line 194
    :try_start_1
    invoke-interface {v3}, Lcom/android/apksig/util/DataSource;->size()J

    move-result-wide v4

    .line 193
    invoke-static {v3, v2, v4, v5}, Lcom/android/apksig/internal/zip/LocalFileRecord;->getUncompressedData(Lcom/android/apksig/util/DataSource;Lcom/android/apksig/internal/zip/CentralDirectoryRecord;J)[B

    move-result-object v4

    .line 192
    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4
    :try_end_1
    .catch Lcom/android/apksig/zip/ZipFormatException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v4

    .line 195
    :catch_0
    move-exception v4

    .line 196
    .local v4, "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v5, Lcom/android/apksig/apk/ApkFormatException;

    const-string v6, "Failed to read AndroidManifest.xml"

    invoke-direct {v5, v6, v4}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 187
    .end local v3    # "lfhSection":Lcom/android/apksig/util/DataSource;
    .end local v4    # "e":Lcom/android/apksig/zip/ZipFormatException;
    :cond_2
    new-instance v3, Lcom/android/apksig/apk/ApkFormatException;

    const-string v4, "Missing AndroidManifest.xml"

    invoke-direct {v3, v4}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 174
    .end local v0    # "zipSections":Lcom/android/apksig/apk/ApkUtils$ZipSections;
    .end local v1    # "cdRecords":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/zip/CentralDirectoryRecord;>;"
    .end local v2    # "androidManifestCdRecord":Lcom/android/apksig/internal/zip/CentralDirectoryRecord;
    :catch_1
    move-exception v0

    .line 175
    .local v0, "e":Lcom/android/apksig/zip/ZipFormatException;
    new-instance v1, Lcom/android/apksig/apk/ApkFormatException;

    const-string v2, "Not a valid ZIP archive"

    invoke-direct {v1, v2, v0}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static getAttributeValueFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;Ljava/lang/String;I)I
    .locals 11
    .param p0, "androidManifestContents"    # Ljava/nio/ByteBuffer;
    .param p1, "elementName"    # Ljava/lang/String;
    .param p2, "attributeId"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "androidManifestContents",
            "elementName",
            "attributeId"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 628
    const-string v0, " under element "

    const-string v1, "0x%08X"

    if-eqz p1, :cond_3

    .line 632
    :try_start_0
    new-instance v2, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;

    invoke-direct {v2, p0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;-><init>(Ljava/nio/ByteBuffer;)V

    .line 633
    .local v2, "parser":Lcom/android/apksig/internal/apk/AndroidBinXmlParser;
    invoke-virtual {v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getEventType()I

    move-result v3

    .line 634
    .local v3, "eventType":I
    :goto_0
    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq v3, v4, :cond_2

    .line 635
    const/4 v4, 0x3

    if-ne v3, v4, :cond_1

    .line 636
    invoke-virtual {v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 637
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    invoke-virtual {v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeCount()I

    move-result v7

    if-ge v4, v7, :cond_1

    .line 638
    invoke-virtual {v2, v4}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeNameResourceId(I)I

    move-result v7

    if-ne v7, p2, :cond_0

    .line 639
    invoke-virtual {v2, v4}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeValueType(I)I

    move-result v7

    .line 640
    .local v7, "valueType":I
    packed-switch v7, :pswitch_data_0

    .line 645
    new-instance v8, Lcom/android/apksig/apk/ApkFormatException;

    goto :goto_2

    .line 643
    :pswitch_0
    invoke-virtual {v2, v4}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeIntValue(I)I

    move-result v0

    return v0

    .line 645
    :goto_2
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unsupported value type, "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", for attribute "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    new-array v6, v6, [Ljava/lang/Object;

    .line 648
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v6, v5

    .line 647
    invoke-static {v1, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v8, v5}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;)V

    .end local p0    # "androidManifestContents":Ljava/nio/ByteBuffer;
    .end local p1    # "elementName":Ljava/lang/String;
    .end local p2    # "attributeId":I
    throw v8

    .line 637
    .end local v7    # "valueType":I
    .restart local p0    # "androidManifestContents":Ljava/nio/ByteBuffer;
    .restart local p1    # "elementName":Ljava/lang/String;
    .restart local p2    # "attributeId":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 654
    .end local v4    # "i":I
    :cond_1
    invoke-virtual {v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->next()I

    move-result v4

    move v3, v4

    goto :goto_0

    .line 656
    :cond_2
    new-instance v4, Lcom/android/apksig/apk/ApkFormatException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to determine APK\'s "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " attribute "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    new-array v6, v6, [Ljava/lang/Object;

    .line 658
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v5

    invoke-static {v1, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " value"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;)V

    .end local p0    # "androidManifestContents":Ljava/nio/ByteBuffer;
    .end local p1    # "elementName":Ljava/lang/String;
    .end local p2    # "attributeId":I
    throw v4
    :try_end_0
    .catch Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 659
    .end local v2    # "parser":Lcom/android/apksig/internal/apk/AndroidBinXmlParser;
    .end local v3    # "eventType":I
    .restart local p0    # "androidManifestContents":Ljava/nio/ByteBuffer;
    .restart local p1    # "elementName":Ljava/lang/String;
    .restart local p2    # "attributeId":I
    :catch_0
    move-exception v2

    .line 660
    .local v2, "e":Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
    new-instance v3, Lcom/android/apksig/apk/ApkFormatException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to determine value for attribute "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 662
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v5}, [Ljava/lang/Object;

    move-result-object v5

    .line 661
    invoke-static {v1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; malformed binary resource: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "AndroidManifest.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0, v2}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 629
    .end local v2    # "e":Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
    :cond_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "elementName cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static getDebuggableFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;)Z
    .locals 7
    .param p0, "androidManifestContents"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "androidManifestContents"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 414
    :try_start_0
    new-instance v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;

    invoke-direct {v0, p0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;-><init>(Ljava/nio/ByteBuffer;)V

    .line 415
    .local v0, "parser":Lcom/android/apksig/internal/apk/AndroidBinXmlParser;
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getEventType()I

    move-result v1

    .line 416
    .local v1, "eventType":I
    :goto_0
    const/4 v2, 0x2

    const/4 v3, 0x0

    if-eq v1, v2, :cond_5

    .line 417
    const/4 v4, 0x3

    if-ne v1, v4, :cond_4

    .line 418
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getDepth()I

    move-result v4

    if-ne v4, v2, :cond_4

    const-string v2, "application"

    .line 419
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 420
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getNamespace()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 421
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeCount()I

    move-result v4

    if-ge v2, v4, :cond_3

    .line 422
    invoke-virtual {v0, v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeNameResourceId(I)I

    move-result v4

    const v5, 0x101000f

    if-ne v4, v5, :cond_2

    .line 423
    invoke-virtual {v0, v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeValueType(I)I

    move-result v4

    .line 424
    .local v4, "valueType":I
    packed-switch v4, :pswitch_data_0

    .line 447
    new-instance v3, Lcom/android/apksig/apk/ApkFormatException;

    goto :goto_2

    .line 439
    :pswitch_0
    new-instance v3, Lcom/android/apksig/apk/ApkFormatException;

    const-string v5, "Unable to determine whether APK is debuggable: AndroidManifest.xml\'s android:debuggable attribute references a resource. References are not supported for security reasons. Only constant boolean, string and int values are supported."

    invoke-direct {v3, v5}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;)V

    .end local p0    # "androidManifestContents":Ljava/nio/ByteBuffer;
    throw v3

    .line 428
    .restart local p0    # "androidManifestContents":Ljava/nio/ByteBuffer;
    :pswitch_1
    invoke-virtual {v0, v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeStringValue(I)Ljava/lang/String;

    move-result-object v5

    .line 429
    .local v5, "value":Ljava/lang/String;
    const-string v6, "true"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string v6, "TRUE"

    .line 430
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string v6, "1"

    .line 431
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    :cond_0
    const/4 v3, 0x1

    .line 429
    :cond_1
    return v3

    .line 447
    .end local v5    # "value":Ljava/lang/String;
    :goto_2
    const-string v5, "Unable to determine whether APK is debuggable: AndroidManifest.xml\'s android:debuggable attribute uses unsupported value type. Only boolean, string and int values are supported."

    invoke-direct {v3, v5}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;)V

    .end local p0    # "androidManifestContents":Ljava/nio/ByteBuffer;
    throw v3

    .line 421
    .end local v4    # "valueType":I
    .restart local p0    # "androidManifestContents":Ljava/nio/ByteBuffer;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 457
    .end local v2    # "i":I
    :cond_3
    return v3

    .line 459
    :cond_4
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->next()I

    move-result v2
    :try_end_0
    .catch Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException; {:try_start_0 .. :try_end_0} :catch_0

    move v1, v2

    goto :goto_0

    .line 463
    :cond_5
    return v3

    .line 464
    .end local v0    # "parser":Lcom/android/apksig/internal/apk/AndroidBinXmlParser;
    .end local v1    # "eventType":I
    :catch_0
    move-exception v0

    .line 465
    .local v0, "e":Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
    new-instance v1, Lcom/android/apksig/apk/ApkFormatException;

    const-string v2, "Unable to determine whether APK is debuggable: malformed binary resource: AndroidManifest.xml"

    invoke-direct {v1, v2, v0}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static getLongVersionCodeFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;)J
    .locals 7
    .param p0, "androidManifestContents"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "androidManifestContents"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 604
    invoke-static {p0}, Lcom/android/apksig/apk/ApkUtils;->getVersionCodeFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;)I

    move-result v0

    .line 605
    .local v0, "versionCode":I
    const-wide/16 v1, 0x0

    .line 607
    .local v1, "versionCodeMajor":J
    :try_start_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 608
    const-string v3, "manifest"

    const v4, 0x1010576

    invoke-static {p0, v3, v4}, Lcom/android/apksig/apk/ApkUtils;->getAttributeValueFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;Ljava/lang/String;I)I

    move-result v3
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_0

    int-to-long v1, v3

    .line 613
    goto :goto_0

    .line 610
    :catch_0
    move-exception v3

    .line 614
    :goto_0
    const/16 v3, 0x20

    shl-long v3, v1, v3

    int-to-long v5, v0

    or-long/2addr v3, v5

    return-wide v3
.end method

.method static getMinSdkVersionForCodename(Ljava/lang/String;)I
    .locals 8
    .param p0, "codename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "codename"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/CodenameMinSdkVersionException;
        }
    .end annotation

    .line 356
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x20

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 359
    .local v0, "firstChar":C
    :goto_0
    const/16 v1, 0x41

    if-lt v0, v1, :cond_3

    const/16 v1, 0x5a

    if-gt v0, v1, :cond_3

    .line 361
    invoke-static {}, Lcom/android/apksig/apk/ApkUtils$CodenamesLazyInitializer;->access$100()[Lcom/android/apksig/internal/util/Pair;

    move-result-object v1

    .line 362
    .local v1, "sortedCodenamesFirstCharToApiLevel":[Lcom/android/apksig/internal/util/Pair;, "[Lcom/android/apksig/internal/util/Pair<Ljava/lang/Character;Ljava/lang/Integer;>;"
    nop

    .line 365
    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/android/apksig/internal/util/Pair;->of(Ljava/lang/Object;Ljava/lang/Object;)Lcom/android/apksig/internal/util/Pair;

    move-result-object v2

    .line 366
    invoke-static {}, Lcom/android/apksig/apk/ApkUtils$CodenamesLazyInitializer;->access$200()Ljava/util/Comparator;

    move-result-object v3

    .line 363
    invoke-static {v1, v2, v3}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result v2

    .line 367
    .local v2, "searchResult":I
    if-ltz v2, :cond_1

    .line 369
    aget-object v3, v1, v2

    invoke-virtual {v3}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    return v3

    .line 374
    :cond_1
    rsub-int/lit8 v3, v2, -0x1

    .line 375
    .local v3, "insertionIndex":I
    if-nez v3, :cond_2

    .line 377
    const/4 v4, 0x1

    return v4

    .line 381
    :cond_2
    add-int/lit8 v4, v3, -0x1

    aget-object v4, v1, v4

    .line 383
    .local v4, "newestOlderCodenameMapping":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/Character;Ljava/lang/Integer;>;"
    invoke-virtual {v4}, Lcom/android/apksig/internal/util/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Character;

    invoke-virtual {v5}, Ljava/lang/Character;->charValue()C

    move-result v5

    .line 384
    .local v5, "newestOlderCodenameFirstChar":C
    invoke-virtual {v4}, Lcom/android/apksig/internal/util/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 385
    .local v6, "newestOlderCodenameApiLevel":I
    sub-int v7, v0, v5

    add-int/2addr v7, v6

    return v7

    .line 389
    .end local v1    # "sortedCodenamesFirstCharToApiLevel":[Lcom/android/apksig/internal/util/Pair;, "[Lcom/android/apksig/internal/util/Pair<Ljava/lang/Character;Ljava/lang/Integer;>;"
    .end local v2    # "searchResult":I
    .end local v3    # "insertionIndex":I
    .end local v4    # "newestOlderCodenameMapping":Lcom/android/apksig/internal/util/Pair;, "Lcom/android/apksig/internal/util/Pair<Ljava/lang/Character;Ljava/lang/Integer;>;"
    .end local v5    # "newestOlderCodenameFirstChar":C
    .end local v6    # "newestOlderCodenameApiLevel":I
    :cond_3
    new-instance v1, Lcom/android/apksig/apk/CodenameMinSdkVersionException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to determine APK\'s minimum supported Android platform version : Unsupported codename in AndroidManifest.xml\'s minSdkVersion: \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p0}, Lcom/android/apksig/apk/CodenameMinSdkVersionException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v1
.end method

.method public static getMinSdkVersionFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;)I
    .locals 8
    .param p0, "androidManifestContents"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "androidManifestContents"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/MinSdkVersionException;
        }
    .end annotation

    .line 256
    const/4 v0, 0x1

    .line 258
    .local v0, "result":I
    :try_start_0
    new-instance v1, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;

    invoke-direct {v1, p0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;-><init>(Ljava/nio/ByteBuffer;)V

    .line 259
    .local v1, "parser":Lcom/android/apksig/internal/apk/AndroidBinXmlParser;
    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getEventType()I

    move-result v2

    .line 260
    .local v2, "eventType":I
    :goto_0
    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    .line 261
    const/4 v4, 0x3

    if-ne v2, v4, :cond_2

    .line 262
    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getDepth()I

    move-result v4

    if-ne v4, v3, :cond_2

    const-string v3, "uses-sdk"

    .line 263
    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 264
    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getNamespace()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 266
    const/4 v3, 0x1

    .line 267
    .local v3, "minSdkVersion":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeCount()I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 268
    invoke-virtual {v1, v4}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeNameResourceId(I)I

    move-result v5

    const v6, 0x101020c

    if-ne v5, v6, :cond_0

    .line 269
    invoke-virtual {v1, v4}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeValueType(I)I

    move-result v5

    .line 270
    .local v5, "valueType":I
    packed-switch v5, :pswitch_data_0

    .line 280
    new-instance v6, Lcom/android/apksig/apk/MinSdkVersionException;

    goto :goto_2

    .line 272
    :pswitch_0
    invoke-virtual {v1, v4}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeIntValue(I)I

    move-result v6

    move v3, v6

    .line 273
    goto :goto_3

    .line 275
    :pswitch_1
    nop

    .line 277
    invoke-virtual {v1, v4}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeStringValue(I)Ljava/lang/String;

    move-result-object v6

    .line 276
    invoke-static {v6}, Lcom/android/apksig/apk/ApkUtils;->getMinSdkVersionForCodename(Ljava/lang/String;)I

    move-result v6

    move v3, v6

    .line 278
    goto :goto_3

    .line 280
    :goto_2
    const-string v7, "Unable to determine APK\'s minimum supported Android: unsupported value type in AndroidManifest.xml\'s minSdkVersion. Only integer values supported."

    invoke-direct {v6, v7}, Lcom/android/apksig/apk/MinSdkVersionException;-><init>(Ljava/lang/String;)V

    .end local p0    # "androidManifestContents":Ljava/nio/ByteBuffer;
    throw v6

    .line 267
    .end local v5    # "valueType":I
    .restart local p0    # "androidManifestContents":Ljava/nio/ByteBuffer;
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 290
    .end local v4    # "i":I
    :cond_1
    :goto_3
    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v4

    move v0, v4

    .line 292
    .end local v3    # "minSdkVersion":I
    :cond_2
    invoke-virtual {v1}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->next()I

    move-result v3
    :try_end_0
    .catch Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v3

    goto :goto_0

    .line 295
    :cond_3
    return v0

    .line 296
    .end local v0    # "result":I
    .end local v1    # "parser":Lcom/android/apksig/internal/apk/AndroidBinXmlParser;
    .end local v2    # "eventType":I
    :catch_0
    move-exception v0

    .line 297
    .local v0, "e":Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
    new-instance v1, Lcom/android/apksig/apk/MinSdkVersionException;

    const-string v2, "Unable to determine APK\'s minimum supported Android platform version: malformed binary resource: AndroidManifest.xml"

    invoke-direct {v1, v2, v0}, Lcom/android/apksig/apk/MinSdkVersionException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getPackageNameFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;)Ljava/lang/String;
    .locals 6
    .param p0, "androidManifestContents"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "androidManifestContents"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 489
    :try_start_0
    new-instance v0, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;

    invoke-direct {v0, p0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;-><init>(Ljava/nio/ByteBuffer;)V

    .line 490
    .local v0, "parser":Lcom/android/apksig/internal/apk/AndroidBinXmlParser;
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getEventType()I

    move-result v1

    .line 491
    .local v1, "eventType":I
    :goto_0
    const/4 v2, 0x2

    const/4 v3, 0x0

    if-eq v1, v2, :cond_3

    .line 492
    const/4 v2, 0x3

    if-ne v1, v2, :cond_2

    .line 493
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getDepth()I

    move-result v2

    const/4 v4, 0x1

    if-ne v2, v4, :cond_2

    const-string v2, "manifest"

    .line 494
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 495
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getNamespace()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 496
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeCount()I

    move-result v4

    if-ge v2, v4, :cond_1

    .line 497
    const-string v4, "package"

    invoke-virtual {v0, v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 498
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getNamespace()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 499
    invoke-virtual {v0, v2}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->getAttributeStringValue(I)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 496
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 503
    .end local v2    # "i":I
    :cond_1
    return-object v3

    .line 505
    :cond_2
    invoke-virtual {v0}, Lcom/android/apksig/internal/apk/AndroidBinXmlParser;->next()I

    move-result v2
    :try_end_0
    .catch Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException; {:try_start_0 .. :try_end_0} :catch_0

    move v1, v2

    goto :goto_0

    .line 509
    :cond_3
    return-object v3

    .line 510
    .end local v0    # "parser":Lcom/android/apksig/internal/apk/AndroidBinXmlParser;
    .end local v1    # "eventType":I
    :catch_0
    move-exception v0

    .line 511
    .local v0, "e":Lcom/android/apksig/internal/apk/AndroidBinXmlParser$XmlParserException;
    new-instance v1, Lcom/android/apksig/apk/ApkFormatException;

    const-string v2, "Unable to determine APK package name: malformed binary resource: AndroidManifest.xml"

    invoke-direct {v1, v2, v0}, Lcom/android/apksig/apk/ApkFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static getTargetSandboxVersionFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;)I
    .locals 2
    .param p0, "androidManifestContents"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "androidManifestContents"
        }
    .end annotation

    .line 531
    :try_start_0
    const-string v0, "manifest"

    const v1, 0x101054c

    invoke-static {p0, v0, v1}, Lcom/android/apksig/apk/ApkUtils;->getAttributeValueFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;Ljava/lang/String;I)I

    move-result v0
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 533
    :catch_0
    move-exception v0

    .line 536
    .local v0, "e":Lcom/android/apksig/apk/ApkFormatException;
    const/4 v1, 0x1

    return v1
.end method

.method public static getTargetSdkVersionFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;)I
    .locals 3
    .param p0, "androidManifestContents"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "androidManifestContents"
        }
    .end annotation

    .line 553
    const/4 v0, 0x1

    .line 555
    .local v0, "minSdkVersion":I
    :try_start_0
    const-string v1, "uses-sdk"

    const v2, 0x1010270

    invoke-static {p0, v1, v2}, Lcom/android/apksig/apk/ApkUtils;->getAttributeValueFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;Ljava/lang/String;I)I

    move-result v1
    :try_end_0
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 557
    :catch_0
    move-exception v1

    .line 561
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 563
    :try_start_1
    invoke-static {p0}, Lcom/android/apksig/apk/ApkUtils;->getMinSdkVersionFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;)I

    move-result v1
    :try_end_1
    .catch Lcom/android/apksig/apk/ApkFormatException; {:try_start_1 .. :try_end_1} :catch_1

    move v0, v1

    .line 567
    goto :goto_0

    .line 564
    :catch_1
    move-exception v1

    .line 568
    :goto_0
    return v0
.end method

.method public static getVersionCodeFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;)I
    .locals 2
    .param p0, "androidManifestContents"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "androidManifestContents"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/apk/ApkFormatException;
        }
    .end annotation

    .line 584
    const-string v0, "manifest"

    const v1, 0x101021b

    invoke-static {p0, v0, v1}, Lcom/android/apksig/apk/ApkUtils;->getAttributeValueFromBinaryAndroidManifest(Ljava/nio/ByteBuffer;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static setZipEocdCentralDirectoryOffset(Ljava/nio/ByteBuffer;J)V
    .locals 2
    .param p0, "zipEndOfCentralDirectory"    # Ljava/nio/ByteBuffer;
    .param p1, "offset"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "zipEndOfCentralDirectory",
            "offset"
        }
    .end annotation

    .line 94
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 95
    .local v0, "eocd":Ljava/nio/ByteBuffer;
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 96
    invoke-static {v0, p1, p2}, Lcom/android/apksig/internal/zip/ZipUtils;->setZipEocdCentralDirectoryOffset(Ljava/nio/ByteBuffer;J)V

    .line 97
    return-void
.end method

.method public static updateZipEocdCommentLen(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p0, "zipEndOfCentralDirectory"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "zipEndOfCentralDirectory"
        }
    .end annotation

    .line 105
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 106
    .local v0, "eocd":Ljava/nio/ByteBuffer;
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 107
    invoke-static {v0}, Lcom/android/apksig/internal/zip/ZipUtils;->updateZipEocdCommentLen(Ljava/nio/ByteBuffer;)V

    .line 108
    return-void
.end method
