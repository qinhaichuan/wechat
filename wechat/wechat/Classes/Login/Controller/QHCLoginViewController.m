//
//  QHCLoginViewController.m
//  wechat
//
//  Created by QHC on 5/12/16.
//  Copyright © 2016 秦海川. All rights reserved.
//

#import "QHCLoginViewController.h"
#import "UIView+AdjustFrame.h"
#import <EMSDK.h>

@interface QHCLoginViewController()

@property(nonatomic, weak) UITextField *userNameTextF;
@property(nonatomic, weak) UITextField *pwdTextF;

@end

@implementation QHCLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupSubviews];
}

- (void)setupSubviews
{
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UITextField *userNameTextF = [[UITextField alloc] init];
    self.userNameTextF = userNameTextF;
    userNameTextF.font = [UIFont systemFontOfSize:12];
    userNameTextF.borderStyle = UITextBorderStyleRoundedRect;
    userNameTextF.placeholder = @"请输入账号";
    userNameTextF.width = 200;
    userNameTextF.height = 30;
    userNameTextF.center = CGPointMake(self.view.width / 2, 100);
    [self.view addSubview:userNameTextF];
    
    UITextField *pwdTextF = [[UITextField alloc] init];
    self.pwdTextF = pwdTextF;
    pwdTextF.font = [UIFont systemFontOfSize:12];
    pwdTextF.borderStyle = UITextBorderStyleRoundedRect;
    pwdTextF.placeholder = @"请输入账号";
    pwdTextF.width = 200;
    pwdTextF.height = 30;
    pwdTextF.center = CGPointMake(self.view.width / 2, 150);
    [self.view addSubview:pwdTextF];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setBackgroundColor:[UIColor blackColor]];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.textColor = [UIColor whiteColor];
    loginBtn.layer.cornerRadius = 5;
    [loginBtn.layer setBorderWidth:1];
    [loginBtn.layer setBorderColor:[UIColor yellowColor].CGColor];
    loginBtn.width = 70;
    loginBtn.height = 20;
    loginBtn.center = CGPointMake(self.view.width / 2, 200);
    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerBtn setBackgroundColor:[UIColor blackColor]];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    registerBtn.titleLabel.textColor = [UIColor whiteColor];
    registerBtn.layer.cornerRadius = 5;
    [registerBtn.layer setBorderWidth:1];
    [registerBtn.layer setBorderColor:[UIColor yellowColor].CGColor];
    registerBtn.width = 70;
    registerBtn.height = 20;
    registerBtn.center = CGPointMake(self.view.width / 2, 250);
    [registerBtn addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
}

- (void)loginClick
{
    // 点击登录首先判断有没有自动登录, 如果没有就设置自动登录为打开
    BOOL isAutoLogin = [EMClient sharedClient].options.isAutoLogin;
    if (!isAutoLogin) {
        EMError *error = [[EMClient sharedClient] loginWithUsername:self.userNameTextF.text password:self.pwdTextF.text];
        if (!error) {
            NSLog(@"登录成功");
            [[EMClient sharedClient].options setIsAutoLogin:YES];
        }
    }
   
  

}

- (void)registerClick
{
    EMError *error = [[EMClient sharedClient] registerWithUsername:self.userNameTextF.text password:self.pwdTextF.text];
    if (error==nil) {
        NSLog(@"注册成功");
    }

}





- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
