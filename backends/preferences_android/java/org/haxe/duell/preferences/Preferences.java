/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package org.haxe.duell.preferences;

import org.haxe.duell.DuellActivity;

import java.lang.ref.WeakReference;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

/**
 * @author jxav
 */
public final class Preferences
{
    private static final String TAG = Preferences.class.getSimpleName();
    private static final String SHARED_PREFERENCES_NAME = "org.haxe.duell.preferences";

    private static WeakReference<Context> ctxReference = new WeakReference<Context>(DuellActivity.getInstance());

    private Preferences()
    {
        // can't be instantiated
    }

    public static int getInt(final String key, final int defaultValue)
    {
        Context ctx = ctxReference.get();

        if (ctx == null)
        {
            return defaultValue;
        }

        SharedPreferences prefs = ctx.getSharedPreferences(SHARED_PREFERENCES_NAME, Application.MODE_PRIVATE);
        return prefs.getInt(key, defaultValue);
    }

    public static float getFloat(final String key, final float defaultValue)
    {
        Context ctx = ctxReference.get();

        if (ctx == null)
        {
            return defaultValue;
        }

        SharedPreferences prefs = ctx.getSharedPreferences(SHARED_PREFERENCES_NAME, Application.MODE_PRIVATE);
        return prefs.getFloat(key, defaultValue);
    }

    public static boolean getBoolean(final String key, final boolean defaultValue)
    {
        Context ctx = ctxReference.get();

        if (ctx == null)
        {
            return defaultValue;
        }

        SharedPreferences prefs = ctx.getSharedPreferences(SHARED_PREFERENCES_NAME, Application.MODE_PRIVATE);
        return prefs.getBoolean(key, defaultValue);
    }

    public static String getString(final String key, final String defaultValue)
    {
        Context ctx = ctxReference.get();

        if (ctx == null)
        {
            return defaultValue;
        }

        SharedPreferences prefs = ctx.getSharedPreferences(SHARED_PREFERENCES_NAME, Application.MODE_PRIVATE);
        return prefs.getString(key, defaultValue);
    }

    public static String getStringTest() {return "test";}

    public static EditorWrapper getEditor()
    {
        Context ctx = ctxReference.get();

        if (ctx == null)
        {
            return new EditorWrapper(null);
        }

        SharedPreferences prefs = ctx.getSharedPreferences(SHARED_PREFERENCES_NAME, Application.MODE_PRIVATE);
        return new EditorWrapper(prefs.edit());
    }

    public static boolean remove(EditorWrapper wrapper, String key)
    {
        SharedPreferences.Editor editor = wrapper.get();

        if (editor == null)
        {
            Log.e(TAG, "Editor instance is null, key not removed");
            return false;
        }

        editor.remove(key);
        return true;
    }

    public static boolean putInt(EditorWrapper wrapper, String key, int value)
    {
        SharedPreferences.Editor editor = wrapper.get();

        if (editor == null)
        {
            Log.e(TAG, "Editor instance is null, value not updated");
            return false;
        }

        editor.putInt(key, value);
        return true;
    }

    public static boolean putFloat(EditorWrapper wrapper, String key, float value)
    {
        SharedPreferences.Editor editor = wrapper.get();

        if (editor == null)
        {
            Log.e(TAG, "Editor instance is null, value not updated");
            return false;
        }

        editor.putFloat(key, value);
        return true;
    }

    public static boolean putBoolean(EditorWrapper wrapper, String key, boolean value)
    {
        SharedPreferences.Editor editor = wrapper.get();

        if (editor == null)
        {
            Log.e(TAG, "Editor instance is null, value not updated");
            return false;
        }

        editor.putBoolean(key, value);
        return true;
    }

    public static boolean putString(EditorWrapper wrapper, String key, String value)
    {
        SharedPreferences.Editor editor = wrapper.get();

        if (editor == null)
        {
            Log.e(TAG, "Editor instance is null, value not updated");
            return false;
        }

        editor.putString(key, value);
        return true;
    }

    public static boolean apply(EditorWrapper wrapper)
    {
        SharedPreferences.Editor editor = wrapper.get();

        if (editor == null)
        {
            Log.e(TAG, "Editor instance is null, nothing was applied");
            return false;
        }

        editor.apply();
        return true;
    }

    public static boolean synchronize(EditorWrapper wrapper)
    {
        SharedPreferences.Editor editor = wrapper.get();

        if (editor == null)
        {
            Log.e(TAG, "Editor instance is null, nothing was synchronized");
            return false;
        }

        return editor.commit();
    }
}