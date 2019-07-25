//
//  UIView+ESTap.m
//  Vehicle
//
//  Created by Darcy on 2019/7/24.
//  Copyright © 2019 CY. All rights reserved.
//

#import "UIView+ESTap.h"

@implementation UIView (ESTap)

- (void)tapAction:(TapAction)block {
    
    self.userInteractionEnabled = YES;
    
    UIButton *btn = [UIButton new];
    [self addSubview:btn];
    btn.backgroundColor = [UIColor clearColor];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        if (block) {
            block();
        }
    }];
    
}

@end
