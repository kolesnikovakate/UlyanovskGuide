//
//  ReviewsViewController.h
//  ulyanovsk
//
//  Created by Ekaterina Kolesnikova on 14.02.16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Place;

@interface ReviewsViewController : UITableViewController

@property (strong, nonatomic) Place *place;

@end
