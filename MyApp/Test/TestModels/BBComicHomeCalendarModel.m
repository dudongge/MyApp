//
//  BBComicHomeCalendarModel.m
//  BBComic
//
//  Created by dudongge on 2019/1/3.
//  Copyright © 2019 bilibili. All rights reserved.
//

#import "BBComicHomeCalendarModel.h"

@implementation BBComicHomeCalendarModel

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
