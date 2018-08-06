//
//  TSSessionConfiguration.m
//  TSNetWorking
//
//  Created by huangjianwu on 16/8/24.
//  Copyright © 2016年 huangjianwu. All rights reserved.
//

#import "TSSessionConfiguration.h"

#define SESSION_DOWNLOAD_ID  @""

@implementation TSSessionConfiguration

+ (NSURLSessionConfiguration *)defaultConfiguration
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    [configuration setAllowsCellularAccess:YES];
    return configuration;
}

+ (NSURLSessionConfiguration *)backgroundConfiguration
{
    return [NSURLSessionConfiguration backgroundSessionConfiguration:SESSION_DOWNLOAD_ID];
}

+ (NSURLSessionConfiguration *)TSConfiguration;
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    configuration.timeoutIntervalForRequest = 20;
    return configuration;
}

@end
