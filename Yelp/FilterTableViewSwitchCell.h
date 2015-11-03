//
//  FilterTableViewCell.h
//  Yelp
//
//  Created by Roy Zou on 10/31/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilterTableViewSwitchCell;
@protocol FilterTableViewSwitchCellDelegate <NSObject>

- (void)switchCell:(FilterTableViewSwitchCell *)switchCell didChangeValue:(BOOL)changedValue;

@end

@interface FilterTableViewSwitchCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *filterLabel;
@property (weak, nonatomic) IBOutlet UISwitch *filterSwitch;
@property (weak, nonatomic) id<FilterTableViewSwitchCellDelegate> delegate;

- (IBAction)onChangeSwitch:(id)sender;

@end
