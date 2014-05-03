//
//  AboutObjects.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/27/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@interface AboutObjects : XCTestCase

@end

@implementation AboutObjects

- (void)testObjectDeclaration
{
    //Objective-C objects must be declared as seen below with the
    //'*' to denote that you are declaring a pointer. Typically, you
    //will only use the '*' when declaring the variable.
    NSString *string = @"string";
    
    XCTAssertEqualObjects(__, string);
    
    //The exception is when declaring a variable with 'id' since it
    //implies the pointer.
    id anotherString = @"anotherString";
    
    XCTAssertEqualObjects(__, anotherString);
}

- (void)testObjectPointerEquality
{
    UILabel *labelOne = [[UILabel alloc] init];
    UILabel *labelTwo = labelOne;
    
    //Using '==' with Objective-C objects will always compare their memory address.
    //In other words, only use '==' when you want to know if two objects are
    //literally the exact same object.
    XCTAssertTrue(labelOne == __);
}

- (void)testObjectClass
{
    UILabel *label = [[UILabel alloc] init];
    
    XCTAssertEqualObjects(__, [UILabel class]);
}

- (void)testObjectIntrospection
{
    UILabel *label = [[UILabel alloc] init];
    
    //Tests if the receiver is an instance of the class
    XCTAssertEqual(__, [label isMemberOfClass:[UILabel class]]);
    
    //Tests if the receiver is an instance or descendant of the class
    XCTAssertEqual(__, [label isKindOfClass:[NSObject class]]);
}

- (void)testObjectDescription
{
    NSString *string = @"123";
    
    XCTAssertEqualObjects(__, [string description]);
}

- (void)testCopyCreatesACopyOfTheReceiver
{
    NSString *string = @"Original String";
    NSString *copiedString = [string copy];
    
    XCTAssertEqualObjects(__, copiedString);
}

- (void)testMutableCopyCreatesAMutableCopyOfTheReceiver
{
    NSString *string = @"Original String";
    NSMutableString *copiedString = [string mutableCopy];
    
    XCTAssertEqualObjects(__, copiedString);
}

@end
