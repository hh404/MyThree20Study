//
//  ViewController.m
//  MyThree20Study
//
//  Created by huangjianwu on 16/8/22.
//  Copyright © 2016年 huangjianwu. All rights reserved.
//

#import "ViewController.h"
#import "TargetsController.h"
#import "Friends/FriendsViewController.h"
#import "BlogListController.h"
#import "FeedListingController.h"
#import "QackTabNewsViewController.h"
#import "TSTestController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btTarget= [[UIButton alloc] initWithFrame:CGRectMake(10, 120, 80, 35)];
    btTarget.backgroundColor = [UIColor colorWithRed:0.308 green:0.815 blue:0.910 alpha:1.000];
    [btTarget addTarget:self action:@selector(_switchToTarget) forControlEvents:UIControlEventTouchUpInside];
    [btTarget setTitle:@"Target" forState:UIControlStateNormal];
    [self.view addSubview:btTarget];
    
    UIButton *btFriend = [[UIButton alloc] initWithFrame:CGRectMake(100, 120, 80, 35)];
    btFriend.backgroundColor = [UIColor colorWithRed:0.308 green:0.815 blue:0.910 alpha:1.000];
    [btFriend addTarget:self action:@selector(_switchToFriend) forControlEvents:UIControlEventTouchUpInside];
    [btFriend setTitle:@"Friend" forState:UIControlStateNormal];
    [self.view addSubview:btFriend];
    
    UIButton *btBlog = [[UIButton alloc] initWithFrame:CGRectMake(10, 160, 80, 35)];
    btBlog.backgroundColor = [UIColor colorWithRed:0.308 green:0.815 blue:0.910 alpha:1.000];
    [btBlog addTarget:self action:@selector(_switchToBlogList) forControlEvents:UIControlEventTouchUpInside];
    [btBlog setTitle:@"Blog" forState:UIControlStateNormal];
    [self.view addSubview:btBlog];
    
    UIButton *btFeed = [[UIButton alloc] initWithFrame:CGRectMake(100, 160, 80, 35)];
    btFeed.backgroundColor = [UIColor colorWithRed:0.308 green:0.815 blue:0.910 alpha:1.000];
    [btFeed addTarget:self action:@selector(_switchToFeed) forControlEvents:UIControlEventTouchUpInside];
    [btFeed setTitle:@"Feed" forState:UIControlStateNormal];
    [self.view addSubview:btFeed];
    
    UIButton *btNews = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 80, 35)];
    btNews.backgroundColor = [UIColor colorWithRed:0.308 green:0.815 blue:0.910 alpha:1.000];
    [btNews addTarget:self action:@selector(_switchToNews) forControlEvents:UIControlEventTouchUpInside];
    [btNews setTitle:@"News" forState:UIControlStateNormal];
    [self.view addSubview:btNews];
    
    UIButton *btTest = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 80, 35)];
    btTest.backgroundColor = [UIColor colorWithRed:0.308 green:0.815 blue:0.910 alpha:1.000];
    [btTest addTarget:self action:@selector(_switchToTest) forControlEvents:UIControlEventTouchUpInside];
    [btTest setTitle:@"Test" forState:UIControlStateNormal];
    [self.view addSubview:btTest];
}

- (void)_switchToTarget
{
    TargetsController *ts = [[TargetsController alloc] init];
    [self presentViewController:ts animated:YES completion:^{
        
    }];
}

- (void)_switchToFriend
{
    FriendsViewController *fc = [[FriendsViewController alloc] init];
    [self presentViewController:fc animated:YES completion:^{
        
    }];
}

- (void)_switchToBlogList
{
    BlogListController *fc = [[BlogListController alloc] initWithBloggName:@"a"];
    [self presentViewController:fc animated:YES completion:^{
        
    }];
}

- (void)_switchToFeed
{
    FeedListingController *fc = [[FeedListingController alloc]init];
    [self presentViewController:fc animated:YES completion:^{
        
    }];
}

- (void)_switchToNews
{
    QackTabNewsViewController *fc = [[QackTabNewsViewController alloc]init];
    [self presentViewController:fc animated:YES completion:^{
        
    }];
}

- (void)_switchToTest
{
    TSTestController *fc = [[TSTestController alloc]init];
    [self presentViewController:fc animated:YES completion:^{
        
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       // [self _switchToTarget];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
