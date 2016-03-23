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

/**
    Helper class for providing a handy way of setting and removing values for keys of the basic types.

    Destructive changes (edits) can be handled synchronously or asynchronously (depending on the backends).
 */
@:allow(preferences.Preferences)
extern class Editor
{
    /**
        Puts the specified Int `value` in the given `key`.

        Like all destructive changes, requires a call to `apply()` or `synchronize()` to synchronize the changes.

        Returns whether the operation was successful or not.
     */
    public function putInt(key: String, value: Int): Bool;
    /**
        Puts the specified Bool `value` in the given `key`.

        Like all destructive changes, requires a call to `apply()` or `synchronize()` to synchronize the changes.

        Returns whether the operation was successful or not.
     */
    public function putBool(key: String, value: Bool): Bool;
    /**
        Puts the specified Float `value` in the given `key`.

        Like all destructive changes, requires a call to `apply()` or `synchronize()` to synchronize the changes.

        Returns whether the operation was successful or not.
     */
    public function putFloat(key: String, value: Float): Bool;
    /**
        Puts the specified String `value` in the given `key`.

        Like all destructive changes, requires a call to `apply()` or `synchronize()` to synchronize the changes.

        Returns whether the operation was successful or not.
     */
    public function putString(key: String, value: String): Bool;

    /**
        Removes the specified `key`. Has no effect if the key doesn't exist.

        Like all destructive changes, requires a call to `apply()` or `synchronize()` to synchronize the changes.

        Returns whether the operation was successful or not.
     */
    public function remove(key: String): Bool;

    /**
        Synchronizes the modified changes with whatever was present in the preferences, synchronously, and returns
        whether the operation was successful or not.
     */
    public function synchronize(): Bool;
}
