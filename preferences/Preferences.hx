/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

/**
   // TODO description

   @author jxav
 */
extern class Preferences
{
    public static function getInt(key: String): Null<Int>;
    public static function getBool(key: String): Null<Bool>;
    public static function getFloat(key: String): Null<Float>;
    public static function getString(key: String): Null<String>;

    public static function putInt(key: String, value: Int): Void;
    public static function putBool(key: String, value: Bool): Void;
    public static function putFloat(key: String, value: Float): Void;
    public static function putString(key: String, value: String): Void;

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
