//
//  MovieDvdTabBarControllerViewController.m
//  RottenTomato
//
//  Created by Roy Zou on 10/24/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "MovieDvdTabBarControllerViewController.h"
#import "MovieViewController.h"

@interface MovieDvdTabBarControllerViewController ()

@end

@implementation MovieDvdTabBarControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationController *nav1 = (UINavigationController *) [self.viewControllers objectAtIndex:0];
    MovieViewController *firstViewController= nav1.topViewController;
    firstViewController.apiUrl = @"https://gist.githubusercontent.com/timothy1ee/d1778ca5b944ed974db0/raw/489d812c7ceeec0ac15ab77bf7c47849f2d1eb2b/gistfile1.json";
    nav1.tabBarItem.title = @"Movies";
    nav1.tabBarItem.image = [UIImage imageNamed:@"movie"];
    
    
    //Create a second veiwController and attach to the tabBar
    MovieViewController *dvdViewController = [self.storyboard        instantiateViewControllerWithIdentifier:@"tabItemViewController"];
    dvdViewController.apiUrl = @"https://gist.githubusercontent.com/timothy1ee/e41513a57049e21bc6cf/raw/b490e79be2d21818f28614ec933d5d8f467f0a66/gistfile1.json";
    dvdViewController.title = @"DVDs";
    
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:dvdViewController];
    nav2.tabBarItem.title = @"DVDs";
    nav2.tabBarItem.image = [UIImage imageNamed:@"dvd"];
    self.viewControllers = [self.viewControllers arrayByAddingObject:nav2];
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
