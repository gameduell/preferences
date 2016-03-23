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

import cpp.Lib;

@:allow(preferences.Preferences)
class Editor
{
    private static var putIntNative = Lib.load("preferencesapple", "putInt", 2);
    private static var putBoolNative = Lib.load("preferencesapple", "putBool", 2);
    private static var putFloatNative = Lib.load("preferencesapple", "putFloat", 2);
    private static var putStringNative = Lib.load("preferencesapple", "putString", 2);
    private static var removeNative = Lib.load("preferencesapple", "removeKey", 1);
    private static var synchronizeNative = Lib.load("preferencesapple", "synchronize", 0);

    private function new()
    {}

    public function putInt(key: String, value: Int): Bool
    {
        return putIntNative(key, value);
    }

    public function putBool(key: String, value: Bool): Bool
    {
        return putBoolNative(key, value);
    }

    public function putFloat(key: String, value: Float): Bool
    {
        return putFloatNative(key, value);
    }

    public function putString(key: String, value: String): Bool
    {
        return putStringNative(key, value);
    }

    public function remove(key: String): Bool
    {
        return removeNative(key);
    }

    public function synchronize(): Bool
    {
        return synchronizeNative();
    }
}
