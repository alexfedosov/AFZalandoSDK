//
//  AFZRequestArticlesList.h
//  Pods
//
//  Created by Alexander Fedosov on 27.01.16.
//
//

#import <Foundation/Foundation.h>
#import "AFZRequest.h"
#import "AFZRequestPagination.h"

@interface AFZRequestArticlesList : AFZRequest<AFZRequestPagination>

// filters by articleId
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterByArticleId;

// filters by articleModelId
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterByArticleModelId;

// filters by articleUnitId
@property (nonatomic, strong) NSArray<NSString *> * _Nullable filterByArticleUnitId;

// period or time the articles are activated for selling in the shop
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByActivationDate;

// filters by age group (eg: kids)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByAgeGroup;

// filters by classification of articles (eg: maternity)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByAssortmentArea;

// filters by brand key given by user (eg: SA5)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByBrand;

// filters by brand family key (eg: nike)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByBrandfamily;

// filters by category (eg: Socks, Rain Coats)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByCategory;

// filters by color (eg: red, blue)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByColor;

// filters by den
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByDen;

// filters by different kinds of garment filling materials (eg: satin, wolle)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByFilling;

// filters by gender
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByGender;

// filters by heel form (eg: flat)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByHeelForm;

// filters by height of the heel size or length (eg: xs)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByHeelHeight;

// filters by type of occasion (eg: party, business)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByOccasion;

// filters by pattern on the garments (eg: animal print, plain)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByPattern;

// filters discounted articles marked as sale
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterBySale;

// filters by season (Autumn/Winter or Spring/Summer)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterBySeason;

// filters by shaft height (eg: s, xs)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByShaftHeight;

// filters by shaft width (eg: s, l)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByShaftWidth;

// filters by shirt collar styles (eg: low V neck, lined collar)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByShirtCollar;

// filters by shoe fastener types (eg: buckle, lacing)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByShoeFastener;

// filters by shoe toe cap variants (eg: pointed, square)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByShoeToecap;

// filters by classification of articles
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByShopArea;

// filters by different sport activities (eg: football)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterBySports;

// filters by technology used to produce the articles
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByTechnology;

// filters by trouser rise
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByTrouserRise;

// filters by different type of upper material used on garments (eg: lace)
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByUpperMaterial;

// filters by volume
@property (nonatomic, strong)  NSArray<NSString *> * _Nullable  filterByVolume;

// sorting order (eg: popularity)
@property (nonatomic, strong)  NSString * _Nullable  querySort;

// filters by text (eg: search by 'as' gives result with articles of brand Sass)
@property (nonatomic, strong)  NSString * _Nullable  filterByFullText;

// filters by garments length (eg: 3/4 length, knee-length)
@property (nonatomic, strong)  NSString * _Nullable  filterByLength;

// filters all articles in price range (eg: 9-90)
@property (nonatomic, strong)  NSString * _Nullable  filterByPrice;

// filters by size
@property (nonatomic, strong)  NSString * _Nullable  filterBySize;

@end
