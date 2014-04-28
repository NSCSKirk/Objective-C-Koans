//
//  AboutDictionaries.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/27/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AboutDictionaries : XCTestCase

@end

@implementation AboutDictionaries

- (void)testCreatingDictionaries
{
    NSDictionary *dictionary = [NSDictionary dictionary];
    
    XCTAssertTrue([dictionary isKindOfClass:[NSDictionary class]]);
    XCTAssertEqualObjects(@{}, dictionary);
    XCTAssertEqual(0, [dictionary count]);
}

- (void)testDictionaryLiterals
{
    NSDictionary *dictionary = @{ @"one" : @"uno", @"two" : @"dos"};
    
    XCTAssertEqual(2, [dictionary count]);
}

- (void)testAccessingDictionaries
{
    NSDictionary *dictionary = @{ @"one" : @"uno", @"two" : @"dos"};
    
    XCTAssertEqualObjects(@"uno", dictionary[@"one"]);
    XCTAssertEqualObjects(@"dos", dictionary[@"two"]);
    XCTAssertEqualObjects(nil, dictionary[@"DoesntExist"]);
}

- (void)testDictionariesAreUnordered
{
    NSDictionary *dictionaryOne = @{ @"one" : @"uno", @"two" : @"dos"};
    NSDictionary *dictionaryTwo = @{ @"two" : @"dos", @"one" : @"uno"};
    
    XCTAssertEqualObjects(dictionaryOne, dictionaryTwo);
}

- (void)testDictionaryKeys
{
    NSDictionary *dictionary = @{ @"one" : @"uno", @"two" : @"dos"};
    
    XCTAssertTrue([[dictionary allKeys] isKindOfClass:[NSArray class]]);
    XCTAssertEqual(2, [[dictionary allKeys] count]);
    
    //You could check the allKeys array to see if it contained a key
    //but its usually better to simply check for nil when accessing
    XCTAssertTrue([[dictionary allKeys] containsObject:@"one"]);
}

- (void)testDictionaryValues
{
    NSDictionary *dictionary = @{ @"one" : @"uno", @"two" : @"dos"};
    
    XCTAssertTrue([[dictionary allValues] isKindOfClass:[NSArray class]]);
    XCTAssertEqual(2, [[dictionary allValues] count]);
    
    //You could check the allValues array to see if it contained a value
    //but its usually better to simply check for nil when accessing
    XCTAssertTrue([[dictionary allValues] containsObject:@"uno"]);
}

- (void)testMutableDictionariesAreSubclassesOfNSDictionary
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    XCTAssertTrue([dictionary isKindOfClass:[NSDictionary class]]);
}

- (void)testSettingValuesInMutableDictionaries
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    dictionary[@"one"] = @"uno";
    NSDictionary *expected = @{@"one" : @"uno"};
    XCTAssertEqualObjects(expected, dictionary);
}

- (void)testRemovingObjectsFromDictionaries
{
    NSDictionary *dictionary = @{ @"one" : @"uno", @"two" : @"dos"};
    NSMutableDictionary *mutableDictionary = [dictionary mutableCopy];
    
    [mutableDictionary removeObjectForKey:@"one"];
    NSDictionary *expected = @{ @"two" : @"dos" };
    XCTAssertEqualObjects(expected, mutableDictionary);
    
    [mutableDictionary removeAllObjects];
    expected = @{};
    XCTAssertEqualObjects(expected, mutableDictionary);
}

@end
