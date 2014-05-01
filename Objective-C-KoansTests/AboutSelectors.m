//
//  AboutSelectors.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/30/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <objc/message.h>

@interface AboutSelectors : XCTestCase

@end

@implementation AboutSelectors

- (void)testASelectorIsAMessageThatCanBeSentToAnObject
{
    NSString *string = @"A String";

    //Below is a way of telling an object to perform
    //the passed selector. This concept is demonstrated, but
    //normally you will want to simply pass the message directly
    //rather than invoking performSelector: on the instance.
    NSString *loweredString = [string performSelector:@selector(lowercaseString)];
    
    XCTAssertEqualObjects(@"a string", loweredString);
    XCTAssertEqualObjects(@"a string", [string lowercaseString]);
}

- (void)testSelectorsCanAlsoBeSentToClasses
{
    NSString *string = [NSString string];
    
    XCTAssertEqualObjects(@"", string);
}

- (void)testASelectorWithArgumentsIncludesColons
{
    NSString *string = @"A String";
    NSLocale *currentLocale = [NSLocale currentLocale];
    NSString *loweredString = [string performSelector:@selector(lowercaseStringWithLocale:) withObject:currentLocale];
    
    XCTAssertEqualObjects(@"a string", loweredString);
    XCTAssertEqualObjects(@"a string", [string lowercaseStringWithLocale:currentLocale]);
}

- (void)testTheRuntimeTranslatesSelectorsIntoMessagesAtRuntime
{
    NSString *string = @"A String";
    
    //There is rarely a good reason to directly call objc_msgSend
    //and it is only used here to illustrate what the runtime
    //does with your code.
    string = objc_msgSend(string, @selector(lowercaseString));
    
    XCTAssertEqualObjects(@"a string", string);
}

- (void)testPassingAnUnrecognizedSelectorRaisesAnException
{
    id string = @"A String";
    
    XCTAssertThrowsSpecificNamed([string objectForKey:@"Crash Time"], NSException, NSInvalidArgumentException);
}

@end
