//
//  FilterTableViewCell.m
//  Yelp
//
//  Created by Roy Zou on 10/31/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "FilterTableViewSwitchCell.h"

@implementation FilterTableViewSwitchCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)onChangeSwitch:(id)sender {
    [self.delegate switchCell:self didChangeValue:self.filterSwitch.on];    
}
@end
