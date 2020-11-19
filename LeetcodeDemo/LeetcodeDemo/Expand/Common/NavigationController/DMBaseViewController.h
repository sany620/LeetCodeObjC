//
//  TaurusBaseViewController.h
//  PPJiJin
//
//  Created by duanmu on 15/3/23.
//  Copyright (c) 2015年 FuEr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMBaseViewController : UIViewController

@property (nonatomic, assign)BOOL isError;
@property (nonatomic, assign)BOOL isLoadError;
@property (nonatomic, strong) NSDictionary *argDict;

/// 解析事件block
@property (nonatomic, copy) void(^parsingEventBlock)(void);

/// 查看源码block
@property (nonatomic, copy) void(^sourceCodeEventBlock)(void);

/// 文本
@property (nonatomic, strong) NSString *ideaString;

/// 文本是否隐藏
@property (nonatomic, assign) BOOL ideaHidden;
@property (nonatomic, assign) BOOL bottomMenuHidden;

- (void)backToVC;

- (void)pushViewController:(NSString *)viewControllerName withArgment:(NSDictionary *)argDict;
- (void)addBaseSubViews;

@end
