//
//  DetailController.m
//  SmartITOM
//
//  Created by Apple001 on 12-11-14.
//  Copyright (c) 2012年 Ambrose. All rights reserved.
//

#import "DetailController.h"

@interface DetailController ()

@end

@implementation DetailController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	self.view.backgroundColor = [UIColor grayColor];
	UIButton *thirdVCButton = [UIButton buttonWithType:UIButtonTypeCustom];
	thirdVCButton.backgroundColor = [UIColor blackColor];
	[thirdVCButton setTitle:@"下级视图" forState:0];
	
	thirdVCButton.frame = CGRectMake(120, 120, 120, 120);
	[thirdVCButton addTarget:self action:@selector(thirdVC) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:thirdVCButton];
}
#pragma mark -
#pragma mark - thirdVC
-(void)thirdVC
{
	ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
	
	[self.navigationController pushViewController:thirdVC animated:YES];
}


@end
