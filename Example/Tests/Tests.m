//
//  AbTrackingLibTests.m
//  AbTrackingLibTests
//
//  Created by Laura Orán on 05/18/2015.
//  Copyright (c) 2014 Laura Orán. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AbTrackingLib/ABTracker.h>

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTrack
{
    NSString *bundleId = [[NSBundle mainBundle] bundleIdentifier];
    NSString *appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    [ABTracker trackOpenEventVersion:appVersion andBundle:bundleId];
}

@end
