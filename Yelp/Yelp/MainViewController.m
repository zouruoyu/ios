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

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate, FilterViewControllerDelegate, UISearchBarDelegate>

@property (strong, nonatomic) NSMutableArray *lastSelectedFilters;

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
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    [searchBar sizeToFit];
    searchBar.delegate = self;
    self.navigationItem.titleView = searchBar;
    self.isFilterOn = false;

    [self searchWithTerm];
}

- (void)searchWithTerm {
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
    YelpBusiness *business = nil;
    if (self.isFilterOn == false) {
        business = self.businessArray[indexPath.row];
    } else {
        business = self.filteredBusiness[indexPath.row];
    }
    cell.business = business;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.isFilterOn == false) {
        return self.businessArray.count;
    } else {
        return self.filteredBusiness.count;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - private method

- (void)onFilterButton {
    FilterViewController *vc = [[FilterViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    vc.delegate = self;
    vc.selectedFilters = self.lastSelectedFilters;
    
    [self presentViewController:nav animated:true completion:nil];
    
}

- (void) filterViewControler:(FilterViewController *) filterViewController filterDidChange:(NSMutableArray *) filters {
    self.lastSelectedFilters = filters;
    NSLog(@"Network request fired");
    BOOL hasDeal = NO;
    if ([filters[0] count] == 1) {
        hasDeal = YES;
    }
    YelpSortMode sortMode = YelpSortModeBestMatched;
    if ([filters[2] containsObject:@"Distance"]) {
        sortMode = YelpSortModeDistance;
    } else if ([filters[2] containsObject:@"Rating"]) {
        sortMode = YelpSortModeHighestRated;
    }
    NSMutableArray *categories = [[NSMutableArray alloc] init];
    for (NSString *cat in filters[3]) {
        [categories addObject:[cat lowercaseString]];
    }
    
    [YelpBusiness searchWithTerm:@"Restaurants"
                        sortMode:sortMode
                      categories:categories
                           deals:hasDeal
                      completion:^(NSArray *businesses, NSError *error) {
                          self.businessArray = businesses;
                          [self.tableView reloadData];
                      }];
//    [YelpBusiness searchWithTerm:@"Restaurants"
//                        sortMode:YelpSortModeBestMatched
//                      categories:@[@"burgers"]
//                           deals:NO
//                      completion:^(NSArray *businesses, NSError *error) {
//                          self.businessArray = businesses;
//                          [self.tableView reloadData];
//                      }];
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText == nil || searchText.length == 0) {
        self.isFilterOn = false;
    } else {
        self.isFilterOn = true;
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name CONTAINS [c] %@", searchText];
    
        self.filteredBusiness = [self.businessArray filteredArrayUsingPredicate:predicate];
    }
    
    //[self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

@end
