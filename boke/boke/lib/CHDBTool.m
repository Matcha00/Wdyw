//
//  CHDBTool.m
//  Testarray
//
//  Created by 陈欢 on 2018/5/19.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import "CHDBTool.h"
#import <objc/runtime.h>

@interface CHDBTool()

@property (nonatomic, retain) FMDatabaseQueue *dbQueue;
@end

@implementation CHDBTool

static CHDBTool *instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL]init];
    });
    
    return instance;
}

+ (NSString *)dbPathWithDirectoryName:(NSString *)directoryName
{
    NSString *docsdir = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
    
    NSFileManager *filemanage = [NSFileManager defaultManager];
    
    if (directoryName == nil || directoryName.length == 0) {
        docsdir = [docsdir stringByAppendingString:@"CHDB"];
    } else {
        docsdir = [docsdir stringByAppendingString:directoryName];
    }
    
    BOOL isDir;
    BOOL exit = [filemanage fileExistsAtPath:docsdir isDirectory:isDir];
    if (!exit || !isDir) {
        [filemanage createDirectoryAtPath:docsdir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *dbpath = [docsdir stringByAppendingString:@"chdb.sqlite"];
    
    return dbpath;
}

+ (NSString *)dbPath {
    return [self dbPathWithDirectoryName:nil];
}
- (FMDatabaseQueue *)dbQueue
{
    if (!_dbQueue) {
        _dbQueue = [[FMDatabaseQueue alloc]initWithPath:[self.class dbPath]];
    }
    
    return _dbQueue;
}


+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [CHDBTool shareInstance];
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return [CHDBTool shareInstance];
}












@end
