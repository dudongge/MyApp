//
//  MyAleartView.m
//  MyApp
//
//  Created by dudongge on 2018/12/19.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import "MyAleartView.h"

@interface MyAleartView()
@property (nonatomic, strong) UIView *customView;
@property (nonatomic, assign) CGSize customViewSize;
@end

@implementation MyAleartView

-(instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithCustomView:(UIView *)customView withSize:(CGSize)customViewSize {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.customView = customView;
        self.customViewSize = customViewSize;
        [self _initWithViews];
    }
    return self;
}


- (void) _initWithViews {
    if (!self.customView) return;
    
}



@end
