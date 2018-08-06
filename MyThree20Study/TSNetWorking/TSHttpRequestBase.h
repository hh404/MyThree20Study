//
//  TSHttpRequestBase.h
//  TSNetWorking
//
//  Created by huangjianwu on 16/8/24.
//  Copyright © 2016年 huangjianwu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSHttpRequestBase : NSObject

@property(nonatomic, strong, readonly) NSMutableDictionary *paramDic;

@property(nonatomic, strong) NSURLSessionTask *sesstionTask;

@property (nonatomic, assign) id<TTURLRequestDelegate> delegate;

- (NSString *)interfaceName;

- (void)cancel;

@end
