//
//  CatalogueListAppModel.m
//  haier_edu
//
//  Created by dudongge on 2019/1/11.
//  Copyright © 2019 刘浩. All rights reserved.
//

#import "CatalogueListAppModel.h"

@implementation CatalogueListAppModel
+ (NSArray *)modelCustomPropertyMapper {
    return @{  @"courseId" : @"id",
               @"title" : @"title",
               @"learningDuration" : @"learningDuration",
               @"isLearned" : @"isLearned",
               @"childrenList" : [ChildrenListModel class]};
}
@end
