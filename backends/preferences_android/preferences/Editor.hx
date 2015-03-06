/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

import hxjni.JNI;

/**
   @author jxav
 */
@:allow(preferences.Preferences)
class Editor
{
    private static var getEditorNative = JNI.createStaticMethod("org/haxe/duell/preferences/Preferences",
    "getEditor", "()Lorg/haxe/duell/preferences/EditorWrapper;");
    private static var putIntNative = JNI.createStaticMethod("org/haxe/duell/preferences/Preferences",
    "putInt", "(Lorg/haxe/duell/preferences/EditorWrapper;Ljava/lang/String;I)Z");
    private static var putBoolNative = JNI.createStaticMethod("org/haxe/duell/preferences/Preferences",
    "putBoolean", "(Lorg/haxe/duell/preferences/EditorWrapper;Ljava/lang/String;Z)Z");
    private static var putFloatNative = JNI.createStaticMethod("org/haxe/duell/preferences/Preferences",
    "putFloat", "(Lorg/haxe/duell/preferences/EditorWrapper;Ljava/lang/String;F)Z");
    private static var putStringNative = JNI.createStaticMethod("org/haxe/duell/preferences/Preferences",
    "putString", "(Lorg/haxe/duell/preferences/EditorWrapper;Ljava/lang/String;Ljava/lang/String;)Z");
    private static var removeNative = JNI.createStaticMethod("org/haxe/duell/preferences/Preferences",
    "remove", "(Lorg/haxe/duell/preferences/EditorWrapper;Ljava/lang/String;)Z");
    private static var synchronizeNative = JNI.createStaticMethod("org/haxe/duell/preferences/Preferences",
    "synchronize", "(Lorg/haxe/duell/preferences/EditorWrapper;)Z");

    private var editor: Dynamic;

    private function new()
    {
        editor = getEditorNative();
    }

    public function putInt(key: String, value: Int): Bool
    {
        return putIntNative(editor, key, value);
    }

    public function putBool(key: String, value: Bool): Bool
    {
        return putBoolNative(editor, key, value);
    }

    public function putFloat(key: String, value: Float): Bool
    {
        return putFloatNative(editor, key, value);
    }

    public function putString(key: String, value: String): Bool
    {
        return putStringNative(editor, key, value);
    }

    public function remove(key: String): Bool
    {
        return removeNative(editor, key);
    }

    public function synchronize(): Bool
    {
        return synchronizeNative(editor);
    }
}
