.class public final synthetic Lcom/android/apksig/internal/util/ChainedDataSource$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/ToLongFunction;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final applyAsLong(Ljava/lang/Object;)J
    .locals 2

    check-cast p1, Lcom/android/apksig/util/DataSource;

    invoke-static {p1}, Lcom/android/apksig/internal/util/ChainedDataSource;->lambda$new$0(Lcom/android/apksig/util/DataSource;)J

    move-result-wide v0

    return-wide v0
.end method
