//
//  EquipmentViewController.m
//  SmartITOM
//
//  Created by Apple001 on 12-11-6.
//  Copyright (c) 2012年 Ambrose. All rights reserved.
//

#import "EquipmentViewController.h"

@interface EquipmentViewController ()

@end

@implementation EquipmentViewController
-(id)init
{
	self = [super initWithNibName:nil bundle:nil];
	if (self) {
//		UITabBarItem *equipmentItem = [self tabBarItem];
//		equipmentItem.title = @"设备";
//		UIImage *i = [UIImage imageNamed:@"0003.png"];
//		equipmentItem.image = i;
	}
	return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
    return self ;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor redColor];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
