//
//  CreatListBottomView.m
//  Vehicle
//
//  Created by Darcy on 2019/7/25.
//  Copyright © 2019 CY. All rights reserved.
//

#import "CreatListBottomView.h"

@implementation CreatListBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self confirView];
        [self conAndDeleView];
        
    }
    return self;
}

- (UIView *)confirView {
    if (!_confirView) {
        _confirView = [[UIView alloc] init];
//        _confirView.backgroundColor = [UIColor greenColor];
        [self addSubview:_confirView];
        [_confirView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
        UIButton *confirBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        confirBtn.layer.cornerRadius = 4;
        confirBtn.layer.masksToBounds = YES;
        confirBtn.backgroundColor = kConfigColor;
        confirBtn.titleLabel.font = kFont17;
        [confirBtn setTitle:[Language getText:@"Confirm"] forState:0];
        [confirBtn setTitleColor:kWhiteColor forState:0];
        [_confirView addSubview:confirBtn];
        [confirBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(25);
            make.right.equalTo(-25);
            make.height.equalTo(40);
        }];
        
    }
    return _confirView;
}

- (UIView *)conAndDeleView {
    if (!_conAndDeleView) {
        _conAndDeleView = [[UIView alloc] init];
//        _conAndDeleView.backgroundColor = [UIColor cyanColor];
        [self addSubview:_conAndDeleView];
        [_conAndDeleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
        self.deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteBtn.titleLabel.font = kFont17;
        [_deleteBtn setTitle:[Language getText:@"Delete"] forState:0];
        [_deleteBtn setTitleColor:kBlackColor forState:0];
        _deleteBtn.layer.cornerRadius = 4;
        _deleteBtn.layer.masksToBounds = YES;
        _deleteBtn.layer.borderColor = kBlackColor.CGColor;
        _deleteBtn.layer.borderWidth = 1.f;
        _deleteBtn.backgroundColor = kWhiteColor;
        [_conAndDeleView addSubview:_deleteBtn];
        [_deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.height.equalTo(40);
            make.left.equalTo(25);
            make.width.equalTo(mScreenWidth/2-50);
        }];
        
        self.confirBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirBtn.titleLabel.font = kFont17;
        [_confirBtn setTitle:[Language getText:@"Confirm"] forState:0];
        [_confirBtn setTitleColor:kWhiteColor forState:0];
        _confirBtn.layer.cornerRadius = 4;
        _confirBtn.layer.masksToBounds = YES;
        _confirBtn.backgroundColor = kConfigColor;
        [_conAndDeleView addSubview:_confirBtn];
        [_confirBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.height.equalTo(40);
            make.right.equalTo(-25);
            make.width.equalTo(mScreenWidth/2-50);
        }];
        
        
    }
    return _conAndDeleView;
}

@end
