//
//  AboutAsserts.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/26/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AboutAsserts : XCTestCase

@end

@implementation AboutAsserts

- (void)testAssertTruth
{
    XCTAssert(YES);
}

- (void)testAssertTruthWithMessage
{
    XCTAssert(YES, @"This should be YES -- please fix this");
}

- (void)testAssertEquality
{
    NSInteger expectedValue = 2;
    NSInteger actualValue = 1 + 1;
    
    XCTAssert(expectedValue == actualValue);
}

- (void)testABetterWayOfAssertingEquality
{
    NSInteger expectedValue = 2;
    NSInteger actualValue = 1 + 1;
    
    XCTAssertEqual(expectedValue, actualValue);
}

- (void)testAssertObjectEquality
{
    NSString *objectOne = @"Object";
    NSString *objectTwo = objectOne;
    
    //XCTAssertEqualObjects calls 'isEqual:' using the two passed objects
    //and should be used when comparing Objective-c objects in tests
    XCTAssertEqualObjects(objectOne, objectTwo);
}

- (void)testAssertSpeificExceptionThrown
{
    NSException *exception = [NSException exceptionWithName:NSInternalInconsistencyException reason:@"" userInfo:nil];
    
    XCTAssertThrowsSpecificNamed([exception raise], NSException, NSInternalInconsistencyException);
}

- (void)testFillInValues
{
    XCTAssertEqual(2, 1 + 1);
}

@end
