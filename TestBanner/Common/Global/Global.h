//
//  Global.h
//  可以保存全局对像，如userInfo等等
//
//  Created by GHM on 13-7-29.
//  Copyright (c) 2013年 GHM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface Global : NSObject

@property NSInteger deviceType;
@property NSInteger userType;

+ (Global *)instanse;

+(AppDelegate*)AppDelegate;
//+ (NSDate*) lastMonth:(NSDate*) now;
//+ (NSInteger) numberOfDaysInMonth:(NSDate*) date;
//+ (BOOL) CheckIdentityCardNo:(NSString*)cardNo;

@end
