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
    
    AFZRequestArticlesList *request2 = [AFZRequestArticlesList new];
    request2.filterByActivationDate = @[kAFZArticleActivationDateThisWeek, kAFZArticleActivationDateLastWeek];
    request2.queryFields = @[@"name"];
    [request2 performRequestWithCompletion:[self mediator:^(id  _Nullable result) {
        
    }]];
    
    AFZRequest *request = [[AFZRequestArticleById alloc] initWithArticleId:@"BE824G002-C11"];
    
    [request performRequestWithCompletion:[self mediator:^(id  _Nullable result) {
        
    }]];
}

- (void(^)(id  _Nullable result, NSError * _Nullable error))mediator:(void(^)(id  _Nullable result))completion{
    return ^(id  _Nullable result, NSError * _Nullable error){
        completion(result);
    };
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
