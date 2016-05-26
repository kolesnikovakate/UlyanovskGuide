//
//  AddReviewViewController.m
//  ulyanovsk
//
//  Created by Ekaterina Kolesnikova on 26.05.16.
//  Copyright © 2016 Ekaterina Kolesnikova. All rights reserved.
//

#import <MagicalRecord/MagicalRecord.h>
#import "ulyanovsk-Swift.h"
#import "AddReviewViewController.h"

@interface AddReviewViewController ()
@property (weak, nonatomic) IBOutlet UITextView *nameTextView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *buttonBottomSpace;

@end

@implementation AddReviewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addKeyboardNotificationSubscription];
}

- (IBAction)addReviewAction:(id)sender
{
    [self.view endEditing:YES];
    
    if (![self validation]) {
        return;
    }
    
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext *localContext) {
        Review *review = [Review MR_createEntityInContext:localContext];
        review.text = self.textView.text;
        review.name = self.nameTextView.text;
        review.date =[NSDate date];
        
        NSManagedObjectID *objectID = [self.place objectID];
        Place *place = (Place *)[localContext objectWithID:objectID];
        review.place = place;
        
    } completion:^(BOOL success, NSError *error) {
        UIAlertController *alert = [UIAlertController
                                    alertControllerWithTitle:nil
                                    message:@"Ваш отзыв добавлен!"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *buttonCancel = [UIAlertAction
                                       actionWithTitle:@"Ок"
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction * _Nonnull action) {
                                           [self.navigationController popViewControllerAnimated:YES];
                                       }];
        [alert addAction:buttonCancel];
        [self presentViewController:alert animated:YES completion:nil];
    }];
}

- (BOOL)validation
{
    if ([self isEmpty:self.textView.text] || [self isEmpty:self.nameTextView.text]) {
        UIAlertController *alert = [UIAlertController
                                    alertControllerWithTitle:nil
                                    message:@"Заполните поля"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *buttonCancel = [UIAlertAction
                                       actionWithTitle:@"Ок"
                                       style:UIAlertActionStyleCancel
                                       handler:nil];
        [alert addAction:buttonCancel];
        [self presentViewController:alert animated:YES completion:nil];
        return NO;
    }
    return YES;
}

- (BOOL)isEmpty:(NSString *)string
{
    return ![string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length;
}
#pragma mark - keyboard

- (void)setKeyboardheight:(NSInteger)height animationTime:(NSTimeInterval)time {
    self.buttonBottomSpace.constant = height + 16;
    [UIView animateWithDuration:time animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}

- (void)addKeyboardNotificationSubscription {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillChangeFrame:)
                                                 name:UIKeyboardWillChangeFrameNotification
                                               object:nil];
}

- (void)keyboardWillHide:(NSNotification*)notification {
    NSDictionary *info = [notification userInfo];
    NSTimeInterval time = [info[UIKeyboardAnimationDurationUserInfoKey] integerValue];
    [self setKeyboardheight:0 animationTime:time];
}

- (void)keyboardWillChangeFrame:(NSNotification*)notification {
    NSDictionary *info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    NSTimeInterval time = [info[UIKeyboardAnimationDurationUserInfoKey] integerValue];
    [self setKeyboardheight:kbSize.height animationTime:time];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillChangeFrameNotification
                                                  object:nil];
}

@end
