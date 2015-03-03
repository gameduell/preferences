package test;

import preferences.Editor;
import preferences.Preferences;
import unittest.TestCase;

class PreferencesTest extends TestCase
{
    override public function setup(): Void
    {
        var editor: Editor = Preferences.getEditor();

        editor.remove("bool_flag");
        editor.remove("int_flag");
        editor.remove("float_flag");
        editor.remove("string_flag");
        editor.remove("key_to_be_removed");

        editor.synchronize();
    }

    public function testBoolSettingAndRetrieving(): Void
    {
        assertEquals(false, Preferences.getBool("bool_flag"));

        var editor: Editor = Preferences.getEditor();
        editor.putBool("bool_flag", true);
        editor.synchronize();

        assertTrue(Preferences.getBool("bool_flag"));

        editor.putBool("bool_flag", false);
        editor.synchronize();

        assertFalse(Preferences.getBool("bool_flag"));
    }

    public function testIntSettingAndRetrieving(): Void
    {
        assertEquals(0, Preferences.getInt("int_flag"));

        var editor: Editor = Preferences.getEditor();
        editor.putInt("int_flag", 42);
        editor.synchronize();

        assertEquals(42, Preferences.getInt("int_flag"));

        editor.putInt("int_flag", 250);
        editor.synchronize();

        assertEquals(250, Preferences.getInt("int_flag"));
    }

    public function testFloatSettingAndRetrieving(): Void
    {
        assertEqualsFloat(0.0, Preferences.getFloat("float_flag"));

        var editor: Editor = Preferences.getEditor();
        editor.putFloat("float_flag", 3.7);
        editor.synchronize();

        assertEqualsFloat(3.7, Preferences.getFloat("float_flag"));

        editor.putFloat("float_flag", 989.989);
        editor.synchronize();

        assertEqualsFloat(989.989, Preferences.getFloat("float_flag"));
    }

    public function testStringSettingAndRetrieving(): Void
    {
        assertEquals(null, Preferences.getString("string_flag"));

        var editor: Editor = Preferences.getEditor();
        editor.putString("string_flag", "test");
        editor.synchronize();

        assertEquals("test", Preferences.getString("string_flag"));

        editor.putString("string_flag", "foobar");
        editor.synchronize();

        assertEquals("foobar", Preferences.getString("string_flag"));
    }

    public function testKeyRemoving(): Void
    {
        var editor: Editor = Preferences.getEditor();
        editor.putString("key_to_be_removed", "val");
        editor.synchronize();

        assertEquals("val", Preferences.getString("key_to_be_removed"));

        editor.remove("key_to_be_removed");
        editor.synchronize();

        assertEquals(null, Preferences.getString("key_to_be_removed"));
    }

    private inline function assertEqualsFloat(expected: Float, result: Float): Void
    {
        assertTrue(result > expected - 0.001 && result < expected + 0.001);
    }
}
