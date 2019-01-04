//
//  SegmentCalendarModel.m
//  MyApp
//
//  Created by dudongge on 2019/1/3.
//  Copyright © 2019 dudongge. All rights reserved.
//

#import "SegmentCalendarModel.h"

@implementation SegmentCalendarModel

- (instancetype)initWithFullDate:(NSString *)fullDate
                        monthDay:(NSString *)monthDay
                         weekday:(NSString *)weekday
                         isToday:(BOOL)isToday
                        selected:(BOOL)selected {
    if (self = [super init]) {
        self.fullDate = fullDate;
        self.monthDay = monthDay;
        self.weekday  = weekday;
        self.isToday  = isToday;
        self.selected = selected;
    }
    return self;
}

@end
