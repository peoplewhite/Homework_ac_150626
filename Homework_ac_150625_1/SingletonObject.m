//
//  SingletonObject.m
//  Homework_ac_150625_1
//
//  Created by Po-Hao Cheng on 2015/6/25.
//  Copyright (c) 2015年 phc. All rights reserved.
//

#import "SingletonObject.h"


@implementation SingletonObject

+ (id)sharedInstance {
    static dispatch_once_t onceToken = 0;
    
    __strong static id _sharedObject = nil;
    
    dispatch_once(&onceToken, ^{
        _sharedObject = [[self alloc]init];
    });
    
    return _sharedObject;
}

- (id)init {
    self = [super init];
    
    if (self) {
       _strTest = @"Hello, world";
    }
    return self;
}


@end

