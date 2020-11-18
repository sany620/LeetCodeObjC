//
//  UIViewController+FDTableView.h
//  BuildGuard
//
//  Created by apple on 2020/3/13.
//  Copyright © 2020 com.ddg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 快速创建tableview分类
@interface UIViewController (FDTableView)
///创建TableView并设置style
-(UITableView *)creatFDTableViewWithStyle:(UITableViewStyle)style;

@end

NS_ASSUME_NONNULL_END
