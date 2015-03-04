/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

import flash.net.SharedObject;

/**
    @author jxav
 */
class Preferences
{
    private static var sharedObject: SharedObject = SharedObject.getLocal(Settings.PACKAGE);

    public static function getInt(key: String): Int
    {
        return untyped sharedObject.data[key];
    }

    public static function getBool(key: String): Bool
    {
        return untyped sharedObject.data[key];
    }

    public static function getFloat(key: String): Float
    {
        return untyped sharedObject.data[key];
    }

    public static function getString(key: String): String
    {
        return untyped sharedObject.data[key];
    }

    public static function getEditor(): Editor
    {
        return new Editor(sharedObject);
    }
}
