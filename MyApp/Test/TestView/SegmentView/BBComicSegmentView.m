//
//  BBComicSegmentView.m
//  UISegmentContol
//
//  Created by dudongge on 2018/11/24.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import "BBComicSegmentView.h"
#import "BBComicSegmentItem.h"
#import "SegmentCalendarModel.h"

#define SegmentItemWidth  48
#define SegmentItemHeigh  56
#define SegmentItemTag    170
#define SegmentViewWidth  self.frame.size.width
#define SegmentViewHalfWidth  self.frame.size.width / 2.0
#define SegmentHeight  self.frame.size.height

@interface BBComicSegmentView () <BBComicSegmentItemDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray<SegmentCalendarModel *> *titleModes;
@property (nonatomic, strong) UIScrollView                           *bgScroollView;
@property (nonatomic, strong) UIView                                 *separatorView;
@property (nonatomic, assign) CGFloat                                segmentItemSpace;

@end

@implementation BBComicSegmentView

- (void)dealloc {
    NSLog(@"BBComicSegmentView -- dealloc");
}



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

- (void)_initializeSubviews {    
    if (!self.bgScroollView) {
      self.bgScroollView = [[UIScrollView alloc]init];
    }
    self.bgScroollView.scrollsToTop = NO;
    self.bgScroollView.showsVerticalScrollIndicator = NO;
    self.bgScroollView.showsHorizontalScrollIndicator = NO;
    self.bgScroollView.delegate = self;
    self.bgScroollView.frame = CGRectMake(0, 0, SegmentViewWidth, SegmentItemHeigh + 3);
    [self addSubview:self.bgScroollView];
    self.segmentItemSpace =  0 ;
    CGFloat bgScroollContentX = (SegmentItemWidth + self.segmentItemSpace) * self.titleModes.count + self.segmentItemSpace;
    self.bgScroollView.contentSize = CGSizeMake(bgScroollContentX, SegmentItemHeigh + 3);
    if(self.titleModes.count > 0) {
        for (int i = 0; i < self.titleModes.count; i ++) {
            BBComicSegmentItem *segmentItem = [[BBComicSegmentItem alloc]initWithSegmentCalendarModels:self.titleModes[i]];
            [self.bgScroollView addSubview:segmentItem];
            segmentItem.delegate = self;
            segmentItem.tag = SegmentItemTag + i;
            segmentItem.myIndex = SegmentItemTag + i;
            segmentItem.frame = CGRectMake(i * (SegmentItemWidth + self.segmentItemSpace) + self.segmentItemSpace, 0, SegmentItemWidth, SegmentItemHeigh);
            if (segmentItem.myIndex == SegmentItemTag + 6) {
                [UIView animateWithDuration:0.01 delay:0.3 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                     [segmentItem updateState:YES];
                } completion:nil];
                self.titleModes[segmentItem.tag - SegmentItemTag].selected = YES;
                [self updateScrollViewContentOffset:segmentItem.tag - SegmentItemTag];
            }
        }
    }
    
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
        make.top.mas_equalTo(self.bgScroollView.mas_bottom).offset(3);
        make.height.mas_equalTo(0.5);
    }];
}

#pragma delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

//选择item带来方法
- (void)selectedSegmentItemIndex:(NSInteger)index {
    [self resetItemState];
    for (BBComicSegmentItem *segmentView in self.bgScroollView.subviews) {
        if (segmentView.tag == index) {
            if (!segmentView.selected) {
                [segmentView updateState:YES];
                [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                    [self updateScrollViewContentOffset:segmentView.tag - SegmentItemTag];
                } completion:nil];
                if (self.titleModes[segmentView.tag - SegmentItemTag].selected) {  return;  }
                if ([self.delegate respondsToSelector:@selector(selectedSegmentViewIndex:)]) {
                    [self.delegate selectedSegmentViewIndex:segmentView.tag -SegmentItemTag];
                }
                if (self.segmentViewBlock) {
                    self.segmentViewBlock(segmentView.tag - SegmentItemTag);
                }
            } 
        }
    }
    [self updateTitleModesSlected: index - SegmentItemTag];
}

