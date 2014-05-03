//
//  AboutInheritance.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 5/1/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@interface Cat : NSObject
- (NSString *)meow;
@end

@implementation Cat

- (NSString *)meow
{
    return @"Cat Meow";
}

@end


@interface Tabby : Cat
- (NSString *)meow;
- (NSString *)specialMeow;
@end

@implementation Tabby

- (NSString *)meow
{
    return @"Tabby Says Meow!";
}

- (NSString *)specialMeow
{
    return [NSString stringWithFormat:@"%@ - %@", [super meow], @"Tabby"];
}

@end


@interface AboutInheritance : XCTestCase

@end

@implementation AboutInheritance

- (void)testAClassesParentCanBeObtainedThroughSuperclass
{
    UILabel *label = [[UILabel alloc] init];
    
    XCTAssertEqualObjects(__, NSStringFromClass(label.superclass));
}

- (void)testSubclassesCanOverrideSuperClassMethods
{
    Cat *cat = [[Cat alloc] init];
    Tabby *tabby = [[Tabby alloc] init];
    
    XCTAssertEqualObjects(__, [cat meow]);
    XCTAssertEqualObjects(__, [tabby meow]);
}

- (void)testSubclassesCanInvokeParentThroughSuper
{
    Tabby *tabby = [[Tabby alloc] init];
    
    XCTAssertEqualObjects(__, [tabby specialMeow]);
}

- (void)testSubclassesCanAddNewBehavior
{
    //Using type id to illustrate below without upsetting the compiler
    id immutableString = @"Immutable String";
    NSMutableString *mutableString = [immutableString mutableCopy];
    
    [mutableString appendString:@", Now Mutable!"];
    
    XCTAssertEqualObjects(__, mutableString);
    XCTAssertThrowsSpecificNamed([immutableString appendString:@", Now Mutable!"], NSException, __);
}

- (void)testMostObjectsHaveNSObjectAsTheirRoot
{
    XCTAssertEqual(____, [NSString isSubclassOfClass:[NSObject class]]);
    XCTAssertEqual(____, [NSMutableString isSubclassOfClass:[NSObject class]]);
    XCTAssertEqual(____, [NSArray isSubclassOfClass:[NSObject class]]);
    XCTAssertEqual(____, [NSDictionary isSubclassOfClass:[NSObject class]]);
    XCTAssertEqual(____, [NSError isSubclassOfClass:[NSObject class]]);
}

- (void)testNSObjectImplementsManyCommonlyUsedMethods
{
    //We say NSObject implements these methods because there is actually
    //an NSObject protocol as well. This protocol is used when defining
    //other protocols, as they will inherit from the NSObject protocol
    //in addition to defining other methods. This ensures that any object
    //that conforms to a protocol you create will still have access to the
    //methods implemented by NSObject subclasses.
    NSObject *object = [[NSObject alloc] init];
    
    XCTAssertEqual(____, [object respondsToSelector:@selector(respondsToSelector:)]);
    XCTAssertEqual(____, [object respondsToSelector:@selector(isKindOfClass:)]);
    XCTAssertEqual(____, [object respondsToSelector:@selector(isMemberOfClass:)]);
    XCTAssertEqual(____, [object respondsToSelector:@selector(conformsToProtocol:)]);
    XCTAssertEqual(____, [object respondsToSelector:@selector(description)]);
    XCTAssertEqual(____, [object respondsToSelector:@selector(class)]);
    XCTAssertEqual(____, [object respondsToSelector:@selector(superclass)]);
}

-(void)testTheseMethodsAreCarriedThroughNSObjectSubclasses
{
    NSString *string = [[NSString alloc] init];
    
    XCTAssertEqual(____, [string respondsToSelector:@selector(respondsToSelector:)]);
    XCTAssertEqual(____, [string respondsToSelector:@selector(conformsToProtocol:)]);
    XCTAssertEqual(____, [string respondsToSelector:@selector(class)]);
    XCTAssertEqual(____, [string respondsToSelector:@selector(superclass)]);
}

- (void)testAnyObjectWithNSObjectAsItsRootConfrormsToTheNSObjectProtocol
{
    NSString *string = @"Literal String";
    
    XCTAssertEqual(____, [string conformsToProtocol:@protocol(NSObject)]);
}

@end
