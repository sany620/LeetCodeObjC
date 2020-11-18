//
//  NSBundle+Extension.m
//  BuildGuard
//
//  Created by apple on 2019/12/5.
//  Copyright © 2019 com.ddg. All rights reserved.
//

#import "NSBundle+Extension.h"

@implementation NSBundle (Extension)


+ (id)objectWithJson:(NSString *)fileName{
    NSData *data = [NSData dataWithContentsOfFile:[[self mainBundle] pathForResource:fileName ofType:@"json"]];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
}

+ (nullable NSDictionary *)dictWithJson:(NSString *)fileName{
    if ([[self objectWithJson:fileName] isKindOfClass:[NSDictionary class]]) {
        return [self objectWithJson:fileName];
    }
    return @{};
}

+ (nullable NSArray *)arrayWithJson:(NSString *)fileName{
    if ([[self objectWithJson:fileName] isKindOfClass:[NSArray class]]) {
        return [self objectWithJson:fileName];
    }
    return @[];
}

+ (NSDictionary *)dictWithPlist:(NSString *)fileName{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    return [NSDictionary dictionaryWithContentsOfFile:path];
}

+ (NSArray *)arrayWithPlist:(NSString *)fileName{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    return [NSArray arrayWithContentsOfFile:path];
}

@end
