//
//  TSRequestModel.h
//  MyThree20Study
//
//  Created by huangjianwu on 16/8/24.
//  Copyright © 2016年 huangjianwu. All rights reserved.
//

#import "TTModel.h"
#import "TTURLRequestDelegate.h"
#import "TSHttpRequestBase.h"


@interface TSRequestModel : TTModel<TTURLRequestDelegate>


/**
 * Valid upon completion of the URL request. Represents the timestamp of the completed request.
 */
@property (nonatomic, retain) NSDate*   loadedTime;

/**
 * Valid upon completion of the URL request. Represents the request's cache key.
 */
@property (nonatomic, copy)   NSString* cacheKey;

/**
 * Not used internally, but intended for book-keeping purposes when making requests.
 */
@property (nonatomic) BOOL hasNoMore;


@property (nonatomic, retain) TSHttpRequestBase *loadingRequest;

- (void)startRequestWithGet:(TSHttpRequestBase*)aRequest;

- (void)startRequestWithPost:(TSHttpRequestBase*)aRequest;

/**
 * Resets the model to its original state before any data was loaded.
 */
- (void)reset;
@end
