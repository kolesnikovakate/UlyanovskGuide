//
//  DataMapping.h
//  ulyanovsk
//
//  Created by Kolesnikova Ekaterina on 28/01/16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FastEasyMapping/FastEasyMapping.h>

@interface DataMapping : NSObject

+ (FEMManagedObjectMapping *)placeMappingForEntityName:(NSString *)entityName;
+ (FEMManagedObjectMapping *)reviewsMapping;

@end
