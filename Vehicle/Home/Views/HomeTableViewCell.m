//
//  HomeTableViewCell.m
//  Vehicle
//
//  Created by Darcy on 2019/7/24.
//  Copyright © 2019 CY. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        
        [self leftBrandLB];
        [self rightBrandLB];
        
        [self leftModelLB];
        [self rightModelLB];
        
        [self leftYearLB];
        [self rightYearLB];
        
        [self leftDataLB];
        [self rightDataLB];
        
        [self leftStatusLB];
        [self rightStatusLB];
        
        [self arrowImg];
        
        [self lineView];
        
        
    }
    return self;
}

- (UILabel *)leftBrandLB {
    if (!_leftBrandLB) {
        _leftBrandLB = [[UILabel alloc] init];
        _leftBrandLB.font = kFont14;
        _leftBrandLB.textColor = kSubTitleColor;
        _leftBrandLB.text = [NSString stringWithFormat:@"%@:", [Language getText:@"Brand"]];
        [self.contentView addSubview:_leftBrandLB];
        [_leftBrandLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.top.equalTo(13);
            make.height.equalTo(14);
            make.width.equalTo(93);
        }];
    }
    return _leftBrandLB;
}

- (UILabel *)rightBrandLB {
    if (!_rightBrandLB) {
        _rightBrandLB = [[UILabel alloc] init];
        _rightBrandLB.font = kFont14;
        _rightBrandLB.textColor = kBlackColor;
        _rightBrandLB.text = @"Cadillac";
        [self.contentView addSubview:_rightBrandLB];
        [_rightBrandLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(108);
            make.top.equalTo(self.leftBrandLB.mas_top);
            make.height.equalTo(14);
            make.right.equalTo(-25);
        }];
    }
    return _rightBrandLB;
}

- (UILabel *)leftModelLB {
    if (!_leftModelLB) {
        _leftModelLB = [[UILabel alloc] init];
        _leftModelLB.font = kFont14;
        _leftModelLB.textColor = kSubTitleColor;
        _leftModelLB.text = [NSString stringWithFormat:@"%@:", [Language getText:@"Model"]];
        [self.contentView addSubview:_leftModelLB];
        [_leftModelLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftBrandLB.mas_left);
            make.top.equalTo(self.leftBrandLB.mas_bottom).offset(8);
            make.height.equalTo(self.leftBrandLB.mas_height);
            make.width.equalTo(self.leftBrandLB.mas_width);
        }];
    }
    return _leftModelLB;
}

- (UILabel *)rightModelLB {
    if (!_rightModelLB) {
        _rightModelLB = [[UILabel alloc] init];
        _rightModelLB.font = kFont14;
        _rightModelLB.textColor = kBlackColor;
        _rightModelLB.text = @"XTS";
        [self.contentView addSubview:_rightModelLB];
        [_rightModelLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.rightBrandLB.mas_left);
            make.top.equalTo(self.leftModelLB.mas_top);
            make.height.equalTo(self.rightBrandLB.mas_height);
            make.right.equalTo(self.rightBrandLB.mas_right);
        }];
    }
    return _rightModelLB;
}

- (UILabel *)leftYearLB {
    if (!_leftYearLB) {
        _leftYearLB = [[UILabel alloc] init];
        _leftYearLB.font = kFont14;
        _leftYearLB.textColor = kSubTitleColor;
        _leftYearLB.text = [NSString stringWithFormat:@"%@:",[Language getText:@"Model Year"]];
        [self.contentView addSubview:_leftYearLB];
        [_leftYearLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftModelLB.mas_left);
            make.top.equalTo(self.leftModelLB.mas_bottom).offset(8);
            make.height.equalTo(self.leftModelLB.mas_height);
            make.width.equalTo(self.leftModelLB.mas_width);
        }];
    }
    return _leftYearLB;
}

