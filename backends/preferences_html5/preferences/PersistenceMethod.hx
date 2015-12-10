/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

import js.Browser;

/**
    @author jxav
 */
enum PersistenceMethod
{
    COOKIE;
    LOCAL_STORAGE;
}

class PersistenceHelper
{
    private static function allowsThirdPartyCookies(): Bool
    {
        /// haxe already Safely gets the browser's local storage, or returns null if localStorage is unsupported or disabled.
        return Browser.getLocalStorage() == null;
    }

    public static inline function selectPersistenceMethod(): PersistenceMethod
    {
        return allowsThirdPartyCookies() ? PersistenceMethod.COOKIE : PersistenceMethod.LOCAL_STORAGE;
    }
}
