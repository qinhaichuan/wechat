//
//  QHCContactsViewController.m
//  wechat
//
//  Created by QHC on 5/12/16.
//  Copyright © 2016 秦海川. All rights reserved.
//

#import "QHCContactsViewController.h"
#import "QHCNewFriendsViewController.h"


@implementation QHCContactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Contacts";
    [self setItems];
}

- (void)setItems
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addFriends)];
    
}

- (void)addFriends
{
    [self.navigationController pushViewController:[[QHCNewFriendsViewController alloc] init] animated:YES];
    
}

@end
