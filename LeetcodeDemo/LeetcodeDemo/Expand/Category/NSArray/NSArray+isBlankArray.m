//
//  NSArray+isBlankArray.m
//  BuildGuard
//
//  Created by freedo on 2019/1/24.
//  Copyright © 2019年 com.ddg. All rights reserved.
//

#import "NSArray+isBlankArray.h"

@implementation NSArray (isBlankArray)

+ (BOOL) isBlankArray:(NSArray *)arr
{
    if(!arr) {
        return YES;
    }
    if([arr isKindOfClass:[NSNull class]]) {
       return YES;
    }
    if(![arr isKindOfClass:[NSArray class]]) {
      return YES;
    }
    if(arr.count == 0){
      return YES;
    }
    if (arr == nil) {
      return YES;
    }
    if (arr == NULL) {
        return YES;
    }
    return NO;
}
@end
