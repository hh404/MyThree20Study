//
//  QackNewsModel.h
//  iYnby
//
//  Created by ji yongshan on 13-5-8.
//
//

#import "Three20Network.h"

@interface QackNewsModel : TTURLRequestModel{
    NSString* _searchQuery;
    
    NSMutableArray*  _items;
    
    NSUInteger _page;             // page of search request
    NSUInteger _resultsPerPage;   // results per page, once the initial query is made
    // this value shouldn't be changed
    BOOL _finished;
}

@property (nonatomic, copy)     NSString*       searchQuery;
@property (nonatomic, readonly) NSMutableArray* items;
@property (nonatomic, assign)   NSUInteger      resultsPerPage;
@property (nonatomic, readonly) BOOL            finished;

- (id)initWithSearchQuery:(NSString*)searchQuery;


@end
