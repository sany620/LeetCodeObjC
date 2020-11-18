//
//  FDItemHeader.h
//  BuildGuard
//
//  Created by 飞渡 on 2019/7/4.
//  Copyright © 2019 com.ddg. All rights reserved.
//

#ifndef FDItemHeader_h
#define FDItemHeader_h
@class FDTableViewManage,FDItem;
#import <Foundation/Foundation.h>

typedef void (^FDItemCellConfiguration)(__kindof FDTableViewManage *tableVieManager,NSIndexPath *indexPath,__kindof UITableViewCell *cell,__kindof FDItem *item);

typedef void (^FDItemDidSelectRow)(__kindof FDTableViewManage *tableVieManager,NSIndexPath *indexPath,__kindof FDItem *item);

typedef void (^FDItemDidDeselectRow)(__kindof FDTableViewManage *tableVieManager, NSIndexPath *indexPath,__kindof FDItem *item);

typedef NSArray <UITableViewRowAction *> *(^FDItemEditActions)(__kindof FDTableViewManage *tableVieManager, NSIndexPath *indexPath,__kindof FDItem *item);


#endif /* FDItemHeader_h */
