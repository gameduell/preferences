/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package org.haxe.duell.preferences;

import android.content.SharedPreferences;

/**
 * @author jxav
 */
public final class EditorWrapper
{
    private final SharedPreferences.Editor editor;

    EditorWrapper(SharedPreferences.Editor editor)
    {
        this.editor = editor;
    }

    SharedPreferences.Editor get()
    {
        return editor;
    }
}