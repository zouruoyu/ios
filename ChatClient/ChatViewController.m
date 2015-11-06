//
//  ChatViewController.m
//  ChatClient
//
//  Created by Roy Zou on 11/5/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "ChatViewController.h"
#import "Parse.h"

@interface ChatViewController ()
@property (weak, nonatomic) IBOutlet UITextField *messageText;
- (IBAction)onSubmit:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector: @selector(onTimer) userInfo:nil repeats:YES];

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

- (void) onTimer {
    PFQuery *query = [PFQuery queryWithClassName:@"Message"];
    [query whereKey:@"text" equalTo:@"hello roy"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    // Add code to be run periodically
}


- (IBAction)onSubmit:(id)sender {
    PFObject *gameScore = [PFObject objectWithClassName:@"Message"];
    gameScore[@"text"] = self.messageText.text;
    [gameScore saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"message saved!");
        } else {
            // There was a problem, check error.description
        }
    }];
}
@end
