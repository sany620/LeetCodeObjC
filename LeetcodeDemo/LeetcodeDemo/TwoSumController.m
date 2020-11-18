//
//  TwoSumController.m
//  LeetcodeDemo
//
//  Created by apple on 2020/11/18.
//

#import "TwoSumController.h"


@interface TwoSumController ()

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

}

#pragma mark - layout
- (void)addSubViewConstraints {
    
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


@end
