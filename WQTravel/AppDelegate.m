//
//  AppDelegate.m
//  WQTravel
//
//  Created by 王倩 on 2017/2/18.
//  Copyright © 2017年 王倩. All rights reserved.
//

#import "AppDelegate.h"
#import "WQMainViewController.h"
#import "WQDestinationViewController.h"
#import "WQMineViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tabBarC = [[UITabBarController alloc] init];
    
    // 主页
    WQMainViewController *mainVC = [[WQMainViewController alloc] init];
    
    [mainVC.tabBarItem setTitle:@"首页"];
    [mainVC.tabBarItem setImage:[UIImage imageNamed:@"icon_tab_0_normal"]];
    [mainVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"icon_tab_0_selected"]];
    
    UINavigationController *mainNavC = [[UINavigationController alloc] initWithRootViewController:mainVC];
    [tabBarC addChildViewController:mainNavC];
    
    // 目的地页
    WQDestinationViewController *desVC = [[WQDestinationViewController alloc] init];
    
    [desVC.tabBarItem setTitle:@"目的地"];
    [desVC.tabBarItem setImage:[UIImage imageNamed:@"icon_tab_1_normal"]];
    [desVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"icon_tab_1_selected"]];
    
    [tabBarC addChildViewController:desVC];

    // 我的
    WQMineViewController *mineVC = [[WQMineViewController alloc] init];
    
    [mineVC.tabBarItem setTitle:@"我的"];
    [mineVC.tabBarItem setImage:[UIImage imageNamed:@"icon_tab_2_normal"]];
    [mineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"icon_tab_2_selected"]];
    
    UINavigationController *mineNavC = [[UINavigationController alloc] initWithRootViewController:mineVC];
    [tabBarC addChildViewController:mineNavC];;
    
    [self.window addSubview:tabBarC.view];
    [self.window setRootViewController:tabBarC];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
