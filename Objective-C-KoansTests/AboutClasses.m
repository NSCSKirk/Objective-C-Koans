//
//  AboutClasses.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/28/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Dog : NSObject

@end

@implementation Dog


@end

@interface AboutClasses : XCTestCase

@end

@implementation AboutClasses

- (void)testClassesCanBeCreatedWithAllocInit
{
    Dog *dog = [[Dog alloc] init];
    
    XCTAssertEqualObjects(@"Dog", NSStringFromClass([dog class]));
}

@end
