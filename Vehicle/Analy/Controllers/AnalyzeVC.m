//
//  AnalyzeVC.m
//  Vehicle
//
//  Created by Darcy on 2019/7/24.
//  Copyright © 2019 CY. All rights reserved.
//

#import "AnalyzeVC.h"
#import "AnalyzeHeaderView.h"
#import "AnalyzeTableViewCell.h"
#import "AnalyzeSearchListVC.h"

@interface AnalyzeVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AnalyzeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setInsetNoneWithScrollerView:self.tableView];
    [self addNavigationView];
    
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AnalyzeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnalyzeTableViewCell"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return mScreenWidth*0.67;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    AnalyzeHeaderView *bg = [[AnalyzeHeaderView alloc] init];
    return bg;
}
#pragma mark -- 配置导航栏
- (void)addNavigationView {
    UIButton *titlteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [titlteBtn addTarget:self action:@selector(titleBtnWithAction:) forControlEvents:UIControlEventTouchUpInside];
    titlteBtn.frame = CGRectMake(0, 0, mScreenWidth-150, 33);
    titlteBtn.backgroundColor = kWhiteColor;
    titlteBtn.layer.cornerRadius = 7.f;
    titlteBtn.layer.masksToBounds = YES;
    [titlteBtn setTitle:[Language getText:@"Feature No,Feature Name"] forState:0];
    titlteBtn.titleLabel.font = kFont13;
    [titlteBtn setTitleColor:kSubTitleColor forState:0];
    self.navigationItem.titleView = titlteBtn;
}
/**
 * 响应事件
 **/
- (void)titleBtnWithAction:(UIButton *)sender {
    AnalyzeSearchListVC *vc = [[AnalyzeSearchListVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -- 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = kBottomColor;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
        //注册cell
        [_tableView registerClass:[AnalyzeTableViewCell class] forCellReuseIdentifier:@"AnalyzeTableViewCell"];
        
    }
    return _tableView;
}

@end
