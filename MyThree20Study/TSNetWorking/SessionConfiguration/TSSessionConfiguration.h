//
//  TSSessionConfiguration.h
//  TSNetWorking
//
//  Created by huangjianwu on 16/8/24.
//  Copyright © 2016年 huangjianwu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSSessionConfiguration : NSObject

+ (NSURLSessionConfiguration *)defaultConfiguration;
+ (NSURLSessionConfiguration *)backgroundConfiguration;
+ (NSURLSessionConfiguration *)TSConfiguration;

@end