- (UILabel *)rightYearLB {
    if (!_rightYearLB) {
        _rightYearLB = [[UILabel alloc] init];
        _rightYearLB.font = kFont14;
        _rightYearLB.textColor = kBlackColor;
        _rightYearLB.text = @"2018";
        [self.contentView addSubview:_rightYearLB];
        [_rightYearLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.rightBrandLB.mas_left);
            make.top.equalTo(self.leftYearLB.mas_top);
            make.height.equalTo(self.rightBrandLB.mas_height);
            make.right.equalTo(self.rightBrandLB.mas_right);
        }];
    }
    return _rightYearLB;
}

- (UILabel *)leftDataLB {
    if (!_leftDataLB) {
        _leftDataLB = [[UILabel alloc] init];
        _leftDataLB.font = kFont14;
        _leftDataLB.textColor = kSubTitleColor;
        _leftDataLB.text = [NSString stringWithFormat:@"%@:",[Language getText:@"Date"]];
        [self.contentView addSubview:_leftDataLB];
        [_leftDataLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftYearLB.mas_left);
            make.top.equalTo(self.leftYearLB.mas_bottom).offset(8);
            make.height.equalTo(self.leftYearLB.mas_height);
            make.width.equalTo(self.leftYearLB.mas_width);
        }];
    }
    return _leftDataLB;
}

- (UILabel *)rightDataLB {
    if (!_rightDataLB) {
        _rightDataLB = [[UILabel alloc] init];
        _rightDataLB.font = kFont14;
        _rightDataLB.textColor = kBlackColor;
        _rightDataLB.text = @"2019-07-07 to 2019-07-11";
        [self.contentView addSubview:_rightDataLB];
        [_rightDataLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.rightBrandLB.mas_left);
            make.top.equalTo(self.leftDataLB.mas_top);
            make.height.equalTo(self.rightBrandLB.mas_height);
            make.right.equalTo(self.rightBrandLB.mas_right);
        }];
    }
    return _rightDataLB;
}

- (UILabel *)leftStatusLB {
    if (!_leftStatusLB) {
        _leftStatusLB = [[UILabel alloc] init];
        _leftStatusLB.font = kFont14;
        _leftStatusLB.textColor = kSubTitleColor;
        _leftStatusLB.text = [NSString stringWithFormat:@"%@:", [Language getText:@"Status"]];
        [self.contentView addSubview:_leftStatusLB];
        [_leftStatusLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftDataLB.mas_left);
            make.top.equalTo(self.leftDataLB.mas_bottom).offset(8);
            make.height.equalTo(self.leftDataLB.mas_height);
            make.width.equalTo(self.leftDataLB.mas_width);
        }];
    }
    return _leftStatusLB;
}

- (UILabel *)rightStatusLB {
    if (!_rightStatusLB) {
        _rightStatusLB = [[UILabel alloc] init];
        _rightStatusLB.font = kFont14;
        _rightStatusLB.textColor = kConfigColor;
        _rightStatusLB.text = @"Processing";
        [self.contentView addSubview:_rightStatusLB];
        [_rightStatusLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.rightBrandLB.mas_left);
            make.top.equalTo(self.leftStatusLB.mas_top);
            make.height.equalTo(self.rightBrandLB.mas_height);
            make.right.equalTo(self.rightBrandLB.mas_right);
        }];
    }
    return _rightStatusLB;
}

- (UIImageView *)arrowImg {
    if (!_arrowImg) {
        _arrowImg = [[UIImageView alloc] init];
        _arrowImg.contentMode = UIViewContentModeScaleAspectFill;
        _arrowImg.image = [UIImage imageNamed:@"right_arrows"];
        [self.contentView addSubview:_arrowImg];
        [_arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-15);
            make.width.equalTo(8);
            make.height.equalTo(13);
        }];
    }
    return _arrowImg;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = mHexColorAlpha(0xCFD0D6, 0.7);
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.height.equalTo(1);
            make.top.equalTo(128);
        }];
        
    }
    return _lineView;
}


@end
