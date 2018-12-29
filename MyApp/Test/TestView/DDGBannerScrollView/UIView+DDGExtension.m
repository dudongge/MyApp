//
//  UIView+DDGExtension.m
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




#import "UIView+DDGExtension.h"

@implementation UIView (DDGExtension)

- (CGFloat)ddg_height
{
    return self.frame.size.height;
}

- (void)setDdg_height:(CGFloat)ddg_height
{
    CGRect temp = self.frame;
    temp.size.height = ddg_height;
    self.frame = temp;
}

- (CGFloat)ddg_width
{
    return self.frame.size.width;
}

- (void)setDdg_width:(CGFloat)ddg_width
{
    CGRect temp = self.frame;
    temp.size.width = ddg_width;
    self.frame = temp;
}


- (CGFloat)ddg_y
{
    return self.frame.origin.y;
}

- (void)setDdg_y:(CGFloat)ddg_y
{
    CGRect temp = self.frame;
    temp.origin.y = ddg_y;
    self.frame = temp;
}

- (CGFloat)ddg_x
{
    return self.frame.origin.x;
}

- (void)setDDG_x:(CGFloat)ddg_x
{
    CGRect temp = self.frame;
    temp.origin.x = ddg_x;
    self.frame = temp;
}



@end
