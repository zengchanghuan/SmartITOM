//
//  DHUser.h
//  SmartITOM
//
//  Created by Apple002 on 12-11-8.
//  Copyright (c) 2012年 Ambrose. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DHUser : NSObject

@property (nonatomic, strong)NSString *userName;
@property (nonatomic, strong)NSString *password;
@property (nonatomic, assign)BOOL remenberable;
@property (nonatomic, assign)bool Auto;
@property (nonatomic, strong)NSString *ip;
@property (nonatomic, assign)NSInteger port;

- (id)initWithUserName:(NSString*)_name
                 andIp: (NSString*)_ip
               andPort:(NSInteger)_port;

- (id)initWithUserName:(NSString*)_name
               andPass:(NSString*)_pass
         andIsRemenber:(BOOL)_remenber
             andIsAuto:(BOOL)_auto;

- (NSString*)description;

@end
