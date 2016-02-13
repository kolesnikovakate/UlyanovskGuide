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

NSString * const kBackendBaseUrl = @"https://arcane-brook-20885.herokuapp.com";

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
    
    NSString *endpoint = [NSString stringWithFormat:@"%@/plases", kBackendBaseUrl];
    
    [manager GET:endpoint parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *_places) {
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
            [FEMManagedObjectDeserializer deserializeCollectionExternalRepresentation:_places usingMapping:[DataMapping placeMappingForEntityName:@"Showplace"] context:localContext];
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
            [FEMManagedObjectDeserializer deserializeCollectionExternalRepresentation:_places usingMapping:[DataMapping placeMappingForEntityName:@"Hotel"] context:localContext];
        } completion:^(BOOL success, NSError *error) {
            if (callback)
                callback(error);
        }];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (callback)
            callback(error);
    }];
}

@end
