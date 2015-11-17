//
//  ContainerViewController.m
//  Twitter
//
//  Created by Roy Zou on 11/16/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "ContainerViewController.h"
#import "HomeviewController.h"
#import "MenuViewController.h"

@interface ContainerViewController () <MenuViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewLeftMargin;
@property (nonatomic, strong) UIViewController *contentViewController;
@property (nonatomic) BOOL menuIsOpen;
@property (nonatomic) CGFloat originalLeftMargin;

- (IBAction)onPanGesture:(id)sender;

@end

@implementation ContainerViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentViewController = [[HomeViewController alloc] init];
    [self setUpContentViewShadow];
    [self setUpMenuViewController];
}

- (void)setContentViewController:(UIViewController *)contentViewController {
    if (self.contentViewController) {
        [self closeMenu];
    }
    
    if (self.contentViewController) {
        [self removeContentViewController];
    }
    
    UINavigationController *nvc = [self navigationControllerWithRootViewController:contentViewController];

    [nvc willMoveToParentViewController:self];
    [self addChildViewController:nvc];
    [self.contentView addSubview:nvc.view];
    nvc.view.frame = self.contentView.frame;
    nvc.navigationBar.translucent = NO;
    [nvc didMoveToParentViewController:self];
    
    _contentViewController = nvc;
}

- (void)setUpContentViewShadow {
    self.contentView.layer.masksToBounds = NO;
    self.contentView.layer.shadowOffset = CGSizeMake(0, 0);
    self.contentView.layer.shadowRadius = 2;
    self.contentView.layer.shadowOpacity = 0.4;
}

- (UINavigationController *)navigationControllerWithRootViewController:(UIViewController *)viewController {
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:viewController];
    nvc.navigationBar.barTintColor = [UIColor colorWithRed:85.0f/255.0f green:172.0f/255.0f blue:238.0/255.0f alpha:1];
    nvc.navigationBar.tintColor = [UIColor whiteColor];
    nvc.navigationBar.titleTextAttributes = @{ NSForegroundColorAttributeName: [UIColor whiteColor] };
    return nvc;
}

- (void)setUpMenuViewController {
    MenuViewController *vc = [[MenuViewController alloc] init];
    UINavigationController *nvc = [self navigationControllerWithRootViewController:vc];
    vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self action:nil];
    nvc.navigationBar.translucent = NO;
    [vc willMoveToParentViewController:self];
    [self addChildViewController:nvc];
    [self.menuView addSubview:nvc.view];
    vc.view.frame = self.menuView.frame;
    vc.delegate = self;
    [nvc didMoveToParentViewController:self];
}

- (void)closeMenu {
    self.menuIsOpen = NO;
}

- (void)openMenu {
    self.menuIsOpen = YES;
}

- (void)removeContentViewController {
    [self.contentViewController willMoveToParentViewController:nil];
    [self.contentViewController removeFromParentViewController];
    [self.contentViewController.view removeFromSuperview];
    [self.contentViewController didMoveToParentViewController:nil];
}

- (IBAction)onPanGesture:(UIPanGestureRecognizer *)sender {
    CGPoint translation = [sender translationInView:self.view];
    CGPoint velocity = [sender velocityInView:self.view];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.originalLeftMargin = self.contentViewLeftMargin.constant;
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        self.contentViewLeftMargin.constant = self.originalLeftMargin + translation.x;
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        if (velocity.x > 0) {
            [self openMenu];
        } else {
            [self closeMenu];
        }
    }
}

- (void)menuViewController:(MenuViewController *)menuViewController didChooseViewController:(UIViewController *)viewController {
    self.contentViewController = viewController;
}

- (void)setMenuIsOpen:(BOOL)menuIsOpen {
    _menuIsOpen = menuIsOpen;
    self.contentViewController.view.userInteractionEnabled = !menuIsOpen;
    
    [UIView animateWithDuration:0.35 animations:^{
        self.contentViewLeftMargin.constant = menuIsOpen ? 200 : 0;
        [self.view layoutIfNeeded];
    }];
}

@end
