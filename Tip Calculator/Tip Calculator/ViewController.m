//
//  ViewController.m
//  Tip Calculator
//
//  Created by Roy Zou on 9/28/15.
//  Copyright (c) 2015 ruoyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)TipPercentSliderAction:(id)sender {
    float billAmount = [self.BillAmountText.text floatValue];
    self.TipPercentText.text = [[NSNumber numberWithFloat:self.TipPercentSlider.value] stringValue];
    float tipPercent = [self.TipPercentText.text floatValue];
    self.TipAmountText.text = [[NSNumber numberWithFloat:billAmount*tipPercent] stringValue];
    
}
@end
