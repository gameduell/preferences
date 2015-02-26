/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

/**
    Helper class for providing a handy way of setting and retrieving values for keys of the basic types.

    Destructive changes (edits) can be handled synchronously or asynchronously (depending on the backends).

    @author jxav
 */
extern class Preferences
{
    /**
        Retrieves an Int for the given `key`. Returns `null` if the key doesn't exist.
     */
    public static function getInt(key: String): Null<Int>;
    /**
        Retrieves a Bool for the given `key`. Returns `null` if the key doesn't exist.
     */
    public static function getBool(key: String): Null<Bool>;
    /**
        Retrieves a Float for the given `key`. Returns `null` if the key doesn't exist.
     */
    public static function getFloat(key: String): Null<Float>;
    /**
        Retrieves a Stromg for the given `key`. Returns `null` if the key doesn't exist.
     */
    public static function getString(key: String): Null<String>;

    /**
        Puts the specified Int `value` in the given `key`.

        Like all destructive changes, requires a call to `apply()` or `synchronize()` to synchronize the changes.
     */
    public static function putInt(key: String, value: Int): Void;
    /**
        Puts the specified Bool `value` in the given `key`.

        Like all destructive changes, requires a call to `apply()` or `synchronize()` to synchronize the changes.
     */
    public static function putBool(key: String, value: Bool): Void;
    /**
        Puts the specified Float `value` in the given `key`.

        Like all destructive changes, requires a call to `apply()` or `synchronize()` to synchronize the changes.
     */
    public static function putFloat(key: String, value: Float): Void;
    /**
        Puts the specified String `value` in the given `key`.

        Like all destructive changes, requires a call to `apply()` or `synchronize()` to synchronize the changes.
     */
    public static function putString(key: String, value: String): Void;

    /**
        Removes the specified `key`. Has no effect if the key doesn't exist.

        Like all destructive changes, requires a call to `apply()` or `synchronize()` to synchronize the changes.
     */
    public static function remove(key: String): Void;

    /**
        Synchronizes the modified changes with whatever was present in the preferences, asynchronously.

        Not all backends support this feature, so this feature might call `synchronize()` for some backends.
     */
    public static function apply(): Void;

    /**
        Synchronizes the modified changes with whatever was present in the preferences, synchronously, and returns
        whether the operation was successful or not.
     */
    public static function synchronize(): Bool;
}
