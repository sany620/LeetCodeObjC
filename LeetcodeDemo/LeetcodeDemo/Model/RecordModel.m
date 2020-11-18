//
//  RecordModel.m
//  LeetcodeDemo
//
//  Created by apple on 2020/11/18.
//

#import "RecordModel.h"

@implementation RecordModel

+ (NSDictionary *)mj_objectClassInArray {
     return @{@"val" : [RecordVal class]};
}

@end

@implementation RecordVal

@end
