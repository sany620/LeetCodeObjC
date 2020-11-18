//
//  ViewController.m
//  LeetcodeDemo
//
//  Created by apple on 2020/11/18.
//

#import "ViewController.h"
#import "RecordCell.h"
#import "RecordModel.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) FDTableViewManage *tableManage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"code";
    [self addSubViews];
    [self addMocktData];
    // Do any additional setup after loading the view.
}

#pragma mark - add subview
- (void)addSubViews {
    self.tableView = [self creatFDTableViewWithStyle:UITableViewStyleGrouped];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
    self.tableManage = [[FDTableViewManage alloc] initTableViewManage:self.tableView];
    [self.tableManage registerCellWithClass:[RecordCell class]];
}
#pragma mark - 模拟数据
-(void)addMocktData{
    NSDictionary *responseObject = [NSBundle dictWithJson:@"data_js"];
    RecordModel *recordModel = [RecordModel mj_objectWithKeyValues:responseObject];
    [self addItemWithDataSource:recordModel.val];
}

#pragma mark 添加item到section
- (void)addItemWithDataSource:(NSArray <RecordVal *>*)dataSource{
    [dataSource enumerateObjectsUsingBlock:^(RecordVal *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         FDSection *section = [FDSection section];
        FDItem *item = [[FDItem alloc] initWithData:obj cellClass:[RecordCell class]];
        item.rowHeight = UITableViewAutomaticDimension;
        [item setCellConfiguration:^(__kindof FDTableViewManage *tableVieManager, NSIndexPath *indexPath, __kindof RecordCell *cell, __kindof FDItem *item) {
            cell.recordData = obj;
        }];
        section.heightForFooter = ^CGFloat(NSInteger section) {
            return 13;
        };
        section.heightForHeader= ^CGFloat(NSInteger section) {
            return CGFLOAT_MIN;
        };
        [item setDidSelectRow:^(__kindof FDTableViewManage *tableVieManager, NSIndexPath *indexPath, __kindof FDItem *item) {
            [RouterManager pushViewClassName:obj.viewName options:nil];
        }];
        [section addItem:item];
        [self.tableManage addSection:section];
    }];
    [self.tableManage.tableView reloadData];
}

@end
