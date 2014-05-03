//
//  AboutArrays.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/27/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@interface AboutArrays : XCTestCase

@end

@implementation AboutArrays

- (void)testCreatingArrays
{
    NSArray *array = [NSArray array];
    
    XCTAssertEqual(____, [array isKindOfClass:[NSArray class]]);
    XCTAssertEqual(_____, [array count]);
}

- (void)testArrayEquality
{
    NSArray *array = @[@"Dog", @"Cat"];
    NSArray *expected = array;
    
    XCTAssertEqual(____, [array isEqualToArray:expected]);
    XCTAssertEqualObjects((__), array);
}

- (void)testArrayLiterals
{
    NSArray *array = [NSArray array];
    NSArray *literal = @[];
    XCTAssertEqualObjects(__, array);
    
    array = [NSArray arrayWithObject:@"1"];
    literal = @[@"1"];
    XCTAssertEqualObjects(__, array);
    
    array = [NSArray arrayWithObjects:@"1", @"2", nil];
    literal = @[@"1", @"2"];
    XCTAssertEqualObjects(__, array);
}

- (void)testAccessingArrayElements
{
    NSArray *array = @[@"Peanut", @"Butter", @"And", @"Jelly"];
    
    XCTAssertEqualObjects(__, array[0]);
    XCTAssertEqualObjects(__, [array firstObject]);
    XCTAssertEqualObjects(__, array[3]);
    XCTAssertEqualObjects(__, [array lastObject]);
}

- (void)testGettingIndexOfArrayObjects
{
    NSArray *array = @[@"Peanut", @"Butter", @"And", @"Jelly"];
    
    XCTAssertEqual(_____, [array indexOfObject:@"Peanut"]);
    XCTAssertEqual(_____, [array indexOfObject:@"Crackers"]);
    XCTAssertEqual(_____, [array indexOfObject:@"Butter" inRange:NSMakeRange(0, 2)]);
    XCTAssertEqual(_____, [array indexOfObject:@"Butter" inRange:NSMakeRange(0, 1)]);
    
    UILabel *label = [[UILabel alloc] init];
    array = @[label];
    
    XCTAssertEqual(_____, [array indexOfObjectIdenticalTo:label]);
}

- (void)testSlicingArraysWithRanges
{
    NSArray *array = @[@"Peanut", @"Butter", @"And", @"Jelly"];
    
    NSArray *actual = [array subarrayWithRange:NSMakeRange(0, 1)];
    XCTAssertEqualObjects((__), actual);
    
    actual = [array subarrayWithRange:NSMakeRange(0, 2)];
    XCTAssertEqualObjects((__), actual);
    
    actual = [array subarrayWithRange:NSMakeRange(2, 2)];
    XCTAssertEqualObjects((__), actual);
    
    actual = [array subarrayWithRange:NSMakeRange(3, 0)];
    XCTAssertEqualObjects((__), actual);
}

- (void)testCreatingNewArraysFromExistingArrays
{
    NSArray *array = @[@"Peanut"];
    
    array = [array arrayByAddingObject:@"Butter"];
    XCTAssertEqualObjects((__), array);
    
    array = [array arrayByAddingObjectsFromArray:@[@"And", @"Jelly"]];
    XCTAssertEqualObjects((__), array);
}

- (void)testJoiningComponentsInArray
{
    NSArray *array = @[@"Peanut", @"Butter", @"And", @"Jelly"];
    NSString *actual = [array componentsJoinedByString:@" "];
    
    XCTAssertEqualObjects(__, actual);
    
    actual = [array componentsJoinedByString:nil];
    XCTAssertEqualObjects(__, actual);
    
    array = @[];
    actual = [array componentsJoinedByString:@" "];
    XCTAssertEqualObjects(__, actual);
}

- (void)testMutableArraysAreSubclassesofNSArray
{
    NSMutableArray *array = [NSMutableArray array];
    
    XCTAssertEqual(____, [array isKindOfClass:[NSArray class]]);
}

- (void)testAddingToMutableArrays
{
    NSMutableArray *array = [NSMutableArray array];

    [array addObject:@"Peanut"];
    XCTAssertEqualObjects((__), array);
    
    [array addObjectsFromArray:@[@"Butter", @"And"]];
    XCTAssertEqualObjects((__), array);
    
    [array insertObject:@"Jelly" atIndex:3];
    XCTAssertEqualObjects((__), array);
    
    array[3] = @"Crackers";
    XCTAssertEqualObjects((__), array);
}

- (void)testRemovingFromMutableArrays
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"Peanut", @"Butter", @"And", @"Jelly", nil];
    
    [array removeObject:@"Peanut"];
    XCTAssertEqualObjects((__), array);
    
    [array removeObjectAtIndex:1];
    XCTAssertEqualObjects((__), array);
    
    [array removeLastObject];
    XCTAssertEqualObjects((__), array);
    
    [array removeAllObjects];
    XCTAssertEqualObjects((__), array);
}

- (void)testReplacingInMutableArrays
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"Peanut", @"Butter", @"And", @"Jelly", nil];
    
    [array replaceObjectAtIndex:3 withObject:@"Crackers"];
    XCTAssertEqualObjects((__), array);
    
    [array exchangeObjectAtIndex:1 withObjectAtIndex:3];
    XCTAssertEqualObjects((__), array);
}

@end
