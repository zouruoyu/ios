//
//  FilterViewController.h
//  Yelp
//
//  Created by Roy Zou on 10/30/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilterViewController;

@protocol FilterViewControllerDelegate <NSObject>

- (void) filterViewControler:(FilterViewController *) filterViewController filterDidChange:(NSMutableArray *) filters;

@end

@interface FilterViewController : UIViewController
@property (weak, nonatomic) id<FilterViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *allFilters;
@property (strong, nonatomic) NSMutableArray *selectedFilters;

- (void) reloadOneSection:(NSInteger)section withRowAnimation:(UITableViewRowAnimation)rowAnimation;

@end
