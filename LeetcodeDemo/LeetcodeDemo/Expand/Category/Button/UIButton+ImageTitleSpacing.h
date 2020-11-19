//
//  UIButton+ImageTitleSpacing.h
//  WxySquareButton
//
//  Created by WangXy on 2016/12/21.
//  Copyright © 2016年 王馨仪. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ButtonImgViewStyleTop,//图片在上，文字在下
    ButtonImgViewStyleLeft,// 图片在左，文字在右
    ButtonImgViewStyleBottom,// 图片在下，文字在上
    ButtonImgViewStyleRight,// 图片在右，文字在左
} ButtonImgViewStyle;
@interface UIButton (ImageTitleSpacing)
/**
 设置 按钮 图片所在的位置
 @param style   图片位置类型（上、左、下、右）
 @param size    图片的大小
 @param space 图片跟文字间的间距
 */
- (void)setImgViewStyle:(ButtonImgViewStyle)style imageSize:(CGSize)size space:(CGFloat)space;

@end
