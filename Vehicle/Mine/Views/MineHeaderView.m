//
//  MineHeaderView.m
//  Vehicle
//
//  Created by Darcy on 2019/7/24.
//  Copyright © 2019 CY. All rights reserved.
//

#import "MineHeaderView.h"

@implementation MineHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = mHexColor(0xEF5043);
        
        [self headerImg];
        [self nameLB];
        [self titleLB];
        
    }
    return self;
}

- (UIImageView *)headerImg {
    if (!_headerImg) {
        _headerImg = [[UIImageView alloc] init];
        _headerImg.image = [UIImage imageNamed:@"defaultavatar"];
        [self addSubview:_headerImg];
        [_headerImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
            make.width.height.equalTo(90);
        }];
    }
    return _headerImg;
}

- (UILabel *)nameLB {
    if (!_nameLB) {
        _nameLB = [[UILabel alloc] init];
        _nameLB.font = [UIFont systemFontOfSize:18];
        _nameLB.textColor = kWhiteColor;
        _nameLB.text = @"詹姆斯";
        _nameLB.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(self.headerImg.mas_bottom).offset(10);
            make.height.equalTo(18);
        }];
    }
    return _nameLB;
}

- (UILabel *)titleLB {
    if (!_titleLB) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [UIFont systemFontOfSize:18];
        _titleLB.textColor = kWhiteColor;
        _titleLB.text = @"(Darcy)";
        _titleLB.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(self.nameLB.mas_bottom).offset(5);
            make.height.equalTo(18);
        }];
    }
    return _titleLB;
}

@end
