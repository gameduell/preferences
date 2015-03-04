/*
 * Copyright (c) 2003-2015 GameDuell GmbH, All Rights Reserved
 * This document is strictly confidential and sole property of GameDuell GmbH, Berlin, Germany
 */
package preferences;

import flash.net.SharedObject;

/**
    @author jxav
 */
@:allow(preferences.Preferences)
class Editor
{
    private var sharedObject: SharedObject;

    private function new(sharedObject: SharedObject)
    {
        this.sharedObject = sharedObject;
    }

    public function putInt(key: String, value: Int): Bool
    {
        sharedObject.data.key = value;
        return true;
    }

    public function putBool(key: String, value: Bool): Bool
    {
        sharedObject.data.key = value;
        return true;
    }

    public function putFloat(key: String, value: Float): Bool
    {
        sharedObject.data.key = value;
        return true;
    }

    public function putString(key: String, value: String): Bool
    {
        sharedObject.data.key = value;
        return true;
    }

    public function remove(key: String): Bool
    {
        sharedObject.data.key = null;
        return true;
    }

    public function apply(): Bool
    {
        return synchronize();
    }

    public function synchronize(): Bool
    {
        try
        {
            sharedObject.flush(10000);
        }
        catch (error: Dynamic)
        {
            return false;
        }

        return true;
    }
}
