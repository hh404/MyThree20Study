//
//  TSTestModel.m
//  MyThree20Study
//
//  Created by huangjianwu on 16/8/25.
//  Copyright © 2016年 huangjianwu. All rights reserved.
//

#import "TSTestModel.h"
#import "TSHttpRequestBase.h"

@implementation TSTestModel

- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more
{
    
    self.loadingRequest = [[TSHttpRequestBase alloc] init];
    self.loadingRequest.delegate = self;
    [self startRequestWithGet:self.loadingRequest];
}

- (void)requestDidStartLoad:(TTURLRequest *)request
{
    [super requestDidStartLoad:request];
}

- (void)requestDidFinishLoad:(TTURLRequest *)request
{
    [super requestDidFinishLoad:request];
}

@end
