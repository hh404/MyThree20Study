//
//  BlogListController.h
//  MobilBlogg
//
//  Created by Tobias Rundström on 2009-10-22.
//  Copyright 2009 Purple Scout. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Three20.h"
#import "BlogListModel.h"

@interface BlogListController : TTTableViewController {
}

-(id)initWithArguments:(NSDictionary *)arguments;
-(id)initWithBloggName:(NSString *)bloggName;
-(id)initWithFunction:(NSString *)functionName;

@end
