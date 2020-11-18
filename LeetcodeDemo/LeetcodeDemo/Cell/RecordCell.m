//
//  RecordCell.m
//  LeetcodeDemo
//
//  Created by apple on 2020/11/18.
//

#import "RecordCell.h"


@interface RecordCell ()

/// icon
@property (nonatomic, strong) UIImageView *iconImgView;

/// 名字
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation RecordCell

#if DEBUG
- (void)dealloc {
    NSLog(@"[%@ dealloc]", NSStringFromClass(self.class));
}
#endif

#pragma mark - life cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self commonInit];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self commonInit];
}

#pragma mark - initial Methods
- (void)commonInit {
    /*custom view u want draw in here*/
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self addSubViews];
    [self addSubViewConstraints];
}

#pragma mark - add subview
- (void)addSubViews {
    [self.contentView addSubview:self.iconImgView];
    [self.contentView addSubview:self.nameLabel];
}

#pragma mark - layout
- (void)addSubViewConstraints {
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(15);
        make.left.mas_equalTo(self.contentView.mas_left).offset(10);
        make.width.height.mas_equalTo(30);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.iconImgView);
        make.left.mas_equalTo(self.iconImgView.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
        make.height.mas_lessThanOrEqualTo(30);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-15);
    }];
}

#pragma mark - private method

#pragma mark - public method
- (void)setRecordData:(RecordVal *)recordData{
    _recordData = recordData;
    self.nameLabel.text = recordData.name;
}
#pragma mark - getters and setters

- (UIImageView *)iconImgView{
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.image = [UIImage imageNamed:@"point_icon"];
    }
    return _iconImgView;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = UILabel.initLabel.fdFont(16).fdTextColor(UIColor.blackColor).fdTextAlignment(NSTextAlignmentLeft);
    }
    return _nameLabel;
}

@end
