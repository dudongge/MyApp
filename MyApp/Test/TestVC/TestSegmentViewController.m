//
//  TestSegmentViewController.m
//  MyApp
//
//  Created by dudongge on 2019/1/3.
//  Copyright © 2019 dudongge. All rights reserved.
//

#import "TestSegmentViewController.h"
#import "BBComicSegmentView.h"
#import "UIColor+MyExtension.h"
#import "MBProgressHUD.h"

@interface TestSegmentViewController ()<BBComicSegmentViewDelegate>
@property (nonatomic, strong) BBComicSegmentView *segmentView;
@property (nonatomic, strong) UISlider *myslider;
@property (nonatomic, strong) UIView *startView;
@property (nonatomic, strong) UIView *changeView;
@property (nonatomic, strong) UIView *endView;
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
    
    [self.view addSubview:self.myslider];
    [self.view addSubview:self.startView];
    [self.view addSubview:self.changeView];
    [self.view addSubview:self.endView];
    
    //[self showAllTextDialog:@"2341454"];
    
    
    
    //UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //[window addSubview:label];
    
    [self  showAllTextDialog:@"暂时没有"];
   
    
}
-(void)showAllTextDialog:(NSString *)str{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;//注：keyWindow当前显示界面的window
    UIView *subView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    subView.backgroundColor = [UIColor clearColor];
    subView.alpha = 1.0;
    UILabel *label = [[UILabel alloc]init];
    label.text = [NSString stringWithFormat:@"   %@   ",str];
    label.textColor = UIColor.whiteColor;
    label.backgroundColor = UIColor.blackColor;
    label.layer.cornerRadius = 4.0;
    label.clipsToBounds = YES;
    [subView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(subView.mas_centerX);
        make.centerY.mas_equalTo(subView.mas_centerY);
        make.height.mas_equalTo(40);
    }];
    [window addSubview:subView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [subView removeFromSuperview];
        if (!self) return;
    });
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

- (void)mysliderChanged:(UISlider *)slider {
    UIColor * color = [UIColor getColorWithColor:[UIColor colorWithHexString:@"#FDC0BC" alpha:1.0] andCoe:slider.value andEndColor:[UIColor colorWithHexString:@"#CBC1FF" alpha:1.0]];
    self.changeView.backgroundColor = color;
}

- (UISlider *)myslider {
    if (!_myslider) {
        _myslider = [[UISlider alloc]init];
        _myslider.frame = CGRectMake(50, 200, 200, 30);
        [_myslider addTarget:self action:@selector(mysliderChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _myslider;
}

- (UIView *)startView {
    if (!_startView) {
        _startView = [[UIView alloc]init];
        _startView.frame = CGRectMake(40, 250, 60, 60);
        _startView.backgroundColor =  [UIColor colorWithHexString:@"#FDC0BC" alpha:1.0];
    }
    return _startView;
}

- (UIView *)changeView {
    if (!_changeView) {
        _changeView = [[UIView alloc]init];
        _changeView.frame = CGRectMake(110, 250, 60, 60);
        _changeView.backgroundColor = UIColor.whiteColor ;
    }
    return _changeView;
}

- (UIView *)endView {
    if (!_endView) {
        _endView = [[UIView alloc]init];
        _endView.frame = CGRectMake(180, 250, 60, 60);
        _endView.backgroundColor = [UIColor colorWithHexString:@"#CBC1FF" alpha:1.0];
    }
    return _endView;
}


@end
