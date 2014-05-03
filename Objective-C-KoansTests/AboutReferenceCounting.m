//
//  AboutReferenceCounting.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 5/1/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@interface AboutReferenceCounting : XCTestCase

@end

@implementation AboutReferenceCounting

- (void)testAllocInitImpliesOwnership
{
    //Objective-C reference counting is the system by which memory is
    //managed. Alloc/Init implies that the caller now 'owns' the
    //object as its reference count is increased to 1. This means when
    //you are finished with the object, you must send it the 'release'
    //message or you will have a memory leak.
    NSString *string = [[NSString alloc] initWithString:@"Owned String"];
    
    //Reference count is 1 since we used alloc/init
    XCTAssertEqualObjects(__, string);
    
    //Release decrements the reference count to 0 triggering deallocation
    [string release];
}

- (void)testNewIsAShortcutForAllocInit
{
    //The 'new' message is a shortcut for alloc/init. While this does
    //combine these calls together, I would not suggest using it. The
    //alloc/init calls are more explicit and most custom initializers
    //are some derivitive of the 'init' method, meaning new is only
    //useful when calling 'init' with no arguments. So, in my opinion,
    //just stick with alloc/init.
    NSString *string = [NSString new];
    
    XCTAssertEqualObjects(__, string);
}

- (void)testRetainIncreasesReferenceCount
{
    //Reference count is 1 and object is 'owned'
    NSString *string = [[NSString alloc] initWithFormat:@"%@ %@", @"Retained", @"String"];
    
    //Reference count increased to 2. This will ensure that even if you call
    //release on the object in this method, it would not be deallocated.
    //This would be considered a leak in most cases. However, when setting a
    //property marked with 'retain' (or 'strong' in ARC)
    [string retain];
    
    XCTAssertEqualObjects(__, string);
    
    //Release the object to prevent a leak
    [string release];
    [string release];
}

- (void)testClassMethodsReturnObjectsUsingAutorelease
{
    //Calling the class method 'stringWithFormat:' returns an
    //autoreleased string object. This means that the reference count
    //is one and release will be automatically called at some point.
    //If there is a desire to hang on to the object, simply call
    //retain to prevent deallocation.
    NSString *string = [NSString stringWithFormat:@"%@ %@", @"Autoreleased", @"String"];
    
    XCTAssertEqualObjects(__, string);
}

@end
