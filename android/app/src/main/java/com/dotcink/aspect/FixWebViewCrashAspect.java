package com.dotcink.aspect;

import android.app.Dialog;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class FixWebViewCrashAspect {
    @Before("execution(* io.flutter.plugin.platform.SingleViewPresentation.detachState(..)) && target(presentation)")
    public void onDetachState(JoinPoint joinPoint, Dialog presentation) {
        presentation.cancel();
    }
}
