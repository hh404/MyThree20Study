#import "QackConfig.h"

static NSString* DEMSY_CFG_SERVER = @"http://www.yunnanbaiyao.com.cn";
//static NSString* DEMSY_CFG_SERVER = @"http://192.168.1.10:9090";
static NSString* DEMSY_CFG_URL_NEWS_LIST = @"/app/jsonWebInfoList";


@implementation QackConfig


+ (NSString *)url:(NSString *)relativePath searchQuery:(NSString *)searchQuery{
    
    if(relativePath.length == 0){
        return nil;
    }
    
    if([relativePath characterAtIndex:0] == '/'){
        return [NSString stringWithFormat:@"%@%@?%@", DEMSY_CFG_SERVER, relativePath, searchQuery];
    }
    
    return relativePath;
}


+ (NSString *)url:(NSString *)relativePath{
    
    if(relativePath.length == 0){
        return nil;
    }
    
    if([relativePath characterAtIndex:0] == '/'){
        return [NSString stringWithFormat:@"%@%@", DEMSY_CFG_SERVER, relativePath];
    }
    
    return relativePath;
}

+ (NSString *) urlForNewsList: (NSString *)searchQuery{
    return [QackConfig url:DEMSY_CFG_URL_NEWS_LIST searchQuery:searchQuery];
}

@end
