//
//  TSTestController.m
//  MyThree20Study
//
//  Created by huangjianwu on 16/8/25.
//  Copyright © 2016年 huangjianwu. All rights reserved.
//

#import "TSTestController.h"
#import "TSTestDataSource.h"

@interface TSTestController ()

@end

@implementation TSTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createModel
{
    TSTestDataSource *ts= [[TSTestDataSource alloc] init];
    self.dataSource = ts;
}

- (id<UITableViewDelegate>)createDelegate
{
    return [[[TTTableViewDragRefreshDelegate alloc] initWithController:self] autorelease];
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
