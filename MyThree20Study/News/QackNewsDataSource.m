//
//  QackNewsDataSource.m
//  iYnby
//
//  Created by ji yongshan on 13-5-8.
//
//

#import "QackNewsDataSource.h"
#import "QackNewsModel.h"
#import "QackNewsItem.h"
#import "QackTableMessageItemCell.h"

@implementation QackNewsDataSource

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithSearchQuery:(NSString*)searchQuery {
    if (self = [super init]) {
        _searchModel = [[QackNewsModel alloc] initWithSearchQuery:searchQuery];
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(_searchModel);
    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id<TTModel>)model {
    return _searchModel;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)tableViewDidLoadModel:(UITableView*)tableView {
    NSMutableArray* rows = [[NSMutableArray alloc] init];
    
    for (QackNewsItem* item in _searchModel.items) {
        
        //TTTableSubtitleItem* row = [TTTableSubtitleItem itemWithText:item.title subtitle:item.summary imageURL:item.image
          //                              defaultImage:TTIMAGE(@"bundle://Icon-Small-50.png")
          //                                       URL:nil accessoryURL:nil];
        TTTableMessageItem* row =[TTTableMessageItem itemWithTitle:item.title caption:nil text:item.summary timestamp:item.updated imageURL:item.image URL:nil];
        
        [rows addObject:row];
    }
    
    if (!_searchModel.finished) {
        [rows addObject:[TTTableMoreButton itemWithText:TTLocalizedString(@"Next Page", @"下一页")]];
    }
    
    self.items = rows;
    TT_RELEASE_SAFELY(rows);
}

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id)object {
    if ([object isKindOfClass:[TTTableMessageItem class]]) {
        return [QackTableMessageItemCell class];
    }else{
        return [super tableView:tableView cellClassForObject:object];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)titleForLoading:(BOOL)reloading {
    if (reloading) {
        return TTLocalizedString(@"Updating ...", @"更新");
    } else {
        return TTLocalizedString(@"Loading ...", @"加载");
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)titleForEmpty {
    return TTLocalizedString(@"No Found.", @"没有找到满足条件的记录");
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)subtitleForError:(NSError*)error {
    return TTLocalizedString(@"Sorry, there was an error loading the data.", @"");
}


@end
