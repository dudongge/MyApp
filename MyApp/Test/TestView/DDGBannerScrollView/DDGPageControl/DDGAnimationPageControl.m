//
//  DDGAnimationPageControl.m
//  MyApp
//
//  Created by dudongge on 2018/12/26.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import "DDGAnimationPageControl.h"

@interface DDGAnimationPageControl()

/**
 pageDots 动画需要播放的图片组
 */

@property (nonatomic, strong) NSMutableArray<UIImageView *> *pageDots;

/**
 animationImageView 动画要用到的图片
 */
@property (nonatomic, strong) UIImageView *animationImageView;

@end

@implementation DDGAnimationPageControl

- (instancetype)init {
    self = [ super init];
    if (self) {
        [self _initSubViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _initSubViews];
    }
    return self;
}

+ (instancetype)initWithinitWithFrame:(CGRect)frame pageCount:(NSInteger)pages currentPageImage:(UIImage *)currentPageImage normalPageImage:(UIImage *)normalPageImage {
    DDGAnimationPageControl *pageControl = [[self alloc] initWithFrame:frame];
    pageControl.pages = pages;
    pageControl.currentPageImage = currentPageImage;
    pageControl.normalPageImage = normalPageImage;
    return pageControl;
}

+ (instancetype)initWithinitWithFrame:(CGRect)frame pageCount:(NSInteger)pages startPage:(NSInteger)startPage currentPageImage:(UIImage *)currentPageImage normalPageImage:(UIImage *)normalPageImage {
    DDGAnimationPageControl *pageControl = [[self alloc] initWithFrame:frame];
    pageControl.pages = pages;
    pageControl.currentPageImage = currentPageImage;
    pageControl.normalPageImage = normalPageImage;
    pageControl.startPage = startPage;
    return pageControl;
}

+ (instancetype)initWithinitWithFrame:(CGRect)frame dotBigSize:(CGSize)dotBigSize dotNomalSize:(CGSize)dotNomalSize dotMargin:(CGFloat)dotMargin pageCount:(NSInteger)pages startPage:(NSInteger)startPage currentPageImage:(UIImage *)currentPageImage normalPageImage:(UIImage *)normalPageImage {
    DDGAnimationPageControl *pageControl = [[self alloc] initWithFrame:frame];
    pageControl.pages = pages;
    pageControl.currentPageImage = currentPageImage;
    pageControl.normalPageImage = normalPageImage;
    pageControl.startPage = startPage;
    pageControl.dotBigSize = dotBigSize;
    pageControl.dotNomalSize = dotNomalSize;
    pageControl.dotMargin = dotMargin;
    return pageControl;
}


- (void)_initSubViews {
    _dotNomalSize = CGSizeMake(20, 20);
    _dotBigSize = CGSizeMake(30, 30);
    _dotMargin = 20;
    _startPage = 0;
    _dotAlpha = 0.5;
    _animationType = DDGAnimationPageControlNoamal;
}

- (void)updateCurrentPage:(NSInteger)page {
    CGFloat dotNomalWidth  = self.dotNomalSize.width;
    CGFloat dotBigWidth    = self.dotBigSize.width;
    CGFloat dotBigHeight   = self.dotBigSize.height;
    if (0 == page) {
        [self.animationImageView.layer removeAllAnimations];
        [self startrRotationImageView:self.animationImageView duration:1.0 clockwise:YES];
        [UIView animateWithDuration:0.5 animations:^{
            self.animationImageView.frame = CGRectMake((self.pages) * (dotNomalWidth + self.dotMargin), 0, dotBigWidth, dotBigHeight);
            self.animationImageView.alpha = 0.0;
        } completion:^(BOOL finished) {
            if (finished) {
                self.animationImageView.frame = CGRectMake(- 0.5 * (dotNomalWidth + self.dotMargin), 0, dotBigWidth, dotBigHeight);
                [UIView animateWithDuration:0.5 animations:^{
                    self.animationImageView.alpha = 1.0;
                    self.animationImageView.frame = CGRectMake(self.dotMargin + page * (dotNomalWidth + self.dotMargin) - (dotBigWidth - dotNomalWidth) / 2.0, 0, dotBigWidth, dotBigHeight);
                }];
            }
        }];
    } else {
        [self.animationImageView.layer removeAllAnimations];
        CGFloat lastImageViewX = self.animationImageView.frame.origin.x;
        CGFloat currentImageX = self.dotMargin + page * (dotNomalWidth + self.dotMargin) - (dotBigWidth - dotNomalWidth) / 2.0;
        if (self.animationType == DDGAnimationPageControlNoamal) {
            [UIView animateWithDuration:1.0 animations:^{
                self.animationImageView.frame = CGRectMake(currentImageX, 0, dotBigWidth, dotBigHeight);
            }];
        } else if (self.animationType == DDGAnimationPageControlRotation) {
            [UIView animateWithDuration:1.0 animations:^{
                self.animationImageView.frame = CGRectMake(currentImageX, 0, dotBigWidth, dotBigHeight);
                [self startrRotationImageView:self.animationImageView duration:1.0 clockwise:(currentImageX > lastImageViewX)];
            }];
        } else if (self.animationType == DDGAnimationPageControlJump) {
            [UIView animateWithDuration:1.0 animations:^{
                CGPoint controlPoint;
                if (currentImageX > lastImageViewX) {
                    controlPoint = CGPointMake(currentImageX - ((self.dotMargin + dotNomalWidth - dotBigWidth) / 2.0), (dotBigHeight) / 2.0);
                } else{
                    controlPoint = CGPointMake(currentImageX - (self.dotMargin + dotNomalWidth - dotBigWidth) / 2.0 + (self.dotMargin + dotNomalWidth), (dotBigHeight) / 2.0);
                }
                [self startrRotationImageView:self.animationImageView duration:1.0 controlPoint:controlPoint clockwise:(currentImageX > lastImageViewX)];
                [self startrRotationImageView:self.animationImageView duration:1.0 clockwise:(currentImageX > lastImageViewX)];
            } completion:^(BOOL finished) {
                if (finished) {
                    self.animationImageView.frame = CGRectMake(currentImageX, 0, dotBigWidth, dotBigHeight);
                }
            }];
        }
    }
}

