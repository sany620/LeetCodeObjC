//
//  NSString+Calculate.h
//  BuildGuard
//
//  Created by apple on 2020/10/16.
//  Copyright © 2020 com.ddg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSString (Calculate)

/**
 * 限定最大行数的场景下，计算label的bounce
 **/
- (CGRect)boundingRectFastWithMaxWidth:(CGFloat)width withFont:(UIFont *)font withMaxLine:(NSInteger)maxLine;

/**
 * 行数不限的场景下，计算label的bounce
 **/
- (CGRect)boundingRectFastWithMaxWidth:(CGFloat)width withFont:(UIFont *)font;

@end



@interface StringCalculateManager : NSObject

+ (StringCalculateManager *)shareManager;

@end


NS_ASSUME_NONNULL_END
