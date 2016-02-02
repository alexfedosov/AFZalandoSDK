//
//  AFZApi.h
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import <Foundation/Foundation.h>
#import "AFZRequest.h"

@class AFZRequestScheduler;

@interface AFZApiClient : NSObject

@property (nonatomic, strong, readonly) AFZRequestScheduler * _Nonnull requestScheduler;
@property (nonatomic, strong, readonly) NSString * _Nullable clientName;

+ (AFZApiClient * _Nonnull)defaultApi;

@end
