//
//  TSRequestModel.m
//  MyThree20Study
//
//  Created by huangjianwu on 16/8/24.
//  Copyright © 2016年 huangjianwu. All rights reserved.
//

#import "TSRequestModel.h"
#import "TSHTTPSessionManager.h"

@interface TSRequestModel () {

  NSDate *loadedTime;
  NSString *cacheKey;

  BOOL isLoadingMore;
  BOOL hasNoMore;
}

@end

@implementation TSRequestModel
///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {

    [_loadingRequest cancel];
    
    TT_RELEASE_SAFELY(_loadingRequest);
    TT_RELEASE_SAFELY(loadedTime);
    TT_RELEASE_SAFELY(cacheKey);
    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)reset {
    TT_RELEASE_SAFELY(cacheKey);
    TT_RELEASE_SAFELY(loadedTime);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TTModel


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isLoaded {
    return !!loadedTime;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isLoading {
    return !!_loadingRequest;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isLoadingMore {
    return _loadingRequest;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isOutdated {
    if (nil == cacheKey) {
        return nil != loadedTime;
        
    } else {
        NSDate* loadedTime = self.loadedTime;
        
        if (nil != loadedTime) {
            return -[loadedTime timeIntervalSinceNow] > [TTURLCache sharedCache].invalidationAge;
            
        } else {
            return NO;
        }
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)cancel {
    [_loadingRequest cancel];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)invalidate:(BOOL)erase {
    if (nil != _cacheKey) {
        if (erase) {
            [[TTURLCache sharedCache] removeKey:cacheKey];
            
        } else {
            [[TTURLCache sharedCache] invalidateKey:cacheKey];
        }
        
        TT_RELEASE_SAFELY(cacheKey);
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TTURLRequestDelegate


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestDidStartLoad:(TTURLRequest*)request {
    [_loadingRequest release];
    _loadingRequest = [request retain];
    [self didStartLoad];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestDidFinishLoad:(TTURLRequest*)request {
    if (!self.isLoadingMore) {
        [loadedTime release];
        //loadedTime = [request.timestamp retain];
        //self.cacheKey = request.cacheKey;
    }
    
    TT_RELEASE_SAFELY(_loadingRequest);
    [self didFinishLoad];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)request:(TTURLRequest*)request didFailLoadWithError:(NSError*)error {
    TT_RELEASE_SAFELY(_loadingRequest);
    [self didFailLoadWithError:error];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestDidCancelLoad:(TTURLRequest*)request {
    TT_RELEASE_SAFELY(_loadingRequest);
    [self didCancelLoad];
}

- (void)startRequestWithGet:(TSHttpRequestBase*)aRequest;
{
    NSURLSessionTask *task =[[TSHTTPSessionManager shareMananger] GET:aRequest.interfaceName parameters:aRequest.paramDic progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self requestDidFinishLoad:task];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self request:task didFailLoadWithError:error];
    }];
    aRequest.sesstionTask = task;
}

- (void)startRequestWithPost:(TSHttpRequestBase*)aRequest;
{
    NSURLSessionTask *task = [[TSHTTPSessionManager shareMananger] POST:aRequest.interfaceName parameters:aRequest.paramDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self requestDidFinishLoad:task];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self request:task didFailLoadWithError:error];
        
    }];
    aRequest.sesstionTask = task;
}
@end
