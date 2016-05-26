//
//  UIPlaceHolderTextView.h
//  Poison
//
//  Created by Ekaterina Kolesnikova on 29.03.16.
//  Copyright © 2016 TRINITY DIGITAL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface UIPlaceHolderTextView : UITextView

@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

- (void)textChanged:(NSNotification *)notification;

@end