//
//  AnalyzeTableViewCell.m
//  Vehicle
//
//  Created by Darcy on 2019/7/25.
//  Copyright © 2019 CY. All rights reserved.
//

#import "AnalyzeTableViewCell.h"
#import "AnalyListCell.h"

@interface AnalyzeTableViewCell ()<UITableViewDelegate, UITableViewDataSource, ChartViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) float all;

@property (nonatomic, strong) NSArray *colorsArray;

@end

@implementation AnalyzeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = kBottomColor;
        
        self.colorsArray = @[mHexColor(0x62a9f0), mHexColor(0x4cceb5), mHexColor(0xff9058), mHexColor(0x8c97cb), mHexColor(0x88c4ff), mHexColor(0x6ce6cf), mHexColor(0xffac82), mHexColor(0xb2bce8), mHexColor(0xaad5ff), mHexColor(0x8ef0de), mHexColor(0xffc7ab), mHexColor(0xc6d0f8), mHexColor(0xc3e1ff), mHexColor(0xaaf7e9), mHexColor(0xffdac7), mHexColor(0xdce2f9)];
        
        [self nameLB];
        [self leftView];
        [self rightView];
        
        [self lineView];
        
    }
    return self;
}

- (UILabel *)nameLB {
    if (!_nameLB) {
        _nameLB = [[UILabel alloc] init];
        _nameLB.textColor = kBlackColor;
        _nameLB.font = kFont15;
        _nameLB.text = @"Number Model Group By Brand";
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.right.equalTo(-15);
            make.top.equalTo(10);
            make.height.equalTo(17);
        }];
        
    }
    return _nameLB;
}

- (UIView *)leftView {
    if (!_leftView) {
        _leftView = [[UIView alloc] init];
        _leftView.backgroundColor = kBottomColor;
        [self.contentView addSubview:_leftView];
        [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.top.equalTo(self.nameLB.mas_bottom).offset(10);
            make.bottom.equalTo(0);
            make.width.equalTo(mScreenWidth/3);
        }];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = kBottomColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.tableHeaderView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.leftView addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        [_tableView registerClass:[AnalyListCell class] forCellReuseIdentifier:@"AnalyListCell"];
        
    }
    return _leftView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = kLineColor;
        [self.contentView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.height.equalTo(1);
            make.top.equalTo(mScreenWidth*0.67-1);
        }];
    }
    return _lineView;
}

