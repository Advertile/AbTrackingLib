//
//  ABTracker.m
//  Pods
//
//  Created by Laura Orán on 18/05/15.
//
//

#import "ABTracker.h"
#import <AdSupport/AdSupport.h>
#import "NSURLConnection+Blocks.h"
#import <UIKit/UIKit.h>

#define kBaseUrl @"http://www.abtrckr.com/"

@implementation ABTracker

+ (void) trackOpenEvent
{
    NSMutableDictionary *event = [[NSMutableDictionary alloc] init];
    [event setObject:@"open" forKey:@"name"];
    NSString *bundleId = [[NSBundle mainBundle] bundleIdentifier];
    if(bundleId) {
        [event setObject:bundleId forKey:@"bundle"];
    }
    NSString *appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    if(appVersion) {
        [event setObject:appVersion forKey:@"version"];
    }
    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    if(idfa) {
        [event setObject:idfa forKey:@"idfa"];
    }
    NSNumber *idfaEn = @0;
    if([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
        idfaEn = @1;
    }
    [event setObject:idfaEn forKey:@"idfa_enabled"];
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    if(idfv) {
        [event setObject:idfv forKey:@"idfv"];
    }
    NSString *model = [UIDevice currentDevice].model;
    if(model) {
        [event setObject:model forKey:@"device_model"];
    }
    NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
    if(systemVersion) {
        [event setObject:systemVersion forKey:@"os_version"];
    }
    NSString *deviceName = [UIDevice currentDevice].name;
    if(deviceName) {
        [event setObject:deviceName forKey:@"device_name"];
    }
    [event setObject:@"events" forKey:@"type"];
   
    NSDictionary *events = [[NSDictionary alloc] initWithObjectsAndKeys:event, @"data", nil];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:events options:kNilOptions error:nil];
    
    NSString *urlString = [kBaseUrl stringByAppendingString:@"/api/events"];
    
    NSURL* url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *configRequest = [NSMutableURLRequest requestWithURL:url
                                                                 cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                             timeoutInterval:0];
    [configRequest setHTTPMethod:@"POST"];
    [configRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [configRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [configRequest setHTTPBody:jsonData];
    [NSURLConnection connectionWithRequest:configRequest
                              onCompletion:^(NSData *data, NSInteger statusCode)
     {
         if(statusCode == 200) {
             NSLog(@"POST Event Success");
         } else {
             NSLog(@"Error %ld", (long)statusCode);
         }
     }
                                    onFail:^(NSError *error, NSInteger statusCode)
     {
         NSLog(@"POST Event Error");
     }];
}

@end
