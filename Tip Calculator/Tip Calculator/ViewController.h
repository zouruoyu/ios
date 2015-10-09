//
//  ViewController.h
//  Tip Calculator
//
//  Created by Roy Zou on 9/28/15.
//  Copyright (c) 2015 ruoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercent;
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UILabel *defaultTipChange;
@end

