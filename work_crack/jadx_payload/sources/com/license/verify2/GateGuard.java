package com.license.verify2;

import android.app.Activity;
import android.app.Application;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;

/* JADX INFO: loaded from: E:\gongxiangwenjianjia\com.licenseinjector.app\work_crack\dex_raw\assets\payload.dex */
public final class GateGuard implements Application.ActivityLifecycleCallbacks {
    private static final long CHECK_MS = 10000;
    private static boolean gateVisible;
    private static Handler handler;
    private static GateGuard instance;
    private static int resumed;
    private final Application app;
    private final Runnable tick = new Runnable() { // from class: com.license.verify2.GateGuard.1
        @Override // java.lang.Runnable
        public void run() {
            GateGuard.check();
            if (GateGuard.handler != null) {
                GateGuard.handler.postDelayed(this, GateGuard.CHECK_MS);
            }
        }
    };

    private GateGuard(Application application) {
        this.app = application;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void check() {
        if (instance == null || gateVisible || resumed <= 0 || !LicenseVerify.isInitialized() || LicenseVerify.isValid(instance.app)) {
            return;
        }
        Intent intent = new Intent(instance.app, (Class<?>) VerifyActivity.class);
        intent.addFlags(268468224);
        instance.app.startActivity(intent);
    }

    public static void setGateVisible(boolean z) {
        gateVisible = z;
    }

    public static void start(Activity activity) {
        Application application = activity.getApplication();
        if (application == null || instance != null) {
            return;
        }
        instance = new GateGuard(application);
        handler = new Handler(Looper.getMainLooper());
        application.registerActivityLifecycleCallbacks(instance);
        handler.postDelayed(instance.tick, CHECK_MS);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityCreated(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityDestroyed(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityPaused(Activity activity) {
        resumed--;
        if (resumed < 0) {
            resumed = 0;
        }
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityResumed(Activity activity) {
        resumed++;
        if (activity instanceof VerifyActivity) {
            return;
        }
        check();
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStarted(Activity activity) {
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(Activity activity) {
    }
}
