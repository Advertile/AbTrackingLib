//
//  ABTracker.h
//  Pods
//
//  Created by Laura Orán on 18/05/15.
//
//

#import <Foundation/Foundation.h>

@interface ABTracker : NSObject

+(void) trackOpenEventVersion:(NSString *) appVersion andBundle:(NSString *) bundleId;

@end
