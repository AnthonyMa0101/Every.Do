//
//  Todo.m
//  Every.Do
//
//  Created by Anthony Ma on 2016-07-12.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(instancetype)initWithProperties:(NSString *)taskTitle forTaskDescription:(NSString *)taskDescription forPriorityNumber:(NSNumber *)priorityNumber {
    if (self = [super init]){
        self.title = taskTitle;
        self.taskDescription = taskDescription;
        self.priorityNumber = priorityNumber;
    }
    return self;
}

@end
