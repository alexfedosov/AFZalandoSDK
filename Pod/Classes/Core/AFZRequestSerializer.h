//
//  AFZRequestSerializer.h
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@class AFZRequest;

@interface AFZRequestSerializer : NSObject

- (AFHTTPRequestOperation * _Nonnull)networkOperationWithRequest:(AFZRequest * _Nonnull)request;

@end
