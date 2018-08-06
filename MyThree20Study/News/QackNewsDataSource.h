//
//  QackNewsDataSource.h
//  iYnby
//
//  Created by ji yongshan on 13-5-8.
//
//

#import "Three20UI.h"
#import "QackNewsModel.h"

@interface QackNewsDataSource : TTListDataSource{
    QackNewsModel* _searchModel;
}

- (id)initWithSearchQuery:(NSString*)searchQuery;

@end
