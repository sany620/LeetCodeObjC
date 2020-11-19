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
        if ([obj hasSuffix:@".MP4"]) {
            if ([obj hasPrefix:@"http"]||[obj hasPrefix:@"https"]) {
                
            }else{
                
            }
        }else if ([obj hasPrefix:@"http"]||[obj hasPrefix:@"htts"]){
            
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
