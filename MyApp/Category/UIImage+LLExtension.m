//
//  UIImage+LLExtension.m
//  LLWeibo
//
//  Created by 刘安愿 on 2018/11/12.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

#import "UIImage+LLExtension.h"

@implementation UIImage (LLExtension)
+ (UIImage *)imageWithOriginalImage:(NSString *)image{
    UIImage *img = [UIImage imageNamed:image];
    return [img imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
}
@end
