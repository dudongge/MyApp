//
//  UIColorGradientVCtrl.m
//  MyApp
//
//  Created by dudongge on 2018/12/24.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import "UIColorGradientVCtrl.h"
#import "DDGBannerScrollView.h"

@interface UIColorGradientVCtrl ()<DDGBannerScrollViewDelegate>
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *fromView;
@property (nonatomic, strong) UIView *toView;
@property (nonatomic, strong) DDGBannerScrollView *cycleScrollView;
@end

@implementation UIColorGradientVCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.cycleScrollView];
    self.cycleScrollView.pageControlAliment = DDGBannerScrollViewPageContolAlimentRight;
    self.cycleScrollView.currentPageDotColor = [UIColor blackColor];
    self.cycleScrollView.pageDotColor = [UIColor redColor];
    __weak typeof(self) weakSelf = self;
    self.cycleScrollView.cycleScrollViewBlock = ^(NSInteger offset) {
        //[self handelBannerBgColorWithOffset:offset];
    };
   
//    self.slider.frame = CGRectMake(100, 200, 100, 30);
//    [self.slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
//    self.progressView.frame = CGRectMake(100, 300, 100, 30);
//    self.progressView.backgroundColor = [UIColor blueColor];
//
//    self.bgView.frame = CGRectMake(100, 330, 100, 100);
//    self.bgView.backgroundColor = [UIColor colorWithRed:203 /255.0 green:193 /255.0 blue:255 / 255.0 alpha:1.0];
//
//    self.fromView.frame = CGRectMake(30, 450, 100, 100);
//    self.fromView.backgroundColor = [UIColor colorWithRed:21/255.0 green:43/255.0 blue:55/255.0 alpha:1.0];
//
//    self.toView.frame = CGRectMake(150, 450, 100, 100);
//    self.toView.backgroundColor = [UIColor colorWithRed:71/255.0 green:63/255.0 blue:15/255.0 alpha:1.0];
    
    
    self.fromView.frame = CGRectMake(30, 450, 50, 50);
    self.fromView.backgroundColor = [UIColor colorWithRed:21/255.0 green:43/255.0 blue:55/255.0 alpha:1.0];

}

#pragma  -mark- DDGCycleScrollView delegate

- (void)sliderValueChange:(UISlider *)slider {
    NSLog(@"%f",slider.value);
    ///203,193,255
    //227,168,142
    //self.bgView.backgroundColor = [self getColorByPercent:slider.value];
    UIColor *startColor = [UIColor colorWithRed:203 /255.0 green:193 /255.0 blue:255 / 255.0 alpha:1.0];
    UIColor *endColor = [UIColor colorWithRed:227 /255.0 green:168 /255.0 blue:142 / 255.0 alpha:1.0];
    self.bgView.backgroundColor = [self getColorWithColor:startColor andCoe:slider.value andMarginArray:[self transColorBeginColor:startColor andEndColor:endColor]];
}

//得到一个颜色的原始值
- (NSArray *)getRGBDictionaryByColor:(UIColor *)originColor {
    CGFloat r = 0,g = 0,b = 0,a = 0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [originColor getRed:&r green:&g blue:&b alpha:&a];
    }
    else {
        const CGFloat *components = CGColorGetComponents(originColor.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    return @[@(r),@(g),@(b)];
}

//计算两个值的色差
- (NSArray *)transColorBeginColor:(UIColor *)beginColor andEndColor:(UIColor *)endColor {
    NSArray<NSNumber *> *beginColorArr = [self getRGBDictionaryByColor:beginColor];
    NSArray<NSNumber *> *endColorArr = [self getRGBDictionaryByColor:endColor];
    return @[@([endColorArr[0] doubleValue] - [beginColorArr[0] doubleValue]),@([endColorArr[1] doubleValue] - [beginColorArr[1] doubleValue]),@([endColorArr[2] doubleValue] - [beginColorArr[2] doubleValue])];
}

//返回当前的颜色
- (UIColor *)getColorWithColor:(UIColor *)beginColor andCoe:(double)coe andMarginArray:(NSArray<NSNumber *> *)marginArray {
    NSArray *beginColorArr = [self getRGBDictionaryByColor:beginColor];
    double red = [beginColorArr[0] doubleValue] + coe * [marginArray[0] doubleValue];
    double green = [beginColorArr[1] doubleValue]+ coe * [marginArray[1] doubleValue];
    double blue = [beginColorArr[2] doubleValue] + coe * [marginArray[2] doubleValue];
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

- (DDGBannerScrollView *)cycleScrollView {
    if (!_cycleScrollView) {
        CGRect frame = CGRectMake(0, 88, screen_width, screen_width * 0.67);
        _cycleScrollView = [DDGBannerScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:[UIImage imageNamed:@"cache_cancel_all"]];
        _cycleScrollView.imageURLStringsGroup = @[@"0",@"1",@"2"];
    }
    return _cycleScrollView;
}



- (UIProgressView *)progressView {
    if (!_progressView) {
        _progressView = [[UIProgressView alloc]init];
        _progressView.backgroundColor = UIColor.blueColor;
        [self.view addSubview:_progressView];
    }
    return _progressView;
}
- (UISlider *)slider {
    if (!_slider) {
        _slider = [[UISlider alloc]init];
        [self.view addSubview:_slider];
    }
    return _slider;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = UIColor.blueColor;
        [self.view addSubview:_bgView];
    }
    return _bgView;
}

- (UIView *)fromView {
    if (!_fromView) {
        _fromView = [[UIView alloc]init];
        _fromView.backgroundColor = UIColor.blueColor;
        [self.view addSubview:_fromView];
    }
    return _fromView;
}

- (UIView *)toView {
    if (!_toView) {
        _toView = [[UIView alloc]init];
        _toView.backgroundColor = UIColor.blueColor;
        [self.view addSubview:_toView];
    }
    return _toView;
}

- (void)startWithPoint:(CGPoint)startPoint toPoint:(CGPoint)endPoint {
    CGFloat centerX = (endPoint.x - startPoint.x) / 2.0;
    CGFloat centerY = (endPoint.y - startPoint.y) / 2.0;
    
    CGPoint centerP = CGPointMake(0, 0);
    
    
}

@end
