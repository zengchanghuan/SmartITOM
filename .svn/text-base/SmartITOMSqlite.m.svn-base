//
//  smartITOMSqlite.m
//  SmartITOM
//
//  Created by Apple002 on 12-11-7.
//  Copyright (c) 2012年 Ambrose. All rights reserved.
//

#import "smartITOMSqlite.h"

#define DATABASE_NAME @"SmartITOM.rdb"

@implementation SmartITOMSqlite

- (id)init
{
    self = [super init];
    if (self)
    {
        databaseName = DATABASE_NAME;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDirectory = [paths objectAtIndex:0];
        //NSString *docDir = [paths objectAtIndex:0];
        //NSLog(@"DOCUMENT = %@",documentDirectory);
        databasePath = [documentDirectory stringByAppendingPathComponent:databaseName];
    }
    return self;
}


//打开数据库
- (BOOL)openSplite
{
    BOOL successe = FALSE;
   
    successe = [[NSFileManager defaultManager] fileExistsAtPath:databasePath];
    if (!successe)
    {
        NSString *dataPath = [[NSBundle mainBundle]pathForResource:@"SmartITOM" ofType:@"rdb"];
        //NSLog(@"%@",dataPath);
        NSLog(@"%@",databasePath);
        [[NSFileManager defaultManager] copyItemAtPath:dataPath toPath:databasePath error:nil];
    }
    
    if (sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK )
    {
        NSLog(@"open database successed");
        successe = TRUE;
    }
    else
    {
        NSLog(@"open database failed: %s",errorMsg);
        
    }
    return successe;
  
}

//建表
- (BOOL)createTable
{
    BOOL succesess = FALSE;
    if ([self openSplite])
    {
        NSString  *creatSQL = [[NSString alloc ]initWithFormat:@"create table if not exists smartITOM_USER (username nsstring primary key not null unique,password nsstring  ,isremenber bool,isAuto bool);"];
        
        if (sqlite3_exec(database, [creatSQL UTF8String], NULL, NULL, &errorMsg) == SQLITE_OK )
        {
            NSLog(@"create table successed");
            succesess = TRUE;
        }
        else
        {
            NSLog(@"create table failed:%s",errorMsg);
            sqlite3_free(errorMsg);
           
        }
        
    }
    sqlite3_close(database);
    return succesess;
}

//建表ip port 
- (BOOL)createIpTable
{
    BOOL success = FALSE;
    if ([self openSplite])
    {
        NSString *creatIpSQL = [[NSString alloc]initWithFormat:@"create table if not exists smartITOM_IPPort (id integer primary key asc not null unique ,username nsstring,ip nsstring,port nsinteger);"];
        if (sqlite3_exec(database, [creatIpSQL UTF8String], NULL, NULL, &errorMsg) == SQLITE_OK)
        {
            NSLog(@"creat ip table successed");
            success = TRUE;
        }
        else
        {
            NSLog(@"create ip table failed :%s",errorMsg);
            sqlite3_free(errorMsg);
        }
    }
    sqlite3_close(database);
    return success;
}

//插入一条数据
- (BOOL)insert:(DHUser*)aUser
{
    BOOL successe = FALSE;
    if ([self openSplite])
    {


        NSString *insertSQL = [NSString stringWithFormat:@"insert into smartITOM_USER (username,password,isremenber,isAuto) values (\"%@\",\"%@\",\"%d\",\"%d\")",aUser.userName,aUser.password,aUser.remenberable,aUser.Auto];
 
        if (sqlite3_exec(database, [insertSQL UTF8String], NULL, NULL, &errorMsg) == SQLITE_OK)
        {
            NSLog(@"insert data successed");
            successe = TRUE;
        }
        else
        {
            NSLog(@"insert data failed :%s",errorMsg);
            sqlite3_free(errorMsg);
        }
        
    }
    sqlite3_close(database);
    return successe;
    
}


//插入ip 端口号，
- (BOOL)insert:(NSString*)_username andIp:(NSString*)_ip andPort:(NSInteger)_port
{
    BOOL successe = FALSE;
    if ([self openSplite])
    {
        NSString *insertIpSQL = [[NSString alloc]initWithFormat:@"insert into smartITOM_IPPort (username,ip,port) values (\"%@\",\"%@\",\"%d\")",_username,_ip,_port ];
        if (sqlite3_exec(database, [insertIpSQL UTF8String], NULL, NULL, &errorMsg) == SQLITE_OK)
        {
            NSLog(@"insert data successed");
            successe = true;
            
        }
        else
        {
            NSLog(@"insert data failed :%s",errorMsg);
            sqlite3_free(errorMsg);
        }
    }
    sqlite3_close(database);
    return successe;
}

//删除一条数据
- (BOOL)deleteUser:(DHUser*)aUser
{
    BOOL successe = FALSE;
    if ([self openSplite])
    {
        NSString *deleteSQL = [[NSString alloc]initWithFormat:@"delete from smartITOM_USER where username = \"%@\";",aUser.userName];
        if (sqlite3_exec(database, [deleteSQL UTF8String], NULL, NULL, &errorMsg) == SQLITE_OK)
        {
            NSLog(@"delete a data succese");
            successe  = TRUE;
        }
        else
        {
            NSLog(@"delete a data failed : %s",errorMsg);
            sqlite3_free(errorMsg);
        }
    }
    sqlite3_close(database);
    return successe;
    
}

