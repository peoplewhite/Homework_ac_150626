//
//  ViewController.m
//  Homework_ac_150625_1
//
//  Created by Po-Hao Cheng on 2015/6/25.
//  Copyright (c) 2015年 phc. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
@interface ViewController ()

@property NSString *strUsername;
@property NSString *strPassword;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_tfUsername addTarget:self action:@selector(saveUsername:) forControlEvents:UIControlEventEditingChanged];
    [_tfPassword addTarget:self action:@selector(savePassword:) forControlEvents:UIControlEventEditingChanged];
    
}
- (void)saveUsername:(UITextField *)username {
    _strUsername = username.text;
}
- (void)savePassword:(UITextField *)password {
    _strPassword = password.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)btnLogin:(id)sender {
    [PFUser logInWithUsernameInBackground:_strUsername password:_strPassword
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            
                                        } else {
                                            
                                        }
                                    }];
}

@end
