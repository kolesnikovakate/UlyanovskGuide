//
//  Place+CoreDataProperties.h
//  
//
//  Created by Ekaterina Kolesnikova on 25.01.16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Place.h"

NS_ASSUME_NONNULL_BEGIN

@interface Place (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *lat;
@property (nullable, nonatomic, retain) NSNumber *lon;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *info;
@property (nullable, nonatomic, retain) id photos;
@property (nullable, nonatomic, retain) NSNumber *rating;

@end

NS_ASSUME_NONNULL_END
