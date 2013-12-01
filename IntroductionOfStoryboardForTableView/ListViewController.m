//
//  ViewController.m
//  IntroductionOfStoryboardForTableView
//
//  Created by akuraru on 2013/12/01.
//  Copyright (c) 2013年 akuraru. All rights reserved.
//

#import "ListViewController.h"
#import "TodoViewController.h"

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
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _list.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == _list.count) {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 320, 44)];
        label.text = @"new";
        [cell addSubview:label];
        
        return cell;
    } else {
        NSDictionary *todoData = _list[indexPath.row];
        UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 320, 44)];
        label.text = todoData[@"title"];
        [cell addSubview:label];
        
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TodoViewController *controller = [[TodoViewController alloc] init];
    controller.delegate = self;
    if (indexPath.row < _list.count) {
        controller.todoData = _list[indexPath.row];
    }
    controller.index = indexPath.row;
    [self.navigationController pushViewController:controller animated:YES];
}
- (void)insertOrUpdate:(NSDictionary *)dict index:(NSUInteger)index {
    if (index == _list.count) {
        [_list addObject:dict];
    } else {
        _list[index] = dict;
    }
}

@end
