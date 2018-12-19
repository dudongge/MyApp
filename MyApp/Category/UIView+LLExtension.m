//
//  UIView+LLExtension.m
//  LLWeibo
//
//  Created by 刘安愿 on 2018/11/11.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

#import "UIView+LLExtension.h"

@implementation UIView (LLExtension)
@dynamic x;
@dynamic y;
@dynamic size;
@dynamic width;
@dynamic height;
@dynamic origin;

- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
- (void)setCenterX:(CGFloat)centerX{
    CGRect frame = self.frame;
    frame.origin.x = centerX - frame.size.width / 2;
    self.frame = frame;
}
- (void)setCenterY:(CGFloat)centerY{
    CGRect frame = self.frame;
    frame.origin.y = centerY - frame.size.height / 2;
    self.frame = frame;
}
- (void)setCenter:(CGPoint)center{
    CGRect frame = self.frame;
    frame.origin.x = center.x - frame.size.width / 2;
    frame.origin.y = center.y - frame.size.height / 2;
    self.frame = frame;
}



- (CGFloat)x{
    return self.frame.origin.x;
}
- (CGFloat)y{
    return self.frame.origin.y;
}

- (CGSize)size{
    return self.frame.size;
}
- (CGFloat)width{
    return self.frame.size.width;
}
- (CGFloat)height{
    return self.frame.size.height;
}
- (CGPoint)origin{
    return self.frame.origin;
}

- (CGFloat)centerX{
    return self.frame.origin.x + self.frame.size.width / 2;
}
- (CGFloat)centerY{
    return self.frame.origin.y + self.frame.size.height / 2;
}
- (CGPoint)center{
    return CGPointMake(self.frame.origin.x + self.frame.size.width / 2, self.frame.origin.y + self.frame.size.height / 2);
}



/**
 * @brief 移除此view上的所有子视图
 */
- (void)removeAllSubviews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    return;
}


@end
