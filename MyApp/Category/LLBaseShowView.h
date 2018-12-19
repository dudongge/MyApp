//
//  LLDropDownMenu.h
//  LLWeibo
//
//  Created by 刘安愿 on 2018/11/20.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

/**
 
 用法
 UITableViewController *vc = [[UITableViewController alloc] init];
 vc.view.width = screen_width - 100;
 vc.view.height = screen_height - 200;
 
 LLDropDownMenu *menu = [LLDropDownMenu menu];
 menu.contentController = vc;
 menu.contentCornerRadius = 10;
 menu.menuFrom = LLDropDownMenuFromRight;
 [menu showWindowCenter];
 
 */


/** 弹出视图进入的方式 */
typedef enum : NSUInteger {
    LLDropDownMenuFromTop,       //从上面进入
    LLDropDownMenuFromBottom,    //从下面进入
    LLDropDownMenuFromLeft,      //从左侧进入
    LLDropDownMenuFromRight,     //从右侧进入
    LLDropDownMenuFromCenter     //从中心进入
} LLDropDownMenuFrom;

#import <UIKit/UIKit.h>
@class LLBaseShowView;
@protocol LLBaseShowViewDelegate<NSObject>
@optional
- (void)dropdownMenuDidDismiss:(LLBaseShowView *)menu;
- (void)dropdownMenuDidShow:(LLBaseShowView *)menu;
@end
NS_ASSUME_NONNULL_BEGIN

@interface LLBaseShowView : UIView
/**
 * 可以加载一个view  必须要传   view.height
 * 可以加载一个controller  必须要传。 vc.view.height
 */

/**
 初始化
 */
+ (instancetype)menu;

/**
 将内容显示在window的中心
 */
- (void)showWindowCenter;
/**
 移除
 */
- (void)dismiss;

/**
 内容
 */
@property (nonatomic, strong) UIView *content;
/**
 背景色的透明度0-1(背景色默认是：黑色)
 */
@property (nonatomic, assign) CGFloat bgAlpha;
/**
 弹出视图进入的方式
 */
@property (nonatomic, assign) LLDropDownMenuFrom menuFrom;
/**
 内容视图四个角的圆角
 */
@property (nonatomic, assign) CGFloat contentCornerRadius;

/**
 内容控制器
 */
@property (nonatomic, strong) UIViewController *contentController;

/**
  代理
 */
@property (nonatomic, weak) id<LLBaseShowViewDelegate> delegate;


@end

NS_ASSUME_NONNULL_END


















