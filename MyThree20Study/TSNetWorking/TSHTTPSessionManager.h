//
//  TSHTTPSessionManager.h
//  TSNetWorking
//
//  Created by huangjianwu on 16/8/24.
//  Copyright © 2016年 huangjianwu. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface TSHTTPSessionManager : AFHTTPSessionManager

+ (instancetype)shareMananger;



@end
