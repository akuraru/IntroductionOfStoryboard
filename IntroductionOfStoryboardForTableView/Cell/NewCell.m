//
//  NewCell.m
//  IntroductionOfStoryboardForTableView
//
//  Created by akuraru on 2013/12/01.
//  Copyright (c) 2013年 akuraru. All rights reserved.
//

#import "NewCell.h"

@implementation NewCell

- (id)init {
    self = [super initWithFrame:CGRectMake(0, 0, 320, 44)];
    if (self) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 320, 44)];
        label.text = @"new";
        [self addSubview:label];
    }
    return self;
}

@end
