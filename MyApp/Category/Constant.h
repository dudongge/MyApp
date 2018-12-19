//
//  constant.h
//  ceshi
//
//  Created by 刘安愿 on 2018/11/6.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Constant : NSObject
/** 手机型号 */
+ (NSString *)iphoneType;
/** 获取设备名称 */
+ (NSString *)deviceName;
/** 获取系统版本号 */
+ (NSString *)systemVersion;
/** 获取设备唯一标识符 */
+ (NSString *)deviceUUID;
/** 获取app版本号 */
+ (NSString *)appVersion;
/** 获取App的build版本 */
+ (NSString *)appBuildVersion;
/** 获取App的名称 */
+ (NSString *)appName;
/** 获取当前手机的状态栏的高度 */
+ (CGFloat)navigationBarHeightWith:(UIViewController *)viewController;
/** 获取当前手机的状态栏的高度 */
+ (CGFloat)statusBarHeight;
/** 判断是不是iphone xj以及更高的手机型号 */
+ (BOOL)iphonexAndMore;
/** rgb转换 */
+ (UIColor *)colorWithRGB:(int)rgb;
/** 获得字符串的高度 */
+(float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;
/** 设置状态栏颜色 */
+ (void)setStatusBarBackgroundColor:(UIColor *)color;
/** 获得字符串的宽度 */
+(float) widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height;
@end

NS_ASSUME_NONNULL_END
