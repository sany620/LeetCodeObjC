//
//  ImgBrowserManager.h
//  LeetcodeDemo
//
//  Created by apple on 2020/11/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImgBrowserManager : NSObject



/// 显示图片浏览器
/// @param dataSource 数据源 里面可以放网络视频url 本地视频 网络图片url 本地图片
/// @param sourceView 源imageView
/// @param currentIndex 当前索引
+(void)showBrowserWithDataList:(NSArray *)dataSource sourceView:(nullable UIView *)sourceView currentIndex:(NSInteger)currentIndex;


@end

NS_ASSUME_NONNULL_END
