//
//  AboutErrorHandling.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/30/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@interface AboutErrorHandling : XCTestCase

@end

@implementation AboutErrorHandling

- (void)testExceptionsAreUsedForFatalErrors
{
    XCTAssertThrowsSpecificNamed([NSException raise:@"An Exception" format:nil], NSException, __);
}

- (void)testThrowCanAlsoRaiseAnException
{
    @try
    {
        @throw [[NSException alloc] initWithName:@"Exception!" reason:@"Bogus Reason" userInfo:nil];
    }
    @catch (NSException *exception)
    {
        XCTAssertEqualObjects(__, exception.name);
    }
}

- (void)testReturningNSErrorIsPreferredForRecoverableErrors
{
    NSError *error = nil;
    
    [self returnsErrorMethod:&error];
    
    XCTAssertEqualObjects(__, [error domain]);
}

- (void)testMostMethodsThatOutputNSErrorsReturnABoolToIndicateSuccess
{
    NSError *error = nil;
    BOOL success = [self returnsErrorMethod:&error];
    
    XCTAssertEqual(_____, success);
}

- (void)testNSErrorDomainCannotBeNil
{
    XCTAssertThrowsSpecificNamed([NSError errorWithDomain:nil code:1 userInfo:nil], NSException, __);
}

- (void)testNSErrorsHaveAUserInfoDictionaryForAdditionalInformation
{
    NSError *error = nil;
    [self returnsErrorMethod:&error];
    
    XCTAssertEqualObjects(__, [error localizedDescription]);
}

- (void)testNSErrorCanAlsoPassBackAnUnderlyingErrorInsideUserInfo
{
    NSError *error = nil;
    [self returnsErrorMethod:&error];
    
    NSDictionary *userInfo = [error userInfo];
    NSError *underlyingError = userInfo[NSUnderlyingErrorKey];
    
    XCTAssertEqualObjects(__, [underlyingError domain]);
}

- (BOOL)returnsErrorMethod:(NSError **)error
{
    //Notice the '**' in the method declaration indication a pointer to
    //an Objective-C object.
    NSDictionary *userInfo = @{ NSLocalizedDescriptionKey : @"Localized Error Description",
                                NSUnderlyingErrorKey : [NSError errorWithDomain:@"UnderlyingErrorDomain" code:1 userInfo:nil] };
    *error = [NSError errorWithDomain:@"TestErrorDomain" code:1 userInfo:userInfo];
    return NO;
}

@end
