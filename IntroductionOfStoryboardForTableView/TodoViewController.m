//
//  TodoViewController.m
//  IntroductionOfStoryboardForTableView
//
//  Created by akuraru on 2013/12/01.
//  Copyright (c) 2013年 akuraru. All rights reserved.
//

#import "TodoViewController.h"
#import "ListViewController.h"

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
    [self performSegueWithIdentifier:@"Back" sender:@{
        @"title" : (titleField.text) ?: @"",
        @"detail" : (detailText.text) ?: @"",
        @"index" : @(_index),
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Back"]) {
        ListViewController *controller = segue.destinationViewController;
        [controller insertOrUpdate:sender];
    }
}
@end
