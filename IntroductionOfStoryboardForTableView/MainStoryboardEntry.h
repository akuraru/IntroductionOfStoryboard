//
//  MainStoryboardEntry.h
//  IntroductionOfStoryboardForTableView
//
//  Created by akuraru on 2013/12/01.
//  Copyright (c) 2013年 akuraru. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListViewController;
@class TodoViewController;

@interface MainStoryboardEntry : NSObject

+ (UINavigationController *)navigationController;
+ (ListViewController *)listViewController;
+ (TodoViewController *)todoViewController;

@end
