//
//  LancherViewController.m
//  Twtter启动动画
//
//  Created by 刘明 on 16/8/25.
//  Copyright © 2016年 LM. All rights reserved.
//

#import "LancherViewController.h"

@interface LancherViewController ()
@property(nonatomic,strong)UIView* lanchView;
@property(nonatomic,strong)UIImageView* logoView;
@end

@implementation LancherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lanchView = [[UIView alloc]initWithFrame:self.view.frame];
    self.lanchView.backgroundColor = [UIColor colorWithRed:26/255.0 green:178/255.0 blue:232/255.0 alpha:1.0];
    self.logoView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"twtter"]];
    self.logoView.frame = CGRectMake(0, 0, 130, 130);
    self.logoView.center = self.lanchView.center;
    [self.lanchView addSubview:self.logoView];
    [self.view addSubview:self.lanchView];
    [self startAninmation];
}

-(void)startAninmation{
    [UIView animateWithDuration:0.2 animations:^{
        self.logoView.frame = CGRectMake(0, 0, 50, 50);
        self.logoView.center = self.lanchView.center;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            self.logoView.frame = CGRectMake(0, 0, 5000, 5000);
            self.logoView.center = self.lanchView.center;
            self.lanchView.alpha = 0;

        } completion:^(BOOL finished) {
            //通知控制中心切换根控制器
                        [[NSNotificationCenter defaultCenter]postNotificationName:@"SwithRootViewController" object:@"yes"];
            [self.lanchView removeFromSuperview];
            
        }];
    }];
}

@end
