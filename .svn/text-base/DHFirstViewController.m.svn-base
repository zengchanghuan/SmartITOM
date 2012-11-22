//
//  DHFirstViewController.m
//  SmartITOM
//

#import "DHFirstViewController.h"
#import "DHMainViewController.h"
#import "SmartITOMSqlite.h"
//#import <QuartzCore/QuartzCore.h>

DHMainViewController *g_MainViewController;

@interface DHFirstViewController ()

@end

@implementation DHFirstViewController

@synthesize logoView;
@synthesize subView;
@synthesize loginView;
@synthesize isLandscape;
@synthesize setView;
@synthesize username;
@synthesize smartITOMSql;



- (void)viewDidLoad
{
    [logoView setImage:[UIImage imageNamed:@"logo.png"]];
    
    setView = [[DHSetView alloc]initWithFrame:CGRectMake(0, 0, 499, 277)];
    setView.delegate = self;
    //[self.subView addSubview:self.setView];
    
    loginView = [[DHLoginView alloc] initWithFrame:CGRectMake(0, 0, 499, 277)];
    loginView.delegate = self;
    
    [[self subView] addSubview:loginView];
    
    [subView setBackgroundColor:[UIColor clearColor]];
    


    self.isLandscape = FALSE;
    
    smartITOMSql = [[SmartITOMSqlite alloc]init];
    [smartITOMSql createTable];
    [smartITOMSql createIpTable];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [super viewDidLoad];
    
}


-(void)keyboardWillShow:(NSNotification*)notifacation
{
    NSDictionary *userInfo = [notifacation userInfo];
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    if (isLandscape)
    {
        [self.logoView setFrame:CGRectMake(330, 0, 364, 0)];
        [self.subView setFrame:CGRectMake(UIVIEW_UP_FRAME_LANDSCAPE_X, UIVIEW_UP_FRAME_LANDSCAPE_Y, 499, 277)];
        
    }
    else
    {
        [self.subView setFrame:CGRectMake(UIVIEW_UP_FRAME_PORTRAIT_X, UIVIEW_UP_FRAME_PORTRAIT_Y, 499, 277)];
    }
    
    [UIView commitAnimations];
}

- (void)keyboardWillHide:(NSNotification*)nontification
{
    NSDictionary *userInfo = [nontification userInfo];
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    
    if (isLandscape)
    {
        [self.logoView setFrame:CGRectMake(330, 107, 364, 103)];
        [self.view addSubview:logoView];
        
        
        [self.subView setFrame:CGRectMake(UIVIEW_DOWN_FRAME_LANDSCAPE_X, UIVIEW_DOWN_FRAME_LANDSCAPE_Y, 499, 277)];
    }
    else
    {
        [self.subView setFrame:CGRectMake(UIVIEW_DOWN_FRAME_PORTRAIT_X, UIVIEW_DOWN_FRAME_PORTRAIT_Y, 499, 277)];
    }
    [UIView commitAnimations];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft||toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.isLandscape = TRUE;
    }
    else
    {
        self.isLandscape = FALSE;
    }
    
    return TRUE;
}

- (void)viewDidUnload
{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
    [self setSubView:nil];
    
    [self setLogoView:nil];
    [super viewDidUnload];
}

#pragma mark - DHLoginViewDelegate

//历史记录
- (void)didRequestHistoryBtn

{
    NSMutableArray *userlist = [smartITOMSql selectAllUser];
    loginView.list = userlist;       
    
}

//登录
- (void)didRequestLogin:(NSString *)_name andPass:(NSString *)_pass andRemenber:(BOOL)_remenber andAuto:(BOOL)_autologin andHistory:(BOOL)_history
{
	dispatch_async(dispatch_get_main_queue(), ^{
		UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
		DHMainViewController *next = [storyboard instantiateViewControllerWithIdentifier:@"smartITOM_Main"];
		g_MainViewController = next;
		[self presentModalViewController:next animated:YES];
	});
/*
    if (Nil != _name)
    {
        if (nil != _pass)
        {
            if ([smartITOMSql selectUserName:_name])
            {
                if ([_pass isEqualToString:[smartITOMSql selectPassword:_name]])
                {
				
           
                    //登录成功
                    dispatch_async(dispatch_get_main_queue(), ^{
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
                        DHMainViewController *next = [storyboard instantiateViewControllerWithIdentifier:@"smartITOM_Main"];
                        g_MainViewController = next;
                        [self presentModalViewController:next animated:YES];
						                    });
                    
                }
                else
                {
                    //密码错误
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"身份验证失败！！" message:@"密码错误！！"delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
                    [alert show];
                }
                
            }
            else
            {
                //用户不存在
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"身份验证失败！！" message:@"用户名不存在！！"delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
                [alert show];
            }
            
        }
        else
        {
            //输入密码
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"身份验证失败" message:@"请输入密码！！" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    else
    {
        //输入用户名
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"身份验证失败" message:@"请输入用户名！！" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
        [alert show];
    }
 */

}

