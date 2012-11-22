//
//  UIBarButtonItem+Stack.m
//

#import "UIBarButtonItem+Stack.h"

@implementation UIBarButtonItem (Stack)

+(id)createBarButtonItemWithTitle:(NSString *)title  type:(NavBarType)barType target:(id)target action:(SEL)selector
{
	UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 4, 60, 30)];
	[btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	[btn setTitle:title forState:UIControlStateNormal];
	btn.titleLabel.font = [UIFont boldSystemFontOfSize:13];
	btn.titleLabel.backgroundColor =[UIColor clearColor];
	btn.showsTouchWhenHighlighted = YES;
	//	btn.titleLabel.frame = CGRectMake(20, 5, 5, 40);
	
    CGSize cs = [title sizeWithFont:[UIFont boldSystemFontOfSize:13]];
	
	float width = 0;
	
	if(barType == KNAV_BARBUTTONITEM_TYPE_LEFT_ARROW)
	{
		//[btn setBackgroundImage:[[UIImage imageNamed:@"nav_backButton_icon.png"] stretchableImageWithLeftCapWidth:30 topCapHeight:0] forState:UIControlStateNormal];
		[btn setBackgroundImage:[[UIImage imageNamed:@"nav_backButton_icon.png"] stretchableImageWithLeftCapWidth:30 topCapHeight:0] forState:UIControlStateNormal];
		
		width = cs.width > 30 ? (20 + cs.width) : 50;
		
		btn.frame = CGRectMake(0, 5.0, width, 34);
		btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
	}
	else
	{
		[btn setBackgroundImage:[[UIImage imageNamed:@"nav_roundrect_bg.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:10] forState:UIControlStateNormal];
		//[btn setBackgroundImage:[[UIImage imageNamed:@"options_close.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:10] forState:UIControlStateNormal];
		
		width = cs.width > 40 ?  cs.width + 20 : 50;
		btn.frame = CGRectMake(0, 5.0, width, 34);
	}
	
	//btn.titleLabel.textColor = [UIColor  colorWithRed:0.882 green:0.929 blue:0.051 alpha:1.0];
	
	[btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	//btn.titleLabel.shadowColor = [UIColor blackColor];
	//btn.titleLabel.shadowOffset = CGSizeMake(0.2,  0.2);
	btn.titleLabel.textAlignment = UITextAlignmentCenter;
	//[btn sizeToFit];
	
	UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
	
	return backItem ;
}

+(id)createBarButtonItemWithImage:(UIImage *)img  type:(NavBarType)barType target:(id)target action:(SEL)selector
{
	UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 34)];
	[btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
	[btn setBackgroundImage:[[UIImage imageNamed:@"nav_roundrect_bg.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:10] forState:UIControlStateNormal];
	
	UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake((btn.frame.size.width - img.size.width) / 2.0 , (btn.frame.size.height - img.size.height) / 2.0 , img.size.width, img.size.height)];
	iv.image  = img;
	[btn addSubview:iv];
	iv.tag = 400;
	iv.center = CGPointMake(20, 17);
	
	UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
	
	return backItem ;
}

@end
