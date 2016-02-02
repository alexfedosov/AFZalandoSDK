//
//  AFZApi.m
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import "AFZApiClient.h"
#import "AFZRequestScheduler.h"

static AFZApi * _defaultApiClient = nil;

@implementation AFZApi

+ (AFZApi * _Nonnull)defaultApi{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultApiClient = [AFZApi new];
    });
    
    return _defaultApiClient;
}

- (instancetype)init{
    self = [super init];
    
    if (self) {
        _clientName = [NSBundle mainBundle].bundleIdentifier;
        _requestScheduler = [AFZRequestScheduler new];
    }
    
    return self;
}

@end
