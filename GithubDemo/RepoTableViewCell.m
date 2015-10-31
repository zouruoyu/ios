//
//  RepoTableViewCell.m
//  GithubDemo
//
//  Created by Roy Zou on 10/29/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "RepoTableViewCell.h"
#import "UIImageView+AFNetworking.h"


@implementation RepoTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//
//@property (nonatomic, strong) NSString *name;
//@property (nonatomic, strong) NSString *ownerHandle;
//@property (nonatomic, strong) NSString *ownerAvatarURL;
//@property NSInteger stars;
//@property NSInteger forks;
//@property NSString *repoDescription;

- (void)setGithubRepo:(GithubRepo *)githubRepo {
    _githubRepo = githubRepo;
    self.nameLabel.text = githubRepo.name;
    self.authorLabel.text = githubRepo.ownerHandle;
    self.forkCountLabel.text = [NSString stringWithFormat:@"%ld", githubRepo.forks];
    self.favoriteCountLabel.text = [NSString stringWithFormat:@"%ld", githubRepo.stars];
    self.descriptionLabel.text = githubRepo.repoDescription;
    NSURL *url = [NSURL URLWithString:githubRepo.ownerAvatarURL];
    [self.repoImageView setImageWithURL:url];
}

@end
