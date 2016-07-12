//
//  Todo.h
//  Every.Do
//
//  Created by Anthony Ma on 2016-07-12.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *taskDescription;
@property (nonatomic, strong) NSNumber *priorityNumber;

@property (nonatomic, assign) BOOL completed;

-(instancetype)initWithProperties:(NSString *)taskTitle forTaskDescription:(NSString *)taskDescription forPriorityNumber:(NSNumber *)priorityNumber;
@end
