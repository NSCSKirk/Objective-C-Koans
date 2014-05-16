//
//  AboutPredicates.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 5/4/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@interface Person : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, assign) int age;
@end

@implementation Person
- (instancetype)initWithFirstName:(NSString *)firstName age:(int)age
{
    self = [super init];
    if (self)
    {
        _firstName = firstName;
        _age = age;
    }
    return self;
}
@end

@interface AboutPredicates : XCTestCase
@property (nonatomic, copy) NSArray *people;
@end

@implementation AboutPredicates

- (void)setUp
{
    Person *personOne = [[Person alloc] initWithFirstName:@"Sam" age:21];
    Person *personTwo = [[Person alloc] initWithFirstName:@"Steve" age:25];
    Person *personThree = [[Person alloc] initWithFirstName:@"Eric" age:30];
    self.people = @[personOne, personTwo, personThree];
}

- (void)testPredicatesDefineLogicalConditions
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age == 25"];
    
    XCTAssertEqualObjects(__, predicate.predicateFormat);
}

- (void)testPredicatesCanFilterArrays
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age == 30"];
    NSArray *filteredArray = [self.people filteredArrayUsingPredicate:predicate];
    
    XCTAssertEqualObjects(__, filteredArray);
}

- (void)testPredicatesCanAlsoUseStrings
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstName == 'Sam'"];
    NSArray *filteredArray = [self.people filteredArrayUsingPredicate:predicate];
    
    XCTAssertEqualObjects(__, [filteredArray[0] valueForKeyPath:@"firstName"]);
}

- (void)testPredicatesCanUseCompounds
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstName != 'Sam' AND firstName != 'Eric'"];
    NSArray *filteredArray = [self.people filteredArrayUsingPredicate:predicate];
    
    XCTAssertEqualObjects(__, [filteredArray[0] valueForKeyPath:@"firstName"]);
}

- (void)testPredicatesCanUseOtherBasicComparisons
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age > 25"];
    NSArray *filteredArray = [self.people filteredArrayUsingPredicate:predicate];
    XCTAssertEqualObjects(__, [filteredArray[0] valueForKeyPath:@"age"]);
    
    predicate = [NSPredicate predicateWithFormat:@"age < 25"];
    filteredArray = [self.people filteredArrayUsingPredicate:predicate];
    XCTAssertEqualObjects(__, [filteredArray[0] valueForKeyPath:@"age"]);
    
    predicate = [NSPredicate predicateWithFormat:@"age >= 30"];
    filteredArray = [self.people filteredArrayUsingPredicate:predicate];
    XCTAssertEqualObjects(__, [filteredArray[0] valueForKeyPath:@"age"]);
    
    predicate = [NSPredicate predicateWithFormat:@"age BETWEEN {22, 29}"];
    filteredArray = [self.people filteredArrayUsingPredicate:predicate];
    XCTAssertEqualObjects(__, [filteredArray[0] valueForKeyPath:@"age"]);
}

- (void)testPredicatesHaveOperatorsForStringComparisons
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstName BEGINSWITH 'E'"];
    NSArray *filteredArray = [self.people filteredArrayUsingPredicate:predicate];
    XCTAssertEqualObjects(__, [filteredArray[0] valueForKeyPath:@"firstName"]);
    
    predicate = [NSPredicate predicateWithFormat:@"firstName ENDSWITH 'm'"];
    filteredArray = [self.people filteredArrayUsingPredicate:predicate];
    XCTAssertEqualObjects(__, [filteredArray[0] valueForKeyPath:@"firstName"]);
    
    predicate = [NSPredicate predicateWithFormat:@"firstName CONTAINS 'v'"];
    filteredArray = [self.people filteredArrayUsingPredicate:predicate];
    XCTAssertEqualObjects(__, [filteredArray[0] valueForKeyPath:@"firstName"]);
    
    predicate = [NSPredicate predicateWithFormat:@"firstName LIKE '*ic'"];
    filteredArray = [self.people filteredArrayUsingPredicate:predicate];
    XCTAssertEqualObjects(__, [filteredArray[0] valueForKeyPath:@"firstName"]);
}

- (void)testPredicatedCanUseAggregates
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstName IN {'Steve'}"];
    NSArray *filteredArray = [self.people filteredArrayUsingPredicate:predicate];
    XCTAssertEqualObjects(__, [filteredArray[0] valueForKeyPath:@"firstName"]);
}

@end
