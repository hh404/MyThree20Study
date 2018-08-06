//
//  TSHttpRequestBase.m
//  TSNetWorking
//
//  Created by huangjianwu on 16/8/24.
//  Copyright © 2016年 huangjianwu. All rights reserved.
//

#import "TSHttpRequestBase.h"
#import "AFNetworking.h"

@interface TSHttpRequestBase()


@end

@implementation TSHttpRequestBase

- (instancetype)init
{
    self = [super init];
    if (self) {
        _paramDic = [NSMutableDictionary dictionary];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkRequestDidStart:) name:AFNetworkingTaskDidResumeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkRequestDidFinish:) name:AFNetworkingTaskDidSuspendNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkRequestDidFinish:) name:AFNetworkingTaskDidCompleteNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSString*)interfaceName;
{
    return @"http://httpbin.org/get";
}

- (void)networkRequestDidStart:(NSNotification*)aNo
{
    NSURLSessionTask *task = aNo.object;
    //delegate通知
    if([task isEqual:_sesstionTask])
    {
        [self.delegate requestDidStartLoad:task];
    }
}

- (void)networkRequestDidFinish:(NSNotification*)aNo
{
    
}

- (void)cancel
{
    [_sesstionTask cancel];
}


@end
