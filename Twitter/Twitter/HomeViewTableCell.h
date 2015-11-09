//
//  HomeViewTableCellTableViewCell.h
//  Twitter
//
//  Created by Roy Zou on 11/6/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface HomeViewTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;


@property (nonatomic, strong) Tweet *tweet;

@end
