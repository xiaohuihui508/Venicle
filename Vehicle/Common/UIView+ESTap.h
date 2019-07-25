//
//  UIView+ESTap.h
//  Vehicle
//
//  Created by Darcy on 2019/7/24.
//  Copyright © 2019 CY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString* _Nullable (^TapAction)(void);

@interface UIView (ESTap)

- (void)tapAction:(TapAction)block;

@end

NS_ASSUME_NONNULL_END
