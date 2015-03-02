package test;

import preferences.Editor;
import preferences.Preferences;
import unittest.TestCase;

class PreferencesTest extends TestCase
{
    public function new()
    {
        var editor: Editor = Preferences.getEditor();

        editor.remove("bool_flag");
        editor.remove("int_flag");
        editor.remove("float_flag");
        editor.remove("string_flag");
        editor.remove("key_to_be_removed");

        editor.synchronize();

        super();
    }

    public function testBoolSettingAndRetrieving()
    {
        assertEquals(false, Preferences.getBool("bool_flag", false));

        var editor: Editor = Preferences.getEditor();
        editor.putBool("bool_flag", true);
        editor.synchronize();

        assertTrue(Preferences.getBool("bool_flag", false));

        editor.putBool("bool_flag", false);
        editor.synchronize();

        assertFalse(Preferences.getBool("bool_flag", true));
    }

    public function testIntSettingAndRetrieving()
    {
        assertEquals(-1, Preferences.getInt("int_flag", -1));

        var editor: Editor = Preferences.getEditor();
        editor.putInt("int_flag", 42);
        editor.synchronize();

        assertEquals(42, Preferences.getInt("int_flag", -1));

        editor.putInt("int_flag", 250);
        editor.synchronize();

        assertEquals(250, Preferences.getInt("int_flag", -1));
    }

    public function testFloatSettingAndRetrieving()
    {
        assertEquals(-1.0, Preferences.getFloat("float_flag", -1.0));

        var editor: Editor = Preferences.getEditor();
        editor.putFloat("float_flag", 150.2);
        editor.synchronize();

        assertEquals(150.2, Preferences.getFloat("float_flag", -1.0));

        editor.putFloat("float_flag", 989.989);
        editor.synchronize();

        assertEquals(989.989, Preferences.getFloat("float_flag", -1.0));
    }

    public function testStringSettingAndRetrieving()
    {
        assertEquals("dummy", Preferences.getString("string_flag", "dummy"));

        var editor: Editor = Preferences.getEditor();
        editor.putString("string_flag", "test");
        editor.synchronize();

        assertEquals("test", Preferences.getString("string_flag", "dummy"));

        editor.putString("string_flag", "foobar");
        editor.synchronize();

        assertEquals("foobar", Preferences.getString("string_flag", "dummy"));
    }

    public function testKeyRemoving()
    {
        var editor: Editor = Preferences.getEditor();
        editor.putString("key_to_be_removed", "val");
        editor.synchronize();

        assertEquals("val", Preferences.getString("key_to_be_removed", "dummy"));

        editor.remove("key_to_be_removed");
        editor.synchronize();

        assertEquals("dummy", Preferences.getString("key_to_be_removed", "dummy"));
    }
}
