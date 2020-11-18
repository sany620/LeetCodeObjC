//
//  UILabel+Chained.h
//  Chained
//
//  Created by 飞渡 on 2019/7/1.
//  Copyright © 2019 freedo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Chained)

+ (__kindof UILabel *)initLabel;

+ (__kindof UILabel *(^)(CGRect rect))initRectLabel;

- (__kindof UILabel *(^)(NSString *text))fdText;

- (__kindof UILabel *(^)(UIColor *textColor))fdTextColor;

- (__kindof UILabel *(^)(UIColor *backColor))fdBackColor;

- (__kindof UILabel *(^)(CGRect rect))fdRect;

- (__kindof UILabel *(^)(NSTextAlignment textAlignment))fdTextAlignment;

- (__kindof UILabel *(^)(CGFloat fontSize))fdFont;

- (__kindof UILabel *(^)(CGFloat fontSize))fdBoldFont;

- (__kindof UILabel *(^)(BOOL enabled))fdEnabled;

- (__kindof UILabel *(^)(BOOL userInteractionEnabled))fdUserInteractionEnabled;

- (__kindof UILabel *(^)(NSInteger numberOfLines))fdNumberOfLines;

- (__kindof UILabel *(^)(NSAttributedString *attributedText))fdAttributedText;

- (__kindof UILabel *(^)(CGFloat radius))fdRadius;

- (__kindof UILabel *(^)(CGFloat width, UIColor *color,CGFloat radius))fdRadiusOrBorder;

@end

NS_ASSUME_NONNULL_END
