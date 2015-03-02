/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

import cpp.Lib;

/**
    @author jxav
 */
class Preferences
{
    private static var getIntNative = Lib.load("preferencesios", "getInt", 2);
    private static var getBoolNative = Lib.load("preferencesios", "getBool", 2);
    private static var getFloatNative = Lib.load("preferencesios", "getFloat", 2);
    private static var getStringNative = Lib.load("preferencesios", "getString", 2);

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
