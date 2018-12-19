//
//  UIBarButtonItem+LLExtension.h
//  LLWeibo
//
//  Created by 刘安愿 on 2018/11/11.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (LLExtension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end

NS_ASSUME_NONNULL_END
