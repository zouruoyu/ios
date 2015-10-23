//
//  ViewController.m
//  Instagram
//
//  Created by Roy Zou on 10/22/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "PhotosViewController.h"
#import "UIImageView+AFNetworking.h"
#import "InstagramTableViewCell.h"
#import "PhotoDetailsViewController.h"
#import "RefreshController.h"

@interface PhotosViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) RefreshController *refreshController;

@property NSDictionary *instagramApiResponse;

@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 320;
    
    self.refreshController = [[UIRefreshControl alloc] init];
    [self.refreshController addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];

    [self.tableView insertSubview:self.refreshController atIndex:0];

    // Do any additional setup after loading the view, typically from a nib.
    [self fetchPopularImages];
    
}

- (void) fetchPopularImages {
    NSString *clientId = @"4a84d5ab703b49edb5f1e7f8850ab9f2";
    NSString *urlString =
    [@"https://api.instagram.com/v1/media/popular?client_id=" stringByAppendingString:clientId];
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSession *session =
    [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                  delegate:nil
                             delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData * _Nullable data,
                                                                NSURLResponse * _Nullable response,
                                                                NSError * _Nullable error) {
                                                if (!error) {
                                                    NSError *jsonError = nil;
                                                    self.instagramApiResponse =
                                                    [NSJSONSerialization JSONObjectWithData:data
                                                                                    options:kNilOptions
                                                                                      error:&jsonError];
                                                    //NSLog(@"Response: %@", self.instagramApiResponse);
                                                    [self.tableView reloadData];
                                                } else {
                                                    NSLog(@"An error occurred: %@", error.description);
                                                }
                                            }];
    [task resume];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InstagramTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"instagramImageViewCell"];
    //NSLog(@"test");
    NSURL *url = [NSURL URLWithString:self.instagramApiResponse[@"data"][indexPath.row][@"images"][@"standard_resolution"][@"url"]];
    [cell.instagramImageView setImageWithURL:url];
    //[cell.instagramImageView setContentMode:UIViewContentModeScaleAspectFit];
    //NSLog(self.instagramApiResponse[@"data"][indexPath.row][@"images"][@"standard_resolution"][@"url"]);
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.instagramApiResponse == nil) {
        return 0;
    }
    int count = [self.instagramApiResponse[@"data"] count];
    return count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PhotoDetailsViewController *photoDetailsViewController = [segue    destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    NSURL *url = [NSURL URLWithString:self.instagramApiResponse[@"data"][indexPath.row][@"images"][@"standard_resolution"][@"url"]];
    photoDetailsViewController.photoUrl = url;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (void)onRefresh {
    [self fetchPopularImages];
    [self.refreshController endRefreshing];
}

@end
