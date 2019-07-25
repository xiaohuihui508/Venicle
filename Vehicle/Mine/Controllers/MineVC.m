//
//  MineVC.m
//  Vehicle
//
//  Created by Darcy on 2019/7/24.
//  Copyright © 2019 CY. All rights reserved.
//

#import "MineVC.h"
#import "MineTableViewCell.h"
#import "MineHeaderView.h"


@interface MineVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MineHeaderView *headerView;

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation MineVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setInsetNoneWithScrollerView:self.tableView];
    self.titleArray = @[@"Position", @"App Version"];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineTableViewCell"];
    cell.nameLB.text = self.titleArray[indexPath.row];
    if (indexPath.row == 0) {
        cell.subNameLB.text = @"Admin";
    } else {
        NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
        NSString *str = [NSString stringWithFormat:@"V%@", [infoDict objectForKey:@"CFBundleShortVersionString"]];
        cell.subNameLB.text = str;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 53;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = kBottomColor;
        _tableView.tableFooterView = [UIView new];
        self.headerView = [[MineHeaderView alloc] initWithFrame:CGRectMake(0, 0, mScreenWidth, 0.62*mScreenWidth)];
        self.tableView.tableHeaderView = self.headerView;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
        //注册cell
        [_tableView registerClass:[MineTableViewCell class] forCellReuseIdentifier:@"MineTableViewCell"];
        
    }
    return _tableView;
}


@end
