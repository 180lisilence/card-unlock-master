.class public Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;
.super Ljava/lang/Object;
.source "ApkSignerEngine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/apksig/ApkSignerEngine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InputJarEntryInstructions"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;
    }
.end annotation


# instance fields
.field private final mInspectJarEntryRequest:Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;

.field private final mOutputPolicy:Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;


# direct methods
.method public constructor <init>(Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;)V
    .locals 1
    .param p1, "outputPolicy"    # Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "outputPolicy"
        }
    .end annotation

    .line 367
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;-><init>(Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;)V

    .line 368
    return-void
.end method

.method public constructor <init>(Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;)V
    .locals 0
    .param p1, "outputPolicy"    # Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;
    .param p2, "inspectJarEntryRequest"    # Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "outputPolicy",
            "inspectJarEntryRequest"
        }
    .end annotation

    .line 379
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 380
    iput-object p1, p0, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;->mOutputPolicy:Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;

    .line 381
    iput-object p2, p0, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;->mInspectJarEntryRequest:Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;

    .line 382
    return-void
.end method


# virtual methods
.method public getInspectJarEntryRequest()Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;
    .locals 1

    .line 396
    iget-object v0, p0, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;->mInspectJarEntryRequest:Lcom/android/apksig/ApkSignerEngine$InspectJarEntryRequest;

    return-object v0
.end method

.method public getOutputPolicy()Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;
    .locals 1

    .line 388
    iget-object v0, p0, Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions;->mOutputPolicy:Lcom/android/apksig/ApkSignerEngine$InputJarEntryInstructions$OutputPolicy;

    return-object v0
.end method
