//
//  UIColorGradientVCtrl.m
//  MyApp
//
//  Created by dudongge on 2018/12/24.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import "UIColorGradientVCtrl.h"
#import "DDGBannerScrollView.h"
#import "UIColor+MyExtension.h"
#import "DDGHorizontalPageControl.h"
#import "DDGAnimationPageControl.h"

@interface UIColorGradientVCtrl ()<DDGBannerScrollViewDelegate>

@property (nonatomic, strong) DDGBannerScrollView *cycleScrollView;
@property (nonatomic, strong) UIView *bgHeaderView;
@property (nonatomic, strong) NSMutableArray *changeColors;
@property (nonatomic, strong) UIImageView *rotationImageView;
@property (nonatomic, strong) DDGHorizontalPageControl *horizontalPageControl;
@property (nonatomic, strong) DDGAnimationPageControl  *animationPageControl;
@property (nonatomic, strong) DDGAnimationPageControl  *myAnimationJumpControl;
@property (nonatomic, strong) DDGAnimationPageControl  *myAnimationRotationControl;
@end

@implementation UIColorGradientVCtrl


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.bgHeaderView];
    [self.bgHeaderView addSubview:self.cycleScrollView];
    //[self.view addSubview:self.rotationImageView];
    [self.view addSubview: self.horizontalPageControl];
    
    [self.view addSubview: self.DDGAnimationPageControl];
    [self.view addSubview: self.myAnimationJumpControl];
    [self.view addSubview: self.myAnimationRotationControl];
    
    self.cycleScrollView.pageControlAliment   = DDGBannerScrollViewPageContolAlimentRight;
    self.cycleScrollView.pageControlStyle     = DDGBannerScrollViewPageImageRotation;
    self.cycleScrollView.currentPageDotColor  = [UIColor whiteColor];
    self.cycleScrollView.pageDotColor         = [UIColor whiteColor];
    self.cycleScrollView.pageDotImage         = [UIImage imageNamed:@"page_normal"];
    self.cycleScrollView.currentPageDotImage  = [UIImage imageNamed:@"page_current"];
    self.cycleScrollView.pageDotColor         = UIColor.blackColor;
    self.cycleScrollView.currentPageDotColor  = UIColor.redColor;
    __weak typeof(self) weakSelf = self;;
    self.cycleScrollView.cycleScrollViewBlock = ^(NSInteger offset) {
        [weakSelf handelBannerBgColorWithOffset:offset];
    };
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (!self) return;
        
    });
    
    //[self rotationImageView:self.rotationImageView];
    [UIView animateWithDuration:2.0 animations:^{
        self.rotationImageView.frame = CGRectMake(150, 300, 50, 50);
    } completion:^(BOOL finished) {
        
    }];
    [self rotationImageView:self.rotationImageView];
    [self startrRotationImageView:self.rotationImageView duration:2.0 controlPoint:CGPointMake(0, 0)];
    
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //[self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)cycleScrollView:(DDGBannerScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
    [self.horizontalPageControl setCurrentPage:index];
    [self.animationPageControl setCurrentPage:index];
    [self.myAnimationJumpControl setCurrentPage:index];
    [self.myAnimationRotationControl setCurrentPage:index];
    [self rotationImageView:self.rotationImageView];
}

//根据偏移量计算设置banner背景颜色
- (void)handelBannerBgColorWithOffset:(NSInteger )offset {
    if (1 == self.changeColors.count) return;
    NSInteger offsetCurrent = offset % (int)self.cycleScrollView.bounds.size.width ;
    float rate = offsetCurrent / self.cycleScrollView.bounds.size.width ;
    NSInteger currentPage = offset / (int)self.cycleScrollView.bounds.size.width;
    UIColor *startPageColor;
    UIColor *endPageColor;
    if (currentPage == self.changeColors.count - 1) {
        startPageColor = self.changeColors[currentPage];
        endPageColor = self.changeColors[0];
    } else {
        if (currentPage  == self.changeColors.count) {
            return;
        }
        startPageColor = self.changeColors[currentPage];
        endPageColor = self.changeColors[currentPage + 1];
    }
    UIColor *currentToLastColor = [UIColor getColorWithColor:startPageColor andCoe:rate andEndColor:endPageColor];
    self.bgHeaderView.backgroundColor = currentToLastColor;
}

- (DDGBannerScrollView *)cycleScrollView {
    if (!_cycleScrollView) {
        CGRect frame = CGRectMake(30, 88, screen_width - 60, screen_width * 0.37);
        _cycleScrollView = [DDGBannerScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:[UIImage imageNamed:@"cache_cancel_all"]];
        
        _cycleScrollView.imageURLStringsGroup = @[@"1",@"2",@"3",@"4"];
    }
    return _cycleScrollView;
}

- (UIView *)bgHeaderView {
    if (!_bgHeaderView) {
        _bgHeaderView = [[UIView alloc]init];
        _bgHeaderView.frame = CGRectMake(0,0, screen_width , screen_width * 0.37 + 120);
    }
    return _bgHeaderView;
}