//输入用户名密码，删除
- (NSInteger)deleteUser:(NSString*)username andPass:(NSString*)password
{
    
    NSInteger num = 0;
    //num = 1 删除成功
    //num = 2 密码为空
    //num = 3 密码错误
    if (nil != username)
    { 
        //用户名不为空
        if ([self selectUserName:username])
        {
            //用户名存在
        
            NSString *pass = [self selectPassword:username];
            if (nil != pass)
            {
                NSLog(@"-----%@",password);
                //密码不为空
                if ([password isEqualToString:pass])
                {
                    //密码正确
                    if ([self openSplite])
                    {
                        NSString * deleteSQL = [[NSString alloc]initWithFormat:@"delete from smartITOM_USER where username = \"%@\";",username];
                        if (sqlite3_exec(database, [deleteSQL UTF8String], NULL, NULL, &errorMsg) == SQLITE_OK)
                        {
                            NSLog(@"delete successed");
                            num = 1;
                        }
                        else
                        {
                            NSLog(@"delete failed: %s",errorMsg);
                            sqlite3_free(errorMsg);
                        }
                        
                    }
                    sqlite3_close(database);
                
                }
                else
                {
                    NSLog(@"密码错误！！");
                    num = 3;
                }
            }
            else
            {
                NSLog(@"密码为空！！");
                num = 2;
            }
        }
        else
        {
            NSLog(@"用户名不存在");
            
        }
    }
    else
    {
        NSLog(@"用户名为空！");
        
    }
    
    return num;
}

//查询用户名是否存在
- (BOOL)selectUserName:(NSString*)_username
{
    NSInteger row = 0;
    if ([self openSplite])
    {
        NSString *selectSQL = [[NSString alloc]initWithFormat:@"select count(*) from smartITOM_USER where username = \'%@\'",_username ];
        if (sqlite3_prepare_v2(database, [selectSQL UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
           // NSInteger count  = sqlite3_exec(database, [selectSQL UTF8String], NULL, NULL, &errorMsg);
            
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSInteger count = sqlite3_column_int(statement, 0);
                NSLog(@"count = %d",count);
                if (count > 0)
                {
                    row = 1;
                }
            }
            

        }
        else
        {
            NSLog(@"sqlite3_pre_v2 failed");
        }
    }
    sqlite3_close(database);
    return (1 == row);
}

//根据用户名查询密码
- (NSString*)selectPassword:(NSString*)_username
{
    //NSLog(@"-username = %@",_username);
    NSString* passwd = [[NSString alloc]init];
    if ([self openSplite])
    {
        NSString *selectPass = [[NSString alloc]initWithFormat:@"select password from smartITOM_USER where username = \'%@\'",_username ];
        if (sqlite3_prepare_v2(database, [selectPass UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                
                NSString *pass = [NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 0)];
               

                NSLog(@"pass = %@",pass);
                passwd = pass;
            }
        }
        else
        {
            NSLog(@"sqlite3_pre_v2 failed");
        }
    }
    sqlite3_close(database);
    return passwd;
}


//查询数据
- (NSMutableArray*)selectAllUser
{
    NSMutableArray *users = [[NSMutableArray alloc]init];
    if ([self openSplite])
    {
        NSString *selectSQL = [[NSString alloc]initWithFormat:@"select * from smartITOM_USER"];
        
        if (sqlite3_prepare_v2(database, [selectSQL UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString * username = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 0)];
                NSString *pass = [NSString stringWithUTF8String:(char*)sqlite3_column_text(statement, 1)];
                BOOL isremenber = (sqlite3_column_int(statement, 2) == 1);
                BOOL isauto = (sqlite3_column_int(statement, 3) == 1);
                
                DHUser *aUser = [[DHUser alloc]initWithUserName:username andPass:pass andIsRemenber:isremenber andIsAuto:isauto];
                [users addObject:aUser];
            }
        }
        else
        {
            NSLog(@"sqlite3_prepare_v2 failed");
        }
    }
    sqlite3_close(database);
    return users;
    
}


//，查询ip
- (NSMutableArray*)selectAllIp
{
    NSMutableArray *users = [[NSMutableArray alloc]init];
    if ([self openSplite])
    {
        NSString *selectSQL = [[NSString alloc]initWithFormat:@"select  distinct ip from smartITOM_IPPort;"];
        if (sqlite3_prepare_v2(database, [selectSQL UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                //NSString *userName = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 1) ];
                NSString *ip = [NSString stringWithUTF8String:(char *) sqlite3_column_text(statement, 0)];
                //NSInteger port = sqlite3_column_int(statement, 3);
                
                //DHUser *auser = [[DHUser alloc]initWithUserName:userName andIp:ip andPort:port];
                [users addObject:ip];
                
            }
        }
        else
        {
            NSLog(@"sqlite3_prepare_v2 failed");
        }

    }
    sqlite3_close(database);
    return users;
}

//查询端口
- (NSMutableArray*)selectAllPort
{
    NSMutableArray *users = [[NSMutableArray alloc]init];
    if ([self openSplite])
    {
        NSString *selectSQL = [[NSString alloc]initWithFormat:@"select  distinct port from smartITOM_IPPort;"];
        if (sqlite3_prepare_v2(database, [selectSQL UTF8String], -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                //NSString *userName = [NSString stringWithUTF8String:(char*) sqlite3_column_text(statement, 1) ];
                NSString *port = [NSString stringWithUTF8String:(char *) sqlite3_column_text(statement, 0)];
                //NSInteger port = sqlite3_column_int(statement, 3);
                
                //DHUser *auser = [[DHUser alloc]initWithUserName:userName andIp:ip andPort:port];
                [users addObject:port];
                
            }
        }
        else
        {
            NSLog(@"sqlite3_prepare_v2 failed");
        }
        
    }
    sqlite3_close(database);
    return users;
}

@end
