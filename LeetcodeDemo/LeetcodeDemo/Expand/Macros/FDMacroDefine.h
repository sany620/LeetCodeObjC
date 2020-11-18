//
//  FDMacroDefine.h
//  M
//
//  Created by M on 2018/9/27.
//  Copyright © 2018年 HangZhou M. All rights reserved.
//

#ifndef FDMacroDefine_h
#define FDMacroDefine_h

#define RGBACOLOR(__r,__g,__b,__a) \
[UIColor colorWithRed:(__r)/255.0f green:(__g)/255.0f blue:(__b)/255.0f alpha:(__a)]

#define RGBCOLOR(__r,__g,__b) RGBACOLOR(__r,__g,__b,1.0)



//单例化一个类
#define SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}

/* ------自动提示宏------*/
/**
 *  @brief 可以将对象的属性转化为字符串,并且可以出现自动提示(用一下你就知道有多神奇了)
 *  @param __obj     NSObject对象
 *  @param __keyPath 对象的属性
 *  @return 对象属性对应的字符串
 *  @since v0.1.0
 */
#define keyPath(__obj,__keyPath)   @(((void)__obj.__keyPath,#__keyPath))



/* ------格式化字符串------*/
#define F(string, args...)      [NSString stringWithFormat:string, args]

/* ------处理各种赋值为空的问题------*///
#define FixNull(param, default) (([NSString isBlankString:param]) ? default : param)


/* ------获取BundleId------*/
#define kBundleIdentifier ([[NSBundle mainBundle] bundleIdentifier])

/* ------ app信息 ------*/
// 名字
#define APP_NAME ([[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleDisplayName"])
// 版本号
#define APP_VERSION ([[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleShortVersionString"])
// build
#define APP_BUILD ([[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleVersion"])

/* ------适配 判断系统版本------*/
// 等于
#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
// 大于
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
// 大于等于
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
// 小于
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
// 小于等于
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


/* ------适配 判断硬件类型------*/
// 判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
// 判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/* ------判断设备类型是否iPhoneXS Max，iPhoneXS，iPhoneXR，iPhoneX------*/
#define IS_IphoneX (([FDDeviceConfig iPhoneXSeries]))

//判断iPhoneX，Xs（iPhoneX，iPhoneXs）
#define IS_IPHONE_X_ ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPhoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPhoneXsMax
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
//判断5 5S SE
#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//判断7 7S  8 8S
#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
//判断6P 6SP 7P 7SP 8P 8SP
#define kDevice_Is_iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//是否是真机
#define isIPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)


/**
 *  @author _Finder丶Tiwk,
 *  这个宏灵感来源于ReactiveCocoa EXTScope.h
 *  使用方法如下,注意前面的@符号 :
 @weakify(self)
 [obj block:^{
 @strongify(self)
 [self doAnything];
 self.property = something;
 }];
 *  @since v0.1.0
 */
#ifndef    xWeakify
#if __has_feature(objc_arc)
#define xWeakify autoreleasepool{} __weak __typeof__(self) weakRef = self;
#else
#define xWeakify autoreleasepool{} __block __typeof__(self) blockRef = self;
#endif
#endif

#ifndef     xStrongify
#if __has_feature(objc_arc)
#define xStrongify try{} @finally{} __strong __typeof__(weakRef) self = weakRef;
#else
#define xStrongify try{} @finally{} __typeof__(blockRef) self = blockRef;
#endif
#endif

/* ------UI------*/
/**
 * View 圆角和加边框
 */
#define KViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

/**
 * View 圆角
 */
#define KViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]


/* ------版本&API控制------*/
/**
 *  @brief  用于废弃过时的API
 *  @param __version 从某个版本开始废弃
 *  @param __message 提示信息
 *  @since v0.1.0
 */
#define TR_DEPRECATE(__version,__message)    __attribute__((deprecated(__message)))
/**
 *  @brief  用于禁用某API
 *  @param __verison 从某个版本开始禁用
 *  @param __message 提示信息
 *  @since v0.1.0
 */
#define TR_UNAVAILABLE(__verison,__message)  __attribute__((unavailable(__message)))
/**
 *  log日志信息
 */

#ifdef DEBUG
#define ATLog(FORMAT, ...) fprintf(stderr,"[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define ATLog(...)
#endif


#endif /* FDMacroDefine_h */
