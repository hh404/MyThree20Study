//
//  TSHTTPSessionManager.m
//  TSNetWorking
//
//  Created by huangjianwu on 16/8/24.
//  Copyright © 2016年 huangjianwu. All rights reserved.
//

#import "TSHTTPSessionManager.h"
#import "TSSessionConfiguration.h"

static TSHTTPSessionManager *gTSHTTPSessionManager= nil;

@implementation TSHTTPSessionManager

+ (instancetype)shareMananger;
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gTSHTTPSessionManager = [[TSHTTPSessionManager alloc] initWithSessionConfiguration:[TSSessionConfiguration TSConfiguration]];
    });
    return gTSHTTPSessionManager;
}



@end
