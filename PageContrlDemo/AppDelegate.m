//
//  AppDelegate.m
//  PageContrlDemo
//
//  Created by 郭妙友 on 2018/9/2.
//  Copyright © 2018年 miaoyou.gmy. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController = [ViewController new];
    [_window makeKeyAndVisible];
    return YES;
}




@end
