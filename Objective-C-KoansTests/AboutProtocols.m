//
//  AboutProtocols.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 5/2/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@protocol TestDelegate <NSObject>
- (void)protocolMethod;
- (NSString *)protocolMethodWithArgument:(NSString *)string;
@end


@interface ClassImplementingProtocol : NSObject <TestDelegate>
@property (nonatomic, assign) BOOL methodCalled;
@end

@implementation ClassImplementingProtocol

- (id)init
{
    self = [super init];
    
    if (self)
    {
        _methodCalled = NO;
    }
    
    return self;
}

- (void)protocolMethod
{
    self.methodCalled = YES;
}

- (NSString *)protocolMethodWithArgument:(NSString *)string
{
    return string;
}

@end


@interface ClassWithDelegate : NSObject
@property (nonatomic, weak) id<TestDelegate> delegate;
- (void)callProtocolMethod;
- (void)callProtocolMethodWithArgument;
+ (id<TestDelegate>)classConformingToDelegate;
@end

@implementation ClassWithDelegate

- (void)callProtocolMethod
{
    [self.delegate protocolMethod];
}

- (void)callProtocolMethodWithArgument
{
    [self.delegate protocolMethodWithArgument:@"Protocol Method Argument"];
}

+ (id<TestDelegate>)classConformingToDelegate
{
    return [[ClassImplementingProtocol alloc] init];
}

@end

/*========================================================================*/

@interface AboutProtocols : XCTestCase

@end

@implementation AboutProtocols

- (void)testProtocolsDefineASetOfMethodsButNotTheImplementation
{
    XCTAssertEqual(____, [ClassImplementingProtocol conformsToProtocol:@protocol(TestDelegate)]);
}

- (void)testClassesCanHaveDelegatesThatConformToAProtocol
{
    ClassWithDelegate *classWithDelegate = [[ClassWithDelegate alloc] init];
    ClassImplementingProtocol *classImplementingProtocol = [[ClassImplementingProtocol alloc] init];
    
    //Delegation is a very common pattern in Objective-C. Sometimes a class will define a
    //protocol that will have methods the class will call when it needs additional information
    //or it wants to inform the delegate that something has happened, passing any relevant
    //information.
    classWithDelegate.delegate = classImplementingProtocol;
    
    XCTAssertEqualObjects(__, classWithDelegate.delegate);
}

- (void)testDelegatesAreUsedWithProtocolsToInform
{
    ClassWithDelegate *classWithDelegate = [[ClassWithDelegate alloc] init];
    ClassImplementingProtocol *classImplementingProtocol = [[ClassImplementingProtocol alloc] init];
    
    classWithDelegate.delegate = classImplementingProtocol;
    [classWithDelegate callProtocolMethod];
    
    XCTAssertEqual(____, classImplementingProtocol.methodCalled);
}

- (void)testDelegatesAreAlsoUsedToAskForInformation
{
    ClassWithDelegate *classWithDelegate = [[ClassWithDelegate alloc] init];
    ClassImplementingProtocol *classImplementingProtocol = [[ClassImplementingProtocol alloc] init];
    
    classWithDelegate.delegate = classImplementingProtocol;
    NSString *string = [classWithDelegate.delegate protocolMethodWithArgument:@"Protocol Argument"];
    
    XCTAssertEqualObjects(__, string);
}

- (void)testProtocolsShowIntentWithoutExposingTheClass
{
    id<TestDelegate> protocolClass = [ClassWithDelegate classConformingToDelegate];
    
    //Because we can also return types such as 'id<TestDelegate>' from methods, it allows
    //us to hide implementations that we dont wish callers to see. For instance, if we
    //had a custom class in our library that we didnt want to full expose, we could
    //extract part of the class into a protocol then return type 'id<{Protocol}>' to
    //only expose the methods defined in the protocol, rather than the whole class.
    XCTAssertEqual(____, [protocolClass respondsToSelector:@selector(protocolMethod)]);
    XCTAssertEqual(____, [protocolClass respondsToSelector:@selector(protocolMethodWithArgument:)]);
}

@end
