/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

/**
    Helper class for providing a handy way of setting and removing values for keys of the basic types.

    Destructive changes (edits) can be handled synchronously or asynchronously (depending on the backends).

    @author jxav
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
