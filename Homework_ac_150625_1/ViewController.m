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
    
    SingletonObject *obj = [SingletonObject sharedInstance];
    obj.arrShoppingCart_hw3 = [[NSMutableArray alloc]init];
    
    
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
    [self doLogin:1];
}
- (IBAction)btnLogin2:(id)sender {
    [self doLogin:2];
}
- (IBAction)btnLogin3:(id)sender {
    [self doLogin:3];
}

- (void)doLogin:(int)whichBtn {
    [PFUser logInWithUsernameInBackground:_strUsername password:_strPassword
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            switch (whichBtn) {
                                                case 1:
                                                    [self saveData2GV];
                                                    break;
                                                case 2:
                                                    
                                                    break;
                                                case 3:
                                                    [self saveData2Singleton];
                                                    break;
                                            }
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

- (void)saveData2Singleton {

    SingletonObject *singleObj = [SingletonObject sharedInstance];
    
    PFQuery *query = [[PFQuery alloc]initWithClassName:@"ShoppingCart"];
    [query getObjectInBackgroundWithId:@"6x9FC3W7jN" block:^(PFObject *obj, NSError *error) {
        [singleObj.arrShoppingCart_hw3 addObject:@{ @"name": obj[@"name"], @"price": obj[@"price"]}];
        _countSum++;
        if (_countSum == 3) {
            [self performSegueWithIdentifier:@"move3" sender:self];
        }
    }];
    PFQuery *query2 = [[PFQuery alloc]initWithClassName:@"ShoppingCart"];
    [query2 getObjectInBackgroundWithId:@"3wKD43HueI" block:^(PFObject *obj, NSError *error) {
        [singleObj.arrShoppingCart_hw3 addObject:@{@"name": obj[@"name"], @"price": obj[@"price"]}];
        _countSum++;
        if (_countSum == 3) {
            [self performSegueWithIdentifier:@"move3" sender:self];
        }
    }];
    PFQuery *query3 = [[PFQuery alloc]initWithClassName:@"ShoppingCart"];
    [query3 getObjectInBackgroundWithId:@"kOfCGBayLu" block:^(PFObject *obj, NSError *error) {
        [singleObj.arrShoppingCart_hw3 addObject:@{@"name": obj[@"name"], @"price": obj[@"price"]}];
        _countSum++;
        if (_countSum == 3) {
            [self performSegueWithIdentifier:@"move3" sender:self];
        }
    }];
}
@end


