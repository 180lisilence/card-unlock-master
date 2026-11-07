.class public Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;
.super Ljava/lang/Object;
.source "SourceStampCertificateLineage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SigningCertificateNode"
.end annotation


# instance fields
.field public flags:I

.field public final parentSigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

.field public sigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

.field public final signature:[B

.field public final signingCert:Ljava/security/cert/X509Certificate;


# direct methods
.method public constructor <init>(Ljava/security/cert/X509Certificate;Lcom/android/apksig/internal/apk/SignatureAlgorithm;Lcom/android/apksig/internal/apk/SignatureAlgorithm;[BI)V
    .locals 0
    .param p1, "signingCert"    # Ljava/security/cert/X509Certificate;
    .param p2, "parentSigAlgorithm"    # Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .param p3, "sigAlgorithm"    # Lcom/android/apksig/internal/apk/SignatureAlgorithm;
    .param p4, "signature"    # [B
    .param p5, "flags"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "signingCert",
            "parentSigAlgorithm",
            "sigAlgorithm",
            "signature",
            "flags"
        }
    .end annotation

    .line 169
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 170
    iput-object p1, p0, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->signingCert:Ljava/security/cert/X509Certificate;

    .line 171
    iput-object p2, p0, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->parentSigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    .line 172
    iput-object p3, p0, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->sigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    .line 173
    iput-object p4, p0, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->signature:[B

    .line 174
    iput p5, p0, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->flags:I

    .line 175
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 179
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 180
    :cond_0
    instance-of v1, p1, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 182
    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;

    .line 183
    .local v1, "that":Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;
    iget-object v3, p0, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->signingCert:Ljava/security/cert/X509Certificate;

    iget-object v4, v1, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->signingCert:Ljava/security/cert/X509Certificate;

    invoke-virtual {v3, v4}, Ljava/security/cert/X509Certificate;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    return v2

    .line 184
    :cond_2
    iget-object v3, p0, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->parentSigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    iget-object v4, v1, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->parentSigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    if-eq v3, v4, :cond_3

    return v2

    .line 185
    :cond_3
    iget-object v3, p0, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->sigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    iget-object v4, v1, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->sigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    if-eq v3, v4, :cond_4

    return v2

    .line 186
    :cond_4
    iget-object v3, p0, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->signature:[B

    iget-object v4, v1, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->signature:[B

    invoke-static {v3, v4}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v3

    if-nez v3, :cond_5

    return v2

    .line 187
    :cond_5
    iget v3, p0, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->flags:I

    iget v4, v1, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->flags:I

    if-eq v3, v4, :cond_6

    return v2

    .line 190
    :cond_6
    return v0
.end method

.method public hashCode()I
    .locals 5

    .line 195
    const/16 v0, 0x1f

    .line 196
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 197
    .local v1, "result":I
    mul-int/lit8 v2, v1, 0x1f

    iget-object v3, p0, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->signingCert:Ljava/security/cert/X509Certificate;

    const/4 v4, 0x0

    if-nez v3, :cond_0

    move v3, v4

    goto :goto_0

    :cond_0
    invoke-virtual {v3}, Ljava/security/cert/X509Certificate;->hashCode()I

    move-result v3

    :goto_0
    add-int/2addr v2, v3

    .line 198
    .end local v1    # "result":I
    .local v2, "result":I
    mul-int/lit8 v1, v2, 0x1f

    .line 199
    iget-object v3, p0, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->parentSigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    if-nez v3, :cond_1

    move v3, v4

    goto :goto_1

    :cond_1
    invoke-virtual {v3}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->hashCode()I

    move-result v3

    :goto_1
    add-int/2addr v1, v3

    .line 200
    .end local v2    # "result":I
    .restart local v1    # "result":I
    mul-int/lit8 v2, v1, 0x1f

    iget-object v3, p0, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->sigAlgorithm:Lcom/android/apksig/internal/apk/SignatureAlgorithm;

    if-nez v3, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {v3}, Lcom/android/apksig/internal/apk/SignatureAlgorithm;->hashCode()I

    move-result v4

    :goto_2
    add-int/2addr v2, v4

    .line 201
    .end local v1    # "result":I
    .restart local v2    # "result":I
    mul-int/lit8 v1, v2, 0x1f

    iget-object v3, p0, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->signature:[B

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([B)I

    move-result v3

    add-int/2addr v1, v3

    .line 202
    .end local v2    # "result":I
    .restart local v1    # "result":I
    mul-int/lit8 v2, v1, 0x1f

    iget v3, p0, Lcom/android/apksig/internal/apk/stamp/SourceStampCertificateLineage$SigningCertificateNode;->flags:I

    add-int/2addr v2, v3

    .line 203
    .end local v1    # "result":I
    .restart local v2    # "result":I
    return v2
.end method
