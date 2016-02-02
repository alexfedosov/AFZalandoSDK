//
//  AFZRequestPagination.h
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import <Foundation/Foundation.h>

@protocol AFZRequestPagination <NSObject>

#pragma mark - Request pagination

/*!
 Requests that return multiple items (except Filters and Facets) will be paginated to 20 items by default. You can specify further pages with the page parameter and set a custom page size with the pageSize parameter.
 @see <a href="https://github.com/zalando/shop-api-documentation/wiki/Api-introduction#pagination">External Api documentation</a>
 */
@property (nonatomic, assign) NSUInteger page;

/*!
 @see AFZRequest#page
 */
@property (nonatomic, assign) NSUInteger pageSize;

@end
