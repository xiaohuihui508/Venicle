//
//  UIViewController+Common.m
//  Vehicle
//
//  Created by Darcy on 2019/7/24.
//  Copyright © 2019 CY. All rights reserved.
//

#import "UIViewController+Common.h"

@implementation UIViewController (Common)

- (void)setInsetNoneWithScrollerView:(UIScrollView *)scrollView {
    
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;  //UIScrollView也适用
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

@end
