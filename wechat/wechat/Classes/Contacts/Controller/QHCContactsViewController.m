//
//  QHCContactsViewController.m
//  wechat
//
//  Created by QHC on 5/12/16.
//  Copyright © 2016 秦海川. All rights reserved.
//

#import "QHCContactsViewController.h"
#import "QHCNewFriendsViewController.h"
#import "QHCChatViewController.h"

@interface QHCContactsViewController()

@property(nonatomic, strong) NSArray *listArr;

@end

@implementation QHCContactsViewController

- (NSArray *)listArr
{
    if (!_listArr) {
        _listArr = [NSArray array];
    }
    return _listArr;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Contacts";
    [self setItems];
    [self getFriendList];
}

- (void)setItems
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addFriends)];
    
}

- (void)getFriendList
{
    // 从数据库获取好友列表
    NSArray *userlistDB = [[EMClient sharedClient].contactManager getContactsFromDB];
    self.listArr = userlistDB;
   
    // 从服务器获取好友列表
    if (self.listArr.count) {
        EMError *error = nil;
        NSArray *userlist = [[EMClient sharedClient].contactManager getContactsFromServerWithError:&error];
        self.listArr = userlist;
        if (!error) {
            NSLog(@"获取成功 -- %@",userlist);
        }
    }
    [self.tableView reloadData];
    NSLog(@"好友列表===%@", self.listArr);

}

- (void)addFriends
{
    [self.navigationController pushViewController:[[QHCNewFriendsViewController alloc] init] animated:YES];
    
}

#pragma mark ----- UITableDateSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArr.count;
}

-  (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = @"buddyList";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    NSString *username = self.listArr[indexPath.row];
    cell.textLabel.text = username;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QHCChatViewController *charVc = [[QHCChatViewController alloc] init];
    [self.navigationController pushViewController:charVc animated:YES];

}

@end
