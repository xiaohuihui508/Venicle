//
//  AnalyzeHeaderView.m
//  Vehicle
//
//  Created by Darcy on 2019/7/25.
//  Copyright © 2019 CY. All rights reserved.
//

#import "AnalyzeHeaderView.h"

@implementation AnalyzeHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self headerLB];
        
    }
    return self;
}

- (UILabel *)headerLB {
    if (!_headerLB) {
        _headerLB = [[UILabel alloc] init];
        _headerLB.textColor = kSubTitleColor;
        _headerLB.font = kFont12;
        NSString *priceStr = @"258 Car in System, Input Feature info to Analysis";
        NSMutableAttributedString *attrPrice = [[NSMutableAttributedString alloc] initWithString:priceStr];
        /** 找到Car在字符串中的起始位置 即为待处理的字符串的末端位置*/
        NSUInteger endLocation = [priceStr rangeOfString:@"Car"].location;
        /** 确定待处理的字符串的范围位置*/
        NSRange range = NSMakeRange(0, endLocation);
        /** 利用NSMutableAttributeString的方法设置待处理字符串的字体*/
        [attrPrice addAttribute:NSFontAttributeName value:kFont15 range:range];
        [attrPrice addAttribute:NSForegroundColorAttributeName value:kConfigColor range:range];
        _headerLB.attributedText = attrPrice;
        _headerLB.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_headerLB];
        [_headerLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.right.equalTo(0);
            make.height.equalTo(30);
        }];
    }
    return _headerLB;
}

@end
