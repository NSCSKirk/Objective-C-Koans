//
//  AboutNil.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/26/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <objc/runtime.h>
#import "KoansDefines.h"

@interface AboutNil : XCTestCase

@end

@implementation AboutNil

- (void)testNilIsTheNullValueForObjectiveCObjects
{
    XCTAssertNil(__);
}

- (void)testCallingMethodsOnNilDoesNotRaiseException
{
    //Nil is treated as a no-op in Objective-C. This allows
    //you to expunge most nil checking code that you see in
    //other languages. While sometimes you may want to check
    //for nil in some cases, like setting a default value,
    //things like checking an object for nil before calling a
    //method on an object can be ignored as no exception will
    //be thrown.
    NSString *string = nil;

    //Try [string uppercaseString]
    XCTAssertNoThrow(______);
}

- (void)testNilEvaluatesToFalse
{
    XCTAssertFalse(__);
}

- (void)testNilAndNULLHaveTheSameValue
{
    //Nil and NULL evaluate to 0. In fact, in
    //MacTypes.h you will see that nil is defined as NULL.
    //In general, it's best to use nil as you can call messages
    //on it without throwing an exception. An exception to this
    //is if working in raw C code, where NULL is appropriate.
    XCTAssertEqualObjects(__, NULL);
}

- (void)testCapitalizedNilIsNullValueForObjectiveCClasses
{
    Class fakeClass = objc_getClass("FakeClass");
    
    XCTAssertEqualObjects(__, fakeClass);
}

- (void)testNSNullIsASingletonObjectRepresentingNull
{
    NSNull *nullValue = [NSNull null];
    
    //NSNull is an interesting case because its purpose is to
    //represent null values inside of things like arrays and
    //dictionaries that cant contain null values. Yet,
    //[NSNull null] is not equilevent to nil itself. Notice
    //that it is used as a singleton.
    XCTAssertNotNil(___);
}

@end
