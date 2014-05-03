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

//Need a better way to demonstrate this?
- (void)testCallingMethodsOnNilDoesNotRaiseException
{
    NSString *string = nil;
    
    XCTAssertNoThrow([string intValue]);
}

- (void)testNilEvaluatesToFalse
{
    XCTAssertFalse(__);
}

- (void)testNilAndNULLHaveTheSameValue
{
    //Nil and NULL evaluate to the same value, but NULL
    //should only be used in C code, whereas nil should
    //be used in Objective-c code
    XCTAssertEqualObjects(__, NULL);
}

@end
