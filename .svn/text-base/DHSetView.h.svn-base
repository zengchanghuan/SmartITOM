
////
////  DHSetView.h
////  setView
////
////  Created by Apple002 on 12-11-5.
////  Copyright (c) 2012年 Apple002. All rights reserved.


#import <UIKit/UIKit.h>
#import "DHSetViewDelegate.h"
#import "SmartITOMSqlite.h"

@interface DHSetView : UIView <UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
	
}

@property (nonatomic, assign) id <DHSetViewDelegate> delegate;
@property (nonatomic, strong) UITextField *tfIp;
@property (nonatomic, strong) UIButton *btnIpHistory;
@property (nonatomic, strong) UITextField *tfPort;
@property (nonatomic, strong) UIButton *btnPortHistory;
@property (nonatomic, strong) UIButton *testButton;
@property (nonatomic, strong) UIButton *okButton;
@property (nonatomic, strong) UIActivityIndicatorView *activity ;
@property (nonatomic, strong) UIImageView *test;
@property (nonatomic, strong) UILabel *notification;

@property (nonatomic, strong) SmartITOMSqlite *smartSQL;
@property (nonatomic, strong) UITableView * ipTableView;
@property (nonatomic, strong) UITableView *portTableView;
@property (nonatomic, strong) NSMutableArray *downlist;
@property (nonatomic, strong) NSString *selectedText;

@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) BOOL iphistory;
@property (nonatomic, assign) BOOL porthistory;
@end

