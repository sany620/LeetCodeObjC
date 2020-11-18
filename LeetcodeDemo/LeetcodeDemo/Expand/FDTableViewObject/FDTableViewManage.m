//
//  FDTableViewManage.m
//  TSTST
//
//  Created by lihongliang on 2019/6/28.
//  Copyright © 2019 lihongliang. All rights reserved.
//

#import "FDTableViewManage.h"
#import "NSArray+isBlankArray.h"

@interface FDTableViewManage ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray <FDSection *>*dataArray;

@end
@implementation FDTableViewManage

#pragma mark 初始化
- (instancetype)initTableViewManage:(UITableView *)tableView {
    if (self = [super init]) {
        if (tableView) {
            _tableView = tableView;
            tableView.delegate = self;
            tableView.dataSource = self;
        }
    }
    return self;
}

#pragma mark cell注册
- (void)registerCellWithNibName:(NSString *)nibName{
    [self.tableView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellReuseIdentifier:nibName];
}

- (void)registerCellWithClass:(Class)cellClass{
    NSString *identifier = NSStringFromClass(cellClass);
    [self.tableView registerClass:cellClass forCellReuseIdentifier:identifier];
}

- (void)registerCellClass:(Class)objectClass forCellWithReuseIdentifier:(NSString *)cellIdentifier{
    [self.tableView registerClass:objectClass forCellReuseIdentifier:cellIdentifier];
}

- (void)registerCellWithClassArray:(NSArray<NSString *> *)cellArray{
    if ([NSArray isBlankArray:cellArray]) {
        return;
    }
    [cellArray enumerateObjectsUsingBlock:^(NSString  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Class factoryClass  = NSClassFromString(obj);
        [self registerCellWithClass:[factoryClass class]];
    }];
}

#pragma mark header和footer注册
- (void)registerHeaderFooterViewWithNibName:(NSString *)nibName{
    [self.tableView registerNib:[UINib nibWithNibName:nibName bundle:nil] forHeaderFooterViewReuseIdentifier:nibName];
}

- (void)registerHeaderFooterViewWithClass:(Class)aClass{
    NSString *identifier = NSStringFromClass(aClass);
    [self.tableView registerClass:aClass forHeaderFooterViewReuseIdentifier:identifier];
}

#pragma mark 添加section
- (void)addSection:(FDSection *)section{
    if (!section) {
#ifdef DEBUG
        NSAssert(section, @"section Not Null");
#endif
        return;
    }
    section.tableManage = self;
    [self.dataArray addObject:section];
}
- (void)addSectionsFromArray:(NSArray <FDSection *>*)array{
    if (array.count == 0) {
        return;
    }
    for (FDSection *section in array){
        section.tableManage = self;
    }
    [self.dataArray addObjectsFromArray:array];
}
- (void)addSection:(FDSection *)section atIndex:(NSUInteger)idx{
    if (!section) {
#ifdef DEBUG
        NSAssert(section, @"section Not Null");
#endif
        return;
    }
    
    if (self.dataArray.count < idx) {
#ifdef DEBUG
        NSString *des = [NSString stringWithFormat:@"[__NSArrayI objectAtIndex:]: index %ld beyond bounds [0 .. %ld]",idx,self.dataArray.count];
        NSAssert(NO, des);
#endif
        return;
    }
     section.tableManage = self;
     [self.dataArray insertObject:section atIndex:idx];
}
- (void)insertSection:(FDSection *)section atIndex:(NSUInteger)index{
    section.tableManage = self;
    [self.dataArray insertObject:section atIndex:index];
}
#pragma mark 删除section
- (void)removeAllSection{
    [self.dataArray removeAllObjects];
}

- (void)remoVeSection:(FDSection *)section{
    if (!section) {
#ifdef DEBUG
        NSAssert(section, @"section Not Null");
#endif
        return;
    }
    [self.dataArray removeObject:section];
}

- (void)remoVeSectionatIndex:(NSUInteger)idx{
    if (self.dataArray.count <= idx) {
#ifdef DEBUG
        NSString *des = [NSString stringWithFormat:@"[__NSArrayI objectAtIndex:]: index %ld beyond bounds [0 .. %ld]",idx,self.dataArray.count - 1];
        NSAssert(NO, des);
#endif
        return;
    }
    [self.dataArray removeObjectAtIndex:idx];
}

