//
//  HomeViewTableCellTableViewCell.m
//  Twitter
//
//  Created by Roy Zou on 11/6/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "HomeViewTableCell.h"
#import "UIImageView+AFNetworking.h"
#import "TweetDateFormatter.h"

@implementation HomeViewTableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
//@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
//@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//@property (weak, nonatomic) IBOutlet UILabel *createAtLabel;
//@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;


- (void) setTweet:(Tweet *)tweet {
    _tweet = tweet;
    NSURL *url = [NSURL URLWithString:tweet.user.profileImageUrl];
    [self.profileImageView setImageWithURL:url];
    self.screenNameLabel.text = tweet.user.screenName;
    self.nameLabel.text = tweet.user.name;
    self.tweetTextLabel.text = tweet.text;
    self.createAtLabel.text = [TweetDateFormatter stringFromDate:tweet.createdAt withDateFormat:@"MM/dd/YY"];
}

@end
