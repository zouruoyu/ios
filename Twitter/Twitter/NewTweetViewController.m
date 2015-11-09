//
//  NewTweetViewController.m
//  Twitter
//
//  Created by Roy Zou on 11/8/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "NewTweetViewController.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"

@interface NewTweetViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *createTweetTextView;

@end

@implementation NewTweetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"New Tweet";
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onCancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Tweet" style:UIBarButtonItemStylePlain target:self action:@selector(onTweet)];
    [self setUpViewController];
    [self.createTweetTextView becomeFirstResponder];
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

- (void)setUpViewController {
    //User *currentUser = User.currentuser;
    
    User *currentUser = [User currentUser];
    NSURL *url = [NSURL URLWithString:currentUser.profileImageUrl];
    [self.profileImageView setImageWithURL:url];
    self.screenNameLabel.text = currentUser.screenName;
    self.nameLabel.text = currentUser.name;
}
- (void)onTweet {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onCancel {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
