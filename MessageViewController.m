//
//  MessageViewController.m
//  SmartITOM
//
//  Created by Apple001 on 12-11-6.
//  Copyright (c) 2012年 Ambrose. All rights reserved.
//

#import "MessageViewController.h"
#import "DHMainViewController.h"
#import "DetailController.h"
#import "PullingRefreshTableView.h"
#import "SortViewController.h"
#define FONT_SIZE 20.0f
	//cell.contentView的的宽度
#define CELL_CONTENT_WIDTH 310.0f
	////cell.contentView的的的边距
#define CELL_CONTENT_MARGIN 5.0f

extern DHMainViewController *g_MainViewController;

@interface MessageViewController ()

- (void)updateImageForCellAtIndexPath:(NSIndexPath *)indexPath;
@end

@implementation MessageViewController
@synthesize messageTableView;
@synthesize list;
@synthesize refreshing;
@synthesize page;

@synthesize detailItem;
@synthesize sortButton;
@synthesize sortPopoverController;
@synthesize sortString;


static NSString * modifyUrlForLanguage(NSString *url, NSString *lang) {
    if (!lang) {
        return url;
    }
    
		// We're relying on a particular Wikipedia URL format here. This
		// is a bit fragile!
    NSRange languageCodeRange = NSMakeRange(7, 2);
    if ([[url substringWithRange:languageCodeRange] isEqualToString:lang]) {
        return url;
    } else {
        NSString *newUrl = [url stringByReplacingCharactersInRange:languageCodeRange
                                                        withString:lang];
        return newUrl;
    }
}



#pragma mark
#pragma mark loadView
-(void)loadView
{
	[super loadView];
	list = [[NSMutableArray alloc] init];
	CGRect bounds = self.view.bounds;
	bounds.size.height -= 44.0;
	messageTableView = [[PullingRefreshTableView alloc] initWithFrame:bounds pullingDelegate:self];
	messageTableView.dataSource = self;
	messageTableView.delegate = self;
	[self.view addSubview:messageTableView];
}
#pragma mark -
#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
	if (self.page == 0) {
		[self.messageTableView launchRefreshing];
	}
	if (self.messageTableView == nil)
	{
		CGRect CGRectTableView = CGRectMake(0, 0, 310, self.view.bounds.size.height-44);
		self.messageTableView = [[PullingRefreshTableView alloc] initWithFrame:CGRectTableView style:UITableViewStylePlain];
		messageTableView.dataSource = self;
		messageTableView.delegate = self;
//		messageTableView.backgroundColor = [UIColor grayColor];
			//分割线
		messageTableView.separatorColor = [UIColor colorWithWhite:0.5 alpha:0.5];
		self.view.backgroundColor = [UIColor clearColor];
		[self.view addSubview:messageTableView];
		
	}
	
	messageTableView.backgroundColor = [UIColor clearColor];
	messageTableView.frame = CGRectMake(0, 0, 310, self.view.bounds.size.height);
		//加标题
	UIImageView *titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 310, 44)];
	titleView.userInteractionEnabled = YES;
	titleView.backgroundColor = [UIColor grayColor];
	[self.view addSubview:titleView];

	
	UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 7, 80, 30)];
	titleLabel.font = [UIFont fontWithName:@"Arial" size:22.0];
	titleLabel.text = @"收件箱";
	titleLabel.textColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
	titleLabel.backgroundColor = [UIColor clearColor];
	[titleView addSubview:titleLabel];
	
