//
//  UIBarButtonItem+LLExtension.m
//  LLWeibo
//
//  Created by 刘安愿 on 2018/11/11.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

#import "UIBarButtonItem+LLExtension.h"

@implementation UIBarButtonItem (LLExtension)
/**
 创建导航条左右图片按钮
 
 @param target 对象
 @param action 动作
 @param image 图片
 @param highImage 高亮
 @return item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    //设置尺寸
    //btn.size = btn.currentBackgroundImage.size;
    return  [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
