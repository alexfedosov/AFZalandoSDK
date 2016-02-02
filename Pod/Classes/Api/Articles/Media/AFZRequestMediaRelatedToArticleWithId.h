//
//  AFZRequestMediaRelatedToArticleById.h
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import <Foundation/Foundation.h>
#import "AFZRequest.h"

@interface AFZRequestMediaRelatedToArticleWithId : AFZRequest

@property (nonatomic, strong) NSString * _Nonnull articleIdentifier;

- (instancetype _Nonnull)initWithArticleId:(NSString * _Nonnull)articleIdentifier NS_DESIGNATED_INITIALIZER;

@end
