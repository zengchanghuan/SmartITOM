//
//  StackTabBar.m
//

#import "StackTabBar.h"

#define  KMasterViewRect_landScape CGRectMake(62, 0, 481,  748)
#define  KMasterViewRect_portrait  CGRectMake(62, 0, 481, 1004)
#define  KDetaitViewControllerRect_landScape CGRectMake(1024 - 481 , 0, 481 , 748)  //shadow width = 19;
#define  KDetaitViewControllerRect_portrait  CGRectMake(768 - 481, 0, 481 , 1004)


#define  KThirdViewControllerRect_landScape CGRectMake(0, 0, 1024,  748)
#define  KThirdViewControllerRect_portrait CGRectMake(0, 0, 768, 1004)

#define  KNETINDICATORVIEW_LANSCAPE  CGRectMake(11, 686, 40 , 40)
#define  KNETINDICATORVIEW_PORTRAIT  CGRectMake(11, 686 + 256, 40 , 40)

#define  KMPALERTVIEW_LANSCAPE  CGRectMake((1024 - 350) / 2, (748 - 264) /2.0, 350 , 264)
#define  KMPALERTVIEW_PORTRAIT  CGRectMake((768 - 350) / 2, (1004 - 264) / 2.0, 350 , 264)

#define  kEachItem_Width 38
#define  kEachItem_Height 38

#define kEachItem_ALL_Height 64

#define  kTop_Space 0
#define kLeft_Space ((kEachItem_ALL_Height - kEachItem_Width) / 2.0)


@implementation StackTabBar

@synthesize selectedItem;
@synthesize items;
@synthesize backImage;
@synthesize delegate;
@synthesize arraySelectedImages;
@synthesize arrayNormalImages;
@synthesize tabBarselectedIndex;



-(void)didSelectedIndex:(int)index
{
	tabBarselectedIndex = index;
	[self setNeedsDisplay];
	
	if(imageViewHighLight == nil)
	{
		imageViewHighLight = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_icon_arrow.png"]];
		[self addSubview:imageViewHighLight];
	}
	
	[UIView beginAnimations:@"selecte" context:nil];
	
	imageViewHighLight.frame = CGRectMake(70 - 8, kTop_Space + index  * kEachItem_ALL_Height + (kEachItem_Height - 16 ) / 2.0 , 8, 16);
	[UIView commitAnimations];
	


	if (delegate && [delegate respondsToSelector:@selector(stackTabBar:didSelectItem:)])
	{
		[delegate stackTabBar:self didSelectItem:[items objectAtIndex:index]];
	}
}

-(void)setSelectedIndex:(NSUInteger)t_index
{
	tabBarselectedIndex = t_index;
	
	if (imageViewHighLight == nil)
	{
		imageViewHighLight = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_icon_arrow.png"]];
		[self addSubview:imageViewHighLight];
	}
	
	imageViewHighLight.frame = CGRectMake(70 - 8, kTop_Space + tabBarselectedIndex  * kEachItem_ALL_Height + (kEachItem_Height - 16 ) / 2.0 , 8, 16);

	[self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(context,2.0);
	
	if (items == nil || [items count] == 0)
		return;

    for (int i = 0; i < [items count] ; i++)
    {
		if (i < [arrayNormalImages count])
		{
			if (tabBarselectedIndex == i)
			{
			
			}
			//绘制TabBar上的图片
			UIImage *img = (tabBarselectedIndex == i) ? [arraySelectedImages objectAtIndex:i] :  [arrayNormalImages objectAtIndex:i];
		
			[img drawInRect:CGRectMake(0, kTop_Space + i * kEachItem_ALL_Height , img.size.width, img.size.height)];
		

		
		
			
			// 选中高亮图片
			if (nIndexTouched == i && bSelectedShow == YES)
			{
				//UIImage *imgHighLight = [UIImage imageNamed:@"light_white.png"];
				CGRect rcButton = CGRectMake(kLeft_Space, kTop_Space + i * kEachItem_ALL_Height , kEachItem_Width, kEachItem_Height);
				[[UIImage imageNamed:@"btn_hight_ligthed.png"] drawInRect:CGRectInset(rcButton, (rcButton.size.width - 70) / 2.0, (rcButton.size.height - 70) /2.0)];
				
			}
			
			UITabBarItem *t_item = [items objectAtIndex:i];
			
			//badge
			NSString *badgeValue = t_item.badgeValue;
			
			//badgeValue = @"new";
			if (badgeValue && [badgeValue length] > 0)
			{
				float left_space = 7.0; //文字 与 badge背景图片左右边的留白
				float height = 23;// 23.0; //整个badge背景的高度
				
				CGSize cs = [badgeValue sizeWithFont:[UIFont boldSystemFontOfSize:12]];
				if (cs.width + left_space * 2 < height)
				{
					cs.width = (height - left_space * 2);
				}
				
				//origionx一定要是整数， 否则图片拉伸的话 中间可能会出现黑条
				float origionx = (float)((int)(i*kEachItem_ALL_Height )) + kTop_Space - 10;
				float origiony = rect.size.width - (cs.width + kLeft_Space * 2);
				CGRect rc = CGRectMake(origiony , origionx , (cs.width + kLeft_Space * 2), height);
				[[[UIImage imageNamed:@"tabbar_badge_bg.png"] stretchableImageWithLeftCapWidth:11.5 topCapHeight:11.5] drawInRect:rc];
				[[UIColor whiteColor] set];
				[badgeValue drawInRect:CGRectMake(kLeft_Space + origiony, origionx  + (height - cs.height) / 2.0, cs.width, cs.height)
							  withFont:[UIFont boldSystemFontOfSize:12]
						 lineBreakMode:UILineBreakModeTailTruncation
							 alignment:UITextAlignmentCenter];
			}
		}
	}
}


-(void)clearSelection
{
	nIndexTouched = tabBarselectedIndex;
	bSelectedShow = NO;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint pt = [touch locationInView:self];
	
	if (items == nil || [items count] == 0)
		return;
	
	for (int i = 0; i < [items count] ; i++)
	{
		if (CGRectContainsPoint(CGRectMake(0, kTop_Space + i * kEachItem_ALL_Height, kEachItem_ALL_Height, kEachItem_ALL_Height), pt))
		{
			//[self didSelectedIndex:i];
			nIndexTouched = i;
			bSelectedShow = YES;
			[self setNeedsDisplay];
			return;
		}
	}
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint pt = [touch locationInView:self];
	
	if (nIndexTouched >= 0 && nIndexTouched < [items count])
	{
		for(int i = 0; i < [items count]; i++)
	    {
			CGRect rc = CGRectInset(CGRectMake(0, kTop_Space + i * kEachItem_ALL_Height, kEachItem_ALL_Height, kEachItem_ALL_Height), -kEachItem_ALL_Height, -kEachItem_ALL_Height);
			
			BOOL bOldSelectedShow = bSelectedShow;
			if ( CGRectContainsPoint( rc, pt) )
            {
				bSelectedShow = YES;
			}
			else
            {
				bSelectedShow = NO;
			}
			if ( bOldSelectedShow!=bSelectedShow )
            {
				[self setNeedsDisplay];
			}
		}
	}
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self clearSelection];
	[self setNeedsLayout];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if (nIndexTouched >=0 && nIndexTouched < [items count] && bSelectedShow == YES)
	{
		[self didSelectedIndex:nIndexTouched];
	}
    
	[self clearSelection];
    [self setNeedsDisplay];
}

@end

