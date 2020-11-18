//
//  UIButton+Chained.h
//  Chained
//
//  Created by 飞渡 on 2019/7/1.
//  Copyright © 2019 freedo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Chained)

+ (__kindof UIButton *(^)(UIButtonType buttonType))initButton;

- (__kindof UIButton *(^)(CGRect rect))fdRect;

- (__kindof UIButton *(^)(UIColor *color))fdBackColor;

- (__kindof UIButton *(^)(NSString *title,UIControlState state))fdTitle;

- (__kindof UIButton *(^)(NSString *title))fdTitles;

- (__kindof UIButton *(^)(UIImage *image,UIControlState state))fdImage;

- (__kindof UIButton *(^)(NSString *imageName))fdImageName;

- (__kindof UIButton *(^)(UIColor *color,UIControlState state))fdTitleColor;

- (__kindof UIButton *(^)(UIColor *color))fdTitlesColor;

- (__kindof UIButton *(^)(UIImage *_Nullable image,UIControlState state))fdBackgroundImage;

- (__kindof UIButton *(^)(NSString *imageName))fdBackgroundImageName;

- (__kindof UIButton *(^)(CGFloat fontSize))fdFont;

- (__kindof UIButton *(^)(SEL action,UIControlEvents controlEvents))addTargetAction;

- (__kindof UIButton *(^)(CGFloat radius))fdRadius;

- (__kindof UIButton *(^)(CGFloat width, UIColor *color,CGFloat radius))fdRadiusOrBorder;

- (void)fdAddTargetAction:(UIControlEvents)controlEvents buttonAction:(void(^)(UIButton *button))action;

@end

NS_ASSUME_NONNULL_END
