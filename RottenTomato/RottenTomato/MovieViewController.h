//
//  ViewController.h
//  RottenTomato
//
//  Created by Roy Zou on 10/23/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *networkErrorLabel;

@property NSString *apiUrl;

@end

