//
//  UIImageView+MyImageView.h
//  MyImageView
//
//  Created by liqunfei on 15/8/18.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MyImageAnimation.h"

@protocol MyImageViewDelegate <NSObject>

@required
- (void) createBigView;

@end

@interface UIImageView (MyImageView) <MyImageAnimationDelegate>

- (void) webImageWithURL:(NSURL *)url placeHolderImage:(UIImage *)placeHolderImage downloadFlag:(NSUInteger)flag;
@end
