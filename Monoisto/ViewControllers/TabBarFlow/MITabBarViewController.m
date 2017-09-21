//
//  MITabBarViewController.m
//  Monoisto
//
//  Created by vishal jain on 21/09/17.
//  Copyright © 2017 Ankit Jain. All rights reserved.
//

#import "MITabBarViewController.h"
#import "MIHomeViewController.h"
#import "MIIstoViewController.h"
#import "MIsearchViewController.h"
#import "MIWardrobeViewController.h"
#import "MIMenuViewController.h"

@interface MITabBarViewController ()

@end

@implementation MITabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.hidesBackButton = YES;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MITabBarStoryboard" bundle:nil];
    
    // 1. Home Tab
    MIHomeViewController *homeVC = (MIHomeViewController*)[storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MIHomeViewController class])];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:nil tag:1];
    
    // 2. Search Tab
    MIsearchViewController *searchVC = (MIsearchViewController*)[storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MIsearchViewController class])];
    UINavigationController *searchNav = [[UINavigationController alloc] initWithRootViewController:searchVC];
    searchNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Search" image:nil tag:1];

    // 3. Isot Tab
    MIIstoViewController *istoVC = (MIIstoViewController*)[storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MIIstoViewController class])];
    UINavigationController *istoNav = [[UINavigationController alloc] initWithRootViewController:istoVC];
    istoNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Isto" image:nil tag:1];

    // 4. Wardrobe Tab
    MIHomeViewController *wardrobeVC = (MIHomeViewController*)[storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MIHomeViewController class])];
    UINavigationController *wardrobeNav = [[UINavigationController alloc] initWithRootViewController:wardrobeVC];
    wardrobeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Wardrobe" image:nil tag:1];

    // 5. Menu Tab
    MIMenuViewController *menuVC = (MIMenuViewController*)[storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MIMenuViewController class])];
    UINavigationController *menuNav = [[UINavigationController alloc] initWithRootViewController:menuVC];
    menuNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Menu" image:nil tag:1];
    
    // Add all the five tabs
    self.viewControllers = @[homeNav, searchNav, istoNav, wardrobeNav, menuNav];
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
