package test;

import preferences.Preferences;
import unittest.TestCase;

class PreferencesTest extends TestCase
{
    public function new()
    {
        Preferences.removeKey("bool_flag");
        Preferences.removeKey("int_flag");
        Preferences.removeKey("float_flag");
        Preferences.removeKey("string_flag");
        Preferences.removeKey("key_to_be_removed");

        super();
    }

    public function testBoolSettingAndRetrieving()
    {
        assertEquals(null, Preferences.getBool("bool_flag"));

        Preferences.putBool("bool_flag", true);
        Preferences.synchronize();

        assertTrue(Preferences.getBool("bool_flag"));

        Preferences.putBool("bool_flag", false);
        Preferences.synchronize();

        assertFalse(Preferences.getBool("bool_flag"));
    }

    public function testIntSettingAndRetrieving()
    {
        assertEquals(null, Preferences.getInt("int_flag"));

        Preferences.putInt("int_flag", 42);
        Preferences.synchronize();

        assertEquals(42, Preferences.getInt("int_flag"));

        Preferences.putBool("int_flag", 250);
        Preferences.synchronize();

        assertEquals(250, Preferences.getInt("int_flag"));
    }

    public function testFloatSettingAndRetrieving()
    {
        assertEquals(null, Preferences.getFloat("float_flag"));

        Preferences.putFloat("float_flag", 150.2);
        Preferences.synchronize();

        assertEquals(150.2, Preferences.getFloat("float_flag"));

        Preferences.putFloat("float_flag", 989.989);
        Preferences.synchronize();

        assertEquals(989.989, Preferences.getFloat("float_flag"));
    }

    public function testStringSettingAndRetrieving()
    {
        assertEquals(null, Preferences.getString("string_flag"));

        Preferences.putString("string_flag", "test");
        Preferences.synchronize();

        assertEquals("test", Preferences.getString("string_flag"));

        Preferences.putString("string_flag", "foobar");
        Preferences.synchronize();

        assertEquals("foobar", Preferences.getString("string_flag"));
    }

    public function testKeyRemoving()
    {
        Preferences.putString("key_to_be_removed", "val");
        Preferences.synchronize();

        assertEquals("val", Preferences.getString("key_to_be_removed"));

        Preferences.removeKey("key_to_be_removed");
        Preferences.synchronize();

        assertEquals(null, Preferences.getString("key_to_be_removed"));
    }
}
