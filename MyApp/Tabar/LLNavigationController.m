//
//  LLNavigationController.m
//  LLWeibo
//
//  Created by 刘安愿 on 2018/11/11.
//  Copyright © 2018年 刘安愿. All rights reserved.
//

#import "LLNavigationController.h"

@implementation LLNavigationController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationBar.hidden = YES;
    
    UIButton *back = [[UIButton alloc]init];
    back.frame = CGRectMake(10, 10, 30, 30);
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [self.navigationController.navigationBar addSubview:back];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}


- (void)back{
    [self popViewControllerAnimated:YES];
}
- (void)more{
    [self popToRootViewControllerAnimated:YES];
}













@end



//    if (self.childViewControllers.count > 0) {
//        viewController.hidesBottomBarWhenPushed = YES;
//
//        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
//        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
//
//    }
//    [super pushViewController:viewController animated:animated];
//+ (void)initialize{
//
//   UIBarButtonItem *item = [UIBarButtonItem appearance];
//    NSMutableDictionary *attributeDic = [NSMutableDictionary dictionary];
//    attributeDic[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    attributeDic[NSFontAttributeName] = [UIFont systemFontOfSize:15];
//    [item setTitleTextAttributes:attributeDic forState:UIControlStateNormal];
//
//
//    NSMutableDictionary *selectedattributeDic = [NSMutableDictionary dictionary];
//    selectedattributeDic[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    selectedattributeDic[NSFontAttributeName] = [UIFont systemFontOfSize:15];
//    [item setTitleTextAttributes:selectedattributeDic forState:UIControlStateSelected];
//
//    NSMutableDictionary *disableAttributeDic = [NSMutableDictionary dictionary];
//    disableAttributeDic[NSForegroundColorAttributeName] = LLColor(123, 123, 123);
//    disableAttributeDic[NSFontAttributeName] = [UIFont systemFontOfSize:15];
//    [item setTitleTextAttributes:disableAttributeDic forState:UIControlStateDisabled];
//
//    NSMutableDictionary *highAttributeDic = [NSMutableDictionary dictionary];
//    highAttributeDic[NSForegroundColorAttributeName] = LLColor(123, 123, 123);
//    highAttributeDic[NSFontAttributeName] = [UIFont systemFontOfSize:15];
//    [item setTitleTextAttributes:highAttributeDic forState:UIControlStateHighlighted];
//}
