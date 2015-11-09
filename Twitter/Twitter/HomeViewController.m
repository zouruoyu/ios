//
//  HomeViewController.m
//  Twitter
//
//  Created by Roy Zou on 11/6/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "HomeViewController.h"
#import "User.h"
#import "Tweet.h"
#import "HomeViewTableCell.h"
#import "TweetDetailViewController.h"
#import "TwitterClient.h"
#import "NewTweetViewController.h"
#import "LoginViewController.h"

@interface HomeViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *tweets;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    [self setUpNavigationControl];

    [self setUpTableView];
    [self setUpPullToRefresh];
    [self retrieveTimelineTweets];
}


/****************************Helper functions to setup the view starts*************************************************/
- (void)setUpTableView {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeViewTableCell" bundle:nil] forCellReuseIdentifier:@"HomeViewTableCell"];
    // Do any additional setup after loading the view from its nib.
    self.tableView.estimatedRowHeight = 85;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}
- (void)setUpNavigationControl {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:(UIBarButtonItemStylePlain) target:self action:@selector(onSignOut)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"New" style:(UIBarButtonItemStylePlain) target:self action:@selector(onNewTweet)];
}

- (void)setUpPullToRefresh {
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    UITableViewController *dummyVc = [[UITableViewController alloc] init];
    dummyVc.tableView = self.tableView;
    dummyVc.refreshControl = self.refreshControl;
}

- (void) retrieveTimelineTweets {
    [[TwitterClient sharedInstance] GET:@"1.1/statuses/home_timeline.json" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        self.tweets = [Tweet tweetsWithArray:responseObject];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"Failed to get current user");
    }];
}

/****************************Helper functions to setup the view ends***************************************************/




/**********tableView delegate related functions start *************************************************/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeViewTableCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"HomeViewTableCell"];
    cell.tweet = self.tweets[indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TweetDetailViewController *vc = [[TweetDetailViewController alloc] init];
    vc.tweet = self.tweets[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

}
/**********tableView delegate related functions end *************************************************/


/**********Selector functions start ****************************************************************/

- (void) onSignOut {
    [User logout];
    LoginViewController *vc = [[LoginViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void) onNewTweet {
    NewTweetViewController *vc = [[NewTweetViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)onRefresh {
    [self retrieveTimelineTweets];
    [self.refreshControl endRefreshing];
}

/**********Selector functions end ****************************************************************/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
