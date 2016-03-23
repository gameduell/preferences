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
    Helper class for providing a handy way of retrieving values for keys of the basic types and an editor to write to
    this key/value storage.
 */
extern class Preferences
{
    /**
        Retrieves an Int for the given `key`. Returns `0` if the key doesn't exist.
     */
    public static function getInt(key: String): Int;
    /**
        Retrieves a Bool for the given `key`. Returns `false` if the key doesn't exist.
     */
    public static function getBool(key: String): Bool;
    /**
        Retrieves a Float for the given `key`. Returns `0.0` if the key doesn't exist.
     */
    public static function getFloat(key: String): Float;
    /**
        Retrieves a String for the given `key`. Returns `null` if the key doesn't exist.
     */
    public static function getString(key: String): String;

    /**
        Retrieves an `Editor` instance where the changes should be made and committed to.
     */
    public static function getEditor(): Editor;
}
