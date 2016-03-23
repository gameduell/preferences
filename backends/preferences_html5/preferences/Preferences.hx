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

import preferences.PersistenceMethod.PersistenceHelper;
import js.Cookie;
import js.html.Storage;
import js.Browser;

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
