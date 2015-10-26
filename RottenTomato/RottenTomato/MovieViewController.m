//
//  ViewController.m
//  RottenTomato
//
//  Created by Roy Zou on 10/23/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "MovieDetailViewController.h"
#import <KVNProgress/KVNProgress.h>
#import "PullToRefreshController.h"


@interface MovieViewController ()
@property (strong, nonatomic) NSArray *movies;
@property (strong, nonatomic) PullToRefreshController *pullToRefreshController;


@end

@implementation MovieViewController

-(void) fetchMovies {
    [KVNProgress showWithStatus:@"Loading"];

    NSString *urlString =self.apiUrl;
    
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
                                                    self.networkErrorLabel.alpha = 0;
                                                    NSError *jsonError = nil;
                                                    NSDictionary *responseDictionary =
                                                    [NSJSONSerialization JSONObjectWithData:data
                                                                                    options:kNilOptions
                                                                                      error:&jsonError];
                                                    //NSLog(@"Response: %@", responseDictionary);
                                                    self.movies = responseDictionary[@"movies"];
                                                    [self.tableView reloadData];
                                                    [KVNProgress dismiss];
                                                } else {
                                                    NSLog(@"An error occurred: %@", error.description);
                                                    
                                                    [UIView animateWithDuration:0.4 animations:^{
                                                        // This causes first view to fade in and second view to fade out
                                                        self.networkErrorLabel.alpha = 1;
                                                        
                                                    } completion:^(BOOL finished) {
                                                        // Do something here when the animation finishes.
                                                    }];
                                                    
                                                }
                                            }];
    [task resume];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"movieCell"];
    cell.titleLabel.text = self.movies[indexPath.row][@"title"];
    cell.synopsisLabel.text = self.movies[indexPath.row][@"synopsis"];
    NSURL *url = [NSURL URLWithString:self.movies[indexPath.row][@"posters"][@"thumbnail"]];
    [cell.movieImageView setImageWithURL:url];
    return cell;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.networkErrorLabel.alpha = 0;
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.pullToRefreshController = [[UIRefreshControl alloc] init];
    [self.pullToRefreshController addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.pullToRefreshController atIndex:0];
    [self fetchMovies];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MovieDetailViewController *movieDetailViewController = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    movieDetailViewController.movie = self.movies[indexPath.row];
}

- (void)onRefresh {
    [self fetchMovies];
    [self.pullToRefreshController endRefreshing];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

@end
