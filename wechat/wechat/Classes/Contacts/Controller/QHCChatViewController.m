//
//  QHCChatViewController.m
//  wechat
//
//  Created by QHC on 5/16/16.
//  Copyright © 2016 秦海川. All rights reserved.
//

#import "QHCChatViewController.h"
#import "EaseMessageViewController.h"

@interface QHCChatViewController ()

@end

@implementation QHCChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];

}

- (void)setupChat
{
    EaseMessageViewController *messageVc = [[EaseMessageViewController alloc] initWithConversationChatter:@"" conversationType:EMConversationTypeChat];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
