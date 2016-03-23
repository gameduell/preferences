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

package preferences;

import hxjni.JNI;

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
