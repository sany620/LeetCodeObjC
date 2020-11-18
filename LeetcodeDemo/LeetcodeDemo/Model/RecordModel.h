//
//  RecordModel.h
//  LeetcodeDemo
//
//  Created by apple on 2020/11/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class RecordVal;

@interface RecordModel : NSObject

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSArray <RecordVal *> * val;
@property (nonatomic, copy) NSString * msg;
@property (nonatomic, assign) NSInteger success;

@end


@interface RecordVal : NSObject

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * orderId;
@property (nonatomic, copy) NSString *viewName;

@end


NS_ASSUME_NONNULL_END
