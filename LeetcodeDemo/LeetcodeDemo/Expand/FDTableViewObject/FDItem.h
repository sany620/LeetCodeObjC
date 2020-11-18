//
//  FDItem.h
//  TSTST
//
//  Created by lihongliang on 2019/6/27.
//  Copyright © 2019 lihongliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FDItemHeader.h"

@class FDSection;
NS_ASSUME_NONNULL_BEGIN

@interface FDItem : NSObject

@property (nonatomic, weak)FDSection *section;

/**
 row唯一标识符
 */
@property (nonatomic, copy, readonly) NSString *cellIdentifier;

@property (nonatomic, copy, readonly) NSString *cellClassName;

/**
 高度cell
 */
@property (nonatomic, assign) CGFloat rowHeight;

/**
 加载数据并赋值
 */
@property (nonatomic, copy) FDItemCellConfiguration cellConfiguration;

/**
 点击
 */
@property (nonatomic, copy) FDItemDidSelectRow didSelectRow;

/**
 已经点击
 */
@property (nonatomic, copy) FDItemDidDeselectRow didDeselectRow;

/**
 侧滑
 */

@property (nonatomic, copy) FDItemEditActions editActions;


/** *是否可以编辑*/
@property (nonatomic, assign) BOOL canEdit;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;

/**
 初始化

 @param data 数据源
 @param cellClass cell类
 @return return
 */
- (instancetype)initWithData:(nullable id)data cellClass:(Class)cellClass;
- (instancetype)initWithData:(nullable id)data cellClass:(Class)cellClass identifier:(NSString *)identifier;
/**
 返回数据
 */
- (id)data;

/**
 indexPath
 */
- (NSIndexPath *)indexPath;

/**
 回调

 @param tableViewManage 管理
 @param cell cell
 */
- (void)tableViewManage:(FDTableViewManage *)tableViewManage cell:(__kindof UITableViewCell *)cell;

@end

NS_ASSUME_NONNULL_END
