//
//  HomeViewController.m
//  SmartITOM
//
//  Created by Apple001 on 12-11-7.
//  Copyright (c) 2012年 Ambrose. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
-(id)init
{
	self = [super init];
	if (self)
    {
        self.view.backgroundColor = [UIColor redColor];
        NSLog(@"HomeViewController.frame.height=%f",self.view.frame.size.height);
    }
	return self;
}
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
//	self.view.backgroundColor = [UIColor redColor];
//	self.navigationItem.title = @"首页";
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -Rotate
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	return YES;
	
}
@end
