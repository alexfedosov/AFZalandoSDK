//
//  AFZRequestArticleById.m
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import "AFZRequestArticleById.h"

@implementation AFZRequestArticleById

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
    return [NSString stringWithFormat:@"/articles/%@", self.articleIdentifier];
}

- (AFZRequestMediaRelatedToArticleWithId * _Nonnull)requestRelatedMedia{
    return [[AFZRequestMediaRelatedToArticleWithId alloc] initWithArticleId:self.articleIdentifier];
}

- (AFZRequestReviewsRelatedToArticleWithId *)requestRelatedReviews{
    return [[AFZRequestReviewsRelatedToArticleWithId alloc] initWithArticleId:self.articleIdentifier];
}

@end
