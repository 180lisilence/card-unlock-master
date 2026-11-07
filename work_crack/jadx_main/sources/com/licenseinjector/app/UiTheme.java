package com.licenseinjector.app;

import android.animation.ValueAnimator;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.TextView;

/* JADX INFO: loaded from: classes4.dex */
public final class UiTheme {
    public static final int BG_A = -1117441;
    public static final int BG_B = -1452545;
    public static final int CARD = -1;
    public static final int SUB = -9735552;
    public static final int TEXT = -14736592;
    public static final int ACCENT1 = -10262799;
    public static final int ACCENT2 = -7643914;
    public static final int ACCENT3 = -1292135;
    private static final int[] SHIMMER = {ACCENT1, ACCENT2, ACCENT3, -16337196, -14498466, -680437, ACCENT1};

    public static class ShimmerBgDrawable extends Drawable {
        private final ValueAnimator anim;
        private final LinearGradient grad;

        /* JADX INFO: renamed from: m */
        private final Matrix f21m;
        private final Paint paint;
        private final float radius;
        private final RectF rect;

        public ShimmerBgDrawable(float f) {
            Paint paint = new Paint(1);
            this.paint = paint;
            this.f21m = new Matrix();
            this.rect = new RectF();
            this.radius = UiTheme.m10dp(f);
            LinearGradient linearGradient = new LinearGradient(0.0f, 0.0f, 800.0f, 0.0f, UiTheme.SHIMMER, (float[]) null, Shader.TileMode.REPEAT);
            this.grad = linearGradient;
            paint.setShader(linearGradient);
            ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
            this.anim = valueAnimatorOfFloat;
            valueAnimatorOfFloat.setDuration(3000L);
            valueAnimatorOfFloat.setRepeatCount(-1);
            valueAnimatorOfFloat.setRepeatMode(2);
            valueAnimatorOfFloat.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.licenseinjector.app.UiTheme.ShimmerBgDrawable.1
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public void onAnimationUpdate(ValueAnimator valueAnimator) {
                    ShimmerBgDrawable.this.f21m.setTranslate((-((Float) valueAnimator.getAnimatedValue()).floatValue()) * 800.0f, 0.0f);
                    ShimmerBgDrawable.this.grad.setLocalMatrix(ShimmerBgDrawable.this.f21m);
                    ShimmerBgDrawable.this.invalidateSelf();
                }
            });
            valueAnimatorOfFloat.start();
        }

        @Override // android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
            RectF rectF = this.rect;
            float f = this.radius;
            canvas.drawRoundRect(rectF, f, f, this.paint);
        }

        @Override // android.graphics.drawable.Drawable
        public int getOpacity() {
            return -3;
        }

        @Override // android.graphics.drawable.Drawable
        protected void onBoundsChange(Rect rect) {
            this.rect.set(rect);
        }

        @Override // android.graphics.drawable.Drawable
        public void setAlpha(int i) {
            this.paint.setAlpha(i);
        }

        @Override // android.graphics.drawable.Drawable
        public void setColorFilter(ColorFilter colorFilter) {
            this.paint.setColorFilter(colorFilter);
        }

        public void stop() {
            this.anim.cancel();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX INFO: renamed from: dp */
    public static float m10dp(float f) {
        return (Resources.getSystem().getDisplayMetrics().density * f) + 0.5f;
    }

    public static GradientDrawable pageGradient() {
        return new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[]{BG_A, BG_B});
    }

    public static void shimmerText(final TextView textView) {
        textView.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.licenseinjector.app.UiTheme.2
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                textView.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                int width = textView.getWidth();
                if (width <= 0) {
                    textView.getPaint().setShader(new LinearGradient(0.0f, 0.0f, Math.max(1.0f, textView.getTextSize() * textView.getText().length()), 0.0f, UiTheme.SHIMMER, (float[]) null, Shader.TileMode.CLAMP));
                    textView.invalidate();
                    return;
                }
                final float f = width;
                final LinearGradient linearGradient = new LinearGradient(0.0f, 0.0f, f, 0.0f, UiTheme.SHIMMER, (float[]) null, Shader.TileMode.REPEAT);
                final Matrix matrix = new Matrix();
                textView.getPaint().setShader(linearGradient);
                final ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
                valueAnimatorOfFloat.setDuration(3000L);
                valueAnimatorOfFloat.setRepeatCount(-1);
                valueAnimatorOfFloat.setRepeatMode(2);
                valueAnimatorOfFloat.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() { // from class: com.licenseinjector.app.UiTheme.2.1
                    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                    public void onAnimationUpdate(ValueAnimator valueAnimator) {
                        matrix.setTranslate((-((Float) valueAnimator.getAnimatedValue()).floatValue()) * f, 0.0f);
                        linearGradient.setLocalMatrix(matrix);
                        textView.invalidate();
                    }
                });
                valueAnimatorOfFloat.start();
                textView.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() { // from class: com.licenseinjector.app.UiTheme.2.2
                    @Override // android.view.View.OnAttachStateChangeListener
                    public void onViewAttachedToWindow(View view) {
                    }

                    @Override // android.view.View.OnAttachStateChangeListener
                    public void onViewDetachedFromWindow(View view) {
                        valueAnimatorOfFloat.cancel();
                    }
                });
            }
        });
    }

    public static void styleButton(Button button) {
        final ShimmerBgDrawable shimmerBgDrawable = new ShimmerBgDrawable(14.0f);
        button.setBackground(shimmerBgDrawable);
        button.setTextColor(-1);
        button.setAllCaps(false);
        int iM10dp = (int) m10dp(13.0f);
        button.setPadding(0, iM10dp, 0, iM10dp);
        button.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() { // from class: com.licenseinjector.app.UiTheme.1
            @Override // android.view.View.OnAttachStateChangeListener
            public void onViewAttachedToWindow(View view) {
            }

            @Override // android.view.View.OnAttachStateChangeListener
            public void onViewDetachedFromWindow(View view) {
                shimmerBgDrawable.stop();
            }
        });
    }
}
