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
}

- (void)updateTitle:(NSString *)title {
    [self.showButton setTitle:title forState:UIControlStateNormal];
}

- (void)showButtonClick: (UIButton *)button {
    self.showButton.selected = !self.showButton.selected;
    if (self.showBlock) {
        self.showBlock(self.showButton.selected);
    }
}

- (UIButton *)showButton {
    if (!_showButton) {
        _showButton.backgroundColor = UIColor.grayColor;
        _showButton.frame = CGRectMake(100, 5, 200, 30);
        [_showButton setTitle:@"展开" forState:UIControlStateNormal];
    }
    return _showButton;
}

@end
