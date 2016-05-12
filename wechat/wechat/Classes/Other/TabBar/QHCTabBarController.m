//
//  QHCTabBarController.m
//  wechat
//
//  Created by QHC on 5/12/16.
//  Copyright © 2016 秦海川. All rights reserved.
//

#import "QHCTabBarController.h"
#import "QHCWeCahtViewController.h"
#import "QHCContactsViewController.h"
#import "QHCDiscoverViewController.h"
#import "QHCMeViewController.h"

@implementation QHCTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self setItemAttri];
    [self setupChildVc];
    
}

- (void)setItemAttri
{
    NSMutableDictionary *normalDict = [NSMutableDictionary dictionary];
    normalDict[NSForegroundColorAttributeName] = [UIColor grayColor];
    normalDict[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    NSMutableDictionary *selectedDict = [NSMutableDictionary dictionary];
    selectedDict[NSForegroundColorAttributeName] = [UIColor colorWithRed:29/255.0 green:176/255.0 blue:0 alpha:1];

    
    UITabBarItem *items = [UITabBarItem appearance];
    [items setTitleTextAttributes:normalDict forState:UIControlStateNormal];
    [items setTitleTextAttributes:selectedDict forState:UIControlStateSelected];

}

- (void)setupChildVc
{
    [self setupOneChildVc:[[UINavigationController alloc] initWithRootViewController:[[QHCWeCahtViewController alloc] init]] title:@"WeChat" image:@"tabbar_mainframe" selectedImage:@"tabbar_mainframeHL"];
   [self setupOneChildVc:[[UINavigationController alloc] initWithRootViewController:[[QHCContactsViewController alloc] init]] title:@"Contacts" image:@"tabbar_contacts" selectedImage:@"tabbar_contactsHL"];
   [self setupOneChildVc:[[UINavigationController alloc] initWithRootViewController:[[QHCDiscoverViewController alloc] init]] title:@"Discover" image:@"tabbar_discover" selectedImage:@"tabbar_discoverHL"];
   [self setupOneChildVc:[[UINavigationController alloc] initWithRootViewController:[[QHCMeViewController alloc] init]] title:@"Me" image:@"tabbar_me" selectedImage:@"tabbar_meHL"];


}

- (void)setupOneChildVc:(UIViewController *)Vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    Vc.tabBarItem.title = title;
    Vc.tabBarItem.image = [UIImage imageNamed:image];
    Vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    [self addChildViewController:Vc];

}


@end
