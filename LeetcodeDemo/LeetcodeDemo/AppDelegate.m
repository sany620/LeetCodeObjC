//
//  AppDelegate.m
//  LeetcodeDemo
//
//  Created by apple on 2020/11/18.
//

#import "AppDelegate.h"
#import "ViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    ViewController *vc = [[ViewController alloc]init];
    CBNavigationController *navController = [[CBNavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
