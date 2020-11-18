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
    NSInteger numer =  [self twoSumWithNum1:28 num2:6];
    NSLog(@"---:%ld",numer);
}

#pragma mark - event action
- (void)addEventAction {

}

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
