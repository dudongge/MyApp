//
//  LLNavBar.m
//  test1
//
//  Created by 刘安愿 on 2018/11/27.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

#define statusBarHeightForLowIphoneX 20
#define statusBarHeightForMoreIphoneX 44
#import "HXNavBar.h"

@implementation HXNavBar



/**
 导航条（1、标题）

 @param viewController 当前控制器
 @param navTitle 标题名称
 @return 导航条view
 */
+ (UIView *)navWithTarget:(UIViewController *)viewController title:(NSString *)navTitle{
    //导航条view
    UIView *navView = [self navView];
    [viewController.view addSubview:navView];
    
    //标题
    UILabel *titleLabel = [self navTitle:navTitle];
    [navView addSubview:titleLabel];
    
    return navView;
}




/**
 导航条（ 1、标题 2、左侧图片(使用UIImageView控件)  ）
 
 @param viewController 当前控制器
 @param navTitle 标题名称
 @return 导航条view
 */
+ (UIView *)navWithTarget:(UIViewController *)viewController
                    title:(NSString *)navTitle
            leftImgString:(NSString *)leftImg
          leftImageAction:(SEL)leftImageAction{
    //导航条view
    UIView *navView = [self navView];
    [viewController.view addSubview:navView];
    
    //标题
    UILabel *titleLabel = [self navTitle:navTitle];
    [navView addSubview:titleLabel];
    
    //左侧图片
    UIImageView *leftImageView = [self navImageViewWithTarget:viewController image:leftImg action:leftImageAction];
    [navView addSubview:leftImageView];
    
    
    return navView;
    
}







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
    leftButtonImageAction:(SEL)leftButtonImageAction{
    //导航条view
    UIView *navView = [self navView];
    [viewController.view addSubview:navView];
    
    //标题
    UILabel *titleLabel = [self navTitle:navTitle];
    [navView addSubview:titleLabel];
    
    //左侧图片(UIButton)
    UIButton *leftButton = [self navLeftButtonWithTarget:viewController
                                             imageString:leftImg
                                          highlightImage:leftHighlightImg
                                                  action:leftButtonImageAction];
    [navView addSubview:leftButton];
    
    
    return navView;
    
}






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
   rightButtonImageAction:(SEL)rightButtonImageAction{
    //导航条view
    UIView *navView = [self navView];
    [viewController.view addSubview:navView];
    
    //标题
    UILabel *titleLabel = [self navTitle:navTitle];
    [navView addSubview:titleLabel];
    
    //右侧图片(UIButton)
    UIButton *rightButton = [self navRightButtonWithTarget:viewController
                                               imageString:rightImg
                                            highlightImage:rightHighlightImg
                                                    action:rightButtonImageAction];
    [navView addSubview:rightButton];
    
    
    return navView;
    
}





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
   rightButtonImageAction:(SEL)rightButtonImageAction {
    
    
    //导航条view
    UIView *navView = [self navView];
    [viewController.view addSubview:navView];
    
    //标题
    UILabel *titleLabel = [self navTitle:navTitle];
    [navView addSubview:titleLabel];
    
    //左侧图片(UIButton)
    UIButton *leftButton = [self navLeftButtonWithTarget:viewController
                                             imageString:leftImg
                                          highlightImage:leftHighlightImg
                                                  action:leftButtonImageAction];
    [navView addSubview:leftButton];
    
    //右侧图片(UIButton)
    UIButton *rightButton = [self navRightButtonWithTarget:viewController
                                               imageString:rightImg
                                            highlightImage:rightHighlightImg
                                                    action:rightButtonImageAction];
    [navView addSubview:rightButton];
    
    return navView;
    
}





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
   rightButtonTextAction:(SEL)rightButtonTextAction{
    //导航条view
    UIView *navView = [self navView];
    [viewController.view addSubview:navView];
    
    //标题
    UILabel *titleLabel = [self navTitle:navTitle];
    [navView addSubview:titleLabel];
    
    //右侧文字(UIButton)
    UIButton *rightButton = [self navRightButtonWithTarget:viewController btnText:rightBtnText action:rightButtonTextAction];
    [navView addSubview:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.mas_offset(-10);
        make.top.mas_offset( [Constant iphonexAndMore] ? (statusBarHeightForMoreIphoneX ):( statusBarHeightForLowIphoneX ));
        make.height.mas_offset(44);
    }];
    [rightButton sizeToFit];
    
    return navView;
    
}



















