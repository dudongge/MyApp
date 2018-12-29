//
//  UIView+DDGExtension.h
//  DDGRefreshView
//
//  Created by dudongge on 2018/12/26.
//  Copyright © 2018 dudongge. All rights reserved.
//

/*
 
 *********************************************************************************
 *
 * 🌟🌟🌟 新建DDGCycleScrollView交流QQ群：185534916 🌟🌟🌟
 *
 * 在您使用此自动轮播库的过程中如果出现bug请及时以以下任意一种方式联系我们，我们会及时修复bug并
 * 帮您解决问题。
 * 新浪微博:GDDG_iOS
 * Email : gDDGios@126.com
 * GitHub: https://github.com/gDDGios
 *
 * 另（我的自动布局库DDGAutoLayout）：
 *  一行代码搞定自动布局！支持Cell和Tableview高度自适应，Label和ScrollView内容自适应，致力于
 *  做最简单易用的AutoLayout库。
 * 视频教程：http://www.letv.com/ptv/vplay/24038772.html
 * 用法示例：https://github.com/gDDGios/DDGAutoLayout/blob/master/README.md
 * GitHub：https://github.com/gDDGios/DDGAutoLayout
 *********************************************************************************
 
 */

#import <UIKit/UIKit.h>

#define DDGColorCreater(r, g, b, a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]


@interface UIView (DDGExtension)

@property (nonatomic, assign) CGFloat ddg_height;
@property (nonatomic, assign) CGFloat ddg_width;

@property (nonatomic, assign) CGFloat ddg_y;
@property (nonatomic, assign) CGFloat ddg_x;

@end
