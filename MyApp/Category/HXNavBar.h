//
//  LLNavBar.h
//  test1
//
//  Created by 刘安愿 on 2018/11/27.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

 //iphoneXR  状态栏的高度是44
 //导航栏的高度是44
 //iphone6sp 状态栏的高度是20
 //导航栏的高度是44
 //
 //LLLog(@"状态栏的高度======%f",[Constant statusBarHeight]);
 //LLLog(@"导航栏的高度======%f",[Constant navigationBarHeightWith:self]);



@interface HXNavBar : NSObject



/**
导航条（1、标题）

@param viewController 当前控制器的view
@param navTitle 标题名称
@return 导航条view
*/
+ (UIView *)navWithTarget:(UIViewController *)viewController
                    title:(NSString *)navTitle;




/**
  导航条（ 1、标题 2、左侧图片(使用UIImageView控件)  ）

 @param viewController 当前控制器
 @param navTitle 标题名称
 @param leftImg 图片
 @param leftImageAction 点击事件
 @return 导航条view
 */
+ (UIView *)navWithTarget:(UIViewController *)viewController
                    title:(NSString *)navTitle
            leftImgString:(NSString *)leftImg
          leftImageAction:(SEL)leftImageAction;





/**
 导航条（ 1、标题 2、左侧图片(使用UIButton控件)  ）

 @param viewController 当前控制器
 @param navTitle 标题名称
 @param leftImg 图片
 @param leftHighlightImg 高亮图片
 @param leftButtonImageAction 点击事件
 @return 导航条view
 */
+ (UIView *)navWithTarget:(UIViewController *)viewController
                    title:(NSString *)navTitle
      leftButtonImgString:(NSString *)leftImg
leftButtonHighlightImgString:(NSString *)leftHighlightImg
    leftButtonImageAction:(SEL)leftButtonImageAction;





/**
 导航条（ 1、标题 2、右侧图片(使用UIButton控件)  ）

 @param viewController 当前控制器
 @param navTitle 标题名称
 @param rightImg 图片
 @param rightHighlightImg 高亮图片
 @param rightButtonImageAction 点击事件
 @return 导航条view
 */
+ (UIView *)navWithTarget:(UIViewController *)viewController
                    title:(NSString *)navTitle
     rightButtonImgString:(NSString *)rightImg
rightButtonHighlightImgString:(NSString *)rightHighlightImg
   rightButtonImageAction:(SEL)rightButtonImageAction;






/**
 
 导航条（ 1、标题 2、左侧图片(使用UIButton控件)  3、右侧图片(使用UIButton控件)）

 @param viewController 当前控制器
 @param navTitle 标题名称
 @param leftImg 左侧图片
 @param leftHighlightImg 左侧高亮图片
 @param leftButtonImageAction 左侧点击事件
 @param rightImg 右侧图片
 @param rightHighlightImg 右侧高亮图片
 @param rightButtonImageAction 右侧点击事件
 @return 导航条view
 */
+ (UIView *)navWithTarget:(UIViewController *)viewController
                    title:(NSString *)navTitle
      leftButtonImgString:(NSString *)leftImg
leftButtonHighlightImgString:(NSString *)leftHighlightImg
    leftButtonImageAction:(SEL)leftButtonImageAction
     rightButtonImgString:(NSString *)rightImg
rightButtonHighlightImgString:(NSString *)rightHighlightImg
   rightButtonImageAction:(SEL)rightButtonImageAction;







/**
  导航条（ 1、标题 2、右侧文字(使用UIButton控件)）

 @param viewController 当前控制器
 @param navTitle 标题名称
 @param rightBtnText 右侧文字
 @param rightButtonTextAction 点击事件
 @return 导航条view
 */
+ (UIView *)navWithTarget:(UIViewController *)viewController
                    title:(NSString *)navTitle
          rightButtonText:(NSString *)rightBtnText
    rightButtonTextAction:(SEL)rightButtonTextAction;



















@end

NS_ASSUME_NONNULL_END
