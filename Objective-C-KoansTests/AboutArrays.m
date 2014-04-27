//
//  AboutArrays.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/27/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AboutArrays : XCTestCase

@end

@implementation AboutArrays

- (void)testCreatingArrays
{
    NSArray *array = [NSArray array];
    
    XCTAssertTrue([array isKindOfClass:[NSArray class]]);
    XCTAssertEqual(0, [array count]);
}

- (void)testArrayEquality
{
    NSArray *array = @[@"Dog", @"Cat"];
    NSArray *expected = @[@"Dog", @"Cat"];
    
    XCTAssertTrue([array isEqualToArray:expected]);
    
    expected = @[@"Dog", @"Cat"];
    XCTAssertEqualObjects(expected, array);
}

- (void)testArrayLiterals
{
    NSArray *array = [NSArray array];
    NSArray *literal = @[];
    XCTAssertEqualObjects(literal, array);
    
    array = [NSArray arrayWithObject:@"1"];
    literal = @[@"1"];
    XCTAssertEqualObjects(literal, array);
    
    array = [NSArray arrayWithObjects:@"1", @"2", nil];
    literal = @[@"1", @"2"];
    XCTAssertEqualObjects(literal, array);
}

- (void)testAccessingArrayElements
{
    NSArray *array = @[@"Peanut", @"Butter", @"And", @"Jelly"];
    
    XCTAssertEqualObjects(@"Peanut", array[0]);
    XCTAssertEqualObjects(@"Peanut", [array firstObject]);
    XCTAssertEqualObjects(@"Jelly", array[3]);
    XCTAssertEqualObjects(@"Jelly", [array lastObject]);
}

- (void)testGettingIndexOfArrayObjects
{
    NSArray *array = @[@"Peanut", @"Butter", @"And", @"Jelly"];
    
    XCTAssertEqual(0, [array indexOfObject:@"Peanut"]);
    XCTAssertEqual(NSNotFound, [array indexOfObject:@"Crackers"]);
    XCTAssertEqual(1, [array indexOfObject:@"Butter" inRange:NSMakeRange(0, 2)]);
    XCTAssertEqual(NSNotFound, [array indexOfObject:@"Butter" inRange:NSMakeRange(0, 1)]);
    
    UILabel *label = [[UILabel alloc] init];
    array = @[label];
    
    XCTAssertEqual(0, [array indexOfObjectIdenticalTo:label]);
}

- (void)testSlicingArraysWithRanges
{
    NSArray *array = @[@"Peanut", @"Butter", @"And", @"Jelly"];
    
    NSArray *actual = [array subarrayWithRange:NSMakeRange(0, 1)];
    NSArray *expected = @[@"Peanut"];
    XCTAssertEqualObjects(expected, actual);
    
    actual = [array subarrayWithRange:NSMakeRange(0, 2)];
    expected = @[@"Peanut", @"Butter"];
    XCTAssertEqualObjects(expected, actual);
    
    actual = [array subarrayWithRange:NSMakeRange(2, 2)];
    expected = @[@"And", @"Jelly"];
    XCTAssertEqualObjects(actual, expected);
    
    actual = [array subarrayWithRange:NSMakeRange(3, 0)];
    expected = @[];
    XCTAssertEqualObjects(actual, expected);
}

- (void)testCreatingNewArraysFromExistingArrays
{
    NSArray *array = @[@"Peanut"];
    NSArray *actual;
    
    array = [array arrayByAddingObject:@"Butter"];
    actual = @[@"Peanut", @"Butter"];
    XCTAssertEqualObjects(actual, array);
    
    array = [array arrayByAddingObjectsFromArray:@[@"And", @"Jelly"]];
    actual = @[@"Peanut", @"Butter", @"And", @"Jelly"];
    XCTAssertEqualObjects(actual, array);
}

- (void)testJoiningComponentsInArray
{
    NSArray *array = @[@"Peanut", @"Butter", @"And", @"Jelly"];
    NSString *actual = [array componentsJoinedByString:@" "];
    
    XCTAssertEqualObjects(@"Peanut Butter And Jelly", actual);
    
    actual = [array componentsJoinedByString:nil];
    XCTAssertEqualObjects(@"PeanutButterAndJelly", actual);
    
    array = @[];
    actual = [array componentsJoinedByString:@" "];
    XCTAssertEqualObjects(@"", actual);
}

- (void)testMutableArraysAreSubclassesofNSArray
{
    NSMutableArray *array = [NSMutableArray array];
    
    XCTAssertTrue([array isKindOfClass:[NSArray class]]);
}

- (void)testAddingToMutableArrays
{
    NSMutableArray *array = [NSMutableArray array];

    [array addObject:@"Peanut"];
    NSArray *expected = @[@"Peanut"];
    XCTAssertEqualObjects(expected, array);
    
    [array addObjectsFromArray:@[@"Butter", @"And"]];
    expected = @[@"Peanut", @"Butter", @"And"];
    XCTAssertEqualObjects(expected, array);
    
    [array insertObject:@"Jelly" atIndex:3];
    expected = @[@"Peanut", @"Butter", @"And", @"Jelly"];
    XCTAssertEqualObjects(expected, array);
    
    array[3] = @"Crackers";
    expected = @[@"Peanut", @"Butter", @"And", @"Crackers"];
    XCTAssertEqualObjects(expected, array);
}

- (void)testRemovingFromMutableArrays
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"Peanut", @"Butter", @"And", @"Jelly", nil];
    
    [array removeObject:@"Peanut"];
    NSArray *expected = @[@"Butter", @"And", @"Jelly"];
    XCTAssertEqualObjects(expected, array);
    
    [array removeObjectAtIndex:1];
    expected = @[@"Butter", @"Jelly"];
    XCTAssertEqualObjects(expected, array);
    
    [array removeLastObject];
    expected = @[@"Butter"];
    XCTAssertEqualObjects(expected, array);
    
    [array removeAllObjects];
    expected = @[];
    XCTAssertEqualObjects(expected, array);
}

- (void)testReplacingInMutableArrays
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"Peanut", @"Butter", @"And", @"Jelly", nil];
    
    [array replaceObjectAtIndex:3 withObject:@"Crackers"];
    NSArray *expected = @[@"Peanut", @"Butter", @"And", @"Crackers"];
    XCTAssertEqualObjects(expected, array);
    
    [array exchangeObjectAtIndex:1 withObjectAtIndex:3];
    expected = @[@"Peanut", @"Crackers", @"And", @"Butter"];
    XCTAssertEqualObjects(expected, array);
}

@end
