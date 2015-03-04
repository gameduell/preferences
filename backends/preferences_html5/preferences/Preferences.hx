/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

import preferences.PersistenceMethod.PersistenceHelper;
import js.Cookie;
import js.html.Storage;
import js.Browser;

/**
    @author jxav
 */
class Preferences
{
    private static var method: PersistenceMethod = PersistenceHelper.selectPersistenceMethod();

    public static function getInt(key: String): Int
    {
        var value: String = getString(key);

        if (value != null)
        {
            return Std.parseInt(value);
        }
        else
        {
            return 0;
        }
    }

    public static function getBool(key: String): Bool
    {
        var value: String = getString(key);

        if (value != null)
        {
            return value.toLowerCase() == "true";
        }
        else
        {
            return false;
        }
    }

    public static function getFloat(key: String): Float
    {
        var value: String = getString(key);

        if (value != null)
        {
            return Std.parseFloat(value);
        }
        else
        {
            return 0.0;
        }
    }

    public static function getString(key: String): String
    {
        if (method == PersistenceMethod.LOCAL_STORAGE)
        {
            var storage: Storage = Browser.getLocalStorage();

            if (storage != null)
            {
                return storage.getItem(key);
            }
        }
        else if (method == PersistenceMethod.COOKIE)
        {
            return Cookie.get(key);
        }

        return null;
    }

    public static function getEditor(): Editor
    {
        return new Editor(method);
    }
}
