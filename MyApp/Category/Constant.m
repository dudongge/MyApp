//
//  constant.m
//  ceshi
//
//  Created by 刘安愿 on 2018/11/6.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

#import "Constant.h"
#import <sys/utsname.h>
@implementation Constant


//手机型号
+ (NSString *)iphoneType{
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *phoneType = [NSString stringWithCString: systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if([phoneType  isEqualToString:@"iPhone1,1"])  return @"iPhone 2G";
    
    if([phoneType  isEqualToString:@"iPhone1,2"])  return @"iPhone 3G";
    
    if([phoneType  isEqualToString:@"iPhone2,1"])  return @"iPhone 3GS";
    
    if([phoneType  isEqualToString:@"iPhone3,1"])  return @"iPhone 4";
    
    if([phoneType  isEqualToString:@"iPhone3,2"])  return @"iPhone 4";
    
    if([phoneType  isEqualToString:@"iPhone3,3"])  return @"iPhone 4";
    
    if([phoneType  isEqualToString:@"iPhone4,1"])  return @"iPhone 4S";
    
    if([phoneType  isEqualToString:@"iPhone5,1"])  return @"iPhone 5";
    
    if([phoneType  isEqualToString:@"iPhone5,2"])  return @"iPhone 5";
    
    if([phoneType  isEqualToString:@"iPhone5,3"])  return @"iPhone 5c";
    
    if([phoneType  isEqualToString:@"iPhone5,4"])  return @"iPhone 5c";
    
    if([phoneType  isEqualToString:@"iPhone6,1"])  return @"iPhone 5s";
    
    if([phoneType  isEqualToString:@"iPhone6,2"])  return @"iPhone 5s";
    
    if([phoneType  isEqualToString:@"iPhone7,1"])  return @"iPhone 6 Plus";
    
    if([phoneType  isEqualToString:@"iPhone7,2"])  return @"iPhone 6";
    
    if([phoneType  isEqualToString:@"iPhone8,1"])  return @"iPhone 6s";
    
    if([phoneType  isEqualToString:@"iPhone8,2"])  return @"iPhone 6s Plus";
    
    if([phoneType  isEqualToString:@"iPhone8,4"])  return @"iPhone SE";
    
    if([phoneType  isEqualToString:@"iPhone9,1"])  return @"iPhone 7";
    
    if([phoneType  isEqualToString:@"iPhone9,2"])  return @"iPhone 7 Plus";
    
    if([phoneType  isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    
    if([phoneType  isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    
    if([phoneType  isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    
    if([phoneType  isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    
    if([phoneType  isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    
    if([phoneType  isEqualToString:@"iPhone10,6"]) return @"iPhone X";
    
    if([phoneType  isEqualToString:@"iPhone11,8"]) return @"iPhone XR";
    
    if([phoneType  isEqualToString:@"iPhone11,2"]) return @"iPhone XS";
    
    if([phoneType  isEqualToString:@"iPhone11,4"]) return @"iPhone XS Max";
    
    if([phoneType  isEqualToString:@"iPhone11,6"]) return @"iPhone XS Max";
    
    
    //iPod 系列
    if ([phoneType isEqualToString:@"iPod1,1"]) return @"iPod Touch 1G";
    if ([phoneType isEqualToString:@"iPod2,1"]) return @"iPod Touch 2G";
    if ([phoneType isEqualToString:@"iPod3,1"]) return @"iPod Touch 3G";
    if ([phoneType isEqualToString:@"iPod4,1"]) return @"iPod Touch 4G";
    if ([phoneType isEqualToString:@"iPod5,1"]) return @"iPod Touch 5G";
    
    //iPad 系列
    if ([phoneType isEqualToString:@"iPad1,1"]) return @"iPad";
    if ([phoneType isEqualToString:@"iPad2,1"]) return @"iPad 2 (WiFi)";
    if ([phoneType isEqualToString:@"iPad2,2"]) return @"iPad 2 (GSM)";
    if ([phoneType isEqualToString:@"iPad2,3"]) return @"iPad 2 (CDMA)";
    if ([phoneType isEqualToString:@"iPad2,4"]) return @"iPad 2 (32nm)";
    if ([phoneType isEqualToString:@"iPad2,5"]) return @"iPad mini (WiFi)";
    if ([phoneType isEqualToString:@"iPad2,6"]) return @"iPad mini (GSM)";
    if ([phoneType isEqualToString:@"iPad2,7"]) return @"iPad mini (CDMA)";
    
    if ([phoneType isEqualToString:@"iPad3,1"]) return @"iPad 3(WiFi)";
    if ([phoneType isEqualToString:@"iPad3,2"]) return @"iPad 3(CDMA)";
    if ([phoneType isEqualToString:@"iPad3,3"]) return @"iPad 3(4G)";
    if ([phoneType isEqualToString:@"iPad3,4"]) return @"iPad 4 (WiFi)";
    if ([phoneType isEqualToString:@"iPad3,5"]) return @"iPad 4 (4G)";
    if ([phoneType isEqualToString:@"iPad3,6"]) return @"iPad 4 (CDMA)";
    
    if ([phoneType isEqualToString:@"iPad4,1"]) return @"iPad Air";
    if ([phoneType isEqualToString:@"iPad4,2"]) return @"iPad Air";
    if ([phoneType isEqualToString:@"iPad4,3"]) return @"iPad Air";
    if ([phoneType isEqualToString:@"iPad5,3"]) return @"iPad Air 2";
    if ([phoneType isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
    if ([phoneType isEqualToString:@"i386"]) return @"Simulator";
    if ([phoneType isEqualToString:@"x86_64"]) return @"Simulator";
    
    if ([phoneType isEqualToString:@"iPad4,4"]
        ||[phoneType isEqualToString:@"iPad4,5"]
        ||[phoneType isEqualToString:@"iPad4,6"]) return @"iPad mini 2";
    
    if ([phoneType isEqualToString:@"iPad4,7"]
        ||[phoneType isEqualToString:@"iPad4,8"]
        ||[phoneType isEqualToString:@"iPad4,9"]) return @"iPad mini 3";
    
    
    
    
    return @"不识别的手机型号";
}

//获取设备名称
+ (NSString *)deviceName{
    return [[UIDevice currentDevice] name];
}
//获取系统版本号
+ (NSString *)systemVersion{
    return [[UIDevice currentDevice] systemVersion];
}
//获取设备唯一标识符
+ (NSString *)deviceUUID{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}
//获取app版本号
+ (NSString *)appVersion{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    return appVersion;
}
//获取App的build版本
+ (NSString *)appBuildVersion{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appBuildVersion = [infoDic objectForKey:@"CFBundleVersion"];
    return appBuildVersion;
}
//获取App的名称
+ (NSString *)appName{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appName = [infoDic objectForKey:@"CFBundleDisplayName"];
    return appName;
}

//获取当前手机的状态栏的高度
+ (CGFloat)statusBarHeight{
    CGRect statusBarFrame = [[UIApplication sharedApplication]statusBarFrame];
    return statusBarFrame.size.height;
}


//当前界面导航栏的frame
+ (CGFloat)navigationBarHeightWith:(UIViewController *)viewController{
    CGRect navBarFrame = viewController.navigationController.navigationBar.frame;
    return navBarFrame.size.height;
}
//判断是不是iphone xj以及更高的手机型号
+ (BOOL)iphonexAndMore{
    if ([[self iphoneType] isEqualToString:@"iphone XR"] || [[self iphoneType] isEqualToString:@"iphone X"] || [[self iphoneType] isEqualToString:@"iphone XS"] || [[self iphoneType] isEqualToString:@"iphone XS MAX"] || [[self iphoneType] isEqualToString:@"Simulator"]  ) {
        return YES;
    }else{
        return NO;
    }
}
//rgb转换
+ (UIColor *)colorWithRGB:(int)rgb {
    return [UIColor colorWithRed:((rgb & 0xFF0000) >> 16) / 255.0f
                           green:((rgb & 0xFF00) >> 8) / 255.0f
                            blue:((rgb & 0xFF)) / 255.0f
                           alpha:1.0f];
}

//获得字符串的高度
+(float) heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width{
    UIColor  *backgroundColor=[UIColor blackColor];
    UIFont *font=[UIFont boldSystemFontOfSize:fontSize];
    CGRect sizeToFit = [value boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSForegroundColorAttributeName:backgroundColor,                                                   NSFontAttributeName:font} context:nil];
    return sizeToFit.size.height;
}
//获得字符串的宽度
+(float) widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height{
    UIColor  *backgroundColor=[UIColor blackColor];
    UIFont *font=[UIFont boldSystemFontOfSize:fontSize];
    CGRect sizeToFit = [value boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSForegroundColorAttributeName:backgroundColor,                                                   NSFontAttributeName:font} context:nil];
    return sizeToFit.size.width;
}

//设置状态栏颜色
+ (void)setStatusBarBackgroundColor:(UIColor *)color{
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}

@end
