//
//  CBNavigationController.m
//  BuildGuard
//
//  Created by Sany on 15/3/23.
//  Copyright (c) 2015年 FuEr. All rights reserved.
//

#import "CBNavigationController.h"
#import "RegularValidateTool.h"
#import "UIView+Gradient.h"
#import "NSString+TRStringWidth.h"


#define kNavigationTitleTextColor (RGBCOLOR(59, 59, 59))

@interface CBNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end


@implementation CBNavigationController

- (void)viewDidLoad{
    [super viewDidLoad];
    __weak CBNavigationController *weakSelf = self;
    self.delegate = weakSelf;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [super pushViewController:viewController animated:animated];
    [self setNavigationBarHidden:NO animated:YES];
}

#pragma mark UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate{
    // Enable the gesture again once the new controller is shown
    __weak CBNavigationController *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        if(self.viewControllers.count>1){
            self.interactivePopGestureRecognizer.delegate = weakSelf;
        }else{
            self.interactivePopGestureRecognizer.delegate = nil;
        }
    }
}

#pragma mark UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    //return ![otherGestureRecognizer isKindOfClass:UIPanGestureRecognizer.class];
    return YES;
}

#pragma mark - title

/**
 设置标题
 */
- (void )setupTitle:(NSString *)title{
    [self setupTitle:title titleColor:nil];
}

- (void)setupTitle:(NSString *)title titleColor:(UIColor *)color{
    float titleWhidth = 0;
    if (title && title.length > 0){
        titleWhidth = [RegularValidateTool longFloatWithstring:title andHeight:44 andSize:20] + 10;
    }
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake((kScreenW - titleWhidth)/2, 0,titleWhidth, 44);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = color ?color :kNavigationTitleTextColor;
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18];
    label.numberOfLines = 1;
    self.titleLabel = label;
    if([self.viewControllers lastObject]){
        UIViewController * vc = [self.viewControllers lastObject];
        vc.navigationItem.titleView = self.titleLabel;
    }
}


- (void )setupTitle:(NSString *)title action:(SEL) selector target:(id) target{
    UIButton *button = [self buttonBuilder:CGRectMake(0, 0, 120, 44) title:title alignment:NSTextAlignmentCenter target:(id)target action:(SEL)selector normalImage:nil highlightImage:nil];
    if([self.viewControllers lastObject]){
        UIViewController * vc = [self.viewControllers lastObject];
        vc.navigationItem.titleView = button;
    }
}

- (void )setupTitleColor:(UIColor *)color{
    self.titleLabel.textColor = color ?color :kNavigationTitleTextColor;
}

#pragma mark - left button

- (void )leftButtonWithImage:(UIImage *)image action:(SEL) selector onTarget:(id) target{
    if (image){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0,35, 40);
        btn.backgroundColor = [UIColor clearColor];
        [btn setImage:image forState:UIControlStateNormal];
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -(btn.frame.size.width-15), 0, 0);
        [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        self.leftNavButton = btn;
        UIBarButtonItem *sendButtonItem=[[UIBarButtonItem alloc] initWithCustomView:self.leftNavButton];
        if([self.viewControllers lastObject])
        {
            UIViewController * vc = [self.viewControllers lastObject];
            vc.navigationItem.leftBarButtonItem = sendButtonItem;
        }
    }
    else{
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            [vc.navigationItem.leftBarButtonItem.customView setHidden:YES];
        }
    }
}


- (void )leftButtonWithImage:(UIImage *)image size:(CGSize) size action:(SEL) selector target:(id) target{
    if (image){
        self.leftNavButton = [self buttonBuilder:CGRectMake(0,0,size.width, size.height) title:nil alignment:NSTextAlignmentCenter target:(id)target action:(SEL)selector normalImage:image highlightImage:nil];
        
        UIBarButtonItem *sendButtonItem=[[UIBarButtonItem alloc] initWithCustomView:self.leftNavButton];
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            vc.navigationItem.leftBarButtonItem = sendButtonItem;
        }
    }else{
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            [vc.navigationItem.leftBarButtonItem.customView setHidden:YES];
        }
    }
}
/**
 设置左标题
 */
- (void )leftButtonWithTitle:(NSString *)title action:(SEL) selector onTarget:(id) target{
    [self leftButtonWithTitle:title titleColor:kNavigationTitleTextColor action:selector onTarget:target];
}

