//
//  AFZViewController.m
//  AFZalandoSDK
//
//  Created by Alexander Fedosov on 01/27/2016.
//  Copyright (c) 2016 Alexander Fedosov. All rights reserved.
//

#import "AFZViewController.h"
#import <AFZalandoSDK/AFZApi.h>

@interface AFZViewController ()

@end

@implementation AFZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AFZRequestArticlesList *articleListRequest = [AFZRequestArticlesList new];
    articleListRequest.filterByActivationDate = @[kAFZArticleActivationDateThisWeek, kAFZArticleActivationDateLastWeek];
    articleListRequest.queryFields = @[@"name"];
    [articleListRequest performRequestWithCompletion:^(id  _Nullable result, NSError * _Nullable error) {
        
    }];
    
    NSString *exampleArticleID = @"BE824G002-C11";
    AFZRequestArticleById *articleRequest = [[AFZRequestArticleById alloc] initWithArticleId:exampleArticleID];
    [articleRequest performRequestWithCompletion:^(id  _Nullable result, NSError * _Nullable error) {
        
    }];
    
    [[articleRequest requestRelatedReviews] performRequestWithCompletion:^(id  _Nullable result, NSError * _Nullable error) {
        
    }];
    
    [[articleRequest requestRelatedMedia] performRequestWithCompletion:^(id  _Nullable result, NSError * _Nullable error) {
        
    }];
    
    [[[AFZApiClient defaultApi] requestScheduler] cancelRequest:articleRequest];
    [[[AFZApiClient defaultApi] requestScheduler] cancelAllRequests];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
