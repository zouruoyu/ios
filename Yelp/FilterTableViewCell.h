//
//  FilterTableViewCell.h
//  Yelp
//
//  Created by Roy Zou on 10/31/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *filterLabel;
@property (weak, nonatomic) IBOutlet UISwitch *filterSwitch;
- (IBAction)onChangeSwitch:(id)sender;

@end
