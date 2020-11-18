//
//  RegularValidateTool.h
//  M
//
//  Created by M on 2017/6/13.
//  Copyright © 2017年 M. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegularValidateTool : NSObject
#pragma mark 手机号验验证+座机验证
+ (BOOL)validatePhone:(NSString *)phone;
#pragma mark 手机号验证
+ (BOOL)validateMobilePhone:(NSString *)phone;
#pragma mark 座机号验证
+ (BOOL)validateHomeNumber:(NSString *)homeNo;

#pragma mark 用户名验证
+ (BOOL)validateName:(NSString *)name;

#pragma mark - 用户身份证验证
+ (BOOL)validateIdCard:(NSString *)userID;

#pragma mark 公司名验证
+ (BOOL)validateCompanyName:(NSString *)name;

/**
 *  纯数字验证
 */
+ (BOOL)isNumber:(NSString *)number;

#pragma mark 只含有汉字、数字、字母、下划线不能以下划线开头和结尾
+ (BOOL)isUserName:(NSString *)username;

#pragma mark 密码正则
+ (BOOL)isPassWord:(NSString *)password;

#pragma mark 是否为邮箱
+ (BOOL)isEmail:(NSString *)email;

#pragma mark 比较两个时间的先后
+ (BOOL)compareDateWithFirstDate:(NSString *)firstDate secondDate:(NSString *)secondDate;

#pragma mark 判断NSString中是否有表情
+ (BOOL)isContainsEmoji:(NSString *)string;

#pragma mark 验证时间格式
+ (BOOL)isTime:(NSString *)time;

#pragma mark 当前时间加减几个月份
+ (NSString *)getPriousorLaterDateFromDate:(NSDate *)date withMonth:(int)month;

/**
 * 根据 开始时间和天数算出结束时间
 * 开始结束时间 最后需以 08:00:00 或 12:00:00 或 18:00:00 结束
 */
+ (NSString *)calculateEndTimeWithStartTime:(NSString *)startTime days:(float)days;

/**
 * 验证内容是否是数字或小数
 */
+ (BOOL)isNumberOrDecimal:(NSString *)number;

/**
 快速返回字符串 长度
 */
+(float)longFloatWithstring:(NSString *)aString
                  andHeight:(float)aHeigt
                    andSize:(float)aSize;

/**
 快速返回字符串 高度
 */
+(float)hightFloatWithstring:(NSString *)aString
                    andWidth:(float)aWidth
                     andSize:(float)aSize;

/**
 删除emoji表情
 */
+ (NSString *)disable_emoji:(NSString *)text;


/**
 汉字，数字，英文，括号，下划线，横杠，空格(只能输入这些)
 */
+(NSString *)filterCharactors:(NSString *)string;


/**
 根据正则屏蔽特殊字符
 regular:正则
 */
+ (BOOL)isContainsSpecialCharacters:(NSString *)searchText regular:(NSString *)regular;

/**
 根据正在过滤特殊字符
 */
+ (NSString *)filterCharactor:(NSString *)string withRegex:(NSString *)regexStr;

/**
 除去特殊字符并限制字数的textFiled
 */
+ (void)restrictionInputTextFieldMaskSpecialCharacter:(UITextField *)textField maxNumber:(NSInteger)maxNumber;

/**
 textFiled限制字数
 */
+ (void)restrictionInputTextField:(UITextField *)textField maxNumber:(NSInteger)maxNumber;

/**
 除去特殊字符并限制字数的TextView
 */
+ (void)restrictionInputTextViewMaskSpecialCharacter:(UITextView *)textView maxNumber:(NSInteger)maxNumber;

/**
 textView限制字数
 */
+ (void)restrictionInputTextView:(UITextView *)textView maxNumber:(NSInteger)maxNumber;
/**
 判断是否存在特殊字符
 */
+ (BOOL)isContainsSpecialCharacters:(NSString *)string;

/**
 判断是否是英文和数字
 */
+ (BOOL)isContainsNumbersAndLetters:(NSString *)searchText;


/**
 防止截emoji表情被截断
 */
+ (NSString *)subStringWith:(NSString *)string ToIndex:(NSInteger)index;


@end
