//
//  ABStickyHeaderTableView.m
//  ChopChop
//
//  Created by Антон Буков on 26.05.15.
//  Copyright (c) 2015 Trinity Mobile. All rights reserved.
//

#import "ABStickyHeaderTableView.h"

@implementation ABStickyHeaderTableView

- (void)reloadData
{
    [super reloadData];
    [self letsLayout];
}

- (void)beginUpdates
{
    self.contentOffset = self.contentOffset;
    [self.layer removeAllAnimations];
    [super beginUpdates];
}

- (void)endUpdates
{
    [super endUpdates];
    [self letsLayout];
}

- (void)layoutIfNeeded
{
    [super layoutIfNeeded];
    [self letsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self letsLayout];
}

- (void)letsLayout
{
    [self bringSubviewToFront:self.tableHeaderView];
    [self bringSubviewToFront:self.tableFooterView];
    self.tableHeaderView.center = CGPointMake(self.contentOffset.x + self.bounds.size.width/2, self.contentOffset.y + self.tableHeaderView.bounds.size.height/2);
    self.tableFooterView.center = CGPointMake(self.contentOffset.x + self.bounds.size.width - self.bounds.size.width/2, self.contentOffset.y + self.bounds.size.height - self.tableFooterView.bounds.size.height/2);
}

@end
