//
//  HXMessageAlertTool.h
//  wx
//
//  Created by 刘安愿 on 2018/12/11.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HXMessageAlertTool : NSObject

/**
 提示窗
 */
+ (UIAlertController *)alertTitle:(NSString *)title
                          message:(NSString *)message
                      cancelTitle:(NSString *)cancelTitle
                     cancelAction:(void(^)(void))cancelAction
                     confirmTitle:(NSString *)confirmTitle
                    confirmAction:(void(^)(void))confirmAction;


@end

NS_ASSUME_NONNULL_END
