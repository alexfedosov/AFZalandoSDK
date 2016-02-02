//
//  AFZConstants.m
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import <Foundation/Foundation.h>
#import "AFZConstants.h"

NSString *const AFZ_API_BASE_URL = @"https://api.zalando.com";
NSString *const AFZ_API_VERSION = @"1.0";

#pragma mark - Responce consts
NSString *const AFZ_RESPONSE_HEADER_ENTITY_TAG = @"ETag";
NSString *const AFZ_RESPONSE_CONTENT_KEY = @"content";
NSString *const AFZ_RESPONSE_TOTAL_ELEMENTS_KEY = @"totalElements";
NSString *const AFZ_RESPONSE_TOTAL_PAGES_KEY = @"totalPages";
NSString *const AFZ_RESPONSE_PAGE_NUMBER_KEY = @"page";
NSString *const AFZ_RESPONSE_PAGE_SIZE_KEY = @"size";

#pragma mark - Errors consts
NSString *const AFZ_ERROR_STATUS_KEY = @"status";
NSString *const AFZ_ERROR_MESSAGE_KEY = @"message";
NSString *const AFZ_ERRORS_ARRAY_KEY = @"errors";