- (void )leftButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor action:(SEL) selector onTarget:(id) target{
    if (title){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat width = [NSString stringSizeWithFixedHeight:kFDSafeAreaTopHeight font:[UIFont systemFontOfSize:15] text:title].width;
        btn.frame = CGRectMake(0, 0, width+10, kFDSafeAreaTopHeight);
        btn.backgroundColor = [UIColor clearColor];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        self.leftNavButton = btn;
        UIBarButtonItem *sendButtonItem=[[UIBarButtonItem alloc] initWithCustomView:self.leftNavButton];
        if([self.viewControllers lastObject])
        {
            UIViewController * vc = [self.viewControllers lastObject];
            vc.navigationItem.leftBarButtonItem = sendButtonItem;
        }
    }else{
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            [vc.navigationItem.leftBarButtonItem.customView setHidden:YES] ;
        }
    }
}

- (void)leftButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)fontSize isBold:(BOOL)isBold action:(SEL) selector onTarget:(id)target{
    if (title) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIFont *font;
        if (isBold) {
            font = [UIFont boldSystemFontOfSize:fontSize];
        }else{
            font = [UIFont systemFontOfSize:fontSize];
        }
        CGFloat width = [NSString stringSizeWithFixedHeight:kFDSafeAreaTopHeight font:font text:title].width;
        btn.frame = CGRectMake(0, 0, width+10, kFDSafeAreaTopHeight);
        btn.backgroundColor = [UIColor clearColor];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
        btn.titleLabel.font = font;
        [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        self.leftNavButton = btn;
        UIBarButtonItem *sendButtonItem=[[UIBarButtonItem alloc] initWithCustomView:self.leftNavButton];
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            vc.navigationItem.leftBarButtonItem = sendButtonItem;
        }
    }else{
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            [vc.navigationItem.leftBarButtonItem.customView setHidden:YES] ;
        }
    }
}
- (void)leftButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor customFontSize:(CGFloat)fontSize isBold:(BOOL)isBold action:(SEL) selector onTarget:(id)target{
    if (title){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIFont *font;
        if (isBold) {
            font = [UIFont boldSystemFontOfSize:fontSize];
        }else{
            font = [UIFont systemFontOfSize:fontSize];
        }
        CGFloat width = [NSString stringSizeWithFixedHeight:kFDSafeAreaTopHeight font:[UIFont systemFontOfSize:15] text:title].width;
        btn.frame = CGRectMake(0, 0, width+10, kFDSafeAreaTopHeight);
        btn.backgroundColor = [UIColor clearColor];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
        btn.titleLabel.font = font;
        [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        self.leftNavButton = btn;
        UIBarButtonItem *sendButtonItem=[[UIBarButtonItem alloc] initWithCustomView:self.leftNavButton];
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            vc.navigationItem.leftBarButtonItem = sendButtonItem;
        }
    }else {
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            [vc.navigationItem.leftBarButtonItem.customView setHidden:YES] ;
        }
    }
}

- (void)leftButtonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor customFontSize:(CGFloat)fontSize isBold:(BOOL)isBold action:(SEL) selector onTarget:(id)target lineView:(BOOL)lineView{
    if (title){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIFont *font;
        if (isBold) {
            font = [UIFont boldSystemFontOfSize:fontSize];
        }else{
            font = [UIFont systemFontOfSize:fontSize];
        }
        CGFloat width = [NSString stringSizeWithFixedHeight:kFDSafeAreaTopHeight font:font text:title].width;
        btn.frame = CGRectMake(0, 0, width+10, kFDSafeAreaTopHeight-3);
        btn.backgroundColor = [UIColor clearColor];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
        if (lineView) {
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 27, kFDSafeAreaTopHeight-3, 3)];
            [btn addSubview:lineView];
            KViewRadius(lineView, 1.5);
            [lineView addGradientLayerWithStartColor:UIColor.redColor endColor:UIColor.lightGrayColor];
        }
        btn.titleLabel.font = font;
        [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        self.leftNavButton = btn;
        UIBarButtonItem *sendButtonItem=[[UIBarButtonItem alloc] initWithCustomView:self.leftNavButton];
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            vc.navigationItem.leftBarButtonItem = sendButtonItem;
        }
    }else{
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            [vc.navigationItem.leftBarButtonItem.customView setHidden:YES] ;
        }
    }
}

