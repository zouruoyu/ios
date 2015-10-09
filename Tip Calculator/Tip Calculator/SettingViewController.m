//
//  SettingViewController.m
//  Tip Calculator
//
//  Created by Roy Zou on 10/8/15.
//  Copyright (c) 2015 ruoyu. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    [self reloadDefaultTipPercent];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onDefaultTipChange:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipPercent.selectedSegmentIndex forKey:@"defaultTipPercent"];
    [defaults synchronize];
}

- (void) reloadDefaultTipPercent {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipSeletedIndex = [defaults integerForKey:@"defaultTipPercent"];
    self.defaultTipPercent.selectedSegmentIndex = defaultTipSeletedIndex;
}
@end
