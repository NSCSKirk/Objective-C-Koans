//
//  AboutBool.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/28/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AboutBool : XCTestCase

@end

@implementation AboutBool

- (void)testYESIsTreatedAsTrue
{
    XCTAssertTrue(YES);
}

- (void)testNOIsTreatedAsFalse
{
    XCTAssertFalse(NO);
}

- (void)testNilIsTreatedAsFalse
{
    XCTAssertFalse(nil);
}

- (void)testZeroIsTreatedAsFalse
{
    XCTAssertFalse(0);
}

- (void)testNOIsAMacroFor0
{
    XCTAssertEqual(NO, 0);
}

- (void)testYESIsAMacroForOne
{
    XCTAssertEqual(YES, 1);
}

- (void)testMostEverythingElseIsTrue
{
    XCTAssertTrue(1);
    XCTAssertTrue(@[]);
    XCTAssertTrue(@{});
    XCTAssertTrue("C String");
    XCTAssertTrue(@"Objective-c String");
    XCTAssertTrue(@"");
    
}

@end
