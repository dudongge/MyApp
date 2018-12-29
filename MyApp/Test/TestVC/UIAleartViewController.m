//
//  UIAleartViewController.m
//  MyApp
//
//  Created by dudongge on 2018/12/19.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import "UIAleartViewController.h"
#import "MySectionHeaderView.h"


static NSString *showCellID    = @"showCellID";
static NSString *showSectionID = @"showSectionID";

@interface UIAleartViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray<NSString *> *showSectionArray;
@property (nonatomic, strong) NSMutableArray<NSString *> *contentArray;
@end

@implementation UIAleartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myTableView];
    
    self.showSectionArray = [NSMutableArray arrayWithArray: @[@"1",@"0",@"1",@"0",@"0"]];
    self.contentArray = [NSMutableArray arrayWithArray:@[@"天下风云出我辈，一入江湖岁月催。妄图霸业谈笑间，不胜人生一场醉。天下风云出我辈，一入江湖岁月催",
                                                         @"天下风云出我辈，一入江湖岁月催。妄图霸业谈笑间，不胜人生一场醉。",
                                                         @"天下风云出我辈，一入江湖岁月催",
                                                         @"天下风云出我辈，一入江湖岁月催。妄图霸业谈笑间，不胜人生一场醉"]];
    //[self.myTableView reloadData];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (!self) return;
        [self.myTableView reloadData];
    });
}

#pragma  -mark- UITableViewDelegate UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.showSectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.showSectionArray.count > 0) {
        if ([@"1" isEqual: self.showSectionArray[section]]) {
            return self.contentArray.count;
        } else {
            return 0;
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:showCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]init];
    }
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = self.contentArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat fondHeight = [self sizeWithText: self.contentArray[indexPath.row] font:[UIFont systemFontOfSize:16.0]].height + 10;
    CGFloat height = [self sizeWithText: self.contentArray[indexPath.row] font:[UIFont systemFontOfSize:16.0]].width / (screen_width - 40) * fondHeight;
    NSLog(@"%f",height);
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    MySectionHeaderView *sectionView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:showSectionID];
    if (!sectionView) {
        sectionView = [[MySectionHeaderView alloc]init];
    }
    sectionView.showButton.selected = [@"1"isEqualToString: self.showSectionArray[section]] ? YES : NO;
    
    __weak typeof(self) weakSelf = self;
    sectionView.showBlock = ^(BOOL show) {
        [weakSelf handleShowBlockWithIndex:section isShow:show];
    };
    return sectionView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (void)handleShowBlockWithIndex:(NSInteger )indexPath isShow:(BOOL )show {
    if (show) {
        self.showSectionArray[indexPath] = @"1";
    } else {
        self.showSectionArray[indexPath] = @"0";
    }
     NSIndexSet *set = [NSIndexSet indexSetWithIndex:indexPath];
    [self.myTableView reloadSections:set withRowAnimation:UITableViewRowAnimationNone];
}

- (UITableView *)myTableView {
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]init];
        _myTableView.frame = CGRectMake(0, 0, screen_width, screen_height);
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:showCellID];
        [_myTableView registerClass:[MySectionHeaderView class] forHeaderFooterViewReuseIdentifier:showSectionID];
    }
    return _myTableView;
}

- (NSMutableArray *)showSectionArray {
    if (!_showSectionArray) {
        _showSectionArray = [NSMutableArray array];
    }
    return _showSectionArray;
}


- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

@end
