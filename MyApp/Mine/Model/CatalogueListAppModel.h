//
//  CatalogueListAppModel.h
//  haier_edu
//
//  Created by dudongge on 2019/1/11.
//  Copyright © 2019 刘浩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"
#import "ChildrenListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CatalogueListAppModel : NSObject
@property(nonatomic, copy)    NSString *courseId; //课程id
@property(nonatomic, copy)    NSString *title;
@property(nonatomic, copy)    NSString *learningDuration;
@property(nonatomic, assign)  BOOL   isLearned;
@property(nonatomic, strong)  NSArray<ChildrenListModel *> *catalogueListApp;
@end

NS_ASSUME_NONNULL_END
