//
//  BackendService.h
//  ulyanovsk
//
//  Created by Ekaterina Kolesnikova on 13.02.16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^BackendCallback)(NSError *error);

@interface BackendService : NSObject

+ (instancetype)sharedService;

/**
 @brief Получение достопримечательностей
 */
- (void)getShowplacesWithCallback:(BackendCallback)callback;

/**
 @brief Получение отелей
 */
- (void)getHotelsWithCallback:(BackendCallback)callback;

@end
