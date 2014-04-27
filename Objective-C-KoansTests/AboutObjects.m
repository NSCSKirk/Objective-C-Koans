//
//  AboutObjects.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/27/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>

static id const ___ = nil;
static NSString * const __ = @"FILL ME IN";

@interface AboutObjects : XCTestCase

@end

@implementation AboutObjects

- (void)testObjectDeclaration
{
    //Objective-C objects must be declared as seen below with the
    //'*' to denote that you are declaring a pointer. Typically, you
    //will only use the '*' when declaring the variable.
    NSString *string = @"string";
    
    XCTAssertNotNil(___);
    
    //The exception is when declaring a variable with 'id' since it
    //implies the pointer.
    id anotherString = @"anotherString";
    
    XCTAssertNotNil(___);
}

- (void)testObjectPointerEquality
{
    UILabel *labelOne = [[UILabel alloc] init];
    UILabel *labelTwo = labelOne;
    
    //Using '==' with Objective-C objects will always compare their memory address.
    //In other words, only use '==' when you want to know if two objects are
    //literally the exact same object.
    XCTAssertTrue(___ == labelTwo);
}

- (void)testObjectClass
{
    UILabel *label = [[UILabel alloc] init];
    
    XCTAssertEqualObjects([label class], ___);
}

- (void)testObjectIntrospection
{
    UILabel *label = [[UILabel alloc] init];
    
    //Tests if the receiver is an instance of the class
    XCTAssertTrue([___ isMemberOfClass:[UILabel class]]);
    
    //Tests if the receiver is an instance or descendant of the class
    XCTAssertTrue([___ isKindOfClass:[NSObject class]]);
}

- (void)testObjectDescription
{
    NSString *string = @"123";
    
    XCTAssertEqualObjects(___, [string description]);
}

@end
