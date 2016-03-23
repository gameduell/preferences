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

import js.Cookie;
import js.Browser;
import js.html.Storage;

@:allow(preferences.Preferences)
class Editor
{
    private static inline var ONE_YEAR_IN_SECONDS: Int = 31536000;

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
            Cookie.set(key, value, ONE_YEAR_IN_SECONDS);
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
