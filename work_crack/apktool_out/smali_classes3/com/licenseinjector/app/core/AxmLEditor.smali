.class public final Lcom/licenseinjector/app/core/AxmLEditor;
.super Ljava/lang/Object;
.source "AxmLEditor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;,
        Lcom/licenseinjector/app/core/AxmLEditor$Entry;,
        Lcom/licenseinjector/app/core/AxmLEditor$Attr;
    }
.end annotation


# static fields
.field private static final CHUNK_END_EL:I = 0x103

.field private static final CHUNK_RES_MAP:I = 0x180

.field private static final CHUNK_START_EL:I = 0x102

.field private static final CHUNK_START_NS:I = 0x100

.field private static final CHUNK_STRING_POOL:I = 0x1

.field private static final CHUNK_XML:I = 0x3

.field private static final NO_INDEX:I = -0x1

.field static final RES_EXPORTED:I = 0x1010010

.field static final RES_NAME:I = 0x1010003

.field private static final TYPE_INT_BOOL:I = 0x12

.field private static final TYPE_INT_DEC:I = 0x10

.field private static final TYPE_INT_HEX:I = 0x11

.field private static final TYPE_STRING:I = 0x3

.field private static final UTF_16LE:Ljava/nio/charset/Charset;

.field private static final UTF_8:Ljava/nio/charset/Charset;


# instance fields
.field private androidNsIndex:I

.field public discoveredLauncher:Ljava/lang/String;

.field public downgradedLaunchers:Ljava/lang/String;

.field private pkgName:Ljava/lang/String;

.field private pkgParsed:Z

