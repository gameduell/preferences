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


extern "C" int preferencesapple_register_prims() { return 0; }
