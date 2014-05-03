//
//  AboutInheritance.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 5/1/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>

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
    
    XCTAssertEqualObjects(@"UIView", NSStringFromClass(label.superclass));
}

- (void)testSubclassesCanOverrideSuperClassMethods
{
    Cat *cat = [[Cat alloc] init];
    Tabby *tabby = [[Tabby alloc] init];
    
    XCTAssertEqualObjects(@"Cat Meow", [cat meow]);
    XCTAssertEqualObjects(@"Tabby Says Meow!", [tabby meow]);
}

- (void)testSubclassesCanInvokeParentThroughSuper
{
    Tabby *tabby = [[Tabby alloc] init];
    
    XCTAssertEqualObjects(@"Cat Meow - Tabby", [tabby specialMeow]);
}

- (void)testSubclassesCanAddNewBehavior
{
    //Using type id to illustrate below without upsetting the compiler
    id immutableString = @"Immutable String";
    NSMutableString *mutableString = [immutableString mutableCopy];
    
    [mutableString appendString:@", Now Mutable!"];
    
    XCTAssertEqualObjects(@"Immutable String, Now Mutable!", mutableString);
    XCTAssertThrowsSpecificNamed([immutableString appendString:@", Now Mutable!"], NSException, @"NSInvalidArgumentException");
}

- (void)testMostObjectsHaveNSObjectAsTheirRoot
{
    XCTAssertTrue([NSString isSubclassOfClass:[NSObject class]]);
    XCTAssertTrue([NSMutableString isSubclassOfClass:[NSObject class]]);
    XCTAssertTrue([NSArray isSubclassOfClass:[NSObject class]]);
    XCTAssertTrue([NSDictionary isSubclassOfClass:[NSObject class]]);
    XCTAssertTrue([NSError isSubclassOfClass:[NSObject class]]);
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
    
    XCTAssertTrue([object respondsToSelector:@selector(respondsToSelector:)]);
    XCTAssertTrue([object respondsToSelector:@selector(isKindOfClass:)]);
    XCTAssertTrue([object respondsToSelector:@selector(isMemberOfClass:)]);
    XCTAssertTrue([object respondsToSelector:@selector(conformsToProtocol:)]);
    XCTAssertTrue([object respondsToSelector:@selector(description)]);
    XCTAssertTrue([object respondsToSelector:@selector(class)]);
    XCTAssertTrue([object respondsToSelector:@selector(superclass)]);
}

-(void)testTheseMethodsAreCarriedThroughNSObjectSubclasses
{
    NSString *string = [[NSString alloc] init];
    
    XCTAssertTrue([string respondsToSelector:@selector(respondsToSelector:)]);
    XCTAssertTrue([string respondsToSelector:@selector(conformsToProtocol:)]);
    XCTAssertTrue([string respondsToSelector:@selector(class)]);
    XCTAssertTrue([string respondsToSelector:@selector(superclass)]);
}

- (void)testAnyObjectWithNSObjectAsItsRootConfrormsToTheNSObjectProtocol
{
    NSString *string = @"Literal String";
    
    XCTAssertTrue([string conformsToProtocol:@protocol(NSObject)]);
}

@end
