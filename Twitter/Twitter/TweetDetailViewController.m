//
//  TweetDetailViewController.m
//  Twitter
//
//  Created by Roy Zou on 11/7/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "TweetDetailViewController.h"
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"
#import "TweetDateFormatter.h"
#import "ProfileViewController.h"

@interface TweetDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *retweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfRetweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfFavoriteLabel;
- (IBAction)onTapProfileImage:(id)sender;
@end

@implementation TweetDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tweet";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Reply" style:UIBarButtonItemStylePlain target:self action:@selector(onReply)];
    [self setUpDetailView];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) onReply {
    
}

- (void) setUpDetailView {
    NSURL *url = [NSURL URLWithString:_tweet.user.profileImageUrl];
    [self.profileImageView setImageWithURL:url];
    self.profileImageView.userInteractionEnabled = YES;
    self.screenNameLabel.text = [NSString stringWithFormat:@"@%@", _tweet.user.screenName];
    self.nameLabel.text = _tweet.user.name;
    self.textLabel.text = _tweet.text;
    self.createdAtLabel.text = [TweetDateFormatter stringFromDate:_tweet.createdAt withDateFormat:@"MM/DD/YY, hh:mm a"];
    [self.textLabel sizeToFit];
}

- (IBAction)onTapProfileImage:(id)sender {
    ProfileViewController *vc = [[ProfileViewController alloc] init];
    vc.user = self.tweet.user;
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    nvc.navigationBar.barTintColor = [UIColor colorWithRed:85.0f/255.0f green:172.0f/255.0f blue:238.0/255.0f alpha:1];
    nvc.navigationBar.tintColor = [UIColor whiteColor];
    nvc.navigationBar.titleTextAttributes = @{ NSForegroundColorAttributeName: [UIColor whiteColor] };
    nvc.navigationBar.translucent = NO;
    [self presentViewController:nvc animated:YES completion:nil];
    
}


@end
