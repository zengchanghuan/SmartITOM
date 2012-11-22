//
//  MessageViewController.h
//  SmartITOM
//
//  Created by Apple001 on 12-11-6.
//  Copyright (c) 2012年 Ambrose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullingRefreshTableView.h"
@interface MessageViewController : UIViewController<PullingRefreshTableViewDelegate,UITableViewDataSource,UITableViewDelegate
,UIPopoverControllerDelegate>
{
	UIImageView *sortImageView;
	UIImageView *editImageView;
	BOOL singFingerTap;
	UIView *editView;
		
}
@property (strong,nonatomic) PullingRefreshTableView *messageTableView;
@property (strong,nonatomic) NSMutableArray *list;
@property (nonatomic,assign) BOOL refreshing;
@property (assign,nonatomic) NSInteger page;

@property (strong, nonatomic) id detailItem;
@property (strong,nonatomic) UIBarButtonItem *sortButton;
@property (strong,nonatomic) UIPopoverController *sortPopoverController;
@property (copy,nonatomic) NSString *sortString;
@end
