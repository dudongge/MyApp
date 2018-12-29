//
//  DDGAnimationPageControl.h
//  MyApp
//
//  Created by dudongge on 2018/12/26.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    DDGAnimationPageControlNoamal,
    DDGAnimationPageControlRotation,
    DDGAnimationPageControlJump,
} DDGAnimationPageControlType;

@interface DDGAnimationPageControl : UIView

@property (nonatomic, assign) NSInteger                   pages;
@property (nonatomic, assign) NSInteger                   startPage;
@property (nonatomic, assign) CGFloat                     dotAlpha;
@property (nonatomic, assign) CGFloat                     dotMargin;
@property (nonatomic, assign) CGSize                      dotNomalSize;
@property (nonatomic, assign) CGSize                      dotBigSize;
@property (nonatomic, strong) UIImage                     *currentPageImage;
@property (nonatomic, strong) UIImage                     *normalPageImage;
@property (nonatomic, assign) DDGAnimationPageControlType  animationType;

- (void)updateCurrentPage:(NSInteger)page ;

+ (instancetype)initWithinitWithFrame:(CGRect)frame pageCount:(NSInteger)pages currentPageImage:(UIImage *)currentPageImage normalPageImage:(UIImage *)normalPageImage;

+ (instancetype)initWithinitWithFrame:(CGRect)frame pageCount:(NSInteger)pages startPage:(NSInteger)startPage currentPageImage:(UIImage *)currentPageImage normalPageImage:(UIImage *)normalPageImage;

+ (instancetype)initWithinitWithFrame:(CGRect)frame dotBigSize:(CGSize)dotBigSize dotNomalSize:(CGSize)dotNomalSize dotMargin:(CGFloat)dotMargin pageCount:(NSInteger)pages startPage:(NSInteger)startPage currentPageImage:(UIImage *)currentPageImage normalPageImage:(UIImage *)normalPageImage;

@end

