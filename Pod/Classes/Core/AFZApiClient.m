//
//  AFZApiClient.m
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import "AFZApiClient.h"
#import "AFZRequestScheduler.h"

static AFZApiClient * _defaultApiClient = nil;

@implementation AFZApiClient

+ (AFZApiClient * _Nonnull)defaultApi{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultApiClient = [AFZApiClient new];
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
