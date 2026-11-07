.class Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$SignedAttributes;
.super Ljava/lang/Object;
.source "V1SchemeVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SignedAttributes"
.end annotation


# instance fields
.field private mAttrs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Collection;)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "attrs"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/android/apksig/internal/pkcs7/Attribute;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException;
        }
    .end annotation

    .line 1507
    .local p1, "attrs":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/android/apksig/internal/pkcs7/Attribute;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1508
    new-instance v0, Ljava/util/HashMap;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 1509
    .local v0, "result":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;>;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/apksig/internal/pkcs7/Attribute;

    .line 1510
    .local v2, "attr":Lcom/android/apksig/internal/pkcs7/Attribute;
    iget-object v3, v2, Lcom/android/apksig/internal/pkcs7/Attribute;->attrType:Ljava/lang/String;

    iget-object v4, v2, Lcom/android/apksig/internal/pkcs7/Attribute;->attrValues:Ljava/util/List;

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_0

    .line 1513
    .end local v2    # "attr":Lcom/android/apksig/internal/pkcs7/Attribute;
    goto :goto_0

    .line 1511
    .restart local v2    # "attr":Lcom/android/apksig/internal/pkcs7/Attribute;
    :cond_0
    new-instance v1, Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Duplicate signed attribute: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v2, Lcom/android/apksig/internal/pkcs7/Attribute;->attrType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1514
    .end local v2    # "attr":Lcom/android/apksig/internal/pkcs7/Attribute;
    :cond_1
    iput-object v0, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$SignedAttributes;->mAttrs:Ljava/util/Map;

    .line 1515
    return-void
.end method

.method private getSingleValue(Ljava/lang/String;)Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;
    .locals 4
    .param p1, "attrOid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "attrOid"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException;
        }
    .end annotation

    .line 1518
    iget-object v0, p0, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$SignedAttributes;->mAttrs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1519
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;>;"
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 1522
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-gt v1, v2, :cond_1

    .line 1525
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    return-object v1

    .line 1523
    :cond_1
    new-instance v1, Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Attribute "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " has multiple values"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1520
    :cond_2
    :goto_0
    const/4 v1, 0x0

    return-object v1
.end method


# virtual methods
.method public getSingleObjectIdentifierValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "attrOid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "attrOid"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException;
        }
    .end annotation

    .line 1529
    invoke-direct {p0, p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$SignedAttributes;->getSingleValue(Ljava/lang/String;)Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    move-result-object v0

    .line 1530
    .local v0, "value":Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;
    if-nez v0, :cond_0

    .line 1531
    const/4 v1, 0x0

    return-object v1

    .line 1534
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;->getEncoded()Ljava/nio/ByteBuffer;

    move-result-object v1

    const-class v2, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$ObjectIdentifierChoice;

    invoke-static {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parse(Ljava/nio/ByteBuffer;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$ObjectIdentifierChoice;

    iget-object v1, v1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$ObjectIdentifierChoice;->value:Ljava/lang/String;
    :try_end_0
    .catch Lcom/android/apksig/internal/asn1/Asn1DecodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 1535
    :catch_0
    move-exception v1

    .line 1536
    .local v1, "e":Lcom/android/apksig/internal/asn1/Asn1DecodingException;
    new-instance v2, Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException;

    const-string v3, "Failed to decode OBJECT IDENTIFIER"

    invoke-direct {v2, v3, v1}, Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getSingleOctetStringValue(Ljava/lang/String;)[B
    .locals 4
    .param p1, "attrOid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "attrOid"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException;
        }
    .end annotation

    .line 1541
    invoke-direct {p0, p1}, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$SignedAttributes;->getSingleValue(Ljava/lang/String;)Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;

    move-result-object v0

    .line 1542
    .local v0, "value":Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;
    if-nez v0, :cond_0

    .line 1543
    const/4 v1, 0x0

    return-object v1

    .line 1546
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Lcom/android/apksig/internal/asn1/Asn1OpaqueObject;->getEncoded()Ljava/nio/ByteBuffer;

    move-result-object v1

    const-class v2, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$OctetStringChoice;

    invoke-static {v1, v2}, Lcom/android/apksig/internal/asn1/Asn1BerParser;->parse(Ljava/nio/ByteBuffer;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$OctetStringChoice;

    iget-object v1, v1, Lcom/android/apksig/internal/apk/v1/V1SchemeVerifier$OctetStringChoice;->value:[B
    :try_end_0
    .catch Lcom/android/apksig/internal/asn1/Asn1DecodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 1547
    :catch_0
    move-exception v1

    .line 1548
    .local v1, "e":Lcom/android/apksig/internal/asn1/Asn1DecodingException;
    new-instance v2, Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException;

    const-string v3, "Failed to decode OBJECT IDENTIFIER"

    invoke-direct {v2, v3, v1}, Lcom/android/apksig/internal/pkcs7/Pkcs7DecodingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
