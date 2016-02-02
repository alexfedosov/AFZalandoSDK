# AFZalandoSDK

## IMPORTANT

Work in progress. If you want, please use it just for fun

[![CI Status](http://img.shields.io/travis/Alexander Fedosov/AFZalandoSDK.svg?style=flat)](https://travis-ci.org/Alexander Fedosov/AFZalandoSDK)
[![Version](https://img.shields.io/cocoapods/v/AFZalandoSDK.svg?style=flat)](http://cocoapods.org/pods/AFZalandoSDK)
[![License](https://img.shields.io/cocoapods/l/AFZalandoSDK.svg?style=flat)](http://cocoapods.org/pods/AFZalandoSDK)
[![Platform](https://img.shields.io/cocoapods/p/AFZalandoSDK.svg?style=flat)](http://cocoapods.org/pods/AFZalandoSDK)

## Usage 

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Request list of articles. You can specify query fields and filters:
``` objective-c
AFZRequestArticlesList *articleListRequest = [AFZRequestArticlesList new];
articleListRequest.filterByActivationDate = @[kAFZArticleActivationDateThisWeek, kAFZArticleActivationDateLastWeek];
articleListRequest.queryFields = @[@"name"];

[articleListRequest performRequestWithCompletion:^(id  _Nullable result, NSError * _Nullable error) {

}];
```

Request article by ID
``` objective-c
NSString *exampleArticleID = @"BE824G002-C11";
AFZRequestArticleById *articleRequest = [[AFZRequestArticleById alloc] initWithArticleId:exampleArticleID];

[articleRequest performRequestWithCompletion:^(id  _Nullable result, NSError * _Nullable error) {

}];
```

Request related information such as reviews and media
``` objective-c
NSString *exampleArticleID = @"BE824G002-C11";
AFZRequestArticleById *articleRequest = [[AFZRequestArticleById alloc] initWithArticleId:exampleArticleID];

[[articleRequest requestRelatedReviews] performRequestWithCompletion:^(id  _Nullable result, NSError * _Nullable error) {

}];

[[articleRequest requestRelatedMedia] performRequestWithCompletion:^(id  _Nullable result, NSError * _Nullable error) {

}];
```

Cancel requests when needed

``` objective-c
[[[AFZApiClient defaultApi] requestScheduler] cancelRequest:articleRequest];
// or
[[[AFZApiClient defaultApi] requestScheduler] cancelAllRequests];
```

## Requirements

## Installation

AFZalandoSDK is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "AFZalandoSDK"
```

## Author

Alexander Fedosov, alexander.a.fedosov@gmail.com

## License

AFZalandoSDK is available under the MIT license. See the LICENSE file for more info.
