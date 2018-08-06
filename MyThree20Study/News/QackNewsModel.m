#import "QackNewsModel.h"
#import "QackNewsItem.h"
#import "QackConfig.h"
#import "extThree20JSON.h"

@implementation QackNewsModel

@synthesize searchQuery = _searchQuery;
@synthesize items      = _items;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithSearchQuery:(NSString*)searchQuery {
    if (self = [super init]) {
        self.searchQuery = searchQuery;
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void) dealloc {
    TT_RELEASE_SAFELY(_searchQuery);
    TT_RELEASE_SAFELY(_items);
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more {
    if (!self.isLoading ) {//&& TTIsStringWithAnyText(_searchQuery)
        NSString* url = [QackConfig urlForNewsList:_searchQuery];
        
        TTURLRequest* request = [TTURLRequest
                                 requestWithURL: url
                                 delegate: self];
        
        request.cachePolicy = cachePolicy | TTURLRequestCachePolicyNoCache;
        //request.cacheExpirationAge = TT_CACHE_EXPIRATION_AGE_NEVER;
        
        TTURLJSONResponse* response = [[TTURLJSONResponse alloc] init];
        request.response = response;
        TT_RELEASE_SAFELY(response);
        
        [request send];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestDidFinishLoad:(TTURLRequest*)request {
    TTURLJSONResponse* response = request.response;
    /*TTDASSERT([response.rootObject isKindOfClass:[NSDictionary class]]);
    
    NSDictionary* jsonObj = response.rootObject;
    TTDASSERT([[jsonObj objectForKey:@"data"] isKindOfClass:[NSArray class]]);
    
    NSArray* entries = [jsonObj objectForKey:@"data"];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterFullStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    TT_RELEASE_SAFELY(_items);
    NSMutableArray* items = [[NSMutableArray alloc] initWithCapacity:[entries count]];
    
    for (NSDictionary* entry in entries) {
        QackNewsItem* item = [[QackNewsItem alloc] init];
        
        item.ID = [entry objectForKey:@"id"];
        item.title = [entry objectForKey:@"title"];
        item.updated = [dateFormatter dateFromString:[entry objectForKey:@"updated"]];
        item.summary = [entry objectForKey:@"summary"];
        item.image = [QackConfig url:[entry objectForKey:@"image"]];
        item.commentCount = [entry objectForKey:@"commentCount"];
        item.content = [entry objectForKey:@"content"];
        
        [items addObject:item];
        
        TT_RELEASE_SAFELY(item);
    }
    _items = items;
    
    TT_RELEASE_SAFELY(dateFormatter);*/
    
    [super requestDidFinishLoad:request];
}


@end
