/*
 * Copyright (c) 2003-2016, GameDuell GmbH
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

package org.haxe.duell.preferences;

import org.haxe.duell.DuellActivity;

import java.lang.ref.WeakReference;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

public final class Preferences
{
    private static final String TAG = Preferences.class.getSimpleName();

    private static final int DEFAULT_VALUE_INT = 0;
    private static final float DEFAULT_VALUE_FLOAT = 0.0f;
    private static final boolean DEFAULT_VALUE_BOOLEAN = false;
    private static final String DEFAULT_VALUE_STRING = null;

    private static final String SHARED_PREFERENCES_NAME = Settings.PACKAGE;

    private static WeakReference<Context> ctxReference = new WeakReference<Context>(DuellActivity.getInstance());

    private Preferences()
    {
        // can't be instantiated
    }

    public static int getInt(final String key)
    {
        Context ctx = ctxReference.get();

        if (ctx == null)
        {
            return DEFAULT_VALUE_INT;
        }

        SharedPreferences prefs = ctx.getSharedPreferences(SHARED_PREFERENCES_NAME, Application.MODE_PRIVATE);
        return prefs.getInt(key, DEFAULT_VALUE_INT);
    }

    public static float getFloat(final String key)
    {
        Context ctx = ctxReference.get();

        if (ctx == null)
        {
            return DEFAULT_VALUE_FLOAT;
        }

        SharedPreferences prefs = ctx.getSharedPreferences(SHARED_PREFERENCES_NAME, Application.MODE_PRIVATE);
        return prefs.getFloat(key, DEFAULT_VALUE_FLOAT);
    }

    public static boolean getBoolean(final String key)
    {
        Context ctx = ctxReference.get();

        if (ctx == null)
        {
            return DEFAULT_VALUE_BOOLEAN;
        }

        SharedPreferences prefs = ctx.getSharedPreferences(SHARED_PREFERENCES_NAME, Application.MODE_PRIVATE);
        return prefs.getBoolean(key, DEFAULT_VALUE_BOOLEAN);
    }

    public static String getString(final String key)
    {
        Context ctx = ctxReference.get();

        if (ctx == null)
        {
            return DEFAULT_VALUE_STRING;
        }

        SharedPreferences prefs = ctx.getSharedPreferences(SHARED_PREFERENCES_NAME, Application.MODE_PRIVATE);
        return prefs.getString(key, DEFAULT_VALUE_STRING);
    }

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