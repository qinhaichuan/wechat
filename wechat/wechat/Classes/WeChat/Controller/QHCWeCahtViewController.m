//
//  QHCWeCahtViewController.m
//  wechat
//
//  Created by QHC on 5/12/16.
//  Copyright © 2016 秦海川. All rights reserved.
//

#import "QHCWeCahtViewController.h"
#import <EMSDK.h>

@implementation QHCWeCahtViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

#pragma mark ------ EMClientDelegate
// 网络状态改变的回调
-(void)didConnectionStateChanged:(EMConnectionState)connectionState{
    
    //    eEMConnectionConnected,   //连接成功
    //    eEMConnectionDisconnected,//未连接
    if (connectionState == EMConnectionDisconnected) {
        NSLog(@"网络断开连接");
        self.title = @"未连接";
    }else{
        NSLog(@"网络连接恢复");
    }
}

/*!
 @method
 @brief 将要发起自动重连操作
 @discussion
 @result
 */
- (void)willAutoReconnect{
    NSLog(@"连接中...");
    self.title = @"连接中...";
}

/*!
 @method
 @brief 自动重连操作完成后的回调（成功的话，error为nil，失败的话，查看error的错误信息）
 @discussion
 @result
 */
- (void)didAutoReconnectFinishedWithError:(NSError *)error{
    NSLog(@"自动连接完成 %@",error);
    if (!error) {
        self.title = @"自动连接成功";
    }else{
        self.title = @"自动连接失败";
    }
    
}

@end