- (void) leftButtonWithImage:(UIImage *)image highlightImage:(UIImage *)hlImage size:(CGSize) size action:(SEL) selector target:(id) target{
    if (image){
        self.leftNavButton = [self buttonBuilder:CGRectMake(0,0,size.width, size.height) title:nil alignment:NSTextAlignmentCenter target:(id)target action:(SEL)selector normalImage:image highlightImage:hlImage];
        UIBarButtonItem *sendButtonItem=[[UIBarButtonItem alloc] initWithCustomView:self.leftNavButton];
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            vc.navigationItem.leftBarButtonItem = sendButtonItem;
        }
    }else{
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            [vc.navigationItem.leftBarButtonItem.customView setHidden:YES];
        }
    }
}

#pragma mark - right button

/**
 设置右按钮
 */

- (void )rightButtonWithTitle:(NSString *)title action:(SEL)selector onTarget:(id)target{
    [self rightButtonWithTitle:title titleColor:kNavigationTitleTextColor action:selector onTarget:target];
}

- (void )rightButtonWithTitle:(NSString *)title titleColor:(UIColor *)color action:(SEL)selector onTarget:(id)target{
    if (title){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat width = [NSString stringSizeWithFixedHeight:kFDSafeAreaTopHeight font:[UIFont systemFontOfSize:15] text:title].width;
        btn.frame = CGRectMake(0, 0, width+10, kFDSafeAreaTopHeight-3);
        
        //btn.backgroundColor = [UIColor redColor];
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:color forState:UIControlStateNormal];
        [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        self.rightNavButton = btn;
        UIBarButtonItem *sendButtonItem=[[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            vc.navigationItem.rightBarButtonItem = sendButtonItem;
        }
        
    }else{
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            [vc.navigationItem.rightBarButtonItem.customView setHidden:YES];
        }
    }
}

- (void )rightButtonWithImage:(UIImage *)image size:(CGSize) size action:(SEL) selector target:(id) target{
    if (image){
        self.rightNavButton = [self buttonBuilder:CGRectMake(0,0,size.width, size.height) title:nil alignment:NSTextAlignmentCenter target:(id)target action:(SEL)selector normalImage:image highlightImage:nil];
        
        UIBarButtonItem *sendButtonItem=[[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            vc.navigationItem.rightBarButtonItem = sendButtonItem;
        }
    }else{
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            [vc.navigationItem.rightBarButtonItem.customView setHidden:YES];
        }
    }
}

- (void )rightButtonWithImage:(UIImage *)image action:(SEL) selector onTarget:(id) target{
    if (image){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 35, 40);
        btn.backgroundColor = [UIColor clearColor];
        [btn setImage:image forState:UIControlStateNormal];
        [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        self.rightNavButton = btn;
        UIBarButtonItem *sendButtonItem=[[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            vc.navigationItem.rightBarButtonItem = sendButtonItem;
        }
    } else{
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            [vc.navigationItem.rightBarButtonItem.customView setHidden:YES] ;
        }
    }
}

- (void) rightButtonWithImage:(UIImage *)image highlightImage:(UIImage *)hlImage size:(CGSize) size action:(SEL) selector target:(id) target{
    if (image){
        self.rightNavButton = [self buttonBuilder:CGRectMake(0,0,size.width, size.height) title:nil alignment:NSTextAlignmentCenter target:(id)target action:(SEL)selector normalImage:image highlightImage:hlImage];
        
        UIBarButtonItem *sendButtonItem=[[UIBarButtonItem alloc] initWithCustomView:self.rightNavButton];
        
        if([self.viewControllers lastObject])
        {
            UIViewController * vc = [self.viewControllers lastObject];
            vc.navigationItem.rightBarButtonItem = sendButtonItem;
        }
    }else{
        if([self.viewControllers lastObject]){
            UIViewController * vc = [self.viewControllers lastObject];
            [vc.navigationItem.rightBarButtonItem.customView setHidden:YES];
        }
    }
}


- (UIButton *)buttonBuilder:(CGRect)frame title:title alignment:(NSTextAlignment) alignment target:(id)target action:(SEL)action normalImage:(UIImage*)normalImage highlightImage:(UIImage*)highlightImage{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont systemFontOfSize:18];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button setBackgroundImage:normalImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    if (title && [title length] > 0){
        UILabel *lbl = [[UILabel alloc] init];
        lbl.frame = button.bounds;
        lbl.backgroundColor = [UIColor clearColor];
        lbl.textAlignment = alignment;
        lbl.font = [UIFont systemFontOfSize:20];
        lbl.textColor = [UIColor whiteColor];
        lbl.text = title;
        [button addSubview:lbl];
    }
    return button;
}

@end
