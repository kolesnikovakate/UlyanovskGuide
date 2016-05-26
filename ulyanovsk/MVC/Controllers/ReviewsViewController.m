//
//  ReviewsViewController.m
//  ulyanovsk
//
//  Created by Ekaterina Kolesnikova on 14.02.16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//

#import "ReviewsViewController.h"
#import "ulyanovsk-Swift.h"

@interface ReviewsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *reviews;

@end

@implementation ReviewsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Отзывы";
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSSortDescriptor *sortDescriptorDate = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
    self.reviews = [[self.place.reviews allObjects] sortedArrayUsingDescriptors:@[sortDescriptorDate]];
    [self.tableView reloadData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.reviews.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"review_cell";
    return [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self configureCell:cell byIndexPath:indexPath];
}

- (void)configureCell:(UITableViewCell *)cell byIndexPath:(NSIndexPath *)indexPath
{
    Review *review = [self.reviews objectAtIndex:indexPath.row];
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:1];
    UILabel *textLabel = (UILabel *)[cell viewWithTag:2];
    UILabel *dateLabel = (UILabel *)[cell viewWithTag:3];
    nameLabel.text = review.name;
    textLabel.text = review.text;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setLocale:[NSLocale currentLocale]];
    [dateFormat setDateFormat:@"dd MMMM yyyy"];
    dateLabel.text = [dateFormat stringFromDate:review.date];
}

#pragma mark

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *vc = segue.destinationViewController;
    if ([vc respondsToSelector:@selector(setPlace:)]) {
        [vc performSelector:@selector(setPlace:) withObject:self.place];
    }
}

@end
