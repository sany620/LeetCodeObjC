//
//  FDSection.h
//  TSTST
//
//  Created by lihongliang on 2019/6/27.
//  Copyright © 2019 lihongliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FDItem.h"
#import "FDSectionHeader.h"
@class FDTableViewManage;
NS_ASSUME_NONNULL_BEGIN

@interface FDSection : NSObject

@property (nonatomic, weak)FDTableViewManage *tableManage;

/**
 section下标
 */
@property (nonatomic, assign, readonly) NSInteger section;

/**
 item数量
 */
@property (nonatomic, strong, readonly) NSArray <FDItem *> *itemList;

/**
 header标识符
 */
@property (nonatomic, copy, readonly) NSString *sectionHeaderIdent;

/**
 footer标识符
 */
@property (nonatomic, copy, readonly) NSString *sectionFooterIdent;

/**
 headerView高度
 */
@property (nonatomic, copy) FDSectionheightForHeader heightForHeader;

/**
 footerView高度
 */
@property (nonatomic, copy) FDSectionheightForFooter heightForFooter;

/**
 headerTitle
 */
@property (nonatomic, copy) FDSectionTitleForHeader titleForHeader;

/**
 footerTitle
 */
@property (nonatomic, copy) FDSectionTitleForFooter titleForFooter;

/**
 自定义headerView
 */
@property (nonatomic, copy) FDSectionCustomViewForHeader customViewForHeader;

/**
 自定义footerView
 */
@property (nonatomic, copy) FDSectionCustomViewForFooter customViewForFooter;


/**
 初始化section
 */

+ (instancetype)section;


/**
 删除item
 */
- (void)removeAllItem;

- (void)removeItemWithIndex:(NSInteger)index;

- (void)remoVeItemWithArray:(NSArray <FDItem *>*)array;

- (void)removeItem:(FDItem *)item;


/**
 添加item
 */
- (void)addItem:(FDItem *)item;

- (void)insertItem:(FDItem *)item atIndex:(NSUInteger)idx;

- (void)addItemFromArray:(NSArray <FDItem *>*)array;
/**
 替换item
 */
- (void)replaceItemAtIndex:(NSUInteger)index withItem:(FDItem *)item;

- (void)replaceItemsWithItemsFromArray:(NSArray <FDItem *>*)otherArray;
// ***************************列出、返回headerView和footerView【下方法和属性配合使用】********************

/**
  FDSectionHeaderView和FDSectionFooterView
 【说明】- (void)dequeueReusableHeaderClass:(nullable Class)headerClass footerClass:(nullable Class)footerClass; 不使用则属性无效
 */

/**
 返回对应headerView 【返回可以赋值】
 */
@property (nonatomic, copy) FDSectionViewForHeader viewForHeader;
/**
 返回对应footerView 【返回可以赋值】
 */
@property (nonatomic, copy) FDSectionViewForFooter viewForFooter;

/**
  列出header和footer
 @param headerClass header类
 @param footerClass footer类
 */
- (void)dequeueReusableHeaderClass:(nullable Class)headerClass footerClass:(nullable Class)footerClass;

@end

NS_ASSUME_NONNULL_END
