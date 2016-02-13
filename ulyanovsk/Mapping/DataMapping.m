//
//  DataMapping.m
//  ulyanovsk
//
//  Created by Kolesnikova Ekaterina on 28/01/16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//

#import "DataMapping.h"

@implementation DataMapping

+ (FEMManagedObjectMapping *)placeMappingForEntityName:(NSString *)entityName
{
    return [FEMManagedObjectMapping mappingForEntityName:entityName configuration:^(FEMManagedObjectMapping *sender) {
        [sender setPrimaryKey:@"title"];
        [sender addAttributesFromDictionary:@{@"lat" : @"lat",
                                              @"lon" : @"lon",
                                              @"title" : @"title",
                                              @"info" : @"description",
                                              @"rating": @"rating",
                                              @"image" : @"image"
                                              }];
        [sender addRelationshipMapping:[self reviewsMapping] forProperty:@"reviews" keyPath:@"reviews"];
    }];
}

+ (FEMManagedObjectMapping *)reviewsMapping
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    
    return [FEMManagedObjectMapping mappingForEntityName:@"Review" configuration:^(FEMManagedObjectMapping *sender) {
        [sender addAttributesFromDictionary:@{@"name" : @"name",
                                              @"text" : @"text"
                                              }];
        
        [sender addAttribute:[FEMAttribute mappingOfProperty:@"date"
                                                   toKeyPath:@"date"
                                                         map:^id(NSString *value) {
                                                             return [dateFormatter dateFromString:value];
                                                         }
                                                  reverseMap:^id(id value) {
                                                      return [dateFormatter stringFromDate:value];
                                                  }]];
    }];
}

@end
