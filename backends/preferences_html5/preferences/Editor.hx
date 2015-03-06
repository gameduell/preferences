/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

import js.Cookie;
import js.Browser;
import js.html.Storage;

/**
    @author jxav
 */
@:allow(preferences.Preferences)
class Editor
{
    private var method: PersistenceMethod;

    private function new(method: PersistenceMethod)
    {
        this.method = method;
    }

    public inline function putInt(key: String, value: Int): Bool
    {
        return putString(key, Std.string(value));
    }

    public inline function putBool(key: String, value: Bool): Bool
    {
        return putString(key, Std.string(value));
    }

    public inline function putFloat(key: String, value: Float): Bool
    {
        return putString(key, Std.string(value));
    }

    public function putString(key: String, value: String): Bool
    {
        if (method == PersistenceMethod.LOCAL_STORAGE)
        {
            var storage: Storage = Browser.getLocalStorage();

            if (storage != null)
            {
                storage.setItem(key, value);
                return true;
            }
        }
        else if (method == PersistenceMethod.COOKIE)
        {
            Cookie.set(key, value);
            return true;
        }

        return false;
    }

    public function remove(key: String): Bool
    {
        if (method == PersistenceMethod.LOCAL_STORAGE)
        {
            var storage: Storage = Browser.getLocalStorage();

            if (storage != null)
            {
                storage.removeItem(key);
                return true;
            }
        }
        else if (method == PersistenceMethod.COOKIE)
        {
            Cookie.remove(key);
            return true;
        }

        return false;
    }

    public inline function synchronize(): Bool
    {
        return true;
    }
}
