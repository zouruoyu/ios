//
//  TwitterNavigationController.m
//  Twitter
//
//  Created by Roy Zou on 11/9/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "TwitterNavigationController.h"

@interface TwitterNavigationController ()

@end

@implementation TwitterNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor =  [UIColor colorWithRed: 135.0/255.0 green: 206.0/255.0 blue:250.0/255.0 alpha: 1.0];
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.translucent = NO;
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

    // Do any additional setup after loading the view.
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
