//
//  TodoViewController.m
//  IntroductionOfStoryboardForTableView
//
//  Created by akuraru on 2013/12/01.
//  Copyright (c) 2013年 akuraru. All rights reserved.
//

#import "TodoViewController.h"

@interface TodoViewController ()

@end

@implementation TodoViewController {
    __weak UITextField *titleField;
    __weak UITextView *detailText;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup:_todoData];
}

- (void)setup:(NSDictionary *)todoData {
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self .edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 300, 40)];
    field.text = todoData[@"title"];
    field.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:field];
    titleField = field;
    
    UITextView *detail = [[UITextView alloc] initWithFrame:CGRectMake(10, 60, 300, 100)];
    detail.text = todoData[@"detail"];
    detail.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:detail];
    detailText = detail;
    
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = save;
}

- (void)save:(id)sender {
    if ([_delegate respondsToSelector:@selector(insertOrUpdate:index:)]) {
        [_delegate insertOrUpdate:@{
            @"title" : (titleField.text) ?: @"",
            @"detail" : (detailText.text) ?: @"",
        } index:_index];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
