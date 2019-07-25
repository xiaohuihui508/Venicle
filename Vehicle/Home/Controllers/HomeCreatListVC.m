//
//  HomeCreatListVC.m
//  Vehicle
//
//  Created by Darcy on 2019/7/25.
//  Copyright © 2019 CY. All rights reserved.
//

#import "HomeCreatListVC.h"
#import "CreatListBottomView.h"


@interface HomeCreatListVC ()

@property (nonatomic, strong) CreatListBottomView *listView;

@end

@implementation HomeCreatListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [Language getText:@"Task Info"];
    
    self.listView = [[CreatListBottomView alloc] init];
    _listView.confirView.hidden = YES;
    _listView.conAndDeleView.hidden = NO;
    [self.view addSubview:_listView];
    [_listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(0);
        make.bottom.equalTo(-50);
        make.height.equalTo(50);
    }];
    
    [self.listView.confirView tapAction:^NSString * _Nullable{
        NSLog(@"点击单独的");
        return @"单独点击";
    }];
    
    [self.listView.deleteBtn tapAction:^NSString * _Nullable{
        NSLog(@"点击删除按钮");
        return @"点击删除按钮";
    }];
    
    [self.listView.confirBtn tapAction:^NSString * _Nullable{
        NSLog(@"点击确认");
        return @"点击确认";
    }];
    
    
}


@end
