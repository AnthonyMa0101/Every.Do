//
//  MasterViewController.m
//  Every.Do
//
//  Created by Anthony Ma on 2016-07-12.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "TableViewCell.h"
#import "Todo.h"

@interface MasterViewController () <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *todos;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    //Todo instantiate
    Todo *lighthouseAssignment1 = [[Todo alloc] initWithProperties:@"2 Player Math" forTaskDescription:@"2 player math game in objective c" forPriorityNumber:@1];
    lighthouseAssignment1.completed = YES;
    
    Todo *lighthouseAssignment2 = [[Todo alloc] initWithProperties:@"Pizza delegate" forTaskDescription:@"Pizza Assignment with delegates" forPriorityNumber:@2];
    lighthouseAssignment2.completed = YES;
    
    Todo *lighthouseAssignment3 = [[Todo alloc] initWithProperties:@"My scroll view" forTaskDescription:@"creating own scroll view" forPriorityNumber:@3];
    
    self.todos = [NSMutableArray array];
    
    //add todos to array
    [self.todos addObject:lighthouseAssignment1];
    [self.todos addObject:lighthouseAssignment2];
    [self.todos addObject:lighthouseAssignment3];
    
}

- (void)viewWillAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.todos) {
        self.todos = [[NSMutableArray alloc] init];
    }
    [self.todos insertObject:self.todos[0] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSMutableArray *todos = self.todos[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:todos];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"section: %ld, row: %ld", indexPath.section, indexPath.row);
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Todo *todo = self.todos[indexPath.row];
    NSString *name = todo.title;
    NSString *description = todo.taskDescription;
    NSString *priority = [todo.priorityNumber stringValue];
    
     NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:name];
     NSMutableAttributedString *descriptionString = [[NSMutableAttributedString alloc] initWithString:description];
     
    
    if (todo.completed) {
        [titleString addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0,[titleString length])];
        cell.titleLabel.attributedText = titleString;
        [descriptionString addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0,[descriptionString length])];
        cell.descriptionLabel.attributedText = descriptionString;
        cell.numberLabel.hidden = YES;
    } else {
        cell.titleLabel.text = name;
        cell.descriptionLabel.text = description;
        cell.numberLabel.text = priority;
    }
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.todos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
