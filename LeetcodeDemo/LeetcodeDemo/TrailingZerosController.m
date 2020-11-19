//
//  TrailingZerosController.m
//  LeetcodeDemo
//
//  Created by apple on 2020/11/19.
//

#import "TrailingZerosController.h"

/* System */

/* ViewController */

/* View */

/* Model */

/* Util */

/* NetWork InterFace */

/* Vender */

@interface TrailingZerosController ()

@end

@implementation TrailingZerosController

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

}

#pragma mark - layout
- (void)addSubViewConstraints {

}

#pragma mark - event action
- (void)addEventAction {

}

#pragma mark - private method


#pragma mark - public Method

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate
//...(多个代理方法依次往下写)

#pragma mark - getters and setters

@end