.field private resMap:[I

.field private final resMapAdds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[I>;"
        }
    .end annotation
.end field

.field private resMapOff:I

.field private resMapSize:I

.field public resolvedEntry:Ljava/lang/String;

.field private final src:[B

.field private stringCount:I

.field private final stringIndex:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private stringOffsets:[I

.field private stringPoolOff:I

.field private stringPoolSize:I

.field private final strings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private stringsStart:I

.field private utf8Pool:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    const-string v0, "UTF-16LE"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/licenseinjector/app/core/AxmLEditor;->UTF_16LE:Ljava/nio/charset/Charset;

    .line 28
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/licenseinjector/app/core/AxmLEditor;->UTF_8:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>([B)V
    .locals 2
    .param p1, "manifest"    # [B

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, -0x1

    iput v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapOff:I

    .line 42
    const/4 v1, 0x0

    iput v1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapSize:I

    .line 43
    new-array v1, v1, [I

    iput-object v1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMap:[I

    .line 44
    iput v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->androidNsIndex:I

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringIndex:Ljava/util/Map;

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapAdds:Ljava/util/List;

    .line 130
    iput-object p1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    .line 131
    invoke-direct {p0}, Lcom/licenseinjector/app/core/AxmLEditor;->parse()V

    .line 132
    return-void
.end method

.method private static addAcc(Ljava/util/List;Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;)V
    .locals 4
    .param p1, "e"    # Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;",
            ">;",
            "Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;",
            ")V"
        }
    .end annotation

    .line 631
    .local p0, "out":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;

    .line 632
    .local v1, "x":Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;
    iget-object v2, v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 633
    iget-boolean v0, v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->launcher:Z

    iget-boolean v2, p1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->launcher:Z

    or-int/2addr v0, v2

    iput-boolean v0, v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->launcher:Z

    .line 634
    iget-boolean v0, v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->main:Z

    iget-boolean v2, p1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->main:Z

    or-int/2addr v0, v2

    iput-boolean v0, v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->main:Z

    .line 635
    iget-boolean v0, v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->alias:Z

    iget-boolean v2, p1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->alias:Z

    or-int/2addr v0, v2

    iput-boolean v0, v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->alias:Z

    .line 636
    iget-boolean v0, v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->noHistory:Z

    iget-boolean v2, p1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->noHistory:Z

    or-int/2addr v0, v2

    iput-boolean v0, v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->noHistory:Z

    .line 637
    iget-object v0, v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->target:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 638
    iget-object v0, p1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->target:Ljava/lang/String;

    iput-object v0, v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->target:Ljava/lang/String;

    .line 640
    :cond_0
    iget-object v0, v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->launchMode:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 641
    iget-object v0, p1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->launchMode:Ljava/lang/String;

    iput-object v0, v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->launchMode:Ljava/lang/String;

    .line 643
    :cond_1
    iget-object v0, v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->process:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 644
    iget-object v0, p1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->process:Ljava/lang/String;

    iput-object v0, v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->process:Ljava/lang/String;

    .line 645
    return-void

    .line 647
    :cond_2
    return-void

    .line 649
    .end local v1    # "x":Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;
    :cond_3
    goto :goto_0

    .line 650
    :cond_4
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 651
    return-void
.end method

.method private static append(Ljava/io/ByteArrayOutputStream;[B)V
    .locals 2
    .param p0, "b"    # Ljava/io/ByteArrayOutputStream;
    .param p1, "d"    # [B

    .line 1085
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 1086
    return-void
.end method

.method private appendDuplicate(Ljava/lang/String;)I
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .line 250
    iget-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 251
    .local v0, "idx":I
    iget-object v1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 252
    return v0
.end method

.method private attrNameIndex(Ljava/lang/String;I)I
    .locals 5
    .param p1, "local"    # Ljava/lang/String;
    .param p2, "resId"    # I

    .line 232
    iget-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringIndex:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 233
    .local v0, "i2":Ljava/lang/Integer;
    if-eqz v0, :cond_1

    .line 234
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 235
    .local v1, "idx":I
    iget-object v2, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMap:[I

    .line 236
    .local v2, "iArr":[I
    array-length v3, v2

    if-ge v1, v3, :cond_0

    aget v3, v2, v1

    move v4, v3

    .local v4, "i":I
    if-eqz v3, :cond_0

    if-eq v4, p2, :cond_0

    .line 237
    invoke-direct {p0, p1}, Lcom/licenseinjector/app/core/AxmLEditor;->appendDuplicate(Ljava/lang/String;)I

    move-result v1

    .line 239
    .end local v4    # "i":I
    :cond_0
    invoke-direct {p0, v1, p2}, Lcom/licenseinjector/app/core/AxmLEditor;->ensureResMap(II)V

    .line 240
    return v1

    .line 242
    .end local v1    # "idx":I
    .end local v2    # "iArr":[I
    :cond_1
    iget-object v1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .line 243
    .local v1, "idx2":I
    iget-object v2, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 244
    iget-object v2, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringIndex:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    invoke-direct {p0, v1, p2}, Lcom/licenseinjector/app/core/AxmLEditor;->ensureResMap(II)V

    .line 246
    return v1
.end method

.method private buildActivityTree(IIIIIIIIII)[B
    .locals 16
    .param p1, "nsAndroid"    # I
    .param p2, "nameActivity"    # I
    .param p3, "nameIntentFilter"    # I
    .param p4, "nameAction"    # I
    .param p5, "nameCategory"    # I
    .param p6, "attrName"    # I
    .param p7, "attrExported"    # I
    .param p8, "vActivity"    # I
    .param p9, "vMain"    # I
    .param p10, "vLauncher"    # I

    .line 1065
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    new-instance v7, Ljava/io/ByteArrayOutputStream;

    const/16 v8, 0x100

    invoke-direct {v7, v8}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 1066
    .local v7, "b":Ljava/io/ByteArrayOutputStream;
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 1067
    .local v8, "actAttrs":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$Attr;>;"
    new-instance v9, Lcom/licenseinjector/app/core/AxmLEditor$Attr;

    const/4 v10, 0x3

    move/from16 v11, p8

    invoke-direct {v9, v1, v6, v10, v11}, Lcom/licenseinjector/app/core/AxmLEditor$Attr;-><init>(IIII)V

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1068
    new-instance v9, Lcom/licenseinjector/app/core/AxmLEditor$Attr;

    const/16 v12, 0x12

    const/4 v13, -0x1

    move/from16 v14, p7

    invoke-direct {v9, v1, v14, v12, v13}, Lcom/licenseinjector/app/core/AxmLEditor$Attr;-><init>(IIII)V

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1069
    invoke-direct {v0, v2, v8}, Lcom/licenseinjector/app/core/AxmLEditor;->startElement(ILjava/util/List;)[B

    move-result-object v9

    invoke-static {v7, v9}, Lcom/licenseinjector/app/core/AxmLEditor;->append(Ljava/io/ByteArrayOutputStream;[B)V

    .line 1070
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v0, v3, v9}, Lcom/licenseinjector/app/core/AxmLEditor;->startElement(ILjava/util/List;)[B

    move-result-object v9

    invoke-static {v7, v9}, Lcom/licenseinjector/app/core/AxmLEditor;->append(Ljava/io/ByteArrayOutputStream;[B)V

    .line 1071
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 1072
    .local v9, "a1":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$Attr;>;"
    new-instance v12, Lcom/licenseinjector/app/core/AxmLEditor$Attr;

    move/from16 v13, p9

    invoke-direct {v12, v1, v6, v10, v13}, Lcom/licenseinjector/app/core/AxmLEditor$Attr;-><init>(IIII)V

    invoke-interface {v9, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1073
    invoke-direct {v0, v4, v9}, Lcom/licenseinjector/app/core/AxmLEditor;->startElement(ILjava/util/List;)[B

    move-result-object v12

    invoke-static {v7, v12}, Lcom/licenseinjector/app/core/AxmLEditor;->append(Ljava/io/ByteArrayOutputStream;[B)V

    .line 1074
    invoke-direct {v0, v4}, Lcom/licenseinjector/app/core/AxmLEditor;->endElement(I)[B

    move-result-object v12

    invoke-static {v7, v12}, Lcom/licenseinjector/app/core/AxmLEditor;->append(Ljava/io/ByteArrayOutputStream;[B)V

    .line 1075
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 1076
    .local v12, "a2":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$Attr;>;"
    new-instance v15, Lcom/licenseinjector/app/core/AxmLEditor$Attr;

    move/from16 v4, p10

    invoke-direct {v15, v1, v6, v10, v4}, Lcom/licenseinjector/app/core/AxmLEditor$Attr;-><init>(IIII)V

    invoke-interface {v12, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1077
    invoke-direct {v0, v5, v12}, Lcom/licenseinjector/app/core/AxmLEditor;->startElement(ILjava/util/List;)[B

    move-result-object v10

    invoke-static {v7, v10}, Lcom/licenseinjector/app/core/AxmLEditor;->append(Ljava/io/ByteArrayOutputStream;[B)V

    .line 1078
    invoke-direct {v0, v5}, Lcom/licenseinjector/app/core/AxmLEditor;->endElement(I)[B

    move-result-object v10

    invoke-static {v7, v10}, Lcom/licenseinjector/app/core/AxmLEditor;->append(Ljava/io/ByteArrayOutputStream;[B)V

    .line 1079
    invoke-direct {v0, v3}, Lcom/licenseinjector/app/core/AxmLEditor;->endElement(I)[B

    move-result-object v10

    invoke-static {v7, v10}, Lcom/licenseinjector/app/core/AxmLEditor;->append(Ljava/io/ByteArrayOutputStream;[B)V

    .line 1080
    invoke-direct {v0, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->endElement(I)[B

    move-result-object v10

    invoke-static {v7, v10}, Lcom/licenseinjector/app/core/AxmLEditor;->append(Ljava/io/ByteArrayOutputStream;[B)V

    .line 1081
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v10

    return-object v10
.end method

.method private buildResMap()[B
    .locals 12

    .line 1166
    iget-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMap:[I

    array-length v0, v0

    .line 1167
    .local v0, "len":I
    iget-object v1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapAdds:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 1169
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<[I>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_3

    .line 1170
    nop

    .line 1174
    const/16 v2, 0x180

    const/16 v5, 0x8

    if-nez v0, :cond_0

    .line 1175
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3, v5}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 1176
    .local v3, "empty":Ljava/io/ByteArrayOutputStream;
    invoke-static {v3, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1177
    invoke-static {v3, v5}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1178
    invoke-static {v3, v5}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1179
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2

    .line 1181
    .end local v3    # "empty":Ljava/io/ByteArrayOutputStream;
    :cond_0
    new-array v6, v0, [I

    .line 1182
    .local v6, "work":[I
    iget-object v7, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMap:[I

    .line 1183
    .local v7, "iArr":[I
    array-length v8, v7

    invoke-static {v7, v4, v6, v4, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1184
    iget-object v8, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapAdds:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [I

    .line 1185
    .local v9, "p":[I
    aget v10, v9, v4

    aget v11, v9, v3

    invoke-static {v6, v10, v11}, Lcom/licenseinjector/app/core/AxmLEditor;->setAt([III)[I

    .line 1186
    .end local v9    # "p":[I
    goto :goto_1

    .line 1187
    :cond_1
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    mul-int/lit8 v8, v0, 0x4

    add-int/2addr v8, v5

    invoke-direct {v3, v8}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 1188
    .local v3, "b":Ljava/io/ByteArrayOutputStream;
    invoke-static {v3, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1189
    invoke-static {v3, v5}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1190
    mul-int/lit8 v2, v0, 0x4

    add-int/2addr v2, v5

    invoke-static {v3, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1191
    array-length v2, v6

    :goto_2
    if-ge v4, v2, :cond_2

    aget v5, v6, v4

    .line 1192
    .local v5, "v":I
    invoke-static {v3, v5}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1191
    .end local v5    # "v":I
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 1194
    :cond_2
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2

    .line 1172
    .end local v3    # "b":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "work":[I
    .end local v7    # "iArr":[I
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [I

    aget v2, v2, v4

    add-int/2addr v2, v3

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    goto :goto_0
.end method

.method private buildStringPool()[B
    .locals 11

    .line 1130
    iget-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 1131
    .local v0, "count":I
    mul-int/lit8 v1, v0, 0x4

    const/16 v2, 0x1c

    add-int/2addr v1, v2

    .line 1132
    .local v1, "stringsStartNew":I
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1133
    .local v3, "data":Ljava/io/ByteArrayOutputStream;
    new-array v4, v0, [I

    .line 1134
    .local v4, "offs":[I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    const/4 v6, 0x0

    if-ge v5, v0, :cond_0

    .line 1135
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v7

    aput v7, v4, v5

    .line 1136
    iget-object v7, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    sget-object v8, Lcom/licenseinjector/app/core/AxmLEditor;->UTF_16LE:Ljava/nio/charset/Charset;

    invoke-virtual {v7, v8}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v7

    .line 1137
    .local v7, "u":[B
    array-length v8, v7

    div-int/lit8 v8, v8, 0x2

    invoke-static {v3, v8}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1138
    array-length v8, v7

    invoke-virtual {v3, v7, v6, v8}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 1139
    invoke-static {v3, v6}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1134
    .end local v7    # "u":[B
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 1141
    .end local v5    # "i":I
    :cond_0
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    .line 1142
    .local v5, "strData":[B
    array-length v7, v5

    add-int/2addr v7, v1

    .line 1143
    .local v7, "total":I
    rem-int/lit8 v8, v7, 0x4

    rsub-int/lit8 v8, v8, 0x4

    rem-int/lit8 v8, v8, 0x4

    .line 1144
    .local v8, "pad":I
    new-instance v9, Ljava/io/ByteArrayOutputStream;

    add-int v10, v7, v8

    invoke-direct {v9, v10}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 1145
    .local v9, "b":Ljava/io/ByteArrayOutputStream;
    const/4 v10, 0x1

    invoke-static {v9, v10}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1146
    invoke-static {v9, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1147
    add-int v2, v7, v8

    invoke-static {v9, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1148
    invoke-static {v9, v0}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1149
    invoke-static {v9, v6}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1150
    invoke-static {v9, v6}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1151
    invoke-static {v9, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1152
    invoke-static {v9, v6}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1153
    const/4 v2, 0x0

    .local v2, "i2":I
    :goto_1
    if-ge v2, v0, :cond_1

    .line 1154
    aget v10, v4, v2

    invoke-static {v9, v10}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1153
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1156
    .end local v2    # "i2":I
    :cond_1
    array-length v2, v5

    .line 1157
    .local v2, "i3":I
    invoke-virtual {v9, v5, v6, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 1158
    const/4 v10, 0x0

    .local v10, "i4":I
    :goto_2
    if-ge v10, v8, :cond_2

    .line 1159
    invoke-virtual {v9, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1158
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 1161
    .end local v10    # "i4":I
    :cond_2
    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    return-object v6
.end method

.method private csvContains(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p1, "csv"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .line 1052
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    if-nez p2, :cond_0

    goto :goto_1

    .line 1055
    :cond_0
    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 1056
    .local v1, "parts":[Ljava/lang/String;
    array-length v2, v1

    move v3, v0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    .line 1057
    .local v4, "str":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, p2, v5}, Lcom/licenseinjector/app/core/AxmLEditor;->sameClass(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1058
    const/4 v0, 0x1

    return v0

    .line 1056
    .end local v4    # "str":Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1061
    :cond_2
    return v0

    .line 1053
    .end local v1    # "parts":[Ljava/lang/String;
    :cond_3
    :goto_1
    return v0
.end method

.method private endElement(I)[B
    .locals 3
    .param p1, "nameIdx"    # I

    .line 1118
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 1119
    .local v0, "b":Ljava/io/ByteArrayOutputStream;
    const/16 v2, 0x103

    invoke-static {v0, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1120
    const/16 v2, 0x10

    invoke-static {v0, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1121
    invoke-static {v0, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1122
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1123
    const/4 v1, -0x1

    invoke-static {v0, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1124
    invoke-static {v0, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1125
    invoke-static {v0, p1}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1126
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method private ensureAndroidNs()I
    .locals 2

    .line 275
    iget v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->androidNsIndex:I

    .line 276
    .local v0, "i":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 277
    iget v1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->androidNsIndex:I

    return v1

    .line 279
    :cond_0
    const-string v1, "http://schemas.android.com/apk/res/android"

    invoke-direct {p0, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->valueIndex(Ljava/lang/String;)I

    move-result v1

    .line 280
    .local v1, "idx":I
    iput v1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->androidNsIndex:I

    .line 281
    return v1
.end method

.method private ensureResMap(II)V
    .locals 3
    .param p1, "idx"    # I
    .param p2, "resId"    # I

    .line 256
    iget-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMap:[I

    .line 257
    .local v0, "iArr":[I
    array-length v1, v0

    if-ge p1, v1, :cond_0

    aget v1, v0, p1

    if-nez v1, :cond_0

    .line 258
    invoke-static {v0, p1, p2}, Lcom/licenseinjector/app/core/AxmLEditor;->setAt([III)[I

    move-result-object v1

    iput-object v1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMap:[I

    .line 260
    :cond_0
    iget-object v1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapAdds:Ljava/util/List;

    filled-new-array {p1, p2}, [I

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    return-void
.end method

.method private static launchModeName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "raw"    # Ljava/lang/String;

    .line 569
    if-nez p0, :cond_0

    .line 570
    const/4 v0, 0x0

    return-object v0

    .line 572
    :cond_0
    const-string v0, "0"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "standard"

    if-nez v0, :cond_8

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_3

    .line 575
    :cond_1
    const-string v0, "1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "singleTop"

    if-nez v0, :cond_7

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_2

    .line 578
    :cond_2
    const-string v0, "2"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "singleTask"

    if-nez v0, :cond_6

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_1

    .line 581
    :cond_3
    const-string v0, "3"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "singleInstance"

    if-nez v0, :cond_5

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_0

    :cond_4
    move-object v1, p0

    :cond_5
    :goto_0
    return-object v1

    .line 579
    :cond_6
    :goto_1
    return-object v1

    .line 576
    :cond_7
    :goto_2
    return-object v1

    .line 573
    :cond_8
    :goto_3
    return-object v1
.end method

.method private nameIndex(Ljava/lang/String;)I
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .line 227
    invoke-direct {p0, p1}, Lcom/licenseinjector/app/core/AxmLEditor;->valueIndex(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private packageName()Ljava/lang/String;
    .locals 21

    .line 50
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/licenseinjector/app/core/AxmLEditor;->pkgParsed:Z

    if-eqz v1, :cond_0

    .line 51
    iget-object v1, v0, Lcom/licenseinjector/app/core/AxmLEditor;->pkgName:Ljava/lang/String;

    return-object v1

    .line 53
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/licenseinjector/app/core/AxmLEditor;->pkgParsed:Z

    .line 54
    iget-object v1, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    const-string v2, "package"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 55
    .local v1, "idx":I
    if-ltz v1, :cond_9

    .line 56
    iget v3, v0, Lcom/licenseinjector/app/core/AxmLEditor;->stringPoolOff:I

    iget v4, v0, Lcom/licenseinjector/app/core/AxmLEditor;->stringPoolSize:I

    add-int/2addr v3, v4

    .line 57
    .local v3, "i":I
    iget v4, v0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapOff:I

    .line 58
    .local v4, "i2":I
    if-ltz v4, :cond_1

    iget v5, v0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapSize:I

    add-int/2addr v5, v4

    goto :goto_0

    :cond_1
    const/4 v5, 0x0

    :goto_0
    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 59
    .local v5, "endHeaders":I
    move v6, v5

    .line 60
    .local v6, "off":I
    :goto_1
    add-int/lit8 v7, v6, 0x8

    iget-object v8, v0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    array-length v8, v8

    if-gt v7, v8, :cond_8

    .line 61
    invoke-direct {v0, v6}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v7

    .line 62
    .local v7, "ct":I
    add-int/lit8 v8, v6, 0x4

    invoke-direct {v0, v8}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v8

    long-to-int v8, v8

    .line 63
    .local v8, "csz":I
    if-gtz v8, :cond_2

    .line 64
    move/from16 v16, v3

    move/from16 v17, v4

    const/4 v2, 0x0

    goto/16 :goto_4

    .line 66
    :cond_2
    const/16 v9, 0x102

    if-ne v7, v9, :cond_7

    .line 67
    add-int/lit8 v9, v6, 0x2

    invoke-direct {v0, v9}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v9

    .line 68
    .local v9, "hsz":I
    add-int/lit8 v10, v6, 0x18

    invoke-direct {v0, v10}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v10

    .line 69
    .local v10, "aStart":I
    add-int/lit8 v11, v6, 0x1c

    invoke-direct {v0, v11}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v11

    .line 70
    .local v11, "aCount":I
    add-int v12, v6, v9

    add-int/2addr v12, v10

    .line 71
    .local v12, "p":I
    const/4 v13, 0x0

    .line 72
    .local v13, "i3":I
    :goto_2
    if-ge v13, v11, :cond_6

    .line 73
    mul-int/lit8 v14, v13, 0x14

    add-int/2addr v14, v12

    .line 74
    .local v14, "a":I
    move/from16 v16, v3

    .end local v3    # "i":I
    .local v16, "i":I
    invoke-direct {v0, v14}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v2

    long-to-int v2, v2

    .line 75
    .local v2, "ns":I
    add-int/lit8 v3, v14, 0x4

    move/from16 v17, v4

    .end local v4    # "i2":I
    .local v17, "i2":I
    invoke-direct {v0, v3}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v3

    long-to-int v3, v3

    .line 76
    .local v3, "an":I
    iget-object v4, v0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    add-int/lit8 v18, v14, 0xf

    aget-byte v4, v4, v18

    and-int/lit16 v4, v4, 0xff

    .line 77
    .local v4, "dtype":I
    move/from16 v18, v5

    .line 78
    .local v18, "endHeaders2":I
    add-int/lit8 v15, v14, 0x10

    move/from16 v19, v9

    move/from16 v20, v10

    .end local v9    # "hsz":I
    .end local v10    # "aStart":I
    .local v19, "hsz":I
    .local v20, "aStart":I
    invoke-direct {v0, v15}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v9

    long-to-int v9, v9

    .line 79
    .local v9, "data":I
    if-ltz v2, :cond_3

    if-nez v2, :cond_5

    :cond_3
    if-ne v3, v1, :cond_5

    const/4 v10, 0x3

    if-ne v4, v10, :cond_5

    if-ltz v9, :cond_5

    iget-object v10, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-lt v9, v10, :cond_4

    goto :goto_3

    .line 83
    :cond_4
    iget-object v10, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 84
    .local v10, "str":Ljava/lang/String;
    iput-object v10, v0, Lcom/licenseinjector/app/core/AxmLEditor;->pkgName:Ljava/lang/String;

    .line 85
    return-object v10

    .line 80
    .end local v10    # "str":Ljava/lang/String;
    :cond_5
    :goto_3
    add-int/lit8 v13, v13, 0x1

    .line 81
    move/from16 v5, v18

    .line 87
    .end local v2    # "ns":I
    .end local v3    # "an":I
    .end local v4    # "dtype":I
    .end local v9    # "data":I
    .end local v14    # "a":I
    .end local v18    # "endHeaders2":I
    move/from16 v3, v16

    move/from16 v4, v17

    move/from16 v9, v19

    move/from16 v10, v20

    goto :goto_2

    .line 88
    .end local v16    # "i":I
    .end local v17    # "i2":I
    .end local v19    # "hsz":I
    .end local v20    # "aStart":I
    .local v3, "i":I
    .local v4, "i2":I
    .local v9, "hsz":I
    .local v10, "aStart":I
    :cond_6
    const/4 v2, 0x0

    return-object v2

    .line 90
    .end local v9    # "hsz":I
    .end local v10    # "aStart":I
    .end local v11    # "aCount":I
    .end local v12    # "p":I
    .end local v13    # "i3":I
    :cond_7
    move/from16 v16, v3

    move/from16 v17, v4

    const/4 v2, 0x0

    .end local v3    # "i":I
    .end local v4    # "i2":I
    .restart local v16    # "i":I
    .restart local v17    # "i2":I
    add-int/2addr v6, v8

    .line 91
    .end local v7    # "ct":I
    .end local v8    # "csz":I
    goto/16 :goto_1

    .line 60
    .end local v16    # "i":I
    .end local v17    # "i2":I
    .restart local v3    # "i":I
    .restart local v4    # "i2":I
    :cond_8
    move/from16 v16, v3

    move/from16 v17, v4

    const/4 v2, 0x0

    .line 92
    .end local v3    # "i":I
    .end local v4    # "i2":I
    .restart local v16    # "i":I
    .restart local v17    # "i2":I
    :goto_4
    return-object v2

    .line 94
    .end local v5    # "endHeaders":I
    .end local v6    # "off":I
    .end local v16    # "i":I
    .end local v17    # "i2":I
    :cond_9
    const/4 v2, 0x0

    return-object v2
.end method

.method private parse()V
    .locals 9

    .line 135
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v0

    .line 136
    .local v0, "type":I
    const/4 v1, 0x3

    if-ne v0, v1, :cond_7

    .line 139
    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v1

    .line 140
    .local v1, "off":I
    :goto_0
    add-int/lit8 v2, v1, 0x8

    iget-object v3, p0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    array-length v3, v3

    if-gt v2, v3, :cond_6

    .line 141
    invoke-direct {p0, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v2

    .line 142
    .local v2, "ct":I
    add-int/lit8 v3, v1, 0x4

    invoke-direct {p0, v3}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v3

    long-to-int v3, v3

    .line 143
    .local v3, "csz":I
    if-lez v3, :cond_5

    .line 144
    const/4 v4, 0x1

    if-ne v2, v4, :cond_0

    .line 145
    invoke-direct {p0, v1, v3}, Lcom/licenseinjector/app/core/AxmLEditor;->parseStringPool(II)V

    goto :goto_3

    .line 146
    :cond_0
    const/16 v4, 0x180

    if-ne v2, v4, :cond_2

    .line 147
    iput v1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapOff:I

    .line 148
    iput v3, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapSize:I

    .line 149
    add-int/lit8 v4, v3, -0x8

    div-int/lit8 v4, v4, 0x4

    .line 150
    .local v4, "n":I
    new-array v5, v4, [I

    iput-object v5, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMap:[I

    .line 151
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    if-ge v5, v4, :cond_1

    .line 152
    iget-object v6, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMap:[I

    add-int/lit8 v7, v1, 0x8

    mul-int/lit8 v8, v5, 0x4

    add-int/2addr v7, v8

    invoke-direct {p0, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v7

    long-to-int v7, v7

    aput v7, v6, v5

    .line 151
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .end local v4    # "n":I
    .end local v5    # "i":I
    :cond_1
    goto :goto_2

    .line 154
    :cond_2
    const/16 v4, 0x100

    if-ne v2, v4, :cond_3

    .line 155
    add-int/lit8 v4, v1, 0x14

    invoke-direct {p0, v4}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v4

    long-to-int v4, v4

    .line 156
    .local v4, "uri":I
    iget v5, p0, Lcom/licenseinjector/app/core/AxmLEditor;->androidNsIndex:I

    const/4 v6, -0x1

    if-ne v5, v6, :cond_4

    .line 157
    iput v4, p0, Lcom/licenseinjector/app/core/AxmLEditor;->androidNsIndex:I

    goto :goto_3

    .line 154
    .end local v4    # "uri":I
    :cond_3
    :goto_2
    nop

    .line 160
    :cond_4
    :goto_3
    add-int/2addr v1, v3

    .line 164
    .end local v2    # "ct":I
    .end local v3    # "csz":I
    goto :goto_0

    .line 162
    .restart local v2    # "ct":I
    .restart local v3    # "csz":I
    :cond_5
    return-void

    .line 165
    .end local v2    # "ct":I
    .end local v3    # "csz":I
    :cond_6
    return-void

    .line 137
    .end local v1    # "off":I
    :cond_7
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u975e\u6cd5 AXML\uff1atype=0x"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private parseStringPool(II)V
    .locals 8
    .param p1, "off"    # I
    .param p2, "size"    # I

    .line 168
    iput p1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringPoolOff:I

    .line 169
    iput p2, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringPoolSize:I

    .line 170
    add-int/lit8 v0, p1, 0x8

    invoke-direct {p0, v0}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringCount:I

    .line 171
    add-int/lit8 v0, p1, 0xc

    invoke-direct {p0, v0}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v0

    long-to-int v0, v0

    .line 172
    .local v0, "styleCount":I
    add-int/lit8 v1, p1, 0x10

    invoke-direct {p0, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v1

    long-to-int v1, v1

    .line 173
    .local v1, "flags":I
    add-int/lit8 v2, p1, 0x14

    invoke-direct {p0, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v2

    long-to-int v2, v2

    iput v2, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringsStart:I

    .line 174
    and-int/lit16 v2, v1, 0x100

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iput-boolean v2, p0, Lcom/licenseinjector/app/core/AxmLEditor;->utf8Pool:Z

    .line 175
    if-nez v0, :cond_5

    .line 178
    iget v2, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringCount:I

    new-array v2, v2, [I

    iput-object v2, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringOffsets:[I

    .line 179
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget v3, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringCount:I

    if-ge v2, v3, :cond_1

    .line 180
    iget-object v3, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringOffsets:[I

    add-int/lit8 v4, p1, 0x1c

    mul-int/lit8 v5, v2, 0x4

    add-int/2addr v4, v5

    invoke-direct {p0, v4}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v4

    long-to-int v4, v4

    aput v4, v3, v2

    .line 179
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 182
    .end local v2    # "i":I
    :cond_1
    iget v2, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringsStart:I

    .line 183
    .local v2, "i2":I
    add-int v3, v2, p1

    .line 184
    .local v3, "dataBase":I
    const/4 v4, 0x0

    .local v4, "i3":I
    :goto_2
    iget v5, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringCount:I

    if-ge v4, v5, :cond_4

    .line 185
    iget-boolean v5, p0, Lcom/licenseinjector/app/core/AxmLEditor;->utf8Pool:Z

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringOffsets:[I

    aget v5, v5, v4

    add-int/2addr v5, v3

    invoke-direct {p0, v5}, Lcom/licenseinjector/app/core/AxmLEditor;->readUtf8(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    :cond_2
    iget-object v5, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringOffsets:[I

    aget v5, v5, v4

    add-int/2addr v5, v3

    invoke-direct {p0, v5}, Lcom/licenseinjector/app/core/AxmLEditor;->readUtf16(I)Ljava/lang/String;

    move-result-object v5

    .line 186
    .local v5, "s":Ljava/lang/String;
    :goto_3
    iget-object v6, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    iget-object v6, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringIndex:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 188
    iget-object v6, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringIndex:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    .end local v5    # "s":Ljava/lang/String;
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 191
    .end local v4    # "i3":I
    :cond_4
    return-void

    .line 176
    .end local v2    # "i2":I
    .end local v3    # "dataBase":I
    :cond_5
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u6682\u4e0d\u652f\u6301\u5e26\u6837\u5f0f\u7684\u5b57\u7b26\u4e32\u6c60 styleCount="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static putU32([BII)V
    .locals 2
    .param p0, "a"    # [B
    .param p1, "off"    # I
    .param p2, "v"    # I

    .line 1237
    and-int/lit16 v0, p2, 0xff

    int-to-byte v0, v0

    aput-byte v0, p0, p1

    .line 1238
    add-int/lit8 v0, p1, 0x1

    shr-int/lit8 v1, p2, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 1239
    add-int/lit8 v0, p1, 0x2

    shr-int/lit8 v1, p2, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 1240
    add-int/lit8 v0, p1, 0x3

    shr-int/lit8 v1, p2, 0x18

    and-int/lit16 v1, v1, 0xff

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    .line 1241
    return-void
.end method

.method private readAndroidAttr(III)Ljava/lang/String;
    .locals 12
    .param p1, "elementOff"    # I
    .param p2, "attrNameIdx"    # I
    .param p3, "androidNs"    # I

    .line 585
    const/4 v0, 0x0

    if-gez p2, :cond_0

    .line 586
    return-object v0

    .line 588
    :cond_0
    add-int/lit8 v1, p1, 0x2

    invoke-direct {p0, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v1

    .line 589
    .local v1, "hsz":I
    add-int/lit8 v2, p1, 0x18

    invoke-direct {p0, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v2

    .line 590
    .local v2, "aStart":I
    add-int/lit8 v3, p1, 0x1c

    invoke-direct {p0, v3}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v3

    .line 591
    .local v3, "aCount":I
    add-int v4, p1, v1

    add-int/2addr v4, v2

    .line 592
    .local v4, "p":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    if-ge v5, v3, :cond_a

    .line 593
    mul-int/lit8 v6, v5, 0x14

    add-int/2addr v6, v4

    .line 594
    .local v6, "a":I
    invoke-direct {p0, v6}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v7

    long-to-int v7, v7

    .line 595
    .local v7, "ns":I
    add-int/lit8 v8, v6, 0x4

    invoke-direct {p0, v8}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v8

    long-to-int v8, v8

    .line 596
    .local v8, "an":I
    if-ne v8, p2, :cond_9

    if-eq v7, p3, :cond_1

    const/4 v9, -0x1

    if-ne v7, v9, :cond_9

    .line 597
    :cond_1
    iget-object v9, p0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    add-int/lit8 v10, v6, 0xf

    aget-byte v9, v9, v10

    and-int/lit16 v9, v9, 0xff

    .line 598
    .local v9, "dtype":I
    add-int/lit8 v10, v6, 0x10

    invoke-direct {p0, v10}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v10

    long-to-int v10, v10

    .line 599
    .local v10, "data":I
    const/4 v11, 0x3

    if-ne v9, v11, :cond_4

    .line 600
    if-ltz v10, :cond_3

    iget-object v11, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v11

    if-lt v10, v11, :cond_2

    goto :goto_1

    .line 603
    :cond_2
    iget-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 601
    :cond_3
    :goto_1
    return-object v0

    .line 605
    :cond_4
    const/16 v11, 0x12

    if-ne v9, v11, :cond_6

    .line 606
    if-eqz v10, :cond_5

    const-string v0, "true"

    goto :goto_2

    :cond_5
    const-string v0, "false"

    :goto_2
    return-object v0

    .line 608
    :cond_6
    const/16 v11, 0x10

    if-ne v9, v11, :cond_7

    .line 609
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 611
    :cond_7
    const/16 v11, 0x11

    if-ne v9, v11, :cond_8

    .line 612
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "0x"

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v10}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 614
    :cond_8
    return-object v0

    .line 592
    .end local v6    # "a":I
    .end local v7    # "ns":I
    .end local v8    # "an":I
    .end local v9    # "dtype":I
    .end local v10    # "data":I
    :cond_9
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 617
    .end local v5    # "i":I
    :cond_a
    return-object v0
.end method

.method private readAndroidName(II)Ljava/lang/String;
    .locals 10
    .param p1, "elementOff"    # I
    .param p2, "attrNameIdx"    # I

    .line 1203
    add-int/lit8 v0, p1, 0x2

    invoke-direct {p0, v0}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v0

    .line 1204
    .local v0, "hsz":I
    add-int/lit8 v1, p1, 0x18

    invoke-direct {p0, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v1

    .line 1205
    .local v1, "aStart":I
    add-int/lit8 v2, p1, 0x1c

    invoke-direct {p0, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v2

    .line 1206
    .local v2, "aCount":I
    add-int v3, p1, v0

    add-int/2addr v3, v1

    .line 1207
    .local v3, "p":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v2, :cond_1

    .line 1208
    mul-int/lit8 v5, v4, 0x14

    add-int/2addr v5, v3

    .line 1209
    .local v5, "a":I
    add-int/lit8 v6, v5, 0x4

    invoke-direct {p0, v6}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v6

    long-to-int v6, v6

    .line 1210
    .local v6, "an":I
    iget-object v7, p0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    add-int/lit8 v8, v5, 0xf

    aget-byte v7, v7, v8

    and-int/lit16 v7, v7, 0xff

    .line 1211
    .local v7, "dtype":I
    add-int/lit8 v8, v5, 0x10

    invoke-direct {p0, v8}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v8

    long-to-int v8, v8

    .line 1212
    .local v8, "data":I
    if-ne v6, p2, :cond_0

    const/4 v9, 0x3

    if-ne v7, v9, :cond_0

    if-ltz v8, :cond_0

    iget-object v9, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    if-ge v8, v9, :cond_0

    .line 1213
    iget-object v9, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    return-object v9

    .line 1207
    .end local v5    # "a":I
    .end local v6    # "an":I
    .end local v7    # "dtype":I
    .end local v8    # "data":I
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1216
    .end local v4    # "i":I
    :cond_1
    const/4 v4, 0x0

    return-object v4
.end method

.method private readUtf16(I)Ljava/lang/String;
    .locals 6
    .param p1, "p"    # I

    .line 194
    invoke-direct {p0, p1}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v0

    .line 195
    .local v0, "n":I
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    add-int/lit8 v3, p1, 0x2

    mul-int/lit8 v4, v0, 0x2

    sget-object v5, Lcom/licenseinjector/app/core/AxmLEditor;->UTF_16LE:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, v3, v4, v5}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    return-object v1
.end method

.method private readUtf8(I)Ljava/lang/String;
    .locals 7
    .param p1, "p"    # I

    .line 199
    iget-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    .line 200
    .local v0, "bArr":[B
    move v1, p1

    .line 201
    .local v1, "q":I
    aget-byte v2, v0, v1

    and-int/lit16 v2, v2, 0xff

    .line 202
    .local v2, "len0":I
    add-int/lit8 v1, v1, 0x1

    .line 203
    and-int/lit16 v3, v2, 0x80

    if-eqz v3, :cond_0

    .line 204
    add-int/lit8 v1, v1, 0x1

    .line 206
    :cond_0
    aget-byte v3, v0, v1

    and-int/lit16 v3, v3, 0xff

    .line 207
    .local v3, "u8len":I
    add-int/lit8 v1, v1, 0x1

    .line 208
    and-int/lit16 v4, v3, 0x80

    if-eqz v4, :cond_1

    .line 209
    and-int/lit8 v4, v3, 0x7f

    shl-int/lit8 v4, v4, 0x8

    aget-byte v5, v0, v1

    and-int/lit16 v5, v5, 0xff

    or-int v3, v4, v5

    .line 210
    add-int/lit8 v1, v1, 0x1

    .line 212
    :cond_1
    new-instance v4, Ljava/lang/String;

    iget-object v5, p0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    sget-object v6, Lcom/licenseinjector/app/core/AxmLEditor;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v4, v5, v1, v3, v6}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    return-object v4
.end method

.method private static setAt([III)[I
    .locals 3
    .param p0, "a"    # [I
    .param p1, "i"    # I
    .param p2, "v"    # I

    .line 264
    array-length v0, p0

    if-ge p1, v0, :cond_0

    .line 265
    aput p2, p0, p1

    .line 266
    return-object p0

    .line 268
    :cond_0
    add-int/lit8 v0, p1, 0x1

    new-array v0, v0, [I

    .line 269
    .local v0, "b":[I
    array-length v1, p0

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 270
    aput p2, v0, p1

    .line 271
    return-object v0
.end method

.method private startElement(ILjava/util/List;)[B
    .locals 9
    .param p1, "nameIdx"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/licenseinjector/app/core/AxmLEditor$Attr;",
            ">;)[B"
        }
    .end annotation

    .line 1089
    .local p2, "attrs":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$Attr;>;"
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    .line 1090
    .local v0, "n":I
    mul-int/lit8 v1, v0, 0x14

    add-int/lit8 v1, v1, 0x24

    .line 1091
    .local v1, "size":I
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 1092
    .local v2, "b":Ljava/io/ByteArrayOutputStream;
    const/16 v3, 0x102

    invoke-static {v2, v3}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1093
    const/16 v3, 0x10

    invoke-static {v2, v3}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1094
    invoke-static {v2, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1095
    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1096
    const/4 v4, -0x1

    invoke-static {v2, v4}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1097
    invoke-static {v2, v4}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1098
    invoke-static {v2, p1}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1099
    const/16 v5, 0x14

    invoke-static {v2, v5}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1100
    invoke-static {v2, v5}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1101
    invoke-static {v2, v0}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1102
    invoke-static {v2, v3}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1103
    invoke-static {v2, v3}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1104
    invoke-static {v2, v3}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1105
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/licenseinjector/app/core/AxmLEditor$Attr;

    .line 1106
    .local v6, "a":Lcom/licenseinjector/app/core/AxmLEditor$Attr;
    iget v7, v6, Lcom/licenseinjector/app/core/AxmLEditor$Attr;->nsIdx:I

    invoke-static {v2, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1107
    iget v7, v6, Lcom/licenseinjector/app/core/AxmLEditor$Attr;->nameIdx:I

    invoke-static {v2, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1108
    iget v7, v6, Lcom/licenseinjector/app/core/AxmLEditor$Attr;->type:I

    const/4 v8, 0x3

    if-ne v7, v8, :cond_0

    iget v7, v6, Lcom/licenseinjector/app/core/AxmLEditor$Attr;->data:I

    goto :goto_1

    :cond_0
    move v7, v4

    :goto_1
    invoke-static {v2, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1109
    const/16 v7, 0x8

    invoke-static {v2, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1110
    invoke-virtual {v2, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1111
    iget v7, v6, Lcom/licenseinjector/app/core/AxmLEditor$Attr;->type:I

    invoke-virtual {v2, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1112
    iget v7, v6, Lcom/licenseinjector/app/core/AxmLEditor$Attr;->data:I

    invoke-static {v2, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1113
    .end local v6    # "a":Lcom/licenseinjector/app/core/AxmLEditor$Attr;
    goto :goto_0

    .line 1114
    :cond_1
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3
.end method

.method private u16(I)I
    .locals 3
    .param p1, "off"    # I

    .line 1198
    iget-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    .line 1199
    .local v0, "bArr":[B
    add-int/lit8 v1, p1, 0x1

    aget-byte v1, v0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    aget-byte v2, v0, p1

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    return v1
.end method

.method private u32(I)J
    .locals 8
    .param p1, "off"    # I

    .line 1220
    iget-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    .line 1221
    .local v0, "bArr":[B
    aget-byte v1, v0, p1

    int-to-long v1, v1

    const-wide/16 v3, 0xff

    and-long/2addr v1, v3

    add-int/lit8 v5, p1, 0x1

    aget-byte v5, v0, v5

    int-to-long v5, v5

    and-long/2addr v5, v3

    const/16 v7, 0x8

    shl-long/2addr v5, v7

    or-long/2addr v1, v5

    add-int/lit8 v5, p1, 0x2

    aget-byte v5, v0, v5

    int-to-long v5, v5

    and-long/2addr v5, v3

    const/16 v7, 0x10

    shl-long/2addr v5, v7

    or-long/2addr v1, v5

    add-int/lit8 v5, p1, 0x3

    aget-byte v5, v0, v5

    int-to-long v5, v5

    and-long/2addr v3, v5

    const/16 v5, 0x18

    shl-long/2addr v3, v5

    or-long/2addr v1, v3

    return-wide v1
.end method

.method private valueIndex(Ljava/lang/String;)I
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .line 216
    iget-object v0, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringIndex:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 217
    .local v0, "i":Ljava/lang/Integer;
    if-eqz v0, :cond_0

    .line 218
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1

    .line 220
    :cond_0
    iget-object v1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    .line 221
    .local v1, "idx":I
    iget-object v2, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 222
    iget-object v2, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringIndex:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    return v1
.end method

.method private static writeU16(Ljava/io/ByteArrayOutputStream;I)V
    .locals 1
    .param p0, "b"    # Ljava/io/ByteArrayOutputStream;
    .param p1, "v"    # I

    .line 1225
    and-int/lit16 v0, p1, 0xff

    invoke-virtual {p0, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1226
    shr-int/lit8 v0, p1, 0x8

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1227
    return-void
.end method

.method private static writeU32(Ljava/io/ByteArrayOutputStream;I)V
    .locals 1
    .param p0, "b"    # Ljava/io/ByteArrayOutputStream;
    .param p1, "v"    # I

    .line 1230
    and-int/lit16 v0, p1, 0xff

    invoke-virtual {p0, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1231
    shr-int/lit8 v0, p1, 0x8

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1232
    shr-int/lit8 v0, p1, 0x10

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1233
    shr-int/lit8 v0, p1, 0x18

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1234
    return-void
.end method


# virtual methods
.method public fullName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "cls"    # Ljava/lang/String;

    .line 99
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lcom/licenseinjector/app/core/AxmLEditor;->packageName()Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    .local v1, "p":Ljava/lang/String;
    if-eqz v0, :cond_3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 102
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x2e

    if-ne v0, v2, :cond_1

    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 105
    :cond_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    move-object v0, p1

    :goto_0
    return-object v0

    .line 100
    .end local v1    # "p":Ljava/lang/String;
    :cond_3
    :goto_1
    return-object p1
.end method

.method public hasComponent(Ljava/lang/String;)Z
    .locals 9
    .param p1, "className"    # Ljava/lang/String;

    .line 286
    const/4 v0, 0x0

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    const-string v2, "name"

    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    move v2, v1

    .local v2, "attrName":I
    if-gez v1, :cond_0

    goto :goto_3

    .line 289
    :cond_0
    iget v1, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringPoolOff:I

    iget v3, p0, Lcom/licenseinjector/app/core/AxmLEditor;->stringPoolSize:I

    add-int/2addr v1, v3

    .line 290
    .local v1, "i":I
    iget v3, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapOff:I

    .line 291
    .local v3, "i2":I
    if-ltz v3, :cond_1

    iget v4, p0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapSize:I

    add-int/2addr v4, v3

    goto :goto_0

    :cond_1
    move v4, v0

    :goto_0
    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 292
    .local v4, "endHeaders":I
    move v5, v4

    .line 293
    .local v5, "off":I
    :goto_1
    add-int/lit8 v6, v5, 0x8

    iget-object v7, p0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    array-length v7, v7

    if-gt v6, v7, :cond_4

    .line 294
    invoke-direct {p0, v5}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v6

    .line 295
    .local v6, "ct":I
    add-int/lit8 v7, v5, 0x4

    invoke-direct {p0, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v7

    long-to-int v7, v7

    .line 296
    .local v7, "csz":I
    if-gtz v7, :cond_2

    .line 297
    goto :goto_2

    .line 299
    :cond_2
    const/16 v8, 0x102

    if-ne v6, v8, :cond_3

    invoke-direct {p0, v5, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->readAndroidName(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, p1, v8}, Lcom/licenseinjector/app/core/AxmLEditor;->sameClass(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 300
    const/4 v0, 0x1

    return v0

    .line 302
    :cond_3
    add-int/2addr v5, v7

    .line 303
    .end local v6    # "ct":I
    .end local v7    # "csz":I
    goto :goto_1

    .line 304
    :cond_4
    :goto_2
    return v0

    .line 287
    .end local v1    # "i":I
    .end local v2    # "attrName":I
    .end local v3    # "i2":I
    .end local v4    # "endHeaders":I
    .end local v5    # "off":I
    :cond_5
    :goto_3
    return v0
.end method

.method public injectLauncher(Ljava/lang/String;)[B
    .locals 1
    .param p1, "activityClass"    # Ljava/lang/String;

    .line 654
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/licenseinjector/app/core/AxmLEditor;->injectLauncher(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public injectLauncher(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 60
    .param p1, "activityClass"    # Ljava/lang/String;
    .param p2, "targetEntry"    # Ljava/lang/String;

    .line 670
    move-object/from16 v11, p0

    move-object/from16 v12, p2

    invoke-direct/range {p0 .. p0}, Lcom/licenseinjector/app/core/AxmLEditor;->ensureAndroidNs()I

    move-result v0

    .line 671
    .local v0, "nsAndroid2":I
    const-string v1, "application"

    invoke-direct {v11, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->nameIndex(Ljava/lang/String;)I

    .line 672
    const-string v2, "activity"

    invoke-direct {v11, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->nameIndex(Ljava/lang/String;)I

    move-result v13

    .line 673
    .local v13, "nameActivity":I
    const-string v2, "intent-filter"

    invoke-direct {v11, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->nameIndex(Ljava/lang/String;)I

    move-result v14

    .line 674
    .local v14, "nameIntentFilter":I
    const-string v2, "action"

    invoke-direct {v11, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->nameIndex(Ljava/lang/String;)I

    move-result v15

    .line 675
    .local v15, "nameAction":I
    const-string v2, "category"

    invoke-direct {v11, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->nameIndex(Ljava/lang/String;)I

    move-result v10

    .line 676
    .local v10, "nameCategory":I
    const-string v2, "name"

    const v3, 0x1010003

    invoke-direct {v11, v2, v3}, Lcom/licenseinjector/app/core/AxmLEditor;->attrNameIndex(Ljava/lang/String;I)I

    move-result v9

    .line 677
    .local v9, "attrName":I
    const-string v2, "exported"

    const v3, 0x1010010

    invoke-direct {v11, v2, v3}, Lcom/licenseinjector/app/core/AxmLEditor;->attrNameIndex(Ljava/lang/String;I)I

    move-result v16

    .line 678
    .local v16, "attrExported":I
    invoke-direct/range {p0 .. p1}, Lcom/licenseinjector/app/core/AxmLEditor;->valueIndex(Ljava/lang/String;)I

    move-result v17

    .line 679
    .local v17, "vActivity":I
    const-string v2, "android.intent.action.MAIN"

    invoke-direct {v11, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->valueIndex(Ljava/lang/String;)I

    move-result v18

    .line 680
    .local v18, "vMain":I
    const-string v2, "android.intent.category.LAUNCHER"

    invoke-direct {v11, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->valueIndex(Ljava/lang/String;)I

    move-result v19

    .line 681
    .local v19, "vLauncher":I
    const-string v3, "android.intent.category.DEFAULT"

    invoke-direct {v11, v3}, Lcom/licenseinjector/app/core/AxmLEditor;->valueIndex(Ljava/lang/String;)I

    move-result v3

    .line 682
    .local v3, "vDefault2":I
    iget-object v4, v11, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 683
    .local v1, "appNameIdx2":I
    if-ltz v1, :cond_1b

    .line 684
    iget v4, v11, Lcom/licenseinjector/app/core/AxmLEditor;->stringPoolOff:I

    iget v5, v11, Lcom/licenseinjector/app/core/AxmLEditor;->stringPoolSize:I

    add-int v8, v4, v5

    .line 685
    .local v8, "i":I
    iget v7, v11, Lcom/licenseinjector/app/core/AxmLEditor;->resMapOff:I

    .line 686
    .local v7, "i2":I
    if-ltz v7, :cond_0

    iget v4, v11, Lcom/licenseinjector/app/core/AxmLEditor;->resMapSize:I

    add-int/2addr v4, v7

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    invoke-static {v8, v4}, Ljava/lang/Math;->max(II)I

    move-result v20

    .line 687
    .local v20, "endHeaders":I
    move/from16 v4, v20

    .line 688
    .local v4, "ct":I
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 689
    .local v5, "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v22, v21

    .line 690
    .local v22, "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v23, v21

    .line 691
    .local v23, "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v6, v11, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    move/from16 v24, v0

    .end local v0    # "nsAndroid2":I
    .local v24, "nsAndroid2":I
    const-string v0, "activity-alias"

    invoke-interface {v6, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 692
    .local v0, "nameActivityAlias2":I
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 693
    .local v6, "stack2":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/16 v25, 0x0

    .line 694
    .local v25, "curAct2":Ljava/lang/String;
    const/16 v26, -0x1

    .line 695
    .local v26, "applicationEndOff":I
    move/from16 v27, v4

    move-object/from16 v28, v6

    move-object/from16 v29, v25

    move/from16 v30, v26

    move v6, v0

    move/from16 v25, v1

    move/from16 v26, v3

    move/from16 v58, v27

    move/from16 v4, v58

    .line 697
    .end local v0    # "nameActivityAlias2":I
    .end local v1    # "appNameIdx2":I
    .end local v3    # "vDefault2":I
    .local v4, "nameApplication":I
    .local v6, "nameActivityAlias2":I
    .local v25, "appNameIdx2":I
    .local v26, "vDefault2":I
    .local v27, "ct":I
    .local v28, "stack2":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v29, "curAct2":Ljava/lang/String;
    .local v30, "applicationEndOff":I
    :goto_1
    move/from16 v3, v27

    .line 698
    .local v3, "bodyStart":I
    move/from16 v0, v26

    .line 699
    .local v0, "vDefault":I
    move/from16 v1, v24

    .line 700
    .local v1, "nsAndroid":I
    move/from16 v31, v0

    .end local v0    # "vDefault":I
    .local v31, "vDefault":I
    add-int/lit8 v0, v4, 0x8

    move/from16 v32, v3

    .end local v3    # "bodyStart":I
    .local v32, "bodyStart":I
    iget-object v3, v11, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    array-length v3, v3

    move/from16 v33, v1

    .end local v1    # "nsAndroid":I
    .local v33, "nsAndroid":I
    if-le v0, v3, :cond_1

    .line 701
    move/from16 v36, v6

    move/from16 v35, v7

    goto :goto_2

    .line 703
    :cond_1
    invoke-direct {v11, v4}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v0

    .line 704
    .local v0, "ct2":I
    move v3, v4

    .line 705
    .local v3, "off3":I
    add-int/lit8 v1, v4, 0x4

    move/from16 v36, v6

    move/from16 v35, v7

    .end local v6    # "nameActivityAlias2":I
    .end local v7    # "i2":I
    .local v35, "i2":I
    .local v36, "nameActivityAlias2":I
    invoke-direct {v11, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v6

    long-to-int v6, v6

    .line 706
    .local v6, "csz2":I
    if-gtz v6, :cond_f

    .line 707
    nop

    .line 795
    .end local v0    # "ct2":I
    .end local v3    # "off3":I
    .end local v6    # "csz2":I
    :goto_2
    if-ltz v30, :cond_e

    .line 798
    const/4 v0, 0x0

    .line 799
    .local v0, "picked2":Ljava/lang/String;
    if-eqz v12, :cond_4

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_4

    .line 800
    const/4 v1, 0x0

    .local v1, "i3":I
    :goto_3
    invoke-interface/range {v23 .. v23}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 801
    move-object/from16 v7, v23

    .end local v23    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v7, "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v11, v12, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->sameClass(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 802
    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Ljava/lang/String;

    .line 803
    move-object/from16 v23, v0

    goto :goto_5

    .line 800
    :cond_2
    add-int/lit8 v1, v1, 0x1

    move-object/from16 v23, v7

    goto :goto_3

    .end local v7    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v23    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    move-object/from16 v7, v23

    .end local v23    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v7    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_4

    .line 799
    .end local v1    # "i3":I
    .end local v7    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v23    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_4
    move-object/from16 v7, v23

    .line 807
    .end local v23    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v7    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_4
    move-object/from16 v23, v0

    .end local v0    # "picked2":Ljava/lang/String;
    .local v23, "picked2":Ljava/lang/String;
    :goto_5
    if-nez v23, :cond_5

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 808
    const/4 v0, 0x0

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v11, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->fullName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v1, v0

    .local v0, "picked":Ljava/lang/String;
    goto :goto_6

    .line 810
    .end local v0    # "picked":Ljava/lang/String;
    :cond_5
    move-object/from16 v0, v23

    move-object v1, v0

    .line 812
    .local v1, "picked":Ljava/lang/String;
    :goto_6
    iput-object v1, v11, Lcom/licenseinjector/app/core/AxmLEditor;->resolvedEntry:Ljava/lang/String;

    .line 813
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v6, v0

    .line 814
    .local v6, "patchOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 815
    const/4 v0, 0x0

    move/from16 v21, v0

    move-object/from16 v38, v22

    move-object/from16 v22, v1

    .local v0, "z":Z
    goto/16 :goto_a

    .line 817
    .end local v0    # "z":Z
    :cond_6
    const/4 v0, 0x0

    .line 818
    .restart local v0    # "z":Z
    const/4 v3, 0x0

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v11, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->fullName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v11, Lcom/licenseinjector/app/core/AxmLEditor;->discoveredLauncher:Ljava/lang/String;

    .line 819
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 820
    .local v2, "csv":Ljava/lang/StringBuilder;
    const/16 v21, 0x0

    move/from16 v3, v21

    .local v3, "i4":I
    :goto_7
    move/from16 v21, v0

    .end local v0    # "z":Z
    .local v21, "z":Z
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v0

    if-ge v3, v0, :cond_9

    .line 821
    move-object/from16 v0, v22

    .end local v22    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v0, "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v38, v0

    .end local v0    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v38, "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move-object/from16 v0, v22

    check-cast v0, Ljava/lang/Integer;

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 822
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v11, v0}, Lcom/licenseinjector/app/core/AxmLEditor;->fullName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 823
    .local v0, "n":Ljava/lang/String;
    if-eqz v0, :cond_8

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v22

    if-lez v22, :cond_8

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    move-result v22

    if-gez v22, :cond_8

    .line 824
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v22

    if-lez v22, :cond_7

    .line 825
    move-object/from16 v22, v1

    .end local v1    # "picked":Ljava/lang/String;
    .local v22, "picked":Ljava/lang/String;
    const/16 v1, 0x2c

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_8

    .line 824
    .end local v22    # "picked":Ljava/lang/String;
    .restart local v1    # "picked":Ljava/lang/String;
    :cond_7
    move-object/from16 v22, v1

    .line 827
    .end local v1    # "picked":Ljava/lang/String;
    .restart local v22    # "picked":Ljava/lang/String;
    :goto_8
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_9

    .line 823
    .end local v22    # "picked":Ljava/lang/String;
    .restart local v1    # "picked":Ljava/lang/String;
    :cond_8
    move-object/from16 v22, v1

    .line 820
    .end local v0    # "n":Ljava/lang/String;
    .end local v1    # "picked":Ljava/lang/String;
    .restart local v22    # "picked":Ljava/lang/String;
    :goto_9
    add-int/lit8 v3, v3, 0x1

    move/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v22, v38

    goto :goto_7

    .end local v38    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v1    # "picked":Ljava/lang/String;
    .local v22, "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_9
    move-object/from16 v38, v22

    move-object/from16 v22, v1

    .line 830
    .end local v1    # "picked":Ljava/lang/String;
    .end local v3    # "i4":I
    .local v22, "picked":Ljava/lang/String;
    .restart local v38    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v11, Lcom/licenseinjector/app/core/AxmLEditor;->downgradedLaunchers:Ljava/lang/String;

    .line 832
    .end local v2    # "csv":Ljava/lang/StringBuilder;
    :goto_a
    move/from16 v1, v30

    .line 833
    .local v1, "applicationEndOff2":I
    move/from16 v2, v31

    move-object/from16 v3, v38

    .end local v31    # "vDefault":I
    .end local v38    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v2, "vDefault":I
    .local v3, "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move-object/from16 v0, p0

    move v12, v2

    .end local v2    # "vDefault":I
    .local v12, "vDefault":I
    move v2, v13

    move-object/from16 v39, v3

    move/from16 v31, v13

    move/from16 v13, v32

    const/16 v32, 0x0

    .end local v3    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v32    # "bodyStart":I
    .local v13, "bodyStart":I
    .local v31, "nameActivity":I
    .local v39, "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move v3, v14

    move/from16 v37, v4

    .end local v4    # "nameApplication":I
    .local v37, "nameApplication":I
    move v4, v15

    move/from16 v38, v14

    move-object v14, v5

    .end local v5    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v14, "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v38, "nameIntentFilter":I
    move v5, v10

    move/from16 v40, v15

    move/from16 v15, v36

    move-object/from16 v36, v14

    move/from16 v14, v32

    move-object/from16 v32, v6

    .end local v6    # "patchOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v14    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v15, "nameActivityAlias2":I
    .local v32, "patchOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v36, "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v40, "nameAction":I
    move v6, v9

    move-object/from16 v41, v7

    .end local v7    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v41, "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move/from16 v7, v16

    move/from16 v42, v8

    .end local v8    # "i":I
    .local v42, "i":I
    move/from16 v8, v17

    move/from16 v43, v9

    .end local v9    # "attrName":I
    .local v43, "attrName":I
    move/from16 v9, v18

    move/from16 v44, v10

    .end local v10    # "nameCategory":I
    .local v44, "nameCategory":I
    move/from16 v10, v19

    move v14, v1

    move/from16 v34, v15

    move/from16 v1, v33

    const/4 v15, 0x3

    .end local v15    # "nameActivityAlias2":I
    .end local v33    # "nsAndroid":I
    .local v1, "nsAndroid":I
    .local v14, "applicationEndOff2":I
    .local v34, "nameActivityAlias2":I
    invoke-direct/range {v0 .. v10}, Lcom/licenseinjector/app/core/AxmLEditor;->buildActivityTree(IIIIIIIIII)[B

    move-result-object v0

    .line 834
    .local v0, "activityTree":[B
    invoke-direct/range {p0 .. p0}, Lcom/licenseinjector/app/core/AxmLEditor;->buildStringPool()[B

    move-result-object v2

    .line 835
    .local v2, "pool":[B
    invoke-direct/range {p0 .. p0}, Lcom/licenseinjector/app/core/AxmLEditor;->buildResMap()[B

    move-result-object v3

    .line 836
    .local v3, "rmap":[B
    sub-int v4, v14, v13

    .line 837
    .local v4, "bodyLen":I
    iget-object v5, v11, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    array-length v5, v5

    sub-int/2addr v5, v14

    .line 838
    .local v5, "tailLen":I
    array-length v6, v2

    const/16 v7, 0x8

    add-int/2addr v6, v7

    array-length v8, v3

    add-int/2addr v6, v8

    .line 839
    .local v6, "newBase":I
    new-instance v8, Ljava/io/ByteArrayOutputStream;

    iget-object v9, v11, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    array-length v9, v9

    add-int/lit16 v9, v9, 0x1000

    invoke-direct {v8, v9}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 840
    .local v8, "out":Ljava/io/ByteArrayOutputStream;
    invoke-static {v8, v15}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 841
    invoke-static {v8, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 842
    const/4 v7, 0x0

    invoke-static {v8, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 843
    array-length v9, v2

    invoke-virtual {v8, v2, v7, v9}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 844
    array-length v9, v3

    invoke-virtual {v8, v3, v7, v9}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 845
    if-lez v4, :cond_a

    .line 846
    iget-object v9, v11, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    invoke-virtual {v8, v9, v13, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 848
    :cond_a
    array-length v9, v0

    invoke-virtual {v8, v0, v7, v9}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 849
    if-lez v5, :cond_b

    .line 850
    iget-object v7, v11, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    invoke-virtual {v8, v7, v14, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 852
    :cond_b
    invoke-virtual {v8}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    .line 853
    .local v7, "result":[B
    array-length v9, v7

    const/4 v10, 0x4

    invoke-static {v7, v10, v9}, Lcom/licenseinjector/app/core/AxmLEditor;->putU32([BII)V

    .line 854
    invoke-interface/range {v32 .. v32}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_d

    .line 855
    const/4 v9, 0x0

    .line 856
    .local v9, "i5":I
    :goto_b
    invoke-interface/range {v32 .. v32}, Ljava/util/List;->size()I

    move-result v10

    if-ge v9, v10, :cond_c

    .line 857
    move-object/from16 v10, v32

    .end local v32    # "patchOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v10, "patchOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/Integer;

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    sub-int/2addr v15, v13

    add-int/2addr v15, v6

    .line 858
    .local v15, "dataPos":I
    invoke-static {v7, v15, v12}, Lcom/licenseinjector/app/core/AxmLEditor;->putU32([BII)V

    .line 859
    move-object/from16 v32, v0

    .end local v0    # "activityTree":[B
    .local v32, "activityTree":[B
    add-int/lit8 v0, v15, -0x8

    invoke-static {v7, v0, v12}, Lcom/licenseinjector/app/core/AxmLEditor;->putU32([BII)V

    .line 860
    add-int/lit8 v9, v9, 0x1

    .line 861
    nop

    .line 862
    .end local v15    # "dataPos":I
    move-object/from16 v0, v32

    move-object/from16 v32, v10

    goto :goto_b

    .line 856
    .end local v10    # "patchOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v0    # "activityTree":[B
    .local v32, "patchOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_c
    move-object/from16 v10, v32

    move-object/from16 v32, v0

    .end local v0    # "activityTree":[B
    .restart local v10    # "patchOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v32, "activityTree":[B
    goto :goto_c

    .line 854
    .end local v9    # "i5":I
    .end local v10    # "patchOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v0    # "activityTree":[B
    .local v32, "patchOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_d
    move-object/from16 v10, v32

    move-object/from16 v32, v0

    .line 864
    .end local v0    # "activityTree":[B
    .restart local v10    # "patchOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v32, "activityTree":[B
    :goto_c
    return-object v7

    .line 796
    .end local v1    # "nsAndroid":I
    .end local v2    # "pool":[B
    .end local v3    # "rmap":[B
    .end local v6    # "newBase":I
    .end local v7    # "result":[B
    .end local v12    # "vDefault":I
    .end local v21    # "z":Z
    .end local v34    # "nameActivityAlias2":I
    .end local v37    # "nameApplication":I
    .end local v38    # "nameIntentFilter":I
    .end local v39    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v40    # "nameAction":I
    .end local v41    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v42    # "i":I
    .end local v43    # "attrName":I
    .end local v44    # "nameCategory":I
    .local v4, "nameApplication":I
    .local v5, "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v8, "i":I
    .local v9, "attrName":I
    .local v10, "nameCategory":I
    .local v13, "nameActivity":I
    .local v14, "nameIntentFilter":I
    .local v15, "nameAction":I
    .local v22, "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v23, "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v31, "vDefault":I
    .local v32, "bodyStart":I
    .restart local v33    # "nsAndroid":I
    .local v36, "nameActivityAlias2":I
    :cond_e
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "\u6e05\u5355\u4e2d\u672a\u627e\u5230 </application>"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 709
    .local v0, "ct2":I
    .local v3, "off3":I
    .local v6, "csz2":I
    :cond_f
    move/from16 v37, v4

    move/from16 v42, v8

    move/from16 v43, v9

    move/from16 v44, v10

    move/from16 v38, v14

    move/from16 v40, v15

    move-object/from16 v39, v22

    move-object/from16 v41, v23

    move/from16 v12, v31

    move/from16 v1, v33

    move/from16 v34, v36

    const/4 v7, 0x0

    const/4 v15, 0x3

    move-object/from16 v36, v5

    move/from16 v31, v13

    move/from16 v13, v32

    .end local v4    # "nameApplication":I
    .end local v5    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v8    # "i":I
    .end local v9    # "attrName":I
    .end local v10    # "nameCategory":I
    .end local v14    # "nameIntentFilter":I
    .end local v15    # "nameAction":I
    .end local v22    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v23    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v32    # "bodyStart":I
    .end local v33    # "nsAndroid":I
    .restart local v1    # "nsAndroid":I
    .restart local v12    # "vDefault":I
    .local v13, "bodyStart":I
    .local v31, "nameActivity":I
    .restart local v34    # "nameActivityAlias2":I
    .local v36, "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v37    # "nameApplication":I
    .restart local v38    # "nameIntentFilter":I
    .restart local v39    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v40    # "nameAction":I
    .restart local v41    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v42    # "i":I
    .restart local v43    # "attrName":I
    .restart local v44    # "nameCategory":I
    const/16 v4, 0x102

    if-ne v0, v4, :cond_17

    .line 710
    add-int/lit8 v4, v3, 0x14

    invoke-direct {v11, v4}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v4

    long-to-int v4, v4

    .line 711
    .local v4, "ename":I
    move-object/from16 v5, v28

    .line 712
    .local v5, "stack":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v5, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 713
    move/from16 v8, v31

    .end local v31    # "nameActivity":I
    .local v8, "nameActivity":I
    if-eq v4, v8, :cond_12

    if-ltz v34, :cond_10

    move/from16 v9, v34

    .end local v34    # "nameActivityAlias2":I
    .local v9, "nameActivityAlias2":I
    if-ne v4, v9, :cond_11

    goto :goto_d

    .end local v9    # "nameActivityAlias2":I
    .restart local v34    # "nameActivityAlias2":I
    :cond_10
    move/from16 v9, v34

    .line 721
    .end local v34    # "nameActivityAlias2":I
    .restart local v9    # "nameActivityAlias2":I
    :cond_11
    move v10, v9

    .line 722
    .local v10, "nameActivityAlias":I
    move-object/from16 v14, v29

    .line 723
    .local v14, "curAct":Ljava/lang/String;
    move/from16 v21, v3

    move-object/from16 v22, v5

    move/from16 v31, v8

    move/from16 v5, v21

    move-object/from16 v8, v41

    move/from16 v7, v43

    .local v21, "off2":I
    goto :goto_f

    .line 713
    .end local v9    # "nameActivityAlias2":I
    .end local v10    # "nameActivityAlias":I
    .end local v14    # "curAct":Ljava/lang/String;
    .end local v21    # "off2":I
    .restart local v34    # "nameActivityAlias2":I
    :cond_12
    move/from16 v9, v34

    .line 714
    .end local v34    # "nameActivityAlias2":I
    .restart local v9    # "nameActivityAlias2":I
    :goto_d
    move v10, v9

    .line 715
    .restart local v10    # "nameActivityAlias":I
    move v14, v3

    .line 716
    .local v14, "off2":I
    move/from16 v7, v43

    .end local v43    # "attrName":I
    .local v7, "attrName":I
    invoke-direct {v11, v14, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->readAndroidName(II)Ljava/lang/String;

    move-result-object v15

    .line 717
    .local v15, "curAct":Ljava/lang/String;
    if-eqz v15, :cond_13

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v22

    if-lez v22, :cond_13

    .line 718
    move-object/from16 v22, v5

    .end local v5    # "stack":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v22, "stack":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-virtual {v11, v15}, Lcom/licenseinjector/app/core/AxmLEditor;->fullName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move/from16 v31, v8

    move-object/from16 v8, v41

    .end local v41    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v8, "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v31    # "nameActivity":I
    invoke-interface {v8, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 717
    .end local v22    # "stack":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v31    # "nameActivity":I
    .restart local v5    # "stack":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v8, "nameActivity":I
    .restart local v41    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_13
    move-object/from16 v22, v5

    move/from16 v31, v8

    move-object/from16 v8, v41

    .line 725
    .end local v5    # "stack":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v41    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v8, "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v22    # "stack":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v31    # "nameActivity":I
    :goto_e
    move v5, v14

    move-object v14, v15

    .end local v15    # "curAct":Ljava/lang/String;
    .local v5, "off2":I
    .local v14, "curAct":Ljava/lang/String;
    :goto_f
    move/from16 v15, v44

    .end local v44    # "nameCategory":I
    .local v15, "nameCategory":I
    if-ne v4, v15, :cond_16

    .line 726
    move/from16 v23, v4

    .end local v4    # "ename":I
    .local v23, "ename":I
    add-int/lit8 v4, v5, 0x2

    invoke-direct {v11, v4}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v4

    .line 727
    .local v4, "hsz":I
    move-object/from16 v41, v8

    .end local v8    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v41    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    add-int/lit8 v8, v5, 0x18

    .line 728
    .local v8, "ename2":I
    invoke-direct {v11, v8}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v32

    .line 729
    .local v32, "aStart":I
    move/from16 v33, v8

    .end local v8    # "ename2":I
    .local v33, "ename2":I
    add-int/lit8 v8, v5, 0x1c

    .line 730
    .local v8, "nameCategory2":I
    invoke-direct {v11, v8}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v43

    .line 731
    .local v43, "aCount":I
    add-int v44, v5, v4

    add-int v44, v44, v32

    .line 732
    .local v44, "p":I
    const/16 v45, 0x0

    move/from16 v58, v43

    move/from16 v43, v8

    move/from16 v8, v58

    move/from16 v59, v45

    move/from16 v45, v10

    move/from16 v10, v59

    .line 733
    .local v8, "aCount":I
    .local v10, "aStart2":I
    .local v43, "nameCategory2":I
    .local v45, "nameActivityAlias":I
    :goto_10
    if-ge v10, v8, :cond_15

    .line 734
    mul-int/lit8 v46, v10, 0x14

    add-int v46, v44, v46

    .line 735
    .local v46, "a":I
    move/from16 v47, v8

    .line 736
    .local v47, "aCount2":I
    move/from16 v48, v8

    .end local v8    # "aCount":I
    .local v48, "aCount":I
    add-int/lit8 v8, v46, 0x4

    .line 737
    .local v8, "aCount3":I
    move/from16 v49, v25

    .line 738
    .local v49, "appNameIdx3":I
    move/from16 v50, v6

    .line 739
    .local v50, "csz3":I
    move/from16 v51, v12

    move/from16 v52, v13

    .end local v12    # "vDefault":I
    .end local v13    # "bodyStart":I
    .local v51, "vDefault":I
    .local v52, "bodyStart":I
    invoke-direct {v11, v8}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v12

    long-to-int v12, v12

    .line 740
    .local v12, "an":I
    iget-object v13, v11, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    add-int/lit8 v53, v46, 0xf

    aget-byte v13, v13, v53

    and-int/lit16 v13, v13, 0xff

    .line 741
    .local v13, "dtype":I
    move/from16 v53, v5

    .line 742
    .local v53, "off4":I
    move/from16 v54, v4

    .line 743
    .local v54, "hsz2":I
    move/from16 v55, v4

    .end local v4    # "hsz":I
    .local v55, "hsz":I
    add-int/lit8 v4, v46, 0x10

    move/from16 v57, v0

    move/from16 v56, v1

    .end local v0    # "ct2":I
    .end local v1    # "nsAndroid":I
    .local v56, "nsAndroid":I
    .local v57, "ct2":I
    invoke-direct {v11, v4}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v0

    long-to-int v0, v0

    .line 744
    .local v0, "data":I
    if-eqz v14, :cond_14

    if-ne v12, v7, :cond_14

    const/4 v1, 0x3

    if-ne v13, v1, :cond_14

    if-ltz v0, :cond_14

    iget-object v4, v11, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v0, v4, :cond_14

    iget-object v4, v11, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    .line 745
    move-object/from16 v4, v36

    .end local v36    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v4, "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v4, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 746
    add-int/lit8 v34, v46, 0x10

    invoke-static/range {v34 .. v34}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move/from16 v34, v0

    move-object/from16 v0, v39

    .end local v39    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v0, "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v34, "data":I
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 744
    .end local v4    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v34    # "data":I
    .local v0, "data":I
    .restart local v36    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v39    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_14
    move/from16 v34, v0

    move-object/from16 v4, v36

    move-object/from16 v0, v39

    .line 748
    .end local v36    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v39    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v0, "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v4    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v34    # "data":I
    :goto_11
    add-int/lit8 v10, v10, 0x1

    .line 749
    move/from16 v1, v47

    .line 750
    .end local v48    # "aCount":I
    .local v1, "aCount":I
    move/from16 v25, v49

    .line 751
    move/from16 v6, v50

    .line 752
    move/from16 v5, v53

    .line 753
    move/from16 v8, v54

    .line 754
    .end local v12    # "an":I
    .end local v13    # "dtype":I
    .end local v34    # "data":I
    .end local v46    # "a":I
    .end local v47    # "aCount2":I
    .end local v49    # "appNameIdx3":I
    .end local v50    # "csz3":I
    .end local v53    # "off4":I
    .end local v54    # "hsz2":I
    .end local v55    # "hsz":I
    .local v8, "hsz":I
    move-object/from16 v39, v0

    move-object/from16 v36, v4

    move v4, v8

    move/from16 v12, v51

    move/from16 v13, v52

    move/from16 v0, v57

    move v8, v1

    move/from16 v1, v56

    goto/16 :goto_10

    .line 755
    .end local v51    # "vDefault":I
    .end local v52    # "bodyStart":I
    .end local v56    # "nsAndroid":I
    .end local v57    # "ct2":I
    .local v0, "ct2":I
    .local v1, "nsAndroid":I
    .local v4, "hsz":I
    .local v8, "aCount":I
    .local v12, "vDefault":I
    .local v13, "bodyStart":I
    .restart local v36    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v39    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_15
    move/from16 v57, v0

    move/from16 v56, v1

    move/from16 v55, v4

    move/from16 v48, v8

    move/from16 v51, v12

    move/from16 v52, v13

    move-object/from16 v4, v36

    move-object/from16 v0, v39

    .end local v1    # "nsAndroid":I
    .end local v8    # "aCount":I
    .end local v12    # "vDefault":I
    .end local v13    # "bodyStart":I
    .end local v36    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v39    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v0, "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v4, "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v48    # "aCount":I
    .restart local v51    # "vDefault":I
    .restart local v52    # "bodyStart":I
    .restart local v55    # "hsz":I
    .restart local v56    # "nsAndroid":I
    .restart local v57    # "ct2":I
    move/from16 v1, v25

    .line 756
    .local v1, "appNameIdx":I
    move v8, v6

    .line 757
    .local v8, "csz":I
    move v10, v5

    .line 758
    .end local v32    # "aStart":I
    .end local v33    # "ename2":I
    .end local v43    # "nameCategory2":I
    .end local v44    # "p":I
    .end local v48    # "aCount":I
    .end local v55    # "hsz":I
    .local v10, "off":I
    goto :goto_12

    .line 759
    .end local v23    # "ename":I
    .end local v41    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v45    # "nameActivityAlias":I
    .end local v51    # "vDefault":I
    .end local v52    # "bodyStart":I
    .end local v56    # "nsAndroid":I
    .end local v57    # "ct2":I
    .local v0, "ct2":I
    .local v1, "nsAndroid":I
    .local v4, "ename":I
    .local v8, "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .local v10, "nameActivityAlias":I
    .restart local v12    # "vDefault":I
    .restart local v13    # "bodyStart":I
    .restart local v36    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v39    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_16
    move/from16 v57, v0

    move/from16 v56, v1

    move/from16 v23, v4

    move-object/from16 v41, v8

    move/from16 v45, v10

    move/from16 v51, v12

    move/from16 v52, v13

    move-object/from16 v4, v36

    move-object/from16 v0, v39

    .end local v1    # "nsAndroid":I
    .end local v8    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v10    # "nameActivityAlias":I
    .end local v12    # "vDefault":I
    .end local v13    # "bodyStart":I
    .end local v36    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v39    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v0, "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v4, "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v23    # "ename":I
    .restart local v41    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v45    # "nameActivityAlias":I
    .restart local v51    # "vDefault":I
    .restart local v52    # "bodyStart":I
    .restart local v56    # "nsAndroid":I
    .restart local v57    # "ct2":I
    move/from16 v1, v25

    .line 760
    .local v1, "appNameIdx":I
    move v8, v6

    .line 761
    .local v8, "csz":I
    move v10, v5

    .line 763
    .local v10, "off":I
    :goto_12
    move-object v12, v14

    .line 764
    .end local v29    # "curAct2":Ljava/lang/String;
    .local v12, "curAct2":Ljava/lang/String;
    move v13, v1

    .line 765
    .end local v23    # "ename":I
    .end local v25    # "appNameIdx2":I
    .local v13, "appNameIdx2":I
    move/from16 v23, v3

    move-object/from16 v29, v12

    move/from16 v25, v13

    move-object/from16 v5, v22

    move/from16 v12, v45

    move/from16 v14, v57

    move-object/from16 v22, v2

    goto :goto_13

    .line 766
    .end local v4    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "off2":I
    .end local v7    # "attrName":I
    .end local v8    # "csz":I
    .end local v9    # "nameActivityAlias2":I
    .end local v10    # "off":I
    .end local v14    # "curAct":Ljava/lang/String;
    .end local v15    # "nameCategory":I
    .end local v22    # "stack":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v45    # "nameActivityAlias":I
    .end local v51    # "vDefault":I
    .end local v52    # "bodyStart":I
    .end local v56    # "nsAndroid":I
    .end local v57    # "ct2":I
    .local v0, "ct2":I
    .local v1, "nsAndroid":I
    .local v12, "vDefault":I
    .local v13, "bodyStart":I
    .restart local v25    # "appNameIdx2":I
    .restart local v29    # "curAct2":Ljava/lang/String;
    .local v34, "nameActivityAlias2":I
    .restart local v36    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v39    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v43, "attrName":I
    .local v44, "nameCategory":I
    :cond_17
    move/from16 v57, v0

    move/from16 v56, v1

    move/from16 v51, v12

    move/from16 v52, v13

    move/from16 v9, v34

    move-object/from16 v4, v36

    move-object/from16 v0, v39

    move/from16 v7, v43

    move/from16 v15, v44

    .end local v1    # "nsAndroid":I
    .end local v12    # "vDefault":I
    .end local v13    # "bodyStart":I
    .end local v34    # "nameActivityAlias2":I
    .end local v36    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v39    # "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v43    # "attrName":I
    .end local v44    # "nameCategory":I
    .local v0, "launcherOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .restart local v4    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v7    # "attrName":I
    .restart local v9    # "nameActivityAlias2":I
    .restart local v15    # "nameCategory":I
    .restart local v51    # "vDefault":I
    .restart local v52    # "bodyStart":I
    .restart local v56    # "nsAndroid":I
    .restart local v57    # "ct2":I
    move/from16 v1, v25

    .line 767
    .local v1, "appNameIdx4":I
    move v8, v6

    .line 768
    .restart local v8    # "csz":I
    nop

    .line 769
    move-object/from16 v5, v28

    .line 770
    .local v5, "stack":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move v10, v3

    .line 771
    .restart local v10    # "off":I
    move v12, v9

    .line 772
    .local v12, "nameActivityAlias":I
    nop

    .line 773
    const/16 v13, 0x103

    move/from16 v14, v57

    .end local v57    # "ct2":I
    .local v14, "ct2":I
    if-ne v14, v13, :cond_1a

    .line 774
    add-int/lit8 v13, v10, 0x14

    move-object/from16 v22, v2

    move/from16 v23, v3

    .end local v3    # "off3":I
    .local v23, "off3":I
    invoke-direct {v11, v13}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v2

    long-to-int v2, v2

    .line 775
    .local v2, "ename3":I
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_18

    .line 776
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v5, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 778
    :cond_18
    move v3, v1

    .line 779
    .end local v25    # "appNameIdx2":I
    .local v3, "appNameIdx2":I
    if-ne v2, v3, :cond_19

    .line 780
    move/from16 v30, v10

    .line 782
    .end local v2    # "ename3":I
    :cond_19
    move/from16 v25, v3

    goto :goto_13

    .line 783
    .end local v23    # "off3":I
    .local v3, "off3":I
    .restart local v25    # "appNameIdx2":I
    :cond_1a
    move-object/from16 v22, v2

    move/from16 v23, v3

    .end local v3    # "off3":I
    .restart local v23    # "off3":I
    move v2, v1

    move/from16 v25, v2

    .line 786
    .end local v1    # "appNameIdx4":I
    :goto_13
    add-int v2, v10, v8

    .line 787
    .end local v37    # "nameApplication":I
    .local v2, "nameApplication":I
    move/from16 v27, v52

    .line 788
    move v3, v12

    .line 789
    .end local v9    # "nameActivityAlias2":I
    .local v3, "nameActivityAlias2":I
    move/from16 v26, v51

    .line 790
    move/from16 v1, v56

    .end local v56    # "nsAndroid":I
    .local v1, "nsAndroid":I
    move/from16 v24, v1

    .line 791
    nop

    .line 792
    nop

    .line 793
    move-object/from16 v28, v5

    .line 794
    .end local v6    # "csz2":I
    .end local v14    # "ct2":I
    .end local v23    # "off3":I
    move-object/from16 v12, p2

    move v6, v3

    move-object v5, v4

    move v9, v7

    move v10, v15

    move/from16 v13, v31

    move/from16 v7, v35

    move/from16 v14, v38

    move/from16 v15, v40

    move-object/from16 v23, v41

    move/from16 v8, v42

    move v4, v2

    move-object/from16 v2, v22

    move-object/from16 v22, v0

    goto/16 :goto_1

    .line 866
    .end local v2    # "nameApplication":I
    .end local v4    # "launcherActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "stack":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v7    # "attrName":I
    .end local v8    # "csz":I
    .end local v12    # "nameActivityAlias":I
    .end local v20    # "endHeaders":I
    .end local v24    # "nsAndroid2":I
    .end local v25    # "appNameIdx2":I
    .end local v26    # "vDefault2":I
    .end local v27    # "ct":I
    .end local v28    # "stack2":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v29    # "curAct2":Ljava/lang/String;
    .end local v30    # "applicationEndOff":I
    .end local v31    # "nameActivity":I
    .end local v35    # "i2":I
    .end local v38    # "nameIntentFilter":I
    .end local v40    # "nameAction":I
    .end local v41    # "allActs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v42    # "i":I
    .end local v51    # "vDefault":I
    .end local v52    # "bodyStart":I
    .local v0, "nsAndroid2":I
    .local v1, "appNameIdx2":I
    .local v3, "vDefault2":I
    .local v9, "attrName":I
    .local v10, "nameCategory":I
    .local v13, "nameActivity":I
    .local v14, "nameIntentFilter":I
    .local v15, "nameAction":I
    :cond_1b
    move/from16 v24, v0

    .end local v0    # "nsAndroid2":I
    .restart local v24    # "nsAndroid2":I
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "\u6e05\u5355\u4e2d\u672a\u627e\u5230 <application>"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public listActivities()Ljava/util/List;
    .locals 35
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/licenseinjector/app/core/AxmLEditor$Entry;",
            ">;"
        }
    .end annotation

    .line 392
    move-object/from16 v0, p0

    .line 393
    .local v0, "axmLEditor":Lcom/licenseinjector/app/core/AxmLEditor;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 394
    .local v1, "acc2":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    iget-object v2, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    const-string v3, "name"

    invoke-interface {v2, v3}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v2

    .line 395
    .local v2, "attrName":I
    if-gez v2, :cond_0

    .line 396
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    return-object v3

    .line 398
    :cond_0
    iget-object v3, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    const-string v4, "activity"

    invoke-interface {v3, v4}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v3

    .line 399
    .local v3, "nameActivity2":I
    iget-object v4, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    const-string v5, "activity-alias"

    invoke-interface {v4, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v4

    .line 400
    .local v4, "nameActivity3":I
    iget-object v5, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    const-string v6, "action"

    invoke-interface {v5, v6}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v5

    .line 401
    .local v5, "nameAction":I
    iget-object v6, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    const-string v7, "category"

    invoke-interface {v6, v7}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v6

    .line 402
    .local v6, "nameCategory":I
    invoke-direct/range {p0 .. p0}, Lcom/licenseinjector/app/core/AxmLEditor;->ensureAndroidNs()I

    move-result v7

    .line 403
    .local v7, "androidNs":I
    iget-object v8, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    const-string v9, "targetActivity"

    invoke-interface {v8, v9}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v8

    .line 404
    .local v8, "attrTarget":I
    iget-object v9, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    const-string v10, "noHistory"

    invoke-interface {v9, v10}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v9

    .line 405
    .local v9, "attrNoHist":I
    iget-object v10, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    const-string v11, "launchMode"

    invoke-interface {v10, v11}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v10

    .line 406
    .local v10, "attrLaunch":I
    iget-object v11, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    const-string v12, "process"

    invoke-interface {v11, v12}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v11

    .line 407
    .local v11, "attrProcess":I
    iget v12, v0, Lcom/licenseinjector/app/core/AxmLEditor;->stringPoolOff:I

    iget v13, v0, Lcom/licenseinjector/app/core/AxmLEditor;->stringPoolSize:I

    add-int/2addr v12, v13

    .line 408
    .local v12, "i":I
    iget v13, v0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapOff:I

    .line 409
    .local v13, "i2":I
    if-ltz v13, :cond_1

    iget v15, v0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapSize:I

    add-int/2addr v15, v13

    goto :goto_0

    :cond_1
    const/4 v15, 0x0

    :goto_0
    invoke-static {v12, v15}, Ljava/lang/Math;->max(II)I

    move-result v15

    .line 410
    .local v15, "endHeaders":I
    const/16 v16, 0x0

    .line 411
    .local v16, "cur":Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;
    const/16 v17, 0x0

    .line 412
    .local v17, "isAlias":Z
    const/16 v18, 0x0

    .line 413
    .local v18, "hasLauncher2":Z
    move/from16 v19, v15

    move-object/from16 v14, v16

    move/from16 v34, v19

    move/from16 v19, v12

    move/from16 v12, v34

    .line 415
    .end local v16    # "cur":Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;
    .local v12, "endHeaders2":I
    .local v14, "cur":Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;
    .local v19, "i":I
    :goto_1
    move-object/from16 v20, v1

    .line 416
    .local v20, "acc":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    move/from16 v21, v17

    .line 417
    .local v21, "hasMain2":Z
    move-object/from16 v22, v1

    .end local v1    # "acc2":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    .local v22, "acc2":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    add-int/lit8 v1, v12, 0x8

    move/from16 v23, v13

    .end local v13    # "i2":I
    .local v23, "i2":I
    iget-object v13, v0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    array-length v13, v13

    if-le v1, v13, :cond_2

    .line 418
    move/from16 v25, v5

    move/from16 v26, v6

    move/from16 v24, v15

    goto :goto_2

    .line 420
    :cond_2
    invoke-direct {v0, v12}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v1

    .line 421
    .local v1, "ct":I
    move/from16 v13, v18

    .line 422
    .local v13, "hasLauncher3":Z
    move/from16 v24, v15

    .end local v15    # "endHeaders":I
    .local v24, "endHeaders":I
    add-int/lit8 v15, v12, 0x4

    move/from16 v25, v5

    move/from16 v26, v6

    .end local v5    # "nameAction":I
    .end local v6    # "nameCategory":I
    .local v25, "nameAction":I
    .local v26, "nameCategory":I
    invoke-direct {v0, v15}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v5

    long-to-int v5, v5

    .line 423
    .local v5, "csz2":I
    if-gtz v5, :cond_9

    .line 424
    nop

    .line 547
    .end local v1    # "ct":I
    .end local v5    # "csz2":I
    .end local v13    # "hasLauncher3":Z
    .end local v21    # "hasMain2":Z
    :goto_2
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v1, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 548
    .local v1, "out":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$Entry;>;"
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;

    .line 549
    .local v6, "a":Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;
    move v13, v2

    .line 550
    .local v13, "attrName2":I
    iget-boolean v15, v6, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->launcher:Z

    if-eqz v15, :cond_3

    .line 551
    invoke-virtual {v6}, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->toEntry()Lcom/licenseinjector/app/core/AxmLEditor$Entry;

    move-result-object v15

    invoke-interface {v1, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 553
    :cond_3
    move v2, v13

    .line 554
    .end local v6    # "a":Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;
    .end local v13    # "attrName2":I
    goto :goto_3

    .line 555
    :cond_4
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;

    .line 556
    .local v6, "a2":Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;
    iget-boolean v13, v6, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->launcher:Z

    if-nez v13, :cond_5

    iget-boolean v13, v6, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->main:Z

    if-eqz v13, :cond_5

    .line 557
    invoke-virtual {v6}, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->toEntry()Lcom/licenseinjector/app/core/AxmLEditor$Entry;

    move-result-object v13

    invoke-interface {v1, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 559
    .end local v6    # "a2":Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;
    :cond_5
    goto :goto_4

    .line 560
    :cond_6
    invoke-interface/range {v20 .. v20}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;

    .line 561
    .local v6, "a3":Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;
    iget-boolean v13, v6, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->launcher:Z

    if-nez v13, :cond_7

    iget-boolean v13, v6, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->main:Z

    if-nez v13, :cond_7

    .line 562
    invoke-virtual {v6}, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->toEntry()Lcom/licenseinjector/app/core/AxmLEditor$Entry;

    move-result-object v13

    invoke-interface {v1, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 564
    .end local v6    # "a3":Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;
    :cond_7
    goto :goto_5

    .line 565
    :cond_8
    return-object v1

    .line 426
    .local v1, "ct":I
    .restart local v5    # "csz2":I
    .local v13, "hasLauncher3":Z
    .restart local v21    # "hasMain2":Z
    :cond_9
    const/4 v6, 0x1

    .line 427
    .local v6, "isAct":Z
    const/16 v15, 0x102

    if-ne v1, v15, :cond_18

    .line 428
    move v15, v5

    .line 429
    .local v15, "csz":I
    move/from16 v27, v15

    .end local v15    # "csz":I
    .local v27, "csz":I
    add-int/lit8 v15, v12, 0x14

    move/from16 v28, v5

    move/from16 v29, v6

    .end local v5    # "csz2":I
    .end local v6    # "isAct":Z
    .local v28, "csz2":I
    .local v29, "isAct":Z
    invoke-direct {v0, v15}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v5

    long-to-int v5, v5

    .line 430
    .local v5, "ename":I
    if-ltz v4, :cond_a

    if-ne v5, v4, :cond_a

    const/4 v6, 0x1

    goto :goto_6

    :cond_a
    const/4 v6, 0x0

    .line 431
    .local v6, "isAlias2":Z
    :goto_6
    if-ltz v3, :cond_b

    if-eq v5, v3, :cond_c

    :cond_b
    if-nez v6, :cond_c

    .line 432
    const/4 v15, 0x0

    .end local v29    # "isAct":Z
    .local v15, "isAct":Z
    goto :goto_7

    .line 434
    .end local v15    # "isAct":Z
    .restart local v29    # "isAct":Z
    :cond_c
    move/from16 v15, v29

    .end local v29    # "isAct":Z
    .restart local v15    # "isAct":Z
    :goto_7
    if-eqz v15, :cond_11

    .line 435
    move/from16 v29, v4

    .line 436
    .local v29, "nameAlias2":I
    move/from16 v30, v15

    .end local v15    # "isAct":Z
    .local v30, "isAct":Z
    invoke-direct {v0, v12, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->readAndroidName(II)Ljava/lang/String;

    move-result-object v15

    .line 437
    .local v15, "n":Ljava/lang/String;
    const/16 v31, 0x0

    if-eqz v15, :cond_e

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v32

    if-gtz v32, :cond_d

    move/from16 v32, v1

    move/from16 v33, v3

    goto :goto_8

    :cond_d
    move/from16 v32, v1

    .end local v1    # "ct":I
    .local v32, "ct":I
    new-instance v1, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;

    move/from16 v33, v3

    .end local v3    # "nameActivity2":I
    .local v33, "nameActivity2":I
    invoke-virtual {v0, v15}, Lcom/licenseinjector/app/core/AxmLEditor;->fullName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;-><init>(Ljava/lang/String;)V

    goto :goto_9

    .end local v32    # "ct":I
    .end local v33    # "nameActivity2":I
    .restart local v1    # "ct":I
    .restart local v3    # "nameActivity2":I
    :cond_e
    move/from16 v32, v1

    move/from16 v33, v3

    .end local v1    # "ct":I
    .end local v3    # "nameActivity2":I
    .restart local v32    # "ct":I
    .restart local v33    # "nameActivity2":I
    :goto_8
    move-object/from16 v1, v31

    :goto_9
    move-object v14, v1

    .line 438
    if-eqz v14, :cond_10

    .line 439
    iput-boolean v6, v14, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->alias:Z

    .line 440
    invoke-direct {v0, v12, v8, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->readAndroidAttr(III)Ljava/lang/String;

    move-result-object v1

    .line 441
    .local v1, "tgt":Ljava/lang/String;
    if-eqz v1, :cond_f

    invoke-virtual {v0, v1}, Lcom/licenseinjector/app/core/AxmLEditor;->fullName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    :cond_f
    move-object/from16 v3, v31

    iput-object v3, v14, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->target:Ljava/lang/String;

    .line 442
    const-string v3, "true"

    move-object/from16 v31, v1

    .end local v1    # "tgt":Ljava/lang/String;
    .local v31, "tgt":Ljava/lang/String;
    invoke-direct {v0, v12, v9, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->readAndroidAttr(III)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, v14, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->noHistory:Z

    .line 443
    invoke-direct {v0, v12, v10, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->readAndroidAttr(III)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/licenseinjector/app/core/AxmLEditor;->launchModeName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v14, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->launchMode:Ljava/lang/String;

    .line 444
    invoke-direct {v0, v12, v11, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->readAndroidAttr(III)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v14, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->process:Ljava/lang/String;

    .line 446
    .end local v31    # "tgt":Ljava/lang/String;
    :cond_10
    const/4 v1, 0x0

    .line 447
    .end local v17    # "isAlias":Z
    .local v1, "isAlias":Z
    const/4 v3, 0x0

    .line 448
    .end local v15    # "n":Ljava/lang/String;
    .local v3, "hasLauncher":Z
    move v15, v3

    move/from16 v3, v26

    goto/16 :goto_b

    .line 449
    .end local v29    # "nameAlias2":I
    .end local v30    # "isAct":Z
    .end local v32    # "ct":I
    .end local v33    # "nameActivity2":I
    .local v1, "ct":I
    .local v3, "nameActivity2":I
    .local v15, "isAct":Z
    .restart local v17    # "isAlias":Z
    :cond_11
    move/from16 v32, v1

    move/from16 v33, v3

    move/from16 v30, v15

    .line 450
    .end local v1    # "ct":I
    .end local v3    # "nameActivity2":I
    .end local v15    # "isAct":Z
    .restart local v30    # "isAct":Z
    .restart local v32    # "ct":I
    .restart local v33    # "nameActivity2":I
    nop

    .line 451
    move/from16 v29, v4

    .line 452
    .restart local v29    # "nameAlias2":I
    if-eqz v14, :cond_13

    if-ltz v25, :cond_13

    move/from16 v1, v25

    .end local v25    # "nameAction":I
    .local v1, "nameAction":I
    if-ne v5, v1, :cond_14

    .line 453
    const-string v3, "android.intent.action.MAIN"

    invoke-direct {v0, v12, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->readAndroidName(II)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v3, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 454
    const/4 v3, 0x1

    .line 455
    .end local v17    # "isAlias":Z
    .local v3, "isAlias":Z
    move v15, v13

    move/from16 v25, v1

    move v1, v3

    move/from16 v3, v26

    .local v15, "hasLauncher":Z
    goto :goto_b

    .line 457
    .end local v3    # "isAlias":Z
    .end local v15    # "hasLauncher":Z
    .restart local v17    # "isAlias":Z
    :cond_12
    move/from16 v3, v21

    .line 458
    .end local v17    # "isAlias":Z
    .restart local v3    # "isAlias":Z
    move v15, v13

    move/from16 v25, v1

    move v1, v3

    move/from16 v3, v26

    .restart local v15    # "hasLauncher":Z
    goto :goto_b

    .line 452
    .end local v1    # "nameAction":I
    .end local v3    # "isAlias":Z
    .end local v15    # "hasLauncher":Z
    .restart local v17    # "isAlias":Z
    .restart local v25    # "nameAction":I
    :cond_13
    move/from16 v1, v25

    .line 460
    .end local v25    # "nameAction":I
    .restart local v1    # "nameAction":I
    :cond_14
    if-eqz v14, :cond_17

    if-ltz v26, :cond_17

    move/from16 v3, v26

    .end local v26    # "nameCategory":I
    .local v3, "nameCategory":I
    if-ne v5, v3, :cond_16

    const-string v15, "android.intent.category.LAUNCHER"

    move/from16 v25, v1

    .end local v1    # "nameAction":I
    .restart local v25    # "nameAction":I
    invoke-direct {v0, v12, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->readAndroidName(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v15, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_15

    goto :goto_a

    .line 464
    :cond_15
    const/4 v1, 0x1

    .line 465
    .local v1, "hasLauncher":Z
    move/from16 v15, v21

    move/from16 v34, v15

    move v15, v1

    move/from16 v1, v34

    .end local v17    # "isAlias":Z
    .local v15, "isAlias":Z
    goto :goto_b

    .line 460
    .end local v15    # "isAlias":Z
    .end local v25    # "nameAction":I
    .local v1, "nameAction":I
    .restart local v17    # "isAlias":Z
    :cond_16
    move/from16 v25, v1

    .end local v1    # "nameAction":I
    .restart local v25    # "nameAction":I
    goto :goto_a

    .end local v3    # "nameCategory":I
    .end local v25    # "nameAction":I
    .restart local v1    # "nameAction":I
    .restart local v26    # "nameCategory":I
    :cond_17
    move/from16 v25, v1

    move/from16 v3, v26

    .line 461
    .end local v1    # "nameAction":I
    .end local v26    # "nameCategory":I
    .restart local v3    # "nameCategory":I
    .restart local v25    # "nameAction":I
    :goto_a
    move/from16 v1, v21

    .line 462
    .end local v17    # "isAlias":Z
    .local v1, "isAlias":Z
    move v15, v13

    .line 468
    .local v15, "hasLauncher":Z
    :goto_b
    move/from16 v17, v15

    .line 469
    .local v17, "hasMain":Z
    nop

    .line 470
    move/from16 v26, v29

    .line 471
    .local v26, "nameAlias":I
    move/from16 v5, v33

    .line 472
    .end local v6    # "isAlias2":Z
    .local v5, "nameActivity":I
    move/from16 v6, v21

    move/from16 v15, v27

    move/from16 v29, v30

    move-object/from16 v21, v0

    move/from16 v27, v3

    move-object/from16 v0, v20

    move/from16 v34, v26

    move/from16 v26, v2

    move/from16 v2, v34

    goto/16 :goto_12

    .line 473
    .end local v15    # "hasLauncher":Z
    .end local v27    # "csz":I
    .end local v28    # "csz2":I
    .end local v29    # "nameAlias2":I
    .end local v30    # "isAct":Z
    .end local v32    # "ct":I
    .end local v33    # "nameActivity2":I
    .local v1, "ct":I
    .local v3, "nameActivity2":I
    .local v5, "csz2":I
    .local v6, "isAct":Z
    .local v17, "isAlias":Z
    .local v26, "nameCategory":I
    :cond_18
    move/from16 v32, v1

    move/from16 v33, v3

    move/from16 v28, v5

    move/from16 v29, v6

    move/from16 v3, v26

    .end local v1    # "ct":I
    .end local v5    # "csz2":I
    .end local v6    # "isAct":Z
    .end local v26    # "nameCategory":I
    .local v3, "nameCategory":I
    .restart local v28    # "csz2":I
    .local v29, "isAct":Z
    .restart local v32    # "ct":I
    .restart local v33    # "nameActivity2":I
    move/from16 v1, v33

    .line 474
    .local v1, "nameActivity4":I
    move v5, v4

    .line 475
    .local v5, "nameAlias3":I
    move/from16 v15, v28

    .line 476
    .local v15, "csz":I
    const/16 v6, 0x103

    move/from16 v26, v2

    move/from16 v2, v32

    .end local v32    # "ct":I
    .local v2, "ct":I
    .local v26, "attrName":I
    if-ne v2, v6, :cond_21

    .line 477
    add-int/lit8 v6, v12, 0x14

    move/from16 v32, v2

    move/from16 v27, v3

    .end local v2    # "ct":I
    .end local v3    # "nameCategory":I
    .local v27, "nameCategory":I
    .restart local v32    # "ct":I
    invoke-direct {v0, v6}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v2

    long-to-int v2, v2

    .line 478
    .local v2, "ename2":I
    if-ltz v1, :cond_1b

    .line 479
    move v3, v1

    .line 480
    .local v3, "nameActivity":I
    nop

    .line 481
    nop

    .line 483
    if-eqz v29, :cond_1a

    .line 484
    if-nez v14, :cond_19

    .line 485
    move/from16 v6, v21

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    goto :goto_c

    .line 487
    :cond_19
    iput-boolean v13, v14, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->launcher:Z

    .line 488
    move/from16 v6, v21

    .end local v21    # "hasMain2":Z
    .local v6, "hasMain2":Z
    iput-boolean v6, v14, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->main:Z

    .line 489
    nop

    .line 490
    move-object/from16 v21, v0

    move-object/from16 v0, v20

    .end local v20    # "acc":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    .local v0, "acc":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    .local v21, "axmLEditor":Lcom/licenseinjector/app/core/AxmLEditor;
    invoke-static {v0, v14}, Lcom/licenseinjector/app/core/AxmLEditor;->addAcc(Ljava/util/List;Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;)V

    .line 492
    :goto_c
    const/4 v14, 0x0

    .line 493
    const/16 v20, 0x0

    .line 494
    .local v20, "hasMain":Z
    const/16 v17, 0x0

    goto :goto_d

    .line 483
    .end local v6    # "hasMain2":Z
    .local v0, "axmLEditor":Lcom/licenseinjector/app/core/AxmLEditor;
    .local v20, "acc":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    .local v21, "hasMain2":Z
    :cond_1a
    move/from16 v6, v21

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    .end local v20    # "acc":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    .local v0, "acc":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    .restart local v6    # "hasMain2":Z
    .local v21, "axmLEditor":Lcom/licenseinjector/app/core/AxmLEditor;
    goto :goto_d

    .line 497
    .end local v3    # "nameActivity":I
    .end local v6    # "hasMain2":Z
    .local v0, "axmLEditor":Lcom/licenseinjector/app/core/AxmLEditor;
    .restart local v20    # "acc":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    .local v21, "hasMain2":Z
    :cond_1b
    move/from16 v6, v21

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    .end local v20    # "acc":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    .local v0, "acc":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    .restart local v6    # "hasMain2":Z
    .local v21, "axmLEditor":Lcom/licenseinjector/app/core/AxmLEditor;
    move v3, v1

    .line 499
    .restart local v3    # "nameActivity":I
    :goto_d
    if-ltz v5, :cond_1d

    .line 500
    move/from16 v20, v5

    .line 501
    .local v20, "nameAlias":I
    nop

    .line 503
    if-eqz v29, :cond_1e

    .line 504
    if-nez v14, :cond_1c

    .line 505
    goto :goto_e

    .line 507
    :cond_1c
    iput-boolean v13, v14, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->launcher:Z

    .line 508
    iput-boolean v6, v14, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->main:Z

    .line 509
    nop

    .line 510
    invoke-static {v0, v14}, Lcom/licenseinjector/app/core/AxmLEditor;->addAcc(Ljava/util/List;Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;)V

    .line 512
    :goto_e
    const/4 v14, 0x0

    .line 513
    const/16 v30, 0x0

    .line 514
    .local v30, "hasMain":Z
    const/16 v17, 0x0

    goto :goto_f

    .line 517
    .end local v20    # "nameAlias":I
    .end local v30    # "hasMain":Z
    :cond_1d
    move/from16 v20, v5

    .line 519
    .restart local v20    # "nameAlias":I
    :cond_1e
    :goto_f
    const/16 v29, 0x0

    .line 520
    if-eqz v29, :cond_20

    .line 521
    if-nez v14, :cond_1f

    .line 522
    goto :goto_10

    .line 524
    :cond_1f
    iput-boolean v13, v14, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->launcher:Z

    .line 525
    iput-boolean v6, v14, Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;->main:Z

    .line 526
    nop

    .line 527
    invoke-static {v0, v14}, Lcom/licenseinjector/app/core/AxmLEditor;->addAcc(Ljava/util/List;Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;)V

    .line 529
    :goto_10
    const/4 v14, 0x0

    .line 530
    const/16 v30, 0x0

    .line 531
    .restart local v30    # "hasMain":Z
    const/16 v17, 0x0

    .line 533
    .end local v2    # "ename2":I
    .end local v30    # "hasMain":Z
    :cond_20
    move/from16 v2, v20

    goto :goto_11

    .line 534
    .end local v6    # "hasMain2":Z
    .end local v27    # "nameCategory":I
    .end local v32    # "ct":I
    .local v0, "axmLEditor":Lcom/licenseinjector/app/core/AxmLEditor;
    .local v2, "ct":I
    .local v3, "nameCategory":I
    .local v20, "acc":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    .local v21, "hasMain2":Z
    :cond_21
    move/from16 v32, v2

    move/from16 v27, v3

    move/from16 v6, v21

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    .end local v2    # "ct":I
    .end local v3    # "nameCategory":I
    .end local v20    # "acc":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    .local v0, "acc":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    .restart local v6    # "hasMain2":Z
    .local v21, "axmLEditor":Lcom/licenseinjector/app/core/AxmLEditor;
    .restart local v27    # "nameCategory":I
    .restart local v32    # "ct":I
    move v2, v5

    .line 535
    .local v2, "nameAlias":I
    move v3, v1

    .line 537
    .local v3, "nameActivity":I
    :goto_11
    move/from16 v17, v6

    .line 538
    move/from16 v20, v13

    move v5, v3

    move/from16 v1, v17

    move/from16 v17, v20

    .line 540
    .end local v3    # "nameActivity":I
    .local v1, "isAlias":Z
    .local v5, "nameActivity":I
    .local v17, "hasMain":Z
    :goto_12
    add-int/2addr v12, v15

    .line 541
    move-object v3, v0

    .line 542
    .end local v22    # "acc2":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    .local v3, "acc2":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$EntryAcc;>;"
    move/from16 v20, v5

    .line 543
    .end local v33    # "nameActivity2":I
    .local v20, "nameActivity2":I
    move v4, v2

    .line 544
    move/from16 v18, v17

    .line 545
    move-object/from16 v6, p0

    .line 546
    .end local v13    # "hasLauncher3":Z
    .end local v21    # "axmLEditor":Lcom/licenseinjector/app/core/AxmLEditor;
    .end local v28    # "csz2":I
    .end local v29    # "isAct":Z
    .end local v32    # "ct":I
    .local v6, "axmLEditor":Lcom/licenseinjector/app/core/AxmLEditor;
    move/from16 v17, v1

    move-object v1, v3

    move-object v0, v6

    move/from16 v3, v20

    move/from16 v13, v23

    move/from16 v15, v24

    move/from16 v5, v25

    move/from16 v2, v26

    move/from16 v6, v27

    goto/16 :goto_1
.end method

.method public listEntryCandidates()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/licenseinjector/app/core/AxmLEditor$Entry;",
            ">;"
        }
    .end annotation

    .line 621
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 622
    .local v0, "out":Ljava/util/List;, "Ljava/util/List<Lcom/licenseinjector/app/core/AxmLEditor$Entry;>;"
    invoke-virtual {p0}, Lcom/licenseinjector/app/core/AxmLEditor;->listActivities()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/licenseinjector/app/core/AxmLEditor$Entry;

    .line 623
    .local v2, "e":Lcom/licenseinjector/app/core/AxmLEditor$Entry;
    invoke-virtual {v2}, Lcom/licenseinjector/app/core/AxmLEditor$Entry;->isEntry()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 624
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 626
    .end local v2    # "e":Lcom/licenseinjector/app/core/AxmLEditor$Entry;
    :cond_0
    goto :goto_0

    .line 627
    :cond_1
    return-object v0
.end method

.method public restoreLauncher(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 51
    .param p1, "origLauncher"    # Ljava/lang/String;
    .param p2, "gateClass"    # Ljava/lang/String;

    .line 875
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const/4 v3, 0x0

    if-eqz v2, :cond_1c

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    move-object v4, v2

    move-object v1, v3

    goto/16 :goto_10

    .line 878
    :cond_0
    iget-object v4, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    const-string v5, "android.intent.category.LAUNCHER"

    invoke-interface {v4, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v4

    .line 879
    .local v4, "vLauncher":I
    iget-object v5, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    const-string v6, "android.intent.category.DEFAULT"

    invoke-interface {v5, v6}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v5

    .line 880
    .local v5, "vDefault":I
    if-ltz v4, :cond_1b

    if-ltz v5, :cond_1b

    .line 881
    iget-object v6, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    const-string v7, "name"

    invoke-interface {v6, v7}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v6

    .line 882
    .local v6, "attrName":I
    const-string v7, "activity"

    invoke-direct {v0, v7}, Lcom/licenseinjector/app/core/AxmLEditor;->nameIndex(Ljava/lang/String;)I

    move-result v7

    .line 883
    .local v7, "nameActivity":I
    const-string v8, "activity-alias"

    invoke-direct {v0, v8}, Lcom/licenseinjector/app/core/AxmLEditor;->nameIndex(Ljava/lang/String;)I

    move-result v8

    .line 884
    .local v8, "nameActivityAlias":I
    const-string v9, "category"

    invoke-direct {v0, v9}, Lcom/licenseinjector/app/core/AxmLEditor;->nameIndex(Ljava/lang/String;)I

    move-result v9

    .line 885
    .local v9, "nameCategory":I
    if-ltz v6, :cond_1a

    if-gez v7, :cond_1

    move/from16 v23, v4

    move/from16 v32, v5

    move/from16 v24, v6

    move/from16 v42, v7

    move/from16 v43, v8

    move-object v4, v2

    goto/16 :goto_f

    .line 888
    :cond_1
    if-gez v9, :cond_2

    .line 889
    return-object v3

    .line 891
    :cond_2
    iget-object v10, v0, Lcom/licenseinjector/app/core/AxmLEditor;->strings:Ljava/util/List;

    const-string v11, "application"

    invoke-interface {v10, v11}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v10

    .line 892
    .local v10, "appNameIdx2":I
    iget v11, v0, Lcom/licenseinjector/app/core/AxmLEditor;->stringPoolOff:I

    iget v12, v0, Lcom/licenseinjector/app/core/AxmLEditor;->stringPoolSize:I

    add-int/2addr v11, v12

    .line 893
    .local v11, "i":I
    iget v12, v0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapOff:I

    .line 894
    .local v12, "i2":I
    if-ltz v12, :cond_3

    iget v14, v0, Lcom/licenseinjector/app/core/AxmLEditor;->resMapSize:I

    add-int/2addr v14, v12

    goto :goto_0

    :cond_3
    const/4 v14, 0x0

    :goto_0
    invoke-static {v11, v14}, Ljava/lang/Math;->max(II)I

    move-result v14

    .line 895
    .local v14, "endHeaders":I
    const/4 v15, -0x1

    .line 896
    .local v15, "applicationEndOff2":I
    const/16 v16, -0x1

    .line 897
    .local v16, "gateStart":I
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 898
    .local v17, "origCatOffs2":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/16 v18, -0x1

    .line 899
    .local v18, "gateEnd":I
    const/16 v19, -0x1

    .line 900
    .local v19, "gateDepth2":I
    move/from16 v20, v4

    .line 901
    .local v20, "gateEnd2":I
    const/16 v21, 0x0

    .line 902
    .local v21, "curAct":Ljava/lang/String;
    const/16 v22, 0x0

    .line 903
    .local v22, "depth":I
    move/from16 v23, v14

    move/from16 v13, v18

    move-object/from16 v24, v21

    move/from16 v25, v22

    move/from16 v3, v23

    .line 905
    .end local v18    # "gateEnd":I
    .end local v21    # "curAct":Ljava/lang/String;
    .end local v22    # "depth":I
    .local v3, "bodyStart":I
    .local v13, "gateEnd":I
    .local v24, "curAct":Ljava/lang/String;
    .local v25, "depth":I
    :goto_1
    move/from16 v22, v15

    .line 906
    .local v22, "applicationEndOff":I
    move/from16 v23, v4

    .end local v4    # "vLauncher":I
    .local v23, "vLauncher":I
    add-int/lit8 v4, v3, 0x8

    .line 907
    .local v4, "applicationEndOff3":I
    move/from16 v26, v10

    .line 908
    .local v26, "appNameIdx3":I
    move/from16 v27, v19

    .line 909
    .local v27, "gateDepth3":I
    move/from16 v28, v10

    .end local v10    # "appNameIdx2":I
    .local v28, "appNameIdx2":I
    iget-object v10, v0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    array-length v10, v10

    move/from16 v29, v11

    .end local v11    # "i":I
    .local v29, "i":I
    if-le v4, v10, :cond_4

    .line 910
    move/from16 v31, v12

    goto :goto_2

    .line 912
    :cond_4
    invoke-direct {v0, v3}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v10

    .line 913
    .local v10, "ct":I
    add-int/lit8 v11, v3, 0x4

    move/from16 v31, v12

    .end local v12    # "i2":I
    .local v31, "i2":I
    invoke-direct {v0, v11}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v11

    long-to-int v11, v11

    .line 914
    .local v11, "csz2":I
    if-gtz v11, :cond_a

    .line 915
    nop

    .line 1009
    .end local v4    # "applicationEndOff3":I
    .end local v10    # "ct":I
    .end local v11    # "csz2":I
    .end local v26    # "appNameIdx3":I
    .end local v27    # "gateDepth3":I
    :goto_2
    if-ltz v16, :cond_9

    if-gez v13, :cond_5

    move/from16 v32, v5

    move/from16 v18, v6

    move/from16 v12, v22

    move/from16 v22, v15

    goto/16 :goto_4

    .line 1012
    :cond_5
    move/from16 v12, v22

    .end local v22    # "applicationEndOff":I
    .local v12, "applicationEndOff":I
    if-gez v12, :cond_6

    .line 1013
    const/4 v4, 0x0

    return-object v4

    .line 1015
    :cond_6
    invoke-direct/range {p0 .. p0}, Lcom/licenseinjector/app/core/AxmLEditor;->buildStringPool()[B

    move-result-object v4

    .line 1016
    .local v4, "pool":[B
    invoke-direct/range {p0 .. p0}, Lcom/licenseinjector/app/core/AxmLEditor;->buildResMap()[B

    move-result-object v10

    .line 1017
    .local v10, "rmap":[B
    array-length v11, v4

    move/from16 v22, v15

    .end local v15    # "applicationEndOff2":I
    .local v22, "applicationEndOff2":I
    const/16 v15, 0x8

    add-int/2addr v11, v15

    array-length v15, v10

    add-int/2addr v11, v15

    .line 1018
    .local v11, "newBase":I
    iget-object v15, v0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    array-length v15, v15

    sub-int/2addr v15, v12

    .line 1019
    .local v15, "tailLen":I
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    move/from16 v32, v5

    .end local v5    # "vDefault":I
    .local v32, "vDefault":I
    iget-object v5, v0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    array-length v5, v5

    invoke-direct {v2, v5}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 1020
    .local v2, "out":Ljava/io/ByteArrayOutputStream;
    const/4 v5, 0x3

    invoke-static {v2, v5}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1021
    const/16 v5, 0x8

    invoke-static {v2, v5}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU16(Ljava/io/ByteArrayOutputStream;I)V

    .line 1022
    const/4 v5, 0x0

    invoke-static {v2, v5}, Lcom/licenseinjector/app/core/AxmLEditor;->writeU32(Ljava/io/ByteArrayOutputStream;I)V

    .line 1023
    move/from16 v18, v6

    .end local v6    # "attrName":I
    .local v18, "attrName":I
    array-length v6, v4

    invoke-virtual {v2, v4, v5, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 1024
    array-length v6, v10

    invoke-virtual {v2, v10, v5, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 1025
    iget-object v5, v0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    sub-int v6, v16, v14

    invoke-virtual {v2, v5, v14, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 1026
    iget-object v5, v0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    sub-int v6, v12, v13

    invoke-virtual {v2, v5, v13, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 1027
    if-lez v15, :cond_7

    .line 1028
    iget-object v5, v0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    invoke-virtual {v2, v5, v12, v15}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 1030
    :cond_7
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    .line 1031
    .local v5, "result":[B
    array-length v6, v5

    move-object/from16 v21, v2

    .end local v2    # "out":Ljava/io/ByteArrayOutputStream;
    .local v21, "out":Ljava/io/ByteArrayOutputStream;
    const/4 v2, 0x4

    invoke-static {v5, v2, v6}, Lcom/licenseinjector/app/core/AxmLEditor;->putU32([BII)V

    .line 1032
    const/4 v2, 0x0

    move-object/from16 v6, v17

    .line 1033
    .end local v17    # "origCatOffs2":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v2, "i3":I
    .local v6, "origCatOffs2":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :goto_3
    move-object/from16 v26, v4

    .end local v4    # "pool":[B
    .local v26, "pool":[B
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_8

    .line 1034
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    sub-int/2addr v4, v14

    add-int/2addr v4, v11

    .line 1035
    .local v4, "dataPos":I
    move-object/from16 v17, v6

    .line 1036
    .local v17, "origCatOffs3":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move/from16 v27, v20

    .line 1037
    .local v27, "vLauncher2":I
    move-object/from16 v30, v6

    move/from16 v6, v27

    .end local v27    # "vLauncher2":I
    .local v6, "vLauncher2":I
    .local v30, "origCatOffs2":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {v5, v4, v6}, Lcom/licenseinjector/app/core/AxmLEditor;->putU32([BII)V

    .line 1038
    move/from16 v27, v13

    .line 1039
    .local v27, "gateEnd3":I
    move-object/from16 v33, v10

    .end local v10    # "rmap":[B
    .local v33, "rmap":[B
    add-int/lit8 v10, v4, -0x8

    .line 1040
    .local v10, "gateEnd4":I
    invoke-static {v5, v10, v6}, Lcom/licenseinjector/app/core/AxmLEditor;->putU32([BII)V

    .line 1041
    add-int/lit8 v2, v2, 0x1

    .line 1042
    nop

    .line 1043
    move/from16 v20, v6

    .line 1044
    move-object/from16 v6, v17

    .line 1045
    .end local v4    # "dataPos":I
    .end local v10    # "gateEnd4":I
    .end local v17    # "origCatOffs3":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v27    # "gateEnd3":I
    .end local v30    # "origCatOffs2":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v6, "origCatOffs2":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    move-object/from16 v4, v26

    move-object/from16 v10, v33

    goto :goto_3

    .line 1046
    .end local v33    # "rmap":[B
    .local v10, "rmap":[B
    :cond_8
    return-object v5

    .line 1009
    .end local v2    # "i3":I
    .end local v10    # "rmap":[B
    .end local v11    # "newBase":I
    .end local v12    # "applicationEndOff":I
    .end local v18    # "attrName":I
    .end local v21    # "out":Ljava/io/ByteArrayOutputStream;
    .end local v26    # "pool":[B
    .end local v32    # "vDefault":I
    .local v5, "vDefault":I
    .local v6, "attrName":I
    .local v15, "applicationEndOff2":I
    .local v17, "origCatOffs2":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .local v22, "applicationEndOff":I
    :cond_9
    move/from16 v32, v5

    move/from16 v18, v6

    move/from16 v12, v22

    move/from16 v22, v15

    .line 1010
    .end local v5    # "vDefault":I
    .end local v6    # "attrName":I
    .end local v15    # "applicationEndOff2":I
    .restart local v12    # "applicationEndOff":I
    .restart local v18    # "attrName":I
    .local v22, "applicationEndOff2":I
    .restart local v32    # "vDefault":I
    :goto_4
    const/4 v2, 0x0

    return-object v2

    .line 917
    .end local v12    # "applicationEndOff":I
    .end local v18    # "attrName":I
    .end local v32    # "vDefault":I
    .local v4, "applicationEndOff3":I
    .restart local v5    # "vDefault":I
    .restart local v6    # "attrName":I
    .local v10, "ct":I
    .local v11, "csz2":I
    .restart local v15    # "applicationEndOff2":I
    .local v22, "applicationEndOff":I
    .local v26, "appNameIdx3":I
    .local v27, "gateDepth3":I
    :cond_a
    move/from16 v32, v5

    move/from16 v18, v6

    move/from16 v12, v22

    const/4 v5, 0x0

    move/from16 v22, v15

    .end local v5    # "vDefault":I
    .end local v6    # "attrName":I
    .end local v15    # "applicationEndOff2":I
    .restart local v12    # "applicationEndOff":I
    .restart local v18    # "attrName":I
    .local v22, "applicationEndOff2":I
    .restart local v32    # "vDefault":I
    const/16 v2, 0x102

    if-ne v10, v2, :cond_14

    .line 918
    move v2, v11

    .line 919
    .local v2, "csz":I
    add-int/lit8 v6, v3, 0x14

    invoke-direct {v0, v6}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v5

    long-to-int v5, v5

    .line 920
    .local v5, "ename":I
    move/from16 v6, v25

    .end local v25    # "depth":I
    .local v6, "depth":I
    add-int/lit8 v25, v6, 0x1

    .line 921
    .end local v6    # "depth":I
    .restart local v25    # "depth":I
    if-eq v5, v7, :cond_11

    if-ltz v8, :cond_b

    if-ne v5, v8, :cond_b

    move/from16 v34, v2

    move/from16 v37, v4

    move v1, v5

    move/from16 v42, v7

    move/from16 v43, v8

    move/from16 v6, v18

    move-object/from16 v2, v24

    goto/16 :goto_8

    .line 929
    :cond_b
    if-ne v5, v9, :cond_10

    if-eqz v1, :cond_10

    .line 930
    add-int/lit8 v6, v3, 0x2

    invoke-direct {v0, v6}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v6

    .line 931
    .local v6, "hsz":I
    nop

    .line 932
    add-int/lit8 v15, v3, 0x18

    invoke-direct {v0, v15}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v15

    .line 933
    .local v15, "aStart":I
    nop

    .line 934
    move/from16 v34, v2

    .end local v2    # "csz":I
    .local v34, "csz":I
    add-int/lit8 v2, v3, 0x1c

    .line 935
    .local v2, "nameActivityAlias2":I
    invoke-direct {v0, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->u16(I)I

    move-result v35

    .line 936
    .local v35, "aCount":I
    add-int v36, v3, v6

    add-int v36, v36, v15

    .line 937
    .local v36, "p":I
    const/16 v37, 0x0

    move/from16 v49, v35

    move/from16 v35, v2

    move/from16 v2, v49

    move/from16 v50, v37

    move/from16 v37, v4

    move/from16 v4, v50

    .line 938
    .local v2, "aCount":I
    .local v4, "aStart2":I
    .local v35, "nameActivityAlias2":I
    .local v37, "applicationEndOff3":I
    :goto_5
    if-ge v4, v2, :cond_f

    .line 939
    mul-int/lit8 v38, v4, 0x14

    add-int v38, v36, v38

    .line 940
    .local v38, "a":I
    move/from16 v39, v2

    .line 941
    .local v39, "aCount2":I
    move/from16 v40, v2

    .end local v2    # "aCount":I
    .local v40, "aCount":I
    add-int/lit8 v2, v38, 0x4

    .line 942
    .local v2, "aCount3":I
    move/from16 v41, v9

    .line 943
    .local v41, "nameCategory2":I
    move/from16 v42, v7

    move/from16 v43, v8

    .end local v7    # "nameActivity":I
    .end local v8    # "nameActivityAlias":I
    .local v42, "nameActivity":I
    .local v43, "nameActivityAlias":I
    invoke-direct {v0, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v7

    long-to-int v7, v7

    .line 944
    .local v7, "an":I
    iget-object v8, v0, Lcom/licenseinjector/app/core/AxmLEditor;->src:[B

    add-int/lit8 v44, v38, 0xf

    aget-byte v8, v8, v44

    and-int/lit16 v8, v8, 0xff

    .line 945
    .local v8, "dtype":I
    move/from16 v44, v5

    .line 946
    .local v44, "ename2":I
    move/from16 v45, v6

    .line 947
    .local v45, "hsz2":I
    move/from16 v46, v2

    .end local v2    # "aCount3":I
    .local v46, "aCount3":I
    add-int/lit8 v2, v38, 0x10

    move/from16 v47, v5

    move/from16 v48, v6

    .end local v5    # "ename":I
    .end local v6    # "hsz":I
    .local v47, "ename":I
    .local v48, "hsz":I
    invoke-direct {v0, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v5

    long-to-int v2, v5

    .line 948
    .local v2, "data":I
    move/from16 v6, v18

    .end local v18    # "attrName":I
    .local v6, "attrName":I
    if-ne v7, v6, :cond_e

    const/4 v5, 0x3

    if-ne v8, v5, :cond_e

    move/from16 v5, v32

    .end local v32    # "vDefault":I
    .local v5, "vDefault":I
    if-ne v2, v5, :cond_d

    .line 949
    move/from16 v18, v2

    move/from16 v32, v5

    move-object/from16 v2, v24

    .end local v5    # "vDefault":I
    .end local v24    # "curAct":Ljava/lang/String;
    .local v2, "curAct":Ljava/lang/String;
    .local v18, "data":I
    .restart local v32    # "vDefault":I
    invoke-virtual {v0, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->fullName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v1, v5}, Lcom/licenseinjector/app/core/AxmLEditor;->csvContains(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_c

    .line 950
    move-object/from16 v5, v17

    .local v5, "origCatOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    goto :goto_7

    .line 952
    .end local v5    # "origCatOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_c
    move-object/from16 v5, v17

    .line 953
    .restart local v5    # "origCatOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    add-int/lit8 v24, v38, 0x10

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 948
    .end local v18    # "data":I
    .end local v32    # "vDefault":I
    .local v2, "data":I
    .local v5, "vDefault":I
    .restart local v24    # "curAct":Ljava/lang/String;
    :cond_d
    move/from16 v18, v2

    move/from16 v32, v5

    move-object/from16 v2, v24

    .end local v5    # "vDefault":I
    .end local v24    # "curAct":Ljava/lang/String;
    .local v2, "curAct":Ljava/lang/String;
    .restart local v18    # "data":I
    .restart local v32    # "vDefault":I
    goto :goto_6

    .end local v18    # "data":I
    .local v2, "data":I
    .restart local v24    # "curAct":Ljava/lang/String;
    :cond_e
    move/from16 v18, v2

    move-object/from16 v2, v24

    .line 956
    .end local v24    # "curAct":Ljava/lang/String;
    .local v2, "curAct":Ljava/lang/String;
    .restart local v18    # "data":I
    :goto_6
    move-object/from16 v5, v17

    .line 958
    .local v5, "origCatOffs":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :goto_7
    add-int/lit8 v4, v4, 0x1

    .line 959
    move-object/from16 v17, v5

    .line 960
    move/from16 v1, v39

    .line 961
    .end local v40    # "aCount":I
    .local v1, "aCount":I
    move/from16 v9, v41

    .line 962
    move/from16 v24, v44

    .line 963
    .end local v47    # "ename":I
    .local v24, "ename":I
    move/from16 v40, v45

    .line 964
    .end local v48    # "hsz":I
    .local v40, "hsz":I
    nop

    .line 965
    .end local v7    # "an":I
    .end local v8    # "dtype":I
    .end local v18    # "data":I
    .end local v38    # "a":I
    .end local v39    # "aCount2":I
    .end local v41    # "nameCategory2":I
    .end local v44    # "ename2":I
    .end local v45    # "hsz2":I
    .end local v46    # "aCount3":I
    move/from16 v18, v6

    move/from16 v5, v24

    move/from16 v6, v40

    move/from16 v7, v42

    move/from16 v8, v43

    move-object/from16 v24, v2

    move v2, v1

    move-object/from16 v1, p1

    goto/16 :goto_5

    .line 966
    .end local v1    # "aCount":I
    .end local v40    # "hsz":I
    .end local v42    # "nameActivity":I
    .end local v43    # "nameActivityAlias":I
    .local v2, "aCount":I
    .local v5, "ename":I
    .local v6, "hsz":I
    .local v7, "nameActivity":I
    .local v8, "nameActivityAlias":I
    .local v18, "attrName":I
    .local v24, "curAct":Ljava/lang/String;
    :cond_f
    move/from16 v40, v2

    move/from16 v47, v5

    move/from16 v48, v6

    move/from16 v42, v7

    move/from16 v43, v8

    move/from16 v6, v18

    move-object/from16 v2, v24

    .line 967
    .end local v5    # "ename":I
    .end local v7    # "nameActivity":I
    .end local v8    # "nameActivityAlias":I
    .end local v18    # "attrName":I
    .end local v24    # "curAct":Ljava/lang/String;
    .local v2, "curAct":Ljava/lang/String;
    .local v6, "attrName":I
    .local v40, "aCount":I
    .restart local v42    # "nameActivity":I
    .restart local v43    # "nameActivityAlias":I
    .restart local v47    # "ename":I
    .restart local v48    # "hsz":I
    nop

    .line 968
    .end local v4    # "aStart2":I
    .end local v15    # "aStart":I
    .end local v35    # "nameActivityAlias2":I
    .end local v36    # "p":I
    .end local v40    # "aCount":I
    .end local v48    # "hsz":I
    move-object/from16 v4, p2

    move/from16 v15, v22

    goto :goto_a

    .line 929
    .end local v6    # "attrName":I
    .end local v34    # "csz":I
    .end local v37    # "applicationEndOff3":I
    .end local v42    # "nameActivity":I
    .end local v43    # "nameActivityAlias":I
    .end local v47    # "ename":I
    .local v2, "csz":I
    .local v4, "applicationEndOff3":I
    .restart local v5    # "ename":I
    .restart local v7    # "nameActivity":I
    .restart local v8    # "nameActivityAlias":I
    .restart local v18    # "attrName":I
    .restart local v24    # "curAct":Ljava/lang/String;
    :cond_10
    move/from16 v34, v2

    move/from16 v37, v4

    move v1, v5

    move/from16 v42, v7

    move/from16 v43, v8

    move/from16 v6, v18

    move-object/from16 v2, v24

    .line 969
    .end local v4    # "applicationEndOff3":I
    .end local v5    # "ename":I
    .end local v7    # "nameActivity":I
    .end local v8    # "nameActivityAlias":I
    .end local v18    # "attrName":I
    .end local v24    # "curAct":Ljava/lang/String;
    .local v1, "ename":I
    .local v2, "curAct":Ljava/lang/String;
    .restart local v6    # "attrName":I
    .restart local v34    # "csz":I
    .restart local v37    # "applicationEndOff3":I
    .restart local v42    # "nameActivity":I
    .restart local v43    # "nameActivityAlias":I
    nop

    .line 970
    nop

    .line 971
    nop

    .line 972
    move-object/from16 v4, p2

    move v5, v1

    move-object/from16 v24, v2

    move/from16 v15, v22

    goto :goto_a

    .line 921
    .end local v1    # "ename":I
    .end local v6    # "attrName":I
    .end local v34    # "csz":I
    .end local v37    # "applicationEndOff3":I
    .end local v42    # "nameActivity":I
    .end local v43    # "nameActivityAlias":I
    .local v2, "csz":I
    .restart local v4    # "applicationEndOff3":I
    .restart local v5    # "ename":I
    .restart local v7    # "nameActivity":I
    .restart local v8    # "nameActivityAlias":I
    .restart local v18    # "attrName":I
    .restart local v24    # "curAct":Ljava/lang/String;
    :cond_11
    move/from16 v34, v2

    move/from16 v37, v4

    move v1, v5

    move/from16 v42, v7

    move/from16 v43, v8

    move/from16 v6, v18

    move-object/from16 v2, v24

    .line 922
    .end local v4    # "applicationEndOff3":I
    .end local v5    # "ename":I
    .end local v7    # "nameActivity":I
    .end local v8    # "nameActivityAlias":I
    .end local v18    # "attrName":I
    .end local v24    # "curAct":Ljava/lang/String;
    .restart local v1    # "ename":I
    .local v2, "curAct":Ljava/lang/String;
    .restart local v6    # "attrName":I
    .restart local v34    # "csz":I
    .restart local v37    # "applicationEndOff3":I
    .restart local v42    # "nameActivity":I
    .restart local v43    # "nameActivityAlias":I
    :goto_8
    invoke-direct {v0, v3, v6}, Lcom/licenseinjector/app/core/AxmLEditor;->readAndroidName(II)Ljava/lang/String;

    move-result-object v2

    .line 923
    if-gez v16, :cond_12

    move-object/from16 v4, p2

    invoke-virtual {v0, v4, v2}, Lcom/licenseinjector/app/core/AxmLEditor;->sameClass(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 924
    move/from16 v16, v3

    .line 925
    move/from16 v19, v25

    goto :goto_9

    .line 923
    :cond_12
    move-object/from16 v4, p2

    .line 927
    :cond_13
    :goto_9
    move v15, v12

    .line 928
    .end local v22    # "applicationEndOff2":I
    .local v15, "applicationEndOff2":I
    move/from16 v5, v26

    move v5, v1

    move-object/from16 v24, v2

    .line 974
    .end local v1    # "ename":I
    .end local v2    # "curAct":Ljava/lang/String;
    .restart local v5    # "ename":I
    .restart local v24    # "curAct":Ljava/lang/String;
    :goto_a
    move/from16 v1, v27

    .line 975
    .end local v19    # "gateDepth2":I
    .local v1, "gateDepth2":I
    move v2, v12

    .line 976
    .end local v15    # "applicationEndOff2":I
    .local v2, "applicationEndOff2":I
    move/from16 v5, v26

    .line 977
    .local v5, "appNameIdx":I
    move/from16 v19, v1

    move v15, v2

    move-object/from16 v18, v24

    move/from16 v2, v34

    move/from16 v24, v6

    goto/16 :goto_e

    .line 978
    .end local v1    # "gateDepth2":I
    .end local v2    # "applicationEndOff2":I
    .end local v5    # "appNameIdx":I
    .end local v6    # "attrName":I
    .end local v34    # "csz":I
    .end local v37    # "applicationEndOff3":I
    .end local v42    # "nameActivity":I
    .end local v43    # "nameActivityAlias":I
    .restart local v4    # "applicationEndOff3":I
    .restart local v7    # "nameActivity":I
    .restart local v8    # "nameActivityAlias":I
    .restart local v18    # "attrName":I
    .restart local v19    # "gateDepth2":I
    .restart local v22    # "applicationEndOff2":I
    :cond_14
    move/from16 v37, v4

    move/from16 v42, v7

    move/from16 v43, v8

    move/from16 v1, v18

    move-object/from16 v2, v24

    move/from16 v6, v25

    move-object/from16 v4, p2

    .line 979
    .end local v4    # "applicationEndOff3":I
    .end local v7    # "nameActivity":I
    .end local v8    # "nameActivityAlias":I
    .end local v18    # "attrName":I
    .end local v24    # "curAct":Ljava/lang/String;
    .end local v25    # "depth":I
    .local v1, "attrName":I
    .local v2, "curAct":Ljava/lang/String;
    .local v6, "depth":I
    .restart local v37    # "applicationEndOff3":I
    .restart local v42    # "nameActivity":I
    .restart local v43    # "nameActivityAlias":I
    nop

    .line 980
    nop

    .line 981
    move v5, v11

    .line 982
    .local v5, "csz":I
    nop

    .line 983
    const/16 v7, 0x103

    if-eq v10, v7, :cond_15

    .line 984
    move/from16 v7, v26

    .line 985
    .local v7, "appNameIdx":I
    move/from16 v8, v27

    .line 986
    .end local v19    # "gateDepth2":I
    .local v8, "gateDepth2":I
    move v15, v12

    move/from16 v24, v1

    move-object/from16 v18, v2

    move v2, v5

    move/from16 v25, v6

    move v5, v7

    move/from16 v19, v8

    .end local v22    # "applicationEndOff2":I
    .restart local v15    # "applicationEndOff2":I
    goto :goto_e

    .line 988
    .end local v7    # "appNameIdx":I
    .end local v8    # "gateDepth2":I
    .end local v15    # "applicationEndOff2":I
    .restart local v19    # "gateDepth2":I
    .restart local v22    # "applicationEndOff2":I
    :cond_15
    if-ltz v16, :cond_17

    if-ltz v13, :cond_16

    goto :goto_b

    .line 991
    :cond_16
    move/from16 v7, v27

    .line 992
    .local v7, "gateDepth":I
    if-ne v6, v7, :cond_18

    .line 993
    add-int v13, v3, v5

    goto :goto_c

    .line 989
    .end local v7    # "gateDepth":I
    :cond_17
    :goto_b
    move/from16 v7, v27

    .line 996
    .restart local v7    # "gateDepth":I
    :cond_18
    :goto_c
    move/from16 v8, v26

    .line 997
    .local v8, "appNameIdx":I
    add-int/lit8 v15, v3, 0x14

    move/from16 v24, v1

    move-object/from16 v18, v2

    .end local v1    # "attrName":I
    .end local v2    # "curAct":Ljava/lang/String;
    .local v18, "curAct":Ljava/lang/String;
    .local v24, "attrName":I
    invoke-direct {v0, v15}, Lcom/licenseinjector/app/core/AxmLEditor;->u32(I)J

    move-result-wide v1

    long-to-int v1, v1

    if-ne v1, v8, :cond_19

    move v1, v3

    goto :goto_d

    :cond_19
    move v1, v12

    .line 998
    .end local v22    # "applicationEndOff2":I
    .local v1, "applicationEndOff2":I
    :goto_d
    add-int/lit8 v25, v6, -0x1

    .line 999
    .end local v6    # "depth":I
    .restart local v25    # "depth":I
    move v2, v7

    move v15, v1

    move/from16 v19, v2

    move v2, v5

    move v5, v8

    .line 1002
    .end local v1    # "applicationEndOff2":I
    .end local v7    # "gateDepth":I
    .end local v8    # "appNameIdx":I
    .local v2, "csz":I
    .local v5, "appNameIdx":I
    .restart local v15    # "applicationEndOff2":I
    :goto_e
    add-int/2addr v3, v2

    .line 1003
    nop

    .line 1004
    move v1, v5

    .line 1005
    .end local v28    # "appNameIdx2":I
    .local v1, "appNameIdx2":I
    nop

    .line 1006
    nop

    .line 1007
    nop

    .line 1008
    .end local v10    # "ct":I
    .end local v11    # "csz2":I
    .end local v26    # "appNameIdx3":I
    .end local v27    # "gateDepth3":I
    .end local v37    # "applicationEndOff3":I
    move v10, v1

    move-object v2, v4

    move/from16 v4, v23

    move/from16 v6, v24

    move/from16 v11, v29

    move/from16 v12, v31

    move/from16 v5, v32

    move/from16 v7, v42

    move/from16 v8, v43

    move-object/from16 v1, p1

    move-object/from16 v24, v18

    goto/16 :goto_1

    .line 885
    .end local v1    # "appNameIdx2":I
    .end local v2    # "csz":I
    .end local v3    # "bodyStart":I
    .end local v12    # "applicationEndOff":I
    .end local v13    # "gateEnd":I
    .end local v14    # "endHeaders":I
    .end local v15    # "applicationEndOff2":I
    .end local v16    # "gateStart":I
    .end local v17    # "origCatOffs2":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v18    # "curAct":Ljava/lang/String;
    .end local v19    # "gateDepth2":I
    .end local v20    # "gateEnd2":I
    .end local v23    # "vLauncher":I
    .end local v24    # "attrName":I
    .end local v25    # "depth":I
    .end local v29    # "i":I
    .end local v31    # "i2":I
    .end local v32    # "vDefault":I
    .end local v42    # "nameActivity":I
    .end local v43    # "nameActivityAlias":I
    .local v4, "vLauncher":I
    .local v5, "vDefault":I
    .local v6, "attrName":I
    .local v7, "nameActivity":I
    .local v8, "nameActivityAlias":I
    :cond_1a
    move/from16 v23, v4

    move/from16 v32, v5

    move/from16 v24, v6

    move/from16 v42, v7

    move/from16 v43, v8

    move-object v4, v2

    .line 886
    .end local v4    # "vLauncher":I
    .end local v5    # "vDefault":I
    .end local v6    # "attrName":I
    .end local v7    # "nameActivity":I
    .end local v8    # "nameActivityAlias":I
    .restart local v23    # "vLauncher":I
    .restart local v24    # "attrName":I
    .restart local v32    # "vDefault":I
    .restart local v42    # "nameActivity":I
    .restart local v43    # "nameActivityAlias":I
    :goto_f
    const/4 v1, 0x0

    return-object v1

    .line 880
    .end local v9    # "nameCategory":I
    .end local v23    # "vLauncher":I
    .end local v24    # "attrName":I
    .end local v32    # "vDefault":I
    .end local v42    # "nameActivity":I
    .end local v43    # "nameActivityAlias":I
    .restart local v4    # "vLauncher":I
    .restart local v5    # "vDefault":I
    :cond_1b
    move-object v1, v3

    move/from16 v23, v4

    move/from16 v32, v5

    move-object v4, v2

    .line 1048
    .end local v4    # "vLauncher":I
    .end local v5    # "vDefault":I
    .restart local v23    # "vLauncher":I
    .restart local v32    # "vDefault":I
    return-object v1

    .line 875
    .end local v23    # "vLauncher":I
    .end local v32    # "vDefault":I
    :cond_1c
    move-object v4, v2

    move-object v1, v3

    .line 876
    :goto_10
    return-object v1
.end method

.method public sameClass(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p1, "a"    # Ljava/lang/String;
    .param p2, "b"    # Ljava/lang/String;

    .line 109
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    if-eqz p2, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 112
    :cond_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {p0, p1}, Lcom/licenseinjector/app/core/AxmLEditor;->fullName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p2}, Lcom/licenseinjector/app/core/AxmLEditor;->fullName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    return v0

    .line 110
    :cond_3
    :goto_0
    return v0
.end method
