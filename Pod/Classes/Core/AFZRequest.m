//
//  AFZRequest.m
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//
#import <objc/runtime.h>
#import "AFZRequest.h"
#import "AFZApiClient.h"
#import "AFZRequestScheduler.h"

NSString *const AFZ_REQUEST_HTTP_METHOD_GET = @"GET";

@implementation AFZRequest

- (instancetype)init{
    self = [super init];
    
    if (self) {
        _clientName = [AFZApiClient defaultApi].clientName;
    }
    
    return self;
}

- (NSString * _Nonnull)httpMethod{
    return AFZ_REQUEST_HTTP_METHOD_GET;
}

- (NSString * _Nonnull)urlString{
    return @"";
}

- (NSDictionary *)parameters{
    
    NSArray *autoFetchablePropertiesPrefixes = @[@"filterBy", @"query"];
    
    NSMutableDictionary *parameters = @{}.mutableCopy;
    
    unsigned int count=0;
    objc_property_t *props = class_copyPropertyList([self class],&count);
    for ( int i=0;i<count;i++ )
    {
        NSString* propertyName = [NSString stringWithUTF8String:property_getName(props[i])];
        id value = [self valueForKey:propertyName];
        
        if (!value) {
            continue;
        }
        
        for (NSString *autoFetchablePropertyPrefix in autoFetchablePropertiesPrefixes) {
            if ([propertyName hasPrefix:autoFetchablePropertyPrefix]) {
                NSString *paramName = [propertyName substringFromIndex:[autoFetchablePropertyPrefix length]];
                NSString *firstChar = [paramName substringToIndex:1];
                paramName = [[firstChar lowercaseString] stringByAppendingString:[paramName substringFromIndex:1]];
                [parameters setValue:value forKey:paramName];
            }
        }
    }
    
    return parameters;
}

- (void)performRequestWithCompletion:(void (^)(id _Nullable, NSError * _Nullable))completion{
    self.completionBlock = completion;
    [[AFZApiClient defaultApi].requestScheduler scheduleRequest:self];
}

@end
