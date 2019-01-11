//
//  ChildrenListModel.h
//  haier_edu
//
//  Created by dudongge on 2019/1/11.
//  Copyright © 2019 刘浩. All rights reserved.
/*
 "id": "1080797779988992002",
 "title": "课时3-1",
 "learningDuration": "2秒",
 "isLearned": false,*/

#import <Foundation/Foundation.h>
#import "YYModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChildrenListModel : NSObject
@property(nonatomic, copy)    NSString *id; //课程id
@property(nonatomic, copy)    NSString *title;
@property(nonatomic, copy)    NSString *learningDuration;
@property(nonatomic, assign)  BOOL   isLearned;

@end

NS_ASSUME_NONNULL_END
