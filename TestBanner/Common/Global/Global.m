//
//  Global.m
//  Pet
//
//  Created by GHM on 13-7-29.
//  Copyright (c) 2013年 GHM. All rights reserved.
//

#import "Global.h"

@implementation Global


+ (Global *)instanse
{
    static Global *_sharedClient = nil;
    static dispatch_once_t onceTokens;
    dispatch_once(&onceTokens, ^{
        _sharedClient = [[Global alloc] init];
    });
    
    return _sharedClient;
}

//打开一个网址
+ (void) OpenUrl:(NSString *)inUrl
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:inUrl]];
}

+(AppDelegate*)AppDelegate
{
    AppDelegate *app=[[UIApplication sharedApplication] delegate];
    return app;
}

@end
