//
//  MySectionHeaderView.h
//  MyApp
//
//  Created by dudongge on 2018/12/24.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface MySectionHeaderView : UITableViewHeaderFooterView
@property (nonatomic, strong) UIButton *showButton;
@property (nonatomic, copy) void(^showBlock)(BOOL);
- (void)updateTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
