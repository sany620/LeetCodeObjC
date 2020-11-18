//
//  FDSection.m
//  TSTST
//
//  Created by lihongliang on 2019/6/27.
//  Copyright © 2019 lihongliang. All rights reserved.
//

#import "FDSection.h"
#import "FDTableViewManage.h"


@interface FDSection ()

@property (nonatomic, strong) NSMutableArray <FDItem *> *dataArray;

@property (nonatomic, copy) NSString *headerIdent; //header的ident

@property (nonatomic, copy) NSString *footerIdent; //footer的ident

@end

@implementation FDSection
+ (instancetype)section{
    
    return [[self alloc] init];
}

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)dequeueReusableHeaderClass:(nullable Class)headerClass footerClass:(nullable Class)footerClass{
    if (headerClass) {
      NSString *headerIdentifier = NSStringFromClass(headerClass);
      self.headerIdent = headerIdentifier;
    }
    if (footerClass) {
        NSString *footerIdentifier = NSStringFromClass(footerClass);
        self.footerIdent = footerIdentifier;
    }
}

- (NSInteger)section{
    return [self.tableManage.sections indexOfObject:self];
}

#pragma mark 删除item
- (void)removeAllItem{
    [self.dataArray removeAllObjects];
}

- (void)removeItemWithIndex:(NSInteger)index{
    if (self.dataArray.count <= index) {
#ifdef DEBUG
        NSString *des = [NSString stringWithFormat:@"[__NSArrayI objectAtIndex:]: index %ld beyond bounds [0 .. %ld]",index,self.itemList.count - 1];
        NSAssert(NO, des);
#endif
        return;
    }
    [self.dataArray removeObjectAtIndex:index];
}

- (void)remoVeItemWithArray:(NSArray <FDItem *>*)array{
    if (array.count == 0) {
        return;
    }
    [self.dataArray removeObjectsInArray:array];
}

- (void)removeItem:(FDItem *)item{
    
    if (!item) {
#ifdef DEBUG
      NSAssert(item, @"item not Null");
#endif
        return;
    }
    [self.dataArray removeObject:item];
}

#pragma mark itemList
- (NSArray <FDItem *> *)itemList{

    return _dataArray;
}

#pragma mark 添加item
- (void)addItem:(FDItem *)item{
    if (!item) {
#ifdef DEBUG
        NSAssert(item, @"item not Null");
#endif
        return;
    }
    item.section = self;
    [self.dataArray addObject:item];
}

- (void)insertItem:(FDItem *)item atIndex:(NSUInteger)idx{
    if (!item) {
#ifdef DEBUG
        NSAssert(item, @"item Not Null");
#endif
        return;
    }
    
    if (self.dataArray.count < idx) {
#ifdef DEBUG
        NSString *des = [NSString stringWithFormat:@"[__NSArrayI objectAtIndex:]: index %ld beyond bounds [0 .. %ld]",idx,self.itemList.count];
        NSAssert(NO, des);
#endif
        return;
    }
    item.section = self;
    [self.dataArray insertObject:item atIndex:idx];
}

- (void)addItemFromArray:(NSArray <FDItem *>*)array{
    if (array.count == 0) {
        return;
    }
    [array enumerateObjectsUsingBlock:^(FDItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.section = self;
        [self.dataArray addObject:obj];
    }];
}

- (void)replaceItemAtIndex:(NSUInteger)index withItem:(FDItem *)item {
    if (!item) {
#ifdef DEBUG
        NSAssert(item, @"item Not problem");
#endif
        return;
    }
    if (self.itemList.count <= index) {
#ifdef DEBUG
        NSString *des = [NSString stringWithFormat:@"[__NSArrayI objectAtIndex:]: index %ld beyond bounds [0 .. %ld]",index,self.itemList.count - 1];
        NSAssert(NO, des);
#endif
        return;
    }
    item.section = self;
    [self.dataArray replaceObjectAtIndex:index withObject:item];
}

- (void)replaceItemsWithItemsFromArray:(NSArray <FDItem *>*)otherArray {
    if (otherArray == nil || otherArray.count == 0) {
        return;
    }
    [self removeAllItem];
    [self addItemFromArray:otherArray];
}

- (NSString *)sectionFooterIdent{
    
    return self.footerIdent;
}

- (NSString *)sectionHeaderIdent{
    
    return self.headerIdent;
}

#pragma mark 懒加载
- (NSMutableArray <FDItem *>*)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
