//
//  BBComicSegmentItem.m
//  UISegmentContol
//
//  Created by dudongge on 2018/11/24.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import "BBComicSegmentItem.h"
#import "SegmentCalendarModel.h"


@interface BBComicSegmentItem ()

@property (nonatomic, strong) UILabel               *monthDayLabel;
@property (nonatomic, strong) UILabel               *weekLabel;
@property (nonatomic, strong) UIView                *todayFlagView;
@property (nonatomic, strong) UIColor               *bgBlueColor;
@property (nonatomic, strong) UIColor               *bgGrayColor;
@property (nonatomic, strong) UIColor               *bgWhiteColor;
@property (nonatomic, strong) UIColor               *mDBlackColor;
@property (nonatomic, strong) SegmentCalendarModel  *calendarModel;

@end

@implementation BBComicSegmentItem

- (instancetype)init {
    self = [super init];
    if (self) {
        [self _initializeSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _initializeSubviews];
    }
    return self;
}

- (instancetype)initWithSegmentCalendarModels:(SegmentCalendarModel *)calendarModel {
       self = [super initWithFrame:CGRectZero];
        if (self) {
            self.calendarModel = calendarModel;
            [self _initializeSubviews];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
            [tap addTarget:self action:@selector(tapClick:)];
            [self addGestureRecognizer:tap];
        }
        return self;
}

- (void)_initializeSubviews {
    self.bgBlueColor  = UIColor.blueColor;
    self.bgGrayColor  = UIColor.grayColor;
    self.bgWhiteColor = UIColor.whiteColor;
    self.mDBlackColor = UIColor.blackColor;
    
    self.todayFlagView.hidden = !self.calendarModel.isToday;
    self.monthDayLabel.text   = self.calendarModel.monthDay;
    self.weekLabel.text       = self.calendarModel.weekday;
    if (self.calendarModel.isToday) {
        self.weekLabel.backgroundColor   = self.bgBlueColor;
        self.weekLabel.clipsToBounds     = YES;
        self.weekLabel.textColor         = self.bgWhiteColor;
        self.monthDayLabel.textColor     = self.mDBlackColor;
    } else {
        self.weekLabel.backgroundColor   = self.bgWhiteColor;
        self.weekLabel.layer.borderColor = self.bgWhiteColor.CGColor;
        self.weekLabel.textColor         = self.bgGrayColor;
        self.monthDayLabel.textColor     = self.bgGrayColor;
    }
    
    [self.todayFlagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(8);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.height.width.mas_equalTo(4);
    }];
    
    [self.monthDayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.todayFlagView.mas_bottom).offset(2);
    }];
    
    [self.weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.monthDayLabel.mas_bottom).offset(4);
        make.height.width.mas_equalTo(24);
    }];
}

- (void)tapClick:(UITapGestureRecognizer *)tap {
    if ([self.delegate respondsToSelector:@selector(selectedSegmentItemIndex:)]) {
        [self.delegate selectedSegmentItemIndex:self.myIndex];
    }
}

- (void)updateState:(BOOL)selected {
    self.selected = selected;
    if (self.selected) {
        if (self.calendarModel.isToday) {
            self.todayFlagView.backgroundColor = self.bgBlueColor;
            self.weekLabel.backgroundColor     = self.bgBlueColor;
            self.weekLabel.layer.borderColor   = self.bgBlueColor.CGColor;
            self.weekLabel.textColor           = self.bgWhiteColor;
        } else {
            self.todayFlagView.backgroundColor = self.bgWhiteColor;
            self.weekLabel.backgroundColor     = self.bgWhiteColor;
            self.weekLabel.textColor           = self.bgBlueColor;
            self.weekLabel.layer.cornerRadius  = 12.0;
            self.weekLabel.layer.borderColor   = self.bgBlueColor.CGColor;
            self.weekLabel.layer.borderWidth   = 1.0;
            self.weekLabel.clipsToBounds       = YES;
            self.monthDayLabel.layer.borderColor = self.bgBlueColor.CGColor;
        }
        self.monthDayLabel.textColor           = self.mDBlackColor;
    } else {
        self.weekLabel.backgroundColor         = self.bgWhiteColor;
        self.weekLabel.layer.borderColor       = self.bgWhiteColor.CGColor;
        self.weekLabel.textColor               = self.bgGrayColor;
        if (self.calendarModel.isToday) {
            self.todayFlagView.backgroundColor = self.bgGrayColor;
            self.monthDayLabel.textColor       = self.bgGrayColor;
        } else {
            self.todayFlagView.backgroundColor = self.bgWhiteColor;
            self.monthDayLabel.textColor       = self.bgGrayColor;
        }
    }
}

- (UILabel *)monthDayLabel {
    if (!_monthDayLabel) {
        _monthDayLabel = [[UILabel alloc]init];
        [self addSubview:_monthDayLabel];
        _monthDayLabel.textAlignment = NSTextAlignmentCenter;
        _monthDayLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:12.0];
        _monthDayLabel.textColor = self.bgGrayColor;
    }
    return _monthDayLabel;
}

- (UILabel *)weekLabel {
    if (!_weekLabel) {
        _weekLabel = [[UILabel alloc]init];
        [self addSubview:_weekLabel];
        _weekLabel.textAlignment = NSTextAlignmentCenter;
        _weekLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14.0];
        _weekLabel.layer.cornerRadius = 12.0;
        _weekLabel.layer.borderColor = self.bgBlueColor.CGColor;
        _weekLabel.layer.borderWidth = 1.0;
        _weekLabel.clipsToBounds = YES;
    }
    return _weekLabel;
}

- (UIView *)todayFlagView {
    if (!_todayFlagView) {
        _todayFlagView = [[UIView alloc]init];
        [self addSubview:_todayFlagView];
        _todayFlagView.backgroundColor = self.bgBlueColor;
        _todayFlagView.layer.cornerRadius = 2.0;
    }
    return _todayFlagView;
}

@end


