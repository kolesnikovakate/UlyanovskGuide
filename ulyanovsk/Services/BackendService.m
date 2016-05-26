//
//  BackendService.m
//  ulyanovsk
//
//  Created by Ekaterina Kolesnikova on 13.02.16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//

#import "BackendService.h"
#import <AFNetworking.h>
#import <MagicalRecord/MagicalRecord.h>
#import "DataMapping.h"
#import "ulyanovsk-Swift.h"

NSString * const kBackendBaseUrl = @"https://murmuring-sierra-38312.herokuapp.com";

@implementation BackendService

+ (instancetype)sharedService
{
    static BackendService *backendService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        backendService = [[BackendService alloc] init];
    });
    
    return backendService;
}

- (void)getShowplacesWithCallback:(BackendCallback)callback
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *endpoint = [NSString stringWithFormat:@"%@/places", kBackendBaseUrl];
    
    [manager GET:endpoint parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *_places) {
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
            NSArray *places = [FEMManagedObjectDeserializer deserializeCollectionExternalRepresentation:_places usingMapping:[DataMapping placeMappingForEntityName:@"Showplace"] context:localContext];
            [places enumerateObjectsUsingBlock:^(Place *place, NSUInteger idx, BOOL * _Nonnull stop) {
                int reviewsCount = arc4random() % [BackendService reviews].count + 1;
                NSMutableArray *reviews = [[NSMutableArray alloc] init];
                for (int i = 0; i < reviewsCount; i++) {
                    int random = arc4random() % [BackendService reviews].count;
                    [reviews addObject:[[BackendService reviews] objectAtIndex:random]];
                }
                NSArray *placeReviews = [FEMManagedObjectDeserializer deserializeCollectionExternalRepresentation:reviews usingMapping:[DataMapping reviewsMapping] context:localContext];
                [place setReviews:[NSSet setWithArray:placeReviews]];
            }];
        } completion:^(BOOL success, NSError *error) {
            if (callback)
                callback(error);
        }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (callback)
            callback(error);
    }];
}

- (void)getHotelsWithCallback:(BackendCallback)callback
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *endpoint = [NSString stringWithFormat:@"%@/hotels", kBackendBaseUrl];
    
    [manager GET:endpoint parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *_places) {
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
            NSArray *places = [FEMManagedObjectDeserializer deserializeCollectionExternalRepresentation:_places usingMapping:[DataMapping placeMappingForEntityName:@"Hotel"] context:localContext];
            [places enumerateObjectsUsingBlock:^(Place *place, NSUInteger idx, BOOL * _Nonnull stop) {
                int reviewsCount = arc4random() % [BackendService reviews].count + 1;
                NSMutableArray *reviews = [[NSMutableArray alloc] init];
                for (int i = 0; i < reviewsCount; i++) {
                    int random = arc4random() % [BackendService reviews].count;
                    [reviews addObject:[[BackendService reviews] objectAtIndex:random]];
                }
                NSArray *placeReviews = [FEMManagedObjectDeserializer deserializeCollectionExternalRepresentation:reviews usingMapping:[DataMapping reviewsMapping] context:localContext];
                [place setReviews:[NSSet setWithArray:placeReviews]];
            }];
        } completion:^(BOOL success, NSError *error) {
            if (callback)
                callback(error);
        }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (callback)
            callback(error);
    }];
}

+ (NSArray *)reviews
{
    
    return @[ @{ @"name" : @"Оля",
                 @"text" : @"Ездили с детьми, всем понравилось, и повеселились, и пообедали вкусно.",
                 @"date" : @"2015-03-26"} ,
              
              @{ @"name" : @"Катя",
                 @"text" : @"Были там в начале лета, очень понравилось!",
                 @"date" : @"2015-06-12"},
              
              @{ @"name" : @"Артем",
                 @"text" : @"Не впечатлило, только время зря потратили.",
                 @"date" : @"2015-07-13"},
              
              @{ @"name" : @"Денис",
                 @"text" : @"Не люблю писать отзывы, но это место реально понравилось, рекомендую!",
                 @"date" : @"2016-02-13"},
              
              @{ @"name" : @"Павел",
                 @"text" : @"+1",
                 @"date" : @"2015-12-03"},
              
              @{ @"name" : @"Маша",
                 @"text" : @"Не впечатлило.",
                 @"date" : @"2015-07-13"},
              
              @{ @"name" : @"Олег",
                 @"text" : @"Советую посетить!",
                 @"date" : @"2015-11-30"}];
}

@end
