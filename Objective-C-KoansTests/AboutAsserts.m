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

- (void)testFillInValues
{
    XCTAssertEqual(___, 1 + 1);
}

@end
