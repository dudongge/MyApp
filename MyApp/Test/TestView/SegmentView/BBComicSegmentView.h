//
//  BBComicSegmentView.h
//  UISegmentContol
//
//  Created by dudongge on 2018/11/24.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol BBComicSegmentViewDelegate <NSObject>

/**
 点击item的回调

 @param index 回调的索引
 */
- (void)selectedSegmentViewIndex:(NSInteger )index;

@end

@interface BBComicSegmentView : UIView

@property (nonatomic, weak) id <BBComicSegmentViewDelegate> delegate;

//block回调
@property (nonatomic, copy) void(^segmentViewBlock)(NSInteger index);

/**
 手动更新

 @param index 更新的索引
 */
- (void)updateSegmentViewSelected:(NSInteger )index;

@end


