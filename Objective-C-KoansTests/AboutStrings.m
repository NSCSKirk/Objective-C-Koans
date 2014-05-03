//
//  AboutStrings.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/27/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@interface AboutStrings : XCTestCase

@end

@implementation AboutStrings

- (void)testCreatingLiteralString
{
    NSString *string = @"Example String";
    
    XCTAssertEqual(____, [string isKindOfClass:[NSString class]]);
}

- (void)testGettingStringLength
{
    NSString *string = @"Example String";
    
    XCTAssertEqual(_____, [string length]);
}

- (void)testGettingCharactersFromString
{
    NSString *string = @"Example String";
    
    XCTAssertEqual(_____, [string characterAtIndex:0]);
    XCTAssertEqual(_____, [string characterAtIndex:9]);
}

- (void)testGettingSubstringFromString
{
    NSString *string = @"Example String";
    
    NSString *actual = [string substringToIndex:7];
    XCTAssertEqualObjects(__, actual);
    
    actual = [string substringFromIndex:7];
    XCTAssertEqualObjects(__, actual);
    
    actual = [string substringWithRange:NSMakeRange(4, 6)];
    XCTAssertEqualObjects(__, actual);
}

- (void)testFormattingString
{
    NSString *string = [NSString stringWithFormat:@"%@ %@", @"Example", @"String"];
    
    XCTAssertEqualObjects(__, string);
    
    //For format strings, '%@' represents Objective-c objects, which are sent the
    //description message. Other format options are similar to printf in C
    string = [NSString stringWithFormat:@"%d %f %s", 1, 2.0f, "C-String"];
    XCTAssertEqualObjects(__, string);
}

- (void)testGettingRangeInString
{
    NSString *string = @"Example String";
    
    //NSRange is a C struct, not an Objective-C object
    //Notice the lack of '*' in the declaration
    NSRange range = [string rangeOfString:@"String"];
    XCTAssertEqual(____, NSEqualRanges(NSMakeRange(8, 6), range));
    
    //According to the documentation, checking if the range length
    //is greater than 0 is the proper way to determine if the
    //string's range was found.
    XCTAssertEqual(____, range.length > 0);
    
    range = [string rangeOfString:@"NotInString"];
    XCTAssertEqual(____, range.length == 0);
}

- (void)testIfStringHasPrefixOrSuffix
{
    NSString *string = @"Example String";
    
    XCTAssertEqual(____, [string hasPrefix:@"Example"]);
    XCTAssertEqual(____, [string hasSuffix:@"String"]);
}

- (void)testConvertingStringToOtherValues
{
    NSString *string = @"100";
    
    XCTAssertEqual(_____, [string intValue]);
    XCTAssertEqual(_____, [string integerValue]);
    XCTAssertEqual(_____, [string doubleValue]);
    XCTAssertEqual(_____, [string floatValue]);
    
    string = @"YES";
    XCTAssertEqual(____, [string boolValue]);
}

- (void)testSeparatingItemsInString
{
    NSString *string = @"This is an Example String";
    
    NSArray *components = [string componentsSeparatedByString:@" "];
    XCTAssertEqualObjects((__), components);
    
    string = @"This,is an,Example String";
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@", "];
    components = [string componentsSeparatedByCharactersInSet:characterSet];
    XCTAssertEqualObjects((__), components);
}

- (void)testChangingStringCase
{
    NSString *string = @"Example String";
    
    XCTAssertEqualObjects(__, [string uppercaseString]);
    XCTAssertEqualObjects(__, [string lowercaseString]);
    
    string = @"example string";
    XCTAssertEqualObjects(__, [string capitalizedString]);
}

- (void)testTrimmingString
{
    NSString *string = @"    Example String    ";
    
    NSCharacterSet *characterSet = [NSCharacterSet whitespaceCharacterSet];
    XCTAssertEqualObjects(__, [string stringByTrimmingCharactersInSet:characterSet]);
}

- (void)testPaddingString
{
    NSString *string = @"Example String";
    
    NSString *actual = [string stringByPaddingToLength:20 withString:@" " startingAtIndex:0];
    XCTAssertEqualObjects(__, actual);
}

- (void)testReplacingInStrings
{
    NSString *string = @"Example String";
    
    string = [string stringByReplacingOccurrencesOfString:@"Example" withString:@"Real Life"];
    
    XCTAssertEqualObjects(__, string);
}

- (void)testAppendingString
{
    NSString *string = @"Example String";
    
    string = [string stringByAppendingString:@" For You"];
    
    XCTAssertEqualObjects(__, string);
}

- (void)testMutableStringsAreSubclassesOfNSString
{
    NSMutableString *string = [NSMutableString string];
    
    XCTAssertEqual(____, [string isKindOfClass:[NSString class]]);
}

- (void)testMutableStringsCanBeModifiedInPlace
{
    NSMutableString *string = [NSMutableString string];
    
    [string appendString:@"Example"];
    XCTAssertEqualObjects(__, string);
    
    [string insertString:@" Strings" atIndex:7];
    XCTAssertEqualObjects(__, string);
    
    [string deleteCharactersInRange:NSMakeRange(14, 1)];
    XCTAssertEqualObjects(__, string);
    
    [string replaceCharactersInRange:NSMakeRange(0, 7) withString:@"Real"];
    XCTAssertEqualObjects(__, string);
}

@end