//	self.navigationItem.titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 310, 44)];
//	self.navigationItem.titleView.userInteractionEnabled = YES;
//	self.navigationItem.titleView.backgroundColor = [UIColor grayColor];
//	self.navigationItem.titleView.
//	self.navigationItem.leftBarButtonItem
	
	sortImageView = [[UIImageView alloc] initWithImage:
					 [UIImage imageNamed:@"listBtn_message_normal.png"] highlightedImage:
					 [UIImage imageNamed:@"listBtn_message_activate.png"]];
	
	sortImageView.userInteractionEnabled = YES;
	sortImageView.backgroundColor = [UIColor clearColor];
	sortImageView.frame = CGRectMake(7, 7, 48, 30);
		//单指单击
	UITapGestureRecognizer *singleTapFingerOne = [[UITapGestureRecognizer alloc]
	initWithTarget:self action:@selector(handleSingleFingerEvent:)];
	singleTapFingerOne.numberOfTapsRequired = 1;
	singleTapFingerOne.numberOfTouchesRequired = 1;
	[sortImageView addGestureRecognizer:singleTapFingerOne];
	singFingerTap = NO;
	
		//单指双击
	UITapGestureRecognizer *singleTapFingerTwo = [[UITapGestureRecognizer alloc]
	initWithTarget:self action:@selector(handleSingleFingerEvent:)];
	singleTapFingerTwo.numberOfTapsRequired = 2;
	singleTapFingerTwo.numberOfTouchesRequired = 1;
	[sortImageView addGestureRecognizer:singleTapFingerTwo];
	
	[titleView addSubview:sortImageView];
	
	editImageView = [[UIImageView alloc] initWithImage:
					 [UIImage imageNamed:@"editBtn_message_normal.png"] highlightedImage:
					 [UIImage imageNamed:@"cancelBtn_message_.png"]];
	editImageView.userInteractionEnabled = YES;
	editImageView.backgroundColor = [UIColor clearColor];
	editImageView.frame = CGRectMake(310-48-7, 7, 48, 30);
	
		//单指单击
	UITapGestureRecognizer *singleTapFingerOneEdit = [[UITapGestureRecognizer alloc]
	initWithTarget:self action:@selector(handleSingleFingerEventEdit:)];
	singleTapFingerOne.numberOfTapsRequired = 1;
	singleTapFingerOne.numberOfTouchesRequired = 1;
	[editImageView addGestureRecognizer:singleTapFingerOneEdit];
	singFingerTap = NO;
	
		//单指双击
	UITapGestureRecognizer *singleTapFingerTwoEdit = [[UITapGestureRecognizer alloc]
	initWithTarget:self action:@selector(handleSingleFingerEventEdit:)];
	singleTapFingerTwo.numberOfTapsRequired = 2;
	singleTapFingerTwo.numberOfTouchesRequired = 1;
	[editImageView addGestureRecognizer:singleTapFingerTwoEdit];
	[titleView addSubview:editImageView];
	
	
	
	editView = [[UIView alloc] initWithFrame:CGRectMake(0, 960, 310, 44)];
	editView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
	UIButton *markedButton = [UIButton buttonWithType:UIButtonTypeCustom];
	markedButton.frame = CGRectMake(7, 7, 92, 30);
	[markedButton setImage:[UIImage imageNamed:@"markBtn_disabled.png"] forState:UIControlStateDisabled];
	[markedButton setImage:[UIImage imageNamed:@"markBtn_normal_message.png"] forState:0];
	[markedButton setImage:[UIImage imageNamed:@"markBtn_selected_message.png"] forState:UIControlStateSelected];
	[markedButton addTarget:self action:@selector(markedButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
	[editView addSubview:markedButton];
	[self.view addSubview:editView];
	
	UIButton *transferButton = [UIButton buttonWithType:UIButtonTypeCustom];
	transferButton.frame = CGRectMake(106, 7, 92, 30);
	[transferButton setImage:[UIImage imageNamed:@"transfer_disabled.png"] forState:UIControlStateDisabled];
	[transferButton setImage:[UIImage imageNamed:@"transfer_normal_message.png"] forState:0];
	[transferButton setImage:[UIImage imageNamed:@"transfer_selected_message.png"] forState:UIControlStateSelected];
	[transferButton addTarget:self action:@selector(transferButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
	[editView addSubview:transferButton];
	
	UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
	deleteButton.frame = CGRectMake(205, 7, 92, 30);
	[deleteButton setImage:[UIImage imageNamed:@"delete_disabled.png"] forState:UIControlStateDisabled];
	[deleteButton setImage:[UIImage imageNamed:@"delete_normal_message.png"] forState:0];
	[deleteButton setImage:[UIImage imageNamed:@"delete_selected_message.png"] forState:UIControlStateSelected];
	[deleteButton addTarget:self action:@selector(deleteButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
	[editView addSubview:deleteButton];
	editView.hidden = YES;


	

}
/*
-(void)touchButton:(UIImageView *)sortImageView
{
	UIBarButtonItem *barButtonItem = (UIBarButtonItem *)sortImageView;
	if (self.sortPopoverController == nil) {
		SortViewController *sortVC = [[SortViewController alloc] init];
		sortVC.messageViewController = self;
		UIPopoverController *poc = [[UIPopoverController alloc] initWithContentViewController:sortVC];
		[poc presentPopoverFromBarButtonItem:barButtonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
		self.sortPopoverController = poc;
	}else{
		if (sortPopoverController !=nil) {
			[sortPopoverController dismissPopoverAnimated:YES];
			self.sortPopoverController = nil;
		}
	}
}
 */
#pragma mark -
#pragma mark UIImageView handleSingleFingerEvent Methods
	//编辑时
-(void)handleSingleFingerEventEdit:(UITapGestureRecognizer *)sender
{
	singFingerTap = !singFingerTap;
	if (sender.numberOfTapsRequired == 1 && singFingerTap == YES){
		NSLog(@"单指单击");
		editImageView.highlighted = YES;
			//编辑模式
		[self setEditing:YES animated:YES];
		sortImageView.hidden = YES;
		editView.hidden = NO;
				
		
		
	}
	else if (sender.numberOfTapsRequired == 1 && singFingerTap == NO){
		editImageView.highlighted = NO;
		//退出编辑模式
		[self setEditing:NO animated:YES];
		sortImageView.hidden = NO;
		editView.hidden = YES;
		
	}
	else if (sender.numberOfTapsRequired == 2){
		NSLog(@"单指双击");
		editImageView.highlighted = NO;
			//编辑模式
		[self setEditing:NO animated:YES];
		sortImageView.hidden = YES;
		editView.hidden = NO;
	}

}
	//排序时
-(void)handleSingleFingerEvent:(UITapGestureRecognizer *)sender
{
	singFingerTap = !singFingerTap;
	if (sender.numberOfTapsRequired == 1 && singFingerTap == YES){
		NSLog(@"单指单击");
		sortImageView.highlighted = YES;
		
	}
	else if (sender.numberOfTapsRequired == 1 && singFingerTap == NO){
		sortImageView.highlighted = NO;
	}
	else if (sender.numberOfTapsRequired == 2){
		NSLog(@"单指双击");
		sortImageView.highlighted = NO;
	}
	
}
#pragma mark -
#pragma mark Button Methods
-(void)markedButtonEvent:(UIButton *)markedButton
{
	NSLog(@"markedButton");
	

	
	
}
-(void)transferButtonEvent:(UIButton *)transferButton
{
	NSLog(@"transferButtonEvent");
}
-(void)deleteButtonEvent:(UIButton *)deleteButton
{
	NSLog(@"deleteButtonEvent");
}
#pragma mark -
#pragma mark Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.list count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
//	static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//	
//	UILabel *label = nil;
//	if (cell == nil){
//		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//		
//		label = [[UILabel alloc] initWithFrame:CGRectZero];
//		label.tag = 1;
//		[cell.contentView addSubview:label];
//	}
//	NSString *text = @"At first glance setting a height dynamically for table view cells seems a little daunting and the first most  ";
//	if (!label) {
//		label = (UILabel *)[cell viewWithTag:1];
//	}
//	label.text = text;
//	
//	return cell;
	
	
	NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	UILabel *label = nil;
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		
		label = [[UILabel alloc] initWithFrame:CGRectZero];
		label.lineBreakMode = UILineBreakModeWordWrap;
		label.minimumFontSize = FONT_SIZE;
		label.numberOfLines = 0;
		[label setFont:[UIFont systemFontOfSize:FONT_SIZE]];
		label.tag = 1;
		label.backgroundColor = [UIColor colorWithRed:216.0/255.0 green:216.0/255.0 blue:216.0/255.0 alpha:1.0];
		[cell.contentView addSubview:label];
	}
	
	NSString *text = @"At first glance setting a height dynamically for table view cells seems a little daunting and the first most  ";
	if (!label) {
		label = (UILabel *)[cell viewWithTag:1];
	}
	label.text = text;
	label.frame = CGRectMake(0, 0, 310, 124);
	UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 310, 124)];
	bgView.backgroundColor = [UIColor colorWithRed:182.0/255.0 green:182.0/255.0 blue:182.0/255.0 alpha:1.0];
	cell.imageView.image = [UIImage imageNamed:@"cell.imageviewn_normal.png"];
	cell.imageView.highlightedImage = [UIImage imageNamed:@"cell.imageviewn_didselected.png"];
	cell.selectedBackgroundView = bgView;
	
//	cell.contentView.backgroundColor = [UIColor greenColor];

	return cell;
	
	
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	/*
	NSString *text = @"At first glance setting a height dynamically for table view cells seems a little daunting and the first most obvious answers that come to mind are not necessarily correct. In this post I will show you how to set your ";
	CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN *2), 500.0f);
	CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
	CGFloat height = MAX(size.height, 44.0f);
	return height + (CELL_CONTENT_MARGIN *2);
	 */
	return 124;
}
	

//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	
//	NSLog(@"VC hash : %d.", [g_MainViewController.view hash]);
//	if ([tableView indexPathForSelectedRow] == indexPath)
//		{
//		if (g_MainViewController.detailController.view.superview)
//			{
//			[g_MainViewController hideDetailController:YES];
//			}
//		[tableView deselectRowAtIndexPath:indexPath animated:YES];
//		return nil;
//		}
//	
//	return indexPath;
//}
#pragma mark -
#pragma mark Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	DetailController *detailVC = [[DetailController alloc] init];
	[g_MainViewController showDetailController:detailVC animated:YES];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete) {
//		[tableView deleteRowsAtIndexPaths:nil withRowAnimation:YES];
		[indexPath indexAtPosition:1];
		
		NSMutableArray *array = [[NSMutableArray alloc] init];
		[array addObject:indexPath];
			//可以向deleteRowsAtIndexPaths方法传递一个索引路径的数组，从而在表格中删除一到多行
		[self.messageTableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationFade];
	}
}

- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
	
}

//新开一个线程去做这件事情。按需加载,即当该用户要浏览该条目时再去加载它的图片

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	[NSThread detachNewThreadSelector:@selector(updateImageForCellAtIndexPath:) toTarget:self withObject:indexPath];
}

- (void)updateImageForCellAtIndexPath:(NSIndexPath *)indexPath
{
	/*
	 …………………………
	 */
}
	//当我们需要长时间的计算时，也要重新开一个线程，去做这个计算以避免程序假死状态
/*
 …………………………
 */
	//从网上down下来一次后就将图片缓存起来，再次显示的时候就不用去下载
/*
 …………………………
 */
#pragma mark -
#pragma mark  rotate
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	return YES;
}

#pragma mark - Your actions
-(void)loadData
{
	self.page++;
	if (self.page++)
		{
		self.page = 1;
		self.refreshing = NO;
		[self.list removeAllObjects];
		}
	for (int i = 0; i < 10; i++) {
		[self.list addObject:@"Row"];
	}
	if (self.page >= 3) {
		[self.messageTableView tableViewDidFinishedLoadingWithMessage:@"All loaded!"];
		self.messageTableView.reachedTheEnd = YES;
	}
	else{
		[self.messageTableView tableViewDidFinishedLoading];
		self.messageTableView.reachedTheEnd = NO;
		[self.messageTableView reloadData];
		
	}
	
}


#pragma mark - PullingRefreshTableViewDelegate
-(void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView
{
	self.refreshing = YES;
	[self performSelector:@selector(loadData) withObject:nil afterDelay:1.0];
}
-(NSDate *)pullingTableViewRefreshingFinishedDate
{
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateFormat = @"yyyy-MM-dd HH:mm";
	NSDate *date = [df dateFromString:@"2012-11-19 10:10"];
	return date;
}

-(void)pullingTableViewDidStartLoading:(PullingRefreshTableView *)tableView
{
	[self performSelector:@selector(loadData) withObject:nil afterDelay:1.0];
}

#pragma mark - Scroll
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	[self.messageTableView tableViewDidScroll:scrollView];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
	
	[self.messageTableView tableViewDidEndDragging:scrollView];
}

@end
