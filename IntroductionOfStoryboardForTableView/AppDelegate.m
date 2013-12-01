//
//  AppDelegate.m
//  IntroductionOfStoryboardForTableView
//
//  Created by akuraru on 2013/12/01.
//  Copyright (c) 2013年 akuraru. All rights reserved.
//

#import "AppDelegate.h"
#import "ListViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CGRect frame = [[UIScreen mainScreen] bounds];
    UIViewController *controller = [[ListViewController alloc] init];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:controller];
    self.window = [[UIWindow alloc] initWithFrame:frame];
    _window.rootViewController = navigation;
    [self.window makeKeyAndVisible];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
