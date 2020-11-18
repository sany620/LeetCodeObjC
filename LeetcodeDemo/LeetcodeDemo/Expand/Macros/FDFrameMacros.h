//
//  FDFrameMacros.h
//  BuildGuard
//
//  Created by freedo on 2019/5/7.
//  Copyright © 2019 com.ddg. All rights reserved.
//

#ifndef FDFrameMacros_h
#define FDFrameMacros_h

#define iphone4x_3_5 ([UIScreen mainScreen].bounds.size.height==480.0f)

#define iphone5x_4_0 ([UIScreen mainScreen].bounds.size.height==568.0f)

#define iphone6_4_7 ([UIScreen mainScreen].bounds.size.height==667.0f)

#define iphone6Plus_5_5 ([UIScreen mainScreen].bounds.size.height==736.0f || [UIScreen mainScreen].bounds.size.height==414.0f)


/**宽度比例*/
#define CZH_ScaleWidth(__VA_ARGS__)  ([UIScreen mainScreen].bounds.size.width/375)*(__VA_ARGS__)

/**高度比例*/
#define CZH_ScaleHeight(__VA_ARGS__)  ([UIScreen mainScreen].bounds.size.height/667)*(__VA_ARGS__)
//屏幕宽高
#define kScreenW [[UIScreen mainScreen] bounds].size.width
#define kScreenH [[UIScreen mainScreen] bounds].size.height
//导航栏高度
#define  MANavBarHeight  (IS_IphoneX ? 88 : 64)

#define NAVBAR_CHANGE_POINT 60

#define PhotoBrowserCellHeight 112

//底部安全区高度
#define  BottomDangerArea  (IS_IphoneX ? 34 : 0)


//屏幕frame,bounds,size

#define kScreenBounds [UIScreen mainScreen].bounds


/* ------适配 获取UI参数------*/
// 设备宽度比例
#define kSreenWidtkHscale (kScreenWidth / 320.)

#define WindowsSize [UIScreen mainScreen].bounds.size

/* ------适配 宽高比例尺寸------*/
///414*736 plus
///375*812 x
///375*667 8
///320*568 se

#define kIphonSEHeight (kScreenHeight == 568 ? 1 : 0)
#define kWidth(x) ((x)*(kScreenWidth)/375.0)
#define kWidthScale(x) (double)(IS_IphoneX?(x * 1.5):(kScreenW<=375.0)?x:((x)*(kScreenWidth)/375.0))


#define kHeight(y) ((y)*(IS_IphoneX?667:kScreenHeight)/667.0)
#define kHscale (IS_IphoneX ? 1 : kScreenHeight/667.0)

//屏幕缩放比例，以4.7寸屏为参照
#define KZOOM_SCALE_X (double)((kScreenW<375.0)?1:(kScreenW/375.0))
#define FontScale KZOOM_SCALE_X //可以根据屏幕大小设置字体大小

/* ------适配 iPhoneX安全区域尺寸------*/
#define kFDSafeAreaTopHeight (IS_IphoneX ? 68 : 44)
#define kFDSafeAreaTopAreaHeight (IS_IphoneX ? 20 : 0)
#define kSafeAreaBottomHeight (IS_IphoneX ? 34 : 0)
#define kSafeAreaTopHeight (IS_IphoneX ? 88 : 64)
#define kSafeStatusBar (IS_IphoneX ?(44.0): (20.0))

#define kSafeAreaCusBottomHeight (IS_IphoneX ? 12 : 0)

//底部tabBar高度+SafeArea高度
#define kSafeAreaTabbarHeight (IS_IphoneX ? (49.f + 34.f) : 49.f)
#define kSafeAreaTabbarAndTopHeight (IS_IphoneX ? (49.f + 34.f) : 0.f)
// 自定义安全区域高度 适配界面
#define kScrollViewBeginTopInset 240

// 获取状态栏高度
#define kHeight_StatusBar [[UIApplication sharedApplication] statusBarFrame].size.height
// 获取导航栏高度
#define kHeight_NavBar self.navigationController.navigationBar.frame.size.height
// 获取状态栏+导航栏
#define kHeight_TopBar (kHeight_StatusBar+kHeight_NavBar)

//导航+状态条的高度
#define NAVBARHEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height)
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kNavBarHeight 44.0
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

//
#define FDTableviewCell40Height 40.0

#define FDTableviewCell50Height 50.0
//屏幕高度
#define FDTableviewScreenHeight (kScreenH - NAVBARHEIGHT)
//屏幕高度自定义减法
#define FDViewScreenMinusHeight(height) ((kScreenH - NAVBARHEIGHT) - height)

#define kKeyWindow [UIApplication sharedApplication].keyWindow

//巡检扫码顶部高
#define InspQRTopViewHeight (IS_IphoneX ? 298 : 274)

#define InspectionTopViewHeight (IS_IphoneX ? 142 : 118)


#define MeterReadTopViewHeight (101)

#define BlueHeaderViewHeight (IS_IphoneX ? 142 : 118)



#endif /* FDFrameMacros_h */
