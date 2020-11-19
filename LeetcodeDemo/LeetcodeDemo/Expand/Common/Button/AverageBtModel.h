//
//  AverageBtModel.h
//  BuildGuard
//
//  Created by apple on 2019/9/18.
//  Copyright © 2019 com.ddg. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 自定义button属性Model

 */
@interface AverageBtModel : NSObject

@property (nonatomic, copy) NSString *titleName;//按钮文字
@property (nonatomic, copy) NSString *titleImage;//按钮图片
@property (nonatomic, copy) NSString *bgColorHex;//按钮背景颜色值
@property (nonatomic, copy) NSString *titleColorHex;//按钮文字颜色值
@property (nonatomic, copy) NSString *buttonRadius;//按钮圆角值
@property (nonatomic, copy) NSString *borderColor;//边框颜色

@end

NS_ASSUME_NONNULL_END
