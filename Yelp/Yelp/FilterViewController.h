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

- (void) filterViewControler:(FilterViewController *) filterViewController filterDidChange:(NSDictionary *) filters;

@end

@interface FilterViewController : UIViewController
@property (weak, nonatomic) id<FilterViewControllerDelegate> delegate;
@property NSDictionary *fitlers;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
