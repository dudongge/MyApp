//
//  MyButton.h
//  MyApp
//
//  Created by dudongge on 2018/12/18.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    MyButtonImageAlignmentnomal      = 0,    // Visually normal left aligned
    MyButtonImageAlignmentTop        = 1,    // Visually left aligned
    MyButtonImageAlignmentLeft       = 2,    // Visually centered
    MyButtonImageAlignmentBottom     = 3,    // Visually right aligned
    MyButtonImageAlignmentRight      = 4,    // Fully-justified. The last line in a paragraph is natural-aligned.
} MyButtonImageAlignmentTYpe;

NS_ASSUME_NONNULL_BEGIN

@interface MyButton : UIControl

/**
 要显示的图标
 */
@property (nonatomic, strong) UIImageView *imageView;

/**
 标题
 */
@property (nonatomic, strong) UILabel *titleLabel;

/**
 点击回调
 */
@property (nonatomic, copy) void (^myButtonBlock)(MyButton *);

/**
 自定义按钮初始化方法

 @param image 默认的图片
 @param title 标题
 @param titleFond 标题大小
 @param imageMargin 标题与图标的距离
 @param imageAlignmentTYpe 图片的显示类型
 @return 自定义按钮的实例
 */
- (instancetype)initWithImage:(UIImage  *) image
                        title:(NSString *) title
                    titleFond:(UIFont *)   titleFond
                  imageMargin:(CGFloat)    imageMargin
           imageAlignmentTYpe:(MyButtonImageAlignmentTYpe )imageAlignmentTYpe;



/**
 自定义按钮初始化方法
 
 @param image 默认的图片
 @param title 标题
 @param titleFond 标题大小
 @param titleColor 标题颜色
 @param imageMargin 标题与图标的距离
 @param imageAlignmentTYpe 图片的显示类型
 @return 自定义按钮的实例
 */
- (instancetype)initWithImage:(UIImage  *) image
                        title:(NSString *) title
                    titleFond:(UIFont *)   titleFond
                   titleColor:(UIColor *)  titleColor
                  imageMargin:(CGFloat)    imageMargin
           imageAlignmentTYpe:(MyButtonImageAlignmentTYpe )imageAlignmentTYpe;

/**
 自定义按钮初始化方法
 
 @param image 默认的图片
 @param titleAttribute 富文本标题
 @param imageMargin 标题与图标的距离
 @param imageAlignmentTYpe 图片的显示类型
 @return 自定义按钮的实例
 */
- (instancetype)initWithImage:(UIImage  *)           image
               titleAttribute:(NSAttributedString *) titleAttribute
                  imageMargin:(CGFloat)              imageMargin
           imageAlignmentTYpe:(MyButtonImageAlignmentTYpe )imageAlignmentTYpe;


/**
 设置不同状态下的图片

 @param image 图片
 @param myState 按钮状态
 */
- (void)setImage:(UIImage *)image  withState:(UIControlState)myState;

/**
 设置标题显示

 @param title 标题
 @param myState 按钮状态
 */
- (void)setTitle:(NSString *)title  withState:(UIControlState)myState;


/**
 设置按钮的颜色

 @param color 传入颜色
 @param myState 按钮状态
 */
- (void)setTitleColor:(UIColor *)color  withState:(UIControlState)myState;

/**
 设置背景颜色

 @param color 传入颜色
 @param myState 按钮状态
 */
- (void)setBackGroundColor:(UIColor *)color  withState:(UIControlState)myState;

- (void)setTltleAttributes:(NSAttributedString *)attributedText withState:(UIControlState)myState;

@end

NS_ASSUME_NONNULL_END
