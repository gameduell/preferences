/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package org.haxe.duell.preferences;

import org.haxe.duell.DuellActivity;

/**
 * @author jxav
 */
public final class Preferences
{
    private static final String SHARED_PREFERENCES_NAME = "org.haxe.duell.preferences";

    private static WeakReference<Context> ctxReference = new WeakReference<>(DuellActivity.getInstance());

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

    public static SharedPreferences.Editor getEditor()
    {
        Context ctx = ctxReference.get();

        if (ctx == null)
        {
            return null;
        }

        SharedPreferences prefs = ctx.getSharedPreferences(SHARED_PREFERENCES_NAME, Application.MODE_PRIVATE);
        return prefs.edit();
    }

    public static boolean remove(SharedPreferences.Editor editor, String key)
    {
        if (editor == null)
        {
            Log.e(TAG, "Editor instance is null, key not removed");
            return false;
        }

        editor.remove(key);
        return true;
    }

    public static boolean putInt(SharedPreferences.Editor editor, String key, int value)
    {
        if (editor == null)
        {
            Log.e(TAG, "Editor instance is null, value not updated");
            return false;
        }

        editor.putInt(key, value);
        return true;
    }

    public static boolean putFloat(SharedPreferences.Editor editor, String key, float value)
    {
        if (editor == null)
        {
            Log.e(TAG, "Editor instance is null, value not updated");
            return false;
        }

        editor.putFloat(key, value);
        return true;
    }

    public static boolean putBoolean(SharedPreferences.Editor editor, String key, boolean value)
    {
        if (editor == null)
        {
            Log.e(TAG, "Editor instance is null, value not updated");
            return false;
        }

        editor.putBoolean(key, value);
        return true;
    }

    public static boolean putString(SharedPreferences.Editor editor, String key, String value)
    {
        if (editor == null)
        {
            Log.e(TAG, "Editor instance is null, value not updated");
            return false;
        }

        editor.putString(key, value);
        return true;
    }

    public static boolean apply(SharedPreferences.Editor editor)
    {
        if (editor == null)
        {
            Log.e(TAG, "Editor instance is null, nothing was applied");
            return false;
        }

        editor.apply();
        return true;
    }

    public static boolean synchronize(SharedPreferences.Editor editor)
    {
        if (editor == null)
        {
            Log.e(TAG, "Editor instance is null, nothing was synchronized");
            return false;
        }

        return editor.commit();
    }
}