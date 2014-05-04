//
//  AboutAsserts.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/26/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@interface AboutAsserts : XCTestCase

@end

@implementation AboutAsserts

- (void)testAssertTruth
{
    XCTAssert(___);
}

- (void)testAssertTruthWithMessage
{
    XCTAssert(___, @"This should be YES -- please fix this");
}

- (void)testAssertEquality
{
    NSInteger actualValue = 1 + 1;
    
    XCTAssert(_____ == actualValue);
}

- (void)testABetterWayOfAssertingEquality
{
    NSInteger actualValue = 1 + 1;
    
    XCTAssertEqual(_____, actualValue);
}

- (void)testAssertObjectEquality
{
    NSString *object = @"Object";
    
    //XCTAssertEqualObjects calls 'isEqual:' using the two passed objects
    //and should be used when comparing Objective-c objects in tests
    XCTAssertEqualObjects(__, object);
}

- (void)testAssertSpeificExceptionThrown
{
    NSException *exception = [NSException exceptionWithName:NSInternalInconsistencyException reason:@"" userInfo:nil];
    
    XCTAssertThrowsSpecificNamed([exception raise], NSException, __);
}

- (void)testFillInValues
{
    XCTAssertEqual(_____, 1 + 1);
}

@end
