//
//  AFZRequestSerializer.m
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import "AFZRequestSerializer.h"
#import "AFZConstants.h"
#import "AFZRequest.h"
#import "AFZRequestPagination.h"

NSString *const AFZ_REQUEST_HEADER_ACCEPT_LANGUAGE = @"Accept-Language";
NSString *const AFZ_REQUEST_HEADER_CLIENT_NAME = @"x-client-name";
NSString *const AFZ_REQUEST_HEADER_ENTITY_TAG = @"If-None-Match";
NSString *const AFZ_REQUEST_PAGE_NUMBER_KEY = @"page";
NSString *const AFZ_REQUEST_PAGE_SIZE_KEY = @"size";

@implementation AFZRequestSerializer

- (AFHTTPRequestOperation * _Nonnull)networkOperationWithRequest:(AFZRequest * _Nonnull)request{

    NSString *method = [request httpMethod];
    NSString *urlString = [NSString stringWithFormat:@"%@%@", AFZ_API_BASE_URL,[request urlString]];
    NSInteger timeout = [request timeout];
    NSDictionary *parameters = [request parameters].mutableCopy;
    
    if ([request conformsToProtocol:@protocol(AFZRequestPagination)]) {
        id<AFZRequestPagination> requestPaginationPart = (id<AFZRequestPagination>)request;
        NSUInteger page = [requestPaginationPart page];
        NSUInteger pageSize = [requestPaginationPart pageSize];
        if (page > 0) [parameters setValue:@(page)  forKey:AFZ_REQUEST_PAGE_NUMBER_KEY];
        if (pageSize > 0) [parameters setValue:@(pageSize)  forKey:AFZ_REQUEST_PAGE_SIZE_KEY];
    }

    AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
    NSMutableURLRequest *urlRequest = [serializer requestWithMethod:method URLString:urlString parameters:parameters error:NULL];
    // Fixing issue with AFNetworking request serialization
    // See discussion about it https://github.com/AFNetworking/AFNetworking/issues/437
    urlRequest.URL = [NSURL URLWithString:[urlRequest.URL.absoluteString stringByReplacingOccurrencesOfString:@"%5B%5D=" withString:@"="]];
    
    urlRequest.timeoutInterval = timeout > 0? timeout : 30.0f;
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [urlRequest setValue:@"UTF-8" forHTTPHeaderField:@"Accept-Charset"];
    
    if (request.entityTag) {
        [urlRequest setValue:request.entityTag forHTTPHeaderField:AFZ_REQUEST_HEADER_ENTITY_TAG];
    }
    
    if (!request.acceptLanguage) {
        request.acceptLanguage = [NSLocale currentLocale].localeIdentifier;
    }
    [urlRequest setValue:request.acceptLanguage forHTTPHeaderField:AFZ_REQUEST_HEADER_ACCEPT_LANGUAGE];
    [urlRequest setValue:request.clientName forHTTPHeaderField:AFZ_REQUEST_HEADER_CLIENT_NAME];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperationManager manager] HTTPRequestOperationWithRequest:urlRequest success:nil failure:nil];
    
    AFJSONResponseSerializer *responceRerializer = [AFJSONResponseSerializer serializer];
    [responceRerializer setRemovesKeysWithNullValues:YES];
    [operation setResponseSerializer:responceRerializer];
    
    return operation;
}

@end
