//
//  LoginViewController.m
//  Twitter
//
//  Created by Roy Zou on 11/5/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "LoginViewController.h"
#import "Twitterclient.h"
#import "HomeViewController.h"
#import "TwitterNavigationController.h"

@interface LoginViewController ()
- (IBAction)onLogin:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)onLogin:(id)sender {
    [[TwitterClient sharedInstance] loginWithCompletion:^(User *user, NSError *error) {
        if (user != nil) {
            NSLog(@"Welcom %@", user.name);
            HomeViewController *vc = [[HomeViewController alloc] init];
            TwitterNavigationController *nvc = [[TwitterNavigationController alloc] initWithRootViewController:vc];
            [self presentViewController:nvc animated:YES completion:nil];
        } else {
            // present error view
        }
    }];

}

@end
