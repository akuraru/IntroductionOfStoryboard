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
    titleField.text = todoData[@"title"];
    detailText.text = todoData[@"detail"];
}

- (IBAction)save:(id)sender {
    if ([_delegate respondsToSelector:@selector(insertOrUpdate:)]) {
        [_delegate insertOrUpdate:@{
            @"title" : (titleField.text) ?: @"",
            @"detail" : (detailText.text) ?: @"",
            @"index" : @(_index),
        }];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
