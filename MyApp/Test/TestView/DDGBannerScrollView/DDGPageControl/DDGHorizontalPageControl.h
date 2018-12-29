//
//  DDGHorizontalPageControl.h
//  MyApp
//
//  Created by dudongge on 2018/12/26.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DDGHorizontalPageControl : UIView
@property (nonatomic, assign) NSInteger  pages;
@property (nonatomic, assign) NSInteger  startPage;
@property (nonatomic, assign) CGFloat    dotAlpha;
@property (nonatomic, assign) CGFloat    dotMargin;
@property (nonatomic, assign) CGSize     dotNomalSize;
@property (nonatomic, assign) CGSize     dotBigSize;
@property (nonatomic, strong) UIColor    *currentPageColor;
@property (nonatomic, strong) UIColor    *normalPageColor;

- (void)updateCurrentPage:(NSInteger)page ;
- (void)updateCurrentPage:(NSInteger)page offset:(CGFloat)offset;

@end


