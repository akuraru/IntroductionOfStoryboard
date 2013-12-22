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
    IBOutlet __weak UITextField *titleField;
    IBOutlet __weak UITextView *detailText;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup:_todoData];
}

- (void)setup:(NSDictionary *)todoData {
    self.view.backgroundColor = [UIColor whiteColor];
    
    titleField.text = todoData[@"title"];
    detailText.text = todoData[@"detail"];
    
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
