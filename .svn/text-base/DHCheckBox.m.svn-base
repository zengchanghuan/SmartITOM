//
//  DHCheckBox.m
//  SmartITOM
//
//  Created by Apple002 on 12-10-25.
//  Copyright (c) 2012年 Apple002. All rights reserved.
//

#import "DHCheckBox.h"

@implementation DHCheckBox

//@synthesize num;
@synthesize delegate;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        delegate = nil;
        
        self.contentHorizontalAlignment  = UIControlContentHorizontalAlignmentLeft;
		[self setImage:[UIImage imageNamed:@"com_btn_check.png"] forState:UIControlStateNormal];
		[self addTarget:self action:@selector(checkBoxClicked) forControlEvents:UIControlEventTouchUpInside];
        self.selected = FALSE;

        
    }
    return self;
}

- (void)setTarget:(id)_target action:(SEL)action andTag:(NSInteger)_num
{
    self.tag = _num;
	target = _target;
	fun = action;
}



-(void) checkBoxClicked
{
    NSLog(@"DHCheckBox:checkBoxClicked");

    self.selected = !self.selected;
    if (self.selected) {
        [self setImage:[UIImage imageNamed:@"com_btn_checked.png"] forState:UIControlStateNormal];
    }
    else
    {
        [self setImage:[UIImage imageNamed:@"com_btn_check.png"] forState:UIControlStateNormal];
    }
   
    if (nil != delegate)
    {
        [delegate didRequestCheckBox:self.selected andTag:self.tag];
    }
}



@end
