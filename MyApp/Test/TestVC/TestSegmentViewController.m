//
//  TestSegmentViewController.m
//  MyApp
//
//  Created by dudongge on 2019/1/3.
//  Copyright © 2019 dudongge. All rights reserved.
//

#import "TestSegmentViewController.h"
#import "BBComicSegmentView.h"

@interface TestSegmentViewController ()<BBComicSegmentViewDelegate>
@property (nonatomic, strong) BBComicSegmentView *segmentView;
@end

@implementation TestSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: self.segmentView];
    
    
    __weak typeof(self) ws = self;
    self.segmentView.segmentViewBlock = ^(NSInteger index) {
          NSLog(@"%ld",(long)index);
    };
}

- (BBComicSegmentView *)segmentView {
    if (!_segmentView) {
        _segmentView = [[BBComicSegmentView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 60)];
        //
        _segmentView.delegate = self;
    }
    return _segmentView;
}

- (void)selectedSegmentViewIndex:(NSInteger)index {
     NSLog(@"%ld",(long)index);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.segmentView updateSegmentViewSelected:3];
}

@end
