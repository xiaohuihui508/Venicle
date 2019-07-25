//
//  MineTableViewCell.m
//  Vehicle
//
//  Created by Darcy on 2019/7/24.
//  Copyright © 2019 CY. All rights reserved.
//

#import "MineTableViewCell.h"

@implementation MineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        
        [self nameLB];
        [self subNameLB];
        [self lineView];
        
    }
    return self;
}

- (UILabel *)nameLB {
    if (!_nameLB) {
        _nameLB = [[UILabel alloc] init];
        _nameLB.font = kFont14;
        _nameLB.textColor = kSubTitleColor;
//        _nameLB.text = @"Position";
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.centerY.equalTo(0);
            make.top.bottom.equalTo(0);
        }];
    }
    return _nameLB;
}

- (UILabel *)subNameLB {
    if (!_subNameLB) {
        _subNameLB = [[UILabel alloc] init];
        _subNameLB.font = kFont14;
        _subNameLB.textColor = kBlackColor;
//        _subNameLB.text = @"Admin";
        [self.contentView addSubview:_subNameLB];
        [_subNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-15);
            make.centerY.equalTo(0);
            make.top.bottom.equalTo(0);
        }];
    }
    return _subNameLB;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = mHexColorAlpha(0xCFD0D6, 0.7);
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.height.equalTo(1);
            make.top.equalTo(52);
        }];
        
    }
    return _lineView;
}

@end
