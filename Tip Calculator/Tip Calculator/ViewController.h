//
//  ViewController.h
//  Tip Calculator
//
//  Created by Roy Zou on 9/28/15.
//  Copyright (c) 2015 ruoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *BillAmountLabel;

@property (weak, nonatomic) IBOutlet UILabel *TipPercentLabel;
@property (weak, nonatomic) IBOutlet UILabel *TipAmountLabel;
@property (weak, nonatomic) IBOutlet UITextField *BillAmountText;

@property (weak, nonatomic) IBOutlet UISlider *TipPercentSlider;
@property (weak, nonatomic) IBOutlet UITextField *TipAmountText;
@property (weak, nonatomic) IBOutlet UITextField *TipPercentText;

- (IBAction)TipPercentSliderAction:(id)sender;

@end

