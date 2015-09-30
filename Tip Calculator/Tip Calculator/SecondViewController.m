//
//  SecondViewController.m
//  Tip Calculator
//
//  Created by Roy Zou on 9/28/15.
//  Copyright (c) 2015 ruoyu. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)calculateTip:(id)sender {
    float totalBill = [self.totalBillText.text floatValue];
    int totalPeople = [self.totalPersonText.text intValue];
    int numOfPeopleYouPay = [self.numOfPeopleYouPayText.text intValue];
    float tipPercent = [self.tipPercentText.text floatValue];
    self.yourBillText.text = [[NSNumber numberWithFloat:(totalBill*numOfPeopleYouPay/totalPeople)] stringValue];
    self.yourTipText.text = [[NSNumber numberWithFloat:([self.yourBillText.text floatValue]*tipPercent)] stringValue];
}
@end
