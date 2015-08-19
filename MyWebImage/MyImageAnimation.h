//
//  MyImageAnimation.h
//  MyImageView
//
//  Created by liqunfei on 15/8/18.
//  Copyright (c) 2015年 chuchengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyImageAnimationDelegate <NSObject>

@required
- (void)willFinishedAnimation;

@end

@interface MyImageAnimation : UIView
{
    IBOutlet UIScrollView *backScoll;
}

@property (assign,nonatomic) id<MyImageAnimationDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *orginalImageView;
@property (assign,nonatomic) CGRect originFrame;
@property (strong,nonatomic) UIImage *frontImage;
@property (weak, nonatomic) IBOutlet UIStepper *changeScale;
@property (weak, nonatomic) IBOutlet UIButton *closeView;

@end