//清除
- (void)didRequestClear:(NSString*)_name andPass:(NSString*)_pass
{

    if (Nil != _name )
    {
        if (![smartITOMSql selectUserName:_name])
        {
            //服务器中没有该用户
            loginView.tfName.text = nil;
            loginView.tfPsw.text = nil;
            [loginView.remenberCheckBox setImage:[UIImage imageNamed:@"com_btn_check.png"] forState:UIControlStateNormal];
            loginView.remenberCheckBox.selected = !loginView.remenberCheckBox.selected;
            [loginView.autoCheckBox setImage:[UIImage imageNamed:@"com_btn_check.png"] forState:UIControlStateNormal];
            loginView.autoCheckBox.selected = !loginView.autoCheckBox.selected;
            
        }
        else
        {
            //服务器中有该用户，删除数据库
            //num = 1 删除成功
            //num = 2 密码为空
            //num = 3 密码错误
            switch ([smartITOMSql deleteUser:_name andPass:_pass]) {
                case 1:
                {
                    loginView.tfName.text = nil;
                    loginView.tfPsw.text = nil;
                    [loginView.remenberCheckBox setImage:[UIImage imageNamed:@"com_btn_check.png"] forState:UIControlStateNormal]
                    ;
                    loginView.remenberCheckBox.selected =! loginView.remenberCheckBox.selected;
                    
                    [loginView.autoCheckBox setImage:[UIImage imageNamed:@"com_btn_check.png"] forState:UIControlStateNormal];
                    loginView.autoCheckBox.selected =! loginView.autoCheckBox.selected;
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"删除成功" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:Nil, nil];
                    [alert show];
                    break;
                }
                case 2:
                {
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"请输入密码！！" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:Nil, nil];
                    [alert show];
                    break;
                }
                case 3:
                {
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"密码错误！！" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:Nil, nil];
                    [alert show];
                    break;
                }
                    
                default:
                    break;
            }
            
        }
    }
    else
    {
        loginView.tfPsw.text = nil;
        [loginView.remenberCheckBox setImage:[UIImage imageNamed:@"com_btn_check.png"] forState:UIControlStateNormal];
        loginView.remenberCheckBox.selected = !loginView.remenberCheckBox.selected;
        [loginView.autoCheckBox setImage:[UIImage imageNamed:@"com_btn_check.png"] forState:UIControlStateNormal];
        loginView.autoCheckBox.selected = !loginView.autoCheckBox.selected;
        
        
    }

    
}

- (void)didRequestSetButton
{
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:subView cache:YES];
    [loginView removeFromSuperview];
    [subView addSubview:setView];
    [UIView commitAnimations];

//    CATransition *animation = [CATransition animation];
//    animation.delegate = self;
//    animation.duration = 1.0f;
//    animation.timingFunction = UIViewAnimationCurveEaseInOut;
//    animation.type = kCATransitionPush;
//    animation.subtype = kCATransitionFromLeft;
//    
//    NSUInteger login = [[self.subView subviews]indexOfObject:self.loginView];
//    NSUInteger set = [[self.subView subviews]indexOfObject:self.setView];
//    
//    [self.subView exchangeSubviewAtIndex:login withSubviewAtIndex:set];
//    
//    [[self.subView layer]addAnimation:animation forKey:@"animation"];

    
    }

- (void)passValue:(DHUser *)_user
{
    loginView.tfName.text = _user.userName;
    
    if (1 == _user.remenberable)
    {
        
        loginView.tfPsw.text = _user.password;
        [loginView.remenberCheckBox setImage:[UIImage imageNamed:@"com_btn_checked.png"] forState:UIControlStateNormal]
        ;
        if (1 == _user.Auto)
        {
            [loginView.autoCheckBox setImage:[UIImage imageNamed:@"com_btn_checked.png"] forState:UIControlStateNormal];
        }
        else
        {
            [loginView.autoCheckBox setImage:[UIImage imageNamed:@"com_btn_check.png"] forState:UIControlStateNormal];
        }
        
    }
    else
    {
        [loginView.remenberCheckBox setImage:[UIImage imageNamed:@"com_btn_check.png"] forState:UIControlStateNormal]
        ;
        
    }
    

}

#pragma mark - DHSetDelegate

- (void)didRequestCloseButton
{
   
    
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:subView cache:YES];
    [setView removeFromSuperview];
    [subView addSubview:loginView];
    [UIView commitAnimations];
}


- (void)didRequestIpHistoryButton
{
    
 
    NSMutableArray *IPArray = [[NSMutableArray alloc]init];
    IPArray = [smartITOMSql selectAllIp];
    setView.downlist = IPArray;
    
}

- (void)didRequestPortHistoryButton
{
    NSMutableArray *PortArray = [[NSMutableArray alloc]init];
    PortArray = [smartITOMSql selectAllPort];
    setView.downlist = PortArray;
}

- (void)didRequestTestButton:(NSString*)_ip
                     andPort:(NSString*)_port
{

    //测试代码
    
}

- (void)didRequestOkButton:(NSString*)_username
                     andIP:(NSString*)_ip
                   andPort:(NSInteger)_port;
{
    NSLog(@"didRequestOkButton:");
    NSLog(@"username = %@,ip = %@, port = %d",_username,_ip,_port);
    
    [smartITOMSql insert:_username andIp:_ip andPort:_port];
    
    [UIView beginAnimations:@"animation" context:nil];
    [UIView setAnimationDuration:0.5f];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:subView cache:YES];
    [setView removeFromSuperview];
    //loginView = [[DHLoginView alloc] initWithFrame:CGRectMake(0, 0, 300, 370)];
    //loginView.delegate = self;
    [[self subView] addSubview:loginView];
    [UIView commitAnimations];
}


@end
