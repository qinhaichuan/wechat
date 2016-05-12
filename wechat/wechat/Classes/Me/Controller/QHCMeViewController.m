//
//  QHCMeViewController.m
//  wechat
//
//  Created by QHC on 5/12/16.
//  Copyright © 2016 秦海川. All rights reserved.
//

#import "QHCMeViewController.h"
#import "UIView+AdjustFrame.h"
#import <EMSDK.h>
#import "QHCLoginViewController.h"

@interface QHCMeViewController()<EMClientDelegate>

@end

@implementation QHCMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[EMClient sharedClient] addDelegate:self delegateQueue:nil];
    
    [self setupSubview];
    
}

- (void)setupSubview
{
    UIButton *exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [exitBtn setTitle:@"退  出" forState:UIControlStateNormal];
    exitBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    exitBtn.titleLabel.textColor = [UIColor whiteColor];
    [exitBtn setBackgroundColor:[UIColor blackColor]];
    [exitBtn.layer setBorderColor:[UIColor yellowColor].CGColor];
    [exitBtn.layer setBorderWidth:2];
    exitBtn.layer.cornerRadius = 5;
    exitBtn.width = 150;
    exitBtn.height = 50;
    exitBtn.center = CGPointMake(self.view.width/2, 300);
    [exitBtn addTarget:self action:@selector(logOutClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:exitBtn];

}

/*
 退出登录分两种类型：主动退出登录和被动退出登录。
 
 主动退出登录：调用SDK的退出接口；
 被动退出登录：1. 正在登录的账号在另一台设备上登录；2. 正在登录的账号被从服务器端删除。
 logout:YES：是否解除device token的绑定，在被动退出时SDK内部处理，不需要调用退出方法
 */
- (void)logOutClick
{
    EMError *error = [[EMClient sharedClient] logout:YES];
    if (!error) {
        NSLog(@"退出成功");
        
        [UIApplication sharedApplication].keyWindow.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[QHCLoginViewController alloc] init]];
        
    }else{
        NSLog(@"退出失败");
    }
}

/*!
 *  当前登录账号在其它设备登录时会接收到该回调
 */
- (void)didLoginFromOtherDevice
{
    

}

/*!
 *  当前登录账号已经被从服务器端删除时会收到该回调
 */
- (void)didRemovedFromServer
{

}

@end
