//
//  ViewController.m
//  Homework_ac_150625_1
//
//  Created by Po-Hao Cheng on 2015/6/25.
//  Copyright (c) 2015年 phc. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"
@interface ViewController ()

@property NSString *strUsername;
@property NSString *strPassword;
@property AppDelegate *delegate;
@property BOOL isDataLoadCompleted;
@property int countSum;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _delegate = [[UIApplication sharedApplication]delegate];
    [_tfUsername addTarget:self action:@selector(saveUsername:) forControlEvents:UIControlEventEditingChanged];
    [_tfPassword addTarget:self action:@selector(savePassword:) forControlEvents:UIControlEventEditingChanged];
    _isDataLoadCompleted = 0;
    _countSum = 0;
    
    
    
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
                                            [self saveData2GV];
                                        } else {
                                            
                                        }
                                    }];
}

- (void)saveData2GV {

    PFQuery *query = [[PFQuery alloc]initWithClassName:@"ShoppingCart"];
    [query getObjectInBackgroundWithId:@"6x9FC3W7jN" block:^(PFObject *obj, NSError *error) {
        [_delegate.arrShoppingCart addObject:@{ @"name": obj[@"name"], @"price": obj[@"price"]}];
        _countSum++;
        if (_countSum == 3) {
            [self performSegueWithIdentifier:@"move" sender:self];
        }
    }];
    PFQuery *query2 = [[PFQuery alloc]initWithClassName:@"ShoppingCart"];
    [query2 getObjectInBackgroundWithId:@"3wKD43HueI" block:^(PFObject *obj, NSError *error) {
        [_delegate.arrShoppingCart addObject:@{@"name": obj[@"name"], @"price": obj[@"price"]}];
        _countSum++;
        if (_countSum == 3) {
            [self performSegueWithIdentifier:@"move" sender:self];
        }
    }];
    PFQuery *query3 = [[PFQuery alloc]initWithClassName:@"ShoppingCart"];
    [query3 getObjectInBackgroundWithId:@"kOfCGBayLu" block:^(PFObject *obj, NSError *error) {
        [_delegate.arrShoppingCart addObject:@{@"name": obj[@"name"], @"price": obj[@"price"]}];
        _countSum++;
        if (_countSum == 3) {
            [self performSegueWithIdentifier:@"move" sender:self];
        }
    }];
}
@end


