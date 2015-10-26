//
//  MovieDetailViewController.m
//  RottenTomato
//
//  Created by Roy Zou on 10/23/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "UIImageView+AFNetworking.h"
#import <KVNProgress/KVNProgress.h>


@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.detailTitleLabel.text = self.movie[@"title"];
    self.detailSynopsisLabel.text = self.movie[@"synopsis"];
    
    NSString *originalUrlString = self.movie[@"posters"][@"thumbnail"];
    NSRange range = [originalUrlString rangeOfString:@".*cloudfront.net/"
                                             options:NSRegularExpressionSearch];
    NSString *newUrlString = [originalUrlString stringByReplacingCharactersInRange:range
                                                                        withString:@"https://content6.flixster.com/"];    
    NSURL *url = [NSURL URLWithString:newUrlString];
    [self.detailImageView setImageWithURL:url];
    [self.detailSynopsisLabel sizeToFit];
    self.scrollView.contentSize = CGSizeMake(self.detailSynopsisLabel.bounds.size.width, self.detailSynopsisLabel.bounds.size.height+1);
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
