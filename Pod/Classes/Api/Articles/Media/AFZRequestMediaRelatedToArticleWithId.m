//
//  AFZRequestMediaRelatedToArticleWithId.m
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import "AFZRequestMediaRelatedToArticleWithId.h"

@implementation AFZRequestMediaRelatedToArticleWithId

- (instancetype)init{
    return [self initWithArticleId:@""];
}

- (instancetype)initWithArticleId:(NSString *)articleIdentifier{
    self = [super init];
    
    if (self) {
        _articleIdentifier = articleIdentifier;
    }
    
    return self;
}

- (NSString * _Nonnull)urlString{
    return [NSString stringWithFormat:@"/articles/%@/media/", self.articleIdentifier];
}

@end
