//
//  AnalyListCell.m
//  Vehicle
//
//  Created by Darcy on 2019/7/25.
//  Copyright © 2019 CY. All rights reserved.
//

#import "AnalyListCell.h"

@implementation AnalyListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = kBottomColor;
        
        [self colorImg];
        [self nameLB];
        
    }
    return self;
}

- (UIImageView *)colorImg {
    if (!_colorImg) {
        _colorImg = [[UIImageView alloc] init];
        _colorImg.layer.cornerRadius = 5.f;
        _colorImg.layer.masksToBounds = YES;
        [self.contentView addSubview:_colorImg];
        [_colorImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.centerY.equalTo(0);
            make.width.height.equalTo(10);
        }];
        
    }
    return _colorImg;
}

- (UILabel *)nameLB {
    if (!_nameLB) {
        _nameLB = [[UILabel alloc] init];
        _nameLB.textColor = kBlackColor;
        _nameLB.font = [UIFont systemFontOfSize:11];
        _nameLB.text = @"2019";
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.colorImg.mas_right).offset(6);
            make.right.equalTo(0);
            make.centerY.equalTo(0);
            make.height.equalTo(14);
        }];
    }
    return _nameLB;
}
@end
