//
//  DetailsViewController.m
//  ulyanovsk
//
//  Created by Ekaterina Kolesnikova on 13.02.16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//

#import "DetailsViewController.h"
#import "ulyanovsk-Swift.h"
#import "UIImageView+WebCache.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewWidth;

@end
@implementation DetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.place.title;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://arcane-brook-20885.herokuapp.com/%@", self.place.image]]
                      placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    self.titleLabel.text = self.place.title;
    self.infoLabel.text = self.place.info;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.contentViewWidth.constant = self.view.frame.size.width;
    [self.view layoutIfNeeded];
}

- (IBAction)showMap:(id)sender
{
}

- (IBAction)showReviews:(id)sender
{
}

@end
