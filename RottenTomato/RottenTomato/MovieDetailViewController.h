//
//  MovieDetailViewController.h
//  RottenTomato
//
//  Created by Roy Zou on 10/23/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UILabel *detailTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailSynopsisLabel;

@property (strong, nonatomic) NSDictionary *movie;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
