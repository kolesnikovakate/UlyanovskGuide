//
//  Showplace+CoreDataProperties.h
//  
//
//  Created by Ekaterina Kolesnikova on 25.01.16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Showplace.h"

NS_ASSUME_NONNULL_BEGIN

@interface Showplace (CoreDataProperties)

@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *reviews;

@end

@interface Showplace (CoreDataGeneratedAccessors)

- (void)addReviewsObject:(NSManagedObject *)value;
- (void)removeReviewsObject:(NSManagedObject *)value;
- (void)addReviews:(NSSet<NSManagedObject *> *)values;
- (void)removeReviews:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
