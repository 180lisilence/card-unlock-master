.class public abstract Lcom/android/apksig/internal/asn1/ber/BerEncoding;
.super Ljava/lang/Object;
.source "BerEncoding.java"


# static fields
.field public static final ID_FLAG_CONSTRUCTED_ENCODING:I = 0x20

.field public static final TAG_CLASS_APPLICATION:I = 0x1

.field public static final TAG_CLASS_CONTEXT_SPECIFIC:I = 0x2

.field public static final TAG_CLASS_PRIVATE:I = 0x3

.field public static final TAG_CLASS_UNIVERSAL:I = 0x0

.field public static final TAG_NUMBER_BIT_STRING:I = 0x3

.field public static final TAG_NUMBER_BOOLEAN:I = 0x1

.field public static final TAG_NUMBER_GENERALIZED_TIME:I = 0x18

.field public static final TAG_NUMBER_INTEGER:I = 0x2

.field public static final TAG_NUMBER_NULL:I = 0x5

.field public static final TAG_NUMBER_OBJECT_IDENTIFIER:I = 0x6

.field public static final TAG_NUMBER_OCTET_STRING:I = 0x4

.field public static final TAG_NUMBER_SEQUENCE:I = 0x10

.field public static final TAG_NUMBER_SET:I = 0x11

.field public static final TAG_NUMBER_UTC_TIME:I = 0x17


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getTagClass(B)I
    .locals 1
    .param p0, "firstIdentifierByte"    # B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "firstIdentifierByte"
        }
    .end annotation

    .line 207
    and-int/lit16 v0, p0, 0xff

    shr-int/lit8 v0, v0, 0x6

    return v0
.end method

.method public static getTagClass(Lcom/android/apksig/internal/asn1/Asn1TagClass;)I
    .locals 3
    .param p0, "tagClass"    # Lcom/android/apksig/internal/asn1/Asn1TagClass;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "tagClass"
        }
    .end annotation

    .line 130
    sget-object v0, Lcom/android/apksig/internal/asn1/ber/BerEncoding$1;->$SwitchMap$com$android$apksig$internal$asn1$Asn1TagClass:[I

    invoke-virtual {p0}, Lcom/android/apksig/internal/asn1/Asn1TagClass;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 140
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported tag class: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    :pswitch_0
    const/4 v0, 0x0

    return v0

    .line 136
    :pswitch_1
    const/4 v0, 0x3

    return v0

    .line 134
    :pswitch_2
    const/4 v0, 0x2

    return v0

    .line 132
    :pswitch_3
    const/4 v0, 0x1

    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getTagNumber(B)I
    .locals 1
    .param p0, "firstIdentifierByte"    # B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "firstIdentifierByte"
        }
    .end annotation

    .line 219
    and-int/lit8 v0, p0, 0x1f

    return v0
.end method

.method public static getTagNumber(Lcom/android/apksig/internal/asn1/Asn1Type;)I
    .locals 3
    .param p0, "dataType"    # Lcom/android/apksig/internal/asn1/Asn1Type;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "dataType"
        }
    .end annotation

    .line 104
    sget-object v0, Lcom/android/apksig/internal/asn1/ber/BerEncoding$1;->$SwitchMap$com$android$apksig$internal$asn1$Asn1Type:[I

    invoke-virtual {p0}, Lcom/android/apksig/internal/asn1/Asn1Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 125
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported data type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    :pswitch_0
    const/4 v0, 0x1

    return v0

    .line 121
    :pswitch_1
    const/16 v0, 0x18

    return v0

    .line 119
    :pswitch_2
    const/16 v0, 0x17

    return v0

    .line 117
    :pswitch_3
    const/16 v0, 0x10

    return v0

    .line 114
    :pswitch_4
    const/16 v0, 0x11

    return v0

    .line 112
    :pswitch_5
    const/4 v0, 0x3

    return v0

    .line 110
    :pswitch_6
    const/4 v0, 0x4

    return v0

    .line 108
    :pswitch_7
    const/4 v0, 0x6

    return v0

    .line 106
    :pswitch_8
    const/4 v0, 0x2

    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static isConstructed(B)Z
    .locals 1
    .param p0, "firstIdentifierByte"    # B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "firstIdentifierByte"
        }
    .end annotation

    .line 199
    and-int/lit8 v0, p0, 0x20

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static setTagClass(BI)B
    .locals 2
    .param p0, "firstIdentifierByte"    # B
    .param p1, "tagClass"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "firstIdentifierByte",
            "tagClass"
        }
    .end annotation

    .line 211
    and-int/lit8 v0, p0, 0x3f

    shl-int/lit8 v1, p1, 0x6

    or-int/2addr v0, v1

    int-to-byte v0, v0

    return v0
