//
//  ProfileViewController.m
//  Twitter
//
//  Created by Roy Zou on 11/16/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIImageView+AFNetworking.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *numOfTweets;
@property (weak, nonatomic) IBOutlet UILabel *numOfFollowers;
@property (weak, nonatomic) IBOutlet UILabel *numOfFollowing;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Profile";
    [self setUpProfile];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onCancel)];
}

- (void) setUpProfile {
    [self.profileImage setImageWithURL:[NSURL URLWithString: self.user.profileImageUrl]];
    self.numOfTweets.text = [NSString stringWithFormat:@"%@ tweets", @"72"];
    self.numOfFollowers.text = [NSString stringWithFormat:@"%@ followers", @"21"];
    self.numOfFollowing.text = [NSString stringWithFormat:@"%@ following", @"32"];
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

- (void)onCancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
