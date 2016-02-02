//
//  AFZRequestReviewsRelatedToArticleWithId.m
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import "AFZRequestReviewsRelatedToArticleWithId.h"

@implementation AFZRequestReviewsRelatedToArticleWithId

@synthesize page, pageSize;

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
    return [NSString stringWithFormat:@"/articles/%@/reviews/", self.articleIdentifier];
}

@end
