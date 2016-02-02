//
//  AFZRequestArticlesList.m
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import "AFZRequestArticlesList.h"

@implementation AFZRequestArticlesList

@synthesize page, pageSize;

- (NSString * _Nonnull)urlString{
    return @"/articles";
}

@end