- (UIView *)rightView {
    if (!_rightView) {
        _rightView = [[UIView alloc] init];
        _rightView.backgroundColor = kBottomColor;
        [self.contentView addSubview:_rightView];
        [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(0);
            make.left.equalTo(self.leftView.mas_right);
            make.top.equalTo(self.nameLB.mas_bottom).offset(10);
            make.bottom.equalTo(0);
        }];
        
        UIView *target = [[UIView alloc] init];
        [_rightView addSubview:target];
        [target mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
        NSArray *type = @[@{@"count":@"9",@"name":@"11"},@{@"count":@"5",@"name":@"22"},@{@"count":@"3",@"name":@"33"},@{@"count":@"9",@"name":@"44"},@{@"count":@"5",@"name":@"55"},@{@"count":@"1",@"name":@"66"},@{@"count":@"1",@"name":@"77"},@{@"count":@"4",@"name":@"88"},@{@"count":@"4",@"name":@"99"},@{@"count":@"4",@"name":@"100"}];
        if (kCanShowNoData == 1) {
            if (type.count <= 0) {
//                return;
            }
        }
        if (type.count > 10) {
            type = [type subarrayWithRange:NSMakeRange(0, 10)];
        }
        
        self.all = 0;
        for (int i = 0; i<type.count; i++) {
            NSDictionary *temp = type[i];
            float count = [safeStringFromDic(temp, @"count") floatValue];
            self.all += count;
        }
        
        PieChartView *chartView =  [[PieChartView alloc] init];
        chartView.delegate = self;
        [target addSubview:chartView];
        [chartView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10);
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.bottom.equalTo(-10);
        }];
        
        chartView.chartDescription.text = @"";
        
        chartView.drawCenterTextEnabled = NO;
        chartView.drawHoleEnabled = NO;  // 是否显示中间的hole
        chartView.dragDecelerationEnabled = YES;//拖拽饼状图后是否有惯性效果
        
        chartView.drawSlicesUnderHoleEnabled = NO;
        
        chartView.usePercentValuesEnabled = YES;
        
        chartView.drawSlicesUnderHoleEnabled = NO;
        chartView.holeRadiusPercent = 0;
        //    chartView.transparentCircleRadiusPercent = 0.52;
        [chartView setExtraOffsetsWithLeft:2.f top:1.f right:2.f bottom:4.f]; //饼状图距离边缘的间隙
        
        chartView.legend.enabled = NO;
        chartView.legend.xEntrySpace = 15.0;
        chartView.legend.yEntrySpace = 10.0;
        chartView.legend.yOffset = 10.0;
        
        chartView.legend.font = kFont17;
        chartView.legend.direction = ChartLegendDirectionLeftToRight;
        chartView.legend.orientation = ChartLegendOrientationVertical;
        
        chartView.legend.horizontalAlignment = ChartLegendHorizontalAlignmentRight;
        chartView.legend.verticalAlignment = ChartLegendVerticalAlignmentCenter;
        
        chartView.legend.textColor = [UIColor whiteColor];
        
        chartView.drawSlicesUnderHoleEnabled = YES;
        
        NSMutableArray *rateArray = [NSMutableArray arrayWithCapacity:1];
        double all = 0;
        for (int i = 0; i < type.count; i++) {
            NSDictionary *temp = type[i];
            double x = [safeStringFromDic(temp, @"count") doubleValue];
            all += x;
            [rateArray addObject:@(x)];
        }
        
        NSMutableArray *yVals = [NSMutableArray array];
        
        for (int i = 0; i < rateArray.count; i++) {
            NSDictionary *temp = type[i];
            NSString *valStr = [NSString stringWithFormat:@"%@", rateArray[i]];
            double val = [valStr doubleValue];
            NSString *labStr = [NSString stringWithFormat:@"%@  %.0f  %.0f%%", safeStringFromDic(temp, @"name"), val, val / (all * 1.0) * 100 ];
            PieChartDataEntry *entry = [[PieChartDataEntry alloc] initWithValue:val/all label:labStr];
            [yVals addObject:entry];
        }
        
        
        PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithValues:yVals label:@""];
        dataSet.drawIconsEnabled = NO;
        dataSet.drawValuesEnabled = NO; // 是否显示各块的文字
        NSArray *colors = self.colorsArray;
        
        dataSet.colors = colors;//区块颜色
        
        chartView.drawEntryLabelsEnabled = NO; // 块中是否显示label
        chartView.entryLabelColor = UIColor.blackColor;
        chartView.entryLabelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.f];
        
        
        //dataSet.xValuePosition = PieChartValuePositionOutsideSlice;
        dataSet.yValuePosition = PieChartValuePositionOutsideSlice;
        
        dataSet.sliceSpace = 2.0;
        dataSet.iconsOffset = CGPointMake(0, 40);
        
        PieChartData *data = [[PieChartData alloc] initWithDataSet:dataSet];
        chartView.data = nil;
        chartView.data = data;
        
        
        [chartView animateWithXAxisDuration:3.0f];
        
        PieMarkerView *marker = [[PieMarkerView alloc]
                                 initWithColor: [UIColor whiteColor]
                                 font: [UIFont systemFontOfSize:12.0]
                                 textColor: UIColor.blackColor
                                 insets: UIEdgeInsetsMake(8.0, 8.0, 20.0, 8.0)];
        marker.chartView = chartView;
        marker.minimumSize = CGSizeMake(80.f, 40.f);
        chartView.marker = marker;
        
    }
    return _rightView;
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AnalyListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnalyListCell"];
    cell.colorImg.backgroundColor = self.colorsArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 20;
}

@end
