//
//  AboutAsserts.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/26/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>

static const BOOL __ = NO;
static const NSUInteger ___ = 0;
static id const ____ = nil;

@interface AboutAsserts : XCTestCase

@end

@implementation AboutAsserts

- (void)testAssertTruth
{
    XCTAssert(__);
}

- (void)testAssertTruthWithMessage
{
    XCTAssert(__, @"This should be YES -- please fix this");
}

- (void)testAssertEquality
{
    NSInteger expectedValue = ___;
    NSInteger actualValue = 1 + 1;
    
    XCTAssert(expectedValue == actualValue);
}

- (void)testABetterWayOfAssertingEquality
{
    NSInteger expectedValue = ___;
    NSInteger actualValue = 1 + 1;
    
    XCTAssertEqual(expectedValue, actualValue);
}

- (void)testAssertObjectEquality
{
    NSString *objectOne = @"Object";
    NSString *objectTwo = objectOne;
    
    //XCTAssertEqualObjects calls 'isEqual:' using the two passed objects
    //and should be used when comparing Objective-c objects in tests
    XCTAssertEqualObjects(____, objectTwo);
}

- (void)testFillInValues
{
    XCTAssertEqual(___, 1 + 1);
}

@end
