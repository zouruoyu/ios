//
//  FilterViewController.m
//  Yelp
//
//  Created by Roy Zou on 10/30/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "FilterViewController.h"
#import "FilterTableViewCell.h"

@interface FilterViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onCancelButton)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(onApplyButton)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FilterTableViewCell" bundle:nil] forCellReuseIdentifier:@"FilterTableViewCell"];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FilterTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"FilterTableViewCell"];
    cell.filterLabel.text = @"test";
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)onCancelButton {
    [self.delegate filterViewControler:self filterDidChange:self.fitlers];
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)onApplyButton {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
