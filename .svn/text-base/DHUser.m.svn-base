//
//  DHUser.m
//  SmartITOM
//
//  Created by Apple002 on 12-11-8.
//  Copyright (c) 2012年 Ambrose. All rights reserved.
//

#import "DHUser.h"

@implementation DHUser

@synthesize userName;
@synthesize password;
@synthesize remenberable;
@synthesize Auto;
@synthesize ip;
@synthesize port;

- (id)init
{
    if ([super init])
    {
        userName = [[NSString alloc]init];
        password = [[NSString alloc]init];
        remenberable = false;
        Auto = false;
        ip = [[NSString alloc]init];
        port = 8080;
    }

    return self;
    
}

- (id)initWithUserName:(NSString*)_name
                 andIp: (NSString*)_ip
               andPort:(NSInteger)_port
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    if (!userName)
    {
        userName = [[NSString alloc]init];
        userName = _name;
    }
    
    if (!ip)
    {
        ip = [[NSString alloc]init];
        ip = _ip;
    }
    port = _port;
    
    return self;
}

- (id)initWithUserName:(NSString*)_name
               andPass:(NSString*)_pass
         andIsRemenber:(BOOL)_remenber
             andIsAuto:(BOOL)_auto

{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    if (!userName)
    {
        userName = [[NSString alloc]init];
        userName = _name;
    }
    if (!password)
    {
        password = [[NSString alloc]init];
        password = _pass;
    }
    remenberable = _remenber;
    Auto = _auto;

    
    return self;
}
- (NSString *)description

{
    return [NSString stringWithFormat:@"username = %@, password = %@, isremenber = %d, isAuto = %d,ip = %@,port = %d",self.userName,self.password,self.remenberable,self.Auto,self.ip,self.port];
}


@end
