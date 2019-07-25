//
//  HomeTableViewCell.h
//  Vehicle
//
//  Created by Darcy on 2019/7/24.
//  Copyright © 2019 CY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *leftBrandLB;
@property (nonatomic, strong) UILabel *rightBrandLB;

@property (nonatomic, strong) UILabel *leftModelLB;
@property (nonatomic, strong) UILabel *rightModelLB;

@property (nonatomic, strong) UILabel *leftYearLB;
@property (nonatomic, strong) UILabel *rightYearLB;

@property (nonatomic, strong) UILabel *leftDataLB;
@property (nonatomic, strong) UILabel *rightDataLB;

@property (nonatomic, strong) UILabel *leftStatusLB;
@property (nonatomic, strong) UILabel *rightStatusLB;

@property (nonatomic, strong) UIImageView *arrowImg;

@property (nonatomic, strong) UIView *lineView;

@end

NS_ASSUME_NONNULL_END
