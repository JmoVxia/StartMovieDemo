//
//  AppDelegate.m
//  StartMovieDemo
//
//  Created by JmoVxia on 2016/10/14.
//  Copyright © 2016年 JmoVxia. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "CLViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
/*
    BOOL isFirstLogin = [CLViewController isFirstLauch];
    if (isFirstLogin) {
        //是第一次
        self.window.rootViewController = [[CLViewController alloc]init];
        CLViewController *vc = [[CLViewController alloc]init];
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"1"ofType:@"mp4"]];
        vc.movieURL = url;
        self.window.rootViewController = vc;
        NSLog(@"第一次启动或者程序更新");
    }else{
        //不是首次启动
        ViewController *viewCtrl = [[ViewController alloc]init];
        self.window.rootViewController = viewCtrl;
        NSLog(@"不是首次启动");
    }
*/   
    
    self.window.rootViewController = [[CLViewController alloc]init];
    CLViewController *vc = [[CLViewController alloc]init];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"1"ofType:@"mp4"]];
    vc.movieURL = url;
    self.window.rootViewController = vc;
    
    
    
    
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