.end method

.method public static setTagNumber(BI)B
    .locals 1
    .param p0, "firstIdentifierByte"    # B
    .param p1, "tagNumber"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "firstIdentifierByte",
            "tagNumber"
        }
    .end annotation

    .line 223
    and-int/lit8 v0, p0, -0x20

    or-int/2addr v0, p1

    int-to-byte v0, v0

    return v0
.end method

.method public static tagClassAndNumberToString(II)Ljava/lang/String;
    .locals 4
    .param p0, "tagClass"    # I
    .param p1, "tagNumber"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "tagClass",
            "tagNumber"
        }
    .end annotation

    .line 160
    invoke-static {p0}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->tagClassToString(I)Ljava/lang/String;

    move-result-object v0

    .line 161
    .local v0, "classString":Ljava/lang/String;
    invoke-static {p1}, Lcom/android/apksig/internal/asn1/ber/BerEncoding;->tagNumberToString(I)Ljava/lang/String;

    move-result-object v1

    .line 162
    .local v1, "numberString":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v2, v1

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    return-object v2
.end method

.method public static tagClassToString(I)Ljava/lang/String;
    .locals 3
    .param p0, "typeClass"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "typeClass"
        }
    .end annotation

    .line 145
    packed-switch p0, :pswitch_data_0

    .line 155
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported type class: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 151
    :pswitch_0
    const-string v0, "PRIVATE"

    return-object v0

    .line 149
    :pswitch_1
    const-string v0, ""

    return-object v0

    .line 147
    :pswitch_2
    const-string v0, "APPLICATION"

    return-object v0

    .line 153
    :pswitch_3
    const-string v0, "UNIVERSAL"

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static tagNumberToString(I)Ljava/lang/String;
    .locals 2
    .param p0, "tagNumber"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "tagNumber"
        }
    .end annotation

    .line 167
    sparse-switch p0, :sswitch_data_0

    .line 189
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 185
    :sswitch_0
    const-string v0, "GENERALIZED TIME"

    return-object v0

    .line 187
    :sswitch_1
    const-string v0, "UTC TIME"

    return-object v0

    .line 181
    :sswitch_2
    const-string v0, "SET"

    return-object v0

    .line 179
    :sswitch_3
    const-string v0, "SEQUENCE"

    return-object v0

    .line 177
    :sswitch_4
    const-string v0, "OBJECT IDENTIFIER"

    return-object v0

    .line 175
    :sswitch_5
    const-string v0, "NULL"

    return-object v0

    .line 171
    :sswitch_6
    const-string v0, "OCTET STRING"

    return-object v0

    .line 173
    :sswitch_7
    const-string v0, "BIT STRING"

    return-object v0

    .line 169
    :sswitch_8
    const-string v0, "INTEGER"

    return-object v0

    .line 183
    :sswitch_9
    const-string v0, "BOOLEAN"

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_9
        0x2 -> :sswitch_8
        0x3 -> :sswitch_7
        0x4 -> :sswitch_6
        0x5 -> :sswitch_5
        0x6 -> :sswitch_4
        0x10 -> :sswitch_3
        0x11 -> :sswitch_2
        0x17 -> :sswitch_1
        0x18 -> :sswitch_0
    .end sparse-switch
.end method
