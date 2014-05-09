//
//  AboutCategories.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 5/4/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@interface NSString (KoansExtensions)
- (NSString *)stringByTrimmingWhitespace;
@end

@implementation NSString (KoansExtensions)

- (NSString *)stringByTrimmingWhitespace
{
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@" "];
    return [self stringByTrimmingCharactersInSet:characterSet];
}

@end

@interface AboutCategories : XCTestCase

@end

@implementation AboutCategories

- (void)testCategoriesAddMethodsToExistingClasses
{
    NSString *string = @"  This is super fun!   ";
    
    string = [string stringByTrimmingWhitespace];
    
    XCTAssertEqualObjects(__, string);
}

@end
