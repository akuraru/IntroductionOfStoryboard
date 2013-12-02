//
//  TodoCell.m
//  IntroductionOfStoryboardForTableView
//
//  Created by akuraru on 2013/12/01.
//  Copyright (c) 2013年 akuraru. All rights reserved.
//

#import "TodoCell.h"

@implementation TodoCell {
    __weak IBOutlet UILabel *todoTitle;
}
- (void)setTodoData:(NSDictionary *)todoData {
    todoTitle.text = todoData[@"title"];
}


@end
