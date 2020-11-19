//
//  TaurusBaseViewController.m
//  PPJiJin
//
//  Created by duanmu on 15/3/23.
//  Copyright (c) 2015年 FuEr. All rights reserved.
//

#import "DMBaseViewController.h"
#import "UIImage+XMUIImage.h"
#import "UIColor+Extend.h"
#import "UIBarButtonItem+Items.h"
#import "AppDelegate.h"


typedef void(^ReloadViewBlock)(void);
@interface DMBaseViewController ()<UIGestureRecognizerDelegate>


@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) AverageSpacingButtonView *bottomView; //底部按钮


@end

@implementation DMBaseViewController

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    
    return UIStatusBarAnimationFade;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexColorString:@"#FFFFF5"] size:CGSizeMake(1, 1)] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage createImageWithColor:[UIColor whiteColor] size:CGSizeMake(1, 1)]];
   
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addBaseSubViews];
    self.view.frame = [[UIScreen mainScreen] bounds];
    if(self.navigationController.viewControllers.count > 1){
        self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"nav_back" highImageName:@"nav_back" target:self action:@selector(backToVC)];
    }
    self.automaticallyAdjustsScrollViewInsets = NO;
   
}

#pragma mark - layout
- (void)addBaseSubViews {
    self.textView = [[UITextView alloc] init];
    self.textView.font = [UIFont systemFontOfSize:17];
    self.textView.textColor = UIColor.redColor;
    self.textView.hidden = YES;
    self.bottomView = [AverageSpacingButtonView new];
    self.bottomView.horizontalSpacing = 13;
    self.bottomView.hidden = YES;
    __weak typeof(self)weakSelf = self;
    self.bottomView.titleArray = @[@{@"titleName":@"解析",
                                     @"bgColorHex":@"037AFF",
                                     @"titleColorHex":@"FFFFFF",
                                     @"buttonRadius":@"6",
                                     @"borderColor":@""},
                                    @{@"titleName":@"源码",
                                      @"bgColorHex":@"FFFFFF",
                                      @"titleColorHex":@"037AFF",
                                      @"buttonRadius":@"6",
                                      @"borderColor":@"037AFF"}
                            ];
    self.bottomView.averageSpacingButtonEventBlock = ^(NSInteger selectIndx, NSString * _Nonnull titleSring) {
        __strong typeof(self) strongSelf = weakSelf;
        if (selectIndx == 0) {
            [strongSelf parsingEvent];
        }else{
            [strongSelf sourceCodeEvent];
        }
    };
    [self.view addSubview:self.bottomView];
    [self.view addSubview:self.textView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(0);
        } else {
            make.bottom.equalTo(self.view.mas_bottom).offset(0);;
        }
        make.height.mas_equalTo(52);
    }];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(10);
        make.left.mas_equalTo(self.view.mas_left).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.bottomView.mas_top).offset(0);
    }];
}

#pragma mark - 解析
-(void)parsingEvent{
    if (self.parsingEventBlock) {
        self.parsingEventBlock();
    }
}
#pragma mark - 源码
-(void)sourceCodeEvent{
    if (self.sourceCodeEventBlock) {
        self.sourceCodeEventBlock();
    }
}

- (void)setIdeaString:(NSString *)ideaString{
    _ideaString = ideaString;
    self.textView.text = ideaString;
}

- (void)setIdeaHidden:(BOOL)ideaHidden{
    _ideaHidden = ideaHidden;
    self.textView.hidden = ideaHidden;
}

- (void)setBottomMenuHidden:(BOOL)bottomMenuHidden{
    _bottomMenuHidden = bottomMenuHidden;
    self.bottomView.hidden = bottomMenuHidden;
}

- (void)backToVC{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushViewController:(NSString *)viewControllerName withArgment:(NSDictionary *)argDict{
    Class viewControllerClass=NSClassFromString(viewControllerName);
    DMBaseViewController *viewController = [[viewControllerClass alloc] init];
    if([viewController isKindOfClass:[DMBaseViewController class]] && viewController!=nil){
        viewController.argDict = argDict;
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
