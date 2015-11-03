//
//  FilterViewController.m
//  Yelp
//
//  Created by Roy Zou on 10/30/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "FilterViewController.h"
#import "FilterTableViewSwitchCell.h"
#import "FilterSection.h"
#import "FilterTableViewLabelCell.h"

@interface FilterViewController () <UITableViewDataSource, UITableViewDelegate, FilterTableViewSwitchCellDelegate>

@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onCancelButton)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(onApplyButton)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FilterTableViewSwitchCell" bundle:nil] forCellReuseIdentifier:@"FilterTableViewSwitchCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"FilterTableViewLabelCell" bundle:nil] forCellReuseIdentifier:@"FilterTableViewLabelCell"];
    self.allFilters = [FilterSection generateAllFilters];
    
    [self initializeSelectedFilters];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [((FilterSection *)(self.allFilters[section])).filters count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    FilterSection *filterSection = self.allFilters[section];

    if (section == 0 || section == 3) {
        FilterTableViewSwitchCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"FilterTableViewSwitchCell"];
        cell.filterLabel.text = ((FilterSection *)(self.allFilters[indexPath.section])).filters[indexPath.row];
        NSMutableSet *selecctedFiltersForSection =(NSMutableSet *)self.selectedFilters[section];
        cell.filterSwitch.on = [selecctedFiltersForSection containsObject:filterSection.filters[row]];
        cell.delegate = self;
        return cell;
    }
    
    FilterTableViewLabelCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"FilterTableViewLabelCell"];
    cell.filterLabel.text = filterSection.filters[row];
    if ([self.selectedFilters[section] containsObject:filterSection.filters[row]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    if (section == 1 || section == 2) {
        NSMutableSet *filtersForSection = self.selectedFilters[section];
        if ([filtersForSection count] > 0) {
            [filtersForSection removeAllObjects];
        }
        FilterSection *filterSection = self.allFilters[section];
        [filtersForSection addObject:filterSection.filters[row]];
        [self reloadOneSection:section withRowAnimation:UITableViewRowAnimationNone];

    }
}


- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return ((FilterSection *)(self.allFilters[section])).headerName;
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
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)onApplyButton {
    [self.delegate filterViewControler:self filterDidChange:self.selectedFilters];
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)initializeSelectedFilters {
    if (self.selectedFilters == nil) {
        self.selectedFilters = [[NSMutableArray alloc] init];
        for (int i = 0; i < 4; i++) {
            NSMutableSet *set = [[NSMutableSet alloc] init];
            [self.selectedFilters addObject:set];
        }
        [self.selectedFilters[1] addObject:@"Auto"];
        [self.selectedFilters[2] addObject:@"Best Match"];
        [self.selectedFilters[3] addObject:@"Burgers"];
    }
}

//Helper function to reload one section only
- (void)reloadOneSection:(NSInteger)section withRowAnimation:(UITableViewRowAnimation)rowAnimation {
    
    FilterSection *filterSection = self.allFilters[section];
    NSMutableSet *selectedFiltersForSection = self.selectedFilters[section];
    for (int i = 0; i < [filterSection.filters count]; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:section];
        if ([selectedFiltersForSection containsObject:[filterSection.filters objectAtIndex:i]]) {
            [self.tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
            
        } else {
            [self.tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        }
    }
//    NSRange range = NSMakeRange(section, 1);
//    NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
//    [self.tableView reloadSections:sectionToReload withRowAnimation:rowAnimation];
    [self.tableView reloadData];
}

- (void)switchCell:(FilterTableViewSwitchCell *)switchCell didChangeValue:(BOOL)changedValue {
    NSIndexPath *index = [self.tableView indexPathForCell:switchCell];
    NSInteger section = index.section;
    NSInteger row = index.row;
    
    FilterSection *filterSection = (FilterSection *)self.allFilters[section];
    
    if (changedValue) {
        [self.selectedFilters[section] addObject:filterSection.filters[row]];
    } else {
        [self.selectedFilters[section] removeObject:filterSection.filters[row]];
    }
}

@end
