//
//  TodoViewController.h
//  IntroductionOfStoryboardForTableView
//
//  Created by akuraru on 2013/12/01.
//  Copyright (c) 2013年 akuraru. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TodoDelegate <NSObject>
- (void)insertOrUpdate:(NSDictionary *)dict index:(NSUInteger)index;
@end

@interface TodoViewController : UIViewController

@property (nonatomic, weak) id<TodoDelegate> delegate;
@property (nonatomic) NSDictionary *todoData;
@property (nonatomic) NSInteger index;

@end
