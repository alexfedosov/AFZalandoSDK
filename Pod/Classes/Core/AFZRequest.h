//
//  AFZRequest.h
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperation;

extern NSString * _Nonnull const AFZ_REQUEST_HTTP_METHOD_GET;

typedef void (^ _Nullable RequestCompletionBlock)(id _Nullable result, NSError * _Nullable error);

@interface AFZRequest : NSObject

#pragma mark - Request headers
/*!
 The API uses the Accept-Language header to decide which shop data are requested.
 <b>By default will be used system language</b>
 @see <a href="https://github.com/zalando/shop-api-documentation/wiki/Api-introduction#choosing-the-right-shop">External Api documentation</a>
 */
@property (nonatomic, strong) NSString * _Nullable acceptLanguage;

/*!
 The current API only offers read-only data without any customer relation and therefore does not have any authentication. Nevertheless clients are requested to specify a x-client-name header to facilitate tracking and debugging.
 @see <a href="https://github.com/zalando/shop-api-documentation/wiki/Api-introduction#authentication">External Api documentation</a>
 */
@property (nonatomic, strong, readonly) NSString * _Nullable clientName;

/*!
 All responses include an ETag (or Entity Tag) header, identifying the specific version of a returned resource. You may use this value to check for changes to a resource by repeating the request and passing the ETag value in the If-None-Match header. If the resource has not changed, a 304 Not Modified status will be returned with an empty body. If the resource has changed, the request will proceed normally.
 
 @see <a href="https://github.com/zalando/shop-api-documentation/wiki/Api-introduction#caching">External Api documentation</a>
 */
@property (nonatomic, strong) NSString * _Nullable entityTag;

/*!
 Request operation timeout. If 0 - default timeout is 30 seconds
 */
@property (nonatomic, assign) NSUInteger timeout;

/*!
 Use to get URL for request, example /articles/
 */
@property (nonatomic, strong) NSString * _Nullable resourcePath;

/*! Comma separated list of fields that should be returned.
 Fields of subobjects are specified with dots as separator.
 Fields of objects within lists are specified in the same way.
 Example: id,name,brand.key,brand.name, units.id,units.size,units.price.formatted
 */
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  queryFields;

@property (nonatomic, copy) RequestCompletionBlock completionBlock;

/*!
 Request operation is nil while request until it is scheduled with AFZRequestScheduler. Generally, it will nill until call performRequestWithCompletion:(RequestCompletionBlock)completion
 */
@property (nonatomic, weak) AFHTTPRequestOperation * _Nullable requestOperation;

- (NSString * _Nonnull)httpMethod;
- (NSString * _Nonnull)urlString;
- (NSDictionary * _Nonnull)parameters;

- (void)performRequestWithCompletion:(RequestCompletionBlock)completion;

@end
