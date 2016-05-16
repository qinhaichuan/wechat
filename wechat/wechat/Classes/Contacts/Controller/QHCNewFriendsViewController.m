//
//  QHCNewFriendsViewController.m
//  wechat
//
//  Created by QHC on 5/12/16.
//  Copyright © 2016 秦海川. All rights reserved.
//

#import "QHCNewFriendsViewController.h"

@interface QHCNewFriendsViewController()<EMContactManagerDelegate>

@property(nonatomic, weak) UITextField *friendTextF;

@end

@implementation QHCNewFriendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setupSubViews];
}

- (void)setupSubViews
{
    UITextField *friedTextF = [[UITextField alloc] init];
    self.friendTextF = friedTextF;
    friedTextF.borderStyle = UITextBorderStyleRoundedRect;
    friedTextF.font = [UIFont systemFontOfSize:15];
    friedTextF.placeholder = @"请输入好友昵称";
    friedTextF.width = 200;
    friedTextF.height = 30;
    friedTextF.center = CGPointMake(self.view.width/2, 300);
    [self.view addSubview:friedTextF];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [addBtn setTitle:@"添 加" forState:UIControlStateNormal];
    addBtn.titleLabel.textColor = [UIColor whiteColor];
    addBtn.backgroundColor = [UIColor purpleColor];
    addBtn.layer.borderColor = [UIColor yellowColor].CGColor;
    addBtn.layer.borderWidth = 2;
    addBtn.layer.cornerRadius = 5;
    addBtn.width = 100;
    addBtn.height = 30;
    addBtn.center = CGPointMake(self.view.width/2, 360);
    [addBtn addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];

}

- (void)addClick
{
    EMError *error = [[EMClient sharedClient].contactManager addContact:self.friendTextF.text message:@"我想加您为好友"];
    if (!error) {
        NSLog(@"添加成功");
        [self.navigationController popViewControllerAnimated:YES];
    }
    

}

/*!
 @method 添加好友成功回调
 @brief 用户A发送加用户B为好友的申请，用户B同意后，用户A会收到这个回调
 */
- (void)didReceiveAgreedFromUsername:(NSString *)aUsername
{
    NSLog(@"添加好友成功===%@", aUsername);

}

/*!
 @method 添加好友失败回调
 @brief 用户A发送加用户B为好友的申请，用户B拒绝后，用户A会收到这个回调
 */
- (void)didReceiveDeclinedFromUsername:(NSString *)aUsername
{
    NSLog(@"添加好友失败===%@", aUsername);

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
