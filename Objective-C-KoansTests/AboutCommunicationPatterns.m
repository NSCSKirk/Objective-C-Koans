//
//  AboutCommunicationPatterns.m
//  Objective-C-Koans
//
//  Created by Michael Kirk on 5/4/14.
//  Copyright (c) 2014 Michael Kirk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KoansDefines.h"

@interface AboutCommunicationPatterns : XCTestCase
@property (nonatomic, strong) NSString *kvoString;
@end

@implementation AboutCommunicationPatterns

- (void)testNotificationsAreOneToMany
{
    NSString *notificationName = @"TestNotification";
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    
    //This line adds the block to the default notification center's dispatch table
    //with the given notification name. When a notification of that name is posted,
    //the center will check its dispatch tables, and calls any registered observers.
    //It is very important to remember that notifications are received from the same
    //thread they are posted. They are also posted immediately, one after the other.
    [defaultCenter addObserverForName:notificationName object:nil queue:mainQueue usingBlock:^(NSNotification *note) {
        XCTAssertEqualObjects(__, note.name);
    }];
    
    [defaultCenter addObserverForName:notificationName object:nil queue:mainQueue usingBlock:^(NSNotification *note) {
        XCTAssertEqualObjects(__, note.userInfo);
    }];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil];
}

- (void)testKeyValueObservingAllowsListeningForChangesOnAKeyPath
{
    //This line registers the receiver to be notified of changes
    //on the specified keypath. When the condition given to the options parameter
    //is satified, the method observeValueForKeyPath:ofObject:change:context:
    //is called passing in the appropriate values.
    [self addObserver:self forKeyPath:@"kvoString" options:0 context:NULL];
    
    self.kvoString = @"String Set Through KVO";
    
    [self removeObserver:self forKeyPath:@"kvoString"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    XCTAssertEqualObjects(__, keyPath);
    XCTAssertEqualObjects(__, object);
    XCTAssertEqual(__, change[@"kind"]);
}

@end
