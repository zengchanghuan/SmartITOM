
////  DHSetView.m
////  setView
////
////  Created by Apple002 on 12-11-5.
////  Copyright (c) 2012年 Apple002. All rights reserved.



#import "DHSetView.h"

@interface DHSetView  (Private)

- (void)build;

@end

@implementation DHSetView

@synthesize delegate;
@synthesize tfIp;
@synthesize btnIpHistory;
@synthesize tfPort;
@synthesize btnPortHistory;
@synthesize okButton;
@synthesize testButton;
@synthesize activity;
@synthesize test;
@synthesize notification;

@synthesize smartSQL;
@synthesize ipTableView;
@synthesize downlist;
@synthesize selectedText;
@synthesize portTableView;


@synthesize username;
@synthesize iphistory;
@synthesize porthistory;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.delegate = nil;
        [self build];
        
        
    }
    return self;
}

- (void)build
{
    UIImageView *backImgv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [backImgv setImage:[UIImage imageNamed:@"loginView_Bg.png"]];
    [self addSubview:backImgv];
    
    //ip 端口背景
    UIImageView *setImgv = [[UIImageView alloc]initWithFrame:CGRectMake(44, 53, 409, 84)];
    [setImgv setImage:[UIImage imageNamed:@"tf_input.png"]];
    [self addSubview:setImgv];
    
    //关闭
    UIButton *closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(430, 9, 58, 30)];
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"close_btn.png"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(clickCloseBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:closeBtn];
    
    //服务器IP
    tfIp = [[UITextField alloc]initWithFrame:CGRectMake(65, 54, 327, 40)];
    [tfIp setClearButtonMode:UITextFieldViewModeWhileEditing];
    [tfIp setTextAlignment:NSTextAlignmentLeft];
    [tfIp setTextColor:[UIColor blackColor]];
    [tfIp setBorderStyle:UITextBorderStyleNone];
    [tfIp setFont:[UIFont systemFontOfSize:18]];
    [tfIp setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    
    
    UILabel *ipLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [ipLable setFont:[UIFont systemFontOfSize:18]];
    ipLable.text = @"服务器IP:";
    [tfIp setLeftView:ipLable];
    [tfIp setLeftViewMode:UITextFieldViewModeAlways];
    
    [tfIp setTag:1];
    tfIp.delegate = self;
    [self addSubview:tfIp];
    
    btnIpHistory = [UIButton buttonWithType:UIButtonTypeCustom];
    btnIpHistory.backgroundColor = [UIColor clearColor];
    [btnIpHistory setBackgroundImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
    [btnIpHistory setFrame:CGRectMake(411, 53, 42, 40)];
    [btnIpHistory setTag:1];
    [btnIpHistory addTarget:self action:@selector(clickIpHistory) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnIpHistory];
    
    iphistory = FALSE;
    
    //服务器端口
    tfPort = [[UITextField alloc]initWithFrame:CGRectMake(65, 96, 327, 40)];
    [tfPort setClearButtonMode:UITextFieldViewModeWhileEditing];
    [tfPort setTextAlignment:NSTextAlignmentLeft];
    [tfPort setTextColor:[UIColor blackColor]];
    [tfPort setBorderStyle:UITextBorderStyleNone];
    [tfPort setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [tfPort setFont:[UIFont systemFontOfSize:18]];
    
    UILabel *portLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    [portLable setFont:[UIFont systemFontOfSize:18]];
    portLable.text = @"服务器端口:";
    [tfPort setLeftView:portLable];
    [tfPort setLeftViewMode:UITextFieldViewModeAlways];
    
    btnPortHistory = [UIButton buttonWithType:UIButtonTypeCustom];
    btnPortHistory.backgroundColor = [UIColor clearColor];
    [btnPortHistory setBackgroundImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
    [btnPortHistory setFrame:CGRectMake(411, 96, 42, 40)];
    [btnPortHistory setTag:2];
    [btnPortHistory addTarget:self action:@selector(clickPortHistory) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnPortHistory];
    porthistory = FALSE;
    
    [tfPort setTag:2];
    tfPort.delegate = self;
    [self addSubview:tfPort];
    
    activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activity setFrame:CGRectMake(70, 157, 20, 20)];
    [self addSubview:activity];
    
    test = [[UIImageView alloc]initWithFrame:CGRectMake(70, 157, 20, 20)];
    [test setImage:[ UIImage imageNamed:@"com_btn_checked.png"]];
    [test setHidden:YES];
    [self addSubview:test];
    
    notification = [[UILabel alloc]initWithFrame:CGRectMake(100, 157, 200, 20)];
    [notification setFont:[UIFont systemFontOfSize:18]];
    [notification setBackgroundColor:[UIColor clearColor]];
    [self addSubview:notification];
    
    //测试
    testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [testButton setFrame:CGRectMake(44, 210, 201, 42)];
    [testButton setBackgroundImage:[UIImage imageNamed:@"btn_test_setv.png"] forState:UIControlStateNormal];
    //[testButton setTitle:@"测试" forState:UIControlStateNormal];
    //[testButton setBackgroundColor:[UIColor grayColor]];
    [testButton addTarget:self action:@selector(clickTestButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:testButton];
    
    
    //确定
    okButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [okButton setFrame:CGRectMake(250, 210, 201, 42)];
    [okButton setBackgroundImage:[UIImage imageNamed:@"btn_ok_setv.png"] forState:UIControlStateNormal];
    //[okButton setTitle:@"确定" forState:UIControlStateNormal];
    //[okButton setBackgroundColor:[UIColor grayColor]];
    [okButton addTarget:self action:@selector(clickOkButton) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:okButton];
    
    //下拉列表
    ipTableView = [[UITableView alloc]initWithFrame:CGRectMake(165, 94, 289, 0) style:UITableViewStylePlain];
    [ipTableView setTag:1];
    ipTableView.dataSource = self;
    ipTableView.delegate = self;
    [self addSubview:ipTableView];
    
    portTableView = [[UITableView alloc]initWithFrame:CGRectMake(165, 136, 289, 0) style:UITableViewStylePlain];
    [portTableView setTag:2];
    portTableView.dataSource = self;
    portTableView.delegate = self;
    [self addSubview:portTableView];
}

- (void)clickCloseBtn
{
    NSLog(@"click close btn");
    if (nil != delegate)
    {
        [delegate didRequestCloseButton];
    }
}

- (void)clickIpHistory
{

    iphistory = !iphistory;
    
    if (iphistory)
    {
        if (nil != delegate)
        {
            [delegate didRequestIpHistoryButton];
        }
        [UIView beginAnimations:@"animation" context:nil];
        [UIView setAnimationDuration:0.1f];
        [ipTableView setFrame:CGRectMake(165, 94, 289, 200)];
        [ipTableView reloadData];
        [UIView commitAnimations];

    }
    else
    {
        [UIView beginAnimations:@"animation" context:nil];
        [UIView setAnimationDuration:0.1f];
        [ipTableView setFrame:CGRectMake(165, 94, 289, 0)];
        [UIView commitAnimations];
    }
    

    

}

- (void)clickPortHistory
{
    porthistory = !porthistory;
    
    if (porthistory)
    {
        if (nil != delegate)
        {
            [delegate didRequestPortHistoryButton];
        }

        [UIView beginAnimations:@"animation" context:nil];
        [UIView setAnimationDuration:0.1f];
        [portTableView setFrame:CGRectMake(165, 136,289, 160)];
        [portTableView reloadData];
        [UIView commitAnimations];
    }
    else
    {
        [UIView beginAnimations:@"animation" context:nil];
        [UIView setAnimationDuration:0.1f];
        [portTableView setFrame:CGRectMake(165, 136, 289, 0)];
        [UIView commitAnimations];
    }
    

    

}


- (void)clickOkButton
{
    NSLog(@"ok ");
    if (nil != delegate)
    {
        
        [delegate didRequestOkButton:username andIP:tfIp.text andPort:[tfPort.text intValue]];
    }
}

//
- (void)clickTestButton
{
    
    //dispatch_async(dispatch_get_current_queue(), <#^(void)block#>)
    
    NSString *ip = @"192.168.0.1";
    
    if ([ip isEqualToString: tfIp.text] && 8080 == [tfPort.text intValue])
    {
        [activity startAnimating];
        [notification setText:@"正在测试，请稍候..."];
    }

    if (nil != delegate)
    {
        [delegate didRequestTestButton:tfIp.text andPort:tfPort.text];
    }
    
    [activity stopAnimating];

    test.hidden = NO;
    
    [notification setText:@"测试通过！"];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //NSLog(@"LIST COUMT = %d",[list count]);
    return [downlist count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	cell.textLabel.text = [downlist objectAtIndex:[indexPath row]];
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 42;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    selectedText = [downlist objectAtIndex:[indexPath row]];
    
    if (1 == tableView.tag)
    {
        tfIp.text = selectedText;
        iphistory = !iphistory;
    }
    else
    {
        tfPort.text = selectedText;
        porthistory = !porthistory;
    }
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:0.1f];
    [ipTableView setFrame:CGRectMake(165, 94, 289, 0)];
    [portTableView setFrame:CGRectMake(165, 136, 289, 0)];
    [UIView commitAnimations];
	
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

