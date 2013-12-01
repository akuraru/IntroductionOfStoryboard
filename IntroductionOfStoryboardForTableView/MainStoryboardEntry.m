//
//  MainStoryboardEntry.m
//  IntroductionOfStoryboardForTableView
//
//  Created by akuraru on 2013/12/01.
//  Copyright (c) 2013年 akuraru. All rights reserved.
//

#import "MainStoryboardEntry.h"
#import "ListViewController.h"
#import "TodoViewController.h"

@implementation MainStoryboardEntry

+ (UINavigationController *)navigationController {
    return [self viewController:[UINavigationController class]];
}
+ (ListViewController *)listViewController {
    return [self viewController:[ListViewController class]];
    
}
+ (TodoViewController *)todoViewController {
    return [self viewController:[TodoViewController class]];
}



+ (id)viewController:(Class)class {
    NSString *identifier = NSStringFromClass(class);
    UIStoryboard *storyboard = [self storyboard];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

+ (UIStoryboard *)storyboard {
    NSString *boardName = @"Main";
    return [UIStoryboard storyboardWithName:boardName bundle:nil];
}

@end
