//
//  UIViewController+FDTableView.m
//  BuildGuard
//
//  Created by apple on 2020/3/13.
//  Copyright © 2020 com.ddg. All rights reserved.
//

#import "UIViewController+FDTableView.h"
#import "FDMacroDefine.h"

@implementation UIViewController (FDTableView)

-(UITableView *)creatFDTableViewWithStyle:(UITableViewStyle)style{
    CGFloat tabViewH = IS_IphoneX ? FDTableviewScreenHeight + 34 : FDTableviewScreenHeight;
    CGRect frame = CGRectMake(0, 0, kScreenW, tabViewH);
    UITableView *tableView = [[UITableView alloc]initWithFrame:frame style:style];
    tableView.frame = frame;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.estimatedRowHeight = 80;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, CGFLOAT_MIN)];
    tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, CGFLOAT_MIN)];
    tableView.backgroundColor = UIColor.clearColor;
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:tableView];
    return tableView;
}

@end
