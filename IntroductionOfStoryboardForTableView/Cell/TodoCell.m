//
//  TodoCell.m
//  IntroductionOfStoryboardForTableView
//
//  Created by akuraru on 2013/12/01.
//  Copyright (c) 2013年 akuraru. All rights reserved.
//

#import "TodoCell.h"

@implementation TodoCell {
    __weak UILabel *todoTitle;
}

- (id)init {
    self = [super initWithFrame:CGRectMake(0, 0, 320, 44)];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 320, 44)];
    [self addSubview:label];
    todoTitle = label;
}
- (void)setTodoData:(NSDictionary *)todoData {
    todoTitle.text = todoData[@"title"];
}


@end
