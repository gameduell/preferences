/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

import hxjni.JNI;

/**
   @author jxav
 */
class Preferences
{
    private static var getIntNative = JNI.createStaticMethod("org/haxe/duell/preferences/Preferences",
    "getInt", "(Ljava/lang/String;I)I");
    private static var getBoolNative = JNI.createStaticMethod("org/haxe/duell/preferences/Preferences",
    "getBoolean", "(Ljava/lang/String;Z)Z");
    private static var getFloatNative = JNI.createStaticMethod("org/haxe/duell/preferences/Preferences",
    "getFloat", "(Ljava/lang/String;F)F");
    private static var getStringNative = JNI.createStaticMethod("org/haxe/duell/preferences/Preferences",
    "getString", "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;");

    public static function getInt(key: String, defaultValue: Int): Int
    {
        return getIntNative(key, defaultValue);
    }

    public static function getBool(key: String, defaultValue: Bool): Bool
    {
        return getBoolNative(key, defaultValue);
    }

    public static function getFloat(key: String, defaultValue: Float): Float
    {
        return getFloatNative(key, defaultValue);
    }

    public static function getString(key: String, defaultValue: String): String
    {
        return getStringNative(key, defaultValue);
    }

    public static function getEditor(): Editor
    {
        return new Editor();
    }
}
