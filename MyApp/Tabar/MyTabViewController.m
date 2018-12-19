//
//  MyTabViewController.m
//  MyApp
//
//  Created by dudongge on 2018/12/19.
//  Copyright © 2018 dudongge. All rights reserved.
//

#import "MyTabViewController.h"
#import "LLNavigationController.h"
#import "HomeViewController.h"
#import "MineViewController.h"

@interface MyTabViewController ()

@end

@implementation MyTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //首页
    HomeViewController *home = [[HomeViewController alloc] init];
    [self addChildViewController:home
                           title:@"首页"
                           image:@"tabbar_home_n_ico"
                    selectedmage:@"tabbar_home_h_ico"];
    
    MineViewController *mine = [[MineViewController alloc] init];
    [self addChildViewController:mine
                           title:@"我的"
                           image:@"tabbar_user_n_ico"
                    selectedmage:@"tabbar_user_h_ico"];
    
    
    
    
}


/**
 添加一个字控制器
 
 @param viewController  字控制器
 @param title           标题（tabbar：title nav：title）
 @param image           图片
 @param selectedmage    选中的图片
 @return                该控制器
 */
- (UIViewController *)addChildViewController:(UIViewController *)viewController title:(NSString *)title image:(NSString *)image selectedmage:(NSString *)selectedmage{
    
    
    // 设置一个自定义 View,大小等于 tabBar 的大小
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    // 给自定义 View 设置颜色
    bgView.backgroundColor = [UIColor whiteColor];
    // 将自定义 View 添加到 tabBar 上
    [self.tabBar insertSubview:bgView atIndex:0];
    
    LLNavigationController *nav = [[LLNavigationController alloc] initWithRootViewController:viewController];
    viewController.navigationController.navigationBar.translucent = NO;
    self.tabBar.translucent = NO;
    viewController.navigationItem.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:image];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedmage];
    viewController.tabBarItem.title = title;
    //viewController.tabBarItem.image = [UIImage imageWithOriginalImage:image];
    //viewController.tabBarItem.selectedImage = [UIImage imageWithOriginalImage:selectedmage];
    NSMutableDictionary *attributeDic = [NSMutableDictionary dictionary];
    attributeDic[NSForegroundColorAttributeName] = UIColor.grayColor;
    [viewController.tabBarItem setTitleTextAttributes:attributeDic forState:UIControlStateNormal];
    NSMutableDictionary *selectedAttributeDic = [NSMutableDictionary dictionary];
    selectedAttributeDic[NSForegroundColorAttributeName] = [UIColor blueColor];
    [viewController.tabBarItem setTitleTextAttributes:selectedAttributeDic forState:UIControlStateSelected];
    
    
    [self addChildViewController:nav];
    
    return viewController;
}

@end
