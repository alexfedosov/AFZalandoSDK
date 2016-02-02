//
//  AFZRequestScheduler.m
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import "AFZRequestScheduler.h"
#import <AFNetworking.h>
#import "AFZRequest.h"
#import "AFZRequestSerializer.h"

@interface AFZRequestScheduler()

@property(nonatomic, strong) AFHTTPRequestOperationManager *manager;
@property(nonatomic, strong) NSMutableArray<AFZRequest *> *requests;

@end

@implementation AFZRequestScheduler

- (instancetype)init{
    self = [super init];
    
    if (self) {
        _manager = [AFHTTPRequestOperationManager manager];
        _requests = @[].mutableCopy;
    }
    
    return self;
}

- (void)dealloc{
    [self cancelAllRequests];
}

- (void)scheduleRequest:(AFZRequest *)request{
    
    @synchronized(self.requests) {
        [self.requests addObject:request];
    }
    
    __weak typeof(self) welf = self;
    __weak typeof(request) weakRequest = request;
    AFHTTPRequestOperation * operation= [[AFZRequestSerializer new] networkOperationWithRequest:request];
    
    RequestCompletionBlock completionBlock = ^(id _Nullable result, NSError * _Nullable error){
        typeof(weakRequest) strongRequest = weakRequest;
        if (strongRequest.completionBlock) {
            strongRequest.completionBlock(result, error);
        }
        
        typeof(welf) strongSelf = welf;
        @synchronized(strongSelf.requests) {
            if (strongRequest && [strongSelf.requests containsObject:strongRequest]) {
                [strongSelf.requests removeObject:strongRequest];
            }
        }
    };
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (completionBlock){ completionBlock(responseObject, nil); }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        if (completionBlock){ completionBlock(operation.responseObject, error); }
    }];
    
    request.requestOperation = operation;
    [self.manager.operationQueue addOperation:operation];
}

- (void)cancelRequest:(AFZRequest * _Nonnull)request{
    if (request.requestOperation) {
        [request.requestOperation cancel];
    }
}

- (void)cancelAllRequests{
    [self.manager.operationQueue cancelAllOperations];
}

@end
