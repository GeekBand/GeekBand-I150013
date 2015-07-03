//
//  AppDelegate.m
//  HousewareShare_IOS
//
//  Created by as4 on 15/6/25.
//  Copyright (c) 2015年 GBHS. All rights reserved.
//

#import <AFNetworkActivityIndicatorManager.h>
#import <AFNetworkReachabilityManager.h>
#import "AppDelegate.h"
#import "ApiManager.h"
#import "ApiManager+Login.h"
#import "LoginManager.h"
#import "GBHSLoginTableViewController.h"
#import "GBHSRewardTableViewController.h"
#import "GBHSHomeTableViewController.h"
#import "GBHSHouseholdDutiesTableViewController.h"
#import "macro.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    /**
     *  网路情况监控
     */
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    
    /**
     *  主页面设置
     */
    self.window = [[UIWindow alloc] initWithFrame:kMainScreenBounds];
    
    // TODO:暂时用反向判定
    self.window.rootViewController = ![LoginManager currentLoginUser] ? [self setUpMainController] : [[GBHSLoginTableViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    return YES;
}


/**
 *  创建主页面
 *
 *  @return 
 */
- (UITabBarController*)setUpMainController
{
    
    UITabBarController *mainController = [[UITabBarController alloc] init];
    UINavigationController * homeTab = [[UINavigationController alloc] initWithRootViewController:[[GBHSHomeTableViewController alloc] init]];
    homeTab.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"家庭" image:[UIImage imageNamed:@"me_normal"] tag:1];
    
    UINavigationController * householdTab = [[UINavigationController alloc] initWithRootViewController:[[GBHSHouseholdDutiesTableViewController alloc] init]];
    householdTab.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"家务" image:[UIImage imageNamed:@"me_normal"] tag:1];
    
    UINavigationController * rewardTab = [[UINavigationController alloc] initWithRootViewController:[[GBHSHomeTableViewController alloc] initWithStyle:UITableViewStyleGrouped]];
    rewardTab.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"奖励" image:[UIImage imageNamed:@"me_normal"] tag:1];
    
    mainController.viewControllers = @[householdTab, homeTab, rewardTab];
    
    return mainController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