#pragma mark 替换section
- (void)replaceSectionAtIndex:(NSUInteger)index withSection:(FDSection *)section{
    if (!section) {
#ifdef DEBUG
        NSAssert(section, @"section Not Null");
#endif
        return;
    }
    if (self.dataArray.count <= index) {
#ifdef DEBUG
        NSString *des = [NSString stringWithFormat:@"[__NSArrayI objectAtIndex:]: index %ld beyond bounds [0 .. %ld]",index,self.dataArray.count - 1];
        NSAssert(NO, des);
#endif
        return;
    }
    section.tableManage = self;
    [self.dataArray replaceObjectAtIndex:index withObject:section];
}

- (void)replaceSectionsWithSectionsFromArray:(NSArray <FDSection *>*)otherArray{
    if (otherArray.count == 0) {
        return;
    }
    [self removeAllSection];
    [self addSectionsFromArray:otherArray];
}

#pragma mark 获取sections
- (NSArray <FDSection *>*)sections{
    
    return _dataArray;
}

#pragma mark tableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    FDSection *fdSection = self.dataArray[section];
    return fdSection.itemList.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FDSection *fdSection = self.dataArray[indexPath.section];
    FDItem *item  = fdSection.itemList[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:item.cellIdentifier forIndexPath:indexPath];
    [item tableViewManage:self cell:cell];
    if (item.cellConfiguration) {
        item.cellConfiguration(self, indexPath, cell, item);
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FDSection *fdSection = self.dataArray[indexPath.section];
    FDItem *item  = fdSection.itemList[indexPath.row];
    return item.rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {
#ifdef DEBUG
        NSAssert(NO, @"dataArray not nil");
#endif
        return;
    }
    FDSection *fdSection = self.dataArray[indexPath.section];
    FDItem *item  = fdSection.itemList[indexPath.row];
    if (item.didSelectRow) {
        item.didSelectRow(self, indexPath, item);
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    FDSection *fdSection = self.dataArray[indexPath.section];
    FDItem *item  = fdSection.itemList[indexPath.row];
    if (item.didDeselectRow) {
        item.didDeselectRow(self, indexPath, item);
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    FDSection *fdSection = self.dataArray[section];
    
    if (fdSection.customViewForHeader) {
        return fdSection.customViewForHeader(section);
    }
    
    if (fdSection.sectionHeaderIdent.length == 0) {
        return [UIView new];
    }
    UIView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:fdSection.sectionHeaderIdent];
    if (headerView == nil) {
        headerView = [UIView new];
    }
    if (fdSection.viewForHeader) {
        fdSection.viewForHeader(headerView, section);
    }
    return headerView;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    FDSection *fdSection = self.dataArray[section];
    if (fdSection.titleForHeader) {
        return fdSection.titleForHeader(section);
    }
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    FDSection *fdSection = self.dataArray[section];
    if (fdSection.heightForHeader) {
       return fdSection.heightForHeader(section);
    }
    return 0.0f;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    FDSection *fdSection = self.dataArray[section];
    
    if (fdSection.customViewForFooter) {
        return fdSection.customViewForFooter(section);
    }
    
    if (fdSection.sectionFooterIdent.length == 0) {
        return [UIView new];
    }
    UIView *footererView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:fdSection.sectionFooterIdent];
    if (footererView == nil) {
        footererView = [UIView new];
    }
    if (fdSection.viewForFooter) {
         fdSection.viewForFooter(footererView, section);
    }
    return footererView;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    FDSection *fdSection = self.dataArray[section];
    if (fdSection.titleForFooter) {
        return fdSection.titleForFooter(section);
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    FDSection *fdSection = self.dataArray[section];
    if (fdSection.heightForFooter) {
      return fdSection.heightForFooter(section);
    }
    return 0.0f;
}

- (NSArray*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    FDSection *fdSection = self.dataArray[indexPath.section];
    FDItem *item  = fdSection.itemList[indexPath.row];
    if (item.editActions) {
        return item.editActions(self,indexPath,item);
    }
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    FDSection *fdSection = self.dataArray[indexPath.section];
    FDItem *item  = fdSection.itemList[indexPath.row];
    return item.canEdit;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.tableViewScrollBlock) {
        self.tableViewScrollBlock(scrollView);
    }
}

- (void)scrollToTopAnimated:(BOOL)animated{
    UIEdgeInsets insets = self.tableView.contentInset;
    [self.tableView setContentOffset:CGPointMake(0.0, insets.top) animated:animated];
}

#pragma mark 懒加载
- (NSMutableArray <FDSection *>*)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


@end
