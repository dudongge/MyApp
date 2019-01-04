//
//  BBComicHomeCalendarModel.h
//  BBComic
//
//  Created by dudongge on 2019/1/3.
//  Copyright © 2019 bilibili. All rights reserved.
//


#import "BBComicHomeCalendarModel.h"

@interface BBComicHomeCalendarModel : NSObject
/// 全日期 "2019-01-02"
@property (nonatomic, copy)     NSString *fullDate;
/// 月-日 12-11
@property (nonatomic, copy)     NSString *monthDay;
/// 星期几 -- 六
@property (nonatomic, copy)     NSString *weekday;
/// 是否选中
@property (nonatomic, assign)   BOOL selected;
/// 是否是今天
@property (nonatomic, assign)   BOOL isToday;

/**
 初始化方法
 
 @param year      全日期 "2019-01-02"
 @param monthDay  月-日 12-11
 @param weekday   星期几 -- 六
 @param isToday   是否选中
 @param selected  是否是今天
 @return          自己的实例对象
 */
- (instancetype)initWithFullDate:(NSString *)year
                        monthDay:(NSString *)monthDay
                         weekday:(NSString *)weekday
                         isToday:(BOOL)isToday
                        selected:(BOOL)selected;
@end

