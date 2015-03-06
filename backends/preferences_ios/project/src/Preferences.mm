//
//  Created by João Xavier on 02/03/15.
//  Copyright (c) 2015 GameDuell GmbH. All rights reserved.
//

#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#include <hx/CFFI.h>

#import <Foundation/Foundation.h>


static NSString* valueToNSString(value haxeString)
{
    const char *cString = val_get_string(haxeString);

    NSString *string = [NSString stringWithUTF8String:cString];
    return string;
}


static value getInt(value keyHx)
{
    NSString *key = valueToNSString(keyHx);

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    int value = [userDefaults integerForKey:key];

    return alloc_int(value);
}
DEFINE_PRIM(getInt, 1);


static value getBool(value keyHx)
{
    NSString *key = valueToNSString(keyHx);

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL value = [userDefaults boolForKey:key];

    return alloc_bool(value);
}
DEFINE_PRIM(getBool, 1);


static value getFloat(value keyHx)
{
    NSString *key = valueToNSString(keyHx);

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    float value = [userDefaults floatForKey:key];

    return alloc_float(value);
}
DEFINE_PRIM(getFloat, 1);


static value getString(value keyHx)
{
    NSString *key = valueToNSString(keyHx);

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *value = [userDefaults stringForKey:key];

    if (value)
    {
        return alloc_string(value.UTF8String);
    }
    else
    {
        return alloc_null();
    }
}
DEFINE_PRIM(getString, 1);


static value putInt(value keyHx, value valueHx)
{
    NSString *key = valueToNSString(keyHx);
    int val = val_get_int(valueHx);

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:val forKey:key];

    return alloc_bool(YES);
}
DEFINE_PRIM(putInt, 2);


static value putBool(value keyHx, value valueHx)
{
    NSString *key = valueToNSString(keyHx);
    BOOL val = val_get_bool(valueHx);

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:val forKey:key];

    return alloc_bool(YES);
}
DEFINE_PRIM(putBool, 2);


static value putFloat(value keyHx, value valueHx)
{
    NSString *key = valueToNSString(keyHx);
    float val = (float) val_get_double(valueHx);

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setFloat:val forKey:key];

    return alloc_bool(YES);
}
DEFINE_PRIM(putFloat, 2);


static value putString(value keyHx, value valueHx)
{
    NSString *key = valueToNSString(keyHx);
    NSString *val = valueToNSString(valueHx);

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:val forKey:key];

    return alloc_bool(YES);
}
DEFINE_PRIM(putString, 2);


static value removeKey(value keyHx)
{
    NSString *key = valueToNSString(keyHx);

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];

    return alloc_bool(YES);
}
DEFINE_PRIM(removeKey, 1);


static value synchronize()
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return alloc_bool([userDefaults synchronize]);
}
DEFINE_PRIM(synchronize, 0);


extern "C" int preferencesios_register_prims() { return 0; }
