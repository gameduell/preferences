/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

import hxjni.JNI;

class Preferences
{
    private static var getIntNative = JNI.createStaticMethod("org/haxe/duell/preferences/Preferences",
    "getInt", "(Ljava/lang/String;)I");
    private static var getBoolNative = JNI.createStaticMethod("org/haxe/duell/preferences/Preferences",
    "getBoolean", "(Ljava/lang/String;)Z");
    private static var getFloatNative = JNI.createStaticMethod("org/haxe/duell/preferences/Preferences",
    "getFloat", "(Ljava/lang/String;)F");
    private static var getStringNative = JNI.createStaticMethod("org/haxe/duell/preferences/Preferences",
    "getString", "(Ljava/lang/String;)Ljava/lang/String;");

    public static function getInt(key: String): Int
    {
        return getIntNative(key);
    }

    public static function getBool(key: String): Bool
    {
        return getBoolNative(key);
    }

    public static function getFloat(key: String): Float
    {
        return getFloatNative(key);
    }

    public static function getString(key: String): String
    {
        return getStringNative(key);
    }

    public static function getEditor(): Editor
    {
        return new Editor();
    }
}
