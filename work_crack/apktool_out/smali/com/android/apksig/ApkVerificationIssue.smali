.class public Lcom/android/apksig/ApkVerificationIssue;
.super Ljava/lang/Object;
.source "ApkVerificationIssue.java"


# static fields
.field public static final JAR_SIG_NO_SIGNATURES:I = 0x24

.field public static final JAR_SIG_PARSE_EXCEPTION:I = 0x25

.field public static final MALFORMED_APK:I = 0x1c

.field public static final SOURCE_STAMP_CERTIFICATE_MISMATCH_BETWEEN_SIGNATURE_BLOCK_AND_APK:I = 0x1b

.field public static final SOURCE_STAMP_CERT_DIGEST_AND_SIG_BLOCK_MISSING:I = 0x19

.field public static final SOURCE_STAMP_DID_NOT_VERIFY:I = 0x15

.field public static final SOURCE_STAMP_EXPECTED_DIGEST_MISMATCH:I = 0x17

.field public static final SOURCE_STAMP_INVALID_TIMESTAMP:I = 0x26

.field public static final SOURCE_STAMP_MALFORMED_ATTRIBUTE:I = 0x1f

.field public static final SOURCE_STAMP_MALFORMED_CERTIFICATE:I = 0x12

.field public static final SOURCE_STAMP_MALFORMED_LINEAGE:I = 0x21

.field public static final SOURCE_STAMP_MALFORMED_SIGNATURE:I = 0x14

.field public static final SOURCE_STAMP_NO_SIGNATURE:I = 0x11

.field public static final SOURCE_STAMP_NO_SUPPORTED_SIGNATURE:I = 0x1a

.field public static final SOURCE_STAMP_POR_CERT_MISMATCH:I = 0x22

.field public static final SOURCE_STAMP_POR_DID_NOT_VERIFY:I = 0x23

.field public static final SOURCE_STAMP_SIGNATURE_BLOCK_WITHOUT_CERT_DIGEST:I = 0x18

.field public static final SOURCE_STAMP_SIG_MISSING:I = 0x1e

.field public static final SOURCE_STAMP_UNKNOWN_ATTRIBUTE:I = 0x20

.field public static final SOURCE_STAMP_UNKNOWN_SIG_ALGORITHM:I = 0x13

.field public static final SOURCE_STAMP_VERIFY_EXCEPTION:I = 0x16

.field public static final UNEXPECTED_EXCEPTION:I = 0x1d

.field public static final V2_SIG_MALFORMED_CERTIFICATE:I = 0x6

.field public static final V2_SIG_MALFORMED_DIGEST:I = 0x8

.field public static final V2_SIG_MALFORMED_SIGNATURE:I = 0x4

.field public static final V2_SIG_MALFORMED_SIGNER:I = 0x3

.field public static final V2_SIG_MALFORMED_SIGNERS:I = 0x1

.field public static final V2_SIG_NO_CERTIFICATES:I = 0x7

.field public static final V2_SIG_NO_SIGNATURES:I = 0x5

.field public static final V2_SIG_NO_SIGNERS:I = 0x2

.field public static final V3_SIG_MALFORMED_CERTIFICATE:I = 0xe

.field public static final V3_SIG_MALFORMED_DIGEST:I = 0x10

.field public static final V3_SIG_MALFORMED_SIGNATURE:I = 0xc

.field public static final V3_SIG_MALFORMED_SIGNER:I = 0xb

.field public static final V3_SIG_MALFORMED_SIGNERS:I = 0x9

.field public static final V3_SIG_NO_CERTIFICATES:I = 0xf

.field public static final V3_SIG_NO_SIGNATURES:I = 0xd

.field public static final V3_SIG_NO_SIGNERS:I = 0xa


# instance fields
.field private final mFormat:Ljava/lang/String;

.field private final mIssueId:I

.field private final mParams:[Ljava/lang/Object;


# direct methods
.method public varargs constructor <init>(I[Ljava/lang/Object;)V
    .locals 1
    .param p1, "issueId"    # I
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "issueId",
            "params"
        }
    .end annotation

    .line 140
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    iput p1, p0, Lcom/android/apksig/ApkVerificationIssue;->mIssueId:I

    .line 142
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/apksig/ApkVerificationIssue;->mFormat:Ljava/lang/String;

    .line 143
    iput-object p2, p0, Lcom/android/apksig/ApkVerificationIssue;->mParams:[Ljava/lang/Object;

    .line 144
    return-void
.end method

.method public varargs constructor <init>(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 1
    .param p1, "format"    # Ljava/lang/String;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "format",
            "params"
        }
    .end annotation

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/apksig/ApkVerificationIssue;->mIssueId:I

    .line 132
    iput-object p1, p0, Lcom/android/apksig/ApkVerificationIssue;->mFormat:Ljava/lang/String;

    .line 133
    iput-object p2, p0, Lcom/android/apksig/ApkVerificationIssue;->mParams:[Ljava/lang/Object;

    .line 134
    return-void
.end method


# virtual methods
.method public getIssueId()I
    .locals 1

    .line 150
    iget v0, p0, Lcom/android/apksig/ApkVerificationIssue;->mIssueId:I

    return v0
.end method

.method public getParams()[Ljava/lang/Object;
    .locals 1

    .line 157
    iget-object v0, p0, Lcom/android/apksig/ApkVerificationIssue;->mParams:[Ljava/lang/Object;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    .line 164
    iget-object v0, p0, Lcom/android/apksig/ApkVerificationIssue;->mFormat:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 165
    iget-object v1, p0, Lcom/android/apksig/ApkVerificationIssue;->mParams:[Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 167
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "mIssueId: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/android/apksig/ApkVerificationIssue;->mIssueId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 168
    .local v0, "result":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/android/apksig/ApkVerificationIssue;->mParams:[Ljava/lang/Object;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 169
    .local v4, "param":Ljava/lang/Object;
    const-string v5, ", "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .end local v4    # "param":Ljava/lang/Object;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 171
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
