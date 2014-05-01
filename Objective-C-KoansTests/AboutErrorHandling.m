//
//  AboutErrorHandling.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/30/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AboutErrorHandling : XCTestCase

@end

@implementation AboutErrorHandling

- (void)testExceptionsAreUsedForFatalErrors
{
    @try
    {
        [NSException raise:@"An Exception" format:nil];
    }
    @catch (NSException *exception)
    {
        XCTAssertEqualObjects(@"An Exception", exception.name);
    }
}

- (void)testThrowCanAlsoRaiseAnException
{
    @try
    {
        @throw [[NSException alloc] initWithName:@"Exception!" reason:@"Bogus Reason" userInfo:nil];
    }
    @catch (NSException *exception)
    {
        XCTAssertEqualObjects(@"Exception!", exception.name);
    }
}

- (void)testReturningNSErrorIsPreferredForRecoverableErrors
{
    NSError *error = nil;
    
    [self returnsErrorMethod:&error];
    
    XCTAssertEqualObjects(@"TestErrorDomain", [error domain]);
}

- (void)testMostMethodsThatOutputNSErrorsReturnABoolToIndicateSuccess
{
    NSError *error = nil;
    BOOL success = [self returnsErrorMethod:&error];
    
    XCTAssertEqual(NO, success);
}

- (void)testNSErrorDomainCannotBeNil
{
    XCTAssertThrowsSpecificNamed([NSError errorWithDomain:nil code:1 userInfo:nil], NSException, @"NSInvalidArgumentException");
}

- (void)testNSErrorsHaveAUserInfoDictionaryForAdditionalInformation
{
    NSError *error = nil;
    [self returnsErrorMethod:&error];
    
    XCTAssertEqualObjects(@"Localized Error Description", [error localizedDescription]);
}

- (void)testNSErrorCanAlsoPassBackAnUnderlyingErrorInsideUserInfo
{
    NSError *error = nil;
    [self returnsErrorMethod:&error];
    
    NSDictionary *userInfo = [error userInfo];
    NSError *underlyingError = userInfo[NSUnderlyingErrorKey];
    
    XCTAssertEqualObjects(@"UnderlyingErrorDomain", [underlyingError domain]);
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
