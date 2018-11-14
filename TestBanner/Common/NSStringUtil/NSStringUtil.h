//
//  NSStringUtil.h
//  TestAFNetworking2_0
//
//  Created by ghm on 16/6/24.
//  Copyright © 2016年 ghm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSStringUtil)

/**
 *  判断字符串是否为空
 *
 *  @param
 *
 *  @return
 */
- (BOOL) isBlankString;

/**
 *  判断邮件格式是否正确
 *
 *  @param
 *
 *  @return
 */
-(BOOL)isValidateEmail;


/**
 *  判断电话号码格式是否正确
 *
 *  @param
 *
 *  @return
 */
-(BOOL) isValidateMobile;

/**
 *  判断密码格式是否正确
 *
 *  @param password
 *
 *  @return
 */
-(BOOL)isValidatePassword;

/**
 *  判断身份证是否合法
 *
 *  @param cardNo
 *
 *  @return
 */
-(BOOL)CheckIdentityCardNo;



/*
 判断字符串是否相等
 */
+(BOOL)str1IsEqualToStr2:(NSString *)str1 string2:(NSString *)str2;
+(BOOL)containString:(NSString *)allString childString:(NSString *) childString;



//+(NSString *)getXingzuo:(NSString *)dateString;
+(NSString *)convertToString:(NSArray *)array;
+(NSMutableArray *)convertToArray:(NSString *)arrayString;
@end
