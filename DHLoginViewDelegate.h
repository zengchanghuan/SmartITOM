//
//  DHLoginViewDelegate.h
//  SmartITOM
//
//  Created by Apple002 on 12-11-1.
//  Copyright (c) 2012年 Apple002. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHUser.h"

@protocol DHLoginViewDelegate <NSObject>

- (void)didRequestHistoryBtn;

- (void)didRequestLogin:(NSString*)_name
                andPass:(NSString*)_pass
            andRemenber:(BOOL)_remenber
                andAuto:(BOOL)_autologin
             andHistory:(BOOL)_history;

- (void)didRequestClear:(NSString*)_name
                andPass:(NSString*)_pass;

- (void)didRequestSetButton;

- (void)passValue:(DHUser*)_user;
@end

