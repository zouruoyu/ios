//
//  LoginViewController.m
//  ChatClient
//
//  Created by Roy Zou on 11/5/15.
//  Copyright © 2015 ruoyu. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse.h"
#import "ChatViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)onLogin:(id)sender;
- (IBAction)onSignup:(id)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)onLogin:(id)sender {
    [PFUser logInWithUsernameInBackground:self.emailField.text password:self.passwordField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            NSLog(@"%@ is logined", user);
                                            // Do stuff after successful login.
                                            

                                            ChatViewController *cvc = [[ChatViewController alloc] init];
                                            UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:cvc];
                                            cvc.title = @"Chat";
                                            [self presentViewController:nvc animated:true completion:^{
                                                
                                            }];
                                        } else {
                                            // The login failed. Check error to see why.
                                        }
                                    }];
}

- (IBAction)onSignup:(id)sender {
    PFUser *user = [PFUser user];
    user.username = self.emailField.text;
    user.password = self.passwordField.text;
    user.email = self.emailField.text;
    

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {   // Hooray! Let them use the app now.
            NSLog(@"Signed up success!");
            ChatViewController *cvc = [[ChatViewController alloc] init];
            [self presentViewController:cvc animated:true completion:^{
                
            }];
      
            
        } else {   NSString *errorString = [error userInfo][@"error"];   // Show the errorString somewhere and let the user try again.
        }
    }];
}
@end
