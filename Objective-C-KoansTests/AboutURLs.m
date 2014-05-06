//
//  AboutURLs.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 5/4/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@interface AboutURLs : XCTestCase

@end

@implementation AboutURLs

- (void)testNSURLRepresentsAUniformResourceLocator
{
    NSURL *url = [NSURL URLWithString:@"http://github.com"];
    
    XCTAssertEqualObjects(@"http://github.com", [url absoluteString]);
}

- (void)testURLsCanBeCreatedInPiecesInTheInitializer
{
    NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:@"github.com" path:@"/WinterKirk"];
    
    XCTAssertEqualObjects(@"http://github.com/WinterKirk", [url absoluteString]);
}

- (void)testURLComponentsCanBeExtractedFromAnNSURL
{
    NSURL *url = [NSURL URLWithString:@"http://Mike:Password1@github.com:8080/Example/repo.git?method=ssh&branch=master#default"];
    
    XCTAssertEqualObjects(__, [url scheme]);
    XCTAssertEqualObjects(__, [url user]);
    XCTAssertEqualObjects(__, [url password]);
    XCTAssertEqualObjects(__, [url host]);
    XCTAssertEqualObjects(__, [url port]);
    XCTAssertEqualObjects(__, [url path]);
    XCTAssertEqualObjects(__, [url pathExtension]);
    XCTAssertEqualObjects(__, [url query]);
    XCTAssertEqualObjects(__, [url fragment]);
}

- (void)testNSURLReturnsNilWhenPassedAnInvalidURL
{
    NSURL *url = [NSURL URLWithString:@"---->NOT A URL!<----"];
    
    XCTAssertEqualObjects(__, url);
}

@end
