//
//  TwoSumController.m
//  LeetcodeDemo
//
//  Created by apple on 2020/11/18.
//

#import "TwoSumController.h"


@interface TwoSumController ()
@property (nonatomic, strong) UIButton *lookButton;

@end

@implementation TwoSumController

#if DEBUG
- (void)dealloc {
    NSLog(@"[%@ dealloc]", NSStringFromClass(self.class));
}
#endif

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [self.argDict valueForKey:@"navTitle"];
    [self commonInit];
    [self addEventAction];
}

#pragma mark - initial Methods
- (void)commonInit {
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubViews];
    [self addSubViewConstraints];
}

#pragma mark - add subview
- (void)addSubViews {
    [self.view addSubview:self.lookButton];
}

#pragma mark - layout
- (void)addSubViewConstraints {
    [self.lookButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(50);
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(45);
    }];
}

#pragma mark - event action
- (void)addEventAction {
    NSInteger numer =  [self twoSumWithNum1:28 num2:6];
    NSLog(@"---:%ld",numer);
}
/*
    1.不考虑进位，分别对各位数进行相加，结果为sum;
    2.只考虑进位，结果为carry;
    3.如果步骤2所得进位结果carry不为0，对步骤1所得sum，步骤2所得carry重复步骤1、 2、3；如果carry为0则结束，最终结果为步骤1所得sum;
 */

- (NSInteger )twoSumWithNum1:(NSInteger)num1 num2:(NSInteger)num2{
    if(num1==0){
        return num2;
    }
    if(num2==0){
        return num1;
    }
    NSInteger sum = num1 ^ num2;
    NSLog(@"-sum-:%ld",sum);
    NSInteger carry = (num1 & num2) << 1;
    NSLog(@"-carry-:%ld",carry);
    return [self twoSumWithNum1:sum num2:carry];
}

#pragma mark -  Event Response
- (void)lookButtonTouchUpInside:(UIButton *)sender{
    
}

- (UIButton *)lookButton {
    if (!_lookButton) {
        _lookButton = UIButton.initButton(UIButtonTypeCustom).fdTitles(@"查看").fdTitlesColor(UIColor.blackColor).fdBackColor(UIColor.clearColor).fdFont(14);
        _lookButton.layer.cornerRadius = 13;
        _lookButton.layer.borderWidth = 1;
        [_lookButton addTarget:self action:@selector(lookButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lookButton;
}


@end
