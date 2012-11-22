//
//  DHCheckBoxDelegate.h
//  SmartITOM
//
//  Created by Apple002 on 12-11-1.
//  Copyright (c) 2012年 Apple002. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol DHCheckBoxDelegate <NSObject>

- (void)didRequestCheckBox:(BOOL)_selected andTag:(NSInteger)_num;


@end

