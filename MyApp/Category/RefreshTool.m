//
//  RefreshTool.m
//  test1
//
//  Created by 刘安愿 on 2018/12/5.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

#import "RefreshTool.h"

@implementation RefreshTool


/**
 下拉刷新加载动画
 */
+ (MJRefreshGifHeader *)mj_gifRefreshWithTarget:(id)target action:(SEL)action{
    //动画刷新效果
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:target refreshingAction:action];
    //设置图片
    //普通
    NSArray *imgArray1 = @[[UIImage imageNamed:@"refresh-1"],[UIImage imageNamed:@"refresh-2"],[UIImage imageNamed:@"refresh-3"]];
    [header setImages:imgArray1 forState:(MJRefreshStateIdle)];
    
    //松开手
    NSArray *imgArray2 = @[[UIImage imageNamed:@"refresh-1"],[UIImage imageNamed:@"refresh-2"],[UIImage imageNamed:@"refresh-3"]];
    [header setImages:imgArray2 forState:(MJRefreshStatePulling)];
    
    //正在刷新
    NSArray *imgArray3 = @[[UIImage imageNamed:@"refresh-1"],[UIImage imageNamed:@"refresh-2"],[UIImage imageNamed:@"refresh-3"]];
    [header setImages:imgArray3 forState:(MJRefreshStateRefreshing)];
    
    
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    return header;
}



@end