- (void)setDotNomalSize:(CGSize)dotNomalSize {
    _dotNomalSize = dotNomalSize;
}

- (void)setDotBigSize:(CGSize)dotBigSize {
    _dotNomalSize = dotBigSize;
}

- (void)setDotMargin:(CGFloat)dotMargin {
    _dotMargin = dotMargin;
}

- (void)setPages:(NSInteger)pages {
    _pages = pages;
    if (0 == pages) return;
    if (_pageDots && 0 == _pageDots.count) {
        _pageDots = nil;
        [self pageDots];
    }
    else [self pageDots];
}

- (void)setStartPagee:(NSInteger)startPage {
    _startPage = startPage;
    [self updateCurrentPage:startPage];
}

- (void)setDotAlpha:(CGFloat)dotAlpha {
    _dotAlpha = dotAlpha;
}

- (void)setNormalPageImage:(UIImage *)normalPageImage {
    _normalPageImage = normalPageImage;
    if (_pageDots && 0 == _pageDots.count) {
        _pageDots = nil;
        [self pageDots];
    }
    else [self pageDots];
    for (UIImageView *page in self.pageDots) {
        page.image = normalPageImage;
    }
}

- (void)setCurrentPageImage:(UIImage *)currentPageImage {
    _currentPageImage = currentPageImage;
    if (_pageDots && 0 == _pageDots.count) {
        _pageDots = nil;
        [self pageDots];
    }
    else [self pageDots];
    self.animationImageView.image = currentPageImage;
    
}

- (NSMutableArray *)pageDots {
    CGFloat dotNomalWidth  = self.dotNomalSize.width;
    CGFloat dotNomalHeight = self.dotNomalSize.height;
    CGFloat dotBigWidth    = self.dotBigSize.width;
    CGFloat dotBigHeight   = self.dotBigSize.height;
    if (!_pageDots) {
        _pageDots = [NSMutableArray array];
        for (int i = 0; i < self.pages; i ++) {
            if (0 == i) {
                self.animationImageView.frame = CGRectMake( self.dotMargin - (dotBigWidth - dotNomalWidth) / 2.0, 0, dotBigWidth, dotBigHeight);
            }
            UIImageView *dotView = [[UIImageView alloc]init];
            dotView.frame = CGRectMake(self.dotMargin + i * (self.dotMargin + dotNomalWidth), (dotBigHeight - dotNomalHeight) / 2.0, dotNomalWidth, dotNomalHeight);
            dotView.layer.cornerRadius = dotView.frame.size.height / 2.0;
            dotView.alpha = _dotAlpha ? _dotAlpha : 0.5 ;
            dotView.image = _normalPageImage;
            [self addSubview:dotView];
            [_pageDots addObject:dotView];
        }
    }
    return _pageDots;
}

- (void)startrRotationImageView:(UIImageView *)imageView duration:(CGFloat)duration clockwise:(BOOL)clockwise {
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: clockwise ? M_PI * 2.0 : -M_PI * 2.0 ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 1;
    [imageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)startrRotationImageView:(UIImageView *)imageView duration:(CGFloat)duration controlPoint:(CGPoint)controlPoint clockwise:(BOOL)clockwise {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    //设置动画属性，因为是沿着贝塞尔曲线动，所以要设置为position
    animation.keyPath = @"position";
    //设置动画时间
    animation.duration = duration;
    // 告诉在动画结束的时候不要移除
    animation.removedOnCompletion = YES;
    // 始终保持最新的效果
    //animation.fillMode = kCAFillModeForwards;
    //贝塞尔曲线
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:controlPoint radius:((_dotMargin + _dotNomalSize.width ) /2.0) startAngle: clockwise ? M_PI : 0 endAngle: clockwise ? 0 : M_PI clockwise: clockwise];
    // 设置贝塞尔曲线路径
    animation.path = circlePath.CGPath;
    // 将动画对象添加到视图的layer上
    [imageView.layer addAnimation:animation forKey:@"position"];
}


- (void)stopRotationImageView:(UIImageView *)imageView {
    [imageView.layer removeAnimationForKey:@"rotationAnimation"];
}


- (void)hideRotationImageView:(UIImageView *)imageView {
    self.animationImageView.hidden = YES;
    [UIView animateWithDuration:0.9 animations:^{
        
    } completion:^(BOOL finished) {
        if (finished) {
            self.animationImageView.hidden = NO;
        }
    }];
}

- (UIImageView *)animationImageView {
    if (!_animationImageView) {
        _animationImageView = [[UIImageView alloc]init];
        _animationImageView.image = _currentPageImage ;
         [self addSubview:_animationImageView];
    }
    return _animationImageView;
}

- (void)dealloc {
    NSLog(@"dealloc--DDGHorizontalPageControl");
}

@end