//更新数据源选中状态
- (void)updateTitleModesSlected:(NSInteger ) index {
    for (int i = 0; i < self.titleModes.count; i ++) {
        if (i == index) {
            self.titleModes[i].selected = YES;
        } else {
            self.titleModes[i].selected = NO;
        }
    }
}

//重置所有状态
- (void)resetItemState {
    for (UIView *segmentView in self.bgScroollView.subviews) {
        if ([segmentView isKindOfClass:[BBComicSegmentItem class]]) {
            BBComicSegmentItem *segment = (BBComicSegmentItem *)segmentView;
            if (segment.selected) {
                [(BBComicSegmentItem *)segmentView updateState:NO];
            }
        }
    }
}

//滚动item至中间
- (void)updateScrollViewContentOffset:(NSInteger )index {
    CGFloat totalContentOffsetX = self.bgScroollView.contentSize.width;
    for (BBComicSegmentItem *segmentView in self.bgScroollView.subviews) {
        if (segmentView.tag == (index + SegmentItemTag)) {
            CGFloat segmentViewCenterX = segmentView.center.x;
            if (self.bgScroollView.contentSize.width < self.bgScroollView.frame.size.width) return;
            if (segmentViewCenterX > SegmentViewHalfWidth && (totalContentOffsetX - segmentViewCenterX) > SegmentViewHalfWidth) {
                CGPoint offset = CGPointMake(segmentViewCenterX - SegmentViewHalfWidth  , 0);
                [UIView animateWithDuration:0.5 animations:^{
                    [self.bgScroollView setContentOffset:offset];
                }];
            } else if (segmentViewCenterX < SegmentViewHalfWidth && (totalContentOffsetX - segmentViewCenterX) > SegmentViewHalfWidth) {
                [UIView animateWithDuration:0.5 animations:^{
                    [self.bgScroollView setContentOffset:CGPointMake(0, 0)];
                }];
            } else if (segmentViewCenterX > SegmentViewHalfWidth && (totalContentOffsetX - segmentViewCenterX) < SegmentViewHalfWidth) {
                [UIView animateWithDuration:0.5 animations:^{
                    [self.bgScroollView setContentOffset:CGPointMake(totalContentOffsetX - SegmentViewWidth, 0)];
                }];
            }
        }
    }
}

//更新状态
- (void)updateSegmentViewSelected:(NSInteger )index {
    [self resetItemState];
    for (BBComicSegmentItem *segmentView in self.bgScroollView.subviews) {
        if (segmentView.tag == index + SegmentItemTag) {
            if (!segmentView.selected) {
                [segmentView updateState:YES];
                [self updateScrollViewContentOffset:segmentView.tag - SegmentItemTag];
            }
        }
    }
}


- (UIView *)separatorView {
    if (!_separatorView) {
        _separatorView = [[UIView alloc]init];
        _separatorView.backgroundColor = UIColor.blackColor;
        _separatorView.alpha = 0.12;
        [self addSubview:_separatorView];
    }
    return _separatorView;
}

- (NSMutableArray<SegmentCalendarModel *> *)titleModes {
    if (!_titleModes) {
        NSArray<SegmentCalendarModel *> *models = [[[self getSixLastDays] reverseObjectEnumerator] allObjects];
        _titleModes = [NSMutableArray arrayWithArray:models];
        for (SegmentCalendarModel *model in [self getNowAndNextDays]) {
            [_titleModes addObject:model];
        }
    }
    return _titleModes;
}