//导航条view
+ (UIView *)navView{
    UIView *nav = [[UIView alloc] init];
    nav.x = 0;
    nav.y = 0;
    nav.width = screen_width;
    nav.height =  [Constant iphonexAndMore] ? (statusBarHeightForMoreIphoneX + 44):(44 + statusBarHeightForLowIphoneX);
    nav.backgroundColor = [UIColor whiteColor];
    [self bottomLineViewWithSuperView:nav];
    return nav;
}
//下划线
+ (UIView *)bottomLineViewWithSuperView:(UIView *)superView{
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = LLColor(204, 204, 204);
    lineView.height = 1;
    lineView.width = superView.width;
    lineView.x = 0;
    lineView.y = superView.height - 1;
    [superView addSubview:lineView];
    return lineView;
}



//标题
+ (UILabel *)navTitle:(NSString *)title{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:17];
    
    [titleLabel sizeToFit];
    titleLabel.centerX = screen_width / 2 ;
    titleLabel.centerY = [Constant iphonexAndMore] ? (statusBarHeightForMoreIphoneX + 44/ 2):( statusBarHeightForLowIphoneX + 44/ 2);
    return titleLabel;
}

//左侧图片(使用UIImageView)
+ (UIImageView *)navImageViewWithTarget:(id)target image:(NSString *)imgString action:(SEL)action{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    imageView.width = 40;
    imageView.height = 40;
    imageView.centerX = 20+ 10;
    imageView.centerY = [Constant iphonexAndMore] ? (statusBarHeightForMoreIphoneX + 44/ 2):( statusBarHeightForLowIphoneX + 44/ 2);
    imageView.contentMode = UIViewContentModeCenter;
    [imageView setImage: [UIImage imageNamed:imgString]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [imageView addGestureRecognizer:tap];
    
    return imageView;
}

//左侧图片(使用UIButton)
+ (UIButton *)navLeftButtonWithTarget:(id)target imageString:(NSString *)imgString highlightImage:(NSString *)highlightImgString action:(SEL)action{
    UIButton *btn = [[UIButton alloc] init];
    btn.userInteractionEnabled = YES;
    btn.width = 40;
    btn.height = 40;
    btn.centerX = 20+ 10;
    btn.centerY = [Constant iphonexAndMore] ? (statusBarHeightForMoreIphoneX + 44/ 2):( statusBarHeightForLowIphoneX + 44/ 2);
    [btn setImage:[UIImage imageNamed:imgString] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightImgString]  forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}


//右侧图片(使用UIButton)
+ (UIButton *)navRightButtonWithTarget:(id)target imageString:(NSString *)imgString highlightImage:(NSString *)highlightImgString action:(SEL)action{
    UIButton *btn = [[UIButton alloc] init];
    btn.userInteractionEnabled = YES;
    btn.width = 40;
    btn.height = 40;
    btn.centerX = screen_width - (20+ 10);
    btn.centerY = [Constant iphonexAndMore] ? (statusBarHeightForMoreIphoneX + 44/ 2):( statusBarHeightForLowIphoneX + 44/ 2);
    [btn setImage:[UIImage imageNamed:imgString] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightImgString]  forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

//右侧字体(使用UIButton)
+ (UIButton *)navRightButtonWithTarget:(id)target btnText:(NSString *)btnText action:(SEL)action{
    UIButton *btn = [[UIButton alloc] init];
    btn.userInteractionEnabled = YES;
//    btn.width = 40;
//    btn.height = 40;
//    btn.centerX = screen_width - (20 + 10);
//    btn.centerY = [Constant iphonexAndMore] ? (statusBarHeightForMoreIphoneX + 44/ 2):( statusBarHeightForLowIphoneX + 44/ 2);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [btn setTitle:btnText forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
//    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}















@end
