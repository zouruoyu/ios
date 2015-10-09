//
//  SettingViewController.h
//  Tip Calculator
//
//  Created by Roy Zou on 10/8/15.
//  Copyright (c) 2015 ruoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipPercent;
- (IBAction)onDefaultTipChange:(id)sender;

@end
