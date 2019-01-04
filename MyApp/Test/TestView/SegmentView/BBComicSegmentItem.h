//
//  BBComicSegmentItem.h
//  UISegmentContol
//
//  Created by dudongge on 2018/11/24.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol BBComicSegmentItemDelegate <NSObject>

- (void)selectedSegmentItemIndex:(NSInteger )index;

@end

@class SegmentCalendarModel;
@interface BBComicSegmentItem : UIView

@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) NSInteger myIndex;
@property (nonatomic, weak) id <BBComicSegmentItemDelegate> delegate;
//刷新选中状态
- (void)updateState:(BOOL)selected;
//初始化方法
- (instancetype)initWithSegmentCalendarModels:(SegmentCalendarModel *)calendarModel;

@end

