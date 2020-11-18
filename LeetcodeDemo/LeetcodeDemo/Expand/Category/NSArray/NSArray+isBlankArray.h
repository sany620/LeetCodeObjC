//
//  NSArray+isBlankArray.h
//  BuildGuard
//
//  Created by freedo on 2019/1/24.
//  Copyright © 2019年 com.ddg. All rights reserved.
//
//数组是否为空
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (isBlankArray)
//判断数组是否为空的方法
+ (BOOL) isBlankArray:(NSArray *)arr;

@end

NS_ASSUME_NONNULL_END
