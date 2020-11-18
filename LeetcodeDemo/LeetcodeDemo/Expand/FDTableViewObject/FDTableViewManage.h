//
//  FDTableViewManage.h
//  TSTST
//
//  Created by lihongliang on 2019/6/28.
//  Copyright © 2019 lihongliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FDSection.h"
#import "FDItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface FDTableViewManage : NSObject

@property (nonatomic, weak) UITableView *tableView;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;

@property (nonatomic, copy) void(^ tableViewScrollBlock)(UIScrollView *_Nullable scrollView);

/**
 初始化tableView
 
 @param tableView tableView
 */
- (instancetype)initTableViewManage:(UITableView *)tableView;

/**
 cell注册
 
 @param nibName nib名字
 */
- (void)registerCellWithNibName:(NSString *)nibName;

/**
 cell注册
 
 @param cellClass 类名
 */
- (void)registerCellWithClass:(Class)cellClass;
- (void)registerCellClass:(Class)objectClass forCellWithReuseIdentifier:(NSString *)cellIdentifier;
/**
 cell注册
 
 @param cellClass 类名数组
 */
- (void)registerCellWithClassArray:(NSArray<NSString *> *)cellArray;


/**
 header和footer注册
 
 @param nibName nib名字
 */
- (void)registerHeaderFooterViewWithNibName:(NSString *)nibName;

/**
 header和footer注册
 
 @param aClass 类名
 */
- (void)registerHeaderFooterViewWithClass:(Class)aClass;


/**
 添加section
 
 @param section 添加section
 */
- (void)addSection:(FDSection *)section;

- (void)addSectionsFromArray:(NSArray <FDSection *>*)array;

- (void)addSection:(FDSection *)section atIndex:(NSUInteger)idx;
/**
 插入section

 @param section 添加section
 */

- (void)insertSection:(FDSection *)section atIndex:(NSUInteger)index;
/**
 删除
 */
- (void)remoVeSection:(FDSection *)section;

- (void)removeAllSection;

- (void)remoVeSectionatIndex:(NSUInteger)idx;
/**
 替换
 */
- (void)replaceSectionAtIndex:(NSUInteger)index withSection:(FDSection *)section;

- (void)replaceSectionsWithSectionsFromArray:(NSArray <FDSection *>*)otherArray;

/**
 获取sections
 */
- (NSArray <FDSection *>*)sections;

/**
 Scroll to top.
 */
- (void)scrollToTopAnimated:(BOOL)animated;


@end

NS_ASSUME_NONNULL_END
