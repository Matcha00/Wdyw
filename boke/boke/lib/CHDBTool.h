//
//  CHDBTool.h
//  Testarray
//
//  Created by 陈欢 on 2018/5/19.
//  Copyright © 2018年 陈欢. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface CHDBTool : NSObject

@property (nonatomic, retain, readonly) FMDatabaseQueue *dbQueue;


+ (CHDBTool *)shareInstance;

+ (NSString *)dbPath;

//- (BOOL)ch_changDBwithDirectoryName:(NSString *)directoryName;
@end