- (NSMutableArray *)changeColors {
    if (!_changeColors) {
        UIColor *oneColor   = [UIColor colorWithHexString:@"#FDC0BC" alpha:1.0];
        UIColor *twoColor   = [UIColor colorWithHexString:@"#CBC1FF" alpha:1.0];
        UIColor *threeColor = [UIColor colorWithHexString:@"#C8CFA2" alpha:1.0];
        UIColor *fourColor  = [UIColor colorWithHexString:@"#CBC1FF" alpha:1.0];
        UIColor *fiveColor  = [UIColor colorWithHexString:@"#C8CFA2" alpha:1.0];
        _changeColors = [[NSMutableArray alloc]initWithArray:@[oneColor,twoColor,threeColor,fourColor,fiveColor]];
    }
    return _changeColors;
}

- (UIImageView *)rotationImageView {
    if (!_rotationImageView) {
        _rotationImageView = [[UIImageView alloc]init];
        _rotationImageView.image = [UIImage imageNamed:@"0"];
        _rotationImageView.frame = CGRectMake(50, 300, 50, 50);
    }
    return _rotationImageView;
}

- (DDGHorizontalPageControl *)horizontalPageControl {
    if (!_horizontalPageControl) {
        _horizontalPageControl = [[DDGHorizontalPageControl alloc]init];
        _horizontalPageControl.frame = CGRectMake(10, 300, 360, 50);
        _horizontalPageControl.dotBigSize   = CGSizeMake(18, 6);
        _horizontalPageControl.dotNomalSize = CGSizeMake(6, 6);
        _horizontalPageControl.dotMargin = 6;
        _horizontalPageControl.backgroundColor = UIColor.lightGrayColor;
        _horizontalPageControl.currentPageColor = [UIColor whiteColor];
        _horizontalPageControl.normalPageColor = [UIColor grayColor];
        _horizontalPageControl.pages = 5;
    }
    return _horizontalPageControl;
}

- (DDGAnimationPageControl *)DDGAnimationPageControl {
    if (!_animationPageControl) {
        _animationPageControl = [[DDGAnimationPageControl alloc]init];
        _animationPageControl = [DDGAnimationPageControl initWithinitWithFrame:CGRectMake(10, 400, 360, 50)
                                                                       dotBigSize:CGSizeMake(30, 30)
                                                                     dotNomalSize:CGSizeMake(20, 20)
                                                                        dotMargin:20
                                                                        pageCount:5
                                                                        startPage:1
                                                                 currentPageImage:[UIImage imageNamed:@"page_current"]
                                                                  normalPageImage:[UIImage imageNamed:@"page_normal"]];
        
        _animationPageControl.backgroundColor = UIColor.lightGrayColor;
    }
    return _animationPageControl;
}

- (DDGAnimationPageControl *)myAnimationRotationControl {
    if (!_myAnimationRotationControl) {
        _myAnimationRotationControl = [[DDGAnimationPageControl alloc]init];
        _myAnimationRotationControl = [DDGAnimationPageControl initWithinitWithFrame:CGRectMake(10, 500, 360, 50)
                                                                          dotBigSize:CGSizeMake(30, 30)
                                                                        dotNomalSize:CGSizeMake(20, 20)
                                                                           dotMargin:20
                                                                           pageCount:5
                                                                           startPage:1
                                                                    currentPageImage:[UIImage imageNamed:@"page_current"]
                                                                     normalPageImage:[UIImage imageNamed:@"page_normal"]];
        
        _myAnimationRotationControl.backgroundColor = UIColor.lightGrayColor;
        _myAnimationRotationControl.animationType = DDGAnimationPageControlRotation;
    }
    return _myAnimationRotationControl;
}

- (DDGAnimationPageControl *)myAnimationJumpControl {
    if (!_myAnimationJumpControl) {
        _myAnimationJumpControl = [[DDGAnimationPageControl alloc]init];
        _myAnimationJumpControl = [DDGAnimationPageControl initWithinitWithFrame:CGRectMake(10, 600, 360, 50)
                                                                      dotBigSize:CGSizeMake(30, 30)
                                                                    dotNomalSize:CGSizeMake(20, 20)
                                                                       dotMargin:20
                                                                       pageCount:5
                                                                       startPage:1
                                                                currentPageImage:[UIImage imageNamed:@"page_current"]
                                                                 normalPageImage:[UIImage imageNamed:@"page_normal"]];
        
        _myAnimationJumpControl.backgroundColor = UIColor.lightGrayColor;
        _myAnimationJumpControl.animationType = DDGAnimationPageControlJump;
    }
    return _myAnimationJumpControl;
}

- (void)rotationImageView:(UIImageView *)imageView {
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 2.0;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 1;
    [imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}


- (void)startrRotationImageView:(UIImageView *)imageView duration:(CGFloat)duration controlPoint:(CGPoint)controlPoint2 {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    //设置动画属性，因为是沿着贝塞尔曲线动，所以要设置为position
    animation.keyPath = @"position";
    //设置动画时间
    animation.duration = duration;
    // 告诉在动画结束的时候不要移除
    animation.removedOnCompletion = NO;
    // 始终保持最新的效果
    animation.fillMode = kCAFillModeForwards;
    CGPoint bezierPoint = CGPointMake(imageView.frame.origin.x, imageView.frame.origin.y);
    //贝塞尔曲线
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:bezierPoint radius:60 startAngle:M_PI endAngle:M_PI_2 clockwise:true];
    // 设置贝塞尔曲线路径
    animation.path = circlePath.CGPath;
    // 将动画对象添加到视图的layer上
    [imageView.layer addAnimation:animation forKey:@"position"];
}

@end
