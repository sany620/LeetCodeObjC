//
//  NSBundle+Extension.h
//  BuildGuard
//
//  Created by apple on 2019/12/5.
//  Copyright © 2019 com.ddg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (Extension)

/**
 加载 mainBundle 文件
 
 @param fileName 文件名
 @return 文件
 */
+ (id)objectWithJson:(NSString *)fileName;

/**
 加载 mainBundle 字典
 
 @param fileName 文件名
 @return 字典
 */
+ (nullable NSDictionary *)dictWithJson:(NSString *)fileName;

/**
 加载 mainBundle 数组
 
 @param fileName 文件名
 @return 数组
 */
+ (nullable NSArray *)arrayWithJson:(NSString *)fileName;

#pragma mark - plist file

/**
 加载 mainBundle 字典
 
 @param fileName 文件名
 @return 字典
 */
+ (NSDictionary *)dictWithPlist:(NSString *)fileName;

/**
 加载 mainBundle 数组
 
 @param fileName 文件名
 @return 数组
 */
+ (NSArray *)arrayWithPlist:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
