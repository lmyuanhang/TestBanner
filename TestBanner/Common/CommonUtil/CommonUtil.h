//
//  CommonUtil.h
//  TestAFNetworking2_0
//
//  Created by ghm on 16/6/24.
//  Copyright © 2016年 ghm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonUtil : NSObject

/**
 *  打开一个网址或app
 *
 *  @param inUrl 
 */
+ (void) OpenUrl:(NSString *)inUrl;

//===============================================时间操作begin=================================================
/**
 *  获取上个月当天
 *
 *  @param date
 *
 *  @return
 */
+ (NSDate*) lastMonth:(NSDate*) date;

/**
 *  获取一个月的天数
 *
 *  @param date
 *
 *  @return
 */
+ (NSInteger) numberOfDaysInMonth:(NSDate*) date;

/**
 *  获取一周的第一天
 *
 *  @param date
 *
 *  @return 
 */
+ (NSDate*) firstDayOfWeek:(NSDate*) date;

/**
 *  获取年份
 *
 *  @param date
 *
 *  @return 
 */
+ (NSInteger) getYear:(NSDate*) date;

/**
 *  获取月份
 *
 *  @param date
 *
 *  @return 
 */
+ (NSInteger) getMonth:(NSDate*) date;


/**
 *  获取号
 *
 *  @param date
 *
 *  @return
 */
+ (NSInteger) getDay:(NSDate*) date;

//===============================================时间操作end  =================================================

/**
 *  根据两点的经纬度计算出两地直线距离
 *
 *  @param double
 *
 *  @return
 */
+(double)distanceBetweenOrderBy:(double)lat1 lat2:(double)lat2 lng1:(double)lng1 lng2:(double)lng2;

@end
