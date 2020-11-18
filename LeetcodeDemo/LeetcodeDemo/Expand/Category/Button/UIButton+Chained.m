//
//  UIButton+Chained.m
//  Chained
//
//  Created by 飞渡 on 2019/7/1.
//  Copyright © 2019 freedo. All rights reserved.
//

#import "UIButton+Chained.h"
#import <objc/runtime.h>

static const NSString *buttonActionKey = @"buttonActionKey";

typedef void(^ButtonAction)(UIButton *button);

@interface UIButton ()

@property (nonatomic, copy)ButtonAction action;

@end
@implementation UIButton (Chained)

+ (__kindof UIButton *(^)(UIButtonType buttonType))initButton{
    
    return ^(UIButtonType buttonType){
        
        return [self buttonWithType:buttonType];
    };
}

- (__kindof UIButton *(^)(CGRect rect))fdRect{
    
    return ^(CGRect rect){
        self.frame = rect;
        return self;
    };
}
                
- (__kindof UIButton *(^)(NSString *title,UIControlState state))fdTitle{
    return ^(NSString *title,UIControlState state){
        [self setTitle:title forState:state];
        return self;
    };
}

- (__kindof UIButton *(^)(NSString *title))fdTitles{
    return ^(NSString *title){
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

- (__kindof UIButton *(^)(UIColor *color))fdBackColor{
    
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (__kindof UIButton *(^)(UIImage *image,UIControlState state))fdImage{
    
    return ^(UIImage *image,UIControlState state){
        [self setImage:image forState:state];
        return self;
    };
}

- (__kindof UIButton *(^)(NSString *imageName))fdImageName{
    return  ^(NSString *imageName){
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return self;
    };
}

- (__kindof UIButton *(^)(UIColor *color,UIControlState state))fdTitleColor{
    return  ^(UIColor *color,UIControlState state){
           [self setTitleColor:color forState:state];
        return self;
    };
}

- (__kindof UIButton *(^)(UIColor *color))fdTitlesColor{
    return  ^(UIColor *color){
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}

- (__kindof UIButton *(^)(NSString *imageName))fdBackgroundImageName{
    return  ^(NSString *imageName){
        [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return self;
    };
}

- (__kindof UIButton *(^)(UIImage *_Nullable image,UIControlState state))fdBackgroundImage{
    return  ^(UIImage *image,UIControlState state){
        [self setBackgroundImage:image forState:state];
        return self;
    };
}

- (__kindof UIButton *(^)(CGFloat fontSize))fdFont{
    
    return ^(CGFloat fontSize){
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

- (__kindof UIButton *(^)(SEL action,UIControlEvents controlEvents))addTargetAction{
    return ^(SEL action,UIControlEvents controlEvents){
        [self addTarget:self action:action forControlEvents:controlEvents];
        return self;
    };
}

- (__kindof UIButton *(^)(CGFloat radius))fdRadius{
    return ^(CGFloat radius){
        [self.layer setCornerRadius:radius];
        [self.layer setMasksToBounds:YES];
        return self;
    };
}

- (__kindof UIButton *(^)(CGFloat width, UIColor *color,CGFloat radius))fdRadiusOrBorder{
    return ^(CGFloat width, UIColor *color,CGFloat radius){
        [self.layer setBorderWidth:width];
        [self.layer setBorderColor:color.CGColor];
        [self.layer setCornerRadius:radius];
        [self.layer setMasksToBounds:YES];
        return self;
    };
}


- (void)fdAddTargetAction:(UIControlEvents)controlEvents buttonAction:(void(^)(UIButton *button))action{
    self.action  = action;
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:controlEvents];
}

- (void)buttonAction:(UIButton *)button{
    if (self.action) {
        self.action(button);
    }
}

- (void)setAction:(ButtonAction)action{
    
     objc_setAssociatedObject(self, &buttonActionKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (ButtonAction)action{
    
    return objc_getAssociatedObject(self, &buttonActionKey);
}

@end
