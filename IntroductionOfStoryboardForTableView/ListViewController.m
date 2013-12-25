//
//  ViewController.m
//  IntroductionOfStoryboardForTableView
//
//  Created by akuraru on 2013/12/01.
//  Copyright (c) 2013年 akuraru. All rights reserved.
//

#import "ListViewController.h"
#import "TodoViewController.h"
#import "MainStoryboardEntry.h"
#import "NewCell.h"
#import "TodoCell.h"

@interface ListViewController () <TodoDelegate>
@end

@implementation ListViewController {
    NSMutableArray *_list;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _list = [NSMutableArray array];
    [_list addObject:@{@"title" : @"DDD" }];
    
    [self setup];
}

- (void)setup {
    UIBarButtonItem *edit = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(edit:)];
    self.navigationItem.rightBarButtonItem = edit;
}
- (void)edit:(id)sender {
    [self setEdit:!self.tableView.editing];
}
- (void)setEdit:(BOOL)edit {
    self.tableView.editing = edit;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _list.count + 1;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _list.count) {
        return UITableViewCellEditingStyleNone;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _list.count) {
        return [tableView dequeueReusableCellWithIdentifier:@"NewCell"];
    } else {
        TodoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell"];
        [cell setTodoData:_list[indexPath.row]];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_list removeObjectsAtIndexes:[NSIndexSet indexSetWithIndex:indexPath.row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSegueWithIdentifier:@"Editting" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Editting"]) {
        TodoViewController *controller = segue.destinationViewController;
        NSIndexPath *indexPath = sender;
        
        controller.delegate = self;
        if (indexPath.row < _list.count) {
            controller.todoData = _list[indexPath.row];
        }
        controller.index = indexPath.row;
    }
}
- (void)insertOrUpdate:(NSDictionary *)dict {
    NSInteger index = [dict[@"index"] integerValue];
    if (index == _list.count) {
        [_list addObject:dict];
    } else {
        _list[index] = dict;
    }
}

@end
