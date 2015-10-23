//
//  PhotoDetailsViewController.m
//  Instagram
//
//  Created by Roy Zou on 10/22/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "PhotoDetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface PhotoDetailsViewController ()


@end


@implementation PhotoDetailsViewController


- (void)viewDidLoad {
    [self.detailImageView setImageWithURL:self.photoUrl];

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
