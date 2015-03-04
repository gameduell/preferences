/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

import capabilities.Capabilities;
import flash.net.SharedObject;

/**
    @author jxav
 */
class Preferences
{
    private static var appPackage: String = Capabilities.instance().buildInfo.APPLICATION_BUNDLE;
    private static var sharedObject: SharedObject = SharedObject.getLocal(appPackage);

    public static function getInt(key: String): Int
    {
        return sharedObject.data.key;
    }

    public static function getBool(key: String): Bool
    {
        return sharedObject.data.key;
    }

    public static function getFloat(key: String): Float
    {
        return sharedObject.data.key;
    }

    public static function getString(key: String): String
    {
        return sharedObject.data.key;
    }

    public static function getEditor(): Editor
    {
        return new Editor(sharedObject);
    }
}
