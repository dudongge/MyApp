//
//  liveListModel.h
//  haier_edu
//
//  Created by dudongge on 2019/1/11.
//  Copyright © 2019 刘浩. All rights reserved.
/*
 id    String    课程id
 level    Integer    课程id
 title    String    课程标题
 rate    BigDecimal    星级
 enrollCount    Integer    学习人数
 coursePeriod    Integer    课时
 catalogueListApp    List    目录集合 详情参考课程目录接口*/
/*
 "id": "5",
 "title": "测试2-2",
 "learningDuration": null,
 "isLearned": false,
 "childrenList": []
 */

#import <Foundation/Foundation.h>
#import "CatalogueListAppModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface liveListModel : NSObject
@property(nonatomic, copy)    NSString *id; //课程id
@property(nonatomic, assign)  NSInteger level;
@property(nonatomic, copy)    NSString *title;
@property(nonatomic, copy)    NSString *origUrl;
@property(nonatomic, assign)  float   rate;
@property(nonatomic, assign)  NSInteger *enrollCount;
@property(nonatomic, assign)  NSString *coursePeriod;
@property(nonatomic, strong)  NSArray<CatalogueListAppModel *> *catalogueListApp;
@end

NS_ASSUME_NONNULL_END
