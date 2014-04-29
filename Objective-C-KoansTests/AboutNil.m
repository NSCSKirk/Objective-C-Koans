//
//  AboutNil.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/26/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>


static NSString * const __ = @"FILL ME IN";

@interface AboutNil : XCTestCase

@end

@implementation AboutNil

- (void)testCallingMethodsOnNilDoesNotRaiseException
{
    id object = nil;
    
    XCTAssertNoThrow([object stringValue]);
}

- (void)testNilEvaluatesToFalse
{
    XCTAssertFalse(nil);
}

- (void)testNilAndNULLHaveTheSameValue
{
    //Nil and NULL evaluate to the same value, but NULL
    //should only be used in C code, whereas nil should
    //be used in Objective-c code
    XCTAssertEqualObjects(nil, NULL);
}

@end
