//
//  UIImage+LLExtension.h
//  LLWeibo
//
//  Created by 刘安愿 on 2018/11/12.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (LLExtension)

/**
 图片不被渲染

 @param image 图片
 @return 没有被系统渲染的图片
 */
+ (UIImage *)imageWithOriginalImage:(NSString *)image;
@end

NS_ASSUME_NONNULL_END
