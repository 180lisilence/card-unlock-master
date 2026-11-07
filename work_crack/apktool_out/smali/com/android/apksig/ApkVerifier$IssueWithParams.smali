.class public Lcom/android/apksig/ApkVerifier$IssueWithParams;
.super Lcom/android/apksig/ApkVerificationIssue;
.source "ApkVerifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/ApkVerifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IssueWithParams"
.end annotation


# instance fields
.field private final mIssue:Lcom/android/apksig/ApkVerifier$Issue;

.field private final mParams:[Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/android/apksig/ApkVerifier$Issue;[Ljava/lang/Object;)V
    .locals 1
    .param p1, "issue"    # Lcom/android/apksig/ApkVerifier$Issue;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "issue",
            "params"
        }
    .end annotation

    .line 3095
    invoke-static {p1}, Lcom/android/apksig/ApkVerifier$Issue;->access$2100(Lcom/android/apksig/ApkVerifier$Issue;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/android/apksig/ApkVerificationIssue;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 3096
    iput-object p1, p0, Lcom/android/apksig/ApkVerifier$IssueWithParams;->mIssue:Lcom/android/apksig/ApkVerifier$Issue;

    .line 3097
    iput-object p2, p0, Lcom/android/apksig/ApkVerifier$IssueWithParams;->mParams:[Ljava/lang/Object;

    .line 3098
    return-void
.end method


# virtual methods
.method public getIssue()Lcom/android/apksig/ApkVerifier$Issue;
    .locals 1

    .line 3104
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$IssueWithParams;->mIssue:Lcom/android/apksig/ApkVerifier$Issue;

    return-object v0
.end method

.method public getParams()[Ljava/lang/Object;
    .locals 1

    .line 3111
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$IssueWithParams;->mParams:[Ljava/lang/Object;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 3119
    iget-object v0, p0, Lcom/android/apksig/ApkVerifier$IssueWithParams;->mIssue:Lcom/android/apksig/ApkVerifier$Issue;

    invoke-static {v0}, Lcom/android/apksig/ApkVerifier$Issue;->access$2200(Lcom/android/apksig/ApkVerifier$Issue;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/apksig/ApkVerifier$IssueWithParams;->mParams:[Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
