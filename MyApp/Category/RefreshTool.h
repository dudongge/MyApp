//
//  RefreshTool.h
//  test1
//
//  Created by 刘安愿 on 2018/12/5.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJRefresh.h>

NS_ASSUME_NONNULL_BEGIN

@interface RefreshTool : NSObject
/**
 下拉刷新加载动画
 */
+ (MJRefreshGifHeader *)mj_gifRefreshWithTarget:(id)target action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
