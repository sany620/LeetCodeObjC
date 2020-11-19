//
//  AverageSpacingButtonView.m
//  BuildGuard
//
//  Created by freedo on 2019/2/21.
//  Copyright © 2019年 com.ddg. All rights reserved.
//

#import "AverageSpacingButtonView.h"
#import "UIButton+ImageTitleSpacing.h"
#import "AverageBtModel.h"


@interface AverageSpacingButtonView ()
@property (nonatomic, strong) UIStackView *buttonStackView;
/**
 * 删除重新布局
 */
-(void)removeAction;
@end
@implementation AverageSpacingButtonView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.whiteColor;
        [self setBaseUI];
    }
    return self;
}
-(void)setBaseUI{
    [self addSubview:self.buttonStackView];
    [self.buttonStackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(7);;
        make.left.mas_equalTo(self.mas_left).offset(13);
        make.right.mas_equalTo(self.mas_right).offset(-13);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-7);
    }];
}

#pragma mark setter
-(void)setButtonAxial:(NSInteger)buttonAxial{
    _buttonAxial = buttonAxial;
    self.buttonStackView.axis = buttonAxial;
}

-(void)setHorizontalSpacing:(CGFloat)horizontalSpacing{
    _horizontalSpacing = horizontalSpacing;
    self.buttonStackView.spacing = horizontalSpacing;
}

-(void)setVerticalSpacing:(CGFloat)verticalSpacing{
    _verticalSpacing = verticalSpacing;
    self.buttonStackView.spacing = verticalSpacing;
}

-(void)setTitleArray:(NSArray<NSDictionary*> *)titleArray{
    _titleArray = titleArray;
    [self removeAction];
    for (NSInteger idx = 0; idx < titleArray.count; idx++) {
        AverageBtModel *btModel = [AverageBtModel mj_objectWithKeyValues:(NSDictionary *)titleArray[idx]];
        UIButton *bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
        bottomButton.tag = 2000+idx;
        [bottomButton setBackgroundColor:[UIColor colorWithHexColorString:btModel.bgColorHex]];
        [bottomButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
        [bottomButton setTitle:btModel.titleName forState:UIControlStateNormal];
        [bottomButton setTitle:btModel.titleName forState:UIControlStateHighlighted];
        [bottomButton setTitleColor:[UIColor colorWithHexColorString:btModel.titleColorHex] forState:UIControlStateNormal];
        [bottomButton setTitleColor:[UIColor colorWithHexColorString:btModel.titleColorHex] forState:UIControlStateHighlighted];
        if (![NSString isBlankString:btModel.buttonRadius]) {
            bottomButton.layer.cornerRadius = [[NSNumber numberWithString:btModel.buttonRadius] doubleValue];
        }
        if (![NSString isBlankString:btModel.borderColor]) {
            bottomButton.layer.borderWidth = 1;
            bottomButton.layer.borderColor = [UIColor colorWithHexColorString:btModel.borderColor].CGColor;
        }
        [bottomButton addTarget:self action:@selector(clickEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttonStackView addArrangedSubview:bottomButton];
    }
}

#pragma mark 按钮事件
-(void)clickEvent:(id)sender{
    UIButton *button = (UIButton *)sender;
    if (self.averageSpacingButtonEventBlock) {
        self.averageSpacingButtonEventBlock(button.tag - 2000, button.titleLabel.text);
    }
}

-(void)removeAction{
    NSArray< UIView *> *viewArray = self.buttonStackView.arrangedSubviews;
    if (![NSArray isBlankArray:viewArray]) {
        for (UIView *starView in viewArray) {
            [self.buttonStackView removeArrangedSubview:starView];
            [starView removeFromSuperview];
        }
        [UIView animateWithDuration:0.25 animations:^{
            
            [self.buttonStackView layoutIfNeeded];
        }];
    }
}
#pragma mark 懒加载
- (UIStackView *)buttonStackView{
    if (!_buttonStackView) {
        _buttonStackView = [[UIStackView alloc] init];
        _buttonStackView.backgroundColor = UIColor.whiteColor;
        _buttonStackView.axis = UILayoutConstraintAxisHorizontal;
        _buttonStackView.alignment = UIStackViewAlignmentFill;
        _buttonStackView.distribution = UIStackViewDistributionFillEqually;
        _buttonStackView.spacing = 6;
    }
    return _buttonStackView;
}

@end
