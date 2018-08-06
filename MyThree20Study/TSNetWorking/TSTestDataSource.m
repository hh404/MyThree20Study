//
//  TSTestDataSource.m
//  MyThree20Study
//
//  Created by huangjianwu on 16/8/25.
//  Copyright © 2016年 huangjianwu. All rights reserved.
//

#import "TSTestDataSource.h"
#import "TSTestModel.h"

@interface TSTestDataSource ()
{
    TSTestModel *testModel;
}
@end

@implementation TSTestDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        testModel = [[TSTestModel alloc] init];
    }
    return self;
}

- (id<TTModel>)model
{
    return testModel;
}

- (void)tableViewDidLoadModel:(UITableView*)tableView {
    NSLog(@"did load");
}

@end
