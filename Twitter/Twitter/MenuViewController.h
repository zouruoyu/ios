//
//  MenuViewController.h
//  Twitter
//
//  Created by Roy Zou on 11/16/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  MenuViewController;

@protocol MenuViewControllerDelegate <NSObject>
- (void)menuViewController:(MenuViewController *)menuViewController didChooseViewController:(UIViewController *)viewController;
@end

@interface MenuViewController : UIViewController
@property (nonatomic, weak) id<MenuViewControllerDelegate> delegate;

@end
