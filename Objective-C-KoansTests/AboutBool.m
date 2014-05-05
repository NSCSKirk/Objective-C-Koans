//
//  AboutBool.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/28/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@interface AboutBool : XCTestCase

@end

@implementation AboutBool

- (void)testYESIsTreatedAsTrue
{
    XCTAssertTrue(____);
}

- (void)testNOIsTreatedAsFalse
{
    XCTAssertFalse(_____);
}

- (void)testNilIsTreatedAsFalse
{
    XCTAssertFalse(_____);
}

- (void)testZeroIsTreatedAsFalse
{
    XCTAssertFalse(_____);
}

- (void)testNOIsAMacroFor0
{
    XCTAssertEqual(_____, 0);
}

- (void)testYESIsAMacroForOne
{
    XCTAssertEqual(_____, 1);
}

//Need a way to fail these in a elegant way
- (void)testMostEverythingElseIsTrue
{
    XCTAssertTrue(___); //1
    XCTAssertTrue(___); //@[]
    XCTAssertTrue(___); //@[]
    XCTAssertTrue(___); //@"C String"
    XCTAssertTrue(___); //@"Objective-C String"
    XCTAssertTrue(___); //@""
    
}

@end
