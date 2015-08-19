//
//  MyImageAnimation.m
//  MyImageView
//
//  Created by liqunfei on 15/8/18.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import "MyImageAnimation.h"

@implementation MyImageAnimation

- (void)drawRect:(CGRect)rect {
 
}

- (void) didMoveToSuperview {
    [super didMoveToSuperview];
    CGRect currentFrame = self.orginalImageView.frame;
    [self.orginalImageView setFrame:self.originFrame];
    [self.orginalImageView setImage:self.frontImage];
    [UIView animateWithDuration:0.5 animations:^{
        [self.orginalImageView setFrame:currentFrame];
    }];
}

- (IBAction)changeScale:(UIStepper *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.orginalImageView.transform = CGAffineTransformMakeScale(sender.value,sender.value);
    }];
}

- (IBAction)closeView:(UIButton *)sender {
    self.orginalImageView.transform = CGAffineTransformIdentity;
    double delayInSeconds = 0.2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_MSEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5 animations:^{
            [self.orginalImageView setFrame:self.originFrame];
        } completion:^(BOOL finished) {
            [self.delegate willFinishedAnimation];
            [self removeFromSuperview];
        }];
    });
}

@end
