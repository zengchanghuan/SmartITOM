//
//  smartITOMSqlite.h
//  SmartITOM
//
//  Created by Apple002 on 12-11-7.
//  Copyright (c) 2012年 Ambrose. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "DHUser.h"


@interface SmartITOMSqlite : NSObject
{
    sqlite3 * database;
    
    sqlite3_stmt *statement;
    
    char *errorMsg;
    
    NSString *databaseName;
    
    NSString *databasePath;
   
}


- (id)init;

- (BOOL)openSplite;


- (BOOL)createTable;

- (BOOL)createIpTable;

- (BOOL)insert:(DHUser*)aUser;

- (BOOL)insert:(NSString*)_username andIp:(NSString*)_ip andPort:(NSInteger)_port;

- (BOOL)deleteUser:(DHUser*)aUser;

- (BOOL)selectUserName:(NSString*)_username;

- (NSString*)selectPassword:(NSString*)_username;

- (NSInteger)deleteUser:(NSString*)username andPass:(NSString*)password;

- (NSMutableArray*)selectAllUser;

- (NSMutableArray*)selectAllIp;

- (NSMutableArray*)selectAllPort;

@end
