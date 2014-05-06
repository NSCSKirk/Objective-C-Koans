//
//  AboutClasses.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 4/28/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@interface Dog : NSObject
{
    NSString *_instanceString;
}
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) UIColor *furColor;
@property (nonatomic, weak) id delegate;
@property (nonatomic, assign) int tagNumber;
@property (nonatomic, strong) UIColor *eyeColor;
@property (nonatomic, strong, readonly) NSNumber *age;
@end

@implementation Dog

- (id)init
{
    self = [super init];
    
    if (self)
    {
        _name = @"Fido";
    }
    
    return self;
}

- (instancetype)myself
{
    return self;
}

- (void)setInstanceString:(NSString *)string
{
    _instanceString = nil;
    _instanceString = string;
}

- (NSString *)instanceString
{
    return _instanceString;
}

- (UIColor *)eyeColor
{
    return [UIColor blueColor];
}

- (void)setEyeColor:(UIColor *)eyeColor
{
    [NSException raise:@"SetError" format:nil];
}

@end


/*==================================================================================*/


@interface AboutClasses : XCTestCase

@end

@implementation AboutClasses

- (void)testClassesCanBeCreatedWithAllocInit
{
    Dog *dog = [[Dog alloc] init];
    
    XCTAssertEqualObjects(__, NSStringFromClass([dog class]));
}

- (void)testInitIsWhereVariablesShouldBeInitialized
{
    Dog *dog = [[Dog alloc] init];
    
    XCTAssertEqualObjects(__, dog.name);
}

- (void)testPropertiesGenerateGettersAndSetters
{
    Dog *dog = [[Dog alloc] init];
    
    //Behind the scenes, the Objective-C runtime takes the property definitions
    //and translates them based off their modifiers into getters and setters.
    //An instance variable will be created named after the property and
    //prefixed with an underscore.
    //
    //For example:
    //This definition: @property (nonatomic, assign) int countryCode;
    //Generates this instance variable: _countryCode
    //
    [dog setFurColor:[UIColor blackColor]];
    XCTAssertEqualObjects(__, [UIColor blackColor]);
    
    UIColor *color = [dog furColor];
    XCTAssertEqualObjects(__, [UIColor blackColor]);
}

- (void)testDotSyntaxCanBeUsedForProperties
{
    Dog *dog = [[Dog alloc] init];
    
    //Dot syntax should only be used for properties. It is possible to use
    //the same syntax when used on a method with no arguments, but this
    //should be avoided as it obscures the method as a property.
    dog.furColor = [UIColor whiteColor];
    XCTAssertEqualObjects(__, [UIColor whiteColor]);
    
    UIColor *color = dog.furColor;
    XCTAssertEqualObjects(__, [UIColor whiteColor]);
}

- (void)testClassesCanHaveStrongProperties
{
    Dog *dog = [[Dog alloc] init];
    
    //Look at the property definition above '(nonatomic, strong)'. This indicates
    //a setter/getter that will not generate locking code and will be a 'strong'
    //relationship. In terms of reference counting, the object passed into the
    //property will be retained.
    dog.furColor = [UIColor blackColor];
    
    XCTAssertEqualObjects(__, [UIColor blackColor]);
}

- (void)testClassesCanHaveWeakProperties
{
    Dog *dog = [[Dog alloc] init];
    
    //Weak properties do not retain when set. As such, you must be sure to use
    //objects that are retained elsewhere. Weak properties are commonly used
    //for delegate so as not to create a strong reference cycle, a situation
    //where neither object will be deallocated since they have strong references
    //to one another.
    dog.delegate = self;
    
    XCTAssertEqualObjects(__, self);
}

- (void)testClassesCanHaveAssignProperties
{
    Dog *dog = [[Dog alloc] init];
    
    //Assign is the default for properties. It is used with C types such as
    //int, float, and double.
    dog.tagNumber = 6;
    
    XCTAssertEqual(_____, 6);
}

- (void)testReadOnlyWillOnlyCreateAGetter
{
    Dog *dog = [[Dog alloc] init];
    
    //This allows us to set the value even though there is no exposed
    //setter method.
    [dog setValue:@4 forKeyPath:@"age"];
    
    XCTAssertEqualObjects(__, dog.age);
}

- (void)testGeneratedPropertyGettersAndSettersCanBeOveridden
{
    Dog *dog = [[Dog alloc] init];
    
    XCTAssertEqualObjects(__, dog.eyeColor);
    XCTAssertThrowsSpecificNamed([dog setEyeColor:[UIColor brownColor]], NSException, __);
}

- (void)testInstanceVariablesCanBeSetAndRetrievedWithCustomMethods
{
    Dog *dog = [[Dog alloc] init];
    
    [dog setInstanceString:@"Blue Buffalo"];
    
    XCTAssertEqualObjects(__, [dog instanceString]);
}

- (void)testSelfRefersToCurrentObject
{
    Dog *dog = [[Dog alloc] init];
    
    XCTAssertEqualObjects(__, [dog myself]);
}

@end