///根据用户输入的时间(dateString)确定当天是星期几,输入的时间格式 yyyy-MM-dd ,如 2015-12-18
- (NSString *)weekDayStr:(NSString*)format {
    NSString *weekDayStr = nil;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    if(format.length >= 10) {
        NSString *nowString = [format substringToIndex:10];
        NSArray *array = [nowString componentsSeparatedByString:@"-"];
        if(0 == array.count) {
            array = [nowString componentsSeparatedByString:@"/"];
        }
        if(array.count >= 3) {
            NSInteger year  = [[array objectAtIndex:0] integerValue];
            NSInteger month = [[array objectAtIndex:1] integerValue];
            NSInteger day   = [[array objectAtIndex:2] integerValue];
            [comps setYear:year];
            [comps setMonth:month];
            [comps setDay:day];
        }
    }
    //日历
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //获取传入date
    NSDate *gregorianDate = [gregorian dateFromComponents:comps];
    NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitWeekday fromDate:gregorianDate];
    NSInteger week = [weekdayComponents weekday];
    switch(week) {
        case 1:
            weekDayStr =@"日";
            break;
        case 2:
            weekDayStr =@"一";
            break;
        case 3:
            weekDayStr =@"二";
            break;
        case 4:
            weekDayStr =@"三";
            break;
        case 5:
            weekDayStr =@"四";
            break;
        case 6:
            weekDayStr =@"五";
            break;
        case 7:
            weekDayStr =@"六";
            break;
        default:
            weekDayStr =@"";
            break;
    }
    return weekDayStr;
}

//用时间戳差值计算前6天，后六天
- (NSMutableArray<SegmentCalendarModel *> *)getSixLastDays {
    NSMutableArray<SegmentCalendarModel *> *dateArrays     = [NSMutableArray array];
    NSTimeInterval timeS = 24 * 60 * 60;
    NSDate *nowDate =[NSDate date];
    NSTimeInterval  nowTimeS = [nowDate timeIntervalSince1970];
    NSTimeInterval totalTime ;
    NSDate *date;
    NSDateFormatter * formatter;
    for (int i = 1; i <= 6 ; i ++) {
        totalTime = nowTimeS - timeS * i ;
        date = [NSDate dateWithTimeIntervalSince1970: totalTime];
        formatter = [[NSDateFormatter alloc]init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSString *dateFullFormate = [formatter stringFromDate:date];
        [formatter setDateFormat:@"MM-dd"];
        NSString *monthDayFormate = [formatter stringFromDate:date];
        SegmentCalendarModel *model = [[SegmentCalendarModel alloc]initWithFullDate:dateFullFormate
                                                                           monthDay:monthDayFormate
                                                                            weekday:[self weekDayStr: dateFullFormate]
                                                                            isToday:NO
                                                                           selected:NO];
        [dateArrays addObject:model];
    }
    return dateArrays;
}

- (NSMutableArray<SegmentCalendarModel *> *)getNowAndNextDays {
    NSMutableArray<SegmentCalendarModel *> *dateArrays = [NSMutableArray array];
    NSTimeInterval timeS = 24 * 60 * 60;
    NSDate *nowDate =[NSDate date];
    NSTimeInterval nowTimeS = [nowDate timeIntervalSince1970];
    for (int i = 0; i <= 6 ; i ++) {
        NSTimeInterval totalTime = nowTimeS + timeS * i;
        NSDate * date = [NSDate dateWithTimeIntervalSince1970:totalTime];
        NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setDateFormat:@"MM-dd"];
        NSString *monthDayFormate = [formatter stringFromDate:date];
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSString *dateFullFormate = [formatter stringFromDate:date];
        SegmentCalendarModel *model;
        if (0 == i) {
            model = [[SegmentCalendarModel alloc]initWithFullDate:dateFullFormate
                                                         monthDay:monthDayFormate
                                                          weekday:[self weekDayStr: dateFullFormate]
                                                          isToday:YES
                                                         selected:YES];
        } else {
            model = [[SegmentCalendarModel alloc]initWithFullDate:dateFullFormate
                                                         monthDay:monthDayFormate
                                                          weekday:[self weekDayStr: dateFullFormate]
                                                          isToday:NO
                                                         selected:NO];
        }
        [dateArrays addObject:model];
    }
    return dateArrays;
}

@end
