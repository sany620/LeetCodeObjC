//
//  UIView+Gradient.h
//  Pods
//
//  Created by Tracky on 2017/6/21.
//
//

#import <UIKit/UIKit.h>

@interface UIView (Gradient)
/*!
 *  @author Tracky
 *
 *  @brief 添加水平渐变色图层
 *  @param startColor 左侧开始颜色
 *  @param endColor   右侧结束颜色
 */
- (void)addGradientLayerWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor;

/*!
 *  @author Tracky
 *
 *  @brief 添加斜渐变色图层
 *  @param startColor 左下角开始颜色
 *  @param endColor   右上角结束颜色
 */
- (void)addObliqueGradientLayerWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor;
@end
