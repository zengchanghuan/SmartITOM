//
//  DHCheckBox.h
//  SmartITOM
//
//  Created by Apple002 on 12-10-25.
//  Copyright (c) 2012年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DHCheckBoxDelegate.h"



@interface DHCheckBox : UIButton
{
    //NSInteger num;
    id target;
    SEL fun;
    id <DHCheckBoxDelegate> delegate;
}

@property (strong, nonatomic) id <DHCheckBoxDelegate> delegate;
//@property (nonatomic, assign) NSInteger num;

- (void) checkBoxClicked;
- (void)setTarget:(id)_target action:(SEL)action andTag:(NSInteger)_num;
@end
