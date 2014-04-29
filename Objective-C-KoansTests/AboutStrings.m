//
//  AboutStrings.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/27/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AboutStrings : XCTestCase

@end

@implementation AboutStrings

- (void)testCreatingLiteralString
{
    NSString *string = @"Example String";
    
    XCTAssertTrue([string isKindOfClass:[NSString class]]);
}

- (void)testGettingStringLength
{
    NSString *string = @"Example String";
    
    XCTAssertEqual(14, [string length]);
}

- (void)testGettingCharactersFromString
{
    NSString *string = @"Example String";
    
    XCTAssertEqual('E', [string characterAtIndex:0]);
    XCTAssertEqual('t', [string characterAtIndex:9]);
}

- (void)testGettingSubstringFromString
{
    NSString *string = @"Example String";
    
    NSString *actual = [string substringToIndex:7];
    XCTAssertEqualObjects(@"Example", actual);
    
    actual = [string substringFromIndex:7];
    XCTAssertEqualObjects(@" String", actual);
    
    actual = [string substringWithRange:NSMakeRange(4, 6)];
    XCTAssertEqualObjects(@"ple St", actual);
}

- (void)testFormattingString
{
    NSString *string = [NSString stringWithFormat:@"%@ %@", @"Example", @"String"];
    
    XCTAssertEqualObjects(@"Example String", string);
    
    //For format strings, '%@' represents Objective-c objects, which are sent the
    //description message. Other format options are similar to printf in C
    string = [NSString stringWithFormat:@"%d %f %s", 1, 2.0f, "C-String"];
    XCTAssertEqualObjects(@"1 2.000000 C-String", string);
}

- (void)testGettingRangeInString
{
    NSString *string = @"Example String";
    
    //NSRange is a C struct, not an Objective-C object
    //Notice the lack of '*' in the declaration
    NSRange range = [string rangeOfString:@"String"];
    XCTAssertTrue(NSEqualRanges(NSMakeRange(8, 6), range));
    
    //According to the documentation, checking if the range length
    //is greater than 0 is the proper way to determine if the
    //string's range was found.
    XCTAssertTrue(range.length > 0);
    
    range = [string rangeOfString:@"NotInString"];
    XCTAssertTrue(range.length == 0);
}

- (void)testIfStringHasPrefixOrSuffix
{
    NSString *string = @"Example String";
    
    XCTAssertTrue([string hasPrefix:@"Example"]);
    XCTAssertTrue([string hasSuffix:@"String"]);
}

- (void)testConvertingStringToOtherValues
{
    NSString *string = @"100";
    
    XCTAssertEqual(100, [string intValue]);
    XCTAssertEqual(100, [string integerValue]);
    XCTAssertEqual(100, [string doubleValue]);
    XCTAssertEqual(100, [string floatValue]);
    
    string = @"YES";
    XCTAssertEqual(YES, [string boolValue]);
}

- (void)testSeparatingItemsInString
{
    NSString *string = @"This is an Example String";
    
    NSArray *components = [string componentsSeparatedByString:@" "];
    NSArray *expected = @[@"This", @"is", @"an", @"Example", @"String"];
    XCTAssertEqualObjects(expected, components);
    
    string = @"This,is an,Example String";
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@", "];
    components = [string componentsSeparatedByCharactersInSet:characterSet];
    expected = @[@"This", @"is", @"an", @"Example", @"String"];
    XCTAssertEqualObjects(expected, components);
}

- (void)testChangingStringCase
{
    NSString *string = @"Example String";
    
    XCTAssertEqualObjects(@"EXAMPLE STRING", [string uppercaseString]);
    XCTAssertEqualObjects(@"example string", [string lowercaseString]);
    
    string = @"example string";
    XCTAssertEqualObjects(@"Example String", [string capitalizedString]);
}

- (void)testTrimmingString
{
    NSString *string = @"    Example String    ";
    
    NSCharacterSet *characterSet = [NSCharacterSet whitespaceCharacterSet];
    XCTAssertEqualObjects(@"Example String", [string stringByTrimmingCharactersInSet:characterSet]);
}

- (void)testPaddingString
{
    NSString *string = @"Example String";
    
    NSString *actual = [string stringByPaddingToLength:20 withString:@" " startingAtIndex:0];
    XCTAssertEqualObjects(@"Example String      ", actual);
}

- (void)testReplacingInStrings
{
    NSString *string = @"Example String";
    
    string = [string stringByReplacingOccurrencesOfString:@"Example" withString:@"Real Life"];
    
    XCTAssertEqualObjects(@"Real Life String", string);
}

- (void)testAppendingString
{
    NSString *string = @"Example String";
    
    string = [string stringByAppendingString:@" For You"];
    
    XCTAssertEqualObjects(@"Example String For You", string);
}

- (void)testMutableStringsAreSubclassesOfNSString
{
    NSMutableString *string = [NSMutableString string];
    
    XCTAssertTrue([string isKindOfClass:[NSString class]]);
}

- (void)testMutableStringsCanBeModifiedInPlace
{
    NSMutableString *string = [NSMutableString string];
    
    [string appendString:@"Example"];
    XCTAssertEqualObjects(@"Example", string);
    
    [string insertString:@" Strings" atIndex:7];
    XCTAssertEqualObjects(@"Example Strings", string);
    
    [string deleteCharactersInRange:NSMakeRange(14, 1)];
    XCTAssertEqualObjects(@"Example String", string);
    
    [string replaceCharactersInRange:NSMakeRange(0, 7) withString:@"Real"];
    XCTAssertEqualObjects(@"Real String", string);
}

@end
