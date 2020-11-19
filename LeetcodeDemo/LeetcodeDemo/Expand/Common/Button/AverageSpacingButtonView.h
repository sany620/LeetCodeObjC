//
//  AverageSpacingButtonView.h
//  BuildGuard
//
//  Created by freedo on 2019/2/21.
//  Copyright © 2019年 com.ddg. All rights reserved.
//
/**
 平均间距等分按钮
 
 @[@{@"titleName":@"xx",
    @"bgColorHex":@"",
    @"titleColorHex":@"",
    @"buttonRadius":@"0"
 }]

 */
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AverageSpacingButtonView : UIView
/**
方向：水平or垂直
*/
@property (nonatomic) NSInteger buttonAxial;
/**
 按钮横向间距
 */
@property(nonatomic) CGFloat horizontalSpacing;

/**
 按钮垂直间距
 */
@property(nonatomic) CGFloat verticalSpacing;


/**
 * 按钮文字数组
 * @[@"xx", @"yy"]
 */
@property (nonatomic, strong) NSArray<NSDictionary*> *titleArray;
/**
 * 按钮事件纯文字按钮的block
 */
@property (nonatomic,copy) void(^averageSpacingButtonEventBlock)(NSInteger selectIndx,NSString * titleSring);


@end

NS_ASSUME_NONNULL_END
