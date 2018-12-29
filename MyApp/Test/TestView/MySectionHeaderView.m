//
//  MySectionHeaderView.m
//  MyApp
//
//  Created by dudongge on 2018/12/24.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import "MySectionHeaderView.h"


@interface MySectionHeaderView ()

@end

@implementation MySectionHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.userInteractionEnabled = YES;
        [self _initSubviews];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _initSubviews];
    }
    return self;
}

- (void)_initSubviews {
    [self addSubview:self.showButton];
    [self.showButton addTarget:self action:@selector(showButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //NSLayoutConstraint *showButtonCenterYLc = [NSLayoutConstraint constraintWithItem:self.showButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    //NSLayoutConstraint *showButtonCenterXLc = [NSLayoutConstraint constraintWithItem:self.showButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    //NSLayoutConstraint *showButtonHeightLC = [NSLayoutConstraint constraintWithItem:self.showButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:30];
    //NSLayoutConstraint *showButtonWidthLC = [NSLayoutConstraint constraintWithItem:self.showButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:130];
    //[self.showButton addConstraints:@[showButtonWidthLC]];
    //[self addConstraints:@[showButtonCenterYLc,showButtonCenterXLc]];
    
    
}

- (void)showButtonClick: (MyButton *)button {
    self.showButton.selected = !self.showButton.selected;
    if (self.showBlock) {
        self.showBlock(self.showButton.selected);
    }
}

- (MyButton *)showButton {
    if (!_showButton) {
        _showButton = [[MyButton alloc]initWithImage:[UIImage imageNamed:@"cache_pause"]
                                               title:@"展开"
                                           titleFond:[UIFont systemFontOfSize:14.0]
                                         imageMargin:10.0
                                  imageAlignmentTYpe:MyButtonImageAlignmentRight];
        [_showButton setTitle:@"合闭" withState:UIControlStateSelected];
        [_showButton setImage:[UIImage imageNamed:@"cache_delete"] withState:UIControlStateSelected];
        _showButton.backgroundColor = UIColor.grayColor;
        _showButton.frame = CGRectMake(100, 5, 200, 30);
    }
    return _showButton;
}

@end
