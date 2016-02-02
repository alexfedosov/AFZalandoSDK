//
//  AFZRequestScheduler.h
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import <Foundation/Foundation.h>

@class AFZRequest;

@interface AFZRequestScheduler : NSObject

- (void)scheduleRequest:(AFZRequest * _Nonnull)request;
- (void)cancelRequest:(AFZRequest * _Nonnull)request;
- (void)cancelAllRequests;

@end
