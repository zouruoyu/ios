//
//  MainViewController.m
//  Yelp
//
//  Created by Timothy Lee on 3/21/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "MainViewController.h"
#import "YelpBusiness.h"
#import "BusinessTableCell.h"
#import "FilterViewController.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate, FilterViewControllerDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"BusinessTableCell" bundle:nil] forCellReuseIdentifier:@"BusinessTableCell"];
    //self.tableView.rowHeight = 86;
    self.tableView.estimatedRowHeight = 85;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    //set filter navigation bar item
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Filter" style:UIBarButtonItemStylePlain target:self action:@selector(onFilterButton)];
    
    [YelpBusiness searchWithTerm:@"Restaurants"
                        sortMode:YelpSortModeBestMatched
                      categories:@[@"burgers"]
                           deals:NO
                      completion:^(NSArray *businesses, NSError *error) {
                          self.businessArray = businesses;
                          [self.tableView reloadData];
                      }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BusinessTableCell *cell = (BusinessTableCell *)[self.tableView dequeueReusableCellWithIdentifier:@"BusinessTableCell"];
    YelpBusiness *business = self.businessArray[indexPath.row];
    cell.business = business;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.businessArray.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - private method

- (void)onFilterButton {
    FilterViewController *vc = [[FilterViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    vc.delegate = self;
    
    [self presentViewController:nav animated:true completion:nil];
    
}

- (void) filterViewControler:(FilterViewController *) filterViewController filterDidChange:(NSDictionary *) filters {
    NSLog(@"Network request fired");
}


@end
