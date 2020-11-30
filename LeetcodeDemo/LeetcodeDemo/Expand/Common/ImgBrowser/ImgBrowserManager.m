//
//  ImgBrowserManager.m
//  LeetcodeDemo
//
//  Created by apple on 2020/11/18.
//

#import "ImgBrowserManager.h"
#import "YBImageBrowser.h"


@implementation ImgBrowserManager

+(void)showBrowserWithDataList:(NSArray *)dataSource sourceView:(nullable UIView *)sourceView currentIndex:(NSInteger)currentIndex{
    NSMutableArray *browserDataArr = [NSMutableArray array];
    YBImageBrowser *browser = [YBImageBrowser new];
    [dataSource enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj hasPrefix:@"http"]||[obj hasPrefix:@"https"]) {
            //判断是图片还是视频
            NSString *extensionName = obj.pathExtension;
            if ([extensionName.lowercaseString isEqualToString:@"mp4"]) {
                YBIBVideoData *videoData = [YBIBVideoData new];
                videoData.videoURL = [NSURL URLWithString:obj];
                videoData.projectiveView = sourceView;
                [browserDataArr addObject:videoData];
            }else{
                //图片
                YBIBImageData *data = [YBIBImageData new];
                data.imageURL = [NSURL URLWithString:obj];
                data.projectiveView = sourceView;
                [browserDataArr addObject:data];
            }
        }else {
            // 本地图片
            YBIBImageData *data = [YBIBImageData new];
            data.imageName = obj;
            data.projectiveView = sourceView;
            [browserDataArr addObject:data];
        }
    }];
    browser.backgroundColor = [UIColor blackColor];
    browser.dataSourceArray = browserDataArr;
    browser.currentPage = currentIndex;
    browser.defaultToolViewHandler.topView.operationType = YBIBTopViewOperationTypeSave;
    [browser show];
}
@end
