//
//  CommonUtil.m
//  TestAFNetworking2_0
//
//  Created by ghm on 16/6/24.
//  Copyright © 2016年 ghm. All rights reserved.
//

#import "CommonUtil.h"
#import <MapKit/MapKit.h>

@implementation CommonUtil

#pragma mark- OpenUrl
//打开一个网址
+ (void) OpenUrl:(NSString *)inUrl
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:inUrl]];
}

#pragma mark- 时间操作
//===============================================时间操作begin=================================================
//获取上个月当天
+ (NSDate*) lastMonth:(NSDate*) date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:date];
    [components setMonth:([components month] - 1)];
    NSDate *lastMonth = [calendar dateFromComponents:components];

    //begin test=====================================
    NSLog(@"preMonth = %@", lastMonth);
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"YYYY-MM-dd"];
    NSString* str = [formater stringFromDate:lastMonth];
    NSLog(@"preMonth = %@", str);
    //end test=====================================

    return lastMonth;
}

//获取一个月的天数
+ (NSInteger) numberOfDaysInMonth:(NSDate*) date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range =[calendar rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate: date];
    NSUInteger numberOfDaysInMonth = range.length;
    return numberOfDaysInMonth;
}

//获取一周的第一天
+ (NSDate*) firstDayOfWeek:(NSDate*) date
{

    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *today = [[NSDate alloc] init];

    NSDate *beginningOfWeek = nil;

    [gregorian rangeOfUnit:NSWeekCalendarUnit startDate:&beginningOfWeek interval:NULL forDate: today];

    return beginningOfWeek;
}

//获取年份
+ (NSInteger) getYear:(NSDate*) date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:date];
    NSInteger iCurYear = [components year];

    return iCurYear;
}

//获取月份
+ (NSInteger) getMonth:(NSDate*) date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:date];
    NSInteger iCurMonth = [components month];
    return iCurMonth;
}

//获取号
+ (NSInteger) getDay:(NSDate*) date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents *components = [calendar components:unitFlags fromDate:date];
    NSInteger iCurDay = [components day];
    return iCurDay;
}
//===============================================时间操作end  =================================================

#pragma mark- 两地距离
//根据两点的经纬度计算两地直线距离
+(double)distanceBetweenOrderBy:(double)lat1 lat2:(double)lat2 lng1:(double)lng1 lng2:(double)lng2
{
    //    double dd = M_PI/180;
    //    double x1=lat1*dd,x2=lat2*dd;
    //    double y1=lng1*dd,y2=lng2*dd;
    //    double R = 6371004;
    //    double distance = (2*R*asin(sqrt(2-2*cos(x1)*cos(x2)*cos(y1-y2) - 2*sin(x1)*sin(x2))/2));
    //    //返回 m
    //    return distance/1000;
    
    CLLocation* curLocation = [[CLLocation alloc] initWithLatitude:lat1 longitude:lng1];
    CLLocation* otherLocation = [[CLLocation alloc] initWithLatitude:lat2 longitude:lng2];
    double distance  = [curLocation distanceFromLocation:otherLocation];
    
    NSLog(@"%f lat1", lat1);
    NSLog(@"%f lng1", lng1);
    
    NSLog(@"%f lat2", lat2);
    NSLog(@"%f lng2", lng2);
    
    NSLog(@"%f distance", distance);
    
    return distance/1000;
}

@end
