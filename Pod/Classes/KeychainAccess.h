//
//  DeviceUID.h
//  AppBounty
//
//  Created by Alejandro Fornes on 2/9/15.
//  Copyright (c) 2015 Avertile Mobile UG (haftungsbeschränkt). All rights reserved.
//

#import <Foundation/Foundation.h>

#define kABUserAuthToken @"ABUserAuthToken"
#define kABPushPopShown  @"ABPushPopShown"
#define kABUserDataService @"UserData"
#define kABUserDataRestored @"UserFromKeychain"

@interface KeychainAccess : NSObject

#pragma mark - Public methods
+ (NSString *)uid;

#pragma mark - Instance methods
- (id)initWithKey:(NSString *)key;
- (NSString *)uid;
- (void)save;

#pragma mark - Keychain methods
+ (NSMutableDictionary *)keychainItemForKey:(NSString *)key service:(NSString *)service;
+ (OSStatus)setValue:(NSString *)value forKeychainKey:(NSString *)key inService:(NSString *)service;
+ (NSString *)valueForKeychainKey:(NSString *)key service:(NSString *)service;

#pragma mark - NSUserDefaults methods
+ (BOOL)setValue:(NSString *)value forUserDefaultsKey:(NSString *)key;
+ (NSString *)valueForUserDefaultsKey:(NSString *)key;

#pragma mark - UID Generation methods
+ (NSString *)randomUUID;
+ (NSString *)appleIFV;
+ (NSString *)appleIFA;

@end
