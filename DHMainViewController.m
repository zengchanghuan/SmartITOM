//
//  DHMainViewController.m
//  SmartITOM
//

#import "DHMainViewController.h"
	// Tag 值为 0
#define KMasterViewRect_portrait0 CGRectMake(70, 0, 706, 1004)
#define KMasterViewRect_landScape0 CGRectMake(70, 0, 962, 748)

	// Tag 值为 1
#define KMasterViewRect_portrait1  CGRectMake(70, 0, 481, 1004)
#define KMasterViewRect_landScape1 CGRectMake(70, 0, 481, 748)
@interface DHMainViewController ()

@end

@implementation DHMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
		{
		
		}
    

    return self;
}

- (void)viewDidLoad
{
  
	[super viewDidLoad];
	[self showTabBarController:0];
	writeEmailImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_write_default.png"] highlightedImage:[UIImage imageNamed:@"btn_write_highlight.png"]];
	writeEmailImageView.userInteractionEnabled = YES;
	writeEmailImageView.backgroundColor = [UIColor clearColor];
	writeEmailImageView.frame = CGRectMake(19, landScape?600:848, 32, 32);
	[self.tabBar addSubview:writeEmailImageView];
	UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(writeEmailSingleTap)];
	[writeEmailImageView addGestureRecognizer:singleTap1];
	writeEmailImageView.hidden = YES;
	
	searchImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_search_default.png"] highlightedImage:[UIImage imageNamed:@"btn_search_highlight.png"]];
	searchImageView.userInteractionEnabled = YES;
	searchImageView.backgroundColor = [UIColor clearColor];
	searchImageView.frame = CGRectMake(19,landScape?650:898, 32, 32);
	[self.tabBar addSubview:searchImageView];
	UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(searchSingleTap)];
	[searchImageView addGestureRecognizer:singleTap2];
	
	
	settingImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_setting_default.png"] highlightedImage:[UIImage imageNamed:@"btn_setting_highlight.png"]];
	settingImageView.userInteractionEnabled = YES;
	settingImageView.backgroundColor = [UIColor clearColor];
	settingImageView.frame = CGRectMake(19, landScape?700:948, 32, 32);
	[self.tabBar addSubview:settingImageView];
	UITapGestureRecognizer *singleTap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(settingSingleTap)];
	[settingImageView addGestureRecognizer:singleTap3];

	
	  
	
}
-(void)showTabBarController:(int)type
{
	HomeViewController *homeVC = [[HomeViewController alloc] init];
	MessageViewController *messageVC = [[MessageViewController alloc] init];
	EquipmentViewController *equipVC = [[EquipmentViewController alloc] init];
	AlarmViewController *alarmVC = [[AlarmViewController alloc] init];
	
	NSArray *arrayViewControllers = [NSArray arrayWithObjects:homeVC,messageVC,equipVC,alarmVC, nil];
	self.viewControllers = arrayViewControllers;
	
	
	self.tabBar.arrayNormalImages = [NSArray arrayWithObjects:
									 [UIImage imageNamed:@"tabbar_home_default.png"],
									 [UIImage imageNamed:@"tabbar_message_default.png"],
									 [UIImage imageNamed:@"tabbar_equipment_default.png"],
									 [UIImage imageNamed:@"tabbar_alarm_default.png"], nil];
	
	self.tabBar.arraySelectedImages = [NSArray arrayWithObjects:
									   [UIImage imageNamed:@"tabbar_home_highlight.png"],
									   [UIImage imageNamed:@"tabbar_message_highlight.png"],
									   [UIImage imageNamed:@"tabbar_equipment_highlight.png"],
									   [UIImage imageNamed:@"tabbar_alarm_highlight.png"], nil];
	UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];

	[self.view addSubview:backgroundView];
    [self setSelectedIndex:0];
}

#pragma mark -UIImageView Methods
-(void)writeEmailSingleTap
{
	writeEmailImageView.highlighted = YES;
	searchImageView.highlighted = NO;
	settingImageView.highlighted = NO;
}
-(void)searchSingleTap
{
	searchImageView.highlighted = YES;
	writeEmailImageView.highlighted = NO;
	settingImageView.highlighted = NO;
}
-(void)settingSingleTap
{
	settingImageView.highlighted = YES;
	writeEmailImageView.highlighted = NO;
	searchImageView.highlighted = NO;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientations
{
    
    if (toInterfaceOrientations == UIInterfaceOrientationLandscapeLeft||toInterfaceOrientations == UIInterfaceOrientationLandscapeRight)
	{
		landScape = false;
		searchImageView.frame = CGRectMake(19, 650, 32, 32);
		writeEmailImageView.frame = CGRectMake(19, 600, 32, 32);
		settingImageView.frame = CGRectMake(19, 700, 32, 32);
	
		
	}
	if (toInterfaceOrientations == UIInterfaceOrientationPortrait ||
		toInterfaceOrientations == UIInterfaceOrientationPortraitUpsideDown)
	{
		landScape = true;
		searchImageView.frame = CGRectMake(19, 898, 32, 32);
		writeEmailImageView.frame = CGRectMake(19, 848, 32, 32);
		settingImageView.frame = CGRectMake(19, 948, 32, 32);
	}
	 
    return TRUE;
}


- (void)viewDidUnload {
    [self setMainView:nil];
    [super viewDidUnload];
}
@end
