//
//  HomeViewController.m
//  MyApp
//
//  Created by dudongge on 2018/12/19.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import "HomeViewController.h"
#import "TestmMyButtonVCtrl.h"


@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.homeTableView.backgroundColor = UIColor.whiteColor;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tabCell = [tableView dequeueReusableCellWithIdentifier:@"HomeUITableViewCell" forIndexPath:indexPath];
    tabCell.textLabel.text = self.dataSource[indexPath.row];
    return tabCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        TestmMyButtonVCtrl *testVC = [[TestmMyButtonVCtrl alloc]init];
        [self.navigationController pushViewController:testVC animated:YES];
    }
}

- (UITableView *)homeTableView {
    if (!_homeTableView) {
        _homeTableView = [[UITableView alloc]init];
        _homeTableView.delegate = self;
        _homeTableView.dataSource = self;
        [_homeTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HomeUITableViewCell"];
        [self.view addSubview:_homeTableView];
        _homeTableView.frame = CGRectMake(0, 0, screen_width, screen_height - topHeight - bottomHeight);
    }
    return _homeTableView;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"自定义按钮",@"我的漫画大卡",@"追漫详情",@"自定义弹框"];
    }
    return _dataSource;
}
@end
