//
//  SingletonObject.h
//  Homework_ac_150625_1
//
//  Created by Po-Hao Cheng on 2015/6/25.
//  Copyright (c) 2015年 phc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonObject : NSObject

@property NSString *strTest;
+ (id)sharedInstance;

@end
