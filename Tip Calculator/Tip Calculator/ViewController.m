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
    [self reloadDefaultTipPercent];
    [self calculateTip];

    self.defaultTipChange.alpha = 0;
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    [self updateThemeColor];
    int oldTipIndex = self.tipPercent.selectedSegmentIndex;
    [self reloadDefaultTipPercent];
    int newTipIndex = self.tipPercent.selectedSegmentIndex;
    [self defaultTipPercentChanged:oldTipIndex :newTipIndex];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
    [self calculateTip];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) calculateTip {
    float billAmount = [self.billAmount.text floatValue];
    NSArray *tipPercent = @[@(0.15), @(0.2), @(0.25)];
    
    float tipAmount = [tipPercent[self.tipPercent.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    self.tipAmount.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.total.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}
- (IBAction)onTap:(id)sender {
    [self.view endEditing:true];
    [self calculateTip];
    self.defaultTipChange.alpha = 0;
}
- (IBAction)onTipChange:(id)sender {
    [self calculateTip];
}
- (void) reloadDefaultTipPercent {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipSeletedIndex = [defaults integerForKey:@"defaultTipPercent"];
    self.tipPercent.selectedSegmentIndex = defaultTipSeletedIndex;
}

- (void) updateThemeColor {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *newThemeColor = [defaults objectForKey:@"themeColor"];
    if ([newThemeColor isEqualToString:@"dark"]) {
        self.view.backgroundColor = [UIColor lightGrayColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
}

- (void) defaultTipPercentChanged:(int)oldDefaultTipPercent :(int)newDefaultTipPercent {
    if (oldDefaultTipPercent != newDefaultTipPercent) {
        [UIView animateWithDuration:0.4 animations:^{
            // This causes first view to fade in and second view to fade out
            self.defaultTipChange.text = [NSString stringWithFormat:@"Default tip percentage changed to %@", [self.tipPercent titleForSegmentAtIndex:self.tipPercent.selectedSegmentIndex]];
            self.defaultTipChange.alpha = 1;
        } completion:^(BOOL finished) {
            // Do something here when the animation finishes.
        }];
        
    }
    
}

@end
