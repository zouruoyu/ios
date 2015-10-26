//
//  MovieTableViewCell.h
//  RottenTomato
//
//  Created by Roy Zou on 10/23/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;

@end
