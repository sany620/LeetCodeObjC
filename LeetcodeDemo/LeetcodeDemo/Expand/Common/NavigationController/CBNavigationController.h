//
//  CBNavigationController.h
//  BuildGuard
//
//  Created by Sany on 15/3/23.
//  Copyright (c) 2015年 FuEr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBNavigationController : UINavigationController
@property (nonatomic,retain) UIImageView * backImageView;
@property (nonatomic,retain) UIButton * leftNavButton;
@property (nonatomic,retain) UIButton * rightNavButton;
@property (nonatomic,retain) UILabel * titleLabel;


/**
 设置标题
 */
- (void)setupTitle:(NSString *)title;
- (void)setupTitle:(NSString *)title action:(SEL)selector target:(id)target;
- (void)setupTitle:(NSString *)title titleColor:(UIColor *)color;
- (void)setupTitleColor:(UIColor *)color;
/**
 设置左按钮
 */
- (void)leftButtonWithTitle:(NSString *)title action:(SEL)selector onTarget:(id)target;
- (void)leftButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor action:(SEL) selector onTarget:(id)target;
- (void)leftButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize isBold:(BOOL)isBold action:(SEL) selector onTarget:(id)target;
- (void)leftButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor customFontSize:(CGFloat)fontSize isBold:(BOOL)isBold action:(SEL) selector onTarget:(id)target;


- (void)leftButtonWithImage:(UIImage *)image action:(SEL)selector onTarget:(id)target;
- (void)leftButtonWithImage:(UIImage *)image size:(CGSize)size action:(SEL)selector target:(id)target;
- (void)leftButtonWithImage:(UIImage *)image highlightImage:(UIImage *)hlImage size:(CGSize)size action:(SEL)selector target:(id)target;
/**
 设置右按钮
 */
- (void)rightButtonWithTitle:(NSString *)title action:(SEL)selector onTarget:(id)target;
- (void)rightButtonWithTitle:(NSString *)title titleColor:(UIColor *)color action:(SEL)selector onTarget:(id)target;
- (void)rightButtonWithImage:(UIImage *)image action:(SEL)selector onTarget:(id)target;
- (void)rightButtonWithImage:(UIImage *)image size:(CGSize)size action:(SEL)selector target:(id)target;
- (void)rightButtonWithImage:(UIImage *)image highlightImage:(UIImage *)hlImage size:(CGSize) size action:(SEL)selector target:(id)target;
- (void)leftButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor customFontSize:(CGFloat)fontSize isBold:(BOOL)isBold action:(SEL) selector onTarget:(id)target lineView:(BOOL)lineView;
@end
