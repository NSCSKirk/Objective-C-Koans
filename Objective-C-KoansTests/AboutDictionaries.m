//
//  AboutDictionaries.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/27/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@interface AboutDictionaries : XCTestCase

@end

@implementation AboutDictionaries

- (void)testCreatingDictionaries
{
    NSDictionary *dictionary = [NSDictionary dictionary];
    
    XCTAssertEqual(____, [dictionary isKindOfClass:[NSDictionary class]]);
    XCTAssertEqualObjects(__, dictionary);
    XCTAssertEqual(_____, [dictionary count]);
}

- (void)testDictionaryLiterals
{
    NSDictionary *dictionary = @{ @"one" : @"uno", @"two" : @"dos"};
    
    XCTAssertEqual(_____, [dictionary count]);
}

- (void)testAccessingDictionaries
{
    NSDictionary *dictionary = @{ @"one" : @"uno", @"two" : @"dos"};
    
    XCTAssertEqualObjects(__, dictionary[@"one"]);
    XCTAssertEqualObjects(__, dictionary[@"two"]);
    XCTAssertEqualObjects(__, dictionary[@"DoesntExist"]);
}

- (void)testDictionariesAreUnordered
{
    NSDictionary *dictionaryOne = @{ @"one" : @"uno", @"two" : @"dos"};
    NSDictionary *dictionaryTwo = @{ @"two" : @"dos", @"one" : @"uno"};
    
    XCTAssertEqualObjects(__, dictionaryTwo);
}

- (void)testDictionaryKeys
{
    NSDictionary *dictionary = @{ @"one" : @"uno", @"two" : @"dos"};
    
    XCTAssertEqual(____, [[dictionary allKeys] isKindOfClass:[NSArray class]]);
    XCTAssertEqual(_____, [[dictionary allKeys] count]);
    
    //You could check the allKeys array to see if it contained a key
    //but its usually better to simply check for nil when accessing
    XCTAssertEqual(____, [[dictionary allKeys] containsObject:@"one"]);
}

- (void)testDictionaryValues
{
    NSDictionary *dictionary = @{ @"one" : @"uno", @"two" : @"dos"};
    
    XCTAssertEqual(____, [[dictionary allValues] isKindOfClass:[NSArray class]]);
    XCTAssertEqual(_____, [[dictionary allValues] count]);
    
    //You could check the allValues array to see if it contained a value
    //but its usually better to simply check for nil when accessing
    XCTAssertEqual(_____, [[dictionary allValues] containsObject:@"uno"]);
}

- (void)testMutableDictionariesAreSubclassesOfNSDictionary
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    XCTAssertEqual(____, [dictionary isKindOfClass:[NSDictionary class]]);
}

- (void)testSettingValuesInMutableDictionaries
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    dictionary[@"one"] = @"uno";
    XCTAssertEqualObjects((__), dictionary);
}

- (void)testRemovingObjectsFromDictionaries
{
    NSDictionary *dictionary = @{ @"one" : @"uno", @"two" : @"dos"};
    NSMutableDictionary *mutableDictionary = [dictionary mutableCopy];
    
    [mutableDictionary removeObjectForKey:@"one"];
    XCTAssertEqualObjects((__), mutableDictionary);
    
    [mutableDictionary removeAllObjects];
    XCTAssertEqualObjects((__), mutableDictionary);
}

- (void)testDictionaryKeysOrValuesCannotBeNil
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    XCTAssertThrowsSpecificNamed([dictionary setObject:nil forKey:@"Key"], NSException, __);
    XCTAssertThrowsSpecificNamed([dictionary setObject:@"Value" forKey:nil], NSException, __);
}

@end
