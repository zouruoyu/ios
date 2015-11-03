//
//  MainViewController.h
//  Yelp
//
//  Created by Timothy Lee on 3/21/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (strong, nonatomic) NSArray *businessArray;
@property (strong, nonatomic) NSArray *filteredBusiness;
@property Boolean isFilterOn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
