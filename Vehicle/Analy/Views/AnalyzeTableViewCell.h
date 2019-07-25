//
//  AnalyzeTableViewCell.h
//  Vehicle
//
//  Created by Darcy on 2019/7/25.
//  Copyright © 2019 CY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnalyzeTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLB;

@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;

@property (nonatomic, strong) UIView *lineView;

@end

NS_ASSUME_NONNULL_END
