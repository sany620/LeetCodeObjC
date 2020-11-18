//
//  UIView+Gradient.m
//  Pods
//
//  Created by Tracky on 2017/6/21.
//
//

#import "UIView+Gradient.h"

@implementation UIView (Gradient)

- (void)addGradientLayerWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor {

    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = self.bounds;
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

- (void)addObliqueGradientLayerWithStartColor:(UIColor *)startColor endColor:(UIColor *)endColor {
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    gradientLayer.startPoint = CGPointMake(0, 1);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = self.bounds;
    [self.layer insertSublayer:gradientLayer atIndex:0];
}
@end
