//
//  SortViewController.h
//  SmartITOM
//
//  Created by 曾長歡 on 12-11-20.
//  Copyright (c) 2012年 Ambrose. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageViewController;
@interface SortViewController : UITableViewController
@property (weak,nonatomic) MessageViewController *messageViewController;
@property (strong,nonatomic) NSArray *sortArray;
@property (strong,nonatomic) NSArray *markedArray;
@end
