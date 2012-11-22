//
//  DHLoginView.m
//  SmartITOM
//
//  Created by Apple002 on 12-10-29.
//  Copyright (c) 2012年 Apple002. All rights reserved.
//

#import "DHLoginView.h"

@interface DHLoginView (Private)

- (void)build;

@end


@implementation DHLoginView

@synthesize delegate;
@synthesize remenberCheckBox;
@synthesize autoCheckBox;
@synthesize tfName;
@synthesize tfPsw;
@synthesize btnLogin;
@synthesize btnSet;
@synthesize btnClear;

@synthesize smartSQL;
@synthesize userDownList;
@synthesize selectedUser;
@synthesize list;

@synthesize remenber = _remenber;
@synthesize autologin = _autologin;
@synthesize history;
@synthesize isclear = _isclear;


//@synthesize password;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        delegate = nil;
        
        [self build];
    }
    return self;
}

- (void)build
{
    //背景
    UIImageView *backImgv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [backImgv setImage:[UIImage imageNamed:@"loginView_Bg.png"]];
    [self addSubview:backImgv];
    
    //账户密码背景
    UIImageView *loginImgv = [[UIImageView alloc]initWithFrame:CGRectMake(44, 26, 409, 84)];
    [loginImgv setImage:[UIImage imageNamed:@"tf_input.png"]];
    [self addSubview:loginImgv];
    
    //用户名
    tfName = [[UITextField alloc]initWithFrame:CGRectMake(65, 27, 339, 41)];
    [tfName setClearButtonMode:UITextFieldViewModeWhileEditing];
    [tfName setTextAlignment:NSTextAlignmentLeft];
    [tfName setTextColor:[UIColor blackColor]];
    [tfName setBorderStyle:UITextBorderStyleNone];
    [tfName setFont:[UIFont systemFontOfSize:18]];
    [tfName setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 41)];
    [nameLabel setFont:[UIFont systemFontOfSize:18]];
    nameLabel.text = @"账号:";
    [tfName setLeftView:nameLabel];
    [tfName setLeftViewMode:UITextFieldViewModeAlways];

    //历史按钮
    UIButton * btnHistory = [UIButton buttonWithType:UIButtonTypeCustom];
    btnHistory.backgroundColor = [UIColor clearColor];
    [btnHistory setBackgroundImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
        [btnHistory setFrame:CGRectMake(411, 26, 40, 40)];
    [btnHistory addTarget:self action:@selector(clickHistory) forControlEvents:UIControlEventTouchUpInside];
    history = FALSE;  
    [self addSubview:btnHistory];
    
    tfName.delegate = self;
    [self addSubview:tfName];
    

    
    //密码
    tfPsw = [[UITextField alloc]initWithFrame:CGRectMake(65, 69, 379, 40)];
    [tfPsw setSecureTextEntry:YES];
    [tfPsw setFont:[UIFont systemFontOfSize:18]];
    [tfPsw setTextAlignment:NSTextAlignmentNatural];
    [tfPsw setTextColor:[UIColor blackColor]];
    [tfPsw setBorderStyle:UITextBorderStyleNone];
    [tfPsw setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    
    UILabel *passLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
    [passLabel setFont:[UIFont systemFontOfSize:18]];
    passLabel.text = @"密码:";
    [tfPsw setLeftView:passLabel];
    
    [tfPsw setLeftViewMode:UITextFieldViewModeAlways];
    [tfPsw setClearButtonMode:UITextFieldViewModeWhileEditing];
    tfPsw.delegate = self;
    [self addSubview:tfPsw];
    
    
    
    //记住密码
    remenberCheckBox = [[DHCheckBox alloc]initWithFrame:CGRectMake(300, 110, 100, 50)];
    [remenberCheckBox setTitle:@"  记住密码" forState:UIControlStateNormal];
    [remenberCheckBox setTitleColor:[UIColor colorWithRed:110.0/255.0 green:110.0/255.0 blue:110.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    remenberCheckBox.titleLabel.font = [UIFont systemFontOfSize:16];
    [remenberCheckBox setTarget:self action:@selector(ClickCheckBox) andTag:1];
    [remenberCheckBox setSelected:FALSE];
    remenberCheckBox.delegate = self;
    [self addSubview:remenberCheckBox];
    
    
    //自动登录
    autoCheckBox = [[DHCheckBox alloc]initWithFrame:CGRectMake(110, 110, 100, 50)];
    [autoCheckBox setTitle:@"  自动登录" forState:UIControlStateNormal];
    [autoCheckBox setTitleColor:[UIColor colorWithRed:110.0/255.0 green:110.0/255.0 blue:110.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    autoCheckBox.titleLabel.font = [UIFont systemFontOfSize:16];
    [autoCheckBox setTarget:self action:@selector(ClickCheckBox) andTag:2];
    autoCheckBox.delegate = self;
    [self addSubview:autoCheckBox];
    
    
    //登录
    btnLogin = [UIButton buttonWithType:UIButtonTypeCustom ];
    [btnLogin setFrame:CGRectMake(44, 160, 409, 42)];
    [btnLogin setBackgroundImage:[UIImage imageNamed:@"btn_login_loginv.png"] forState:UIControlStateNormal];
    [btnLogin addTarget:self action:@selector(clickLoginButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnLogin];

        
    //设置
    btnSet = [UIButton buttonWithType:UIButtonTypeCustom ];
    [btnSet setFrame:CGRectMake(44, 210, 201, 42)];
    [btnSet setBackgroundImage:[UIImage imageNamed:@"btn_set_setv.png"] forState:UIControlStateNormal];
    [btnSet addTarget:self action:@selector(clickSetButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnSet];
    
    
    //清除
    btnClear = [UIButton buttonWithType:UIButtonTypeCustom ];
    [btnClear setFrame:CGRectMake(251, 210, 201, 42)];
    [btnClear setBackgroundImage:[UIImage imageNamed:@"btn_clear_loginv.png"] forState:UIControlStateNormal];
    [btnClear addTarget:self action:@selector(clickClearButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnClear];
    
    
    //下拉列表
    userDownList = [[UITableView alloc]initWithFrame:CGRectMake(115, 68, 339, 0)];
    userDownList.dataSource = self;
    userDownList.delegate = self;
    [self addSubview:userDownList];
    
    
}


//登录历史

-(void)clickHistory
{
    
    self.history = !self.history;
    
    if (nil != delegate)
    {
        [delegate didRequestHistoryBtn];
    }
    

    if (self.history)
    {


        [UIView beginAnimations:@"animation" context:nil];
        [UIView setAnimationDuration:0.1f];
        [userDownList setFrame:CGRectMake(115, 68, 339, 200)];
        [userDownList reloadData];
        [UIView commitAnimations];
    }
    else
    {
        [UIView beginAnimations:@"animation" context:nil];
        [UIView setAnimationDuration:0.1f];
        [userDownList setFrame:CGRectMake(115, 68, 339, 0)];
        [UIView commitAnimations];
    
    }
    
}



//清除
- (void)clickClearButton
{
    btnClear.selected = !btnClear.selected;
    if (btnClear.selected)
    {
        [btnClear setBackgroundImage:[UIImage imageNamed:@"btn_clear_loginv_clicked.png"] forState:UIControlStateNormal];
    }
    else
    {
        [btnClear setBackgroundImage:[UIImage imageNamed:@"btn_clear_loginv.png"] forState:UIControlStateNormal];
    }
    
    
           
    if (nil != delegate)
    {
        [delegate didRequestClear:tfName.text andPass:tfPsw.text];
    }
}

//设置
- (void)clickSetButton
{
  
    btnSet.selected = !btnSet.selected;
    if (btnSet.selected)
    {
        [btnSet setBackgroundImage:[UIImage imageNamed:@"btn_set_setv_clicked.png"] forState:UIControlStateNormal];
    }
    else
    {
        [btnSet setBackgroundImage:[UIImage imageNamed:@"btn_set_setv.png"] forState:UIControlStateNormal];
    }
    if (nil != delegate)
    {
        [delegate didRequestSetButton];
    }
}


//登录
- (void)clickLoginButton
{

    btnLogin.selected = !btnLogin.selected;
    if (btnLogin.selected)
    {
        [btnLogin setBackgroundImage:[UIImage imageNamed:@"btn_login_loginv_clicked.png"] forState:UIControlStateNormal];
    }
    else
    {
        [btnLogin setBackgroundImage:[UIImage imageNamed:@"btn_login_loginv.png"] forState:UIControlStateNormal];
    }
    
    if (nil != delegate)
    {
        
        [delegate  didRequestLogin:tfName.text
                           andPass:tfPsw.text
                       andRemenber:remenberCheckBox.selected
                           andAuto:autoCheckBox.selected
                        andHistory:[self history]];
    }
    

    


}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - DHCheckBoxDelegate
- (void)didRequestCheckBox:(BOOL)_selected andTag:(NSInteger)_num
{

    if(1 == _num)
    {
        remenberCheckBox.selected = _selected;
        if (!remenberCheckBox.selected)
        {
            autoCheckBox.selected = _selected;
            [autoCheckBox setImage:[UIImage imageNamed:@"com_btn_check.png"] forState:UIControlStateNormal];
        }
        
    
    }
    else if (2 == _num)
    {
        autoCheckBox.selected = _selected;
        if (autoCheckBox.selected)
        {
            remenberCheckBox.selected = _selected;
            [remenberCheckBox setImage:[UIImage imageNamed:@"com_btn_checked.png"] forState:UIControlStateNormal];
        }
        
    }
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSLog(@"LIST COUMT = %d",[list count]);
    return [list count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    DHUser* auser = [[DHUser alloc]init];
    auser = [list objectAtIndex:indexPath.row];
	cell.textLabel.text = auser.userName;
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 42;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.history = !self.history;
    tfName.text = nil;
    tfPsw.text = nil;
    [remenberCheckBox setImage:[UIImage imageNamed:@"com_btn_check.png"] forState:UIControlStateNormal];
    [autoCheckBox setImage:[UIImage imageNamed:@"com_btn_check.png"] forState:UIControlStateNormal];
    
    DHUser* auser = [[DHUser alloc]init];
    auser = [list objectAtIndex:indexPath.row];
    selectedUser = auser;
    
    if (nil != delegate)
    {
        [delegate passValue:selectedUser];
    }
    
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:0.1f];
    [userDownList setFrame:CGRectMake(115, 68, 339, 0)];
    [UIView commitAnimations];
	
}


@end
