//
//  DHLoginView.h
//  SmartITOM
//
//  Created by Apple002 on 12-10-29.
//  Copyright (c) 2012年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHCheckBox.h"
#import "DHLoginViewDelegate.h"

#import "SmartITOMSqlite.h"

@interface DHLoginView : UIView <DHCheckBoxDelegate,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    id target;
    SEL fun;
    UIButton *btnClear;
   
}

@property (nonatomic, strong) id<DHLoginViewDelegate> delegate;
@property (nonatomic, strong) DHCheckBox *remenberCheckBox;
@property (nonatomic, strong) DHCheckBox *autoCheckBox;
@property (nonatomic, strong) IBOutlet UITextField *tfName;
@property (nonatomic, strong) IBOutlet UITextField *tfPsw;
@property (nonatomic, strong) UIButton *btnLogin;
@property (nonatomic, strong) UIButton *btnSet;
@property (nonatomic, strong) UIButton *btnClear;

@property (nonatomic, strong) SmartITOMSqlite *smartSQL;
@property (nonatomic, strong) UITableView *userDownList;
@property (nonatomic, strong) DHUser *selectedUser;
@property (nonatomic, strong) NSMutableArray *list;

@property (nonatomic, assign) BOOL remenber;
@property (nonatomic, assign) BOOL autologin;
@property (nonatomic, assign) BOOL history;
@property (nonatomic, assign) BOOL isclear;


@end
