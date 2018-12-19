//
//  UIView+LLExtension.h
//  LLWeibo
//
//  Created by 刘安愿 on 2018/11/11.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LLExtension)

@property (nonatomic, assign)CGFloat x;

@property (nonatomic, assign)CGFloat y;

@property (nonatomic, assign)CGFloat width;

@property (nonatomic, assign)CGFloat height;



@property (nonatomic, assign)CGSize size;

@property (nonatomic, assign)CGPoint origin;

@property (nonatomic, assign)CGFloat centerX;

@property (nonatomic, assign)CGFloat centerY;

@property (nonatomic, assign)CGPoint center;

/**
 * @brief 移除此view上的所有子视图
 */
- (void)removeAllSubviews;



@end

NS_ASSUME_NONNULL_END
