//
//  PhotoDetailsViewController.h
//  Instagram
//
//  Created by Roy Zou on 10/22/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (strong, nonatomic) NSURL *photoUrl;
@end
