//
//  FDSectionHeader.h
//  TestAPP
//
//  Created by 飞渡 on 2019/7/1.
//  Copyright © 2019 freedo. All rights reserved.
//

#ifndef FDSectionHeader_h
#define FDSectionHeader_h
#import <Foundation/Foundation.h>

typedef void (^FDSectionViewForHeader)(__kindof UIView *headerView ,NSInteger section);

typedef void (^FDSectionViewForFooter)(__kindof UIView *footerView ,NSInteger section);

typedef CGFloat (^FDSectionheightForHeader)(NSInteger section); //headerHeight

typedef CGFloat (^FDSectionheightForFooter)(NSInteger section); //footerHeight

typedef NSString *(^FDSectionTitleForHeader)(NSInteger section); //header

typedef NSString * (^FDSectionTitleForFooter)(NSInteger section); //footer

typedef UIView * (^FDSectionCustomViewForHeader)(NSInteger section); //headerView

typedef UIView * (^FDSectionCustomViewForFooter)(NSInteger section); //footerView

#endif /* FDSectionHeader_h */
