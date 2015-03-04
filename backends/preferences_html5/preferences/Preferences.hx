/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

/**
   @author jxav
 */
class Preferences
{
    public static function getInt(key: String, defaultValue: Int = 0): Int
    {
        // TODO
        return defaultValue;
    }

    public static function getBool(key: String, defaultValue: Bool = false): Bool
    {
        // TODO
        return defaultValue;
    }

    public static function getFloat(key: String, defaultValue: Float = 0.0): Float
    {
        // TODO
        return defaultValue;
    }

    public static function getString(key: String, defaultValue: String = null): String
    {
        // TODO
        return defaultValue;
    }

    public static function getEditor(): Editor
    {
        return new Editor();
    }
}
