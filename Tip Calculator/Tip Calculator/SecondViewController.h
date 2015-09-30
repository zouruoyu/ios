//
//  SecondViewController.h
//  Tip Calculator
//
//  Created by Roy Zou on 9/28/15.
//  Copyright (c) 2015 ruoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *totalBillLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalPeopleBill;
@property (weak, nonatomic) IBOutlet UILabel *numOfPeopleYouPayLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentLabel;
@property (weak, nonatomic) IBOutlet UILabel *yourBillLabel;
@property (weak, nonatomic) IBOutlet UILabel *yourTipLabel;
@property (weak, nonatomic) IBOutlet UITextField *totalBillText;
@property (weak, nonatomic) IBOutlet UITextField *totalPersonText;
@property (weak, nonatomic) IBOutlet UITextField *numOfPeopleYouPayText;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentText;
@property (weak, nonatomic) IBOutlet UITextField *yourBillText;
@property (weak, nonatomic) IBOutlet UITextField *yourTipText;

- (IBAction)calculateTip:(id)sender;
@end
