//
//  AppDelegate.m
//  Twtter启动动画
//
//  Created by 刘明 on 16/8/24.
//  Copyright © 2016年 LM. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "LancherViewController.h"
#define  SwithRootViewController   @"SwithRootViewController"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //注册更换控制器通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeRootViewController:) name:SwithRootViewController object:nil];
    LancherViewController * lancher = [[LancherViewController alloc]init];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController =lancher;
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)changeRootViewController:(NSNotification*)notiy{
    if(notiy.object){
        ViewController* vc = [[ViewController alloc]init];
        self.window.rootViewController =vc;
    }
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
