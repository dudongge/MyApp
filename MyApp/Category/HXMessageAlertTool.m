//
//  HXMessageAlertTool.m
//  wx
//
//  Created by 刘安愿 on 2018/12/11.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

#import "HXMessageAlertTool.h"

@implementation HXMessageAlertTool
+ (UIAlertController *)alertTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle cancelAction:(void(^)(void))cancelAction confirmTitle:(NSString *)confirmTitle confirmAction:(void(^)(void))confirmAction{
    //弹窗
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:(UIAlertControllerStyleAlert)];
    
    // 使用富文本来改变alert的message字体大小和颜色
    NSMutableAttributedString *messageAtt = [[NSMutableAttributedString alloc] initWithString:message];
    [messageAtt addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, message.length)];
    [messageAtt addAttribute:NSForegroundColorAttributeName value:LLColorRGB(0x333333) range:NSMakeRange(0, message.length)];
    [alert setValue:messageAtt forKey:@"attributedMessage"];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:cancelTitle style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        cancelAction();
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        confirmAction();
    }];
    [action1 setValue:LLColorRGB(0x3377ff) forKey:@"_titleTextColor"];
    [action2 setValue:LLColorRGB(0x3377ff) forKey:@"_titleTextColor"];
    [alert addAction:action1];
    [alert addAction:action2];
    return alert;
}









@end
