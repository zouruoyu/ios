//
//  MenuViewController.m
//  Twitter
//
//  Created by Roy Zou on 11/16/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "MenuViewController.h" 
#import "ProfileViewController.h"
#import "User.h"
#import "HomeViewController.h"



@interface MenuViewController ()
- (IBAction)onProfileButton:(id)sender;
- (IBAction)onHomeTimelineButton:(id)sender;
- (IBAction)onMentionsButton:(id)sender;

@end

@implementation MenuViewController

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

- (IBAction)onProfileButton:(id)sender {
    ProfileViewController *vc = [[ProfileViewController alloc] init];
    vc.user = [User currentUser];
    [self.delegate menuViewController:self didChooseViewController:vc];
}

- (IBAction)onHomeTimelineButton:(id)sender {
    HomeViewController *vc = [[HomeViewController alloc] init];
    [self.delegate menuViewController:self didChooseViewController:vc];    
}

- (IBAction)onMentionsButton:(id)sender {
    HomeViewController *vc = [[HomeViewController alloc] init];
    [self.delegate menuViewController:self didChooseViewController:vc];
}
@end
