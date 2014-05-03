//
//  AboutBlocks.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 5/1/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@interface AboutBlocks : XCTestCase
@property (nonatomic, copy) NSString *result;
@end

@implementation AboutBlocks

- (void)tearDown
{
    self.result = nil;
}

- (void)testBlocksAreStoredPiecesOfCode
{
    void (^block)(BOOL) = ^(BOOL value){
        XCTAssertEqual(____, value);
    };
    
    block(YES);
}

- (void)testBlocksCaptureTheirLexicalScope
{
    NSString *string = @"A String";
    
    void (^block)(void) = ^{
        XCTAssertEqualObjects(__, string);
    };
    
    block();
}

- (void)testSettingAVariableFromOutsideTheBlockRequiresTheBlockPrefix
{
    __block int number = 0;
    
    void (^block)(void) = ^{
        number = 5;
        XCTAssertEqual(_____, number);
    };
    
    block();
}

- (void)testBlocksCanReturnValues
{
    BOOL (^block)(void) = ^{
        return YES;
    };
    
    BOOL result = block();
    
    XCTAssertEqual(____, result);
}

- (void)testBlockCanBePassedAsParameters
{
    [self methodAcceptingBlock:^(NSString *string) {
        XCTAssertEqualObjects(__, string);
    }];
}

- (void)methodAcceptingBlock:(void(^)(NSString *string))block
{
    //Checking for the block's existance is very important. If
    //this check is omitted, and nil or null is passed for the block,
    //the application will crash due to EXEC_BAD_ACCESS.
    if (block)
    {
        block(@"Block String");
    }
}

- (void)testIfSelfIsUsedInsideABlockSelfWillBeRetainedWithIt
{
    [self methodAcceptingBlock:^(NSString *string) {
        //Blocks capture their lexical scope so they can be stored
        //for later execution. Sincle variables could be deallocated
        //between the time the block is stored and executed, the block
        //retains any variables accessed outside of itself. The same
        //applies to 'self'. If the block is not released and it
        //retains a reference to a class, a strong reference cycle
        //is created, preventing class deallocation.
        self.result = @"String Result";
    }];
    
    XCTAssertEqualObjects(__, self.result);
}

- (void)testAvoidStringReferenceCyclesWithBlocksAndSelfByUSingWeakReferences
{
    __weak AboutBlocks *weakSelf = self;
    [self methodAcceptingBlock:^(NSString *string) {
        weakSelf.result = @"Weak String Result";
    }];
    
    XCTAssertEqualObjects(__, self.result);
}

@end
